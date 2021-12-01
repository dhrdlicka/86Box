target_sources(86Box PRIVATE "./macOSXGlue.m")
target_link_libraries(86Box "-framework AppKit")

# Prepare the macOS app bundle icon depending on the release channel
if(RELEASE_BUILD)
	set(APP_ICON_MACOSX icons/release/86Box.icns)
elseif(BETA_BUILD)
	set(APP_ICON_MACOSX icons/beta/86Box.icns)
elseif(ALPHA_BUILD)
	set(APP_ICON_MACOSX icons/dev/86Box.icns)
else()
	set(APP_ICON_MACOSX icons/branch/86Box.icns)
endif()

target_sources(86Box PRIVATE ${APP_ICON_MACOSX})
set_source_files_properties(${APP_ICON_MACOSX}
	PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

if(EMU_BUILD)
	set(LONG_VER_STRING	"${CMAKE_PROJECT_VERSION} [${EMU_BUILD}]")
else()
	set(LONG_VER_STRING	"${CMAKE_PROJECT_VERSION}")
endif()

# Generate Info.plist
configure_file(Info.plist.in Info.plist @ONLY)
set_target_properties(86Box
	PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_BINARY_DIR}/Info.plist)