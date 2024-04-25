extends Control
var Username=""
var Password
#@export var next_scene_path: = "res://Screens/MainScreen.tscn" # (String,FILE)
var created = false

func _on_login_button_down():
	if !created:
		Username=$Username.text
		Password=$Password.text.sha256_text()
		created=true
		$Login.text="Login"
		$Username.text=""
		$Password.text=""
		print("Account Created")
	else:
		if $Username.text == Username:
			if $Password.text.sha256_text() == Password:
				print("Login Success")
				get_tree().change_scene_to_file("res://Screens/MainScreen.tscn")
			else:
				print("Login Fail")
		else:
			print("Login Failed!")
			
		
		
