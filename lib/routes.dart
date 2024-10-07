import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webui/helper/services/auth_services.dart';
import 'package:webui/views/apps/CRM/contacts_page.dart';
import 'package:webui/views/apps/CRM/opportunities.dart';
import 'package:webui/views/apps/calendar_screen.dart';
import 'package:webui/views/apps/contacts/edit_profile.dart';
import 'package:webui/views/apps/contacts/member_list.dart';
import 'package:webui/views/apps/contacts/profile.dart';
import 'package:webui/views/apps/todo/todo_screen.dart';
import 'package:webui/views/food_dashboard_screen.dart';
import 'package:webui/views/apps/ecommerce/add_product_screen.dart';
import 'package:webui/views/apps/ecommerce/customers.dart';
import 'package:webui/views/apps/ecommerce/product_detail.dart';
import 'package:webui/views/apps/ecommerce/product_screen.dart';
import 'package:webui/views/apps/ecommerce/reviews_page.dart';
import 'package:webui/views/apps/files/file_manager_page.dart';
import 'package:webui/views/apps/files/file_upload_page.dart';
import 'package:webui/views/apps/jobs/discover_page.dart';
import 'package:webui/views/apps/jobs/job_candidates_page.dart';
import 'package:webui/views/apps/jobs/job_vacancy_page.dart';
import 'package:webui/views/apps/kanban_screen.dart';
import 'package:webui/views/apps/projects/create_project.dart';
import 'package:webui/views/apps/projects/project_detail.dart';
import 'package:webui/views/apps/projects/project_list.dart';
import 'package:webui/views/auth/forgot_password_screen.dart';
import 'package:webui/views/auth/locked_screen.dart';
import 'package:webui/views/auth/login_screen.dart';
import 'package:webui/views/auth/reset_password_screen.dart';
import 'package:webui/views/auth/sign_up_screen.dart';
import 'package:webui/views/chat_screen.dart';
import 'package:webui/views/ecommerce_screen.dart';
import 'package:webui/views/error_pages/coming_soon_screen.dart';
import 'package:webui/views/error_pages/error_404.dart';
import 'package:webui/views/error_pages/error_500.dart';
import 'package:webui/views/error_pages/maintenance_page.dart';
import 'package:webui/views/extra_screens/faqs_screen.dart';
import 'package:webui/views/extra_screens/pricing_screen.dart';
import 'package:webui/views/extra_screens/time_line_screen.dart';
import 'package:webui/views/forms/basic_form_screen.dart';
import 'package:webui/views/forms/quill_editor_screen.dart';
import 'package:webui/views/forms/validation_form_screen.dart';
import 'package:webui/views/forms/wizard_screen.dart';
import 'package:webui/views/job_dashboard_screen.dart';
import 'package:webui/views/nft_screen.dart';
import 'package:webui/views/other/basic_table.dart';
import 'package:webui/views/other/fl_chart_screen.dart';
import 'package:webui/views/other/sfmap_page.dart';
import 'package:webui/views/other/synsfusion_chart.dart';
import 'package:webui/views/project_screen.dart';
import 'package:webui/views/starter_screen.dart';
import 'package:webui/views/ui/buttons_screen.dart';
import 'package:webui/views/ui/card_screen.dart';
import 'package:webui/views/ui/carousels_screen.dart';
import 'package:webui/views/ui/dialogs_screen.dart';
import 'package:webui/views/ui/drag_drop_screen.dart';
import 'package:webui/views/ui/notification_screen.dart';
import 'package:webui/views/ui/tab_screen.dart';

