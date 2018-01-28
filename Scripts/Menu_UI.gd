extends Control

var mainMenu;
var optionsMenu;
var pauseMenu;
var credits;

func _ready():
	mainMenu = self.get_node("Main Menu");
	mainMenu.show();
	optionsMenu = self.get_node("Options_UI");
	optionsMenu.hide();
	credits = self.get_node("CreditsUI");
	credits.hide();
	pauseMenu = self.get_node("Pause_UI");
	pauseMenu.hide();
	
	get_node("SamplePlayer").play("BridgeAyahuasca", false)
	
	
	set_process_input(true);
	pass

# Main Menu UI
func _on_Bt_newGame_pressed():
	print ("Starting game!");
	get_tree().change_scene("Scenes/Game.tscn");

func _on_Bt_options_pressed():
	print ("Moving to the options menu!");
	mainMenu.hide();
	optionsMenu.show();

func _on_Bt_quitGame_pressed():
	print ("Exiting game!");
	mainMenu.hide()
	credits.show()

# Options UI
func _on_Bt_Back_pressed():
	optionsMenu.hide();
	mainMenu.show();


func _on_Bt_resume_pressed():
	pauseMenu.hide();
	get_tree().set_pause(false);


func _on_Bt_quit_pressed():
	get_tree().change_scene("Scenes/Menu_UI.tscn");
