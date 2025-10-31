# tempmail_cv
temp email web api tempmail.cv nim
# Example
```nim
import asyncdispatch, tempmail_cv, json
let data = waitFor create_email()
echo data["email"].getStr
echo data["id"].getStr
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
