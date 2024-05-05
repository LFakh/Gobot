extends Control

@onready var label: Label = get_node("Title")

func _ready():
	label.text = label.text % [PlayerData.score]
	updateScoreInFirebase()

func _on_request_completed():
	emit_signal("request_completed")

func updateScoreInFirebase():
	#var url = "https://your-firebase-database-url.com/users/" + PlayerData.user_id + "/score.json"
	var body = {'score': PlayerData.score}
	var headers = {'Content-Type': 'application/json'}
	var request = HTTPRequest.new()
#	request.connect("request_completed", self, "_on_http_request_completed")
#	await request.request(url, [], HTTPClient.METHOD_PUT, headers)

func _on_http_request_request_completed(result, response_code, headers, body):
	if response_code == 200:
		print("Score updated in Firebase")
	else:
		print("Failed to update score in Firebase")


