jQuery ->
  if $('.sortable').length > 0
    list_width = $('.sortable').width()
    cells = $('.sortable').find('.item')[0].length
    desired_width = list_width / cells + 'px'
    $('.sortable td').css('width', desired_width)

    $('.sortable').sortable(
      axis: 'y'
      items: '.item'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        # highlight the row on drop to indicate an update
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        position = ui.item.index() # this will not work with paginated items, as the index is zero on every page
        $.ajax(
          type: 'POST'
          url: $(e.target).data('url')
          dataType: 'json'
          data: { item: {item_id: item_id, row_order_position: position } }
        )
    )