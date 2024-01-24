# 6-Variant List Variant Map

Resource: [https://doc.qt.io/qt-6/qtqml-cppintegration-data.html](https://doc.qt.io/qt-6/qtqml-cppintegration-data.html)


- Exploring the use of QVariantList and QVariantMap to pass sequence data
back and forth between C++ and QML
```cpp
    . QVariantList (C++) <=> array (QML)
    . QVariantMap (C++) <=> object (QML)
```

- We
    - pass data from qml to c++
```cpp
    void CppClass::passFromQmlToCpp(QVariantList list, QVariantMap map )
    getVariantListFromCpp();
    getVariantMapFromCpp(); 
```
- Invoke a js method by passing in sequence data :
        ```CppClass::triggerJSCall()```

- Use the qt 5 course and improvise.


## Changes
- Made C++ class  ```CppClass```  a creatable qml object by adding ```QML_ELEMENT``` 

- Since most of the function in CppClass did not really on member objects and are simply independent operations, a stateful class was a best fit in this case therefore I made it a singleton by adding ```QML_SINGLETON``` based on this [decision tree](https://doc.qt.io/qt-6/qtqml-cppintegration-overview.html). 
