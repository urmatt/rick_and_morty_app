# Важно

Сначало запустить команду

`flutter pub run build_runner build`

В lib/data/models/info_results.response.g.dart поменять

`info': instance.info,` на -> `info': instance.info.toJson(),`

# На что обратить внимание:

- [Generic types](https://github.com/urmatt/rick_and_morty_app/blob/main/lib/data/json_converters/info_result_converter.dart)
- [Extentions](https://github.com/urmatt/rick_and_morty_app/tree/main/lib/core/extentions)
- [Export](https://github.com/urmatt/rick_and_morty_app/blob/main/lib/data/repositories/repositories.dart)
- [Extending](https://github.com/urmatt/rick_and_morty_app/blob/main/lib/presentation/core/widgets/scroll_view/load_more_list.dart)
- [MultiBlocProvider](https://github.com/urmatt/rick_and_morty_app/blob/main/lib/presentation/routes/routes.dart)
- [Custom controller](https://github.com/urmatt/rick_and_morty_app/blob/main/lib/presentation/core/controllers/filter_controller.dart)
- [Some test](https://github.com/urmatt/rick_and_morty_app/tree/main/test/data/api/services)
