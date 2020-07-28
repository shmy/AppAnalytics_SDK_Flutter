import 'dart:async';

import 'package:flutter/services.dart';
import 'dart:io';

class TalkingdataAdtracking {
  static const MethodChannel _channel =
      const MethodChannel('talkingdata_adtracking');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getDeviceID() async{
    return await _channel.invokeMethod('getDeviceID');
  }

  static Future<String> getOAID() async{
    if(Platform.isAndroid){
      return await _channel.invokeMethod('getOAID');
    }
    return null;
  }

  static Future<void> onRegister(String account) async{
    return await _channel.invokeMethod('onRegister', <String, dynamic>{
      'account': account
    });
  }

  static Future<void> onRegisterWithInvitationCode(String account,String invitationCode) async{
    return await _channel.invokeMethod('onRegisterWithInvitationCode', <String,dynamic>{
      'account': account,
      'invitationCode':invitationCode,
    });
  }

  static Future<void> onLogin(String account) async{
    return await _channel.invokeMethod('onLogin', <String, dynamic>{
      'account': account
    });
  }

  static Future<void> onCreateCard(String account,String method,String content) async{
    return await _channel.invokeMethod('onCreateCard', <String, dynamic>{
      'account': account,
      'method': method,
      'content': content,
    });
  }

  static Future<void> onReceiveDeepLink(String link) async{
    return await _channel.invokeMethod('onReceiveDeepLink', <String, dynamic>{
      'link': link
    });
  }

  static Future<void> onFavorite(String category,String content) async{
    return await _channel.invokeMethod('onFavorite', <String,dynamic>{
      'category': category,
      'content':content,
    });
  }

  static Future<void> onShare(String account,String content) async{
    return await _channel.invokeMethod('onShare', <String,dynamic>{
      'account': account,
      'content':content,
    });
  }

  static Future<void> onPunch(String account,String punchId) async{
    return await _channel.invokeMethod('onPunch', <String,dynamic>{
      'account': account,
      'punchId':punchId,
    });
  }

  static Future<void> onSearch(TDADTSearch search) async{
    return await _channel.invokeMethod('onSearch', <String,dynamic>{
    	'category': search.category,
    	'content': search.content,
    	'itemId': search.itemId,
    	'itemLocationId': search.itemLocationId,
    	'destination': search.destination,
    	'origin': search.origin,
    	'startDate': search.startDate,
    	'endDate': search.endDate,
    });
  }

  static Future<void> onReservation(String account,String reservationId,String category,int amount,String term) async{
    return await _channel.invokeMethod('onReservation', <String,dynamic>{
    	'account': account,
    	'reservationId': reservationId,
    	'category': category,
    	'amount': amount,
    	'term': term,
    });
  }

  static Future<void> onBooking(String account,String bookingId,String category,int amount,String content) async{
    return await _channel.invokeMethod('onBooking', <String,dynamic>{
    	'account': account,
    	'bookingId': bookingId,
    	'category': category,
    	'amount': amount,
    	'content': content,
    });
  }


  static Future<void> onContact(String account,String content) async{
    return await _channel.invokeMethod('onContact', <String,dynamic>{
      'account': account,
      'content':content,
    });
  }

  static Future<void> onViewItemWithCategory(String category,String itemId,String name,int unitPrice) async{
    return await _channel.invokeMethod('onViewItemWithCategory', <String,dynamic>{
    	'category': category,
    	'itemId': itemId,
    	'name': name,
    	'unitPrice': unitPrice,
    });
  }

  static Future<void> onViewShoppingCart(TDADTShoppingCart shoppingCart) async{
    return await _channel.invokeMethod('onViewShoppingCart', <String, dynamic>{
      'shoppingCartDetails': shoppingCart._shoppingCartDetails
    });
  }

  static Future<void> onAddItemToShoppingCart({String category, String itemID, String name, int unitPrice, int amount}) async{
    return await _channel.invokeMethod('onAddItemToShoppingCart', <String, dynamic>{
      'itemID': itemID,
      'category': category,
      'name': name,
      'unitPrice': unitPrice,
      'amount': amount
    });
  }

