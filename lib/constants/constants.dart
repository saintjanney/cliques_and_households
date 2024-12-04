import 'package:flutter/material.dart';

class HomeConstants {
  static Map<String, List<String>> getOptions(BuildContext context) {
    return {
      "Send Money": ["assets/images/send.png", "MoMo & Bank"],
      "Payments": ["assets/images/payments.png", "Bills & Merchants"],
      "Insurance": ["assets/images/insurance.png", "Insurance for you"],
      "Loans": ["assets/images/loans.png", "Pay day & Students"],
      "Book a flight": [
        "assets/images/ic_flight.png",
        "Book a flight with Passion Air"
      ],
    };
  }

  static Map<String, List<String>> getInsightsData(BuildContext context) {
    return {
      "Today": ["assets/images/today.png", 0.00.toString()],
      "This week": ["assets/images/this_week.png", 0.00.toString()],
      "Spending Insights Await You!": [
        "assets/images/spending.png",
        "Uncover financial insights with Kowri. #MoneyMatters"
      ],
    };
  }
}
