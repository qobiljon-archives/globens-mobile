const String GRPC_HOST = '165.246.42.173';
const int GRPC_PORT = 50053;

class VacancyRole {
  static const String BUSINESS_OWNER = 'individual entrepreneur';
  static const String EMPLOYEE = 'employee';
  static const String INDIVIDUAL_ENTREPRENEUR = 'individual entrepreneur';
}

class BusinessPageType {
  static const String SMALL_BUSINESS = 'small business';
  static const String LARGE_BUSINESS = 'large business';
}

class ProductAction {
  static const String CREATE = 'create';
  static const String UNCREATE = 'uncreate';
  static const String PUBLISH = 'publish';
  static const String UNPUBLISH = 'unpublish';
}

class VacancyAction {
  static const String CREATE = 'create';
  static const String UNCREATE = 'uncreate';
}
