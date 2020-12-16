import 'package:flutter/material.dart';

import '../constants.dart';

class ListaEnviadas extends StatelessWidget {
  const ListaEnviadas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(
             color: Colors.deepPurple, 
              width: 2,
            )),
            child: Padding(
                padding: EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email),
                        Text(
                          '   Mariana Silva',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16,color: wizeRoxo),
                        ),
                      ],
                    ),
                    Text(
                      "Sugestão",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: wizeRoxo),
                    ),
                    Text(
                      "Poderia ter a opçoa de criar novos itens, né?,Poderia ter a opçoa de criar novos itens, né?Poderia ter a opçoa de criar novos itens, né?Poderia ter a opçoa de criar novos itens, né?",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.deepPurple,              
              width: 2,
            )),
            child: Padding(
                padding: EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email),
                        Text(
                          '   Luis Gustavo Freitas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16,color: wizeRoxo),
                        ),
                      ],
                    ),
                    Text(
                      "Elogio",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: wizeRoxo),
                    ),
                    Text(
                      "O app está otimo! Parabens :) | O app está otimo! Parabens :) | O app está otimo! Parabens :) | O app está otimo! Parabens :) | O app está otimo! Parabens :) | ",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          
          
          
        ],
      
    );
  }
}
