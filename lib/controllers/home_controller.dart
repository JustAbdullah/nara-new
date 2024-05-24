import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nara_test/core/data/model/celeb.dart';
import 'package:nara_test/views/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nara_test/views/testin_after.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../core/class/class/crud.dart';
import '../core/data/model/brands.dart';
import '../core/data/model/cart_shop.dart';
import '../core/data/model/order.dart';
import '../core/data/model/products.dart';
import '../core/data/model/the_colors.dart';
import '../core/functions/data_base_local.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/screens/change_password.dart';
import '../views/screens/manage_the_products_user.dart';
import '../views/widgets/manage_the_products/manage_options.dart';
//import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool makeThePageAni = false.obs;

/////////////
  String addPassword = "";
  String addName = "";

  TextEditingController? nameLoginController;

  TextEditingController? passwordLoginController;
  ////////
  RxBool isRealyGogin = false.obs;
  // AppServices appServices = Get.find();
  final crud = Crud();
  final product = Products();
  final celebs = Celebs();
  final cartShop = CartShop();

  final Thebrand = TheBrands();

  final theOrder = Orders();

  final theColors = ColorsData();

  ////////////The Orders Info//////////////////////
  String? idorderAdd;

  String? id_of_orderAdd;
  String totalAdd = "";
  String totalAddM = "";

  String? order_statusAdd;
  String? how_to_payAdd;

  ////////////

  AppServices appServices = Get.find();
  DataBaseLocal datasql = DataBaseLocal();

  late int ind;

  RxString offerNumberOneIamgeArModeLight = "".obs;
  RxString offerNumberTwoIamgeArModeLight = "".obs;
  RxString offerNumberThreeIamgeArModeLight = "".obs;
  RxString offerNumberFourIamgeArModeLight = "".obs;

  RxBool viewTheDetilas = false.obs;

  RxBool showTheTypes = false.obs;

  RxBool showAccount = false.obs;
//////////////Auth///////////////////////////////
  RxBool SignUpAuth = false.obs;
  RxBool LogInAuth = false.obs;

  GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formSign = GlobalKey<FormState>();

  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
////////////////Auth Account //////////////
  ///
//

  RxInt isNullVel = 0.obs;
  RxBool loadingCreateAccount = false.obs;
  String nameUser = "";
  RxString nameUserInMomorey = "".obs;

  String addUserName = "";
  String passwordUser = "";
  String emailUser = "";
  String phone = "";
  RxInt theSix = 1.obs;
  RxInt chooesSix = 1.obs;
  RxBool changeTheCountry = false.obs;
  RxInt whatIsChoesAboutTheCountry = 5.obs;
  RxBool isAreadyCreateAccount = false.obs;

  RxBool youDontEnterData = false.obs;

  RxBool isAreadyLoginAccount = false.obs;
  RxBool youDontEnterDataLogin = false.obs;
  RxBool errorAboutTheAccountLogin = false.obs;

  RxBool loadingLoginAccount = false.obs;

  ////////////////TheDataUser From Database//////////////////
  RxInt IDUserFromDataBase = 0.obs;

  RxString nameUserFromDataBase = "".obs;
  RxString passwordUserFromDataBase = "".obs;
  RxString emailUserFromDataBase = "".obs;
  RxString phoneFromDataBase = "".obs;
  RxInt is_write_address = 0.obs;
  RxInt theSixFromDataBase = 1.obs;
  RxInt isHaveAccount = 1.obs;
  RxString theResidenceArea = "".obs;
  RxString Street = "".obs;
  RxString HomeNumber = "".obs;
  RxInt whatIsCountry = 0.obs;

  RxString codeFromDataBase = "".obs;
  RxString ratioFromDataBase = "".obs;
  RxString amountFromDataBase = "".obs;

  RxInt isHaveRightAccess = 0.obs;

  RxBool WearningAboutAccountTheUserHave = false.obs;
  RxBool WearningAboutAccessRight = false.obs;
  RxBool isNotHaveAnyAccount = false.obs;
  ////////////////////////////The Account Options/////////////////////

  RxBool infoAboutTheAccount = false.obs;
  RxBool infoAboutAddress = false.obs;
////////////////////Address filed ///////////////////
  GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  TextEditingController? residence_area;
  TextEditingController? street;
  TextEditingController? home_number;
  String residence_areaAddToDatabase = "";
  String streetAddToDatabase = "";
  RxBool loadingTheAddress = false.obs;
  RxBool isAddIntoDatabaseTheAddress = false.obs;

  String home_numberAddToDatabase = "";
  String positionlatitudeAddToDatabase = "";
  String positionlongitudeAddToDatabase = "";

////////////////////CelebritiesList

  RxBool celebritiesTheList = false.obs;
  RxBool viewTheDetilasCelebs = false.obs;

////////////////////////////Shopping Cart  /////////////

  RxBool getAreadyToAddTheShoppingCart = false.obs;
  RxBool waitToOpenAddTheShoppingCart = false.obs;
  int priceSm = 0;
  int num = 0;

  double priceSm1 = 0;
  double num1 = 0;
  RxInt quProduct = 1.obs;

  RxInt randomNumber = 1.obs;
  RxBool isTheEndOfShoppingCart = false.obs;
  RxBool isAddIntoTheCartShopping = false.obs;
  RxBool isAddIntoTheCartShoppingWaiting = false.obs;
  int totalPrice = 0;
  int totalPriceNN = 0;

  RxBool isAddThetotalPriceToMemory = false.obs;

  int indexShoppingCart = 0;

  RxBool isLoadingAddIntoTheShoppingCart = false.obs;

  RxBool isAddTheShoppingCartIntoTheOrder = false.obs;

/////////////////////////////////////Account The Shopping cart-order ////////////
//////////ORders
  RxBool TheShoppingCartList = false.obs;
  RxBool OrderList = false.obs;
  RxBool OrderDetails = false.obs;
  RxBool OrderCompleteOrdersProcess = false.obs;

  RxBool OrderInfo = true.obs;

  RxBool OrderInfoShoppingCart = false.obs;

  RxBool OrderAddress = false.obs;
  RxBool OrderProcess = false.obs;

  RxInt howtoPay = 0.obs;
  ///////////internet--offline/////////////////
  RxBool isNotInternet = false.obs;

