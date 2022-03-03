import 'package:auto_route/auto_route.dart';
import 'package:contacts/contact.dart';
import 'package:contacts/contacts_list.dart';
import 'package:contacts/sign_in.dart';
import 'package:contacts/create_contact.dart';
import 'package:contacts/update_contact.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: EmptyRouterPage, initial: true,
      children: [
        AutoRoute(
          path: '',
          page: SignInPage,
        ),
        AutoRoute(
          path: '',
          page: ListPage,
        ),
        AutoRoute(
          path: '',
          page: ContactPage,
        ),
        AutoRoute(
          path: '',
          page: CreateContactPage,
        ),
        AutoRoute(
          path: '',
          page: UpdateContactPage,
        ),
      ],),

  ],
)
class $AppRouter {}