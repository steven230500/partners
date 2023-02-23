import 'package:flutter_modular/flutter_modular.dart';
import 'package:partnerts/app/childrens/final/page/final_page.dart';
import 'package:partnerts/app/childrens/form/bloc/direccion/direccion_bloc.dart';
import 'package:partnerts/app/childrens/form/bloc/form/form_bloc.dart';
import 'package:partnerts/app/childrens/form/page/form_page.dart';
import 'package:partnerts/app/childrens/form/repository/respository.dart';

import 'app/childrens/home/page/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind<DireccionBloc>(
        (i) => DireccionBloc(),
      ),
      Bind<FormUserBloc>(
        (i) => FormUserBloc(respository: i.get<Repository>()),
      ),
      Bind<Repository>(
        (i) => Repository(),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: ((context, args) => const HomePage()),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/form-page',
        child: ((context, args) => const FormPage()),
        transition: TransitionType.leftToRightWithFade,
      ),
      ChildRoute(
        '/final',
        child: ((context, args) => const FinalPage()),
        transition: TransitionType.leftToRightWithFade,
      ),
    ];
  }
}