//////////////Change The Lang/////////////
  RxBool thelanguageList = false.obs;

  RxBool isChooesImage = false.obs;

////////////////////////////////////////////////The Products Types /////////////////
  RxBool showTheProductTypeOneClothes = false.obs;
  RxBool checkAboutTheProductTYpeOne = false.obs;
  RxBool showTheProductTypeTwoShoes = false.obs;
  RxBool checkAboutTheProductTYpeTwo = false.obs;
  RxBool showTheProductTypeThreeSports = false.obs;
  RxBool checkAboutTheProductTYpeThree = false.obs;
  RxBool showTheProductTypeFourPerfumes = false.obs;
  RxBool checkAboutTheProductTYpeFour = false.obs;

  RxBool subTypeProductOne = false.obs;
  RxBool subTypeProductTwo = false.obs;
  RxBool subTypeProductThree = false.obs;
  RxBool subTypeProductFour = false.obs;
  RxBool subTypeProductFive = false.obs;
  RxBool subTypeProductSix = false.obs;

  RxBool showTheProductUsers = false.obs;

  RxBool emptyshowTheProductUsers = false.obs;

/////////////// The PageView Top Screen Home /////////////////
  ///
  ///
  late PageController ThepageController;
  RxInt ThecurrentIndex = 0.obs;
//////////////////

  RxBool DetailsBrands = false.obs;

///////////////////Address Info //////////

  ////////////////////The  Searching into App /////////////
  late TextEditingController searchingTheTypes;
  late TextEditingController searchingTheCelebs;
  late TextEditingController searchingTheBrands;
  RxBool isTheUserIsWantSearhingProducts = false.obs;
  RxBool isTheUserIsWantSearhingBrands = false.obs;
  RxBool isTheUserIsWantSearhingCelebs = false.obs;
  RxString TheNameProductsToSearching = "".obs;
  RxString TheNameBrandsToSearching = "".obs;
  RxString TheNameCelebsToSearching = "".obs;
///////////////////////////////////
///////// The Manage Products User ////////////////////////////////

  RxBool showTheAddPage = false.obs;
  RxBool showTheEditPage = false.obs;
  RxBool showTheMyOrdersByUSers = false.obs;

  RxBool ManageThePageProductsUers = false.obs;
  RxBool emtpyTheOrdersUsers = false.obs;

  RxBool TheOptionsOfTheProduct = false.obs;

  RxBool isHaveUsersProducts = false.obs;

  GlobalKey<FormState> addProducts = GlobalKey<FormState>();
  TextEditingController? id_type;
  TextEditingController? id_subtype;
  TextEditingController? id_brand;
  TextEditingController? name_product;
  TextEditingController? name_product_en;
  TextEditingController? body_product_en;
  TextEditingController? body_product;
  TextEditingController? price_product;
  TextEditingController? old_price;
  TextEditingController? image_product;

  String id_type_AddDataBase = "";
  String id_subtype_AddDataBase = "";
  String id_brand_AddDataBase = "";
  String name_product_AddDataBase = "";
  String name_product_en_AddDataBase = "";
  String body_product_en_AddDataBase = "";
  String body_product_AddDataBase = "";
  String price_product_AddDataBase = "";
  String old_price_AddDataBase = "";
  String image_product_AddDataBase = "";

  /////////////Options The Products Types- Options The subTypes- Options The brands/////////////////

  RxInt OptionTheProductType = 5.obs;
  RxInt OptionTheProductSubType = 0.obs;
  RxInt OptionTheProductBrands = 0.obs;

////////////////////////////isLoading add to The database - and is Alreadyadd -edit The product -is aleady edit ---Producrs Users///

  RxBool loadingUploadToDatabase = false.obs;
  RxBool isAlreadyUploadToDatabase = false.obs;
  RxBool loadingEditToDatabase = false.obs;
  RxBool isAlreadyEditToDatabase = false.obs;
  ////////////////////////Is data empty - shopping cart- order - con order////////////////////////////

  RxBool isShoppingCartEmpty = false.obs;
  RxBool isOrdersEmpty = false.obs;

  ////////////////////////////////////////////////  //////////////Complete process Order ////////////

  RxString CompleteProcessIdOfOrder = "".obs;
  RxString CompleteProcessTotal = "".obs;
  RxInt CompleteProcessPaymentProcess = 0.obs;
  RxInt CompleteProcessHowToPay = 0.obs;
  RxString CompleteProcessDateOfArrival = "".obs;

/////////////////////////////////////////////////The ProductsColors-Sizes/////////////////////////////////
  RxBool isHaveTheProductColor = false.obs;
  RxBool isHaveTheProductSize = false.obs;
  RxBool TheListOfcolorsProducts = false.obs;
  RxBool TheListOfSizesProducts = false.obs;

  String idTheProduct = "";
  RxInt whatIsChoseTheIDOfTheColor = 0.obs;
  RxInt whatIsChoseTheIDOfTheSize = 0.obs;

//////////////////////////The PhoneNumber-Check && Edit Return.............................................////////////////

  TextEditingController? phoneCheck;
  TextEditingController? newPassword;
  RxBool loadingTheCheck = false.obs;
  RxBool loadingThenewPassword = false.obs;

  RxBool isAlreadyChangeThePassword = false.obs;
  String thePhoneCheck = "";
  String thePasswordNew = "";

  RxString theNameCheck = "".obs;
  RxInt theIdCheck = 0.obs;

////////////////////////More account manage///////////////////
  RxBool theListOFCoins = false.obs;

  RxInt theCoins = 1.obs;
  RxString theNameOfCoins = "SAR".obs;
  int theOldNPrice = 0;
  int theNPrice = 0;
  double theOldPrice = 0.0;
  double thePrice = 0.0;
