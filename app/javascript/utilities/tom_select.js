import TomSelect from "tom-select"

document.addEventListener("turbolinks:load", () => {
  const selectInput = document.getElementById('select-tags')
  if (selectInput) {
    new TomSelect(selectInput, {
      plugins: {
        remove_button:{
          title:'Remove this item',
        }
      },
      persist: false,
      // create: true,
      create: async function(input, callback) {
        const data = { name: input }
        const token = document.querySelector('meta[name="csrf-token"]').content
        let response = await fetch('/tags', {
          method: 'POST',
          headers:  {
            "X-CSRF-Token": token,
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: JSON.stringify(data)
        })
        let newTag = await response.json();

        return await callback({ value: newTag.id, text: newTag.name })
      },
      onDelete: function(values) {
        return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
      }
    })
  }
})
