import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates

class ProfitLossGraph extends StatelessWidget {
  const ProfitLossGraph({super.key});
  // Start date (August 2023)

  @override
  Widget build(BuildContext context) {
    final List<double> expenses = [
      1200,
      1500,
      1100,
      1800,
      1750,
      1800,
      1100
    ]; // Sample expense values
    final DateTime startDate = DateTime(2023, 8);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF256C34),//const Color(0xFF667E06), // Background color
          borderRadius: BorderRadius.circular(20),
        ),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 500, // Step for Y-axis labels
                  getTitlesWidget: (value, meta) {
                    return Text("\$${value.toInt()}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12));
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    if (value < 0 || value >= expenses.length)
                      return Container();
                    DateTime date = addMonths(startDate, value.toInt());
                    return Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Transform.rotate(
                        angle: -1.57,
                        child: Text(
                          DateFormat("MMM yy").format(date),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  },
                  reservedSize: 50,
                ),
              ),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.white.withAlpha(76), // Change this color
                  strokeWidth: 1, // Adjust line thickness
                  dashArray: [
                    5,
                    5
                  ], // Make it dashed (adjust values for different patterns)
                );
              },
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(expenses.length,
                    (index) => FlSpot(index.toDouble(), expenses[index])),
                isCurved: true,
                gradient: const LinearGradient(
                  colors: [Colors.lightGreen, Color(0xFFA5D15B)],
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 192, 247, 128).withAlpha(76),
                      const Color.fromARGB(255, 143, 199, 79).withAlpha(0)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                barWidth: 2,
                dotData: const FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime addMonths(DateTime date, int monthsToAdd) {
    int newYear = date.year + ((date.month + monthsToAdd - 1) ~/ 12);
    int newMonth = ((date.month + monthsToAdd - 1) % 12) + 1;
    return DateTime(newYear, newMonth);
  }
}
