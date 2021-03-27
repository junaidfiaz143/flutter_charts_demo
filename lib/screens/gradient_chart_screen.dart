/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
// import '../../../../../model/sample_view.dart';

/// Render chart series with vertical gradient.
class VerticalGradient extends StatefulWidget {
  /// Creates chart series with vertical gradient.
  // VerticalGradient(Key key) : super(key: key);

  _VerticalGradientState createState() => _VerticalGradientState();
}

class _ChartData {
  _ChartData({required this.x, required this.y});
  final String x;
  final double y;
}

/// State class of vertical gradient.
class _VerticalGradientState extends State<VerticalGradient> {
  _VerticalGradientState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vertical Gradient - syncfusion")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 500,
            child: Card(
              child: _getVerticalGradientAreaChart(),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the list of spline area series with vertical gradient.
  List<ChartSeries<_ChartData, String>> _getGradientAreaSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(x: '1997', y: 22.44),
      _ChartData(x: '1998', y: 25.18),
      _ChartData(x: '1999', y: 24.15),
      _ChartData(x: '2000', y: 25.83),
      _ChartData(x: '2001', y: 25.69),
    ];
    final List<Color> color = <Color>[];
    color.add(const Color(0xFF6A31D5));
    color.add(const Color(0xFFB650C8));

    final List<double> stops = <double>[];
    stops.add(0.1);
    stops.add(0.4);

    return <ChartSeries<_ChartData, String>>[
      SplineAreaSeries<_ChartData, String>(

          /// To set the gradient colors for series.
          gradient: const LinearGradient(colors: <Color>[
            Color.fromRGBO(269, 210, 255, 1),
            Color.fromRGBO(143, 236, 154, 1)
          ], stops: <double>[
            0.2,
            0.6
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          borderWidth: 2,
          borderColor: const Color.fromRGBO(0, 156, 144, 1),
          borderDrawMode: BorderDrawMode.top,
          dataSource: chartData,
          name: 'Country 1',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y),
      SplineAreaSeries<_ChartData, String>(
          gradient: const LinearGradient(colors: <Color>[
            Color.fromRGBO(140, 108, 245, 1),
            Color.fromRGBO(125, 185, 253, 1)
          ], stops: <double>[
            0.3,
            0.7
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          borderWidth: 2,
          name: 'Country 2',
          borderColor: const Color.fromRGBO(0, 63, 136, 1),
          borderDrawMode: BorderDrawMode.top,
          dataSource: <_ChartData>[
            _ChartData(x: '1997', y: 10),
            _ChartData(x: '1998', y: 100),
            _ChartData(x: '1999', y: 100),
            _ChartData(x: '2000', y: 100),
            _ChartData(x: '2001', y: 100),
          ],
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y)
    ];
  }

  /// Return the circular chart with vertical gradient.
  SfCartesianChart _getVerticalGradientAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
          labelPlacement: LabelPlacement.onTicks,
          interval: 1,
          labelRotation: -45,
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 100,
        interval: 20,
        labelFormat: '{value}%',
        axisLine: AxisLine(width: 0),
      ),
      trackballBehavior: TrackballBehavior(enable: true),
      series: _getGradientAreaSeries(),
    );
  }
}
