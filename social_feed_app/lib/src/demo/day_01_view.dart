import 'package:flutter/material.dart';

class Day01View extends StatelessWidget {
  static const routeName = '/day01';
  const Day01View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Day 1 - UI Challenge'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: const [
                _FirstMainColumn(),
                _SecondMainColumn(),
                _ThirdMainColumn(),
              ],
            ),
            const _PositionedBlock()
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _FirstMainColumn extends StatelessWidget {
  const _FirstMainColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
            child: _buildTopLeftView(),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.black),
            flex: 3,
          ),
          Expanded(
            child: Container(color: Colors.yellow),
            flex: 3,
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildTopLeftView() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.grey,
              )),
              Expanded(
                  child: Container(
                color: Colors.orange,
              )),
              Expanded(
                  child: Container(
                color: Colors.blue,
              )),
              Expanded(
                  child: Container(
                color: Colors.pink,
              )),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.lightBlue,
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                      ),
                    )
                  ],
                )),
          ]),
        )
      ],
    );
  }
}

class _SecondMainColumn extends StatelessWidget {
  const _SecondMainColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          color: Colors.pink,
        ));
  }
}

class _ThirdMainColumn extends StatelessWidget {
  const _ThirdMainColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.pink,
        ));
  }
}

class _PositionedBlock extends StatelessWidget {
  const _PositionedBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height * 0.14;
    final width = screenSize.width * 0.24;
    return Column(
      children: [
        const Spacer(
          flex: 3,
        ),
        Container(
          margin: EdgeInsets.only(left: width * 0.65),
          height: height,
          width: width,
          color: Colors.black.withOpacity(.5),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
