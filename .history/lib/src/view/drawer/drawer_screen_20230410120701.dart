import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noon/components/after_hero.dart';
import 'package:noon/components/tile_button.dart';
import 'package:noon/providers/theme_provider.dart';
import 'package:noon/utils/language_util.dart';

import 'package:noon/src/view/drawer/components/drawer_image.dart';

class DrawerScreen extends StatefulHookConsumerWidget {
  const DrawerScreen({super.key});

  @override
  ConsumerState<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends ConsumerState<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    var support = useAnimationController(debugLabel: 'support');
    var img = useAnimationController();
    var name = useAnimationController();
    var number = useAnimationController();
    var account = useAnimationController();
    var setting = useAnimationController();
    var myorders = useAnimationController();
    var about = useAnimationController();
    HeroController cnt = HeroController();
    final lng = ref.watch(lang.notifier);

    return WillPopScope(
      onWillPop: () async {
        await support.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await img.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await name.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await number.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await account.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await setting.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await myorders.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );
        await about.animateBack(
          0,
          duration: const Duration(milliseconds: 80),
        );

        return true;
      },
      child: HeroControllerScope(
        controller: cnt,
        child: Hero(
          tag: 'drawer',
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16)),
            child: AfterHero(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  // backgroundColor: Theme.of(context).primaryColor,
                  body: SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.transparent,
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const DrawerImage(
                                spacing: 16,
                                borderWidth: 4,
                              )
                                  .animate(
                                    controller: img,
                                  )
                                  .scale(),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'نعمان منذر محمود',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                              .animate(
                                controller: name,
                              )
                              .fadeIn(),
                          const Text(
                            '@noamanio',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                              .animate(
                                controller: number,
                              )
                              .fadeIn(),
                          TileButton(
                            icon: Iconsax.user,
                            title: 'الحساب',
                            onTap: () {},
                          )
                              .animate(
                                controller: account,
                              )
                              .slideX(
                                begin: 1,
                                end: 0,
                                delay: const Duration(milliseconds: 300),
                              ),
                          TileButton(
                            icon: Iconsax.setting_2,
                            title: 'الاعدادات',
                            onTap: () {},
                          )
                              .animate(
                                controller: setting,
                              )
                              .slideX(
                                begin: 1,
                                end: 0,
                                delay: const Duration(milliseconds: 400),
                              ),
                          TileButton(
                            icon: Iconsax.brush,
                            title: 'سمة التطبيق',
                            onTap: () async {
                              print('tapped');
                              ref.read(themeProvider.notifier).toggle();
                            },
                          )
                              .animate(
                                controller: myorders,
                              )
                              .slideX(
                                begin: 1,
                                end: 0,
                                delay: const Duration(milliseconds: 500),
                              ),
                          TileButton(
                            icon: Icons.help_outline,
                            title: 'حول',
                            onTap: () {},
                          )
                              .animate(
                                controller: about,
                              )
                              .slideX(
                                begin: 1,
                                end: 0,
                                delay: const Duration(milliseconds: 600),
                              ),
                          const SizedBox(
                            height: 32,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            'v 1.0.0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              // color: Colors.white
                            ),
                          ),
                        ]))
                      ],
                    ),
                  )

                  // color: Colors.red,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
