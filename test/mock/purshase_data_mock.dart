class PurshaseDataMock {
  static const expired = ''' 
    {
      "data": {
        "purchase": {
          "success": false,
          "errorMessage": "Offer expired",
          "customer": {
            "id": "cccc3f48-dd2c-43ba-b8de-8945e7ababab",
            "name": "Jerry Smith",
            "balance": 1000000
          }
        }
      }
    }
  ''';

  static const notMoney = '''
    {
      "data": {
        "purchase": {
          "success": false,
          "errorMessage": "You don't have that much money.",
          "customer": {
            "id": "cccc3f48-dd2c-43ba-b8de-8945e7ababab",
            "name": "Jerry Smith",
            "balance": 1000000
          }
        }
      }
    }
   ''';

  static const withSuccess = '''
  {
    "data": {
        "purchase": {
          "success": true,
          "errorMessage": null,
          "customer": {
            "id": "cccc3f48-dd2c-43ba-b8de-8945e7ababab",
            "name": "Jerry Smith",
            "balance": 995000
          }
        }
      }
    }
   ''';
}
