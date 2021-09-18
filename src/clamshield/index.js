const { ipcRenderer } = require('electron')

document.addEventListener('DOMContentLoaded', () => {
  let n = new Notification('clamshield', {
    body: 'clamshield setup complete.'
  })

  // Tell the notification to show the menubar popup window on click
  n.onclick = () => { ipcRenderer.send('show-window') }
})
