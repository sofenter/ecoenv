// Home
Future getCollectionCenterName(String id)async{
  //
}

Future getCollectionCenters(String state, String city)async{
  //
}

Future getCollectionCenterDetails(String id)async{
  //
}

Future getDeviceDetails(String type, String brand,String model)async{
  //
}

// Disposal History
Future getDisposalsByUser(String email)async{
  //
}

Future getDisposalsByCenter(String email)async{
  //
}

// Disposal Details
Future getDisposalUsefulItems(String disposalId)async{
  //
}

Future getDevices(int purchaseYear)async{
  //
}

// Credit Dashboard
Future getTotalDisposal(String email)async{
  //
}

Future getTotalCreditEarned(String email)async{
  //
}

// Device Details Filter
Future getDeviceTypes()async{
  //
}

Future getDeviceBrandsByType(String type)async{
  //
}

Future getDeviceModels(String type, String brand)async{
  //
}

// Collection Center
Future registerCollectionCenter(Map<dynamic, dynamic> data)async{
  //
}

Future getAllCollectionCenters()async{
  //
}

// Update Disposal Status
Future updateDisposal(String disposalId, Map<dynamic, dynamic> data)async{
  //
}

// Add Spare Items
Future addSpareItems(String deviceType, String brand, String model, List data)async{
  //
}