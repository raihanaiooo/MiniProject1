import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:miniproject1/bloc/cart/cart_bloc.dart';
import 'package:miniproject1/bloc/cart/cart_event.dart';
import 'package:miniproject1/resources/colors.dart';
import 'package:miniproject1/resources/styles.dart';
import 'package:miniproject1/services/cart/cart_repository.dart';

class TransferPage extends StatefulWidget {
  final double totalPrice;

  const TransferPage({Key? key, required this.totalPrice}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) =>
              CartBloc(CartRepository())..add(LoadCartEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Transfer Bank',
            style: Styles.appbarText.copyWith(color: primaryText),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            buildBankOption(
                'assets/images/bri.png', 'Bank Rakyat Indonesia (BRI)', 'bri'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: cardColor),
            ),
            buildBankOption(
                'assets/images/bni.png', 'Bank Negara Indonesia (BNI)', 'bni'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: cardColor),
            ),
            buildBankOption(
                'assets/images/bca.png', 'Bank Central Asia (BCA)', 'bca'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: cardColor),
            ),
            SizedBox(height: 14),
            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Under development",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 20,
                          color: cardColor,
                          child: Icon(
                            Icons.more_horiz,
                            color: primaryText,
                            size: 15,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'View more options',
                          style: Styles.title
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Ensure a bank option is selected before proceeding
                      if (selectedBank != null) {
                        context.push('/checkout');
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please select a bank",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: Styles.title.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBankOption(String imagePath, String bankName, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 25,
                height: 20,
                color: cardColor,
                child: Image.asset(imagePath),
              ),
              SizedBox(width: 16),
              Text(
                bankName,
                style: Styles.title.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: selectedBank,
            onChanged: (value) {
              setState(() {
                selectedBank = value as String?;
              });
            },
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
