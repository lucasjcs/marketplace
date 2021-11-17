abstract class Strings {
  static const default_error_message = 'Something went wrong. please try again';
  static const default_hello = 'Hello';
  static const default_balance = 'Balance';
  static const default_discover = 'Discover';
  static const default_description = 'Description';
  static const default_buy = 'Buy';
  static const default_cancel = 'Cancel';
  static const default_error = 'Error';
  static const default_close = 'Close';

  static const splash_wellcome = 'Welcome to the purple side';

  static const home_discover_more = 'Discover more';
  static const home_discover_marketplace =
      'Discover nubank marketplace with exclusive offers for you';
  static const home_nu_marketplace = 'Nu Marketplace';

  static const marketplace_dialog_title =
      'Do you want to complete the purchase?';
  static marketplaceDialogSubtitle(String value) =>
      'You are buying a ${value}, want to continue?';
  static const marketplace_dialog_buy_now = 'Buy now';
  static const marketplace_not_enough_balance =
      'you don\'t have enough balance to buy this item';

  static const purchase_completed_info = 'Your purchase was successful!';
}
