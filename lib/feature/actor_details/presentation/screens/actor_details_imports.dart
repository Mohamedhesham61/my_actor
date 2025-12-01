
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_actors/core/widgets/custom_appBar.dart';
import 'package:my_actors/feature/actor_details/presentation/controllers/actor_details_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/network/api_constants.dart';
import '../controllers/actor_details_event.dart';
import '../controllers/actor_details_state.dart';
import '../controllers/actor_images_bloc.dart';
import '../controllers/actor_images_event.dart';
import '../controllers/actor_images_state.dart';
import '../widgets/actor_details_widgets_imports.dart';

part 'actor_details_screen.dart';