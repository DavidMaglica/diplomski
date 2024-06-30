import 'models/landing_model.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

export 'models/landing_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late LandingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(96),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(4, 4),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(96),
                    child: const Image(
                      image: AssetImage('assets/icons/appIcon.png'),
                      width: 128,
                      height: 128,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Welcome to Our App',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      '/homepage',
                    );
                  },
                  text: 'Get Started!',
                  options: FFButtonOptions(
                    height: 40,
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Theme.of(context).colorScheme.primary,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 3,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}