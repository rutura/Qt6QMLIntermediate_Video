# 5 - Sequence Types to JS Arrays

- Exploring the exchange of sequence data
- There are many types on the C++ side
```cpp 
. QVector
. QList
```
-  Most of them map to simple JS arrays on the QML side.

- We Send sequence data to C++ :
```qml 
    Button{
        id : mButton1
        text : "Send to C++"
        onClicked: {
            var arr = ['Apple', 'Banana','Avocado','Pear','Orange'];
            CppClass.qmlArrayToCpp(arr)
        }
    }

```
- Receive sequence data from C++ :

```qml
    Button{
        id : mButton2
        anchors.top: mButton1.bottom
        text : "Read from C++"
        onClicked: {
            var arr = CppClass.retrieveStrings();
            print("The length is : "+ arr.length)

            arr.forEach(function(element){
                console.log(element)
            })
        }
    }
```


## Changes
- Made C++ class  ```CppClass```  a creatable qml object by adding ```QML_ELEMENT``` 
