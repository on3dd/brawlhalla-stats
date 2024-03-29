import 'package:flutter/material.dart';
import 'package:brawlhalla_stats/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brawlhalla_stats/screens/login.dart';
import 'package:brawlhalla_stats/screens/profile.dart';

class MyHomePage extends StatefulWidget {
	final String title;
	final int id;

	MyHomePage({Key key, this.title, this.id}) : super(key: key);

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	@override
	Widget build(BuildContext context) {
		return ScopedModelDescendant<MainModel>(
				builder: (BuildContext context, Widget child, MainModel model) {
					return Scaffold(
						appBar: AppBar(
							title: Image.asset(
								'assets/images/brawlhalla_logo.png',
								fit: BoxFit.cover,
								height: 40,
							),
							centerTitle: true,
						),
						body: Center(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>[
									RaisedButton(
										onPressed: () {
											Navigator.push(context,
													MaterialPageRoute(builder: (context) => LoginPage()));
										},
										child: Text(
											"Login",
											style: TextStyle(fontSize: 20, color: Colors.white),
										),
										color: Colors.blue,
									),
									RaisedButton(
										onPressed: widget.id != null
												? () {
											Navigator.push(
													context,
													MaterialPageRoute(
															builder: (context) => ProfilePage(id: widget.id)));
										} : null,
										child: Text(
											"Load stats",
											style: TextStyle(fontSize: 20, color: Colors.white),
										),
										color: Colors.blue,
									)
								],
							),
						),
					);
				});
	}
}
