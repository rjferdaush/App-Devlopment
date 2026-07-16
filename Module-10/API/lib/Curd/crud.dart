import 'package:api/Curd/controller/productcontroller.dart';
import 'package:flutter/material.dart';

class Curd extends StatefulWidget {
  const Curd({super.key});

  @override
  State<Curd> createState() => _CurdState();
}

class _CurdState extends State<Curd> {
  
  ProductController productController =ProductController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetechData();
  }
  
  
  Future fetechData()async{
    await productController.fetchProducts();
    setState(() {
      
    });
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:  Text('Product From API', style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: Padding(padding: const EdgeInsetsGeometry.all(16),
          child: GridView.builder(
              itemCount: productController.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: .50
              ),
              itemBuilder: (context,index){
                final product = productController.products[index];
                // ! Box Decoration
              return Container(
                // height: 1500,
                width: double.infinity,

                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                ),


                child: Column(
                  children: [
                    // ! Image 
                    Container(
                      height: 150,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network( product.img.toString(),
                        // height: double.infinity,
                        // width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // ! Text & Button
                    Padding(padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( product.productName.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),

                          Text("Quantity:${product.qty} ${product.productCode} \n ${product.unitPrice} ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12,),
                          
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("BUY",
                                      style: TextStyle(
                                        
                                      ),
                                      ),
                                  ),
                              ),
                              // const SizedBox(width: 10,),
                              // Expanded(
                              //   child: ElevatedButton(
                              //         onPressed: (){},
                              //         child: Text("SELL",
                              //           style: TextStyle(
                              //             fontSize: 8,
                              //           ),
                              //         )
                              //   )
                              // ),
                            ],
                          )
                        ],
                      ),
                      
                    )


                    
                  ],
                ),
              );

              }
              ),

      ),
      
    );
  }
}