  static Future<void> onPlaceOrder({String accountID, TDADTOrder order}) async{
    return await _channel.invokeMethod('onPlaceOrder', <String, dynamic>{
      'accountID': accountID,
      'orderID': order.orderID,
      'totalPrice': order.totalPrice,
      'currencyType': order.currencyType,
      'orderDetails': order._orderDetails
    });
  }

  static Future<void> onPay1(String account,String orderId ,int amount, String currencyType,String payType) async{
    return await _channel.invokeMethod('onPay1', <String,dynamic>{
      'account': account,
      'orderId': orderId,
      'amount': amount,
      'currencyType': currencyType,
      'payType': payType,
    });
  }


  static Future<void> onPay2(String account,String orderId ,int amount, String currencyType,String payType,TDADTOrder order) async{
    return await _channel.invokeMethod('onPay2', <String,dynamic>{
      'account': account,
      'orderId': orderId,
      'amount': amount,
      'currencyType': currencyType,
      'payType': payType,
      'orderID': order.orderID, 
      'totalPrice': order.totalPrice,
      'ordercurrencyType': order.currencyType,
      'orderDetails': order._orderDetails
    });
  }

  static Future<void> onPay3(String account,String orderId ,int amount, String currencyType,String payType,String itemId,int itemCount) async{
    return await _channel.invokeMethod('onPay3', <String,dynamic>{
      'account': account,
      'orderId': orderId,
      'amount': amount,
      'currencyType': currencyType,
      'payType': payType,
      'itemId': itemId,
      'itemCount': itemCount,
    });
  }

  static Future<void> onLearn(String account,String course ,int begin,int duration) async{
    return await _channel.invokeMethod('onLearn', <String,dynamic>{
      'account': account,
      'course': course,
      'begin': begin,
      'duration': duration,
    });
  }

  static Future<void> onRead(String account,String book ,int begin,int duration) async{
    return await _channel.invokeMethod('onRead', <String,dynamic>{
      'account': account,
      'book': book,
      'begin': begin,
      'duration': duration,
    });
  }

  static Future<void> onBrowse(String account,String content ,int begin,int duration) async{
    return await _channel.invokeMethod('onBrowse', <String,dynamic>{
      'account': account,
      'content': content,
      'begin': begin,
      'duration': duration,
    });
  }


  static Future<void> onTransaction(String account,TDADTTransaction transaction) async{
    return await _channel.invokeMethod('onTransaction', <String,dynamic>{

      'account': account,
      'transactionId': transaction.transactionId,
      'category': transaction.category,
      'amount': transaction.amount,
      'personA': transaction.personA,
      'personB': transaction.personB,
      'startDate': transaction.startDate,
      'endDate': transaction.endDate,
      'currencyType': transaction.currencyType,
      'content': transaction.content,
    });
  }

  static Future<void> onCredit(String account,int amount,String content ) async{
    return await _channel.invokeMethod('onCredit', <String,dynamic>{
      'account': account,
      'amount': amount,
      'content': content,
    });
  }

  static Future<void> onChargeBack(String account,String orderId,String reason ,String type) async{
    return await _channel.invokeMethod('onChargeBack', <String,dynamic>{
      'account': account,
      'orderId': orderId,
      'reason': reason,
      'type': type,
    });
  }

  static Future<void> onCreateRole(String name) async{
    return await _channel.invokeMethod('onCreateRole', <String,dynamic>{
      'name': name,
    });
  }

  static Future<void> onTrialFinished(String account,String content) async{
    return await _channel.invokeMethod('onTrialFinished', <String,dynamic>{
      'account': account,
      'content': content,
    });
  }

  static Future<void> onGuideFinished(String account,String content) async{
    return await _channel.invokeMethod('onGuideFinished', <String,dynamic>{
      'account': account,
      'content': content,
    });
  }

