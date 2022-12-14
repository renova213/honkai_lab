import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import '../../../domain/entities/character.dart';

class RankUpCharacterContainer extends StatelessWidget {
  final Detail detail;
  const RankUpCharacterContainer({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rank Up Bonus", style: subtitle),
                  const SizedBox(height: 8),
                  Text(
                      "Each character gets a rating based on how good it is in certain game mode. Below you will find a short description of all game modes available in game",
                      style: bodyText2),
                  const SizedBox(height: 16),
                  _customContainer(
                      rank: "Rank Up",
                      explanation: "Description",
                      indexColor: 0,
                      width: width),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detail.rankUpLevel.length,
                    itemBuilder: (context, index) {
                      int indexColor = 1;

                      final data = detail.rankUpLevel[index];

                      if (index.isEven) indexColor = 1;
                      if (index.isOdd) indexColor = 2;

                      return _customContainer(
                          rank: data.rankUp,
                          explanation: data.description,
                          indexColor: indexColor,
                          width: width);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customContainer(
      {required String rank,
      required String explanation,
      required int indexColor,
      required double width}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade600
                  : indexColor == 1
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                rank,
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade600
                  : indexColor == 1
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment:
                indexColor == 0 ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  explanation,
                  style: indexColor == 0
                      ? bodyText2.copyWith(fontWeight: FontWeight.bold)
                      : bodyText2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
