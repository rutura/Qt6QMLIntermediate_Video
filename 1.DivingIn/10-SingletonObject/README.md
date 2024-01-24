# 10 - Singleton Objects
Resource: [https://doc.qt.io/qt-6/qtqml-cppintegration-exposecppstate.html](https://doc.qt.io/qt-6/qtqml-cppintegration-exposecppstate.html)

## Singleton Objects

According to [singleton design pattern](https://refactoring.guru/design-patterns/singleton/cpp/example),  all instances of the same class share the same state as the original instance. This is useful in operation where creating several instances with different states(the case with non-singleton classes) can cause deadlocks and other undefined errors  especially if all this instances share the same resource such as a linux file descriptor. In this example it is a com-port. Instances of a CommsManager would operate on the same port file descriptor. 

### QML_SINGLETON

```QML_SINGLETON``` makes a QObject-derived class a singleton and also makes it uncreatable in QML with ```QML_UNCREATABLE("cannot create instance of a singleton class")``` such that the application will throw errors if you try 

```qml
    CommsManager {
         id: commsManagerId1
      open: false
     }

    CommsManager {
         id: commsManagerId2
         open: false
     }
```