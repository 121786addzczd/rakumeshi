$(function() {
  $('#js-search').click(function() {
    const $answer = $(this).find('.search-box');
    // hasClassメソッドは、引数に指定したクラスをオブジェクトが持っているか判定する。もっていればtrue、なければfalse
    if($answer.hasClass('open')) {
      $answer.removeClass('open');

      // 子要素のspanタグの中身をtextメソッドで書き換える
      $(this).find('span').text('+');

    } else {
      $answer.addClass('open');
      // slideDownメソッドで$answerを表示
      $answer.slideDown();

      // 子要素のspanタグの中身をtextメソッドで書き換える
      $(this).find('span').text('-');
    }
  });
});