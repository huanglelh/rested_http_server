message("start ssl find")
find_path( ssl_INCLUDE openssl/ssl.h HINTS "F:\\develop\\workspace\\lib\\openssl\\openssl-1.1.1\\build_win32\\include"  "${PROJECT_SOURCE_DIR}/dependency/openssl/inc32" "${PROJECT_SOURCE_DIR}/dependency/openssl/include" "/usr/local/opt/openssl/include" "/usr/include" "/usr/local/include" "/opt/local/include" )


if(ssl_INCLUDE)
    message("ssl include is found")
    endif()


find_library( ssl_LIBRARY_STATIC libssl.lib  HINTS "F:\\develop\\workspace\\lib\\openssl\\openssl-1.1.1\\build_win32\\lib" "${PROJECT_SOURCE_DIR}/dependency/openssl/out32dll" "${PROJECT_SOURCE_DIR}/dependency/openssl" "/usr/local/opt/openssl/lib" "/usr/lib" "/usr/local/lib" "/opt/local/lib" )

if(ssl_LIBRARY_STATIC)
    message("ssl staic library found")
elseif(ssl_LIBRARY_STATIC)
    message("ssl staic not found")
endif()
find_library( crypto_LIBRARY_STATIC libcrypto.lib  HINTS "F:\\develop\\workspace\\lib\\openssl\\openssl-1.1.1\\build_win32\\lib" "${PROJECT_SOURCE_DIR}/dependency/openssl/out32dll" "${PROJECT_SOURCE_DIR}/dependency/openssl" "/usr/local/opt/openssl/lib" "/usr/lib" "/usr/local/lib" "/opt/local/lib" )
if(crypto_LIBRARY_STATIC)
    message("crypt staic library found")
elseif(crypto_LIBRARY_STATIC)
    message("crypt staic not found")
endif()
find_library( ssl_LIBRARY_SHARED  libssl.lib HINTS "F:\\develop\\workspace\\lib\\openssl\\openssl-1.1.1\\build_win32\\bin" "${PROJECT_SOURCE_DIR}/dependency/openssl/out32dll"  "${PROJECT_SOURCE_DIR}/dependency/openssl" "/usr/local/opt/openssl/lib" "/usr/lib" "/usr/local/lib" "/opt/local/lib" )


message("found ssl shared library execute finish")

if(ssl_LIBRARY_SHARED)
    message("ssl library found")
elseif()
    message("ssl not found")
endif()

find_library( crypto_LIBRARY_SHARED libcrypto.lib HINTS "F:\\develop\\workspace\\lib\\openssl\\openssl-1.1.1\\build_win32\\bin" "${PROJECT_SOURCE_DIR}/dependency/openssl/out32dll" "${PROJECT_SOURCE_DIR}/dependency/openssl" "/usr/local/opt/openssl/lib" "/usr/lib" "/usr/local/lib" "/opt/local/lib" )




if(crypto_LIBRARY_SHARED)
    message("crypt library found")
endif()


if (  ssl_LIBRARY_SHARED  AND crypto_LIBRARY_SHARED )
    set( OPENSSL_FOUND TRUE )
    add_definitions( -DBUILD_SSL=TRUE )

    if ( APPLE AND BUILD_SSL )
        set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-declarations" )
    endif( )

    message( STATUS "Found OpenSSL include at: ${ssl_INCLUDE}" )
    message( STATUS "Found OpenSSL library at: ${ssl_LIBRARY_STATIC}" )
    message( STATUS "Found OpenSSL library at: ${ssl_LIBRARY_SHARED}" )
    message( STATUS "Found Crypto library at: ${crypto_LIBRARY_STATIC}" )
    message( STATUS "Found Crypto library at: ${crypto_LIBRARY_SHARED}" )
else ( )
    message( FATAL_ERROR "Failed to locate OpenSSL dependency. see restbed/dependency/openssl; ./config shared; make all" )
endif ( )
