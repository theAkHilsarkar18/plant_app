import 'package:flutter/material.dart';
import 'package:plant_app/utils/cartlist.dart';
import 'package:plant_app/utils/plant_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Cart',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Color(0xffFAFAFA),
          body: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  cartList.length,
                  (index) => Container(
                        margin: EdgeInsets.all(10),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Image.asset(cartList[index]['img']),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartList[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                Text(
                                  '\$ ${cartList[index]['price']}/-',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade50,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                cartList[index]['quantity']--;
                                              });
                                            },
                                            child: Text(
                                              '-',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Text(
                                            '${cartList[index]['quantity']}',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                cartList[index]['quantity']++;
                                              });
                                            },
                                              child: Text(
                                            '+',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18),
                                          )),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cartList.removeAt(index);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.grey,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
            ),
          )),
    );
  }
}
