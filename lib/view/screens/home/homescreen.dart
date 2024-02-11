import 'package:flutter/material.dart';
import 'package:plant_app/utils/plant_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: AssetImage('asset/img/profile.jpg'),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Aayush Patel',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                icon: Icon(
                  Icons.local_mall_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: Container(
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(10),
                  height: 48,
                  width: width,
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Spacer(),
                      Icon(
                        Icons.tune,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  height: 48,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special Offers',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        7,
                        (index) => plantBox(
                            name: plantDataList[index]['name'],
                            price: plantDataList[index]['price'],
                            img: plantDataList[index]['img'],
                            rating: plantDataList[index]['rating'],
                            sold: plantDataList[index]['sold'])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  height: 48,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Popular',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        6,
                        (index) => categoryBox(
                            plantDataList[index]['category'], index)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: List.generate(
                        plantDataList.length,
                        (index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/product',arguments: plantDataList[index]);
                          },
                          child: plantBox(
                            name: plantDataList[index]['name'],
                            price: plantDataList[index]['price'],
                            img: plantDataList[index]['img'],
                            rating: plantDataList[index]['rating'],
                            sold: plantDataList[index]['sold'],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        plantDataList2.length,
                        (index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/product',arguments: plantDataList2[index]);
                          },
                          child: plantBox(
                            name: plantDataList2[index]['name'],
                            price: plantDataList2[index]['price'],
                            img: plantDataList2[index]['img'],
                            rating: plantDataList2[index]['rating'],
                            sold: plantDataList2[index]['sold'],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget plantBox(
    {required String img,
    required String name,
    required double rating,
    required int sold,
    required int price}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    height: 250,
    width: 160,
    // color: Colors.black12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // padding: EdgeInsets.all(10),
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Image.asset(
                img,
                fit: BoxFit.cover,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.green,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_half,
                      color: Colors.green,
                      size: 17,
                    ),
                    Text(
                      '  $rating  |   ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Container(
                      height: 20,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.green, width: 1.5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$sold Sold',
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$ $price/-',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget categoryBox(String name, int index) {
  return Container(
      margin: EdgeInsets.all(5),
      height: 25,
      width: 70,
      decoration: BoxDecoration(
        color: (index == 0) ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green, width: 1.5),
      ),
      alignment: Alignment.center,
      child: (index == 0)
          ? Text('$name',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500))
          : Text(
              '$name',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ));
}
