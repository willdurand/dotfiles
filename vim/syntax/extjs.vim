" Vim syntax file
" Language:    JavaScript
" Maintainer:  David W Davis <xantus@xantus.org> http://xant.us/
" URL:           http://xant.us/extjs/javascript.vim
" Updated 2009 Jul 23
" put this file in ~/.vim/syntax/


" Based on the JavaScript vim syntax maintained by
" Claudio Fleiner <claudio@fleiner.com>
" http://www.fleiner.com/vim/syntax/javascript.vim
" Modified for Extjs v3, http://extjs.com/
" By David W Davis, contact David not Claudio
" about THIS syntax definition!


" tuning parameters:
" unlet javaScript_fold

if !exists('main_syntax')
  if version < 600
    syntax clear
  elseif exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'javascript'
endif

if version < 600 && exists('javaScript_fold')
  unlet javaScript_fold
endif

"syn case ignore


syn match javaScriptExtjsMethod         "\w\+\s*\:\s*function"
syn match javaScriptSpecialFn           "console\.log\|Ext\.log"
syn match javaScriptExtjsCore           "Ext\.\(BLANK_IMAGE_URL\|SSL_SECURE_URL\|USE_NATIVE_JSON\|emptyFn\|enableFx\|enableGarbageCollector\|enableListenerCollection\|isAir\|isBorderBox\|isChrome\|isGecko2\|isGecko3\|isGecko\|isIE6\|isIE7\|isIE8\|isIE\|isLinux\|isMac\|isOpera\|isReady\|isSafari2\|isSafari3\|isSafari4\|isSafari\|isSecure\|isStrict\|isWindows\|useShims\|version\|addBehaviors\|applyIf\|apply\|clean\|copyTo\|decode\|destroyMembers\|destroy\|each\|encode\|esacpeRe\|extend\|flatten\|fly\|getCmp\|getBody\|getDoc\|getDom\|get\|id\|invoke\|isArray\|isDate\|isEmpty\|isFunction\|isObject\|isPrimitive\|max\|mean\|min\|namespace\|num\|onReady\|override\|partition\|pluck\|query\|reg\|removeNode\|select\|sum\|toArray\|type\|unique\|urlDecode\|urlEnocode\|value\|zip\)"
syn match javaScriptExtjsClass          "Ext\.\(Ajax\|EventManager\|QuickTips\|air\.Clipboard\|air\.DragType\|air\.FileProvider\|air\.NativeObservable\|air\.NativeWindow\|air\.NativeWindowGroup\|air\.NativeWindowManager\|air\.Sound\|air\.SystemMenu\|air\.SystemTray\|air\.VideoPanel\|chart\.Axis\|chart\.BarChart\|chart\.BarSeries\|chart\.CartesianChart\|chart\.CartesianSeries\|chart\.CategoryAxis\|chart\.Chart\|chart\.ColumnChart\|chart\.ColumnSeries\|chart\.LineChart\|chart\.LineSeries\|chart\.NumericAxis\|chart\.PieChart\|chart\.PieSeries\|chart\.Series\|chart\.TimeAxis\|data\.Api\|data\.ArrayReader\|data\.ArrayStore\|data\.Connection\|data\.DataProxy\|data\.DataReader\|data\.DataWriter\|data\.DirectProxy\|data\.DirectStore\|data\.Field\|data\.GroupingStore\|data\.HttpProxy\|data\.JsonReader\|data\.JsonStore\|data\.JsonWriter\|data\.MemoryProxy\|data\.Node\|data\.Record\|data\.SrciptTagProxy\|data\.SortTypes\|data\.Store\|data\.Tree\|data\.XmlReader\|data\.XmlStore\|data\.XmlWriter\|dd\.DD\|dd\.DDProxy\|dd\.DDTarget\|dd\.DragDrop\|dd\.DragDropMgr\|dd\.DragSource\|dd\.DragTracker\|dd\.DragZone\|dd\.DropTarget\|dd\.DropZone\|dd\.PanelProxy\|dd\.Registry\|dd\.ScrollManager\|dd\.StatusProxy\|direct\.JsonProvider\|direct\.PollingProvider\|direct\.Provider\|direct\.RemotingProvider\|form\.Action\.Load\|form\.Action\.Submit\|form\.Action\.DirectLoad\|form\.Action\.DirectSubmit\|form\.Action\|form\.BasicForm\|form\.Checkbox\|form\.CheckboxGroup\|form\.ComboBox\|form\.DateField\|form\.DisplayField\|form\.FieldSet\|form\.Field\|form\.FormPanel\|form\.Hidden\|form\.HtmlEditor\|form\.Label\|form\.NumberField\|form\.RadioGroup\|form\.Radio\|form\.TextArea\|form\.TextField\|form\.TimeField\|form\.TriggerField\|form\.TwinTriggerField\|form\.VTypes\|grid\.AbstractSelectionModel\|grid\.BooleanColumn\|grid\.CellSelectionModel\|grid\.CheckboxSelectionModel\|grid\.ColumnModel\|grid\.Column\|grid\.Datecolumn\|grid\.EditorGridPanel\|grid\.GridDragZone\|grid\.GridPanel\|grid\.GridView\|grid\.GroupingView\|grid\.PropertyColumnModel\|grid\.PropertyGrid\|grid\.PropertyRecord\|grid\.PropertyStore\|grid\.RowNumberer\|grid\.RowSelectionModel\|grid\.TemplateColumn\|layout\.AbsoluteLayout\|layout\.AccordionLayout\|layout\.AnchorLayout\|layout\.BorderLayout\.Region\|layout\.BorderLayout\.SplitRegin\|layout\.BorderLayout\|layout\.BoxLayout\|layout\.CardLayout\|layout\.ColumnLayout\|layout\.ContainerLayout\|layout\.FitLayout\|layout\.FormLayout\|layout\.HBoxLayout\|layout\.TableLayout\|layout\.ToolbarLayout\|layout\.VBoxLayout\|menu\.BaseItem\|menu\.CheckItem\|menu\.ColorMenu\|menu\.DateMenu\|menu\.Item\|menu\.MenuMgr\|menu\.Menu\|menu\.Separator\|menu\.TextItem\|state\.CookieProvider\|state\.Manager\|state\.Provider\|tree\.AsyncTreeNode\|tree\.DefaultSelectionModel\|tree\.MultiSelectionModel\|tree\.RootTreeNodeUI\|tree\.TreeDragZone\|tree\.TreeDropZone\|tree\.TreeEditor\|tree\.TreeFilter\|tree\.TreeLoader\|tree\.TreeNodeUI\|tree\.TreeNode\|tree\.TreePanel\|tree\.TreeSorter\|util\.CSS\|util\.ClickRepeater\|util\.DelayedTask\|util\.Format\|util\.JSON\|util\.MixedCollection\|util\.Observable\|util\.TaskRunner\|util\.TextMetrics\|Action\|Ajax\|BoxComponent\|ButtonGroup\|Button\|ColorPalette\|ComponentMgr\|Component\|CompositeElementLite\|CompositeElement\|Container\|CycleButton\|DataView\|DatePicker\|Direct\|DomHelper\|DomQuery\|Editor\|Element\|Error\|EventManager\|EventObject\|\FlashComponent\|FlashProxy\|Fx\|History\|KeyMap\|KeyNav\|Layer\|ListView\.ColumnResizer\|ListView\.Sorter\|ListView\|LoadMask\|MessageBox\|PagingToolbar\|Panel\|ProgressBar\|QuickTips\|QuickTip\|Resizable\|Shadow\|Slider\|Spacer\|SplitBar\.AbsoluteLayoutAdapter\|SplitBar\.BasicLayoutAdapter\|SplitBar\|SplitButton\|StoreMgr\|TabPanel\|TaskMgr\|Template\|Tip\|ToolTip\|Toolbar\.Fill\|Toolbar\.Item\|Toolbar\.Separator\|Toolbar\.Spacer\|Toolbar\.TextItem\|Toolbar\|Updater\.BasicRenderer\|Updater\.defaults\|Updater\|Viewport\|WindowGroup\|WindowMgr\|Window\|XTemplate\)"
syn match javaScriptExtjsDateClass      "Date\.\(dayNames\|defaults\|formatCodes\|formatFunctions\|monthNames\|monthNumbers\|parseFunctions\|DAY\|HOUR\|MILLI\|MINUTE\|MONTH\|SECOND\|YEAR\)"
syn match javaScriptExtjsMisc           "\.\(createCallback\|createDelegate\|createInterceptor\|createSequence\|defer\|constrain\|escape\|format\|leftPad\|toggle\|trim\|indexOf\|remove\|between\|clearTime\|clone\|format\|getDayOfYear\|getDaysInMonth\|getElapsed\|getFirstDateOfMonth\|getFirstDayOfMonth\|getGMTOffset\|getLastDateOfMonth\|getLastDayOfMonth\|getMonthNumber\|getShortDayName\|getShortMonthName\|getSuffix\|getTimezone\|getWeekOfYear\|isLeapYear\|parseDate\)"
syn keyword javaScriptCommentKeys       private contained
syn match   javaScriptExtjsDoc          "@\(class\|link\|param\|return\|ignore\|hide\|private\|static\|singleton\|type\|property\|cfg\|extends\|event\)\|{\(Boolean\|String\|Number\|Object\|Array\|Function\|HTMLElement\|Mixed\|Date\)\(\/\(Boolean\|String\|Number\|Object\|Array\|Function\|HTMLElement\|Mixed\|Date\)\)*}\|#\w\+"
syn keyword javaScriptCommentTodo       TODO FIXME XXX TBD contained
syn match   javaScriptLineComment       "//.*" contains=javaScriptCommentTodo,javaScriptExtjsDoc,javaScriptExtjsClass,javaScriptCommentKeys
syn match   javaScriptCommentSkip       "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment           start="/\*"  end="\*/" contains=javaScriptCommentTodo,javaScriptExtjsDoc,javaScriptExtjsClass,javaScriptCommentKeys
syn match   javaScriptSpecial           "\\\d\d\d\|\\." 
syn region  javaScriptStringD           start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS           start=+'+  skip=+\\\\\|\\'+  end=+'+  contains=javaScriptSpecial,@htmlPreproc
syn match   javaScriptSpecialCharacter  "'\\.'"
syn match   javaScriptNumber            "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
"syn region  javaScriptRegexpString     start=+/+ skip=+\\\\\|\\/+ end=+/[gi]\?\s*$+ end=+/[gi]\?\s*[;,)]+me=e-1 contains=@htmlPreproc oneline
syn keyword javaScriptConditional       if else defined undefined try catch
syn keyword javaScriptRepeat            while for
syn keyword javaScriptBranch            break continue switch case default
syn keyword javaScriptOperator          new in
syn keyword javaScriptType              this var const arguments
syn keyword javaScriptStatement         return with call apply prototype superClass
syn keyword javaScriptBoolean           true false

