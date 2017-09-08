#include "guicplugin.h"

#include <qqml.h>

void GuicPlugin::registerTypes(const char *uri)
{
    // @uri IVIS.Component

    // Templete
    qmlRegisterType(QUrl("qrc:///Template/AbstractDelegate.qml"), uri, 1, 0, "AbstractDelegate");
    qmlRegisterType(QUrl("qrc:///Template/AbstractLayout.qml"), uri, 1, 0, "AbstractLayout");
    qmlRegisterType(QUrl("qrc:///Template/PopTransition.qml"),uri, 1, 0, "PopTransition");
    qmlRegisterType(QUrl("qrc:///Template/PushTransition.qml"),uri, 1, 0, "PushTransition");
    qmlRegisterType(QUrl("qrc:///Template/StackView.qml"),uri, 1, 0, "StackView");
    qmlRegisterType(QUrl("qrc:///Template/StackViewTransition.qml"),uri, 1, 0, "StackViewTransition");
    qmlRegisterType(QUrl("qrc:///Template/TAnalogClock.qml"),uri, 1, 0, "TAnalogClock");
    qmlRegisterType(QUrl("qrc:///Template/TBusyIndicator.qml"),uri, 1, 0, "TBusyIndicator");
    qmlRegisterType(QUrl("qrc:///Template/TButton.qml"), uri, 1, 0, "TButton");
    qmlRegisterType(QUrl("qrc:///Template/TCheckButton.qml"), uri, 1, 0, "TCheckButton");
    qmlRegisterType(QUrl("qrc:///Template/TClock.qml"), uri, 1, 0, "TClock");
    qmlRegisterType(QUrl("qrc:///Template/TControl.qml"), uri, 1, 0, "TControl");
    qmlRegisterType(QUrl("qrc:///Template/TDigitalClock.qml"), uri, 1, 0, "TDigitalClock");
    qmlRegisterType(QUrl("qrc:///Template/TIndicator.qml"), uri, 1, 0, "TIndicator");
    qmlRegisterType(QUrl("qrc:///Template/TLabel.qml"), uri, 1, 0, "TLabel");
    qmlRegisterType(QUrl("qrc:///Template/TLaneGuidance.qml"),uri, 1, 0, "TLaneGuidance");
    qmlRegisterType(QUrl("qrc:///Template/TLaneImageArea.qml"), uri, 1, 0, "TLaneImageArea");
    qmlRegisterType(QUrl("qrc:///Template/TLinearScrollBar.qml"), uri, 1, 0, "TLinearScrollBar");
    qmlRegisterType(QUrl("qrc:///Template/TLinearSlider.qml"), uri, 1, 0, "TLinearSlider");
    qmlRegisterType(QUrl("qrc:///Template/TListView.qml"), uri, 1, 0, "TListView");
    qmlRegisterType(QUrl("qrc:///Template/TMagneticTouchArea.qml"), uri, 1, 0, "TMagneticTouchArea");
    qmlRegisterType(QUrl("qrc:///Template/TMarqueeLabel.qml"), uri, 1, 0, "TMarqueeLabel");
    qmlRegisterType(QUrl("qrc:///Template/TPlayTimeLabel.qml"), uri, 1, 0, "TPlayTimeLabel");
    qmlRegisterType(QUrl("qrc:///Template/TProgressBar.qml"), uri, 1, 0, "TProgressBar");
    qmlRegisterType(QUrl("qrc:///Template/TPushButton.qml"), uri, 1, 0, "TPushButton");
    qmlRegisterType(QUrl("qrc:///Template/TRadioButton.qml"), uri, 1, 0, "TRadioButton");
    qmlRegisterType(QUrl("qrc:///Template/TRealTimeSlider.qml"), uri, 1, 0, "TRealTimeSlider");
    qmlRegisterType(QUrl("qrc:///Template/TRTSlider.qml"), uri, 1, 0, "TRTSlider");
    qmlRegisterType(QUrl("qrc:///Template/TSaftyAlert.qml"), uri, 1, 0, "TSaftyAlert");
    qmlRegisterType(QUrl("qrc:///Template/TScrollBar.qml"),uri, 1, 0, "TScrollBar");
    qmlRegisterType(QUrl("qrc:///Template/TSlider.qml"),uri, 1, 0, "TSlider");
    qmlRegisterType(QUrl("qrc:///Template/TStateButton.qml"),uri, 1, 0, "TStateButton");
    qmlRegisterType(QUrl("qrc:///Template/TStateIndicator.qml"),uri, 1, 0, "TStateIndicator");
    qmlRegisterType(QUrl("qrc:///Template/TSwipeView.qml"),uri, 1, 0, "TSwipeView");
    qmlRegisterType(QUrl("qrc:///Template/TTabBar.qml"),uri, 1, 0, "TTabBar");
    qmlRegisterType(QUrl("qrc:///Template/TTabButton.qml"),uri, 1, 0, "TTabButton");
    qmlRegisterType(QUrl("qrc:///Template/TTouchArea.qml"),uri, 1, 0, "TTouchArea");
    qmlRegisterType(QUrl("qrc:///Template/TTurnByTurn.qml"),uri, 1, 0, "TTurnByTurn");

    qmlRegisterType(QUrl("qrc:///Template/FocusGroup.qml"),uri, 1, 0, "FocusGroup");
    qmlRegisterSingletonType(QUrl("qrc:///Template/FocusGroupDefine.qml"),uri, 1, 0, "FocusGroupDefine");
    qmlRegisterSingletonType(QUrl("qrc:///Template/FocusGroupManager.qml"),uri, 1, 0, "FocusGroupManager");

    //Example FocusButton ( baidu Button )
    qmlRegisterType(QUrl("qrc:/Component/Button/Button_1Image_Type.qml"),uri, 1, 0, "Button_1Image_Type");
    qmlRegisterType(QUrl("qrc:/Component/Button/Button_TextType.qml"),uri, 1, 0, "Button_TextType");
    qmlRegisterType(QUrl("qrc:/Component/Button/Button_CheckedType.qml"),uri, 1, 0, "Button_CheckedType");
    qmlRegisterType(QUrl("qrc:/Component/Button/Button_CompassType.qml"),uri, 1, 0, "Button_CompassType");
    qmlRegisterType(QUrl("qrc:/Component/Button/Button_ScaleType.qml"),uri, 1, 0, "Button_ScaleType");

    //ScrollBar
    qmlRegisterType(QUrl("qrc:///Component/ScrollBar/CurvedScrollBar.qml"),uri, 1, 0, "CurvedScrollBar");
    qmlRegisterType(QUrl("qrc:///Component/ScrollBar/LinearScrollBar.qml"),uri, 1, 0, "LinearScrollBar");

//    //VirtualKeyboard
//    qmlRegisterType(QUrl("qrc:///Component/Button/ButtonType10.qml"), uri, 1, 0, "ButtonType10");
//    qmlRegisterType(QUrl("qrc:///Component/Button/ButtonType_Keycap.qml"), uri, 1, 0, "ButtonType_Keycap");


    //DemoApp
    qmlRegisterSingletonType(QUrl("qrc:/DemoAppDefine.qml"),uri, 1, 0, "DemoAppDefine");
}

