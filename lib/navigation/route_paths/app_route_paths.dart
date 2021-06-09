// Routes
abstract class AppRoutePath {}

abstract class HomePath extends AppRoutePath {}

class HomeRootPath extends HomePath {}

class FeaturedMoviesPath extends HomePath {}

abstract class AccountPath extends AppRoutePath {}

class AccountRootPath extends AccountPath {}

class AccountDetailPath extends AccountPath {}

abstract class PlayPath extends AppRoutePath {}

class PlayRootPath extends AppRoutePath {}

class PlayMoviesPath extends AppRoutePath {}
