package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.TwoStatePreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_FASTCHARGE = "fastcharge";
    public static final String KEY_BACKLIGHTDISABLE = "backlight_disable";
    public static final String KEY_VIBRATOR_INTENSITY = "vibrator_intensity";
    public static final String KEY_WIFI_PM = "wifi_pm";
    public static final String KEY_SDCARD_CACHE = "sdcard_cache";
    public static final String KEY_DW_CENTISECS = "dw_centisecs";
    public static final String KEY_DE_CENTISECS = "de_centisecs";
    public static final String KEY_DB_RATIO = "db_ratio";
    public static final String KEY_D_RATIO = "d_ratio";
    public static final String KEY_VC_PRESSURE = "vfs_cache_pressure";

    private TwoStatePreference mFastcharge;
    private TwoStatePreference mBacklightDisable;
    private TwoStatePreference mWifiPm;
    private ListPreference mVibratorIntensity;
    private ListPreference mSDCardCache;
    private ListPreference mDWcentisecs;
    private ListPreference mDEcentisecs;
    private ListPreference mDBratio;
    private ListPreference mDratio;
    private ListPreference mVCpressure;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mFastcharge = (TwoStatePreference) findPreference(KEY_FASTCHARGE);
        mFastcharge.setEnabled(Fastcharge.isSupported());
        mFastcharge.setOnPreferenceChangeListener(new Fastcharge());

        mBacklightDisable = (TwoStatePreference) findPreference(KEY_BACKLIGHTDISABLE);
        mBacklightDisable.setEnabled(BacklightDisable.isSupported());
        mBacklightDisable.setOnPreferenceChangeListener(new BacklightDisable());

        mWifiPm = (TwoStatePreference) findPreference(KEY_WIFI_PM);
        mWifiPm.setEnabled(WifiPm.isSupported());
        mWifiPm.setOnPreferenceChangeListener(new WifiPm());

        mVibratorIntensity = (ListPreference) findPreference(KEY_VIBRATOR_INTENSITY);
        mVibratorIntensity.setEnabled(VibratorIntensity.isSupported());
        mVibratorIntensity.setOnPreferenceChangeListener(new VibratorIntensity());

        mSDCardCache = (ListPreference) findPreference(KEY_SDCARD_CACHE);
        mSDCardCache.setEnabled(SDCardCache.isSupported());
        mSDCardCache.setOnPreferenceChangeListener(new SDCardCache());

        mDWcentisecs = (ListPreference) findPreference(KEY_DW_CENTISECS);
        mDWcentisecs.setEnabled(DWcentisecs.isSupported());
        mDWcentisecs.setOnPreferenceChangeListener(new DWcentisecs());

        mDEcentisecs = (ListPreference) findPreference(KEY_DE_CENTISECS);
        mDEcentisecs.setEnabled(DEcentisecs.isSupported());
        mDEcentisecs.setOnPreferenceChangeListener(new DEcentisecs());

        mDBratio = (ListPreference) findPreference(KEY_DB_RATIO);
        mDBratio.setEnabled(DBratio.isSupported());
        mDBratio.setOnPreferenceChangeListener(new DBratio());

        mDratio = (ListPreference) findPreference(KEY_D_RATIO);
        mDratio.setEnabled(Dratio.isSupported());
        mDratio.setOnPreferenceChangeListener(new Dratio());

        mVCpressure = (ListPreference) findPreference(KEY_VC_PRESSURE);
        mVCpressure.setEnabled(VCpressure.isSupported());
        mVCpressure.setOnPreferenceChangeListener(new VCpressure());
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

}
