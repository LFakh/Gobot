extends Control

var webApiKey = "AIzaSyATReIsGLuPSTHx7zT3B0KihYLNtO8DlUg"
var loginUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="
var signupUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="

# Login and signup function
func _loginSignup(url: String, email: String, password: String):
	var http = $HTTPRequest
	var jsonObject = JSON.new()
	var body = jsonObject.stringify({'email': email, 'password': password})
	var headers = ['Content-Type: application/json']
	var error = await http.request(url, headers, HTTPClient.METHOD_POST, body)

func _on_http_request_request_completed(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	if response_code == 200:
		get_tree().change_scene_to_file("res://Screens/MainScreen.tscn")
	else:
		handleInvalidCredentials(response.error.message)

func _on_sign_up_button_down():
	var url = signupUrl+webApiKey
	var email = $Email.text
	var password = $Password.text
	_loginSignup(url, email, password)

func _on_login_button_down():
	var url = loginUrl+webApiKey
	var email = $Email.text
	var password = $Password.text
	if checkCredentials(email, password):
		_loginSignup(url, email, password)
	else:
		handleInvalidCredentials("Invalid credentials")

func checkCredentials(email: String, password: String) -> bool:
	return true

func handleInvalidCredentials(errorMessage: String):
	print(errorMessage)
	$Error.text = errorMessage

