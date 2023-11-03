import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:weather_app/domain/model/forecast.dart';
import 'package:weather_app/presentation/features/weather/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/resources/app_colors.dart';
import 'package:weather_app/presentation/utils/date_formatter.dart';
import 'package:weather_app/presentation/utils/debouncer.dart';
import 'package:weather_app/presentation/widgets/dialogs/error_dialog.dart';

part 'weather_listener.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = 'weather';
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherCubit get _weatherCubit => context.read();

  late final Debouncer debouncer;

  @override
  void initState() {
    super.initState();
    debouncer = Debouncer(milliseconds: 300);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _weatherCubit.onScreenInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                _SearchField(debouncer: debouncer, weatherCubit: _weatherCubit),
                const SizedBox(height: 16),
                BlocConsumer<WeatherCubit, WeatherState>(
                  listener: listener,
                  builder: (context, state) {
                    return state.maybeWhen(
                        fetching: () => const _FetchingView(),
                        fetched: (forecastResult) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  _buildForecastOverView(forecastResult),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 500,
                                    child: DefaultTabController(
                                      length: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LayoutBuilder(
                                            builder: (tabBarContext, _) {
                                              return TabBar(
                                                controller:
                                                    DefaultTabController.of(
                                                        tabBarContext),
                                                indicatorSize:
                                                    TabBarIndicatorSize.tab,
                                                tabs: const [
                                                  Tab(text: 'Temperature'),
                                                  Tab(text: 'Precipitation'),
                                                  Tab(text: 'Wind'),
                                                ],
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          SizedBox(
                                            height: 300,
                                            width: double.infinity,
                                            child: TabBarView(children: [
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: _TempChart(
                                                      maxTemp: forecastResult
                                                          .maxTemp,
                                                      minTemp: forecastResult
                                                          .minTemp,
                                                      hours: forecastResult
                                                          .forecastHour)),
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: _PrecipitationChart(
                                                      hours: forecastResult
                                                          .forecastHour)),
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: _WindChart(
                                                      hours: forecastResult
                                                          .forecastHour)),
                                            ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                        orElse: () => const SizedBox());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForecastOverView(FetchForecastResult forecastResult) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weather Forecasts for ${forecastResult.country}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(forecastResult.localTime ?? ''),
          Text("${forecastResult.currentCondition}"),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    super.key,
    required this.debouncer,
    required WeatherCubit weatherCubit,
  }) : _weatherCubit = weatherCubit;

  final Debouncer debouncer;
  final WeatherCubit _weatherCubit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Search country name',
        isDense: true,
      ),
      onChanged: (value) {
        debouncer.run(() {
          _weatherCubit.onSearchCountryChanged(value);
        });
      },
    );
  }
}

class _TempChart extends StatelessWidget {
  final double? maxTemp;
  final double? minTemp;
  final List<ForecastHour>? hours;

  const _TempChart({
    this.maxTemp,
    this.minTemp,
    this.hours,
  });

  @override
  Widget build(BuildContext context) {
    final maxY = (maxTemp?.ceilToDouble() ?? 0) + leftSideTitlesInterval;
    final minY = (minTemp?.ceilToDouble() ?? 0) - leftSideTitlesInterval;
    final maxX = ((hours?.length ?? 0) - 1).toDouble();

    return LineChart(
      LineChartData(
        backgroundColor: Colors.transparent,
        lineTouchData: _lineTouchData,
        borderData: _borderData,
        lineBarsData: _lineBarsData,
        gridData: const FlGridData(show: true),
        titlesData: _titlesData,
        maxX: maxX,
        maxY: maxY,
        minY: minY,
      ),
    );
  }

  LineTouchData get _lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
        ),
      );

  FlTitlesData get _titlesData => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: bottomTitles),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: leftTitles()),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (hours == null) return Container();

    final hour = hours![value.toInt()];

    Widget text = Text(
      DateFormatter.toTime(hour.time),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      angle: 5.8,
      child: text,
    );
  }

  double get leftSideTitlesInterval => 4;
  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: leftSideTitlesInterval,
        reservedSize: 45,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (meta.max == value || meta.min == value) return const SizedBox();
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );

    return Text("${value.toInt()}°", style: style, textAlign: TextAlign.center);
  }

  List<LineChartBarData> get _lineBarsData => [_lineChartTempData];

  LineChartBarData get _lineChartTempData => LineChartBarData(
        isCurved: false,
        color: AppColors.primaryDarkColor,
        barWidth: 1.5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: List.generate(hours?.length ?? 0,
            (index) => FlSpot(index.toDouble(), hours?[index].temp ?? 0)),
      );
}

