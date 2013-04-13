#!/system/bin/sh
# Copyright (c) 2009-2011, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.cm.device`
case "$target" in
#platform.team@lge.com
    "msm8660_surf" | "msm8660_csfb" | "i_atnt" | "hdk_8x60" | "i_skt" | "i_dcm" | "p930" | "su640" )
	 echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
	 echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
	 echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_dig
	 echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_mem
	 echo 1 > /sys/module/rpm_resources/enable_low_power/rpm_cpu
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
	 echo "intellidemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	 echo "intellidemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
	 echo 50000 > /sys/devices/system/cpu/cpufreq/intellidemand/sampling_rate
	 echo 90 > /sys/devices/system/cpu/cpufreq/intellidemand/up_threshold
	 echo 1 > /sys/devices/system/cpu/cpufreq/intellidemand/io_is_busy
	 echo 4 > /sys/devices/system/cpu/cpufreq/intellidemand/sampling_down_factor
	 chown root.system /sys/devices/system/cpu/mfreq
	 chmod 220 /sys/devices/system/cpu/mfreq
	 chown root.system /sys/devices/system/cpu/cpu1/online
	 chmod 664 /sys/devices/system/cpu/cpu1/online
        ;;
esac

emmc_boot=`getprop ro.emmc`
case "$emmc_boot"
    in "1")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac


# Post-setup services
case "$target" in
    "msm8660_surf" | "msm8660_csfb" | "i_atnt" | "hdk_8x60" | "i_skt" | "i_dcm" | "p930" | "su640" )
        stop mpdecision
        stop thermald
    ;;
esac

case "$target" in
    "p930" | "su640" )
        if [ "`getprop gsm.version.baseband`" == "" ]; then
            setprop gsm.version.baseband `dd if=/dev/block/mmcblk0p14 bs=128000 count=10 | strings |grep -- "-MDM92" | head -1`
        fi
    ;;
esac

usb_config=`getprop persist.sys.usb.config`
case "$usb_config" in
    "") #USB persist config not set, select default configuration
        setprop persist.sys.usb.config mtp,adb
    ;;
esac

#CPU Default Voltage Table
echo "192000 750000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "310500 775000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "384000 775000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "432000 800000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "486000 800000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "540000 825000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "594000 825000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "648000 850000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "702000 850000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "756000 875000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "810000 875000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "864000 900000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "918000 900000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "972000 900000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1026000 925000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1080000 950000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1134000 950000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1188000 975000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1242000 1000000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1296000 1025000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1350000 1050000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1404000 1075000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1458000 1075000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1512000 1100000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1566000 1125000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1620000 1150000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1674000 1175000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1728000 1200000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1782000 1225000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1836000 1275000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1890000 1325000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1944000 1350000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels


#Available frequencies:
#3D: 320000000, 300000000, 266667000, 228571000, 200000000, 177778000, 27000000
#2D: 266667000, 228571000, 200000000
echo 266667000 > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk
echo 200000000 > /sys/devices/platform/kgsl-2d0.0/kgsl/kgsl-2d0/max_gpuclk
echo 200000000 > /sys/devices/platform/kgsl-2d1.1/kgsl/kgsl-2d1/max_gpuclk
