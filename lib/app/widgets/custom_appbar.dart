import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/widgets/country_search_textfield.dart';
import 'package:testcase/app/widgets/selectable_icon_button.dart';
import 'package:testcase/app/widgets/text/title_medium_text.dart';
import 'package:testcase/core/enums/svg_paths.dart';

import '../../core/utils/theme/app_colors.dart';

class CustomAppbar extends HookConsumerWidget {
  const CustomAppbar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appColorsProvider);
    final isCollapsed = useState(false);

    useEffect(() {
      void listener() {
        if (scrollController.hasClients) {
          isCollapsed.value = scrollController.offset > 35.0;
        }
      }

      scrollController.addListener(listener);

      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 160.0,
      backgroundColor: isCollapsed.value ? appColors.blue : Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: SelectableIconButton(
          iconColor: appColors.drWhite,
          buttonColor: appColors.softBlue,
          icon: SvgPaths.category,
          iconPadding: 8,
        ),
      ),
      title: TitleMediumText(
        'Countries',
        color: appColors.drWhite,
        fontWeight: FontWeight.w700,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableIconButton(
            iconColor: appColors.drWhite,
            buttonColor: appColors.softBlue,
            icon: SvgPaths.crown,
            height: 40,
            width: 40,
            iconPadding: 8,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(SvgPaths.appbarBackgroun.path),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CountrySearchTextfield(), // TextField sadece geniş durumda görünür
                    const SizedBox(height: 34),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
