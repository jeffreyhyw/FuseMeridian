using Uno;
using Uno.UX;
using Uno.Collections;
using Uno.Compiler.ExportTargetInterop;
using Fuse;
using Fuse.Triggers;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Controls.Native.Android;
using Uno.Permissions;

// Google Support Libraries
[extern(Android) Require("Gradle.Dependency.Compile", "com.android.support:support-v4:$support_libraries_version")]
[extern(Android) Require("Gradle.Dependency.Compile", "com.android.support:appcompat-v7:$support_libraries_version")]

// Required 3rd-party libraries
[extern(Android) Require("Gradle.Dependency.Compile", "com.android.volley:volley:1.0.0")]
[extern(Android) Require("Gradle.Dependency.Compile", "com.squareup:otto:1.3.8")]

// Reference the Meridian Android SDK (distributed as an AAR package)
[extern(Android) Require("Gradle.Repository", "flatDir { dirs '../../../../../../src/libs/'}")]
[extern(Android) Require("Gradle.Dependency.Compile", "com.arubanetworks.meridian:meridian:+@aar")]

[extern(Android) ForeignInclude(Language.Java, "com.arubanetworks.meridian")]

public partial class MainView
{
    public void GetPermission(object a1, EventArgs a2)
    {
        PlatformPermission[] permissions_required = new PlatformPermission[3];
        permissions_required[0] = Permissions.Android.ACCESS_FINE_LOCATION;
        permissions_required[1] = Permissions.Android.BLUETOOTH;
        permissions_required[2] = Permissions.Android.BLUETOOTH_ADMIN;
        
        var permissionPromise = Permissions.Request(permissions_required);
        permissionPromise.Then(OnPermitted, OnRejected);
    }

    void OnPermitted(PlatformPermission[] permission)
    {
        debug_log "Permission granted: " + permission.GetType();
    }

    void OnRejected(Exception e)
    {
        debug_log "Damn: " + e.Message;
    }
}

