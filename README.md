## TWRP device tree for LG G6 (US Cellular US997)

Add to `.repo/local_manifests/us997.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<remote name="LGE-G5-G6-V20" fetch="https://github.com/LGE-G5-G6-V20"/>
	<project path="device/lge/us997" name="twrp_lge_msm8996" remote="LGE-G5-G6-V20" revision="g6/us997" />
</manifest>
```

Then run `repo sync` to check it out.

To build:

```
. build/envsetup.sh
lunch omni_us997-eng
mka recoveryimage
```

Kernel sources are available at: https://github.com/LineageOS/android_kernel_lge_msm8996
