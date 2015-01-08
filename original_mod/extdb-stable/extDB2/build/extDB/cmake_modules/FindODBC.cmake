FIND_PATH(ODBC_INCLUDE_DIR 
  NAMES odbcinst.h sql.h 
  
  PATHS
  /usr/include
  /usr/include/odbc
  /usr/local/include
  /usr/local/include/odbc
  /usr/local/odbc/include
  /usr/local/include/mysql
  /usr/include/mysql
  "C:/Program Files/ODBC/include"
  "C:/ODBC/include"
  "C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Include"
)

FIND_PATH(ODBC_LIB_DIR 
  NAMES odbc32.lib libiodbc.so odbc odbcinst odbc32 unixodbc
  
  PATHS
  /usr/lib
  /usr/lib/odbc
  /usr/local/lib
  /usr/local/lib/odbc
  /usr/local/include/mysql
  /usr/include/mysql
  "C:/Program Files/ODBC/lib"
  "C:/ODBC/lib"
  "C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Lib"
)

FIND_LIBRARY(ODBC_LIBRARY 
  NAMES iodbc odbc odbcinst odbc32 unixodbc
  
  PATHS
  /usr/lib
  /usr/lib/odbc
  /usr/local/lib
  /usr/local/lib/odbc
  /usr/local/odbc/lib
  "C:/Program Files/ODBC/lib"
  "C:/ODBC/lib/debug"
  "C:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Lib"
)

IF (ODBC_INCLUDE_DIR AND ODBC_LIBRARY)
	SET(ODBC_FOUND TRUE)
else()
	SET(ODBC_FOUND FALSE)
ENDIF()

MARK_AS_ADVANCED(
  ODBC_LIBRARY
  ODBC_LIB_DIR
  ODBC_INCLUDE_DIR
  )
