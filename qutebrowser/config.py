# Qutebrowser Configuration
# Keyboard-driven, minimal browser

# ===== Appearance =====
c.colors.webpage.darkmode.enabled = True
c.statusbar.show = 'in-mode'
c.tabs.show = 'switching'
c.keyhint.delay = 0

# ===== Startup =====
# Force Perplexity as default
c.url.start_pages = ["https://www.perplexity.ai/"]
c.url.default_page = "https://www.perplexity.ai/"

# ===== Tabs =====
c.tabs.background = True
c.tabs.position = 'top'
c.tabs.new_position.unrelated = 'last'

# ===== Content & Blocking =====
c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.javascript.enabled = True
c.content.images = True
c.content.cookies.accept = 'all'

# ===== Scrolling & Input =====
c.scrolling.smooth = True
c.input.insert_mode.auto_load = True

# ===== Search Engines =====
c.url.searchengines = {
    'DEFAULT': 'https://www.perplexity.ai/',
    'g': 'https://www.google.com/search?q={}',
    'gh': 'https://github.com/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    'wiki': 'https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch={}',
}

# Load autoconfig.yml to preserve UI changes
config.load_autoconfig()

# ===== Hints =====
c.hints.chars = 'asdfghjkl'
c.hints.uppercase = False
c.hints.min_chars = 1

# ===== Downloads =====
c.downloads.location.directory = '~/Downloads'
c.downloads.location.prompt = False

# ===== Editor =====
c.editor.command = ['code', '{}']

# ===== Privacy & Security =====
c.content.headers.user_agent = None
c.content.headers.referer = 'same-domain'
c.content.headers.accept_language = 'en-US,en;q=0.9'

# ===== Performance =====
c.qt.process_model = 'process-per-site'
c.qt.low_end_machine_multiplier = 1

# ===== Keybindings =====
config.bind(',m', 'spawn mpv {url}')
config.bind(',p', 'spawn mpv --ytdl-format=best {url}')
config.bind(',d', 'download')
config.bind(',s', 'view-source')
config.bind('gf', 'view-source')
config.bind('gh', 'home')
config.bind('gH', 'back')
config.bind('gl', 'forward')
config.bind('gt', 'tab-focus')
config.bind('gT', 'tab-focus -1')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('x', 'tab-close')
config.bind('u', 'undo')
config.bind('U', 'undo -w')
config.bind('<Ctrl-l>', 'fake-key <Ctrl-a>')
config.bind('zi', 'zoom-in')
config.bind('zo', 'zoom-out')
config.bind('z0', 'zoom')
config.bind('yy', 'yank')
config.bind('yY', 'yank -s')
config.bind('pp', 'open -- {clipboard}')
config.bind('pP', 'open -t -- {clipboard}')
