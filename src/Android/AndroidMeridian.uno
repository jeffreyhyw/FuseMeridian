using Uno.Threading;
using Uno;
using Uno.Compiler.ExportTargetInterop;
using Android;
using Uno.Permissions;

extern (Android) static internal class AndroidMeridian
{
	internal static void GetPermission()
	{
		var permissions = new PlatformPermission[] 
		{
			Permissions.Android.ACCESS_FINE_LOCATION,
			Permissions.Android.BLUETOOTH,
			Permissions.Android.BLUETOOTH_ADMIN
		};

		Permissions.Request(permissions);
		debug_log "Permission Granted";
	}
}