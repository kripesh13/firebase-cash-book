import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stater_project/provider/payment_provider.dart';
import 'package:stater_project/res/barrel_file.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PaymentProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  onTap: () {
                    state.onVisibletyChange(0);
                  },
                  text: 'Add Credit',
                ),
                PrimaryButton(
                  onTap: () {
                    state.onVisibletyChange(1);
                  },
                  text: 'Show Credit',
                ),
              ],
            ),
            Consumer<PaymentProvider>(
              builder: (context, value, _) {
                return Visibility(
                  visible: value.isvisible == 0,
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            label: 'Name',
                            hint: 'Enter name',
                            required: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                            controller: value.nameController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            label: 'Item Name',
                            hint: 'Enter item name',
                            required: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Item name is required';
                              }
                              return null;
                            },
                            controller: value.itemsNameController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            label: 'Price',
                            hint: 'Enter price',
                            required: true,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Price is required';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Enter a valid price';
                              }
                              return null;
                            },
                            controller: value.priceController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            label: 'Other Details',
                            hint: 'Enter other details',
                            maxLines: 3,
                            controller: value.detailsController,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: value.isLoading
                                ? null
                                : () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      value.onSendData();
                                    }
                                  },
                            child: value.isLoading
                                ? const CircularProgressIndicator()
                                : const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Consumer<PaymentProvider>(builder: (context, value, _) {
              return Visibility(
                visible: value.isvisible == 1,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                            controller: state.searchController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Search..',
                            ),
                            onChanged: (val) {
                              value.onSearch(val);
                            },
                          ),
                        ),
                        Expanded(
                          child: FirebaseAnimatedList(
                            query: value.firebaseRef,
                            defaultChild: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            ),
                            itemBuilder: (context, snapshot, animation, index) {
                              final title =
                                  snapshot.child('name').value.toString();
                              if (value.searchController.text.isEmpty ||
                                  title.toLowerCase().contains(value
                                      .searchController.text
                                      .toLowerCase())) {
                                return CreditTile(
                                  date: snapshot.child('date').value.toString(),
                                  id: snapshot.child('id').value.toString(),
                                  itemsName: snapshot
                                      .child('itemsName')
                                      .value
                                      .toString(),
                                  name: title,
                                  price:
                                      snapshot.child('price').value.toString(),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CreditTile extends StatelessWidget {
  final String? name;
  final String? price;
  final String? itemsName;

  final String? date;
  final String? id;

  const CreditTile(
      {super.key, this.date, this.id, this.name, this.price, this.itemsName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${name ?? ""}",
              style: kkTextStyle(),
            ),
            Utils.smallHeightBox(context),
            Text("Items : ${itemsName ?? ""}", style: kkTextStyle()),
            Utils.smallHeightBox(context),
            Text(
              "Price : ${price ?? ""}",
              style: kkTextStyle(),
            ),
            Utils.smallHeightBox(context),
            Text("Date :${date ?? ""}", style: kkTextStyle()),
          ],
        ),
      ),
    );
  }
}
