using Uno.Threading;
using Uno;
using Uno.UX;
using Fuse.Scripting;

[UXGlobalModule]
public class Meridian : NativeModule
{
	static readonly Meridian _instance;
	
	public Meridian()
	{
		// Make sure we're only initializing the module once
		if (_instance != null) return;

		_instance = this;
		Resource.SetGlobalKey(_instance, "Meridian");
		AddMember(new NativeFunction("Log", (NativeCallback)Log));

		if defined(Android)
			AndroidMeridian.GetPermission();
	}

	static object Log(Context c, object[] args)
	{
		foreach (var arg in args)
			debug_log arg;

		return null;
	}
}