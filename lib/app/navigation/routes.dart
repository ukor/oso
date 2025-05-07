///
/// A single instance of the App route
///
class AppRoute {
  late String name;
  late String path;

  bool requiresAuthentication = true;

  AppRoute.fromName({required rName, requiresAuth = false})
    : requiresAuthentication = requiresAuth {
    name = requiresAuth ? "a-$rName" : "n-$rName";

    path = requiresAuth ? "/a/$rName" : "/n/$rName";
  }

  AppRoute(this.name, this.path);
}
