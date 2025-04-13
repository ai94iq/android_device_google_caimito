#!/bin/bash

# Function to clone if directory doesn't exist
clone_if_missing() {
    local repo_url=$1
    local branch=$2
    local target_dir=$3
    shift 3  # Remove the first three parameters
    local git_args=("$@")  # Capture all remaining parameters as git arguments
    
    if [ ! -d "$target_dir" ]; then
        echo "Cloning $target_dir..."
        git clone "$repo_url" -b "$branch" "$target_dir" "${git_args[@]}" -q
        echo "Done."
    fi
}

# Git clones
echo "Setting up Google Pixel (Caimito) repositories..."

# Device repos
clone_if_missing "https://github.com/LineageOS/android_device_google_tokay" "lineage-22.2" "device/google/tokay"
clone_if_missing "https://github.com/LineageOS/android_device_google_caimito" "lineage-22.2" "device/google/caimito"
clone_if_missing "https://github.com/LineageOS/android_device_google_zumapro" "lineage-22.2" "device/google/zumapro"
clone_if_missing "https://github.com/LineageOS/android_device_google_gs101" "lineage-22.2" "device/google/gs101"
clone_if_missing "https://github.com/LineageOS/android_device_google_gs-common" "lineage-22.2" "device/google/gs-common"

# Android TV
clone_if_missing "https://android.googlesource.com/device/google/atv" "android-15.0.0_r30" "device/google/atv"

# Kernel
clone_if_missing "https://android.googlesource.com/device/google/caimito-kernels/6.1" "android-15.0.0_r30" "device/google/caimito-kernels/6.1" --depth=1

# Hardware repos
clone_if_missing "https://github.com/LineageOS/android_hardware_google_pixel" "lineage-22.2" "hardware/google/pixel"
clone_if_missing "https://github.com/LineageOS/android_hardware_google_interfaces" "lineage-22.2" "hardware/google/interfaces"

# Vendor blobs
# Only tokay is needed for caimito
clone_if_missing "https://github.com/TheMuppets/proprietary_vendor_google_tokay" "lineage-22.2" "vendor/google/tokay"

# Conditional vendor blobs - only clone if the specific device is being built
if [ "$TARGET_DEVICE" = "komodo" ] || [ "$LINEAGE_BUILD" = "lineage_komodo" ]; then
    clone_if_missing "https://github.com/TheMuppets/proprietary_vendor_google_komodo" "lineage-22.2" "vendor/google/komodo"
fi

if [ "$TARGET_DEVICE" = "caiman" ] || [ "$LINEAGE_BUILD" = "lineage_caiman" ]; then
    clone_if_missing "https://github.com/TheMuppets/proprietary_vendor_google_caiman" "lineage-22.2" "vendor/google/caiman"
fi

# Common LineageOS hardware repos
clone_if_missing "https://github.com/LineageOS/android_hardware_lineage_compat" "lineage-22.2" "hardware/lineage/compat"
clone_if_missing "https://github.com/LineageOS/android_hardware_lineage_interfaces" "lineage-22.2" "hardware/lineage/interfaces"

# Google platform/external repositories
clone_if_missing "https://android.googlesource.com/platform/external/crosvm" "android-15.0.0_r30" "external/crosvm"

echo "Setup complete."