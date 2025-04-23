# Ensure the manifest file is included if required
if(WIN32)
  set(SOURCE_FILES
    main.cpp
    runner.exe.manifest
  )
else()
  set(SOURCE_FILES
    main.cpp
  )
endif()

# Add the executable target
add_executable(flutter_event_ease ${SOURCE_FILES})

# Link necessary libraries
target_link_libraries(flutter_event_ease PRIVATE flutter)