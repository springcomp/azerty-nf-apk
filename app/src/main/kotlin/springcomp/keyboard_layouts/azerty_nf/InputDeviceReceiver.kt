package springcomp.keyboard_layouts.azerty_nf

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

class InputDeviceReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        // No-op: the system queries the manifest meta-data for keyboard layouts.
        // Keep a minimal implementation for compatibility and debugging.
        Log.d("InputDeviceReceiver", "Received intent: ${intent.action}")
    }
}
