import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/performance_model.dart';

class WorkerScreen extends StatelessWidget {
  final List<PerformanceModel> performanceData = [
    PerformanceModel(
        date: '2024-10-01',
        dailyIncome: 100.0,
        monthlyTarget: 3000.0,
        yearlyTarget: 36000.0),
    PerformanceModel(
        date: '2024-10-02',
        dailyIncome: 150.0,
        monthlyTarget: 3000.0,
        yearlyTarget: 36000.0),
    PerformanceModel(
        date: '2024-10-03',
        dailyIncome: 200.0,
        monthlyTarget: 3000.0,
        yearlyTarget: 36000.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('员工界面')),
      body: ListView.builder(
        itemCount: performanceData.length,
        itemBuilder: (context, index) {
          final data = performanceData[index];
          return ListTile(
            title: Text('${data.date} - 收入: \$${data.dailyIncome}'),
            subtitle: Text(
                '本月目标: \$${data.monthlyTarget}，年目标: \$${data.yearlyTarget}'),
          );
        },
      ),
    );
  }
}
