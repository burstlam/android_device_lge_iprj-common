package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class Startup extends BroadcastReceiver {

    @Override
    public void onReceive(final Context context, final Intent bootintent) {
        Fastcharge.restore(context);
        BacklightDisable.restore(context);
        VibratorIntensity.restore(context);
        WifiPm.restore(context);
        SDCardCache.restore(context);
        DWcentisecs.restore(context);
        DEcentisecs.restore(context);
        DBratio.restore(context);
        Dratio.restore(context);
        VCpressure.restore(context);
    }
}
