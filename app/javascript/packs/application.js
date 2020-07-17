// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.onclick = () => {
  const saveChangesButton = document.getElementById('save-changes')
  if (saveChangesButton !== null) {
    saveChangesButton.addEventListener('click', function(event) {
      const cover_image = document.getElementById('user_cover_images_attributes_0_image')
      const profile_image = document.getElementById('user_profile_images_attributes_0_image')
      if (cover_image.files[0] !== undefined ) {
        size = parseInt(cover_image.files[0].size) / 1024
        if ( size > 1024 ) {
          event.preventDefault()
        }
      }
      if (profile_image.files[0] !== undefined ) {
        size = parseInt(profile_image.files[0].size) / 1024
        if ( size > 1024 ) {
          event.preventDefault()
        }
      }
      console.log('finished validation')
    } )
  }
}