  static Future<void> onPreviewFinished(String account,String content) async{
    return await _channel.invokeMethod('onPreviewFinished', <String,dynamic>{
      'account': account,
      'content': content,
    });
  }

  static Future<void> onFreeFinished(String account,String content) async{
    return await _channel.invokeMethod('onFreeFinished', <String,dynamic>{
      'account': account,
      'content': content,
    });
  }

  static Future<void> onLevelPass(String account,String levelId) async{
    return await _channel.invokeMethod('onLevelPass', <String,dynamic>{
      'account': account,
      'levelId': levelId,
    });
  }

  static Future<void> onAchievementUnlock(String account,String achievementId) async{
    return await _channel.invokeMethod('onAchievementUnlock', <String,dynamic>{
      'account': account,
      'achievementId': achievementId,
    });
  }

  static Future<void> onOrderPaySucc(String account,String orderId,int amount,String currencyType,String payType) async{
    return await _channel.invokeMethod('onOrderPaySucc', <String, dynamic>{
      'account': account,
      'orderId': orderId,
      'amount': amount,
      'currencyType': currencyType,
      'payType': payType,
    });
  }

  static Future<String> onCustEvent1() async{
    return await _channel.invokeMethod('onCustEvent1');
  }

  static Future<String> onCustEvent2() async{
    return await _channel.invokeMethod('onCustEvent2');
  }

  static Future<String> onCustEvent3() async{
    return await _channel.invokeMethod('onCustEvent3');
  }

  static Future<String> onCustEvent4() async{
    return await _channel.invokeMethod('onCustEvent4');
  }

  static Future<String> onCustEvent5() async{
    return await _channel.invokeMethod('onCustEvent5');
  }

  static Future<String> onCustEvent6() async{
    return await _channel.invokeMethod('onCustEvent6');
  }

  static Future<String> onCustEvent7() async{
    return await _channel.invokeMethod('onCustEvent7');
  }

  static Future<String> onCustEvent8() async{
    return await _channel.invokeMethod('onCustEvent8');
  }

  static Future<String> onCustEvent9() async{
    return await _channel.invokeMethod('onCustEvent9');
  }

  static Future<String> onCustEvent10() async{
    return await _channel.invokeMethod('onCustEvent10');
  }

}

class TDADTOrder{
  TDADTOrder({
    this.orderID,
    this.totalPrice,
    this.currencyType,
  });

  final String orderID;

  final int totalPrice;

  final String currencyType;

  List _orderDetails = List();

  addItem(String itemID, String category, String name, int unitPrice, int amount){
    Map map = Map();
    map['itemID'] = itemID;
    map['category'] = category;
    map['name'] = name;
    map['unitPrice'] = unitPrice;
    map['amount'] = amount;
    _orderDetails.add(map);
  }


}

class TDADTSearch{
	TDADTSearch({
		this.category,
		this.content,
		this.itemId,
		this.itemLocationId,
		this.destination,
		this.origin,
		this.startDate,
		this.endDate,
	});

	final String category;
	final String content;
	final String itemId;
	final String itemLocationId;
	final String destination;
	final String origin;
	final int startDate;
	final int endDate;
}

class TDADTTransaction{
  TDADTTransaction({
    this.transactionId,
    this.category,
    this.amount,
    this.personA,
    this.personB,
    this.startDate,
    this.endDate,
    this.currencyType,
    this.content,
  });

  final String transactionId;
  final String category;
  final int amount;
  final String personA;
  final String personB;
  final int startDate;
  final int endDate;
  final String currencyType;
  final String content;

}

class TDADTShoppingCart{
  TDADTShoppingCart();

  List _shoppingCartDetails = List();

  addItem(String itemID, String category, String name, int unitPrice, int amount){
    Map map = Map();
    map['itemID'] = itemID;
    map['category'] = category;
    map['name'] = name;
    map['unitPrice'] = unitPrice;
    map['amount'] = amount;
    _shoppingCartDetails.add(map);
  }
}

