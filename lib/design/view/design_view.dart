part of 'design_page.dart';

class _DesignView extends StatelessWidget {
  const _DesignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Toolbar(),
          DesignPanelContainer(),
          Expanded(child: DesignBoard()),
          PropertyInspector(),
        ],
      ),
    );
  }
}
