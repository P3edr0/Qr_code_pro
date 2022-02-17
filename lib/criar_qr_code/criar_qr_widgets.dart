import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CriarQrWidgets {
  BuildContext context;
  CriarQrWidgets(this.context);

  Widget widgetPrincipal() {
    return Column(children: <Widget>[
      _appBar(),
      _body(),
    ]);
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 20),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: const Text(
        "Qr Code Pro | Criar Qr Code",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      color: Colors.red.shade700,
    );
  }

  Widget _body() {
    final controller = TextEditingController();
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              color: Colors.white,
              data: controller.text,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: buildTextField(context)),
                const SizedBox(width: 12),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.done, size: 30),
                  onPressed: () {}, // setState(() {}),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    final controller = TextEditingController();
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: 'Enter the data',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
