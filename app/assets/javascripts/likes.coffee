$ ->
  $('.like').on 'click', ->
    # スコープの関係上thisを変数に代入すると都合がいい
    $thisLike = $(this)

    article_id = {
      like: {
        article_id: $thisLike.attr('data_id')
      }
    }

    $.ajax
      url: '/likes'
      type: 'POST'
      dataType: 'json'
      data: JSON.stringify(article_id)
      contentType: 'application/json; charset=utf-8'

      success: (data, status, xhr) ->
        like_count = data[0]
        like_status = data[1]
        $thisLike.siblings('.like-count').text(" " + data[0])
        if like_status == 'create'
          $thisLike.css('color': '#888888')
        else if like_status == 'destroy'
          $thisLike.css('color': '#49bcbc')
