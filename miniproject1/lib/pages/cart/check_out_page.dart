import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:miniproject1/bloc/cart/cart_bloc.dart';
import 'package:miniproject1/bloc/cart/cart_event.dart';
import 'package:miniproject1/resources/colors.dart';
import 'package:miniproject1/resources/styles.dart';

import '../../services/cart/cart_repository.dart';

class CheckOutPage extends StatefulWidget {
  final double totalPrice;

  const CheckOutPage({Key? key, required this.totalPrice}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String? paymentMethod;

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
            'Check Out',
            style: Styles.appbarText.copyWith(color: primaryText),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Text(
                'Shipping Options',
                style: Styles.title.copyWith(
                  fontWeight: FontWeight.w600,
                  color: primaryText,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: GestureDetector(
                onTap: () {
                  context.push('/shipping', extra: widget.totalPrice);
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Card(
                    elevation: 0,
                    color: cardColor,
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 60,
                                height: 30,
                                child: Image.asset(
                                  'assets/images/jne.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'JNE Express',
                                style: Styles.title.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Shipped in 2-4 days',
                                style: Styles.title.copyWith(
                                  fontSize: 12,
                                  color: secondaryText,
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              '\$${(widget.totalPrice).toStringAsFixed(2)}',
                              style: Styles.title.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Text(
                'Payment Options',
                style: Styles.title.copyWith(
                  fontWeight: FontWeight.w600,
                  color: primaryText,
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
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
                          Icons.payments_outlined,
                          color: primaryText,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Cash On Delivery (COD)',
                        style:
                            Styles.title.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Radio(
                    value: 'cod',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value as String?;
                      });
                    },
                    activeColor: primaryColor,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: cardColor),
            ),
            Padding(
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
                        child: Image.asset(
                          'assets/images/master_card.png',
                          // Set the size of the icon if needed
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Credit Card',
                        style:
                            Styles.title.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Radio(
                    value: 'credit_card',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value as String?;
                      });
                    },
                    activeColor: primaryColor,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: cardColor),
            ),
            SizedBox(height: 14),
            GestureDetector(
              onTap: () {
                context.push('/transfer',
                    extra: {'totalPrice': widget.totalPrice});
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 20,
                            color: cardColor,
                            child: Icon(
                              Icons.compare_arrows,
                              color: primaryText,
                              size: 15,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Transfer Bank',
                            style: Styles.title
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
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
            SizedBox(height: 14),
            Padding(
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
                      context.go('/confirm_order');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Order',
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
}