//////////////////////////////Edit The Product///////////////////////

  String nameProductAr = "";
  String nameProductEn = "";
  String bodyProductAr = "";
  String bodyProductEn = "";
  String priceNew = "";
  String priceOld = "";
  int thetype = 0;
  int thesubtype = 0;
  int thebrand = 0;
  String image = "";
  String idPro = "";

  //////////////////////////
  RxBool isnothaveTheaccessRigthtoAddIntoShoppingCart = false.obs;
  /////////////////////////add images////////
  var filename;
  makeAniTrue() async {
    await Future.delayed(Duration(seconds: 10), () async {
      makeThePageAni.value = true;
    });
  }

  ///////////////////TheProducts And Types
  getAllDataProducts() async {
    var response = await crud.postRequest(AppLinksApi.getTheProducts, {});
    return response;
  }

  getAllDataProductsSearching(String search) async {
    var response = await crud.postRequest(AppLinksApi.search, {
      'name_product': search.toString(),
    });
    return response;
  }

//////////////The SearchingAll////////////////////////
  getAllDataProductsSearchingTypes(String Thesearch) async {
    var response = await crud.postRequest(AppLinksApi.search, {
      'name_product': Thesearch.toString(),
    });
    return response;
  }

  getAllDataBrandsSearchingTypes(String Thesearch) async {
    var response = await crud.postRequest(AppLinksApi.searchBrands, {
      'name_brand_ar': Thesearch.toString(),
    });
    return response;
  }

  getAllDataCelebsSearchingTypes(String Thesearch) async {
    var response = await crud.postRequest(AppLinksApi.searchCeleb, {
      'name_celebrities': Thesearch.toString(),
    });
    return response;
  }

/////////////////////////////////////////////
  getAllDataProductsClothes() async {
    var response =
        await crud.postRequest(AppLinksApi.getTheClothesProducts, {});

    if (response['status'] == "fail") {
      checkAboutTheProductTYpeOne.value = true;
    } else {
      checkAboutTheProductTYpeOne.value = false;
    }
    return response;
  }

  getAllDataProductsShoes() async {
    var response = await crud.postRequest(AppLinksApi.getTheShoesProducts, {});
    if (response['status'] == "fail") {
      checkAboutTheProductTYpeTwo.value = true;
    } else {
      checkAboutTheProductTYpeTwo.value = false;
    }
    return response;
  }

  getAllDataProductsSports() async {
    var response = await crud.postRequest(AppLinksApi.getTheSportsProducts, {});

    if (response['status'] == "fail") {
      checkAboutTheProductTYpeThree.value = true;
    } else {
      checkAboutTheProductTYpeThree.value = false;
    }
    return response;
  }

  getAllDataProductsPerfumes() async {
    var response =
        await crud.postRequest(AppLinksApi.getThePerfumesProducts, {});
    if (response['status'] == "fail") {
      checkAboutTheProductTYpeFour.value = true;
    } else {
      checkAboutTheProductTYpeFour.value = false;
    }
    return response;
  }

  //////////////////////////GetSubTypes/////////////////
//////////t-shirt/////
  getAllDataProductsSubtypeOne() async {
    var response =
        await crud.postRequest(AppLinksApi.getDataProductsSubTypeOne, {});

    if (response['status'] == "fail") {
      subTypeProductOne.value = true;
    } else {}
    return response;
  }

///////////////////dresss
  getAllDataProductsSubtypetwo() async {
    var response =
        await crud.postRequest(AppLinksApi.getDataProductsSubTypeTwo, {});

    if (response['status'] == "fail") {
      subTypeProductTwo.value = true;
    } else {}
    return response;
  }

////////////pa/////////////

  getAllDataProductsSubtypethree() async {
    var response =
        await crud.postRequest(AppLinksApi.getDataProductsSubTypeThree, {});

    if (response['status'] == "fail") {
      subTypeProductThree.value = true;
    } else {}
    return response;
  }

////////////////jac
  getAllDataProductsSubtypefour() async {
    var response =
        await crud.postRequest(AppLinksApi.getDataProductsSubTypeFour, {});

    if (response['status'] == "fail") {
      subTypeProductFour.value = true;
    } else {}
    return response;
  } //////////////bags

  getAllDataProductsSubtypeSix() async {
    var response =
        await crud.postRequest(AppLinksApi.getDataProductsSubTypeSix, {});

    if (response['status'] == "fail") {
      subTypeProductSix.value = true;
    } else {}
    return response;
  }
//////////

  getAllDataCelebrities() async {
    var response = await crud.postRequest(AppLinksApi.getTheCelebrities, {});
    return response;
  }

  getAllDataBrands() async {
    var response = await crud.postRequest(AppLinksApi.getTheBrands, {});
    return response;
  }

//////////////
  onPageChange(RxInt index) {
    ThecurrentIndex.value = index.value;
  }

  TheOffers() async {
    var responses = await crud.postRequest(AppLinksApi.getOffer, {});

    return responses;
  }

  @override
  void onInit() {
    getCelebsName();
    searchingTheTypes = TextEditingController();
    searchingTheCelebs = TextEditingController();
    searchingTheBrands = TextEditingController();

    ThepageController = PageController();
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      /* Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (makeThePageAni.value == true) {
          if (ThecurrentIndex.value < 3) {
            ThecurrentIndex.value++;
            ThepageController.animateToPage(
              ThecurrentIndex.value,
              duration: Duration(milliseconds: 2350),
              curve: Curves.easeIn,
            );
          } else {
            ThecurrentIndex.value = 0;
            ThepageController.animateToPage(
              ThecurrentIndex.value,
              duration: Duration(milliseconds: 2350),
              curve: Curves.easeIn,
            );
          }
        }
      });*/

      Timer.periodic(Duration(seconds: 1), (Timer timer) {
        TheOffers();
        getTheOffer();
      });

      Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (appServices.sharedPreferences.containsKey('username')) {
          nameUserInMomorey.value =
              appServices.sharedPreferences.getString('username') as String;
          GetDataUser(nameUserInMomorey.value.toString());
        }
      });
    });

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (appServices.sharedPreferences
          .containsKey('isMakeAnewNumberOfOrder')) {
        isTheEndOfShoppingCart.value = appServices.sharedPreferences
            .getBool('isMakeAnewNumberOfOrder') as bool;
      }
    });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (appServices.sharedPreferences
          .containsKey('isAddViewCartNumberOFOrder')) {
        randomNumber.value = appServices.sharedPreferences
            .getInt('isAddViewCartNumberOFOrder') as int;
      }
    });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {});

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (appServices.sharedPreferences.containsKey('TheCoins')) {
        theCoins.value =
            appServices.sharedPreferences.getInt('TheCoins') as int;

        if (theCoins.value == 1) {
          theNameOfCoins.value = "SAR";
        } else if (theCoins.value == 2) {
          theNameOfCoins.value = "KWD";
        }
      }
    });
  }

  addViewCartIntoStorageMemory() {
    if (isTheEndOfShoppingCart.value == false) {
      Random random = new Random();
      randomNumber.value = random.nextInt(10000000);
      appServices.sharedPreferences.setBool('isMakeAnewNumberOfOrder', true);
      appServices.sharedPreferences
          .setInt('isAddViewCartNumberOFOrder', randomNumber.value);
      isTheEndOfShoppingCart.value = true;
    } else {}
  }

  removeViewCartFromStorageMemory() {
    isTheEndOfShoppingCart.value = false;
    randomNumber.value = 0;
    appServices.sharedPreferences.remove("isMakeAnewNumberOfOrder");
    appServices.sharedPreferences.remove("isAddViewCartNumberOFOrder");
  }

  getTheOffer() async {
    var response = await TheOffers();
//////////////One..........
    offerNumberOneIamgeArModeLight.value =
        response['data'][0]['image_offer'].toString();

    ////////////Two..................
    offerNumberTwoIamgeArModeLight.value =
        response['data'][1]['image_offer'].toString();

    ////////////Three..................

    return response;
  }

