import asyncdispatch, httpclient, json, strutils

const api = "https://tempmail.cv/api"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "Host": "tempmail.cv",
    "Content-Type": "application/json",
    "accept": "application/json, text/plain, */*"
  })

proc create_email*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/temp-email")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_messages*(id:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/temp-email?id=" & id)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
