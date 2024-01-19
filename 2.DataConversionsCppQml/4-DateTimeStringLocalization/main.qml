/*

        . Some localization facilities for
            . date
            . datetime
            . strings
            . currency
        . Precision for number outpu
  */

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Component.onCompleted: {


        var mDate = new Date()

        //1.toLocaleDateString (contains date, no time info. If you try to read date, you'll get garbage),
        /*
        print(mDate.toLocaleDateString())
        print(mDate.toLocaleDateString(Qt.locale("fr_FR")))
        print(mDate.toLocaleDateString(Qt.locale("zh_CN"),"yyyy-MMMM-dd"))
        print(mDate.toLocaleDateString(Qt.locale("de_DE"),"yyyy-MMMM-dd"))
        */



        //2.toLocaleString ( contains date and time)
        /*
        print(mDate.toLocaleString(Qt.locale("en_US"),"yyyy-MMM-dd --HH:mm:ss"))
        */


        //3.toLocaleTimeString( contains time, no date info. If you try to read date, you'll get garbage)
        /*
        print(mDate.toLocaleTimeString(Qt.locale("en_US"),"HH:mm:ss"))
        */


        //4.fromLocaleDateString
        /*
        //2018-九月-18
        //yyyy-MM-dd --HH:mm:ss  , locale : zh_CN
        var myDate = Date.fromLocaleDateString(Qt.locale("zh_CN"),"2018-09-17","yyyy-MM-dd")
        print("Date is : "+ myDate)

        //myDate = Date.fromLocaleDateString(Qt.locale("en_US"),"2018-九月-18","yyyy-MMMM-dd") // Invalid date. Trying to parse chinese as english.
        //myDate = Date.fromLocaleDateString(Qt.locale("zh_CN"),"2018-九月-18","yyyy-MMMM-dd") // Fix : Read in Chinese locale
        print("Date is : "+ myDate)
        */




        //5.fromLocaleString
        /*
        var myDate = Date.fromLocaleString(Qt.locale("en_US"),"2018-09-17 --16:23:35","yyyy-MM-dd --HH:mm:ss")
        print(myDate)
        */


        //6.fromLocaleTimeString
        /*
        var myDate = Date.fromLocaleTimeString(Qt.locale("en_US"),"16:23:35","HH:mm:ss")
        print(myDate)
        */


        //7.Number locale operations : Read numbers from a given locale
        /*
        var mLocale = Qt.locale("de_DE")
        var d

        //d = Number.fromLocaleString(mLocale, "1234,56")
        //print("d is :" + d)

        //d = Number.fromLocaleString(mLocale, "1234.56") // Wrong format for given locale
        //print("d is :" + d)

        d = Number.fromLocaleString(mLocale,"1.234,56")
        print("d is :" + d)
        */



        //8. Currency output
        /*
        var mLocale = Qt.locale("en_US")
        var mLocale = Qt.locale("de_DE")

        var number = Number("123.00") //The symbol shows up for installed languages on my system
        var outStr = number.toLocaleCurrencyString(mLocale,mLocale.currencySymbol(Locale.CurrencySymbol))
        print("currency is :" + outStr)
        */

        //9. Number with precision
        var mLocale = Qt.locale("en_US")
        var number = Number("123.00")
        var outStr = number.toLocaleString(mLocale,'f',4) //Precision , number of digits after decimal point
        print("The number is :"+ outStr)




    }
}
