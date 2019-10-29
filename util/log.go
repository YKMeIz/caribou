package util

import "log"

var (
	green = string([]byte{27, 91, 57, 55, 59, 51, 50, 109})
	red   = string([]byte{27, 91, 57, 55, 59, 51, 49, 109})
	reset = string([]byte{27, 91, 48, 109})
)

func LogDefault(s ...string) {
	log.Println(reset, s)
}

func LogSuccess(s ...string) {
	log.Println(green, s, reset)
}

func LogError(e error) {
	log.Println(red, e.Error(), reset)
}

func LogPanic(e error) {
	log.Panic(red, e.Error(), reset)
}
