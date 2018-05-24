using Fuse;
using Fuse.Scripting;
using Uno.UX;

[UXGlobalModule]
public class MeridianModule : NativeModule
{
	static readonly MeridianModule _instance;
	
	public MeridianModule()
	{
		// Make sure we're only initializing the module once
		if (_instance != null) return;

		_instance = this;
		Resource.SetGlobalKey(_instance, "MeridianModule");
		AddMember(new NativeFunction("Log", (NativeCallback)Log));
	}

	static object Log(Context c, object[] args)
	{
		foreach (var arg in args)
			debug_log arg;

		return null;
	}
}