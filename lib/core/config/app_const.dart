//KEY
import 'package:flutter/widgets.dart';

const String kMapKey = 'AIzaSyB7doxfW-m-TpBRogzeX2EVyIL9RmGXar0';

//NETWORK
const String kProtocol = 'http';
const String kBaseUrl = '192.168.3.153:1001';
const String kProxyUrl = '192.168.3.153:8000';
const bool kNetworkLog = false;
const bool kProxy = true;
const int kNetworkConnectTimeout = 60000;
const int kNetworkReceiveTimeout = 60000;

//WEBSOCKET
const String kWebsocketHost = '192.168.3.153';
const String kWebsocketKey = 'PUSHERKEY';
const int kWebsocketWsPort = 6001;
const int kWebsocketWssPort = 6001;
const bool kWebsocketEncrypt = false;

//NOTIFICATION CHANNEL
const String kOrderChannelKey = 'gocery_partner_order_channel';
const String kOrderStatusChannelKey = 'gocery_partner_order_status_channel';
const String kChatChannelKey = 'gocery_partner_chat_channel';
const String kPromoChannelKey = 'gocery_partner_promo_channel';
const String kServiceChannelKey = 'gocery_partner_service_channel';
const String kOrderChannelGroupKey = 'gocery_partner_order_channel_group';
const String kOrderStatusChannelGroupKey =
    'gocery_partner_order_status_channel_group';
const String kChatChannelGroupKey = 'gocery_partner_chat_channel_group';
const String kPromoChannelGroupKey = 'gocery_partner_promo_channel_group';
const String kServiceChannelGroupKey = 'gocery_partner_service_channel_group';

//UI
const Color kPrimaryColor = Color(0xff64BA02);
const Color kPrimaryColor50 = Color(0xffF9FFF3);
const Color kPrimaryColor100 = Color(0xffF7FFEF);
const Color kPrimaryColor200 = Color(0xffE9F6DB);
const Color kPrimaryColor300 = Color(0xffB0F363);
const Color kPrimaryColor400 = Color(0xff7FDA17);
const Color kPrimaryColor500 = kPrimaryColor;
const Color kPrimaryColor600 = Color(0xff509600);
const Color kPrimaryColor700 = Color(0xff407700);
const Color kPrimaryColor800 = Color(0xff2B5000);
const Color kPrimaryColor900 = Color(0xff172B00);
const Color kBackgroundColor = Color(0xffF2F2F2);
const Color kLightColor = Color(0xffFFFFFF);
const Color kLightColor50 = Color(0xffEBF0F9);
const Color kLightColor100 = Color(0xff8F9BB3);
const Color kDarkColor = Color(0xff222B45);
const Color kErrorColor = Color(0xffF44336);
const Color kAccentColor = Color(0xff0095FF);
const double kTinyPadding = 8;
const double kSmallPadding = 10;
const double kMediumPadding = 14;
const double kBigPadding = 18;
const double kLargePadding = 24;
const double kHugePadding = 30;
const double kTinyFont = 10;
const double kSmallFont = 12;
const double kMediumFont = 16;
const double kBigFont = 20;
const double kLargeFont = 24;
const double kHugeFont = 30;

//REST API
const String kBroadcastAuth = 'partner/broadcasting/auth';
const String kPartners = 'partner/dev/partners';
const String kAuthAccess = 'partner/auth/access';
const String kAuthRevoke = 'partner/auth/revoke';
const String kPartnerAccount = 'partner/accounts';
const String kPartnerAccountStatus = 'partner/accounts/status';
const String kAcceptOrder = 'partner/dev/orders/accept';
const String kRejectOrder = 'partner/dev/orders/reject';

//ROUTE
const String kLandingPage = '/landingpage';
const String kIntroPage = '/intropage';
const String kHomePage = '/homepage';

//ASSETS
const String kNotificationIcon = '';
const String kNotificationSound = 'siren.mp3';
