MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CONFIG = $(MAKEFILE_DIR)make.conf
EXECUTABLES := systemctl loginctl wpctl brightnessctl playerctl rofi wl-paste wl-copy autotiling sworkstyle foot slurp grim wf-recorder cliphist swaylock mako waybar swaybg jq wl-mirror nm-connection-editor blueberry nmtui btop telegram-desktop pipectl
BUILD_DIR = $(MAKEFILE_DIR)build
SWAY_CONFIG_SRC := $(MAKEFILE_DIR)config.d $(MAKEFILE_DIR)definitions.d $(MAKEFILE_DIR)scripts $(MAKEFILE_DIR)themes $(MAKEFILE_DIR)config
ROFI_CONFIG_SRC := $(shell find $(MAKEFILE_DIR)rofi -name "*.rasi")
SWORKSTYLE_CONFIG_SRC := $(shell find $(MAKEFILE_DIR)sworkstyle -name "*.toml")
ROW := "%-15s|%-20s\n"
SWAY_INSTALL_DIR := $(HOME)/.config/sway
ROFI_INSTALL_DIR := $(HOME)/.config/rofi
SWORKSTYLE_INSTALL_DIR := $(HOME)/.config/sworkstyle
WALLPAPERS_INSTALL_DIR := $(HOME)/.config/wallpapers

include ${CONFIG}

all: prepare install

prepare: ./waybar
	mkdir -p $(BUILD_DIR)/sway && cp -r $(SWAY_CONFIG_SRC) $(BUILD_DIR)/sway
	sed -i 's/IMPORT_DISPLAY_VARIABLES/$(IMPORT_DISPLAY_VARIABLES)/gm' $(BUILD_DIR)/sway/config.d/autostart.conf
	sed -i 's/SUSPEND/$(SUSPEND)/gm' $(BUILD_DIR)/sway/config.d/modes/shutdown.conf
	sed -i 's/POWEROFF/$(POWEROFF)/gm' $(BUILD_DIR)/sway/config.d/modes/shutdown.conf
	sed -i 's/REBOOT/$(REBOOT)/gm' $(BUILD_DIR)/sway/config.d/modes/shutdown.conf
	sed -i 's/EXIT_SESSION_COMMAND/$(EXIT_SESSION_COMMAND)/gm' $(BUILD_DIR)/sway/config.d/modes/shutdown.conf
	sed -i 's/AUDIO_MUTE/$(AUDIO_MUTE)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/MIC_MUTE/$(MIC_MUTE)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/RAISE_VOLUME/$(RAISE_VOLUME)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/LOWER_VOLUME/$(LOWER_VOLUME)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/BRIGHTNESS_UP/$(BRIGHTNESS_UP)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/BRIGHTNESS_DOWN/$(BRIGHTNESS_DOWN)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/AUDIO_PLAY/$(AUDIO_PLAY)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/AUDIO_NEXT/$(AUDIO_NEXT)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/AUDIO_PREV/$(AUDIO_PREV)/gm' $(BUILD_DIR)/sway/config.d/shortcuts.conf
	sed -i 's/THEME/$(THEME)/gm' $(BUILD_DIR)/sway/config

install:
	@if [ -d $(SWAY_INSTALL_DIR) ]; then echo "$(SWAY_INSTALL_DIR) already exists"; exit 1; fi
	mkdir -p $(SWAY_INSTALL_DIR) && cp -r $(BUILD_DIR)/sway/* $(SWAY_INSTALL_DIR)

	cd waybar && $(MAKE) -f $(MAKEFILE_DIR)waybar/Makefile all

	@if [ -d $(ROFI_INSTALL_DIR) ]; then echo "$(ROFI_INSTALL_DIR) already exists"; exit 1; fi
	mkdir -p $(ROFI_INSTALL_DIR) && cp -r $(ROFI_CONFIG_SRC) $(ROFI_INSTALL_DIR)

	@if [ -d $(SWORKSTYLE_INSTALL_DIR) ]; then echo "$(SWORKSTYLE_INSTALL_DIR) already exists"; exit 1; fi
	mkdir -p $(SWORKSTYLE_INSTALL_DIR) && cp -r $(SWORKSTYLE_CONFIG_SRC) $(SWORKSTYLE_INSTALL_DIR)

	@if [ ! -d $(SWORKSTYLE_INSTALL_DIR) ]; then mkdir -p $(WALLPAPERS_INSTALL_DIR); fi
	cp -r $(MAKEFILE_DIR)wallpapers/* $(WALLPAPERS_INSTALL_DIR)

check:
	for exec in $(EXECUTABLES); do which $$exec > /dev/null 2>/dev/null && printf $(ROW) "$$exec" "Found" || printf $(ROW) "$$exec" "Not found"; done
	cd waybar && $(MAKE) -s -f $(MAKEFILE_DIR)waybar/Makefile check

clean:
	rm -rf $(BUILD_DIR) $(SWAY_INSTALL_DIR) $(ROFI_INSTALL_DIR) $(SWORKSTYLE_INSTALL_DIR)
	cd waybar && $(MAKE) -f $(MAKEFILE_DIR)waybar/Makefile clean


.PHONY: check
.SILENT: check
