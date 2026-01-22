# Altar I Keyboard Firmware

## Introduction

Altar I is an ultra-low profile wireless mechanical keyboard made by [Electronic Materials Office®](https://electronicmaterialsoffice.com/).

This repository contains firmware images for the Altar I keyboard, based on the open-source [Zephyr Mechanical Keyboard (ZMK) Project](https://zmk.dev/).

## Downloading Firmware

Begin by identifying your Altar I layout (either U.S. English or U.K. English), as found on the back of the keyboard.

Firmware images can be found in the [**Releases**](https://github.com/electronicmaterialsoffice/firmware-altar-i/releases) section of this repository.
They are as described below:

Inside the firmware package are the following images:

- `altar_i_us_<version>.uf2` - Firmware image for **US English Layouts**
- `altar_i_uk_<version>.uf2` - Firmware image for **UK English Layouts**
- `settings_reset.uf2` - Firmware image to clear the onboard memory. **Used in [Recovery](#recovery)**

Alternatively, firmware images for current development efforts can be found in the [**Actions**](https://github.com/electronicmaterialsoffice/firmware-altar-i/actions) section of this repository.
Click on the latest workflow and navigate to the **Artifacts** section to download the latest firmware package (`firmware.zip`).

## Installing Firmware

### Requirements

- Altar I Keyboard
- USB-C cable
- [Firmware Images](#downloading-firmware)

### Procedure

1. Ensure Altar I is turned on
2. Connect Altar I via USB
3. Press FN + CTRL + PAIR simultaneously to enter bootloader mode.
   Altar I will now appear as a storage device on your computer.
4. Copy the firmware file to Altar I.
   A file-transfer error may appear.
   However, the file has been successfully transferred in this case.
5. Once Altar I detects and installs this new firmware image, it will automatically disconnect, reboot, and reconnect itself.

You may need to forget and re-pair Altar I for changes to take effect.

## Customization

For users interested in customizing the behaviour of their keyboard, they have two options:

- [Keymap customization via ZMK Studio](#using-zmk-studio)
- Forking this repository and modifying its contents to create new firmware images

See the [ZMK documentation](https://zmk.dev/docs) for more detailed information on customizing your Altar I firmware.

### Using ZMK Studio

As of **v3.0.0**, Altar I firmware is compatible with [ZMK Studio](https://zmk.dev/docs/features/studio), a tool for updating keymaps during runtime.
Simply connect your Altar I to your computer via USB or Bluetooth\*, and start editing your keymaps via the [web app](https://zmk.studio/) or the [native app for Windows, MacOS, or Linux](https://zmk.studio/download) to begin updating your keymaps.

\*Using ZMK Studio via Bluetooth transport is only available for the native app, and not via the web app.

### Editing Keymaps

The default keymap can be updated by editing the corresponding `altar_i_<layout>.keymap`, found in `boards/electronicmaterialsoffice/altar_i/`.

### Changing Encoder Behaviour

The keybinds assigned to the rotary encoder can be modified by updating the corresponding `sensor-bindings` in `altar_i_<layout>.keymap`, found in `boards/electronicmaterialsoffice/altar_i/`.

The rotary encoder's sensitivity has been tuned to trigger one keybind invocation per detent. However, this can be changed via the encoder's `triggers-per-rotation` field in `altar_i.dts`, found in `boards/electronicmaterialsoffice/altar_i/`.

For more information, see the [ZMK overview on encoders](https://zmk.dev/docs/features/encoders) and the [ZMK page on detailed encoder configuration](https://zmk.dev/docs/config/encoders).

### Github Actions Workflows

This repository will use Github Actions (GHA) to build the three default firmware images specified in [Downloading Firmware](#downloading-firmware).

The list of all images to build, along with their associated snippets and CMake arguments, can be modified in `build.yaml` at the root of this repository.

See the ZMK documentation for more information on [snippets](https://zmk.dev/docs/config/system#snippets) and [CMake arguments](https://zmk.dev/docs/development/local-toolchain/build-flash#cmake-arguments).

## Recovery

If Altar I enters an inoperable state, a full recovery may be necessary.
The following procedure will require accessing the printed circuit board (PCB) via the panel on the backside of the keyboard, exposing some internal electronics.

**Electronic Materials Office takes no responsibility for any damages incurred during the recovery process.**

### Requirements

- Altar I Keyboard
- USB-C cable
- [Firmware Images](#downloading-firmware)
- **T5 Torx Screwdriver**
- **Metal tweezers, paperclip, or metal wire**

### Procedure

1. Ensure Altar I is turned on
2. Connect Altar I via USB
3. Flip over the keyboard and unscrew the three T5 Torx screws holding down the acrylic plate
4. Remove the acrylic plate, exposing two **reset contacts**.
5. Using your tweezers/paperclip/wire, **quickly bridge the reset contacts together twice in a row**.
   Altar I will now appear as a storage device on your computer.
6. Drag and drop [`settings_reset.uf2`](#downloading-firmware) into this storage device to clear the onboard memory
7. Repeat step 5 to set Altar I back into bootloader mode
8. Drag and drop the proper firmware image corresponding to your Altar I's layout
9. Reattach the acrylic plate and reinstall the three T5 Torx screws

You will need to forget and re-pair Altar I for changes to take effect.

## Feedback

If you encounter any problems using the code in this repository, please open a new GitHub issue.
An Electronic Materials Office representative will respond as quickly as possible.
