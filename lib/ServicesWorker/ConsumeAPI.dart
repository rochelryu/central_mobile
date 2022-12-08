import 'dart:async';
import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/network_util.dart';


class ConsumeAPI {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://app.shouz.network";//http://192.168.1.180:5002"; // https://app.shouz.network // huawei 192.168.43.115 // ngboador 192.168.1.27 // unknow mobile 192.168.43.4
  static final signinUrl = "$BASE_URL/lastLevel/login";
  static final validateRechargementUrl = "$BASE_URL/lastLevel/validateRechargement";
  static final SIGINSECONDSTEP_URL = BASE_URL + "/client/secondStep";
  static final UPDATEHOBIE_URL = BASE_URL + "/client/updateHobbies";
  static final UPDATEPOSITION_URL = BASE_URL + "/client/updateCurentPosition";
  static final UPDATE_RECOVERY_URL = BASE_URL + "/client/updateRecovery";
  static final UPDATE_TOKEN_VERIFICATION_URL = BASE_URL + "/client/updateTokenVerification";
  static final VERIFY_TWILIO_URL = BASE_URL + "/client/verifyTwilio";
  static final VERIFY_ONLINE_CLIENT_URL = BASE_URL + "/client/verifyOnline";
  static final RESEND_RECOVERY_URL = BASE_URL + "/client/resendRecovery";
  static final SETTINGS_URL = BASE_URL + "/client/settings";
  static final RECHARGE_BYCRYPTO_URL = BASE_URL + "/client/transactionCrypto";
  static final DEMANDERETRAIT_URL = BASE_URL + "/client/demandeRetrait";
  static final RECHARGE_BYMOBILEMONEY_URL = BASE_URL + "/client/transactionMobileMoney";
  static final RESPONSE_FINAL_DEALS_URL = BASE_URL + "/client/responseProductForLastStep";
  static final ADD_COMMENT_ON_ACTUALITY_URL = BASE_URL + "/client/addComment";
  static final GET_PROFIL_URL = BASE_URL + "/client/getProfil";
  static final VERIFY_URL = BASE_URL + "/client/verify";
  static final UPDATE_PROFIL_PICTURE_URL = BASE_URL + "/client/changeProfil";
  static final UPDATE_BASIC_INFO_URL = BASE_URL + "/client/changeBasicInfo";
  static final GET_USER_BY_FILTER_URL = BASE_URL + "/client/getClientByNumber";
  static final UPDATE_PROFIL_PIN_URL = BASE_URL + "/client/updatePin";
  static final VERIFY_FRIEND = BASE_URL + "/client/verify";

  static final VIEW_NOTIFICATION_URL = BASE_URL + "/client/viewNotif";
  static final DEMANDE_CONDUCTEUR_URL = BASE_URL + "/client/demandeConducteur";
  static final DEMANDE_VOYAGEUR_URL = BASE_URL + "/client/demandeVoyageur";
  static final ALL_NOTIFICATION_URL = BASE_URL + "/client/getAllNotif";
  static final ALL_NUMBER_NOTIFICATION_BY_CATEGORIE_URL = BASE_URL + "/client/getAllNumberNotifByCategorie";
  static final PERCENTAGE_METHOD_PAYEMENT_URL = BASE_URL + "/client/getPercentageModePayement";
  static final GET_MOBILE_MONEY_AVALAIBLE_URL = BASE_URL + "/client/getMobileMoneyAvalaible";
  static final GET_MAX_PLACE_FOR_CREATE_EVENT_URL = BASE_URL + "/client/getMaxPlaceForCreateEvent";
  static final ALL_CATEGIRES_URL = BASE_URL + "/categorie/all";

  static final SET_EVENT_URL = BASE_URL + "/event/inside";
  static final SET_SUBSCRIBE_EVENT_URL = BASE_URL + "/client/subscribeEvent";
  static final SET_BUY_EVENT_URL = BASE_URL + "/event/buyTicket";
  static final SHARE_TICKET_URL = BASE_URL + "/event/shareTicket";
  static final DROP_TICKET_URL = BASE_URL + "/event/dropTicket";
  static final GET_TYPE_EVENT_URL = BASE_URL + "/event/getAllType";
  static final RECUP_CUMUL_URL = BASE_URL + "/event/recupGain";
  static final SET_DECODEUR_URL = BASE_URL + "/event/setDecodeur";
  static final DECODE_BY_SCAN_URL = BASE_URL + "/event/decodeTicketByScan";
  static final DECODE_BY_NUMBER_URL = BASE_URL + "/event/decodeTicketByNumero";
  static final GET_ALL_EVENT_WHEN_VERIFY_SCAN_URL = BASE_URL + "/event/getAllEventWhenVerifyScan";
  static final GET_EVENT_URL = BASE_URL + "/event/getEvent";
  static final GET_ALL_DECODEUR_FOR_EVENT_URL = BASE_URL + "/event/getAllDecodeurForEvent";
  static final GET_DETAILS_FOR_EVENT_URL = BASE_URL + "/event/getDetailsOfEvent";


