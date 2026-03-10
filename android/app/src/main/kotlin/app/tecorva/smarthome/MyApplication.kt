package app.tecorva.smarthome

import android.app.Application
import com.thingclips.smart.home.sdk.ThingHomeSdk

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        // Replace with your actual Tuya App Key & Secret
        ThingHomeSdk.init(this, "a84xq5hqc4era7m7dcnj", "wcfpyg55sc5m4j4ujva5q3m7nq4jx9gh")

        // Optional: enable debug logs
        ThingHomeSdk.setDebugMode(true)
    }
}