import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/pie_chart.dart';
import 'package:mp_chart/mp/controller/pie_chart_controller.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/pie_data.dart';
import 'package:mp_chart/mp/core/data_set/pie_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/entry/pie_entry.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/poolable/point.dart';
import 'package:mp_chart/mp/core/render/pie_chart_renderer.dart';

class PieChartBasic extends StatefulWidget {
  PieChartBasicState createState() => PieChartBasicState();
}

class PieChartBasicState extends State<PieChartBasic> {
  // PercentFormatter _formatter = PercentFormatter();

  PieChartController controller = PieChartController();

  @override
  void initState() {
    _initController();
    _initPieData();
    super.initState();
  }

  Widget getBody() {
    return PieChart(controller);
  }

  // ignore: non_constant_identifier_names

  void _initController() {
    var desc = Description()
      ..text = "desc"
      ..enabled = true;
    controller = PieChartController(
        legendSettingFunction: (legend, controller) {
          // _formatter.setPieChartPainter(controller);
          legend
            ..verticalAlignment = (LegendVerticalAlignment.TOP)
            ..horizontalAlignment = (LegendHorizontalAlignment.RIGHT)
            ..orientation = (LegendOrientation.VERTICAL)
            ..drawInside = (false)
            ..xEntrySpace = (7)
            ..yEntrySpace = (0)
            ..yOffset = (0)
            ..enabled = false;
        },
        // rendererSettingFunction: (renderer) {
        //   (renderer as PieChartRenderer)
        //     ..setHoleColor(ColorUtils.WHITE)
        //     ..setTransparentCircleColor(ColorUtils.WHITE)
        //     ..setTransparentCircleAlpha(110)
        //     ..setEntryLabelColor(ColorUtils.WHITE)
        //     ..setEntryLabelTextSize(12);
        // },
        rotateEnabled: false,
        drawHole: true,
        drawCenterText: true,
        rotationAngle: 90,
        // extraLeftOffset: 5,
        // extraTopOffset: 10,
        // extraRightOffset: 5,
        // extraBottomOffset: 5,
        usePercentValues: true,
        // centerText: _generateCenterSpannableText(),
        highLightPerTapEnabled: true,
        // selectionListener: this,
        holeRadiusPercent: 58.0,
        transparentCircleRadiusPercent: 61,
        description: desc);
  }

  void _initPieData() {
    // var img = await ImageLoader.loadImage('assets/img/star.png');
    List<PieEntry> entries = [];

    // NOTE: The order of the entries when being added to the entries array determines their position around the center of
    // the chart.
    entries.add(PieEntry(
      value: 10,
      label: "",
      // icon: img,
    ));
    entries.add(PieEntry(
      value: 10,
      label: "",
      // icon: img,
    ));
    entries.add(PieEntry(
      value: 80,
      label: "",
      // icon: img,
    ));

    PieDataSet dataSet = PieDataSet(entries, "Election Results");

    dataSet.setDrawIcons(false);

    dataSet.setSliceSpace(3);
    dataSet.setIconsOffset(MPPointF(0, 40));
    dataSet.setSelectionShift(5);

    dataSet.setColors1([
      Color.fromARGB(255, 60, 191, 131),
      Color.fromARGB(255, 231, 231, 235),
      Color.fromARGB(255, 231, 231, 235)
    ]);

    controller.data = PieData(dataSet);
    controller.data
      // ..setValueFormatter(_formatter)
      // ..setValueTextSize(11)
      ..setValueTextColor(Colors.transparent);
    // ..setValueTypeface(Util.LIGHT);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: getBody(),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart - MpAndroid"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 500,
            child: Card(child: getBody()),
          ),
        ],
      ),
    );
  }
}
