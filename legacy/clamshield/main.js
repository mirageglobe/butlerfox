const { app, BrowserWindow, ipcMain, Tray, nativeImage } = require('electron')
const path = require('path')

const assetsDir = path.join(__dirname, 'assets')

let tray = undefined
let window = undefined

// main method for electron
app.on('ready', () => {
  // Setup the menubar with an icon
  let icon = nativeImage.createFromDataURL(base64Icon)
  tray = new Tray(icon)

  // Add a click handler so that when the user clicks on the menubar icon, it shows
  // our popup window
  tray.on('click', function (event) {
    toggleWindow()

    // Show devtools when command clicked
    if (window.isVisible() && process.defaultApp && event.metaKey) {
      window.openDevTools({ mode: 'detach' })
    }
  })

  // Make the popup window for the menubar
  window = new BrowserWindow({
    width: 300,
    height: 350,
    show: false,
    frame: false,
    resizable: false
  })

  // Tell the popup window to load our index.html file
  window.loadURL(`file://${path.join(__dirname, 'index.html')}`)

  // Only close the window on blur if dev tools isn't opened
  window.on('blur', () => {
    if (!window.webContents.isDevToolsOpened()) {
      window.hide()
    }
  })
})

const toggleWindow = () => {
  if (window.isVisible()) {
    window.hide()
  } else {
    showWindow()
  }
}

const showWindow = () => {
  const trayPos = tray.getBounds()
  const windowPos = window.getBounds()
  let x = 0
  let y = 0

  if (process.platform === 'darwin') {
    x = Math.round(trayPos.x + (trayPos.width / 2) - (windowPos.width / 2))
    y = Math.round(trayPos.y + trayPos.height)
  } else {
    x = Math.round(trayPos.x + (trayPos.width / 2) - (windowPos.width / 2))
    y = Math.round(trayPos.y + trayPos.height * 10)
  }

  window.setPosition(x, y, false)
  window.show()
  window.focus()
}

ipcMain.on('show-window', () => {
  showWindow()
})

app.on('window-all-closed', () => {
  // On macOS it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

let base64Icon = `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAYAAAByUDbMAAAABHNCSVQICAgIfAhkiAAAANJJREFUOI2tlEEKwjAQRb/FiJauFQTxAD2F297/BC5ddCNdicaFE/gZvgkt/TCkTWbeDJNpgRW1EXtxaXzjNueA2D+DtgBGO/wAGCqQwfxeFtPyYWebkUA7W/funYEpplOwyZdc0cSwpuyLC2Vnk1Kwjta7PR/NilKwp1sT5DEX5vulQOyT3WJSQN6PM3SvfL8ifiMVfBY1gD7YVy6HNh0kO6jySVfze3NC7hnTbwC2f0ABQE/xxbnkCk8uGfeyersKqGxUQaUSS3+QOZ/cusGL9AWYyUAow0E8FQAAAABJRU5ErkJggg==`

// let base64Icon = `data:image/pdf;base64,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`
// Tray Icon as Base64 so tutorial has less overhead
