# 3-TimeAndDateTime

- Exploring the exchange of data between C++ and QML
    - In the context of
        -  date
        -  datetime

- We also show string formatting in QML an addition to regular JS
    - property string mValue: "Clicked %1 times, double is %2"

## Changes
- Made C++ class  ```CppClass```  a creatable qml object by adding ```QML_ELEMENT``` 
- Updated the usage in ```main.qml``` creating a QML object of the class while maintaining existing functionality. 
