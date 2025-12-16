# Copyright (c) 2025 Electronic Materials Office Limited
# SPDX-License-Identifier: MIT

target_sources_ifdef(CONFIG_ZMK_EC11_AUTO_OFF app PRIVATE encoder_sleep.c)
target_sources(app PRIVATE led_indicator.c)
zephyr_include_directories(include)