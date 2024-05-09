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
	if error == OK:
		# User successfully logged in or signed up
		# Retrieve the user's score from the database or file
		var score = retrieveScore(email)
		# Update the score
		score += 100  # Example: Increase the score by 100
		# Save the updated score
		saveScore(email, score)

func _on_http_request_request_completed(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	if response_code == 200:
		get_tree().change_scene_to_file("res://Screens/MainScreen.tscn")
	else:
		handleInvalidCredentials(response.error.message)

func _on_sign_up_button_down():
	var url = signupUrl + webApiKey
	var email = $Email.text
	var password = $Password.text
	_loginSignup(url, email, password)

func _on_login_button_down():
	var url = loginUrl + webApiKey
	var email = $Email.text
	var password = $Password.text
	if checkCredentials(email, password):
		_loginSignup(url, email, password)
	else:
		handleInvalidCredentials("Invalid credentials")

func checkCredentials(email: String, password: String) -> bool:
	# Implement your custom logic here to check if the credentials are correct
	# You can perform any necessary validation or verification

	# Return true if the credentials are correct, false otherwise
	return true

func handleInvalidCredentials(errorMessage: String):
	# Implement your logic to handle the case of invalid credentials
	# You can display an error message or perform any other necessary actions
	print(errorMessage)
	$Error.text = errorMessage

func retrieveScore(email: String) -> int:
	# Implement the code to retrieve the user's score from the database or file
	# You can use Firebase Realtime Database, Firestore, or any other database of your choice
	# Return the retrieved score
	return 0  # Replace with the actual retrieved score

func saveScore(email: String, score: int):
	# Implement the code to save the user's score to the database or file
	# You can use Firebase Realtime Database, Firestore, or any other database of your choice
	# Save the score associated with the user's email
	print("Score saved:", score)  # Replace with the actual save logic
