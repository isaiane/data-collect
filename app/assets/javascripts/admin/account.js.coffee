jQuery ->
  new AccountCarrierWaveCropper()

class AccountCarrierWaveCropper
  constructor: ->
    $('#account_profile_image_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#account_profile_image_crop_x').val(coords.x)
    $('#account_profile_image_crop_y').val(coords.y)
    $('#account_profile_image_crop_w').val(coords.w)
    $('#account_profile_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#account_profile_image_previewbox').css
      width: Math.round(100/coords.w * $('#account_profile_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#account_profile_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
