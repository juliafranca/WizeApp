import 'package:flutter/material.dart';
import 'package:wizers/Components/rounded_button_roxo.dart';
import 'package:wizers/constants.dart';
import 'package:wizers/models/contato.dart';
import 'package:wizers/telas/menu/telas-menu/auxiliares/nova_venda.dart';
import 'package:wizers/telas/menu/telas-menu/auxiliares/novo_produto.dart';

class Vendas extends StatefulWidget {
  @override
  _VendasState createState() => _VendasState();
}

class _VendasState extends State<Vendas> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: wizeRoxo,
        elevation: 0,
        title: Text("Vendas"),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: wizeCinza, //change your color here
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(),
            DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Container(
                      child: TabBar(
                        labelColor: Colors.purple[600],
                        unselectedLabelColor: wizeRoxo,
                        tabs: [
                          Tab(text: 'Vendas'),
                          Tab(text: 'Produtos'),
                        ],
                      ),
                    ),
                    Container(
                        height: 490, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(
                          children: [
                            Container(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                RoundedButtonRoxo(
                                  text: "Nova Venda",
                                  press: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return NovaVenda();
                                    }));
                                  },
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: wizeRoxo, width: 2))),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.03),
                                Text(
                                  "Últimas vendas:",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                ListView(
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
                        Icon(Icons.money),
                        Text(
                          '   Cliente: Joana Souza',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16,color: wizeRoxo),
                        ),
                      ],
                    ),
                    Text(
                      "Descrição: Produto da loja",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: wizeRoxo),
                    ),
                    Text(
                      "Produtos Adicionados: Itens",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "Valor: 20,00",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
          ),         
          
        ],
      
                                ),
                              ],
                            )

                                ),
                            Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    RoundedButtonRoxo(
                                      text: "Novo produto",
                                      press: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return NovoProduto();
                                        }));
                                      },
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: wizeRoxo,
                                                    width: 2))),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.03),
                                    Text(
                                      "Todos os produtos:",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    ListView(
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
                        Icon(Icons.shopping_bag),
                        Text(
                          '   Nome do produto: Produto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16,color: wizeRoxo),
                        ),
                      ],
                    ),
                    Text(
                      "Descrição: Venda de produtos",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: wizeRoxo),
                    ),
                   
                    Text(
                      "Valor: 20,00",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
          ),         
          
        ],
      
                                ),

                                  ],
                                ))
                          ],
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
