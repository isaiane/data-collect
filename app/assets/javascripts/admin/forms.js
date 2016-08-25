function sortableFields() {
  $("ol.sortable_drop").sortable({
    group: 'no-drop',
    handle: '.icon-move',
    onDragStart: function ($item, container, _super) {
      // Duplicate items of the no drop area
      if(!container.options.drop)
        $item.clone().insertAfter($item);
      _super($item, container);
    }
  });
  $("ol.sortable_no_drop").sortable({
    group: 'no-drop',
    drop: false
  });
  $("ol.sortable_no_drag").sortable({
    group: 'no-drop',
    drag: false
  });
};

function userAccountAndProfile() {
  var accountId = $("select#user_account_id");
  $('[name="user[rule]"]').change(function(event) {
    if ($(this).val() > 4) {
      $(accountId).removeAttr("disabled");
    } else {
      $(accountId).attr("disabled", "disabled");
      $(accountId).val("");
    }
  });
}