////////////////////////Auth////////////////////////

/////////////////////////Offline////////////

  Future deletDataSqlLite() async {
    datasql.deleteData("DELETE FROM products");
  }
//////////////////// Insert Products From Last Version from MySql DataBase   To DataSqlLite Local  .../////////

  /* Future insertData(int indexOFData) async {
    var url = Uri.parse(AppLinksApi.viewProducts);
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      for (int i = 0; i <= indexOFData; i++) {
        final body = jsonDecode(response.body);

        var id = body['data'][i]['id_product'].toString();
        var id_type = body['data'][i]['id_product_type'].toString();
        var name = body['data'][i]['name_product'].toString();
        var name_en = body['data'][i]['name_product_en'].toString();
        var body_en = body['data'][i]['body_product_en'].toString();
        var bodys = body['data'][i]['body_product'].toString();
        var price = body['data'][i]['price_product'].toString();
        var image = body['data'][i]['image_product'].toString();

        datasql.insertData(
            '''INSERT INTO products(id_product,id_product_type,name_product,name_product_en,body_product_en,body_product,price_product,image_product)
                                                   VALUES("$id", "$id_type", "$name", "$name_en", "$body_en", "$bodys", "$price", "$image" )''');

        print("r$response");

        print(
            "========================================================================Add${i}=========================");
      }
    } else {
      print("Failed");
    }
  }
*/
///////////////////////////// Show Data From SqlLite On Home --OffLine Mode ////////////////
  Future<List<Map>> GetDataFromSqLite() async {
    print(
        "========================================================================------------------------------=========================");
    List<Map> respons = await datasql.readDataTypeOne();
    return respons;
  }

  openTheShoppingCart() {
    waitToOpenAddTheShoppingCart.value = true;
    Future.delayed(Duration(seconds: 1), () async {
      waitToOpenAddTheShoppingCart.value = false;
      getAreadyToAddTheShoppingCart.value = true;
    });
  }

  RemoveThequantityOfProducts() {
    if (quProduct.value != 1) {
      quProduct.value = quProduct.value - 1;
      priceSm1 = priceSm1 - num1;

      priceSm = priceSm - num;

      update();
    } else {}
  }

  AddThequantityOfProducts() {
    quProduct.value = quProduct.value + 1;
    priceSm1 = priceSm1 + num1;
    priceSm = priceSm + num;

    update();
  }

  AddToTheListOFShoppingCart(
      String idProdcut,
      String quantity,
      String idOfTheColor,
      String idOfSize,
      String totalTheProduct,
      String TheNumberOfOrderShopping) async {
    isAddIntoTheCartShoppingWaiting.value = true;
    var response = await crud.postRequest(AppLinksApi.addIntoCartShopping, {
      'id_user': IDUserFromDataBase.value.toString(),
      'id_product': idProdcut.toString(),
      'id_order_shopping_cart': TheNumberOfOrderShopping.toString(),
      'quantity_cart': quantity.toString(),
      'id_color': idOfTheColor.toString(),
      'id_size': idOfSize.toString(),
      'total': totalTheProduct.toString(),
    });

    if (response['status'] == "success") {
      Future.delayed(Duration(seconds: 1), () async {
        isAddIntoTheCartShoppingWaiting.value = false;
        getAreadyToAddTheShoppingCart.value = false;
        isAddIntoTheCartShopping.value = true;
        priceSm = 0;
        num = 0;
        quProduct.value = 1;
      });
    } else {
      isAddIntoTheCartShoppingWaiting.value = false;
      getAreadyToAddTheShoppingCart.value = false;

      priceSm = 0;
      num = 0;
      quProduct.value = 1;
    }

    return response;
  }

  getDataShoppingCart(String idUSer) async {
    var responses = await crud.postRequest(
        AppLinksApi.getInfoShoppingCart, {'id_user': idUSer.toString()});

    if (responses['status'] == "success") {
      isShoppingCartEmpty.value = true;
    } else {
      isShoppingCartEmpty.value = false;
    }
    return responses;
  }

  RxBool noDataColList = false.obs;

  getDataCollections(String idCleb) async {
    var responses = await crud.postRequest(
        AppLinksApi.getCollection, {'id_celebrities': idCleb.toString()});
    if (responses['status'] == "success") {
      noDataColList.value = false;
    } else {
      noDataColList.value = true;
    }
    return responses;
  }

