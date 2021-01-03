// 新規投稿画面で動く関数を定義
if (location.pathname.match("posts/new")){
  document.addEventListener("DOMContentLoaded", () => {
    // タグの検索に必要な情報を取得
    const inputElement = document.getElementById("js-tag-form");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("js-tag-form").value;
      // XMLHttpRequestオブジェクトを生成
      const XHR = new XMLHttpRequest();
      // openメソッドを用いてリクエストを定義
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      // レスポンスの形式を指定
      XHR.responseType = "json";
      // リクエストを送信
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("js-search-result");
        // 表示されているタグを消す
        searchResult.innerHTML = "";
        if (XHR.response) {
          // サーバーサイドからのレスポンスを受け取る
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            // タグを表示させる処理を記述
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            // クリックしたタグ名がフォームに入力されるようにする
            clickElement.addEventListener("click", () => {
              document.getElementById("js-tag-form").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};