import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> b = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png'
  ];
  final List<String> bg = [
    'assets/b1.png',
    'assets/b2.png',
    'assets/b3.png',
    'assets/b4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bg[state.selectedIndex]),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              left: 50,
              child: SizedBox(
                width: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(UpdateIndexEvent(index));
                      },
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          final isSelected = state.selectedIndex == index;
                          return Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                isSelected
                                    ? BoxShadow(
                                  color: Color(0xFFFFFFFF),
                                  blurRadius: 15.90,
                                  offset: Offset(0, 0),
                                  spreadRadius: 10,
                                )
                                    : BoxShadow(color: Colors.transparent)
                              ],
                              borderRadius: BorderRadius.circular(300),
                              image: DecorationImage(
                                image: AssetImage(bg[index]),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                                opacity: isSelected ? 1 : 0.5,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 30);
                  },
                  itemCount: bg.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