if exists('javaScript_fold')
    syn match    javaScriptFunction        "\<function\>"
    syn region   javaScriptFunctionFold    start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync          grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync          grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword  javaScriptFunction        function alert substr substring prompt input match
    syn match    javaScriptBraces          "[{}]"
endif

syn sync fromstart
syn sync maxlines=100

" catch errors caused by wrong parenthesis
syn region  javaScriptParen             transparent start="(" end=")" contains=javaScriptParen,javaScriptComment,javaScriptLineComment,javaScriptSpecial,javaScriptStringD,javaScriptStringS,javaScriptSpecialCharacter,javaScriptNumber,javaScriptRegexpString,javaScriptConditional,javaScriptBoolean,javaScriptBraces,javaScriptRepeat,javaScriptBranch,javaScriptType,javaScriptExtjsMisc,javaScriptExtjsClass,javaScriptExtjsDateClass,javaScriptExtjsCore,javaScriptSpecialFn,javaScriptFunction,javaScriptExtjsMethod,javaScriptExtjsDoc,javaScriptOperator,javaScriptStatement
syn match   javaScrParenError  ")"

if main_syntax == 'javascript'
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
if version >= 508 || !exists('did_javascript_syn_inits')
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptComment              Comment
  HiLink javaScriptLineComment          Comment
  HiLink javaScriptCommentKeys          Special
  HiLink javaScriptCommentTodo          Todo
  HiLink javaScriptSpecial              Special
  HiLink javaScriptStringS              String
  HiLink javaScriptStringD              String
  HiLink javaScriptCharacter            Character
  HiLink javaScriptSpecialCharacter     javaScriptSpecial
  HiLink javaScriptNumber               javaScriptValue
  HiLink javaScriptConditional          Conditional
  HiLink javaScriptRepeat               Repeat
  HiLink javaScriptBranch               Conditional
  HiLink javaScriptOperator             Operator
  HiLink javaScriptType                 Type
  HiLink javaScriptStatement            Statement
  HiLink javaScriptFunction             Function
  HiLink javaScriptBraces               Function
  HiLink javaScriptError                Error
  HiLink javaScrParenError              javaScriptError
  HiLink javaScriptBoolean              Boolean
  HiLink javaScriptRegexpString         String
  HiLink javaScriptExtjsMisc            Function
  HiLink javaScriptExtjsClass           Type
  HiLink javaScriptExtjsDateClass       Type
  HiLink javaScriptExtjsCore            Special
  HiLink javaScriptExtjsMethod          Function
  HiLink javaScriptExtjsDoc             Special
  HiLink javaScriptSpecialFn            Special
  delcommand HiLink
endif

let b:current_syntax = 'javascript'
if main_syntax == 'javascript'
  unlet main_syntax
endif

"vim: ts=4

