# Registering an Instantiable Object Type

Resource: [Registering an Instantiable Object Type](https://doc.qt.io/qt-6/qtqml-cppintegration-definetypes.html)


## Description

This project aims to demonstrate how to register an instantiable object type in QML using C++. It also aims to demonstrate how to add qml modules using the new cmake function ```qt_add_qml_module```

## QML module
 
A QObject-derived type/module is created and linked with the following cmake script

```cmake
set(MODULE_NAME myModule)
set(LIB_NAME ${MODULE_NAME}Lib) 

qt_add_library(${LIB_NAME} STATIC)

set_target_properties(${LIB_NAME} PROPERTIES AUTOMOC ON)
target_link_libraries(${LIB_NAME} PRIVATE Qt6::Quick)

list(APPEND MODULE_SRC_FILES message.h message.cpp)

qt_add_qml_module(${LIB_NAME}
    URI ${MODULE_NAME}
    VERSION 1.0
    RESOURCE_PREFIX /
    SOURCES
        ${MODULE_SRC_FILES}
    OUTPUT_DIRECTORY
      "${CMAKE_BINARY_DIR}/${MODULE_NAME}"

)
```

- ```set(MODULE_NAME myModule)``` - sets identifier for this module.
- ```set(LIB_NAME ${MODULE_NAME}Lib) ``` - appends a suffix ```Lib``` to the module name
- ```qt_add_library(${LIB_NAME} STATIC)``` - adds the library statically. There are other way this could be done. [Refer](https://cmake.org/cmake/help/latest/command/add_library.html)
- ```target_link_libraries(${LIB_NAME} PRIVATE Qt6::Quick)``` - links  Qt6::Quick to the library. 
- ```list(APPEND MODULE_SRC_FILES message.h message.cpp)``` - stores the module sources in a list called ```MODULE_SRC_FILES```. [Refer](https://cmake.org/cmake/help/latest/command/list.html)
- 
```cmake
qt_add_qml_module(${LIB_NAME}
    URI ${MODULE_NAME}
    VERSION 1.0
    RESOURCE_PREFIX /
    SOURCES
        ${MODULE_SRC_FILES}
    OUTPUT_DIRECTORY
      "${CMAKE_BINARY_DIR}/${MODULE_NAME}")
```
Adds this lib as a plugin with properties indicated above.


### Type Definition

```cpp
class Message : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
  Q_PROPERTY(QDateTime creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)
  QML_ELEMENT
  ...
```

This type is created with two exposed properties ```author``` and ```creationDate```. and is made creatable with the macro ```QML_ELEMENT```


## Module usage

The module is imported and used in the application code as follows: 

```qml
import myModule 1.0
...
    Message {
        id: messageId
        author: "Amelie"
        creationDate: new Date()

        onAuthorChanged: newAuthor => {
            console.log("New author: " + newAuthor);
        }
        onCreationDateChanged: newDateTime => {
            console.log("New Datetime: " + newDateTime);
        }
    }
...
```

Trigger such as button click are added to change the properties of this type and invoke the signals which are captured and displayed. 
