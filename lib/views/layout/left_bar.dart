import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webui/helper/extensions/string.dart';
import 'package:webui/helper/services/url_service.dart';
import 'package:webui/helper/theme/app_style.dart';
import 'package:webui/helper/theme/theme_customizer.dart';
import 'package:webui/helper/utils/my_shadow.dart';
import 'package:webui/helper/utils/ui_mixins.dart';
import 'package:webui/helper/widgets/my_button.dart';
import 'package:webui/helper/widgets/my_card.dart';
import 'package:webui/helper/widgets/my_container.dart';
import 'package:webui/helper/widgets/my_spacing.dart';
import 'package:webui/helper/widgets/my_text.dart';
import 'package:webui/images.dart';
import 'package:webui/widgets/custom_pop_menu.dart';

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = {};

  static attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static detachListener(String key) {
    observers.remove(key);
  }

  static notifyAll(String key) {
    for (var fn in observers.values) {
      fn(key);
    }
  }
}

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({super.key, this.isCondensed = false});

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> with SingleTickerProviderStateMixin, UIMixin {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;
  String path = UrlService.getCurrentUrl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(position: MyShadowPosition.centerRight, elevation: 0.2),
      child: AnimatedContainer(
        color: leftBarTheme.background,
        width: isCondensed ? 70 : 260,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed('/dashboard');
                      },
                      child: Image.asset(Images.logoIcon, height: widget.isCondensed ? 24 : 32)),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: MySpacing.width(16),
                    ),
                  if (!widget.isCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: MyText.labelSmall(
                        "Vendor Portal",
                        style: GoogleFonts.raleway(
                          // fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: contentTheme.primary,
                          letterSpacing: 1,
                        ),
                        maxLines: 1,
                      ),
                    )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelWidget('Dashboard'),
                  NavigationItem(
                    iconData: LucideIcons.group,
                    title: "project".tr(),
                    isCondensed: isCondensed,
                    route: '/dashboard',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.baggage_claim,
                    title: "e-commerce".tr(),
                    isCondensed: isCondensed,
                    route: '/dashboard2',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.badge_dollar_sign,
                    title: "NFT",
                    route: '/NFTDashboard',
                    isCondensed: isCondensed,
                  ),
                  NavigationItem(
                    iconData: LucideIcons.chef_hat,
                    title: "food".tr(),
                    isCondensed: isCondensed,
                    route: '/foodDashboard',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.graduation_cap,
                    title: "job".tr(),
                    isCondensed: isCondensed,
                    route: '/dashboard/job',
                  ),
                  labelWidget('Apps'),
                  NavigationItem(
                    iconData: LucideIcons.calendar,
                    title: "calendar".tr(),
                    isCondensed: isCondensed,
                    route: '/calendar',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.message_square,
                    title: "chat".tr(),
                    isCondensed: isCondensed,
                    route: '/chat',
                  ),
                  MenuWidget(
                    iconData: LucideIcons.contact,
                    isCondensed: isCondensed,
                    title: "Contacts",
                    children: [
                      MenuItem(
                        title: "Members",
                        route: '/contacts/members',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "profile".tr(),
                        route: '/contacts/profile',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Edit Profile",
                        route: '/contacts/edit-profile',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.users,
                    isCondensed: isCondensed,
                    title: 'CRM',
                    children: [
                      MenuItem(
                        title: "Contacts",
                        route: '/crm/contacts',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Opportunities",
                        route: '/crm/opportunities',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.shirt,
                    title: 'ecommerce'.tr(),
                    children: [
                      MenuItem(
                        title: "product".tr(),
                        route: '/apps/ecommerce/products',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "add_product".tr(),
                        route: '/apps/ecommerce/add_products',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "product_detail".tr(),
                        isCondensed: isCondensed,
                        route: '/apps/ecommerce/product-detail',
                      ),
                      MenuItem(
                        title: "reviews".tr(),
                        isCondensed: isCondensed,
                        route: '/apps/ecommerce/product-reviews',
                      ),
                      MenuItem(
                        title: "customers".tr(),
                        isCondensed: isCondensed,
                        route: '/apps/ecommerce/customers',
                      ),
                    ],
                  ),
                  MenuWidget(iconData: LucideIcons.files, isCondensed: isCondensed, title: "files".tr(), children: [
                    MenuItem(
                      title: "manager".tr(),
                      route: '/apps/files',
                      isCondensed: widget.isCondensed,
                    ),
                    MenuItem(
                      title: "upload".tr(),
                      route: '/apps/files/upload',
                      isCondensed: widget.isCondensed,
                    ),
                  ]),
                  MenuWidget(iconData: LucideIcons.briefcase, isCondensed: isCondensed, title: "jobs".tr(), children: [
                    MenuItem(
                      title: "discover".tr(),
                      route: '/apps/jobs/discover',
                      isCondensed: widget.isCondensed,
                    ),
                    MenuItem(
                      title: "candidates".tr(),
                      route: '/apps/jobs/candidates',
                      isCondensed: widget.isCondensed,
                    ),
                    MenuItem(
                      title: "vacancies".tr(),
                      route: '/apps/jobs/vacancy',
                      isCondensed: widget.isCondensed,
                    ),
                  ]),
                  MenuWidget(
                    iconData: LucideIcons.dices,
                    isCondensed: isCondensed,
                    title: "Projects",
                    children: [
                      MenuItem(
                        title: "Project List",
                        route: '/projects/project-list',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Project Detail",
                        route: '/projects/project-detail',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Create Project",
                        route: '/projects/create-project',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  NavigationItem(
                    iconData: LucideIcons.square_kanban,
                    title: "kanban".tr(),
                    isCondensed: isCondensed,
                    route: '/kanban',
                  ),
                  NavigationItem(
                    iconData: LucideIcons.clipboard_check,
                    title: "todo".tr(),
                    isCondensed: isCondensed,
                    route: '/todo',
                  ),
                  labelWidget("pages".tr()),
                  NavigationItem(
                    iconData: LucideIcons.presentation,
                    title: "landing".tr(),
                    route: '/ui/landing',
                    isCondensed: isCondensed,
                  ),
                  MenuWidget(
                    iconData: LucideIcons.scan_face,
                    title: 'Auth',
                    children: [
                      MenuItem(
                        title: "login".tr(),
                        route: '/auth/login',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "sign_up".tr(),
                        route: '/auth/sign_up',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "forgot_password".tr(),
                        route: '/auth/forgot_password',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "reset_password".tr(),
                        route: '/auth/reset_password',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "locked".tr(),
                        route: '/auth/locked',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.circle_x,
                    title: 'Error',
                    children: [
                      MenuItem(
                        title: "ERROR-404",
                        route: '/error-404',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "ERROR-500",
                        route: '/error-500',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Coming Soon",
                        route: '/error/coming_soon',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "Maintenance",
                        route: '/maintenance',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.book_open_check,
                    isCondensed: isCondensed,
                    title: "Extra Pages",
                    children: [
                      MenuItem(
                        title: "FAQs".tr(),
                        route: '/faqs',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "pricing".tr(),
                        route: '/pricing',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "TimeLine",
                        isCondensed: isCondensed,
                        route: '/timeline',
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.layout_grid,
                    title: 'Widgets',
                    isCondensed: isCondensed,
                    children: [
                      MenuItem(
                        title: 'buttons'.tr(),
                        isCondensed: isCondensed,
                        route: '/ui/buttons',
                      ),
                      MenuItem(
                        title: 'tab_bar'.tr(),
                        isCondensed: isCondensed,
                        route: '/ui/tab_bar',
                      ),
                      MenuItem(
                        title: 'card'.tr(),
                        isCondensed: isCondensed,
                        route: '/ui/card',
                      ),
                      MenuItem(
                        title: 'dialog'.tr(),
                        isCondensed: isCondensed,
                        route: '/ui/dialog',
                      ),
                      MenuItem(
                        title: 'carousel'.tr(),
                        isCondensed: isCondensed,
                        route: '/ui/carousel',
                      ),
                      MenuItem(
                        title: 'notification'.tr(),
                        isCondensed: isCondensed,
                        route: '/ui/notification',
                      ),
                      MenuItem(
                        title: "drag_drop".tr(),
                        route: '/ui/drag_drop',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  MenuWidget(
                    iconData: LucideIcons.clipboard_type,
                    title: 'form'.tr(),
                    children: [
                      MenuItem(
                        title: "basic_forms".tr(),
                        route: '/ui/basic_forms',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "validation".tr(),
                        route: '/ui/validation',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "quill_editor".tr(),
                        route: '/ui/quill_editor',
                        isCondensed: widget.isCondensed,
                      ),
                      MenuItem(
                        title: "wizard".tr(),
                        route: '/ui/wizard',
                        isCondensed: widget.isCondensed,
                      ),
                    ],
                  ),
                  NavigationItem(
                    iconData: LucideIcons.file,
                    title: "starter".tr(),
                    route: '/starter',
                    isCondensed: isCondensed,
                  ),
                  labelWidget("other".tr()),
                  NavigationItem(
                    iconData: LucideIcons.table_properties,
                    title: "basic_tables".tr(),
                    route: '/other/basic_tables',
                    isCondensed: isCondensed,
                  ),
                  NavigationItem(
                    iconData: LucideIcons.chart_bar_big,
                    title: "syncfusion_charts".tr(),
                    route: '/other/syncfusion_charts',
                    isCondensed: isCondensed,
                  ),
                  NavigationItem(
                    iconData: LucideIcons.chart_bar_big,
                    title: "fl_chart".tr(),
                    route: '/flChart',
                    isCondensed: isCondensed,
                  ),
                  NavigationItem(
                    iconData: LucideIcons.map,
                    title: "maps".tr(),
                    route: '/maps/sf-maps',
                    isCondensed: isCondensed,
                  ),
                  MySpacing.height(16),
                  if (!isCondensed)
                    Center(
                      child: MyButton(
                          borderRadiusAll: AppStyle.buttonRadius.small,
                          elevation: 0,
                          padding: MySpacing.xy(12, 16),
                          onPressed: () {
                            UrlService.goToPurchase();
                          },
                          backgroundColor: contentTheme.primary,
                          child: MyText.labelMedium(
                            'purchase_now'.tr(),
                            color: contentTheme.onPrimary,
                          )),
                    ),
                  MySpacing.height(20),
                  if (!isCondensed)
                    InkWell(
                      onTap: () {
                        UrlService.goToPagger();
                      },
                      child: Padding(
                          padding: MySpacing.x(16),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8), // color: contentTheme.primary.withAlpha(40),
                                gradient: LinearGradient(colors: const [Colors.deepPurple, Colors.lightBlue], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white.withAlpha(32),
                                  ),
                                  child: Icon(LucideIcons.layout_dashboard, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                MyText.bodyLarge(
                                  "Ready to use page for any Flutter Project",
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                  ),
                                  child: MyText.bodyMedium(
                                    "Free Download",
                                    color: Colors.black,
                                    fontWeight: 600,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  if (isCondensed)
                    InkWell(
                      onTap: () {
                        UrlService.goToPagger();
                      },
                      child: Padding(
                          padding: MySpacing.x(12),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4), // color: contentTheme.primary.withAlpha(40),
                                gradient: LinearGradient(colors: const [Colors.deepPurple, Colors.lightBlue], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                            child: Center(
                              child: Icon(
                                LucideIcons.download,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          )),
                    ),
                  MySpacing.height(20),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? MySpacing.empty()
        : Container(
            padding: MySpacing.xy(24, 8),
            child: MyText.labelSmall(
              label.toUpperCase(),
              color: leftBarTheme.labelColor,
              muted: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
              fontWeight: 700,
            ),
          );
  }
}

class MenuWidget extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItem> children;

  const MenuWidget({super.key, required this.iconData, required this.title, this.isCondensed = false, this.active = false, this.children = const []});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with UIMixin, SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isActive = false;
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5).chain(CurveTween(curve: Curves.easeIn)));
    LeftbarObserver.attachListener(widget.title, onChangeMenuActive);
  }

  void onChangeMenuActive(String key) {
    if (key != widget.title) {
      // onChangeExpansion(false);
    }
  }

  void onChangeExpansion(value) {
    isActive = value;
    if (isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var route = UrlService.getCurrentUrl();
    isActive = widget.children.any((element) => element.route == route);
    onChangeExpansion(isActive);
    if (hideFn != null) {
      hideFn!();
    }
    // popupShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    // var route = Uri.base.fragment;
    // isActive = widget.children.any((element) => element.route == route);

    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (hide) => hideFn = hide,
        onChange: (value) {
          popupShowing = value;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: MyContainer.transparent(
            margin: MySpacing.fromLTRB(16, 0, 16, 8),
            color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
            padding: MySpacing.xy(8, 8),
            child: Center(
              child: Icon(
                widget.iconData,
                color: (isHover || isActive) ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                size: 20,
              ),
            ),
          ),
        ),
        menuBuilder: (_) => MyContainer.bordered(
          paddingAll: 8,
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          ),
        ),
      );
    } else {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(24, 0, 16, 0),
          paddingAll: 0,
          child: ListTileTheme(
            contentPadding: EdgeInsets.all(0),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child: ExpansionTile(
                tilePadding: MySpacing.zero,
                initiallyExpanded: isActive,
                maintainState: true,
                onExpansionChanged: (value) {
                  LeftbarObserver.notifyAll(widget.title);
                  onChangeExpansion(value);
                },
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.expand_more,
                    size: 18,
                    color: leftBarTheme.onBackground,
                  ),
                ),
                iconColor: leftBarTheme.activeItemColor,
                childrenPadding: MySpacing.x(12),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.iconData,
                      size: 20,
                      color: isHover || isActive ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                    ),
                    MySpacing.width(18),
                    Expanded(
                      child: MyText.labelLarge(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        color: isHover || isActive ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                      ),
                    ),
                  ],
                ),
                collapsedBackgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                backgroundColor: Colors.transparent,
                children: widget.children),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const MenuItem({
    super.key,
    this.iconData,
    required this.title,
    this.isCondensed = false,
    this.route,
  });

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.toNamed(widget.route!);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(4, 0, 8, 4),
          color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: MySpacing.xy(18, 7),
          child: MyText.bodySmall(
            "${widget.isCondensed ? "" : "- "}  ${widget.title}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.left,
            fontSize: 12.5,
            color: isActive || isHover ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
            fontWeight: isActive || isHover ? 600 : 500,
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const NavigationItem({super.key, this.iconData, required this.title, this.isCondensed = false, this.route});

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.toNamed(widget.route!);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(16, 0, 16, 8),
          color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
          padding: MySpacing.xy(8, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.iconData != null)
                Center(
                  child: Icon(
                    widget.iconData,
                    color: (isHover || isActive) ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                    size: 20,
                  ),
                ),
              if (!widget.isCondensed)
                Flexible(
                  fit: FlexFit.loose,
                  child: MySpacing.width(16),
                ),
              if (!widget.isCondensed)
                Expanded(
                  flex: 3,
                  child: MyText.labelLarge(
                    widget.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    color: isActive || isHover ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
