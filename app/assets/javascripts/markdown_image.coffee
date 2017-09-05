# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  # FileReaderに対応していない場合はアラートを出して処理を終了
  if !window.FileReader
    alert "file api がサポートされていません"
    return false

  createMarkdownImage = (file) ->
    markdown_image = {
      markdown_image: {
        image: file
      }
    }

    console.log JSON.stringify(markdown_image)

    $.ajax
      url: '/admin_writer/create_markdown_image',
      type: 'POST',
      dataType: "json",
      data: JSON.stringify(markdown_image),
      contentType: 'application/json; charset=utf-8'

      success:   (data, status, xhr)   ->
        if data
          markdown_path = data.markdown_path
          $dragArea = $('.drag-area')
          article_content = $dragArea.val() + '\r\n' + markdown_path
          $dragArea.val(article_content)
        else
          console.log data

      error:     (xhr,  status, error) -> console.log status


  fileRead = (event, file) ->
    # FileReaderを作成、引数fileを読み込み
    fileReader = new FileReader()
    fileReader.readAsDataURL(file)
    # FileReaderは非同期の処理なので、読み込みが完了し次第実行
    fileReader.onload = (event) ->
      file = event.target.result
      createMarkdownImage(file)

  # デフォルトの挙動をキャンセルするメソッド
  cancelEvent = (event) ->
    event.preventDefault()
    event.stopPropagation()
    return false

  # fileをD&Dした時に動くメソッド
  handleDroppedFile = (event) ->
    cancelEvent(event)
    # jsで準備されているドラッグされたfileを取得するメソッド
    files = event.originalEvent.dataTransfer.files
    # 複数一括アップロードに対応するためにfor文でまわす
    for file in files
      fileRead(event, file)

  # formの要素を取得
  $dragArea = $('.drag-area')
  $dragArea.bind("dragenter", cancelEvent)
  $dragArea.bind("dragover", cancelEvent)
  $dragArea.bind("drop", handleDroppedFile)
