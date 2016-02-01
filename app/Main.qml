import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    id: root
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "ongaku.svandecappelle"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    property real margins: units.gu(2)
    property real buttonWidth: units.gu(9)


    PageStack {
        id: ongakuStack
        Component.onCompleted: push(homePage)



        Page {
            id: homePage
            visible: false
            title: i18n.tr("Ongaku")
            state: "default"

            Label {
                anchors.centerIn: parent
                text: "Ongaku home page"
            }

            head.actions: [
               Action {
                   iconName: "properties"
                   onTriggered: {
                       console.log("Go to config page")
                       ongakuStack.push(configPage, {color: UbuntuColors.red})
                   }
               }
            ]
        }
        Page {
            title: "Configuration"
            id: configPage
            visible: false
            property alias color: rectangle.color
            Rectangle {
                id: rectangle
                anchors {
                    fill: parent
                    margins: units.gu(5)
                }
            }
            head.backAction: Action {
                id: leaveConfigurationAction
                text: "back"
                iconName: "back"
                onTriggered: {
                    ongakuStack.pop()
                    console.log("Return to home")
                }
           }
        }
    }
}

