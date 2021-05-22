class Language {
  static const ENGLISH = -1;
  static const RUSSIAN = 0;
  static const KOREAN = 1;
  static const UZBEK = 2;

  static int languageCodeFromString(String str) {
    switch (str) {
      case "en":
        return Language.ENGLISH;
      case "ru":
        return Language.RUSSIAN;
      case "kr":
        return Language.KOREAN;
      case "uz":
        return Language.UZBEK;
    }
    return null;
  }

  static String languageCodeStringFromInt(int languageCode) {
    switch (languageCode) {
      case Language.ENGLISH:
        return "en";
      case Language.RUSSIAN:
        return "ru";
      case Language.KOREAN:
        return "kr";
      case Language.UZBEK:
        return "uz";
    }
    return null;
  }

  static String languagePrettyStringFromInt(int languageCode) {
    switch (languageCode) {
      case Language.ENGLISH:
        return "English";
      case Language.RUSSIAN:
        return "Pусский";
      case Language.KOREAN:
        return "한국어";
      case Language.UZBEK:
        return "O'zbekcha";
    }
    return null;
  }
}

class Locale {
  static const REPLACE = "***";

  static int languageCode = Language.ENGLISH;

  /*
  * Returns the translation string of s
  * Usage:
  * a) Locale.get("Select language")
  * b) Locale.get("Application form for $REPLACE", "Google") // replaces the REPLACE part with Google
  * */
  static String get(String s, [String arg]) {
    var res = s;
    if (_stringsMap.containsKey(s)) if (0 <= languageCode && languageCode < _stringsMap[s].length) res = _stringsMap[s][languageCode];
    if (arg != null) res = res.replaceAll(REPLACE, arg);
    return res;
  }

