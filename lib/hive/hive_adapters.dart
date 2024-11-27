import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:menuapp/features/home_screen/data/models/meal_timings.dart';

import '../features/home_screen/data/models/response_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<MealTimings>(),
  AdapterSpec<Timings>(),
  AdapterSpec<MealType>(),
  AdapterSpec<Meta>(),
  AdapterSpec<SpecialDay>(),
  AdapterSpec<MenuResponseModel>(),
])
void _() {}
