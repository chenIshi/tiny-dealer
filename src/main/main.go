package main

import (
    "fmt"

   _ "tiny.dealer/dealer"
   "tiny.dealer/guard"
   _ "tiny.dealer/keeper"
   _ "tiny.dealer/doorman"
)

func main() {
    // Get a greeting message and print it.
    message := guard.Hello("Gladys")
    fmt.Println(message)
}