  // Add new strings in the format of ENGLISH: [RUSSIAN, KOREAN, UZBEK]
  static Map<String, List<String>> _stringsMap = {
    "Select language": ["Выберите язык", "언어 선택", "Tilni tanlang"],
    "Sign in with Google account": ["Войти в систему через Google аккаунт", "Google-로 로그인", "Google orqali tizimga kirish"],
    "Signed in with Google.": ["Вы вошли в систему с помощью Google.", "Google로 로그인했습니다.", "Google bilan tizimga kirildi."],
    "Failed to login with Google.\nPlease try again later!": ["Не удалось войти в систему с помощью Google. \nПовторите попытку позже!", "Google로 로그인하지 못했습니다. \n나중에 다시 시도하십시오!", "Google bilan kirish amalga oshmadi. \nIltimos, keyinroq qayta urinib ko'ring!"],
    "App menu": ["Меню", "앱 메뉴", "Ilova menyusi"],
    "Sign out": ["Выход", "로그 아웃", "Tizimdan chiqish"],
    "Sign in": ["Войти", "로그인", "Tizimga kirish"],
    "Language": ["Язык", "언어", "Tilni tanlash"],
    "Go to menu": ["Перейти в меню", "메뉴로 이동", "Menyuga o'ting"],
    "Business details": ["Детали бизнеса", "사업 내용", "Biznes tafsilotlari"],
    "Name of business": ["Название бизнеса", "업체명", "Biznes nomi"],
    "e.g., SpaceX": ["например, SpaceX", "예 : SpaceX", "masalan, SpaceX"],
    "Create": ["Создать", "창조하다", "Yaratmoq"],
    "Title must be at least two characters": ["Название должен состоять не менее чем из двух символов.", "제목은 2 자 이상이어야합니다.", "Nomi kamida ikkita belgidan iborat bo'lishi kerak"],
    "A business page must have an icon": ["На бизнес-странице должен быть значок", "비즈니스 페이지에는 아이콘이 있어야합니다.", "Biznes sahifasida belgi bo'lishi kerak"],
    "Hour selector": ["Селектор часов", "시간 선택기", "Soat tanlovchisi"],
    'Application form': ['Форма заявки', '신청서', 'Ish ariza formasi'],
    'Apply to "$REPLACE"': ['Подать заявку на "$REPLACE"', '신청서 "$REPLACE"', '"$REPLACE" uchun ariza to\'ldirish'],
    "Your message goes here": ["Ваше сообщение", "메시지", "Habar matni"],
    "Submit application form": ["Подать заявку", "신청서 제출", "Ariza formasini yuboring"],
    'Submitted by : $REPLACE': ["Отправлено $REPLACE", "에 의해 제출 된 $REPLACE", "$REPLACE tomonidan yuborilgan"],
    "Loading": ["Загружается ..", "로딩 중 ..", "Yuklanmoqda .."],
    "you": ["вы", "당신", "siz"],
    "Approve": ["Одобрить", "주장", "Ruxsat berish"],
    "Reject": ["Oтказать", "쇠퇴", "Ruxsat bermaslik"],
    "Message can't be less than 5 characters.": ["Сообщение не может быть короче 5 символов.", "메시지는 5 자 이상이어야합니다.", "Xabar 5 ta belgidan kam bo'lmasligi kerak."],
    "Submitted": ["Поданный", "제출 됨", "Yuborilgan"],
    "Success": ["Успешно", "성공적으로", "Muvaffaqiyatli"],
    'MON': ["ПН", "월", "DU"],
    'TUE': ["ВТ", "화", "SE"],
    'WED': ["СР", "수", "CH"],
    'THU': ["ЧТ", "목", "PA"],
    'FRI': ["ПТ", "금", "JU"],
    'SAT': ["СБ", "토", "SH"],
    'SUN': ["ВС", "일", "YA"],
    "Time slot selector": ["Выберите интервал", "시간 슬롯 선택기", "Vaqt oralig'ini tanlang"],
    'ALL': ["ВСЕ", "모두", "HAMMA"],
    "Method": ["Метод", "방법", "Usul"],
    "Camera": ["Камера", "카메라", "Kamera"],
    "Gallery": ["Галерея", "갤러리", "Galereya"],
    "Select date": ["Выберите дату", "날짜 선택", "Sanani tanlang"],
    "Select hour": ["Выберите час", "시간 선택", "Soatni tanlang"],
    "Vacancy details": ["Детали вакансии", "공석 세부 정보", "Vakansiya tafsilotlari"],
    "Vacancy name": ["Название вакансии", "공석 이름", "Vakansiya nomi"],
    "e.g., Assistant sales manager": ["например, менеджер", "예 : 관리자", "masalan, menejer"],
    "Vacancy title cannot be less than two characters": ["Название вакансии не может быть короче двух символов.", "공석 제목은 2 자 이상이어야합니다.", "Vakansiyaning nomi ikki belgidan kam bo'lmasligi kerak."],
    "Top hit products": ["Лучшие товары", "인기 제품", "Eng yaxshi mahsulotlar"],
    "Product categories": ["Категории товаров", "제품 카테고리", "Mahsulot kategoriyalari"],
    'Category': ["Категория", "범주", "Kategoriya"],
    "Related items": ["Похожие элементы", "관련 항목", "Muvofiq elementlar"],
    "by $REPLACE": ["к $REPLACE", "$REPLACE 으로", "$REPLACE dan"],
    'Vacancies': ["Bакансии", "공석", "Vakansiyalar"],
    "Apply": ["Подать заявление", "대다", "Ariza bering"],
    "You have already applied for this position!": ["Вы уже подали заявку на эту должность!", "이 직책에 이미 지원했습니다!", "Siz allaqachon ushbu lavozimga murojaat qilgansiz!"],
    'Business page': ["Бизнес-страница", "비즈니스 페이지", "Biznes sahifasi"],
    "Create new product": ["Создать новый продукт", "새 제품 만들기", "Yangi mahsulot yarating"],
    "Create new vacancy": ["Создать новую вакансию", "새 공석 생성", "Yangi vakansiya yaratish"],
    "Employees and vacancies": ["Сотрудники и вакансии", "직원 및 공석", "Xodimlar va vakansiyalar"],
    "Products": ["Продукты", "제품", "Mahsulotlar"],
    "Job applications": ["Заявления о приеме на работу", "입사 지원서", "Ish uchun arizalar"],
    "My business pages": ["Мои бизнес-страницы", "내 비즈니스 페이지", "Mening biznes sahifalarim"],
    "Build a new business": ["Построить новый бизнес", "새로운 비즈니스 구축", "Yangi biznes qurish"],
    "My role: $REPLACE": ["Моя роль: $REPLACE", "나의 역할: $REPLACE", "Mening rolim: $REPLACE"],
    'Downloadable files': ["Загружаемые файлы", "다운로드 가능한 파일", "Yuklab olinadigan fayllar"],
    'Streamed files': ["Потоковые файлы", "스트리밍 파일", "Jonli fayllar"],
    'Scheduled face-to-face meeting': ["Запланированная личная встреча", "예약 된 대면 회의", "Rejalashtirilgan yuzma-yuz uchrashuv"],
    'Scheduled online call': ["Запланированный онлайн-звонок", "예약 된 온라인 통화", "Rejalashtirilgan onlayn qo'ng'iroq"],
    "Product details": ["Информация о продукте", "제품 세부 정보", "Mahsulot tafsilotlari"],
    "Basic information": ["Основная информация", "기본 정보", "Asosiy ma'lumotlar"],
    "Product name": ["Наименование товара", "상품명", "Mahsulot nomi"],
    "e.g., Yoga training 24/7": ["например, занятия йогой 24/7", "예 : 요가 훈련 연중 무휴", "masalan, 24/7 yoga mashg'uloti"],
    "Price per time slot": ["Цена за временной интервал", "시간 슬롯 당 가격", "Vaqt oralig'idagi narx"],
    "Price": ["Цена", "가격", "Narx"],
    "e.g., 1000": ["например, 1000", "예 : 1000", "masalan, 1000"],
    "Product category: $REPLACE": ["Категория продукта: $REPLACE", "제품 카테고리: $REPLACE", "Mahsulot toifasi: $REPLACE"],
    "Product description": ["Описание товара", "상품 설명", "Mahsulot tavsifi"],
    "e.g., the best product.": ["например, лучший продукт.", "예 : 최고의 제품.", "masalan, eng yaxshi mahsulot."],
    "Product content": ["Koнтeнт продукта", "제품 내용", "Mahsulot tarkibi"],
    "Schedule": ["График", "시간표", "Jadval"],
    "Content type: $REPLACE": ["Тип кoнтeнтa: $REPLACE", "컨텐츠 타입: $REPLACE", "Tarkib turi: $REPLACE"],
    "Select content": ["Выбрать контент", "콘텐츠 선택", "Tarkibni tanlang"],
    "Reselect": ["Выбрать повторно", "재 선택", "Qayta tanlang"],
    "Available from": ["Доступна с", "사용 가능", "Dan mavjud"],
    "Available until": ["Доступно до", "까지 사용 가능", "Gacha mavjud"],
    "Available time slots": ["Доступные временные интервалы", "이용 가능한 시간대", "Mavjud vaqt oraliqlari"],
    "$REPLACE selected": ["$REPLACE был выбран", "$REPLACE 선택되었습니다", "$REPLACE tanlandi"],
    "Proceed with this product": ["Продолжить с этим продуктом", "이 제품으로 진행", "Ushbu mahsulot bilan davom eting"],
    'Please specify your available time slots for this product': ["Укажите доступные временные интервалы для этого продукта", "이 제품에 대해 사용 가능한 시간 슬롯을 지정하십시오", "Iltimos, ushbu mahsulot uchun mavjud vaqt oralig'ingizni ko'rsating"],
    'Please specify the content (attachment files) for this product': ["Пожалуйста, укажите содержимое (прикрепленные файлы) для этого продукта", "이 제품의 내용 (첨부 파일)을 지정하십시오.", "Iltimos, ushbu mahsulot uchun tarkibni (biriktirma fayllari) ko'rsating"],
    "Product title must not be shorter than two characters!": ["Название продукта не должно быть короче двух символов!", "제품 제목은 2 자 이하 여야합니다!", "Mahsulot nomi ikkita belgidan qisqa bo'lmasligi kerak!"],
    "Please check the price value!": ["Пожалуйста, проверьте значение цены!", "가격 값을 확인하세요!", "Iltimos, narx qiymatini tekshiring!"],
    "Please upload a feature image for the product!": ["Загрузите изображение функции продукта!", "제품의 기능 이미지를 업로드하세요!", "Iltimos, mahsulot uchun xususiyatli rasmni yuklang!"],
    'At least one attachment (file) required for a product of type - $REPLACE': ["По крайней мере, одно приложение (файл), необходимое для продукта типа ${REPLACE}a", "다음 유형의 제품에 필요한 하나 이상의 첨부 파일 (파일) - $REPLACE", "$REPLACE turdagi mahsulot uchun kamida bitta qo'shimcha (fayl) kerak"],
    'At least one available time slot required for a product of type - $REPLACE': ["По крайней мере, один доступный временной интервал, необходимый для продукта типа ${REPLACE}a", "유형의 제품에 필요한 하나 이상의 사용 가능한 시간 슬롯 - $REPLACE", "$REPLACE turdagi mahsulot uchun kamida bitta mavjud vaqt oralig'i kerak"],
    'Problem with product content, please try again!': ["Проблема с содержимым продукта, попробуйте еще раз!", "제품 내용에 문제가 있습니다. 다시 시도하십시오!", "Mahsulot tarkibi bilan bog'liq muammo, qayta urinib ko'ring!"],
    "Selection cancelled!": ["Выбор отменен!", "선택이 취소되었습니다!", "Tanlov bekor qilindi!"],
    "Actions": ["Действия", "동작", "Bajarish"],
    "Purchase": ["Покупка", "매수", "Xarid qilish"],
    'My pages': ["Мои страницы", "내 페이지", "Mening sahifalarim"],
    "Menu": ["Меню", "메뉴", "Menyu"],
    "Please Sign In first!": ["Пожалуйста, войдите сначала!", "먼저 로그인하세요!", "Iltimos, avval kiring!"],
    "Try": ["Пробная версия", "평가판", "Sinab ko'rmoq"],
    "Sign up": ["Зарегистрироваться", "가입하기", "Ro'yxatdan o'tish"],
    "Duration (months)": ["Продолжительность (мес.)", "기간 (개월)", "Muddati (oylar)"],
    "Review": ["Отзывы","리뷰","Fikr-mulohaza"],
    "Write a review": ["Оставить отзыв", "리뷰 쓰기", "Fikr-mulohaza qoldirish"],
    "Review title": ["Тема отзыва", "리뷰 제목", "Habar mavzusi"],
    "Review message (optional)": ["Сообщение (выборочно)", "리뷰 메시지 (선택)", "Habar (majburiy emas)"],
    "Ratings and Reviews": ["Рейтинги и обзоры","평가 및 리뷰","Reytinglar va sharhlar"],
    "Send": ["Oтправлять", "보내다", "Topshirish"],
    "Try again later": ["Попробуйте позже","나중에 다시 시도","Keyinroq sinab ko'ring"],
    "Anonymous user": ["Анонимный пользователь","익명 사용자","Anonim foydalanuvchi"],
    "Country": ["Страна","국가","Davlat"]
  };
}