import 'package:webui/views/ui/landing_screen.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn
        ? null
        : const RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    GetPage(
        name: '/',
        page: () => const ProjectScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard2',
        page: () => EcommerceScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard',
        page: () => ProjectScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/foodDashboard',
        page: () => FoodDashboardScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/dashboard/job',
        page: () => JobDashboardScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/flChart',
        page: () => FlChartScreen(),
        middlewares: [AuthMiddleware()]),

    //------------------Authentication Screens------------------
    GetPage(name: '/auth/login', page: () => const LoginScreen()),
    GetPage(name: '/auth/sign_up', page: () => const SignUpScreen()),
    GetPage(
        name: '/auth/forgot_password',
        page: () => const ForgotPasswordScreen()),
    GetPage(
        name: '/auth/reset_password', page: () => const ResetPasswordScreen()),
    GetPage(name: '/auth/locked', page: () => const LockedScreen()),

    //----------------------Error-----------------------------------
    GetPage(
        name: '/error/coming_soon',
        page: () => ComingSoonScreen(),
        middlewares: [AuthMiddleware()]),

    //----------------------WIDGETS-----------------------------------
    GetPage(
        name: '/ui/buttons',
        page: () => ButtonsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/tab_bar',
        page: () => TabScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/dialog',
        page: () => DialogsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/carousel',
        page: () => CarouselsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/notification',
        page: () => NotificationScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/drag_drop',
        page: () => DragDropScreen(),
        middlewares: [AuthMiddleware()]),
    //------------------------Forms------------------------
    GetPage(
        name: '/ui/basic_forms',
        page: () => BasicFormScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/validation',
        page: () => ValidationFormScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/quill_editor',
        page: () => QuillEditorScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/wizard',
        page: () => WizardScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/pricing',
        page: () => PricingScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/kanban',
        page: () => KanBanScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/todo',
        page: () => TodoScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/calendar',
        page: () => CalendarScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/card',
        page: () => CardScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/products',
        page: () => ProductScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/add_products',
        page: () => AddProductScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/customers',
        page: () => CustomersPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/product-detail',
        page: () => ProductDetailPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/product-reviews',
        page: () => ReviewsPage(),
        middlewares: [AuthMiddleware()]),
    // GetPage(
    //     name: '/apps/ecommerce/invoice',
    //     page: () => InvoicePage(),
    //     middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/jobs/discover',
        page: () => JobDiscoverPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/jobs/candidates',
        page: () => JobCandidatePage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/jobs/vacancy',
        page: () => JobVacanciesPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/files',
        page: () => FileManagerPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/files/upload',
        page: () => FileUploadPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/contacts/profile',
        page: () => const ProfilePage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/contacts/members',
        page: () => const MemberList(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/contacts/edit-profile',
        page: () => const EditProfile(),
        middlewares: [AuthMiddleware()]),

    ///---------------- CRM ----------------///

    GetPage(
        name: '/crm/contacts',
        page: () => const ContactsPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/crm/opportunities',
        page: () => const OpportunitiesPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/projects/project-list',
        page: () => const ProjectListPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/projects/project-detail',
        page: () => const ProjectDetail(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/projects/create-project',
        page: () => const CreateProject(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/chat',
        page: () => const ChatPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/NFTDashboard',
        page: () => const NFTScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/landing',
        page: () => const LandingScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/error-404',
        page: () => const Error404(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/error-500',
        page: () => const Error500(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/maintenance',
        page: () => const MaintenancePage(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: '/faqs', page: () => const FaqsScreen()),
    GetPage(
        name: '/timeline',
        page: () => const TimeLinePage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/starter',
        page: () => const StarterScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/other/basic_tables',
        page: () => const BasicTable(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/other/syncfusion_charts',
        page: () => const SyncFusionChart(),
        middlewares: [AuthMiddleware()]),

    ///---------------- Maps ----------------///

    GetPage(
        name: '/maps/sf-maps',
        page: () => const SfMapScreen(),
        middlewares: [AuthMiddleware()]),

    // GetPage(
    //     name: '/maps/google-maps',
    //     page: () => const GoogleMapScreen(),
    //     middlewares: [AuthMiddleware()]),
  ];
  return routes
      .map((e) => GetPage(
          name: e.name,
          page: e.page,
          middlewares: e.middlewares,
          transition: Transition.noTransition))
      .toList();
}
