# Copyright (c) 2025 Electronic Materials Office Ltd.
# SPDX-License-Identifier: MIT

set(ALTAR_I_REVISIONS "us" "uk")
if (NOT DEFINED BOARD_REVISION)
  set(BOARD_REVISION "us")
else()
  if (NOT BOARD_REVISION IN_LIST ALTAR_I_REVISIONS)
    message(FATAL_ERROR "${BOARD_REVISION} is not a valid revision for Altar I. Accepted revisions: ${ALTAR_I_REVISIONS}")
  endif()
endif()
