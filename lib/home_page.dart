import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView(
                children: [
                  Image.asset('assets/ad.png'),
                  Image.asset('assets/ad.png'),
                  Image.asset('assets/ad.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('skate boards'),
                  const SizedBox(width: 160,),
                  ElevatedButton(onPressed: (){}, child: const Text('more'))
                ],
              ),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView(
                padding: const EdgeInsets.all(9),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('skate boards'),
                  const SizedBox(width: 160,),
                  ElevatedButton(onPressed: (){}, child: const Text('more'))
                ],
              ),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView(
                padding: const EdgeInsets.all(9),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                            const Text('skate board'),
                            const Text('110\$'),

                          ],
                        ),
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
