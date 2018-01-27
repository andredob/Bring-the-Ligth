extends Control

var mainMenu;
var optionsMenu;

func _ready():
	mainMenu = self.get_node("Main Menu");
	mainMenu.show();
	optionsMenu = self.get_node("Options_UI");
	optionsMenu.hide();
	
	set_process_input(true);
	pass

# Main Menu UI
func _on_Bt_NewGame_pressed():
	print ("Starting game!");
	#get_tree().change_scene("");

func _on_Bt_Options_pressed():
	print ("Moving to the options menu!");
	mainMenu.hide();
	optionsMenu.show();

func _on_Bt_Quit_pressed():
	print ("Exiting game!");
	get_tree().quit();

# Options UI
func _on_Bt_Return_pressed():
	optionsMenu.hide();
	mainMenu.show();
	
