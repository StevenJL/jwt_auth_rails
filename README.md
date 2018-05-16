# Rails App Example of Authentication with JWT

#### Create a user with password

```ruby
user = User.new
user.email = "teemo@shrooms.net"
user.password = "yordlepride"
user.save
```

### Create a token when user authenticates

```
curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{"email":"teemo@shrooms.net", "password":"yordlepride"}' \
  localhost:3000/api/v1/auth_tokens.json
```

### See what happens when user fails to authenticate

```
curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{"email":"teemo@shrooms.net", "password":"damacia"}' \
  localhost:3000/api/v1/auth_tokens.json
```

### Gain sensitive information with valid JWT

```
curl \
  -H "Content-Type: application/json " \
  -H "Auth-Token: eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1MjY0NDYwNDksInN1YiI6MX0.VJauNqapO6cE_sgjVz4WKXagk7xuaR3YVK_g0D3blnM" \
  localhost:3000/api/v1/sensitive_data.json
```


### Attempt to gain sensitive information with invalid JWT

```
curl \
  -H "Content-Type: application/json " \
  -H "Auth-Token: thisShitIsWrong.HackerIsTryingtoHack.AwwHellNah" \
  localhost:3000/api/v1/sensitive_data.json
```


