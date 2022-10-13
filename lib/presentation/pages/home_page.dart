import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honkai_lab/presentation/pages/widgets/header.dart';
import 'package:honkai_lab/presentation/pages/widgets/menu_header.dart';
import 'package:honkai_lab/presentation/providers/header_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            focusField.unfocus();
            FocusScope.of(context).requestFocus(FocusNode());
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Container(
            color: Colors.black87,
            child: Consumer<HeaderProvider>(
              builder: (context, notifier, _) => GestureDetector(
                onTap: () {
                  notifier.isExpanded(false);
                  notifier.index(0);
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Header(),
                      Stack(
                        children: [
                          notifier.pages[notifier.indexPage],
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              MenuHeader(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}