import 'package:klaviyo_flutter/src/klaviyo_profile_model.dart';
import 'package:klaviyo_flutter/src/method_channel_klaviyo_flutter.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class KlaviyoFlutterPlatform extends PlatformInterface {
  /// Constructs a KlaviyoFlutterPlatform.
  KlaviyoFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  /// The default instance of [KlaviyoFlutterPlatform] to use.
  static KlaviyoFlutterPlatform _instance = MethodChannelKlaviyoFlutter();

  /// Defaults to [KlaviyoFlutterPlatform].
  static KlaviyoFlutterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [KlaviyoFlutterPlatform] when they register themselves.
  static set instance(KlaviyoFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Function to initialize the Klaviyo SDK.
  ///
  /// First, you'll need to get your Klaviyo [apiKey] public API key for your Klaviyo account.
  ///
  /// You can get these from Klaviyo settings:
  /// * [public API key](https://www.klaviyo.com/settings/account/api-keys)
  ///
  /// Then, initialize Klaviyo in main method.
  Future<void> initialize(String apiKey) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  /// The [token] to send to the Klaviyo to receive the notifications.
  ///
  /// For the Android, this [token] must be a FCM (Firebase cloud messaging) token.
  /// For the iOS, this [token] must be a APNS token.
  Future<void> sendTokenToKlaviyo(String token) {
    throw UnimplementedError('sendTokenToKlaviyo() has not been implemented.');
  }

  /// To log events in Klaviyo that record what users do in your app and when they do it.
  /// For example, you can record when user opened a specific screen in your app.
  /// You can also pass [metaData] about the event.
  Future<String> logEvent(String name, [Map<String, dynamic>? metaData]) {
    throw UnimplementedError('logEvent() has not been implemented.');
  }

  /// Assign new identifiers and attributes to the currently tracked profile.
  /// If a profile has already been identified it will be overwritten by calling [resetProfile].
  ///
  /// The SDK keeps track of current profile details to
  /// build analytics requests with profile identifiers
  ///
  /// @param [profileMap] A map-like object representing properties of the new user
  /// @return Returns Future<String> success when called on Android or iOS
  ///
  /// All profile attributes recognised by the Klaviyo APIs [com.klaviyo.analytics.model.ProfileKey]
  //     object EXTERNAL_ID : ProfileKey("external_id")
  //     object EMAIL : ProfileKey("email")
  //     object PHONE_NUMBER : ProfileKey("phone_number")
  //     internal object ANONYMOUS_ID : ProfileKey("anonymous_id")
  //
  //     // Personal information
  //     object FIRST_NAME : ProfileKey("first_name")
  //     object LAST_NAME : ProfileKey("last_name")
  //     object ORGANIZATION : ProfileKey("organization")
  //     object TITLE : ProfileKey("title")
  //     object IMAGE : ProfileKey("image")
  //
  //     object ADDRESS1 : ProfileKey("address1")
  //     object ADDRESS2 : ProfileKey("address2")
  //     object CITY : ProfileKey("city")
  //     object COUNTRY : ProfileKey("country")
  //     object LATITUDE : ProfileKey("latitude")
  //     object LONGITUDE : ProfileKey("longitude")
  //     object REGION : ProfileKey("region")
  //     object ZIP : ProfileKey("zip")
  //     object TIMEZONE : ProfileKey("timezone")
  Future<String> updateProfile(KlaviyoProfileModel profileModel) async {
    throw UnimplementedError('updateProfile() has not been implemented.');
  }

  /// Check if the push [message] is for Klaviyo and handle that push.
  Future<bool> handlePush(Map<String, dynamic> message) async {
    throw UnimplementedError('handlePush() has not been implemented.');
  }

  /// @return The external ID of the currently tracked profile, if set
  Future<String?> getExternalId() async {
    throw UnimplementedError('getExternalId() has not been implemented.');
  }

  Future<void> resetProfile() async {
    throw UnimplementedError('resetProfile() has not been implemented.');
  }
}