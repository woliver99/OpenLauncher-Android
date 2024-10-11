@tool
extends EditorPlugin

# A class member to hold the editor export plugin during its lifecycle.
var export_plugin : AndroidExportPlugin

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	export_plugin = AndroidExportPlugin.new()
	add_export_plugin(export_plugin)

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_export_plugin(export_plugin)
	export_plugin = null

class AndroidExportPlugin extends EditorExportPlugin:
	# Plugin's name.
	var _plugin_name = "openlauncher-android"

	# Specifies which platform is supported by the plugin.
	func _supports_platform(platform):
		if platform is EditorExportPlatformAndroid:
			return true
		return false

	# Return the paths of the plugin's AAR binaries relative to the 'addons' directory.
	func _get_android_libraries(platform, debug):
		if debug:
			return PackedStringArray(["openlauncher-android/openlauncher-android-debug.aar"])
		else:
			return PackedStringArray(["openlauncher-android/openlauncher-android.aar"])

	# Return the plugin's name.
	func _get_name():
		return _plugin_name
