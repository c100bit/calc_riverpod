import 'package:calc_riverpod/utils/utils.dart';
import 'package:calc_riverpod/widgets/app_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/arithmetic_task.dart';
import '../providers/name_provider.dart';
import '../providers/tasks_provider.dart';

import 'package:flutter/material.dart';

class FinishPage extends ConsumerWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ModalRoute.of(context)!.settings.arguments as String?;
    final tasks = ref.read(tasksProvider);
    final name = ref.read(nameProvider);

    final date = Utils.currentDate();
    final isTime = time != null;

    final result = 'Имя - $name\n'
        'Дата - $date\n'
        'Решено - ${tasks.length}\n'
        'Время - $time';

    return Scaffold(
        body: AppCard(
      height: 380,
      btnTitle: 'Попробовать снова',
      onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isTime)
            Text('Ваши результаты:\n$result',
                style: const TextStyle(fontSize: 20, height: 1.5)),
          const SizedBox(height: 25),
          if (isTime)
            IconButton(
                onPressed: () => Printing.layoutPdf(
                    format: PdfPageFormat.a4,
                    onLayout: (PdfPageFormat format) =>
                        _buildPdf(format, result, tasks)),
                icon: const Icon(Icons.print))
        ],
      ),
    ));
  }

  Future<Uint8List> _buildPdf(
      PdfPageFormat format, String result, List<ArithmeticTask> tasks) async {
    final pw.Document doc = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final taskStyle = pw.TextStyle(font: font, fontSize: 12);
    final resultStyle = pw.TextStyle(font: font, fontSize: 12);

    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.ConstrainedBox(
              constraints: const pw.BoxConstraints.expand(),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(result,
                        style: resultStyle, textAlign: pw.TextAlign.right),
                    pw.SizedBox(height: 20),
                    pw.GridView(
                      childAspectRatio: 0.3,
                      crossAxisCount: 5,
                      children: tasks
                          .map((e) => pw.Text('$e', style: taskStyle))
                          .toList(),
                    )
                  ]));
        },
      ),
    );
    return await doc.save();
  }
}
