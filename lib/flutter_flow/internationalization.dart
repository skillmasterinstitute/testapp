import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '5yi7tpc0': {
      'en': 'Hello, ',
      'hi': 'नमस्ते,',
    },
    '28gs0laz': {
      'en': 'Student ',
      'hi': 'विद्यार्थी',
    },
    't4zdvk88': {
      'en': 'Complete your Profile',
      'hi': 'अपनी प्रोफ़ाइल पूरी करें',
    },
    'ykhyfxg5': {
      'en': 'Admin Panel',
      'hi': 'व्यवस्थापक पैनल',
    },
    '3i7q4hpa': {
      'en': 'Create Test',
      'hi': 'परीक्षण बनाएँ',
    },
    's6pjj5go': {
      'en': 'Notification',
      'hi': 'अध्ययन सामग्री',
    },
    '8vtyu8jp': {
      'en': 'App Downloads',
      'hi': 'अध्ययन सामग्री',
    },
    'ogiqj4zr': {
      'en': 'Change Slides',
      'hi': 'अध्ययन सामग्री',
    },
    'v9ot7hik': {
      'en': 'Study Material',
      'hi': 'अध्ययन सामग्री',
    },
    't4ueahj4': {
      'en': '#Study Material',
      'hi': '#अध्ययन सामग्री',
    },
    '1n2igbz2': {
      'en': '#Test',
      'hi': '#परीक्षा',
    },
    '83pie18d': {
      'en': '#Lesson Plan',
      'hi': '#शिक्षण योजना',
    },
    'ct2vsa7k': {
      'en': 'Test Series',
      'hi': 'टेस्ट सीरीज',
    },
    'win4xp34': {
      'en': 'Common Subjects',
      'hi': 'सामान्य विषय',
    },
    '0xun9im5': {
      'en': 'Trade Theory',
      'hi': 'व्यापार सिद्धांत',
    },
    'oulw2s9b': {
      'en': 'Elevate Your Skills to Claim the',
      'hi': 'दावा करने के लिए अपने कौशल को उन्नत करें',
    },
    '90qm995f': {
      'en': '#1 Spot in India',
      'hi': 'भारत में #1 स्थान',
    },
    'wrvw1yfh': {
      'en': '#2',
      'hi': '',
    },
    '7t16xups': {
      'en': '#1',
      'hi': '',
    },
    'r13aml8b': {
      'en': '#3',
      'hi': '',
    },
    'kx1ncv9k': {
      'en': 'View All',
      'hi': '',
    },
    'anw09kdv': {
      'en': 'What our Students have to Say',
      'hi': '',
    },
    'mfag1hap': {
      'en': 'Give Feedback+',
      'hi': '',
    },
    'dyaa23yg': {
      'en': 'Need Help?',
      'hi': 'मदद की ज़रूरत है?',
    },
    'w9sifp1l': {
      'en': 'Chat with Us!',
      'hi': 'हमारे साथ चैट करें!',
    },
    'qqui1q0t': {
      'en': 'Get Help',
      'hi': 'मदद लें',
    },
    '692au7mh': {
      'en': 'Invite your friends for CITS Exam Preparation',
      'hi': 'सीआईटीएस परीक्षा की तैयारी के लिए अपने दोस्तों को आमंत्रित करें',
    },
    'gth7p9po': {
      'en': 'Share to Group',
      'hi': 'समूह में साझा करें',
    },
    'wgu7uan7': {
      'en': 'Update Profile Picture',
      'hi': '',
    },
    'rs9i3926': {
      'en':
          'We Are Building A Great Community for CITS Students. In order to maintain the Quality of Community we require your Profile Picture. \n\n\nClick anywhere to Update.',
      'hi': '',
    },
    'owunw5b6': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // SignUpPage
  {
    '3vfn7dop': {
      'en': 'Create an account',
      'hi': '',
    },
    'yaienss0': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
    },
    'axfb31cq': {
      'en': 'Phone No',
      'hi': '',
    },
    'sy1cwmk2': {
      'en': 'Select NSTI',
      'hi': '',
    },
    'ykpiqqq3': {
      'en': 'Search for an State',
      'hi': '',
    },
    'zrdqe4ou': {
      'en': 'Option 1',
      'hi': '',
    },
    'ge3etv5t': {
      'en': 'Select Trade',
      'hi': '',
    },
    'lwcgdv33': {
      'en': 'Search for an State',
      'hi': '',
    },
    'mdcnn7wr': {
      'en': 'I\'m Male',
      'hi': '',
    },
    '27gt5j6o': {
      'en': 'I\'m Female',
      'hi': '',
    },
    '0mt0e8jd': {
      'en': 'Get Started',
      'hi': '',
    },
    'e97t5ay7': {
      'en': 'SignUp',
      'hi': '',
    },
  },
  // CreateTest
  {
    'frxnfh9g': {
      'en': 'Create Test',
      'hi': '',
    },
    'p5xpvxfb': {
      'en': 'Select Trade...',
      'hi': '',
    },
    'bbeur836': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '4yvup4zd': {
      'en': 'Test No',
      'hi': '',
    },
    '7e23xvk6': {
      'en': 'Point per Marks ',
      'hi': '',
    },
    'xyjwvsqr': {
      'en': 'Duration of Test',
      'hi': '',
    },
    'lccl81pu': {
      'en': 'Create Test',
      'hi': '',
    },
    'nccbwa42': {
      'en': 'Add Questions to Tests',
      'hi': '',
    },
    '350zhuf7': {
      'en': 'Time',
      'hi': '',
    },
    'tsewt09n': {
      'en': 'Test Title is Required',
      'hi': '',
    },
    'rwnx42es': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'i7rs0f3z': {
      'en': 'Marks Per Question is Required',
      'hi': '',
    },
    'g6y5gagd': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'hevxx2v7': {
      'en': 'Fill Duration of Test in Minutes',
      'hi': '',
    },
    'ivnvvs9g': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
  },
  // CreateQuestion
  {
    'nn03sl29': {
      'en': 'Add Questions',
      'hi': '',
    },
    'hqlkxfaq': {
      'en': 'Question',
      'hi': '',
    },
    '9kpxve1j': {
      'en': 'Upload Image',
      'hi': '',
    },
    '67n7a2l9': {
      'en': 'Option A',
      'hi': '',
    },
    'rga3lqs6': {
      'en': 'Option B',
      'hi': '',
    },
    'b903chzz': {
      'en': 'Option C',
      'hi': '',
    },
    'v0rv8yuc': {
      'en': 'Option D',
      'hi': '',
    },
    'o6ikesl8': {
      'en': 'Add',
      'hi': '',
    },
  },
  // ResultPage
  {
    'zvja9trf': {
      'en': 'Share Certificate',
      'hi': '',
    },
    'jo6jn13l': {
      'en': 'Solution',
      'hi': '',
    },
    'byl8ezfx': {
      'en': 'Back to Tests',
      'hi': '',
    },
    'jk26enyy': {
      'en': 'Home',
      'hi': '',
    },
  },
  // EditTest
  {
    'okeljuak': {
      'en': 'Edit Test',
      'hi': '',
    },
    'k9opgxbx': {
      'en': 'Test Title',
      'hi': '',
    },
    'x6026g23': {
      'en': 'Point per Marks ',
      'hi': '',
    },
    '3yogtcc1': {
      'en': 'Duration of Test',
      'hi': '',
    },
    '3nr5acmd': {
      'en': 'Test Title is Required',
      'hi': '',
    },
    'gcluuwuj': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'oq0izsj0': {
      'en': 'Marks Per Question is Required',
      'hi': '',
    },
    'zp8g00bw': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'r96p8a5d': {
      'en': 'Fill Duration of Test in Minutes',
      'hi': '',
    },
    'pb93qpwz': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '0d9y8suc': {
      'en': 'Create Test',
      'hi': '',
    },
  },
  // TestPage
  {
    'ho2npbwp': {
      'en': 'A',
      'hi': '',
    },
    'faf2dls3': {
      'en': 'B',
      'hi': '',
    },
    'jl0a0noa': {
      'en': 'C',
      'hi': '',
    },
    'ay656rjw': {
      'en': 'D',
      'hi': '',
    },
    'e9dyga22': {
      'en': 'Previous',
      'hi': '',
    },
    'nwkoq8nx': {
      'en': 'Next',
      'hi': '',
    },
    'bellxrrg': {
      'en': 'Submit',
      'hi': '',
    },
    '4flniihi': {
      'en': 'You are out of Time!',
      'hi': '',
    },
  },
  // TestResult
  {
    'ck30qxj1': {
      'en': 'A',
      'hi': '',
    },
    'qkxkv1y1': {
      'en': 'B',
      'hi': '',
    },
    'dblpch7k': {
      'en': 'C',
      'hi': '',
    },
    'c9nzmd9p': {
      'en': 'D',
      'hi': '',
    },
    'qf25auf4': {
      'en': 'Back',
      'hi': '',
    },
    '6xy6sdxa': {
      'en': 'Close',
      'hi': '',
    },
    '87jwm4my': {
      'en': 'Next',
      'hi': '',
    },
  },
  // AddToChat
  {
    'qipslalf': {
      'en': 'Search for Students...',
      'hi': '',
    },
    'yxnee6xw': {
      'en': 'Select Student',
      'hi': '',
    },
    'vcv200zv': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AllChat
  {
    'ycbd7vjc': {
      'en': 'All Chats',
      'hi': '',
    },
    'sgodtd3w': {
      'en': 'Chat',
      'hi': '',
    },
  },
  // SendNotification
  {
    'tbd5d0mp': {
      'en': 'Push Notification',
      'hi': '',
    },
    'lcrzcobu': {
      'en': 'Title',
      'hi': '',
    },
    '6jhh0h2b': {
      'en': 'Enter Title Here.',
      'hi': '',
    },
    'g63qlqjx': {
      'en': 'Share Text',
      'hi': '',
    },
    'wnw0h45j': {
      'en': 'Enter Text to be shared with students.',
      'hi': '',
    },
    '2e8wdmgf': {
      'en': 'Image (Optional)',
      'hi': '',
    },
    'drhhpeyb': {
      'en': 'Upload Image',
      'hi': '',
    },
    '4wydp8rt': {
      'en': 'Recommended Image Size: 1080px X 540px',
      'hi': '',
    },
    'c722bmef': {
      'en': 'Set Audience',
      'hi': '',
    },
    'ahfyqtx9': {
      'en': 'All Users',
      'hi': '',
    },
    'yoguk2mn': {
      'en': 'All Users',
      'hi': '',
    },
    'm2pflzlv': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '2ayqrrk1': {
      'en': 'Proceed',
      'hi': '',
    },
    '0zdrpqis': {
      'en': 'Field is required',
      'hi': '',
    },
    'piifwghe': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'rbju3ral': {
      'en': 'Field is required',
      'hi': '',
    },
    'e2shv8fh': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'fcfwxr7v': {
      'en': 'Home',
      'hi': '',
    },
  },
  // PhoneLogin
  {
    'njc4tzfq': {
      'en': 'Code',
      'hi': '',
    },
    '1o0ue29x': {
      'en': '+91',
      'hi': '',
    },
    '9svfxp9y': {
      'en': 'Phone',
      'hi': '',
    },
    'oq0a6ogz': {
      'en': 'Sign In',
      'hi': '',
    },
    '4q58hy6e': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ProfilePage
  {
    'uuajt3cx': {
      'en': 'Log Out',
      'hi': '',
    },
    'mmz980ac': {
      'en': 'Profile',
      'hi': '',
    },
    '462mk1p4': {
      'en': 'Basic Information',
      'hi': '',
    },
    'z5hhnx15': {
      'en': 'Edit Profile',
      'hi': '',
    },
    '790b00xk': {
      'en': 'Name',
      'hi': '',
    },
    '4yqldaei': {
      'en': 'Email',
      'hi': '',
    },
    'gh193t5b': {
      'en': 'Mobile Number',
      'hi': '',
    },
    'p3v3jo4t': {
      'en': 'NSTI',
      'hi': '',
    },
    'zyoe7cqf': {
      'en': 'Trade',
      'hi': '',
    },
    'odun7q4r': {
      'en': 'Skill Points',
      'hi': '',
    },
    'epbf6zun': {
      'en': 'POT (TM)',
      'hi': '',
    },
    'oswgvijz': {
      'en': 'Share',
      'hi': '',
    },
    '99iinytz': {
      'en': 'Change',
      'hi': '',
    },
    '5hwc2wjw': {
      'en': 'Trade Theory',
      'hi': '',
    },
    'b1bi3od4': {
      'en': 'Change',
      'hi': '',
    },
    'p84mghgu': {
      'en': 'Profile',
      'hi': '',
    },
  },
  // CreateSlides
  {
    '58trxowh': {
      'en': 'Recommended Image Size: 800px X 600ppx',
      'hi': '',
    },
    'u70re2dg': {
      'en': 'Slide 1',
      'hi': '',
    },
    'xz9gw2dk': {
      'en': 'Update',
      'hi': '',
    },
    'dg854kqe': {
      'en': 'Remove',
      'hi': '',
    },
    'jfbd2g47': {
      'en': 'Course',
      'hi': '',
    },
    'i0jajv06': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'eci625l7': {
      'en': 'Update',
      'hi': '',
    },
    'lm3clwx1': {
      'en': 'Slide 2',
      'hi': '',
    },
    'kf4ax1ev': {
      'en': 'Update',
      'hi': '',
    },
    'iqi7qmxf': {
      'en': 'Remove',
      'hi': '',
    },
    'zais9ug3': {
      'en': 'Course',
      'hi': '',
    },
    'ekiuthna': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '3z0c69x3': {
      'en': 'Update',
      'hi': '',
    },
    '9vyu36j5': {
      'en': 'Slide 3',
      'hi': '',
    },
    'zag1sdl5': {
      'en': 'Update',
      'hi': '',
    },
    'sgpxs1qa': {
      'en': 'Remove',
      'hi': '',
    },
    'swx28cri': {
      'en': 'Course',
      'hi': '',
    },
    'jasces6i': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'yr3nj4u8': {
      'en': 'Update',
      'hi': '',
    },
    '7waslb5k': {
      'en': 'Slide 4',
      'hi': '',
    },
    'j86zv35w': {
      'en': 'Update',
      'hi': '',
    },
    '6ywzrrqk': {
      'en': 'Remove',
      'hi': '',
    },
    'mdoeh9eo': {
      'en': 'Course',
      'hi': '',
    },
    'g9t76ppz': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'punsaqpq': {
      'en': 'Update',
      'hi': '',
    },
    'wp6q5xji': {
      'en': 'Slide 5',
      'hi': '',
    },
    '8vbaean8': {
      'en': 'Update',
      'hi': '',
    },
    '11rfdvct': {
      'en': 'Remove',
      'hi': '',
    },
    'jxaplnih': {
      'en': 'Course',
      'hi': '',
    },
    '6x7ch0eh': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'nuksekvp': {
      'en': 'Update',
      'hi': '',
    },
    'mb6bmtuc': {
      'en': 'Slide 6',
      'hi': '',
    },
    'h02hkcq1': {
      'en': 'Update',
      'hi': '',
    },
    '1an70gzw': {
      'en': 'Remove',
      'hi': '',
    },
    'jnotqu08': {
      'en': 'Course',
      'hi': '',
    },
    'pm96rxx3': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '9zez4f22': {
      'en': 'Update',
      'hi': '',
    },
    'mc68pr0d': {
      'en': 'Slide 7',
      'hi': '',
    },
    'l8bbgk2f': {
      'en': 'Update',
      'hi': '',
    },
    '672lwb4t': {
      'en': 'Remove',
      'hi': '',
    },
    'sh49wolz': {
      'en': 'Course',
      'hi': '',
    },
    'rg1klsk6': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '35dm7d2a': {
      'en': 'Update',
      'hi': '',
    },
    '6j1tqm23': {
      'en': 'Slide 8',
      'hi': '',
    },
    'ndsp02rw': {
      'en': 'Update',
      'hi': '',
    },
    'jlz6jqyg': {
      'en': 'Remove',
      'hi': '',
    },
    'o1290nv3': {
      'en': 'Course',
      'hi': '',
    },
    'eq75ojux': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'mdtg5g1i': {
      'en': 'Update',
      'hi': '',
    },
    '4ftyejj5': {
      'en': 'Slide 9',
      'hi': '',
    },
    'ndjsu15i': {
      'en': 'Update',
      'hi': '',
    },
    'kyn5iv04': {
      'en': 'Remove',
      'hi': '',
    },
    'bn3harsy': {
      'en': 'Course',
      'hi': '',
    },
    '7t0ovbp3': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'or9h2u6l': {
      'en': 'Update',
      'hi': '',
    },
    'eh68y2q3': {
      'en': 'Slide 10',
      'hi': '',
    },
    '0w5k3bps': {
      'en': 'Update',
      'hi': '',
    },
    'e2gq1r6j': {
      'en': 'Remove',
      'hi': '',
    },
    'oau7ubef': {
      'en': 'Course',
      'hi': '',
    },
    'm8dizpue': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '02a2me0n': {
      'en': 'Update',
      'hi': '',
    },
    '1khvsece': {
      'en': 'Create Slides',
      'hi': '',
    },
  },
  // EditTestimonials
  {
    'a73ljhvn': {
      'en': 'Manage Feedback',
      'hi': '',
    },
    '6tiltecs': {
      'en': 'Home',
      'hi': '',
    },
  },
  // OTPLogin
  {
    'e7s2mhlq': {
      'en': 'Verifying your Number',
      'hi': '',
    },
    '9ajjq8k7': {
      'en': 'Enter the One Time Password sent to',
      'hi': '',
    },
    '02sjklqc': {
      'en': ' Wrong number?',
      'hi': '',
    },
    'vql1sjrh': {
      'en': 'Home',
      'hi': '',
    },
  },
  // TestSeries
  {
    'egavtph7': {
      'en': 'POT (TM)',
      'hi': '',
    },
    '7expfntm': {
      'en': 'Share',
      'hi': '',
    },
    'ybeauzar': {
      'en': 'Change',
      'hi': '',
    },
    '6nle9cjl': {
      'en': 'Trade Theory',
      'hi': '',
    },
    'c16tczaq': {
      'en': 'Change',
      'hi': '',
    },
    '1oimi6sf': {
      'en': 'Test Series',
      'hi': '',
    },
    'uv2qibi2': {
      'en': 'Button',
      'hi': '',
    },
    '8v0070tu': {
      'en': 'Tests',
      'hi': '',
    },
  },
  // Rank
  {
    'fbkra2yt': {
      'en': 'All India Ranking',
      'hi': '',
    },
    'iz4k9hu3': {
      'en': 'Training Methodology Tests',
      'hi': '',
    },
    '1wzb2lj3': {
      'en': 'Share',
      'hi': '',
    },
    'njdv5nfn': {
      'en': 'Institute Ranking',
      'hi': '',
    },
    'tvb16x9g': {
      'en': 'Change',
      'hi': '',
    },
    'v0969j2g': {
      'en': 'Trade Ranking',
      'hi': '',
    },
    '8vw7l0ob': {
      'en': 'Change',
      'hi': '',
    },
    'pbh39l7i': {
      'en': 'Ranking Based on Skill Points',
      'hi': '',
    },
    '1ij0o4tn': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ReportedQuestions
  {
    'dn7mvmog': {
      'en': 'Page Title',
      'hi': '',
    },
    '3fkpspbo': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Dashboard
  {
    'anbvwu8g': {
      'en': 'Admin Dashboard',
      'hi': '',
    },
    'hu90966l': {
      'en': 'Total Students',
      'hi': '',
    },
    'c6u43yyw': {
      'en': 'Student Tests',
      'hi': '',
    },
    'frqj4zz8': {
      'en': 'In-Complete',
      'hi': '',
    },
    '3y91l9dz': {
      'en': 'Completed',
      'hi': '',
    },
    'qjm9wj85': {
      'en': 'Select NSTI',
      'hi': '',
    },
    'j4plwuxn': {
      'en': 'Search for an State',
      'hi': '',
    },
    'va86gsk1': {
      'en': 'Option 1',
      'hi': '',
    },
    'kuqgak0z': {
      'en': 'Select Trade',
      'hi': '',
    },
    'juamynio': {
      'en': 'Search for an State',
      'hi': '',
    },
  },
  // CreateFeedback
  {
    'pg0i9vx0': {
      'en': 'Feedback',
      'hi': '',
    },
    'h08q6ocb': {
      'en': 'Name',
      'hi': '',
    },
    '4lbo9ogd': {
      'en': 'NSTI',
      'hi': '',
    },
    'ulswszrs': {
      'en': 'Name',
      'hi': '',
    },
    'j9sj5rx4': {
      'en': 'Write your Comment',
      'hi': '',
    },
    'br8a3nyx': {
      'en': 'Field is required',
      'hi': '',
    },
    '5w6wyh7d': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'fez3tnhb': {
      'en': 'Field is required',
      'hi': '',
    },
    'ixi9yyu4': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'uqffurw7': {
      'en': 'Field is required',
      'hi': '',
    },
    'ttps1uzk': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '2b2ct206': {
      'en': 'Field is required',
      'hi': '',
    },
    '9kwob7j7': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    't5uwqltd': {
      'en': 'Submit Feedback',
      'hi': '',
    },
    'vq0spdva': {
      'en': 'Student Test',
      'hi': '',
    },
  },
  // StudentPage
  {
    'ut9pd0nk': {
      'en': 'Profile',
      'hi': '',
    },
    'or9q9smw': {
      'en': 'Basic Information',
      'hi': '',
    },
    'es2wrjce': {
      'en': 'Name',
      'hi': '',
    },
    '3bjyipua': {
      'en': 'Mobile Number',
      'hi': '',
    },
    'jw5udhh3': {
      'en': 'Institute',
      'hi': '',
    },
    'ogba6esk': {
      'en': 'Trade',
      'hi': '',
    },
    'zryjgwtm': {
      'en': 'Skill Points',
      'hi': '',
    },
    'qnnakdsp': {
      'en': 'Test Attempted',
      'hi': '',
    },
    'qvp78bxe': {
      'en': 'Profile',
      'hi': '',
    },
  },
  // GoogleSignUp
  {
    'dnnq0ivh': {
      'en': 'Continue to Sign up for free',
      'hi': '',
    },
    'shfdew35': {
      'en': 'If you already have an account, we\'ll log you in.',
      'hi': '',
    },
    'w5w5leay': {
      'en': 'Continue with Google',
      'hi': '',
    },
    '9rfuo8tz': {
      'en': 'Home',
      'hi': '',
    },
  },
  // fast2sms
  {
    '2orlfz52': {
      'en': 'Code',
      'hi': '',
    },
    'gv9ja61q': {
      'en': '+91',
      'hi': '',
    },
    'h93l86pq': {
      'en': 'Phone',
      'hi': '',
    },
    'hc1s9b1w': {
      'en': 'Sign In',
      'hi': '',
    },
    'acmlaalq': {
      'en': 'Home',
      'hi': '',
    },
  },
  // fastotp
  {
    'ngivsujd': {
      'en': 'Verifying your Number',
      'hi': '',
    },
    'hwofrtxo': {
      'en': 'Enter the One Time Password sent to',
      'hi': '',
    },
    '8tesg3sd': {
      'en': ' Wrong number?',
      'hi': '',
    },
    'yeg851on': {
      'en': 'Home',
      'hi': '',
    },
  },
  // StudyMaterial
  {
    '2s3hhhdk': {
      'en': 'POT (TM)',
      'hi': '',
    },
    'huo6ojja': {
      'en': 'Share',
      'hi': '',
    },
    'twwa3lz2': {
      'en': 'Lesson Plan',
      'hi': '',
    },
    'dtpzxw01': {
      'en': 'Demo Plan',
      'hi': '',
    },
    '8t2t70a8': {
      'en': 'E-Books',
      'hi': '',
    },
    'aq64d5ua': {
      'en': 'Test Series',
      'hi': '',
    },
    'i7pbuysx': {
      'en': 'Notes',
      'hi': '',
    },
    '4tedxa6q': {
      'en': 'Videos',
      'hi': '',
    },
    'uie5zcoa': {
      'en': 'Change',
      'hi': '',
    },
    '9ksgtx66': {
      'en': 'E-Books',
      'hi': '',
    },
    '43v3o4ym': {
      'en': 'Test Series',
      'hi': '',
    },
    'snh2l6os': {
      'en': 'Notes',
      'hi': '',
    },
    'kqnpv2hx': {
      'en': 'Videos',
      'hi': '',
    },
    'dug7u818': {
      'en': 'Trade Theory',
      'hi': '',
    },
    'vv5zaq5n': {
      'en': 'Change',
      'hi': '',
    },
    'l87yaj3s': {
      'en': 'Lesson Plan',
      'hi': '',
    },
    'tqfg2er6': {
      'en': 'Demo Plan',
      'hi': '',
    },
    '413sqm09': {
      'en': 'E-Books',
      'hi': '',
    },
    'gln0xt4w': {
      'en': 'Test Series',
      'hi': '',
    },
    'i992wktl': {
      'en': 'Notes',
      'hi': '',
    },
    'zlwkt5sq': {
      'en': 'Videos',
      'hi': '',
    },
    'd4a4lack': {
      'en': 'Study Material',
      'hi': '',
    },
    'cyyewhq7': {
      'en': 'Button',
      'hi': '',
    },
    'aeed62u0': {
      'en': 'Material',
      'hi': '',
    },
  },
  // PDFView
  {
    'kbswazp4': {
      'en': 'Home',
      'hi': '',
    },
  },
  // StudyView
  {
    'dbknfj0v': {
      'en': 'Verified',
      'hi': '',
    },
    '0qv1tiif': {
      'en': 'Home',
      'hi': '',
    },
  },
  // CreateStudyMaterial
  {
    '9osndaou': {
      'en': 'Create Study Material',
      'hi': '',
    },
    'd3hlabms': {
      'en': 'Subject',
      'hi': '',
    },
    'ql8ccpn3': {
      'en': 'WC&S',
      'hi': '',
    },
    '3c8o5gzy': {
      'en': 'POT',
      'hi': '',
    },
    '6ahimztx': {
      'en': 'Soft Skills',
      'hi': '',
    },
    '2d3mpm3v': {
      'en': 'Select Subject...',
      'hi': '',
    },
    'ih3wmzvq': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'lepwsey8': {
      'en': 'Study Material Type...',
      'hi': '',
    },
    'tv3t2sqi': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '4wf3nb57': {
      'en': 'Title ',
      'hi': '',
    },
    'k660y1ws': {
      'en': 'Link',
      'hi': '',
    },
    'zsj1ytc6': {
      'en': 'Add Study Material',
      'hi': '',
    },
    'nc36wkhb': {
      'en': 'Field is required',
      'hi': '',
    },
    'wkylpsa2': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'ys1ojbos': {
      'en': 'Field is required',
      'hi': '',
    },
    'effsyakb': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'mesuop02': {
      'en': 'Trade',
      'hi': '',
    },
    'zbjwi40b': {
      'en': 'Select Trade...',
      'hi': '',
    },
    '51io2ryg': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'uqg4ycn5': {
      'en': 'Study Material Type...',
      'hi': '',
    },
    '1gzegvkl': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'ixbzoier': {
      'en': 'Title ',
      'hi': '',
    },
    'st0c7s1e': {
      'en': 'Link',
      'hi': '',
    },
    'mhcobr4d': {
      'en': 'Add Study Material',
      'hi': '',
    },
    'upmuszbu': {
      'en': 'Field is required',
      'hi': '',
    },
    '6sgerfj9': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '170bcncn': {
      'en': 'Field is required',
      'hi': '',
    },
    '5cbn4fot': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
  },
  // VideoView
  {
    'elrwyaxe': {
      'en': 'Verified',
      'hi': '',
    },
    'mqki3pzc': {
      'en': 'Home',
      'hi': '',
    },
  },
  // VideoPlayer
  {
    'y7130ofn': {
      'en': 'Home',
      'hi': '',
    },
  },
  // UploadStudyMaterial
  {
    'qd6apxk5': {
      'en': 'CITS Exam Preparation App',
      'hi': '',
    },
    'kchrtmgz': {
      'en': 'Share Study Material',
      'hi': '',
    },
    'zjl42e65': {
      'en': 'Select Trade...',
      'hi': '',
    },
    'uyhiuk92': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'yhfrpbw8': {
      'en': 'Study Material Type...',
      'hi': '',
    },
    'tlmvocjx': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'k1pmjct4': {
      'en': 'Upload Files',
      'hi': '',
    },
    'bq5b5plp': {
      'en': 'Submit',
      'hi': '',
    },
  },
  // changePhoto
  {
    '08b7z052': {
      'en': 'Update Profile',
      'hi': '',
    },
    '4otm1l3c': {
      'en': 'Upload a new photo, change email or Name.',
      'hi': '',
    },
    'v4tzctum': {
      'en': 'Display Name',
      'hi': '',
    },
    'iwes6pcf': {
      'en': 'Display Name',
      'hi': '',
    },
    '0c592b38': {
      'en': 'Phone Number',
      'hi': '',
    },
    'at2svu59': {
      'en': 'Change Profile Image',
      'hi': '',
    },
    'x54lqxd1': {
      'en': 'Save Changes',
      'hi': '',
    },
  },
  // StartChat
  {
    'bqukf5hu': {
      'en': 'Seems you don’t have any chat',
      'hi': '',
    },
    '8r5w7b2p': {
      'en': 'Chat with HelpDesk',
      'hi': '',
    },
  },
  // ChangeSubject
  {
    'qt0k0i78': {
      'en': 'Change your Trade',
      'hi': '',
    },
    'sk80hc37': {
      'en': 'Search Trade...',
      'hi': '',
    },
  },
  // ReportQuestion
  {
    '31jauobj': {
      'en': 'Report Question',
      'hi': 'रिपोर्ट प्रश्न',
    },
    'qy3l7a52': {
      'en': 'Question',
      'hi': 'सवाल',
    },
    'hx8m4bhw': {
      'en': 'Options',
      'hi': 'विकल्प',
    },
    'tlq0dngp': {
      'en': 'Describe the issue....',
      'hi': 'समस्या का वर्णन करें....',
    },
    'kfabu8y8': {
      'en': 'Submit',
      'hi': 'जमा करना',
    },
  },
  // ShareTestLink
  {
    '9ip3rxez': {
      'en': 'Test Details',
      'hi': '',
    },
    'vh727bhl': {
      'en': 'When you can attempt Test?',
      'hi': '',
    },
    'kp6ps3ox': {
      'en': 'Anytime',
      'hi': '',
    },
    'fbnnyxjr': {
      'en': 'How many times you can attempt Test?',
      'hi': '',
    },
    'j3628x57': {
      'en': 'Unlimited',
      'hi': '',
    },
    'f5jfjjl5': {
      'en': 'Copy Link ',
      'hi': '',
    },
    'yggfmoae': {
      'en': 'Copy Link ',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'inyijt1n': {
      'en': '',
      'hi': '',
    },
    'bs1bk3xm': {
      'en': '',
      'hi': '',
    },
    'feos82c8': {
      'en':
          'In order to receive latest notification from us, this app requirs the persmission to receive notification.',
      'hi': '',
    },
    'v7quaq1j': {
      'en': 'Allow Storage Permission to Save the file',
      'hi': '',
    },
    'zvlgcd9l': {
      'en': 'Allow Storge to Save the File',
      'hi': '',
    },
    '3u7n1to6': {
      'en': 'Allow Permission to View files on your phone',
      'hi': '',
    },
    'a0oz5yic': {
      'en': 'Allow Permission to Download files on your Phone.',
      'hi': '',
    },
    '6lyflgjy': {
      'en': '',
      'hi': '',
    },
    'i3ps99rx': {
      'en': '',
      'hi': '',
    },
    'zqj7pdr6': {
      'en': '',
      'hi': '',
    },
    'd5wns3px': {
      'en': '',
      'hi': '',
    },
    '62petraj': {
      'en': '',
      'hi': '',
    },
    'if36uqso': {
      'en': '',
      'hi': '',
    },
    '5pd081lc': {
      'en': '',
      'hi': '',
    },
    'ckok2uvg': {
      'en': '',
      'hi': '',
    },
    '3trg9vu2': {
      'en': '',
      'hi': '',
    },
    'rr2rpsvx': {
      'en': '',
      'hi': '',
    },
    'wfkgi78x': {
      'en': '',
      'hi': '',
    },
    'uo0dzb3m': {
      'en': '',
      'hi': '',
    },
    'dmye6hiz': {
      'en': '',
      'hi': '',
    },
    '4k5xrhj4': {
      'en': '',
      'hi': '',
    },
    'x0xnyxsp': {
      'en': '',
      'hi': '',
    },
    'bilcv0sz': {
      'en': '',
      'hi': '',
    },
    '0wqev3vm': {
      'en': '',
      'hi': '',
    },
    'wee0mivc': {
      'en': '',
      'hi': '',
    },
    '19x08jgi': {
      'en': '',
      'hi': '',
    },
    'fb5p03b1': {
      'en': '',
      'hi': '',
    },
    'nmto4vhx': {
      'en': '',
      'hi': '',
    },
    'dm29nyfy': {
      'en': '',
      'hi': '',
    },
    'wbh4i6kb': {
      'en': '',
      'hi': '',
    },
    'jii3seix': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
