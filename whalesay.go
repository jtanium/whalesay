package main

import (
  "fmt"
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
}

func main() {
  fmt.Fprintf(os.Stdout, "Server started. Listening on port tcp/80.\n")
  http.HandleFunc("/", handler)
  http.ListenAndServe(":80", nil)
}
