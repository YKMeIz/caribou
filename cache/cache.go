package cache

import (
	"errors"
	"github.com/YKMeIz/caribou/util"
	"github.com/go-redis/redis"
	"os"
)

var client *redis.Client

func init() {
	if os.Getenv("REDIS_ADDRESS") == "" {
		util.LogPanic(errors.New("environment variable REDIS_ADDRESS is not defined"))
	}
	client = redis.NewClient(&redis.Options{
		Addr:     os.Getenv("REDIS_ADDRESS"),
		Password: "", // no password set
		DB:       0,  // use default DB
	})

	if _, err := client.Ping().Result(); err != nil {
		util.LogPanic(err)
	}

	client.ConfigSet("maxmemory", "500mb")
	client.ConfigSet("maxmemory-policy", "volatile-lru")

	util.LogSuccess("redis", client.ConfigGet("maxmemory-policy").String())
	util.LogSuccess("redis", client.ConfigGet("maxmemory").String())
}
