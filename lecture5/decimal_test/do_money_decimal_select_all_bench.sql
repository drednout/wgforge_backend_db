select currency_code, SUM(amount)  from money_decimal GROUP BY currency_code;
