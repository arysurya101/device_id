package com.bkncr.device_id;

import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.content.pm.FeatureInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.provider.Settings;
import androidx.annotation.NonNull;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * The implementation of {@link MethodChannel.MethodCallHandler} for the plugin. Responsible for
 * receiving method calls from method channel.
 */
class MethodCallHandlerImpl implements MethodChannel.MethodCallHandler {

    private final ContentResolver contentResolver;
    private final PackageManager packageManager;

    /** Constructs DeviceInfo. {@code contentResolver} and {@code packageManager} must not be null. */
    MethodCallHandlerImpl(ContentResolver contentResolver, PackageManager packageManager) {
        this.contentResolver = contentResolver;
        this.packageManager = packageManager;
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.equals("getDeviceId")) {
            result.success(getAndroidId());
        } else {
            result.notImplemented();
        }
    }

    /**
     * On devices with Android >= 8.0 (API level 26) returns an ID that is unique to each combination
     * of app-signing key, user, and device. The value may change if a factory reset is performed on
     * the device or if an APK signing key changes. On devices with Android < 8.0 (API level 26)
     * returns an ID that is randomly generated when the user first sets up the device and should
     * remain constant for the lifetime of the user's device.
     *
     * @return The android ID
     */
    @SuppressLint("HardwareIds")
    private String getAndroidId() {
        return Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID);
    }
}