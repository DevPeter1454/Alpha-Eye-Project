class AnswerType {
  static const multipleChoice = 'MULTI_CHOICE';
  static const singleChoice = 'SINGLE_CHOICE';
  static const shortAnswer = 'SHORT_ANSWER';
  static const longAnswer = 'LONG_ANSWER';
  static const yesOrNo = 'YES_OR_NO';

  static String type(String type) {
    switch (type) {
      case multipleChoice:
        return 'Multi Choice';
      case singleChoice:
        return 'Single Choice';
      case shortAnswer:
        return 'Short Answer';
      case longAnswer:
        return 'Long Answer';
      case yesOrNo:
        return 'Yes or No';
      default:
        return '';
    }
  }
}
