$ ->
  # #で始まるアンカーをクリックした場合に処理
  $('.to-top-link').click ->
    # スクロールの速度
    speed = 500
    # ミリ秒
    # アンカーの値取得
    href = $(this).attr('href')
    # 移動先を取得
    target = $(if href == '#' or href == '' then 'html' else href)
    # 移動先を数値で取得
    position = target.offset().top
    # スムーススクロール
    $('body,html').animate { scrollTop: position }, speed, 'swing'
    false
  return
