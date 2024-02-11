import 'package:flutter/material.dart';
import 'package:plant_app/utils/cartlist.dart';
import 'package:plant_app/utils/plant_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {

    var plantData = ModalRoute.of(context)!.settings.arguments as Map;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          backgroundColor: Color(0xffFAFAFA),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                // color: Color(0xffEEEEEE),
                height: 320,
                width: double.infinity,
                child: Image.asset(
                  plantData['img'],
                  fit: BoxFit.cover,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              height: 48,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    plantData['name'],
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.favorite_border,color: Colors.green,size: 22,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(color: Colors.green, width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${plantData['sold']} Sold',
                      style: TextStyle(color: Colors.green, fontSize: 10),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.star_half,
                    color: Colors.green,
                    size: 17,
                  ),
                  Text(
                    '   ${plantData['rating']}  (${plantData['reviews']} reviews)  ',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 0.5),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
                'Description',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                plantData['description'],
                style: TextStyle(color: Colors.black54, fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Quantity',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('-',style: TextStyle(color: Colors.green,fontSize: 18),),
                        Text('${plantData['quantity']}',style: TextStyle(color: Colors.green,fontSize: 15),),
                        Text('+',style: TextStyle(color: Colors.green,fontSize: 18),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 0.5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: TextStyle(color: Colors.black54, fontSize: 10),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '\$ ${plantData['price']}/-',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {

                      cartList.add(plantData);

                    },
                    child: Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_mall,color: Colors.white,size: 20,),
                          SizedBox(width: 15,),
                          Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 15,letterSpacing: 0.5),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
