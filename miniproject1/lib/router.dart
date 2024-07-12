import 'package:go_router/go_router.dart';
import 'package:miniproject1/pages/cart/cart_page.dart';
import 'package:miniproject1/pages/cart/check_out_page.dart';
import 'package:miniproject1/pages/cart/confirm_order.dart';
import 'package:miniproject1/pages/cart/shipping_page.dart';
import 'package:miniproject1/pages/cart/transfer.dart';
import 'package:miniproject1/pages/product/home.dart';
import 'package:miniproject1/pages/profile/setting_screen.dart';
import 'package:miniproject1/register_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) {
        final totalPrice = state.extra as double? ?? 0.0;
        return CheckOutPage(totalPrice: totalPrice);
      },
    ),
    GoRoute(
      path: '/transfer',
      builder: (context, state) {
        final double totalPrice =
            (state.extra as Map<String, dynamic>?)?['totalPrice'] as double? ??
                0.0;
        return TransferPage(totalPrice: totalPrice);
      },
    ),
    GoRoute(
      path: '/shipping',
      builder: (context, state) {
        final totalPrice = state.extra as double? ?? 0.0;
        return ShippingPage(totalPrice: totalPrice);
      },
    ),
    GoRoute(
      path: '/confirm_order',
      builder: (context, state) => const ConfirmOrder(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
  ],
);
