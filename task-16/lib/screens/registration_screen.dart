import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/data/form_data.dart';
import '/widget/button_widget.dart';
import '/widget/custom_date_picker.dart';
import '/utils/validators.dart';
import '/widget/checkbox_widget.dart';
import '/widget/icon_widget.dart';
import '/widget/text_field_widget.dart';
import 'package:intl/intl.dart';
import '../utils/images.dart';

enum Vaccine {
  rabies,
  covid,
  malaria,
}

enum Pet {
  dog,
  cat,
  parrot,
  hamster,
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final ValueNotifier<Pet> _setPet = ValueNotifier<Pet>(Pet.dog);
  final ValueNotifier<List<Vaccine>> _checkboxValue =
  ValueNotifier<List<Vaccine>>([]);
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _controllerName = TextEditingController();
  final _controllerDate = TextEditingController();
  final _controllerWeight = TextEditingController();
  final _controllerEmail = TextEditingController();
  final Map<Vaccine, TextEditingController> _controllers = {
    Vaccine.rabies: TextEditingController(),
    Vaccine.covid: TextEditingController(),
    Vaccine.malaria: TextEditingController(),
  };

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerDate.dispose();
    _controllerWeight.dispose();
    _controllerEmail.dispose();
    _controllers.forEach((vaccine, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ValueListenableBuilder<Pet>(
            valueListenable: _setPet,
            builder: (context, value, child) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        for (final pet in Pet.values)
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: CustomIcon(
                              image: getImage(pet),
                              onTap: () {
                                _setPet.value = pet;
                                _controllerName.clear();
                                _controllerDate.clear();
                                _controllerWeight.clear();
                                _controllerEmail.clear();
                                _controllers.forEach((vaccine, controller) {
                                  controller.clear();
                                });
                              },
                              isActive: value == pet,
                              text: getPet(pet),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      labelText: 'Имя питомца',
                      controller: _controllerName,
                      validator: nameValidate,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      labelText: 'День рождения питомца',
                      controller: _controllerDate,
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        DateTime? pickedDate = await customDatePicker(
                          context: context,
                        );
                        if (pickedDate != null) {
                          _controllerDate.text =
                              DateFormat('dd.MM.yyyy').format(pickedDate);
                        }
                      },
                      validator: dateValidate,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      controller: _controllerWeight,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: weightValidate,
                      labelText: 'Вес, кг',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                      controller: _controllerEmail,
                      labelText: 'Почта хозяина',
                      validator: emailValidate,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    if (value != Pet.hamster && value != Pet.parrot)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Сделаны прививки от:',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          for (final vaccine in Vaccine.values)
                            ValueListenableBuilder<List<Vaccine>>(
                              valueListenable: _checkboxValue,
                              builder: (context, state, child) {
                                return CheckboxWidget(
                                  text: getCheckboxText(vaccine),
                                  value: state.contains(vaccine),
                                  onChanged: (value) {
                                    if (value!) {
                                      _checkboxValue.value =
                                      List.from(state)..add(vaccine);
                                    } else {
                                      _checkboxValue.value =
                                      List.from(state)..remove(vaccine);
                                    }
                                  },
                                  onTapTextField: () async {
                                    DateTime? pickedDate =
                                    await customDatePicker(
                                      context: context,
                                    );
                                    if (pickedDate != null) {
                                      _controllers[vaccine]!.text =
                                          DateFormat('dd.MM.yyyy')
                                              .format(pickedDate);
                                    }
                                  },
                                  controllerTextField: _controllers[vaccine],
                                );
                              },
                            ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ButtonWidget(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Success'),
                            ),
                          );
                        }
                        Timer.periodic(const Duration(seconds: 2), (timer) {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                        final FormData formData = FormData(
                          pet: value,
                          dateBirth: _controllerDate.text,
                          email: _controllerEmail.text,
                          vaccines: _checkboxValue.value,
                          name: _controllerName.text,
                          weight: int.parse(
                            _controllerWeight.text,
                          ),
                        );
                        print(formData);
                      },
                      isLoading: _isLoading ? true : false,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String getCheckboxText(
      Vaccine vaccine,
      ) {
    switch (vaccine) {
      case Vaccine.rabies:
        return 'бешенства';
      case Vaccine.covid:
        return 'коронавируса';
      case Vaccine.malaria:
        return 'малярии';
      default:
        return '';
    }
  }

  String getPet(Pet pet) {
    switch (pet) {
      case Pet.dog:
        return 'Собака';
      case Pet.cat:
        return 'Кошка';
      case Pet.parrot:
        return 'Попугай';
      case Pet.hamster:
        return 'Хомяк';
      default:
        return '';
    }
  }

  String getImage(Pet pet) {
    switch (pet) {
      case Pet.dog:
        return Images.iconDog;
      case Pet.cat:
        return Images.iconCat;
      case Pet.parrot:
        return Images.iconParrot;
      case Pet.hamster:
        return Images.iconHamster;
      default:
        return '';
    }
  }
}