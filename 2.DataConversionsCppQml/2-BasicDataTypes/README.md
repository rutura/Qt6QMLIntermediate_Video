# 2-Basic Data Types
- Exploring the exchange of data between C++ and QML
- We do that by sending signals across the two sides and seeing what we receive on the other end
- Improvise and learn from the Qt 5 course.
    
## Changes
- Updated c++ class ```CppClass``` a creatable QML object following best practices described in [doc](https://doc.qt.io/qt-6/qtqml-cppintegration-overview.html) by adding a ```QML_ELEMENT``` 
- ```CppClass``` could as well be a singleton but in this case there was no need to make it one since multiple instances could be created(each can maintain there own independent state.)

__Resource__: [https://doc.qt.io/qt-6/qtqml-cppintegration-data.html](https://doc.qt.io/qt-6/qtqml-cppintegration-data.html)