#
# 86Box		A hypervisor and IBM PC system emulator that specializes in
#		running old operating systems and software designed for IBM
#		PC systems and compatibles from 1981 through fairly recent
#		system designs based on the PCI bus.
#
#		This file is part of the 86Box distribution.
#
#		CMake build script.
#
# Authors:	David Hrdlička, <hrdlickadavid@outlook.com>
#
#		Copyright 2020,2021 David Hrdlička.
#

enable_language(RC)

add_library(plat OBJECT win.c win_dynld.c win_cdrom.c win_thread.c
	win_keyboard.c win_crashdump.c win_mouse.c)

add_library(ui OBJECT win_ui.c win_icon.c win_stbar.c win_sdl.c win_dialog.c win_about.c
	win_settings.c win_devconf.c win_snd_gain.c win_specify_dim.c win_new_floppy.c
	win_jsconf.c win_media_menu.c win_preferences.c win_discord.c glad.c win_opengl.c
	win_opengl_glslp.c 86Box.rc)

target_sources(86Box PRIVATE 86Box.manifest)
set_property(SOURCE 86Box.rc PROPERTY COMPILE_DEFINITIONS NO_INCLUDE_MANIFEST)

if(MSVC)
	# Append null to resource strings (fixes file dialogs)
	set_property(SOURCE 86Box.rc PROPERTY COMPILE_FLAGS -n)
endif()

if(NOT MINGW)
	target_sources(plat PRIVATE win_opendir.c)
endif()

if(DINPUT)
	target_sources(plat PRIVATE win_joystick.cpp)
	target_link_libraries(86Box dinput8)
else()
	target_sources(plat PRIVATE win_joystick_rawinput.c)
endif()

target_link_libraries(86Box advapi32 comctl32 comdlg32 gdi32 shell32 iphlpapi
	dxguid imm32 hid setupapi uxtheme version winmm psapi)
