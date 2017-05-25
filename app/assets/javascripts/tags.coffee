$ ->
  resetOpacity = ->
    $('.admin-tag-btn').css('opacity', '1')

  $('.admin-tag-btn').on 'click', ->
    $(this).css('opacity', '.6')
    setTimeout ->
      resetOpacity()
    , 100

    tag_name = {
      article: {
        tag_name : $('.admin-tag-name-field').val()
      }
    }

    $.ajax
      url: $(this).attr('url')
      type: $(this).attr('method')
      dataType: "json"
      data: JSON.stringify(tag_name)
      contentType: 'application/json; charset=utf-8'

      success:   (data, status, xhr)   ->
        $('.admin-tag-name-field').val("")
        if data[0]
          $('.add_fields').click()
          tag = data[0]
          $('.admin-tag-notice').text('タグが追加されました (formを送信すると適用されます)')
          $('.admin-tag').eq(-1).append $('<p class="m0"></p>').text(tag.name)
          $('.admin-tag-id-field').eq(-1).val(tag.id)
        else
          console.log "data : " + data
          $('.admin-tag-notice').text('タグが存在しません。追加に失敗しました。')

      error:     (xhr,  status, error) -> console.log status