class _PrecipitationChart extends StatelessWidget {
  final List<ForecastHour>? hours;
  const _PrecipitationChart({this.hours});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.transparent,
        lineTouchData: _lineTouchData,
        borderData: _borderData,
        lineBarsData: _lineBarsData,
        gridData: const FlGridData(show: true),
        titlesData: _titlesData,
        maxX: ((hours?.length ?? 0) - 1).toDouble(),
        maxY: maxHumidity,
        minY: minHumidity,
      ),
    );
  }

  double get leftSideTitlesInterval => 10;

  double get maxHumidity {
    double maxHumidity = 0;

    for (final hour in hours ?? <ForecastHour>[]) {
      if ((hour.humidity ?? 0) > maxHumidity) {
        maxHumidity = hour.humidity!;
      }
    }

    return maxHumidity.ceilToDouble() + leftSideTitlesInterval;
  }

  double get minHumidity {
    double minHumidity = hours?[0].humidity ?? 0;

    for (final hour in hours ?? <ForecastHour>[]) {
      if ((hour.humidity ?? 0) < minHumidity) {
        minHumidity = hour.humidity!;
      }
    }

    return minHumidity.ceilToDouble() - leftSideTitlesInterval;
  }

  LineTouchData get _lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
        ),
      );

  FlTitlesData get _titlesData => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: bottomTitles),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: leftTitles()),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (hours == null) return Container();

    final hour = hours![value.toInt()];

    Widget text = Text(
      DateFormatter.toTime(hour.time),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      angle: 5.8,
      child: text,
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: leftSideTitlesInterval,
        reservedSize: 45,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (meta.max == value || meta.min == value) return const SizedBox();

    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );

    return Text("${value.toInt()}%", style: style, textAlign: TextAlign.center);
  }

  List<LineChartBarData> get _lineBarsData => [_lineChartTempData];

  LineChartBarData get _lineChartTempData => LineChartBarData(
        isCurved: false,
        color: AppColors.primaryDarkColor,
        barWidth: 1.5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: List.generate(hours?.length ?? 0,
            (index) => FlSpot(index.toDouble(), hours?[index].humidity ?? 0)),
      );
}

class _WindChart extends StatelessWidget {
  final List<ForecastHour>? hours;
  const _WindChart({this.hours});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.transparent,
        lineTouchData: _lineTouchData,
        borderData: _borderData,
        lineBarsData: _lineBarsData,
        gridData: const FlGridData(show: true),
        titlesData: _titlesData,
        maxX: ((hours?.length ?? 0) - 1).toDouble(),
        maxY: maxWindKph,
        minY: minWindKph,
      ),
    );
  }

  double get maxWindKph {
    double maxWindKph = 0;

    for (final hour in hours ?? <ForecastHour>[]) {
      if ((hour.windKph ?? 0) > maxWindKph) {
        maxWindKph = hour.windKph!;
      }
    }

    return maxWindKph.ceilToDouble() + leftSideTitlesInterval;
  }

  double get minWindKph {
    double minWindKph = hours?[0].humidity ?? 0;

    for (final hour in hours ?? <ForecastHour>[]) {
      if ((hour.windKph ?? 0) < minWindKph) {
        minWindKph = hour.windKph!;
      }
    }

    return minWindKph.ceilToDouble() - leftSideTitlesInterval;
  }

  LineTouchData get _lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
        ),
      );

  FlTitlesData get _titlesData => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: bottomTitles),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: leftTitles()),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (hours == null) return Container();

    final hour = hours![value.toInt()];

    Widget text = Text(
      DateFormatter.toTime(hour.time),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      angle: 5.8,
      child: text,
    );
  }

  double get leftSideTitlesInterval => 4;

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: leftSideTitlesInterval,
        reservedSize: 45,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (meta.max == value || meta.min == value) return const SizedBox();
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );

    return Text("${value.toInt()}km/h",
        style: style, textAlign: TextAlign.center);
  }

  List<LineChartBarData> get _lineBarsData => [_lineChartTempData];

  LineChartBarData get _lineChartTempData => LineChartBarData(
        isCurved: false,
        color: AppColors.primaryDarkColor,
        barWidth: 1.5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: List.generate(hours?.length ?? 0,
            (index) => FlSpot(index.toDouble(), hours?[index].windKph ?? 0)),
      );
}

class _FetchingView extends StatelessWidget {
  const _FetchingView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        const SizedBox(height: 16),
        Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        const SizedBox(height: 16),
        Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        const SizedBox(height: 16),
        Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
      ],
    );
  }
}
