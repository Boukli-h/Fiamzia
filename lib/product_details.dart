import 'package:favorite_button/favorite_button.dart';
import 'package:fiamzia/constants/custom_colors.dart';
import 'package:fiamzia/utils/any_image.dart';
import 'package:fiamzia/utils/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with TickerProviderStateMixin {
  final Product product = Product();
  String dropdownValue = '';

  ColorSwatch _tempMainColor;
  ColorSwatch _mainColor = Colors.blue;
  int _quantity_value = 1;

  @override
  Widget build(BuildContext context) {

    product.productId = 004011;
    product.productName= 'Pierre cardan shoes';
    //List<Category> categories;
    AnyImage image1 = AnyImage();
    AnyImage image2 = AnyImage();
    AnyImage image3 = AnyImage();
    AnyImage image4 = AnyImage();
    image1.imageURL = 'https://assetscdn1.paytm.com/images/catalog/product/F/FO/FOOLOTTO-MEN-VESSIP4213535E575E7/1593678229419_28.jpg';
    image2.imageURL = 'https://rukminim1.flixcart.com/image/332/398/kmwcuq80/shoe/w/u/s/7-444-gry-org-bruton-orange-original-imagfp7fzz5ftzfc.jpeg?q=50';
    image3.imageURL = 'https://m.media-amazon.com/images/I/41Leu3gBUFL.jpg';
    image4.imageURL = 'https://m.media-amazon.com/images/I/41mvACz8NYL.jpg';
    product.images = [image1,image2,image3];
    product.categories = 'Kids';
    product.size = ['39', '40', '41'];
    product.productColors = [Colors.redAccent, Colors.greenAccent, Colors.yellowAccent, Colors.pinkAccent,];
    product.shortDescription = "2Row men's sports shoes are designed as per your daily fashion needs.";
    product.regularPrice = '400';
    product.salePrice = '450';
    product.discount = 10;
    product.ifItemAvailable = true;
    product.ifAddedToCart = false;
    product.description = "2Row men's sports shoes are designed as per your daily fashion needs. These shoes are lightweight and offer the utmost comfort to your feet. This pair of shoes is sure to make you look smart & classy. These will go with most of your casual as well as sports wear outfits. The perfect combo of good looks & comfort. These shoes are designed to keeping in mind durability as well as trends.";
    product.stockQuantity = 30;
    product.quantity = 3;
    product.seller = 'BOULOUZA NASSER';

    return MaterialApp(
      home: Scaffold(
        body: appBar(context),
      ),
    );
  }


  Widget appBar(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: CustomColors.fiamziaBlue,
        title: Text(
          "PRODUCT DETAIL",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductDetailsPage(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }


  _buildProductTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          product.productName,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductImagesWidgets(),
                _buildProductTitleWidget(),
                SizedBox(height: 12.0),
                _buildPriceWidgets(),
                SizedBox(height: 12.0),
                _buildDivider(screenSize),
                SizedBox(height: 12.0),
                _buildFurtherInfoWidget(),
                SizedBox(height: 12.0),
                _buildDivider(screenSize),
                SizedBox(height: 12.0),
                _buildSizeChartWidgets(),
                SizedBox(height: 12.0),
                _buildQuantityWidgets(),
               // _buildDivider(screenSize),
               // _buildDetailsAndMaterialWidgets(),
                SizedBox(height: 12.0),
                _buildStyleNoteHeader(),
                SizedBox(height: 6.0),
                _buildDivider(screenSize),
                SizedBox(height: 4.0),
                _buildStyleNoteData(),
                //SizedBox(height: 20.0),
                //_buildMoreInfoHeader(),
                //SizedBox(height: 6.0),
                //_buildDivider(screenSize),
                //SizedBox(height: 4.0),
                //_buildMoreInfoData(),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ],
    );
  }


  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }

  _buildProductImagesWidgets() {
    TabController imagesController = TabController(length: product.images.length, vsync: this);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    for (var i = 0; i < product.images.length; i++) Image.network(product.images[i].imageURL),
                    //Image.network("<image_url>"),
                    //Image.network("<image_url>"),
                    //Image.network("<image_url>"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  _buildDetailsAndMaterialWidgets() {
    TabController tabController = new TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "DETAILS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "MATERIAL & CARE",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 40.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text("76% acrylic, 19% polyster, 5% metallic yarn Hand-wash cold",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text("86% acrylic, 9% polyster, 1% metallic yarn Hand-wash cold",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  _buildBottomNavigationBar(BuildContext context) {
    double widthScreen = MediaQuery. of(context). size. width ;

    ImageProvider buttonImage = AssetImage('assets/images/down.png');
    buttonImage.resolve(createLocalImageConfiguration(context));

    final textStyleButton = TextStyle(
      color: CustomColors.fiamziaGrey,
      fontSize: 20,
    );

    final boxdecorationButton = BoxDecoration(
      image:DecorationImage(
        image: buttonImage,
        fit: BoxFit.fill,
      ),
    );

    final boxdecoration = BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],

    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              decoration: boxdecorationButton,
              width: widthScreen - 100,
              height: 50,
              //alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:TextButton(
                  onPressed: (){

                  },
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.white),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),

                  ),
                  child: Text("Add to Card",
                    style: textStyleButton,
                  ),
                ) ,
              ),
            ),
          ),
          SizedBox(width: 20,),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              decoration: boxdecoration,
              width: widthScreen - 100,
              height: 50,
              //alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:TextButton(
                  onPressed: (){

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(CustomColors.fiamziaBlue),

                  ),
                  child: Text("Buy Now",
                    style: textStyleButton,
                    //  textAlign: center,
                  ),
                ) ,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildPriceWidgets() {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "\$${product.regularPrice}",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                "\$${product.salePrice}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                "${product.discount}% Off",
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.fiamziaBlue,
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                "+ ${product.discount} \$ shipping cost",
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.fiamziaBlue,
                ),
              ),
            ],
          ),
          Row(
            children: [
              FavoriteButton(
                isFavorite: false,
                // iconDisabledColor: Colors.white,
                valueChanged: (_isFavorite) {
                  print('Is Favorite : $_isFavorite');
                },
              ),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    );
  }

  _buildFurtherInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Icon(
                Icons.local_shipping,
                color: Colors.grey[500],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Ship from Oran ( Algeria )",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('Seller : ', style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),),
              Text('${product.seller}', style: TextStyle(
                color: Colors.blue,
              ),),
              SizedBox(width: 2,),
              FlatButton(
                  onPressed: (){},
                  child: Text('Message')
              )
            ],
          ),
        ],
      )
    );
  }

  _buildSizeChartWidgets() {

      dropdownValue = product.size[0];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Size",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 20,),
              DropdownButton<String>(
                 value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: CustomColors.fiamziaGrey, fontSize: 15),
                onChanged: (String data) {
                  setState(() {
                    dropdownValue = data;
                  });
                },
                items: product.size.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),


            Row(
             children: [
               OutlineButton(
                 onPressed: _openMainColorPicker,
                 child: const Text('Choose color'),
               ),
               SizedBox(width: 30,),
               CircleAvatar(
                 backgroundColor: _mainColor,
                 radius: 20.0,
               ),
             ],
           ),


         /* Text(
            "SIZE CHART",
            style: TextStyle(
              color: Colors.blue[400],
              fontSize: 12.0,
            ),
          ),*/
        ],
      ),
    );
  }


  _buildQuantityWidgets() {

    //_quantity_value = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.app_registration,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Quantity",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).accentColor),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            if(_quantity_value > 1 ){
                              _quantity_value--;
                            }

                            print(_quantity_value);
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      child: Text(
                        _quantity_value.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                         setState(() {
                           _quantity_value++;
                           print(_quantity_value);
                         });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('CHOOSE'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
              },
            ),
          ],
        );
      },
    );
  }
  void _openMainColorPicker() async {
    _openDialog(
      "Product color",
      MaterialColorPicker(
        selectedColor: _mainColor,
        allowShades: false,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
        colors: product.productColors,
      ),
    );
  }
  _buildStyleNoteHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "PRODUCT DETAILS",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildStyleNoteData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        product.description == null
            ? "Details unavailable"
            : product.description,
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildMoreInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "MORE INFO",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildMoreInfoData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Product Code: ${product.productId}\nTax info: Applicable GST will be charged at the time of chekout",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

