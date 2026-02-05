c.JupyterHub.tornado_settings = {
    'headers': {
         'Content-Security-Policy': 'frame-ancestors self https://app.dwo.nl',
    }
}
c.Spawner.args = ['--NotebookApp.tornado_settings={
  'headers':{
    'Content-Security-Policy': 'frame-ancestors self https://app.dwo.nl',
  }
}']