////////////
  RxBool noDataBrandList = false.obs;

  getDataProductsBrands(String idBrands) async {
    var responses = await crud.postRequest(
        AppLinksApi.getBrandProducts, {'id_brand': idBrands.toString()});

    if (responses['status'] == "success") {
      noDataBrandList.value = false;
    } else {
      noDataBrandList.value = true;
    }
    return responses;
  }

  /////////////////////////Auth The Accounts//////////////////////////

  createAccountApi(String nameUSerNew, int chooes) async {
    var formKeyData = formSign.currentState;
    if (formKeyData!.validate()) {
      loadingCreateAccount.value = true;
      Random random = new Random();
      randomNumber.value = random.nextInt(10000000);
      var response = await crud.postRequest(AppLinksApi.singUpUser, {
        'name_user': nameUSerNew.toString(),
        'email': emailUser.toString(),
        'phone': phone.toString(),
        'password': passwordUser.toString(),
        'type_of_six': chooes.toString(),
        'code': randomNumber.toString(),
      });
///////
      if (response['status'] == "success") {
        Future.delayed(Duration(seconds: 3), () async {
          GetDataUser(
            nameUSerNew.toString(),
          );

          appServices.sharedPreferences.setInt('TheWay', 1);
          appServices.sharedPreferences
              .setString('username', nameUSerNew.toString());
          loadingCreateAccount.value = false;
          isAreadyCreateAccount.value = true;
          isHaveAccount.value = 2;
        });
      }

      return response;
    } else {
      youDontEnterData.value = true;
    }
  }

  addTheAddressTheUser(String reside, String street, String homenumber) async {
    var formKeyData = addressKey.currentState;
    if (formKeyData!.validate()) {
      loadingTheAddress.value = true;
      var response = await crud.postRequest(AppLinksApi.addAddress, {
        'id_user': IDUserFromDataBase.value.toString(),
        'is_write_address': "2".toString(),
        'residence_area': reside.toString(),
        'street': street.toString(),
        'home_number': homenumber.toString(),
      });

      if (response['status'] == "success") {
        loadingTheAddress.value = false;
        isAddIntoDatabaseTheAddress.value = true;
      }

      return response;
    } else {}
  }

  LoginAccountApiNew(String name, String pass) async {
    var formKeyData = formLogin.currentState;
    if (formKeyData!.validate()) {
      loadingLoginAccount.value = true;
      var response = await crud.postRequest(AppLinksApi.login, {
        'name_user': name.toString(),
        'password': pass.toString(),
      });
///////
      if (response['status'] == "success") {
        Future.delayed(Duration(seconds: 3), () async {
          loadingLoginAccount.value = false;
          isAreadyLoginAccount.value = true;
          isHaveAccount.value = 2;
          appServices.sharedPreferences.setInt('TheWay', 1);
          appServices.sharedPreferences.setString('username', name.toString());
          GetDataUser(name.toString());
        });
      } else {
        loadingLoginAccount.value = false;
        errorAboutTheAccountLogin.value = true;
      }

      return response;
    } else {
      loadingLoginAccount.value = false;
      youDontEnterDataLogin.value = true;
    }
  }

  GetDataUser(String name) async {
    var response = await crud.postRequest(
        AppLinksApi.getTheDataUser, {'name_user': name.toString()});

    if (response['status'] == "success") {
      IDUserFromDataBase.value =
          int.parse(response['data'][0]['id_user'].toString());
      nameUserFromDataBase.value = response['data'][0]['name_user'].toString();
      emailUserFromDataBase.value = response['data'][0]['email'].toString();
      phoneFromDataBase.value = response['data'][0]['phone'].toString();

      is_write_address.value =
          int.parse(response['data'][0]['is_write_address'].toString());
      theSixFromDataBase.value =
          int.parse(response['data'][0]['type_of_six'].toString());

      theResidenceArea.value = response['data'][0]['residence_area'].toString();
      Street.value = response['data'][0]['street'].toString();
      HomeNumber.value = response['data'][0]['home_number'].toString();
      codeFromDataBase.value = response['data'][0]['code'].toString();
      ratioFromDataBase.value = response['data'][0]['ratio'].toString();
      amountFromDataBase.value = response['data'][0]['amount'].toString();

      whatIsCountry.value =
          int.parse(response['data'][0]['what_is_country'].toString());
      isHaveRightAccess.value =
          int.parse(response['data'][0]['is_have_right_access'].toString());

      isHaveAccount.value = 2;
    } else {}

    return response;
  }

  addToOrder(String idOfOrder, String total, String idUserCode) async {
    isLoadingAddIntoTheShoppingCart.value = true;
    var response = await crud.postRequest(AppLinksApi.createTheOrder, {
      'id_user': IDUserFromDataBase.value.toString(),
      'id_of_order': idOfOrder.toString(),
      'total': total.toString(),
      'id_user_code': idUserCode.toString()
    });
    if (response['status'] == "success") {
      condeController.clear();
      isHaveCode.value = false;
      priceTOtleNEw = 0;
      changeTheStatusOfShoppingCart();
      isAddThetotalPriceToMemory.value = false;
      indexShoppingCart = 0;
      totalPrice = 0;
    } else {}

    return response;
  }

  changeTheStatusOfShoppingCart() async {
    var response = await crud
        .postRequest(AppLinksApi.changeTheShoppingCartStatusTOIsOrder, {
      'id_user': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
      isLoadingAddIntoTheShoppingCart.value = false;
      isAddTheShoppingCartIntoTheOrder.value = true;
      removeViewCartFromStorageMemory();
    } else {}

    return response;
  }

  getOrderData() async {
    var response = await crud.postRequest(AppLinksApi.getTheOrderUser, {
      'id_user': IDUserFromDataBase.value.toString(),
    });

    if (response['status'] == "success") {
      isOrdersEmpty.value = false;
    } else {
      isOrdersEmpty.value = true;
    }

    return response;
  }

  getShoppingCartOrder(String idOfORderNew) async {
    var response =
        await crud.postRequest(AppLinksApi.getShoppingCartIntoOrder, {
      'id_order_shopping_cart': "${idOfORderNew}".toString(),
    });

    return response;
  }

  makeTheOrderIsConfim(String idOrder, int howToPay) async {
    var response = await crud.postRequest(AppLinksApi.makeTheOrderReady, {
      'id_order': idOrder.toString(),
      'how_to_pay': howToPay.toString(),
      'id_user': IDUserFromDataBase.value.toString(),
    });

    if (response['status'] == "success") {
      OrderDetails.value = false;
      OrderList.value = false;
      OrderAddress.value = false;
      OrderProcess.value = false;
    } else
      return response;
  }

  addTheProducts(
      String nameProductAr,
      String nameProductEn,
      String bodyProductAr,
      String bodyProductEn,
      String priceNew,
      String priceOld,
      int thetype,
      int thesubtype,
      int thebrand,
      String image) async {
    loadingUploadToDatabase.value = true;
    var formKeyData = addProducts.currentState;
    if (formKeyData!.validate()) {
      var response = await crud.postRequest(AppLinksApi.addProductsFromUser, {
        'id_add_by': IDUserFromDataBase.value.toString(),
        'id_type': thetype.toString(),
        'id_subtype': thesubtype.toString(),
        'id_brand': thebrand.toString(),
        'name_product': nameProductAr.toString(),
        'name_product_en': nameProductEn.toString(),
        'body_product': bodyProductAr.toString(),
        'body_product_en': bodyProductEn.toString(),
        'price_product': priceNew.toString(),
        'old_price': priceOld.toString(),
        'image_product': "https://larra.xyz/images_nara/${image.toString()}",
      });
      if (response['status'] == "success") {
        Future.delayed(Duration(seconds: 3), () async {
          loadingUploadToDatabase.value = false;

          isAlreadyUploadToDatabase.value = true;

          Get.offAll(ManageTheProductsByTheUser());
        });
      } else {}

      return response;
    }
  }

  getTheUserProducts() async {
    var responses = await crud.postRequest(AppLinksApi.getProductsFromUser, {
      'id_add_by': IDUserFromDataBase.value.toString(),
    });
    if (responses['status'] == "success") {
      isHaveUsersProducts.value = true;
    } else {
      isHaveUsersProducts.value = false;
    }

    return responses;
  }

  deleteProductUser(String idProduct) async {
    var response = await crud.postRequest(AppLinksApi.deleteFromProduct, {
      'id_add_by': IDUserFromDataBase.value.toString(),
      'id_product': idProduct.toString(),
    });
    if (response['status'] == "success") {
      TheOptionsOfTheProduct.value = false;
      Get.to(ManageOptions());
    } else {}

    return response;
  }

  //////////

  editTheProductUser() async {
    loadingEditToDatabase.value = true;

    var response = await crud.postRequest(AppLinksApi.editDataProductUser, {
      'id_add_by': IDUserFromDataBase.value.toString(),
      'id_type': thetype.toString(),
      'id_subtype': thesubtype.toString(),
      'id_brand': thebrand.toString(),
      'name_product': nameProductAr.toString(),
      'name_product_en': nameProductEn.toString(),
      'body_product': bodyProductAr.toString(),
      'body_product_en': bodyProductEn.toString(),
      'price_product': priceNew.toString(),
      'old_price': priceOld.toString(),
      'image_product': image.toString(),
      'id_product': idPro.toString(),
    });
    if (response['status'] == "success") {
      Future.delayed(Duration(seconds: 3), () async {
        loadingEditToDatabase.value = false;

        isAlreadyEditToDatabase.value = true;

        Get.offAll(ManageTheProductsByTheUser());
      });
    } else {
      loadingEditToDatabase.value = false;
    }

    return response;
  }

  //////////////Complete process Order ////////////
  addIntoCompleteprocessOrder(
    String id_order,
    String id_of_order,
    String total,
    String how_to_pay,
  ) async {
    var response =
        await crud.postRequest(AppLinksApi.addintocompleteordersprocess, {
      'id_order': id_order.toString(),
      'id_user_id': IDUserFromDataBase.value.toString(),
      'id_of_order': id_of_order.toString(),
      'total': total.toString(),
      'how_to_pay': how_to_pay.toString(),
    });
    if (response['status'] == "success") {
      howtoPay.value = 0;
    } else {}

    return response;
  }

  getCompleteprocessOrder(String idOfOeder) async {
    var response =
        await crud.postRequest(AppLinksApi.getcompleteordersprocess, {
      'id_user': IDUserFromDataBase.value.toString(),
      'id_of_order': idOfOeder.toString(),
    });

    if (response['status'] == "success") {
      CompleteProcessIdOfOrder.value =
          response['data'][0]['id_of_order'].toString();
      CompleteProcessTotal.value = response['data'][0]['total'].toString();
      CompleteProcessPaymentProcess.value =
          int.parse(response['data'][0]['payment_process'].toString());
      CompleteProcessHowToPay.value =
          int.parse(response['data'][0]['how_to_pay'].toString());
      CompleteProcessDateOfArrival.value =
          response['data'][0]['date_of_arrival'].toString();
      isHaveAccount.value = 2;
    } else {}

    return response;
  }

  deleteFromShoppingCart(
    String id_shoppingCart,
  ) async {
    var response = await crud.postRequest(AppLinksApi.deleteFromShoppingCart, {
      'id_shoppingCart': id_shoppingCart.toString(),
      'id_user': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
      totalPrice = 0;
      TheShoppingCartList.value = false;
    } else {}

    return response;
  }

  getColorsTheProducts(
    String id_product,
  ) async {
    var response = await crud.postRequest(AppLinksApi.getColorsProducts, {
      'id_product': id_product.toString(),
    });
    if (response['status'] == "success") {
      isHaveTheProductColor.value = true;
    } else {
      isHaveTheProductColor.value = false;
    }

    return response;
  }

  getSizesTheProducts(
    String id_product,
  ) async {
    var response = await crud.postRequest(AppLinksApi.getSizesProducts, {
      'id_product': id_product.toString(),
    });
    if (response['status'] == "success") {
      isHaveTheProductSize.value = true;
    } else {
      isHaveTheProductSize.value = false;
    }

    return response;
  }

  //////////////////////////////////////////////ForgetPassword-CheckNumberPhone..////////////////////////

  checknumber(String phone) async {
    loadingTheCheck.value = true;
    Future.delayed(Duration(seconds: 3), () async {
      var response = await crud.postRequest(AppLinksApi.checkThePhone, {
        'phone': phone.toString(),
      });

      if (response['status'] == "success") {
        loadingTheCheck.value = false;
        theNameCheck.value = response['data'][0]['name_user'].toString();

        theIdCheck.value = int.parse(response['data'][0]['id_user'].toString());

        Get.to(EditThePassword());
      } else {}

      return response;
    });
  }

  changeThePassword(String id, String password) async {
    loadingThenewPassword.value = true;
    Future.delayed(Duration(seconds: 3), () async {
      var response = await crud.postRequest(AppLinksApi.editThePassword, {
        'id_user': id.toString(),
        'password': password.toString(),
      });

      if (response['status'] == "success") {
        loadingThenewPassword.value = false;
        Get.to(Welcome());
      } else {}

      return response;
    });
  }

///////////////////
  whatIsTheCoinsOFTheApp() {
    if (theCoins.value == 1) {
      theNameOfCoins.value = "SAR";
    } else if (theCoins.value == 2) {
      theNameOfCoins.value = "KWD";
    }
    appServices.sharedPreferences.setInt('TheCoins', theCoins.value);
  }

  /////////////////Coins////////////////////////////

  getConis() async {
    var response = await crud.postRequest(AppLinksApi.getConis, {});

    //  theNameCheck.value = response['data'][0]['name_user'].toString();

    //   theIdCheck.value = int.parse(response['data'][0]['id_user'].toString());
  }

  /////////////////////Edit test //////////////////////////////////

  ttt() async {
    var response = await crud.postRequest(AppLinksApi.editDataProductUser, {
      'id_add_by': IDUserFromDataBase.value.toString(),
      'id_type': "6".toString(),
      'id_subtype': "2".toString(),
      'id_brand': "2".toString(),
      'name_product': "gghgh".toString(),
      'name_product_en': "gghgh".toString(),
      'body_product': "gghgh".toString(),
      'body_product_en': "gghgh".toString(),
      'price_product': "456".toString(),
      'old_price': "496".toString(),
      'image_product': "hello/png".toString(),
      'id_product': "111".toString(),
    });
    if (response['status'] == "success") {
      Future.delayed(Duration(seconds: 3), () async {});
    } else {}

    return response;
  }

  upIm(File? mfile) async {
    var response =
        await crud.postRequestFile(AppLinksApi.uploadimage, {}, mfile!);
  }

  logout() {
    appServices.sharedPreferences.clear();
    Get.offAll(Welcome());
  }

  getOrdersProductsTheUsers() async {
    var response =
        await crud.postRequest(AppLinksApi.getTheOrdersusersTOmyProducts, {
      'id_order_shopping_cart': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
      emtpyTheOrdersUsers.value = true;
    } else {
      emtpyTheOrdersUsers.value = false;
    }
    return response;
  }

  getProductsUsers() async {
    var response = await crud.postRequest(AppLinksApi.usersProducts, {});
    if (response['status'] == "success") {
      emptyshowTheProductUsers.value = true;
    } else {
      emptyshowTheProductUsers.value = false;
    }

    return response;
  }

  ////////////////////////////////////////////////////////

/////////////////////ApiKeys Stripe////////////////

  /*Future<void> paymentByStripe(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
*/
  /* Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "testing-id of order number is : 12344556}",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeysStripe.secretkey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }
*/
////////////////////////////////////////////////////
  RxDouble theOfCOunValue = 1.0.obs;
  RxString theNAmeOfCoun = "IQD".obs;
  RxInt theCoun = 5.obs;
  RxDouble thePriceProductOld = 1.0.obs;
  RxDouble thePriceProduct = 1.0.obs;
  /////////////
  RxDouble theCountPrice = 1.0.obs;

  changeTheCounToSAR() {
    // theOfCOunValue.value = 1.0;
    theNAmeOfCoun.value = "SAR";
    theCoun.value = 1;

    theCountPrice.value = 0.0028;
  }

  changeTheCounToKWD() {
    //   theOfCOunValue.value = 12.1581;
    theNAmeOfCoun.value = "KWD";
    theCoun.value = 2;
    theCountPrice.value = 0.00023;
  }

  changeTheCounToBHD() {
    // theOfCOunValue.value = 0.097 ;
    theNAmeOfCoun.value = "BHD";
    theCoun.value = 3;

    theCountPrice.value = 0.00029;
  }

  changeTheCounToOman() {
    // theOfCOunValue.value = 341.05;
    theNAmeOfCoun.value = "OMR";
    theCoun.value = 4;

    theCountPrice.value = 0.0003;
  }

  changeTheCounToIRQ() {
    // theOfCOunValue.value = 341.05;
    theNAmeOfCoun.value = "IQD";
    theCoun.value = 5;

    theCountPrice.value = 1;
  }

  changeTheCounToIUAE() {
    //   theOfCOunValue.value = 0.95 ;
    theNAmeOfCoun.value = "AED";
    theCoun.value = 6;
    theCountPrice.value = 0.0028;
  }

  changeTheCounToQTR() {
    // theOfCOunValue.value = 341.05;
    theNAmeOfCoun.value = "QAR";
    theCoun.value = 7;

    theCountPrice.value = 0003;
  }

  changeTheCounToIjor() {
    //  theOfCOunValue.value = 0.1862;
    theNAmeOfCoun.value = "JOD";
    theCoun.value = 8;
    theCountPrice.value = 00005;
  }

  changeTheCounToDollar() {
    //  theOfCOunValue.value = 0.1862;
    theNAmeOfCoun.value = "USD";
    theCoun.value = 9;
    theCountPrice.value = 0.00076329486;
  }

  changeTheCounToEur() {
    //  theOfCOunValue.value = 0.1862;
    theNAmeOfCoun.value = "EUR";
    theCoun.value = 10;
    theCountPrice.value = 0.00070347315;
  }

  whatisTheCount() {}

  getAllTheTypes() async {
    var response = await crud.postRequest(AppLinksApi.getTheTypesAll, {});
    return response;
  }

  RxBool isNoData = false.obs;
  RxBool isNoSubData = false.obs;

  String getIdMainType = "5";
  String getNameMainType = "5";
  String getNameMainTypeEn = "5";

  getAllTheProdutsWithMainTypes(String theIdOfType) async {
    var response =
        await crud.postRequest(AppLinksApi.getAllProductsWithMainTypes, {
      'id_type': theIdOfType.toString(),
    });
    if (response['status'] == "success") {
      isNoData.value = false;
    } else {
      isNoData.value = true;
    }

    return response;
  }

  getAllTheProdutsWithMainSubTypes(String theIdOfType) async {
    var response =
        await crud.postRequest(AppLinksApi.getAllProductsWithMainSubTypes, {
      'id_main_type': theIdOfType.toString(),
    });
    if (response['status'] == "success") {
      isNoSubData.value = false;
    } else {
      isNoSubData.value = true;
    }

    return response;
  }

  RxBool isNoSubTheData = false.obs;
  RxBool isSearchingType = false.obs;
  String theTypeSearching = "";

  searchingBySubType(String idSub) async {
    var response =
        await crud.postRequest(AppLinksApi.getAllProductsSearchingWitSubType, {
      'id_subtype': idSub.toString(),
    });
    if (response['status'] == "success") {
      isNoSubTheData.value = false;
    } else {
      isNoSubTheData.value = true;
    }

    return response;
  }

  RxString searcingText = "".obs;
  RxBool isNoSeaechingTheData = false.obs;
  RxBool isSearchingText = false.obs;

  TextEditingController searchingText = TextEditingController();
  searchingByText(String textSearhcing) async {
    var response =
        await crud.postRequest(AppLinksApi.getAllProductsSearchingAll, {
      'name_product': textSearhcing.toString(),
    });
    if (response['status'] == "success") {
      isNoSeaechingTheData.value = false;
    } else {
      isNoSeaechingTheData.value = true;
    }

    return response;
  }

  TextEditingController condeController = TextEditingController();
  String codeText = "";
  RxBool isHaveCode = false.obs;
  RxBool checkTheCode = false.obs;

  int theRatio = 0;
  String theIdCodeUser = "1";

  getTheCode(String theCode) async {
    checkTheCode.value = true;
    Future.delayed(Duration(seconds: 3), () async {
      var response = await crud.postRequest(AppLinksApi.checkCode, {
        'code': theCode.toString(),
      });

      if (response['status'] == "success") {
        checkTheCode.value = false;
        isHaveCode.value = true;
        theIdCodeUser = response['data'][0]['id_user'].toString();
        theRatio = int.parse(response['data'][0]['ratio'].toString());
      } else {
        checkTheCode.value = false;
        isHaveCode.value = false;
      }

      return response;
    });
  }

  int priceTOtleNEw = 0;

//////////////////////////////.................../delete Account.........////////////////////////////////
  RxBool wearingAbountDeleteAccount = false.obs;
  RxBool waitDeleteAccount = false.obs;
  deleteAllAccounts() {
    waitDeleteAccount.value = true;
    deleteOrderCompWhenDeleteAccount();
    Future.delayed(Duration(seconds: 2), () async {
      deleteOrderProductcWhenDeleteAccount();
    });
    Future.delayed(Duration(seconds: 2), () async {
      deleteShopingWhenDeleteAccount();
    });
    Future.delayed(Duration(seconds: 2), () async {
      deleteDeleteAccount();
    });
    Future.delayed(Duration(seconds: 1), () async {
      wearingAbountDeleteAccount.value = false;
      waitDeleteAccount.value = false;
      Get.to(Welcome());
    });
  }

  deleteOrderCompWhenDeleteAccount() async {
    var response =
        await crud.postRequest(AppLinksApi.deleteCompOrderWhenDeleteAccount, {
      'id_user_id': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
    } else {}
    return response;
  }

  deleteOrderProductcWhenDeleteAccount() async {
    var response =
        await crud.postRequest(AppLinksApi.deleteOrderWhenDeleteAccount, {
      'id_user': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
    } else {}
    return response;
  }

  deleteShopingWhenDeleteAccount() async {
    var response = await crud
        .postRequest(AppLinksApi.deleteShoppingCartWhenDeleteAccount, {
      'id_user': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
    } else {}
    return response;
  }

  deleteDeleteAccount() async {
    var response =
        await crud.postRequest(AppLinksApi.deleteSAccountsWhenDeleteAccount, {
      'id_user': IDUserFromDataBase.value.toString(),
    });
    if (response['status'] == "success") {
    } else {}
    return response;
  }

  RxString nameOFClebsAr = "".obs;
  RxString nameOFClebsEn = "".obs;

  //////////////////////////
  getCelebsName() async {
    var response = await crud.postRequest(AppLinksApi.getNameOFCelebs, {});

    if (response['status'] == "success") {
      nameOFClebsAr.value = response['data'][0]['name_cleb_ar'].toString();
      nameOFClebsEn.value = response['data'][0]['name_cleb_en'].toString();
    } else {}

    return response;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String?> signInWithGoogle() async {
    try {
      // بدء مؤشر التحميل
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final User? currentUser = _auth.currentUser;
        assert(user.uid == currentUser!.uid);

        print('signInWithGoogle succeeded: $user');

        return '$user';
      }

      return null;
    } catch (e) {
      // إذا حدث خطأ، أغلق مؤشر التحميل وأظهر الخطأ
      if (Get.isDialogOpen == true) Get.back();
      Get.snackbar("Error", e.toString());
    } finally {
      // في نهاية العملية، أغلق مؤشر التحميل
      if (Get.isDialogOpen == true) Get.back();
      Get.offAll(TestingAfter());
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // بدء مؤشر التحميل
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Once signed in, return the UserCredential
        final UserCredential authResult = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        Get.offAll(TestingAfter());
        print('signInWithFacebook succeeded: ${authResult.user}');

        return authResult;
      }
    } catch (e) {
      // إذا حدث خطأ، أغلق مؤشر التحميل وأظهر الخطأ
      if (Get.isDialogOpen == true) Get.back();
      Get.snackbar("Error", e.toString());
    } finally {
      // في نهاية العملية، أغلق مؤشر التحميل
      if (Get.isDialogOpen == true) Get.back();
      Get.offAll(TestingAfter());
    }
  }
}