  static final ALL_CATEGIRES_WITHOUT_FILTER_URL =
      BASE_URL + "/categorie/display";
  static final VERIFY_CATEGIRES = BASE_URL + "/categorie/verify";
  static final SERVICE_METEO_URL = BASE_URL + "/other-service/getMeteo";

  static final ADD_VIEW_AERTICLE_URL = BASE_URL + "/actualite/addView";
  static final GET_ACTUALITE_URL = BASE_URL + "/actualite/getActualite";
  static final GET_ACTUALITE_BY_CATEGORIE_URL = BASE_URL + "/actualite/getActualiteByCategorie";
  static final GET_ACTUALITE_DETAILS_URL = BASE_URL + "/actualite/getActualiteDetails";

  static final GET_COMMENT_ACTUALITE_URL = BASE_URL + "/client/getCommentAllInfo";
  static final GET_OTHER_CLIENT_FOR_DISPLAY_SHOP_URL = BASE_URL + "/client/getOtherClientForDisplayShop";
  static final GET_VERIFY_ITEM_IN_FAVOR_URL = BASE_URL + "/client/verifyIfExistItemInFavor";
  static final ADD_OR_REMOVE_ITEM_IN_FAVORITE_URL = BASE_URL + "/client/addOrRemoveItemInFavorite";
  static final SET_DEALS_URL = BASE_URL + "/products/inside";
  static final ARCHIVE_DEALS_URL = BASE_URL + "/products/archiver";
  static final GET_DETAILS_URL = BASE_URL + "/products/getDetailsOfProduct";
  static final GET_DETAILS_DEALS_FOR_LINK_URL = BASE_URL + "/products/getDetailsProductForLink";
  static final GET_SEARCH_ADVANCED_PRODUCTS_URL = BASE_URL + "/products/searchAdvancedProducts";
  static final GET_DETAILS_FOR_CHAT_URL = BASE_URL + "/products/getDetailsOfProductForChat";
  static final GET_PRODUCT_URL = BASE_URL + "/products/getProduct";



  static final GET_TRAVEL_URL = BASE_URL + "/travel/getTravel";
  static final VERIFY_ELIGBLE_FOR_CREATE_TRAVEL_URL = BASE_URL + "/travel/verifyIfEligible";
  static final DETAILS_TRAVEL_URL = BASE_URL + "/travel/detailsTravel";
  static final GET_ALL_TRAVEL_WHEN_VERIFY_SCAN_URL = BASE_URL + "/travel/getAllTravelWhenVerifyScan";
  static final SET_TRAVEL_URL = BASE_URL + "/travel/inside";
  static final SET_BUY_TRAVEL_URL = BASE_URL + "/travel/buyTravel";
  static final STOP_TRAVEL_URL = BASE_URL + "/travel/stopTravel";
  static final DECODE_TRAVEL_BY_SCAN_URL = BASE_URL + "/travel/decodeTicketByScan";
  static final DECODE_BY_NUMBER_FOR_TRAVEL_URL = BASE_URL + "/travel/decodeTicketByNumero";
  static final GET_DETAILS_FOR_TRAVEL_URL = BASE_URL + "/travel/getDetailsOfTravelt";


  // Assets File URL
  static final AssetProfilServer = BASE_URL + "/profil/";
  static final AssetTravelServer = BASE_URL + "/travel/";
  static final AssetTravelBuyerServer = BASE_URL + "/travel/ticket/";
  static final AssetProductServer = BASE_URL + "/store/";
  static final AssetEventServer = BASE_URL + "/event/";
  static final AssetBuyEventServer = BASE_URL + "/event/buy/";
  static final AssetCovoiturageServer = BASE_URL + "/covoiturage/";
  static final AssetPublicServer = BASE_URL + "/public/";
  static final AssetConversationServer = BASE_URL + "/public/conversation/";
  // For Deep Link
  static final ProductLink = BASE_URL + "/app/deals/";
  static final EventLink = BASE_URL + "/app/event/";
  static final TravelLink = BASE_URL + "/app/travel/";
  static final NewsLink = BASE_URL + "/app/new/";

  //static final _API_KEY = "somerandomkey";

  ConsumeAPI() {}
  // For signin
  signin(String numero, String password) {
    return _netUtil.post(signinUrl, body: {"numero": numero, "password": password}).then((dynamic res) {
      return res;
    });
  }

  // For signin
  Future<dynamic> validatePaiement(String typeReseau, String numero, String montant, String ref) async {
    final prefs = await SharedPreferences.getInstance();
    final String id = prefs.getString('ident') ?? "";
    final String recovery = prefs.getString('recovery') ?? "";
    return _netUtil.post(signinUrl, body: {"numero": numero, "typeReseau": typeReseau, "montant": montant, "ref":ref, "id":id,"recovery":recovery}).then((dynamic res) {
      return res;
    });
  }

  // For Categorie
  Future<List<dynamic>> getAllCategrie(
      [String search = "", String sort = 'not', String domaine = '3']) async {

    final res = await _netUtil.get(
        '$ALL_CATEGIRES_URL/search=$search&sort=$sort&domaine=$domaine');
    //List<dynamic> allCategorie = res['result'].map((c) => Categorie.fromJson(c)).toList();
    return [];
  }

}
