package main

import (
  "fmt"
  "log"
  "net/http"
  "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
  var name, _ = os.Hostname()

  fmt.Fprintf(w, `<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>nikovirtala/whalesay</title>
</head>
<body>
<pre>
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""\___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
         \    \        __/
          \____\______/

          |          |
       __ |  __   __ | _  __   _
      /  \| /  \ /   |/  / _\ |
      \__/| \__/ \__ |\_ \__  |

This request was processed by: %s
</pre>
</body>
</html>
`, name)
log.Print("Served request ",r,"\n")
}

func main() {
  log.SetOutput(os.Stderr)
  log.Println("Starting server ...")
  http.HandleFunc("/", handler)
  err := http.ListenAndServe(":8081",nil)
  if err != nil {
    log.Fatal("ListenAndServer: ", err)
  }
}
