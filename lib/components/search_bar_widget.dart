import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({Key key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool switchListTileValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterFlowVideoPlayer(
          path:
              'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
          videoType: VideoType.network,
          autoPlay: false,
          looping: true,
          showControls: true,
          allowFullScreen: true,
          allowPlaybackSpeedMenu: false,
        ),
        SwitchListTile(
          value: switchListTileValue ?? true,
          onChanged: (newValue) =>
              setState(() => switchListTileValue = newValue),
          title: Text(
            'Title',
            style: FlutterFlowTheme.title3.override(
              fontFamily: 'Poppins',
            ),
          ),
          subtitle: Text(
            'Subtitle',
            style: FlutterFlowTheme.subtitle2.override(
              fontFamily: 'Poppins',
            ),
          ),
          tileColor: Color(0xFFF5F5F5),
          dense: false,
        )
      ],
    );
  }
}
