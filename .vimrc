"
" Simple .vimrc config
"
set expandtab
set tabstop=4
set shiftwidth=4

set cmdheight=2
syntax enable
set encoding=utf8

" show matching brackets
autocmd FileType perl set showmatch

" dont use Q for Ex mode
map Q :q

let perl_extended_vars = 1

" Run perltidy on entire file
map ,pt <ESC>:%! perltidy<CR>
map ,ptv <ESC>:'<,'>! perltidy<CR>

" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" Enable plugins
filetype plugin on

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

if exists("b:current_syntax")
    finish
endif
syn case match
syn sync minlines=20

let g:cucumber_languages = {
      \"en": {"and": "And\\>", "background": "Background\\>", "but": "But\\>", "examples": "Scenarios\\>\\|Examples\\>", "feature": "Business Need\\>\\|Feature\\>\\|Ability\\>", "given": "Given\\>", "scenario": "Scenario\\>", "scenario_outline": "Scenario Template\\>\\|Scenario Outline\\>", "then": "Then\\>", "when": "When\\>"},
      \"ar": {"and": "\\%u0648\\>", "background": "\\%u0627\\%u0644\\%u062e\\%u0644\\%u0641\\%u064a\\%u0629\\>", "but": "\\%u0644\\%u0643\\%u0646\\>", "examples": "\\%u0627\\%u0645\\%u062b\\%u0644\\%u0629\\>", "feature": "\\%u062e\\%u0627\\%u0635\\%u064a\\%u0629\\>", "given": "\\%u0628\\%u0641\\%u0631\\%u0636\\>", "scenario": "\\%u0633\\%u064a\\%u0646\\%u0627\\%u0631\\%u064a\\%u0648\\>", "scenario_outline": "\\%u0633\\%u064a\\%u0646\\%u0627\\%u0631\\%u064a\\%u0648 \\%u0645\\%u062e\\%u0637\\%u0637\\>", "then": "\\%u0627\\%u0630\\%u0627\\%u064b\\>\\|\\%u062b\\%u0645\\>", "when": "\\%u0639\\%u0646\\%u062f\\%u0645\\%u0627\\>\\|\\%u0645\\%u062a\\%u0649\\>"},
      \"bg": {"and": "\\%u0418\\>", "background": "\\%u041f\\%u0440\\%u0435\\%u0434\\%u0438\\%u0441\\%u0442\\%u043e\\%u0440\\%u0438\\%u044f\\>", "but": "\\%u041d\\%u043e\\>", "examples": "\\%u041f\\%u0440\\%u0438\\%u043c\\%u0435\\%u0440\\%u0438\\>", "feature": "\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0438\\%u043e\\%u043d\\%u0430\\%u043b\\%u043d\\%u043e\\%u0441\\%u0442\\>", "given": "\\%u0414\\%u0430\\%u0434\\%u0435\\%u043d\\%u043e\\>", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439\\>", "scenario_outline": "\\%u0420\\%u0430\\%u043c\\%u043a\\%u0430 \\%u043d\\%u0430 \\%u0441\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439\\>", "then": "\\%u0422\\%u043e\\>", "when": "\\%u041a\\%u043e\\%u0433\\%u0430\\%u0442\\%u043e\\>"},
      \"bm": {"and": "Dan\\>", "background": "Latar Belakang\\>", "but": "Tetapi\\>", "examples": "Contoh \\>", "feature": "Fungsi\\>", "given": "Bagi\\>", "scenario": "Senario\\>", "scenario_outline": "Menggariskan Senario \\>", "then": "Kemudian\\>", "when": "Apabila\\>"},
      \"ca": {"and": "I\\>", "background": "Antecedents\\>\\|Rerefons\\>", "but": "Per\\%u00f2\\>", "examples": "Exemples\\>", "feature": "Caracter\\%u00edstica\\>\\|Funcionalitat\\>", "given": "At\\%u00e8s\\>\\|Donada\\>\\|Donat\\>\\|Atesa\\>", "scenario": "Escenari\\>", "scenario_outline": "Esquema de l'escenari\\>", "then": "Aleshores\\>\\|Cal\\>", "when": "Quan\\>"},
      \"cs": {"and": "A tak\\%u00e9\\>\\|A\\>", "background": "Pozad\\%u00ed\\>\\|Kontext\\>", "but": "Ale\\>", "examples": "P\\%u0159\\%u00edklady\\>", "feature": "Po\\%u017eadavek\\>", "given": "Za p\\%u0159edpokladu\\>\\|Pokud\\>", "scenario": "Sc\\%u00e9n\\%u00e1\\%u0159\\>", "scenario_outline": "N\\%u00e1\\%u010drt Sc\\%u00e9n\\%u00e1\\%u0159e\\>\\|Osnova sc\\%u00e9n\\%u00e1\\%u0159e\\>", "then": "Pak\\>", "when": "Kdy\\%u017e\\>"},
      \"cy-GB": {"and": "A\\>", "background": "Cefndir\\>", "but": "Ond\\>", "examples": "Enghreifftiau\\>", "feature": "Arwedd\\>", "given": "Anrhegedig a\\>", "scenario": "Scenario\\>", "scenario_outline": "Scenario Amlinellol\\>", "then": "Yna\\>", "when": "Pryd\\>"},
      \"da": {"and": "Og\\>", "background": "Baggrund\\>", "but": "Men\\>", "examples": "Eksempler\\>", "feature": "Egenskab\\>", "given": "Givet\\>", "scenario": "Scenarie\\>", "scenario_outline": "Abstrakt Scenario\\>", "then": "S\\%u00e5\\>", "when": "N\\%u00e5r\\>"},
      \"de": {"and": "Und\\>", "background": "Grundlage\\>", "but": "Aber\\>", "examples": "Beispiele\\>", "feature": "Funktionalit\\%u00e4t\\>", "given": "Gegeben sei\\>\\|Angenommen\\>", "scenario": "Szenario\\>", "scenario_outline": "Szenariogrundriss\\>", "then": "Dann\\>", "when": "Wenn\\>"},
      \"el": {"and": "\\%u039a\\%u03b1\\%u03b9\\>", "background": "\\%u03a5\\%u03c0\\%u03cc\\%u03b2\\%u03b1\\%u03b8\\%u03c1\\%u03bf\\>", "but": "\\%u0391\\%u03bb\\%u03bb\\%u03ac\\>", "examples": "\\%u03a0\\%u03b1\\%u03c1\\%u03b1\\%u03b4\\%u03b5\\%u03af\\%u03b3\\%u03bc\\%u03b1\\%u03c4\\%u03b1\\>\\|\\%u03a3\\%u03b5\\%u03bd\\%u03ac\\%u03c1\\%u03b9\\%u03b1\\>", "feature": "\\%u0394\\%u03c5\\%u03bd\\%u03b1\\%u03c4\\%u03cc\\%u03c4\\%u03b7\\%u03c4\\%u03b1\\>\\|\\%u039b\\%u03b5\\%u03b9\\%u03c4\\%u03bf\\%u03c5\\%u03c1\\%u03b3\\%u03af\\%u03b1\\>", "given": "\\%u0394\\%u03b5\\%u03b4\\%u03bf\\%u03bc\\%u03ad\\%u03bd\\%u03bf\\%u03c5 \\%u03cc\\%u03c4\\%u03b9\\>\\|\\%u0394\\%u03b5\\%u03b4\\%u03bf\\%u03bc\\%u03ad\\%u03bd\\%u03bf\\%u03c5\\>", "scenario": "\\%u03a3\\%u03b5\\%u03bd\\%u03ac\\%u03c1\\%u03b9\\%u03bf\\>", "scenario_outline": "\\%u03a0\\%u03b5\\%u03c1\\%u03b9\\%u03b3\\%u03c1\\%u03b1\\%u03c6\\%u03ae \\%u03a3\\%u03b5\\%u03bd\\%u03b1\\%u03c1\\%u03af\\%u03bf\\%u03c5\\>", "then": "\\%u03a4\\%u03cc\\%u03c4\\%u03b5\\>", "when": "\\%u038c\\%u03c4\\%u03b1\\%u03bd\\>"},
      \"en-Scouse": {"and": "An\\>", "background": "Dis is what went down\\>", "but": "Buh\\>", "examples": "Examples\\>", "feature": "Feature\\>", "given": "Youse know when youse got\\>\\|Givun\\>", "scenario": "The thing of it is\\>", "scenario_outline": "Wharrimean is\\>", "then": "Den youse gotta\\>\\|Dun\\>", "when": "Youse know like when\\>\\|Wun\\>"},
      \"en-au": {"and": "Too right\\>", "background": "First off\\>", "but": "Yeah nah\\>", "examples": "You'll wanna\\>", "feature": "Pretty much\\>", "given": "Y'know\\>", "scenario": "Awww, look mate\\>", "scenario_outline": "Reckon it's like\\>", "then": "But at the end of the day I reckon\\>", "when": "It's just unbelievable\\>"},
      \"en-lol": {"and": "AN\\>", "background": "B4\\>", "but": "BUT\\>", "examples": "EXAMPLZ\\>", "feature": "OH HAI\\>", "given": "I CAN HAZ\\>", "scenario": "MISHUN\\>", "scenario_outline": "MISHUN SRSLY\\>", "then": "DEN\\>", "when": "WEN\\>"},
      \"en-old": {"and": "Ond\\>\\|7\\>", "background": "\\%u00c6r\\>\\|Aer\\>", "but": "Ac\\>", "examples": "Se \\%u00f0e\\>\\|Se \\%u00fee\\>\\|Se the\\>", "feature": "Hw\\%u00e6t\\>\\|Hwaet\\>", "given": "\\%u00d0urh\\>\\|\\%u00deurh\\>\\|Thurh\\>", "scenario": "Swa\\>", "scenario_outline": "Swa hw\\%u00e6r swa\\>\\|Swa hwaer swa\\>", "then": "\\%u00d0a \\%u00f0e\\>\\|\\%u00dea \\%u00fee\\>\\|\\%u00dea\\>\\|\\%u00d0a\\>\\|Tha the\\>\\|Tha\\>", "when": "\\%u00d0a\\>\\|\\%u00dea\\>\\|Tha\\>"},
      \"en-pirate": {"and": "Aye\\>", "background": "Yo-ho-ho\\>", "but": "Avast!\\>", "examples": "Dead men tell no tales\\>", "feature": "Ahoy matey!\\>", "given": "Gangway!\\>", "scenario": "Heave to\\>", "scenario_outline": "Shiver me timbers\\>", "then": "Let go and haul\\>", "when": "Blimey!\\>"},
      \"en-tx": {"and": "And y'all\\>", "background": "Background\\>", "but": "But y'all\\>", "examples": "Examples\\>", "feature": "Feature\\>", "given": "Given y'all\\>", "scenario": "Scenario\\>", "scenario_outline": "All y'all\\>", "then": "Then y'all\\>", "when": "When y'all\\>"},
      \"eo": {"and": "Kaj\\>", "background": "Fono\\>", "but": "Sed\\>", "examples": "Ekzemploj\\>", "feature": "Trajto\\>", "given": "Donita\\%u0135o\\>", "scenario": "Scenaro\\>", "scenario_outline": "Konturo de la scenaro\\>", "then": "Do\\>", "when": "Se\\>"},
      \"es": {"and": "Y\\>", "background": "Antecedentes\\>", "but": "Pero\\>", "examples": "Ejemplos\\>", "feature": "Caracter\\%u00edstica\\>", "given": "Dadas\\>\\|Dados\\>\\|Dada\\>\\|Dado\\>", "scenario": "Escenario\\>", "scenario_outline": "Esquema del escenario\\>", "then": "Entonces\\>", "when": "Cuando\\>"},
      \"et": {"and": "Ja\\>", "background": "Taust\\>", "but": "Kuid\\>", "examples": "Juhtumid\\>", "feature": "Omadus\\>", "given": "Eeldades\\>", "scenario": "Stsenaarium\\>", "scenario_outline": "Raamstsenaarium\\>", "then": "Siis\\>", "when": "Kui\\>"},
      \"fa": {"and": "\\%u0648\\>", "background": "\\%u0632\\%u0645\\%u06cc\\%u0646\\%u0647\\>", "but": "\\%u0627\\%u0645\\%u0627\\>", "examples": "\\%u0646\\%u0645\\%u0648\\%u0646\\%u0647 \\%u0647\\%u0627\\>", "feature": "\\%u0648\\%u0650\\%u06cc\\%u0698\\%u06af\\%u06cc\\>", "given": "\\%u0628\\%u0627 \\%u0641\\%u0631\\%u0636\\>", "scenario": "\\%u0633\\%u0646\\%u0627\\%u0631\\%u06cc\\%u0648\\>", "scenario_outline": "\\%u0627\\%u0644\\%u06af\\%u0648\\%u06cc \\%u0633\\%u0646\\%u0627\\%u0631\\%u06cc\\%u0648\\>", "then": "\\%u0622\\%u0646\\%u06af\\%u0627\\%u0647\\>", "when": "\\%u0647\\%u0646\\%u06af\\%u0627\\%u0645\\%u06cc\\>"},
      \"fi": {"and": "Ja\\>", "background": "Tausta\\>", "but": "Mutta\\>", "examples": "Tapaukset\\>", "feature": "Ominaisuus\\>", "given": "Oletetaan\\>", "scenario": "Tapaus\\>", "scenario_outline": "Tapausaihio\\>", "then": "Niin\\>", "when": "Kun\\>"},
      \"fr": {"and": "Et\\>", "background": "Contexte\\>", "but": "Mais\\>", "examples": "Exemples\\>", "feature": "Fonctionnalit\\%u00e9\\>", "given": "\\%u00c9tant donn\\%u00e9es\\>\\|\\%u00c9tant donn\\%u00e9s\\>\\|\\%u00c9tant donn\\%u00e9e\\>\\|\\%u00c9tant donn\\%u00e9\\>\\|Etant donn\\%u00e9es\\>\\|Etant donn\\%u00e9s\\>\\|Etant donn\\%u00e9e\\>\\|Etant donn\\%u00e9\\>\\|Soit\\>", "scenario": "Sc\\%u00e9nario\\>", "scenario_outline": "Plan du sc\\%u00e9nario\\>\\|Plan du Sc\\%u00e9nario\\>", "then": "Alors\\>", "when": "Lorsqu'\\|Lorsque\\>\\|Quand\\>"},
      \"gl": {"and": "E\\>", "background": "Contexto\\>", "but": "Mais\\>\\|Pero\\>", "examples": "Exemplos\\>", "feature": "Caracter\\%u00edstica\\>", "given": "Dadas\\>\\|Dados\\>\\|Dada\\>\\|Dado\\>", "scenario": "Escenario\\>", "scenario_outline": "Esbozo do escenario\\>", "then": "Ent\\%u00f3n\\>\\|Logo\\>", "when": "Cando\\>"},
      \"he": {"and": "\\%u05d5\\%u05d2\\%u05dd\\>", "background": "\\%u05e8\\%u05e7\\%u05e2\\>", "but": "\\%u05d0\\%u05d1\\%u05dc\\>", "examples": "\\%u05d3\\%u05d5\\%u05d2\\%u05de\\%u05d0\\%u05d5\\%u05ea\\>", "feature": "\\%u05ea\\%u05db\\%u05d5\\%u05e0\\%u05d4\\>", "given": "\\%u05d1\\%u05d4\\%u05d9\\%u05e0\\%u05ea\\%u05df\\>", "scenario": "\\%u05ea\\%u05e8\\%u05d7\\%u05d9\\%u05e9\\>", "scenario_outline": "\\%u05ea\\%u05d1\\%u05e0\\%u05d9\\%u05ea \\%u05ea\\%u05e8\\%u05d7\\%u05d9\\%u05e9\\>", "then": "\\%u05d0\\%u05d6\\%u05d9\\>\\|\\%u05d0\\%u05d6\\>", "when": "\\%u05db\\%u05d0\\%u05e9\\%u05e8\\>"},
      \"hi": {"and": "\\%u0924\\%u0925\\%u093e\\>\\|\\%u0914\\%u0930\\>", "background": "\\%u092a\\%u0943\\%u0937\\%u094d\\%u0920\\%u092d\\%u0942\\%u092e\\%u093f\\>", "but": "\\%u092a\\%u0930\\>", "examples": "\\%u0909\\%u0926\\%u093e\\%u0939\\%u0930\\%u0923\\>", "feature": "\\%u0930\\%u0942\\%u092a \\%u0932\\%u0947\\%u0916\\>", "given": "\\%u091a\\%u0942\\%u0902\\%u0915\\%u093f\\>\\|\\%u092f\\%u0926\\%u093f\\>\\|\\%u0905\\%u0917\\%u0930\\>", "scenario": "\\%u092a\\%u0930\\%u093f\\%u0926\\%u0943\\%u0936\\%u094d\\%u092f\\>", "scenario_outline": "\\%u092a\\%u0930\\%u093f\\%u0926\\%u0943\\%u0936\\%u094d\\%u092f \\%u0930\\%u0942\\%u092a\\%u0930\\%u0947\\%u0916\\%u093e\\>", "then": "\\%u0924\\%u092c\\>", "when": "\\%u091c\\%u092c\\>"},
      \"hr": {"and": "I\\>", "background": "Pozadina\\>", "but": "Ali\\>", "examples": "Scenariji\\>\\|Primjeri\\>", "feature": "Mogu\\%u0107nost\\>\\|Mogucnost\\>\\|Osobina\\>", "given": "Zadano\\>\\|Zadani\\>\\|Zadan\\>", "scenario": "Scenarij\\>", "scenario_outline": "Koncept\\>\\|Skica\\>", "then": "Onda\\>", "when": "Kada\\>\\|Kad\\>"},
      \"hu": {"and": "\\%u00c9s\\>", "background": "H\\%u00e1tt\\%u00e9r\\>", "but": "De\\>", "examples": "P\\%u00e9ld\\%u00e1k\\>", "feature": "Jellemz\\%u0151\\>", "given": "Amennyiben\\>\\|Adott\\>", "scenario": "Forgat\\%u00f3k\\%u00f6nyv\\>", "scenario_outline": "Forgat\\%u00f3k\\%u00f6nyv v\\%u00e1zlat\\>", "then": "Akkor\\>", "when": "Amikor\\>\\|Majd\\>\\|Ha\\>"},
      \"id": {"and": "Dan\\>", "background": "Dasar\\>", "but": "Tapi\\>", "examples": "Contoh\\>", "feature": "Fitur\\>", "given": "Dengan\\>", "scenario": "Skenario\\>", "scenario_outline": "Skenario konsep\\>", "then": "Maka\\>", "when": "Ketika\\>"},
      \"is": {"and": "Og\\>", "background": "Bakgrunnur\\>", "but": "En\\>", "examples": "Atbur\\%u00f0ar\\%u00e1sir\\>\\|D\\%u00e6mi\\>", "feature": "Eiginleiki\\>", "given": "Ef\\>", "scenario": "Atbur\\%u00f0ar\\%u00e1s\\>", "scenario_outline": "L\\%u00fdsing Atbur\\%u00f0ar\\%u00e1sar\\>\\|L\\%u00fdsing D\\%u00e6ma\\>", "then": "\\%u00de\\%u00e1\\>", "when": "\\%u00deegar\\>"},
      \"it": {"and": "E\\>", "background": "Contesto\\>", "but": "Ma\\>", "examples": "Esempi\\>", "feature": "Funzionalit\\%u00e0\\>", "given": "Dato\\>\\|Data\\>\\|Dati\\>\\|Date\\>", "scenario": "Scenario\\>", "scenario_outline": "Schema dello scenario\\>", "then": "Allora\\>", "when": "Quando\\>"},
      \"ja": {"and": "\\%u304b\\%u3064", "background": "\\%u80cc\\%u666f\\>", "but": "\\%u3057\\%u304b\\%u3057\\|\\%u305f\\%u3060\\%u3057\\|\\%u4f46\\%u3057", "examples": "\\%u30b5\\%u30f3\\%u30d7\\%u30eb\\>\\|\\%u4f8b\\>", "feature": "\\%u30d5\\%u30a3\\%u30fc\\%u30c1\\%u30e3\\>\\|\\%u6a5f\\%u80fd\\>", "given": "\\%u524d\\%u63d0", "scenario": "\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\>", "scenario_outline": "\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\%u30a2\\%u30a6\\%u30c8\\%u30e9\\%u30a4\\%u30f3\\>\\|\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\%u30c6\\%u30f3\\%u30d7\\%u30ec\\%u30fc\\%u30c8\\>\\|\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\%u30c6\\%u30f3\\%u30d7\\%u30ec\\>\\|\\%u30c6\\%u30f3\\%u30d7\\%u30ec\\>", "then": "\\%u306a\\%u3089\\%u3070", "when": "\\%u3082\\%u3057"},
      \"ko": {"and": "\\%uadf8\\%ub9ac\\%uace0", "background": "\\%ubc30\\%uacbd\\>", "but": "\\%ud558\\%uc9c0\\%ub9cc\\|\\%ub2e8", "examples": "\\%uc608\\>", "feature": "\\%uae30\\%ub2a5\\>", "given": "\\%uc870\\%uac74\\|\\%uba3c\\%uc800", "scenario": "\\%uc2dc\\%ub098\\%ub9ac\\%uc624\\>", "scenario_outline": "\\%uc2dc\\%ub098\\%ub9ac\\%uc624 \\%uac1c\\%uc694\\>", "then": "\\%uadf8\\%ub7ec\\%uba74", "when": "\\%ub9cc\\%uc77c\\|\\%ub9cc\\%uc57d"},
      \"lt": {"and": "Ir\\>", "background": "Kontekstas\\>", "but": "Bet\\>", "examples": "Pavyzd\\%u017eiai\\>\\|Scenarijai\\>\\|Variantai\\>", "feature": "Savyb\\%u0117\\>", "given": "Duota\\>", "scenario": "Scenarijus\\>", "scenario_outline": "Scenarijaus \\%u0161ablonas\\>", "then": "Tada\\>", "when": "Kai\\>"},
      \"lu": {"and": "an\\>\\|a\\>", "background": "Hannergrond\\>", "but": "m\\%u00e4\\>\\|awer\\>", "examples": "Beispiller\\>", "feature": "Funktionalit\\%u00e9it\\>", "given": "ugeholl\\>", "scenario": "Szenario\\>", "scenario_outline": "Plang vum Szenario\\>", "then": "dann\\>", "when": "wann\\>"},
      \"lv": {"and": "Un\\>", "background": "Situ\\%u0101cija\\>\\|Konteksts\\>", "but": "Bet\\>", "examples": "Piem\\%u0113ri\\>\\|Paraugs\\>", "feature": "Funkcionalit\\%u0101te\\>\\|F\\%u012b\\%u010da\\>", "given": "Kad\\>", "scenario": "Scen\\%u0101rijs\\>", "scenario_outline": "Scen\\%u0101rijs p\\%u0113c parauga\\>", "then": "Tad\\>", "when": "Ja\\>"},
      \"nl": {"and": "En\\>", "background": "Achtergrond\\>", "but": "Maar\\>", "examples": "Voorbeelden\\>", "feature": "Functionaliteit\\>", "given": "Gegeven\\>\\|Stel\\>", "scenario": "Scenario\\>", "scenario_outline": "Abstract Scenario\\>", "then": "Dan\\>", "when": "Als\\>"},
      \"no": {"and": "Og\\>", "background": "Bakgrunn\\>", "but": "Men\\>", "examples": "Eksempler\\>", "feature": "Egenskap\\>", "given": "Gitt\\>", "scenario": "Scenario\\>", "scenario_outline": "Abstrakt Scenario\\>\\|Scenariomal\\>", "then": "S\\%u00e5\\>", "when": "N\\%u00e5r\\>"},
      \"pl": {"and": "Oraz\\>\\|I\\>", "background": "Za\\%u0142o\\%u017cenia\\>", "but": "Ale\\>", "examples": "Przyk\\%u0142ady\\>", "feature": "W\\%u0142a\\%u015bciwo\\%u015b\\%u0107\\>\\|Potrzeba biznesowa\\>\\|Funkcja\\>\\|Aspekt\\>", "given": "Zak\\%u0142adaj\\%u0105c\\>\\|Maj\\%u0105c\\>", "scenario": "Scenariusz\\>", "scenario_outline": "Szablon scenariusza\\>", "then": "Wtedy\\>", "when": "Je\\%u017celi\\>\\|Je\\%u015bli\\>\\|Kiedy\\>\\|Gdy\\>"},
      \"pt": {"and": "E\\>", "background": "Cen\\%u00e1rio de Fundo\\>\\|Cenario de Fundo\\>\\|Contexto\\>\\|Fundo\\>", "but": "Mas\\>", "examples": "Cen\\%u00e1rios\\>\\|Exemplos\\>\\|Cenarios\\>", "feature": "Caracter\\%u00edstica\\>\\|Funcionalidade\\>\\|Caracteristica\\>", "given": "Dadas\\>\\|Dados\\>\\|Dada\\>\\|Dado\\>", "scenario": "Cen\\%u00e1rio\\>\\|Cenario\\>", "scenario_outline": "Delinea\\%u00e7\\%u00e3o do Cen\\%u00e1rio\\>\\|Esquema do Cen\\%u00e1rio\\>\\|Delineacao do Cenario\\>\\|Esquema do Cenario\\>", "then": "Ent\\%u00e3o\\>\\|Entao\\>", "when": "Quando\\>"},
      \"ro": {"and": "\\%u015ei\\>\\|\\%u0218i\\>\\|Si\\>", "background": "Context\\>", "but": "Dar\\>", "examples": "Exemple\\>", "feature": "Func\\%u0163ionalitate\\>\\|Func\\%u021bionalitate\\>\\|Functionalitate\\>", "given": "Da\\%u0163i fiind\\>\\|Da\\%u021bi fiind\\>\\|Dati fiind\\>\\|Date fiind\\>\\|Dat fiind\\>", "scenario": "Scenariu\\>", "scenario_outline": "Structur\\%u0103 scenariu\\>\\|Structura scenariu\\>", "then": "Atunci\\>", "when": "C\\%u00e2nd\\>\\|Cand\\>"},
      \"ru": {"and": "\\%u041a \\%u0442\\%u043e\\%u043c\\%u0443 \\%u0436\\%u0435\\>\\|\\%u0422\\%u0430\\%u043a\\%u0436\\%u0435\\>\\|\\%u0418\\>", "background": "\\%u041f\\%u0440\\%u0435\\%u0434\\%u044b\\%u0441\\%u0442\\%u043e\\%u0440\\%u0438\\%u044f\\>\\|\\%u041a\\%u043e\\%u043d\\%u0442\\%u0435\\%u043a\\%u0441\\%u0442\\>", "but": "\\%u041d\\%u043e\\>\\|\\%u0410\\>", "examples": "\\%u041f\\%u0440\\%u0438\\%u043c\\%u0435\\%u0440\\%u044b\\>", "feature": "\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0438\\%u043e\\%u043d\\%u0430\\%u043b\\>\\|\\%u0421\\%u0432\\%u043e\\%u0439\\%u0441\\%u0442\\%u0432\\%u043e\\>\\|\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0438\\%u044f\\>", "given": "\\%u0414\\%u043e\\%u043f\\%u0443\\%u0441\\%u0442\\%u0438\\%u043c\\>\\|\\%u041f\\%u0443\\%u0441\\%u0442\\%u044c\\>\\|\\%u0414\\%u0430\\%u043d\\%u043e\\>", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439\\>", "scenario_outline": "\\%u0421\\%u0442\\%u0440\\%u0443\\%u043a\\%u0442\\%u0443\\%u0440\\%u0430 \\%u0441\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u044f\\>", "then": "\\%u0422\\%u043e\\%u0433\\%u0434\\%u0430\\>\\|\\%u0422\\%u043e\\>", "when": "\\%u041a\\%u043e\\%u0433\\%u0434\\%u0430\\>\\|\\%u0415\\%u0441\\%u043b\\%u0438\\>"},
      \"sk": {"and": "A z\\%u00e1rove\\%u0148\\>\\|A taktie\\%u017e\\>\\|A tie\\%u017e\\>\\|A\\>", "background": "Pozadie\\>", "but": "Ale\\>", "examples": "Pr\\%u00edklady\\>", "feature": "Po\\%u017eiadavka\\>\\|Vlastnos\\%u0165\\>\\|Funkcia\\>", "given": "Za predpokladu\\>\\|Pokia\\%u013e\\>", "scenario": "Scen\\%u00e1r\\>", "scenario_outline": "N\\%u00e1\\%u010drt Scen\\%u00e1ru\\>\\|N\\%u00e1\\%u010drt Scen\\%u00e1ra\\>\\|Osnova Scen\\%u00e1ra\\>", "then": "Potom\\>\\|Tak\\>", "when": "Ke\\%u010f\\>\\|Ak\\>"},
      \"sr-Cyrl": {"and": "\\%u0418\\>", "background": "\\%u041a\\%u043e\\%u043d\\%u0442\\%u0435\\%u043a\\%u0441\\%u0442\\>\\|\\%u041f\\%u043e\\%u0437\\%u0430\\%u0434\\%u0438\\%u043d\\%u0430\\>\\|\\%u041e\\%u0441\\%u043d\\%u043e\\%u0432\\%u0430\\>", "but": "\\%u0410\\%u043b\\%u0438\\>", "examples": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0458\\%u0438\\>\\|\\%u041f\\%u0440\\%u0438\\%u043c\\%u0435\\%u0440\\%u0438\\>", "feature": "\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0438\\%u043e\\%u043d\\%u0430\\%u043b\\%u043d\\%u043e\\%u0441\\%u0442\\>\\|\\%u041c\\%u043e\\%u0433\\%u0443\\%u045b\\%u043d\\%u043e\\%u0441\\%u0442\\>\\|\\%u041e\\%u0441\\%u043e\\%u0431\\%u0438\\%u043d\\%u0430\\>", "given": "\\%u0417\\%u0430\\%u0434\\%u0430\\%u0442\\%u043e\\>\\|\\%u0417\\%u0430\\%u0434\\%u0430\\%u0442\\%u0435\\>\\|\\%u0417\\%u0430\\%u0434\\%u0430\\%u0442\\%u0438\\>", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u043e\\>\\|\\%u041f\\%u0440\\%u0438\\%u043c\\%u0435\\%u0440\\>", "scenario_outline": "\\%u0421\\%u0442\\%u0440\\%u0443\\%u043a\\%u0442\\%u0443\\%u0440\\%u0430 \\%u0441\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0458\\%u0430\\>\\|\\%u041a\\%u043e\\%u043d\\%u0446\\%u0435\\%u043f\\%u0442\\>\\|\\%u0421\\%u043a\\%u0438\\%u0446\\%u0430\\>", "then": "\\%u041e\\%u043d\\%u0434\\%u0430\\>", "when": "\\%u041a\\%u0430\\%u0434\\%u0430\\>\\|\\%u041a\\%u0430\\%u0434\\>"},
      \"sr-Latn": {"and": "I\\>", "background": "Kontekst\\>\\|Pozadina\\>\\|Osnova\\>", "but": "Ali\\>", "examples": "Scenariji\\>\\|Primeri\\>", "feature": "Mogu\\%u0107nost\\>\\|Funkcionalnost\\>\\|Mogucnost\\>\\|Osobina\\>", "given": "Zadato\\>\\|Zadate\\>\\|Zatati\\>", "scenario": "Scenario\\>\\|Primer\\>", "scenario_outline": "Struktura scenarija\\>\\|Koncept\\>\\|Skica\\>", "then": "Onda\\>", "when": "Kada\\>\\|Kad\\>"},
      \"sv": {"and": "Och\\>", "background": "Bakgrund\\>", "but": "Men\\>", "examples": "Exempel\\>", "feature": "Egenskap\\>", "given": "Givet\\>", "scenario": "Scenario\\>", "scenario_outline": "Abstrakt Scenario\\>\\|Scenariomall\\>", "then": "S\\%u00e5\\>", "when": "N\\%u00e4r\\>"},
      \"th": {"and": "\\%u0e41\\%u0e25\\%u0e30\\>", "background": "\\%u0e41\\%u0e19\\%u0e27\\%u0e04\\%u0e34\\%u0e14\\>", "but": "\\%u0e41\\%u0e15\\%u0e48\\>", "examples": "\\%u0e0a\\%u0e38\\%u0e14\\%u0e02\\%u0e2d\\%u0e07\\%u0e40\\%u0e2b\\%u0e15\\%u0e38\\%u0e01\\%u0e32\\%u0e23\\%u0e13\\%u0e4c\\>\\|\\%u0e0a\\%u0e38\\%u0e14\\%u0e02\\%u0e2d\\%u0e07\\%u0e15\\%u0e31\\%u0e27\\%u0e2d\\%u0e22\\%u0e48\\%u0e32\\%u0e07\\>", "feature": "\\%u0e04\\%u0e27\\%u0e32\\%u0e21\\%u0e15\\%u0e49\\%u0e2d\\%u0e07\\%u0e01\\%u0e32\\%u0e23\\%u0e17\\%u0e32\\%u0e07\\%u0e18\\%u0e38\\%u0e23\\%u0e01\\%u0e34\\%u0e08\\>\\|\\%u0e04\\%u0e27\\%u0e32\\%u0e21\\%u0e2a\\%u0e32\\%u0e21\\%u0e32\\%u0e23\\%u0e16\\>\\|\\%u0e42\\%u0e04\\%u0e23\\%u0e07\\%u0e2b\\%u0e25\\%u0e31\\%u0e01\\>", "given": "\\%u0e01\\%u0e33\\%u0e2b\\%u0e19\\%u0e14\\%u0e43\\%u0e2b\\%u0e49\\>", "scenario": "\\%u0e40\\%u0e2b\\%u0e15\\%u0e38\\%u0e01\\%u0e32\\%u0e23\\%u0e13\\%u0e4c\\>", "scenario_outline": "\\%u0e42\\%u0e04\\%u0e23\\%u0e07\\%u0e2a\\%u0e23\\%u0e49\\%u0e32\\%u0e07\\%u0e02\\%u0e2d\\%u0e07\\%u0e40\\%u0e2b\\%u0e15\\%u0e38\\%u0e01\\%u0e32\\%u0e23\\%u0e13\\%u0e4c\\>\\|\\%u0e2a\\%u0e23\\%u0e38\\%u0e1b\\%u0e40\\%u0e2b\\%u0e15\\%u0e38\\%u0e01\\%u0e32\\%u0e23\\%u0e13\\%u0e4c\\>", "then": "\\%u0e14\\%u0e31\\%u0e07\\%u0e19\\%u0e31\\%u0e49\\%u0e19\\>", "when": "\\%u0e40\\%u0e21\\%u0e37\\%u0e48\\%u0e2d\\>"},
      \"tl": {"and": "\\%u0c2e\\%u0c30\\%u0c3f\\%u0c2f\\%u0c41\\>", "background": "\\%u0c28\\%u0c47\\%u0c2a\\%u0c25\\%u0c4d\\%u0c2f\\%u0c02\\>", "but": "\\%u0c15\\%u0c3e\\%u0c28\\%u0c3f\\>", "examples": "\\%u0c09\\%u0c26\\%u0c3e\\%u0c39\\%u0c30\\%u0c23\\%u0c32\\%u0c41\\>", "feature": "\\%u0c17\\%u0c41\\%u0c23\\%u0c2e\\%u0c41\\>", "given": "\\%u0c1a\\%u0c46\\%u0c2a\\%u0c4d\\%u0c2a\\%u0c2c\\%u0c21\\%u0c3f\\%u0c28\\%u0c26\\%u0c3f\\>", "scenario": "\\%u0c38\\%u0c28\\%u0c4d\\%u0c28\\%u0c3f\\%u0c35\\%u0c47\\%u0c36\\%u0c02\\>", "scenario_outline": "\\%u0c15\\%u0c25\\%u0c28\\%u0c02\\>", "then": "\\%u0c05\\%u0c2a\\%u0c4d\\%u0c2a\\%u0c41\\%u0c21\\%u0c41\\>", "when": "\\%u0c08 \\%u0c2a\\%u0c30\\%u0c3f\\%u0c38\\%u0c4d\\%u0c25\\%u0c3f\\%u0c24\\%u0c3f\\%u0c32\\%u0c4b\\>"},
      \"tr": {"and": "Ve\\>", "background": "Ge\\%u00e7mi\\%u015f\\>", "but": "Fakat\\>\\|Ama\\>", "examples": "\\%u00d6rnekler\\>", "feature": "\\%u00d6zellik\\>", "given": "Diyelim ki\\>", "scenario": "Senaryo\\>", "scenario_outline": "Senaryo tasla\\%u011f\\%u0131\\>", "then": "O zaman\\>", "when": "E\\%u011fer ki\\>"},
      \"tt": {"and": "\\%u04ba\\%u04d9\\%u043c\\>\\|\\%u0412\\%u04d9\\>", "background": "\\%u041a\\%u0435\\%u0440\\%u0435\\%u0448\\>", "but": "\\%u041b\\%u04d9\\%u043a\\%u0438\\%u043d\\>\\|\\%u04d8\\%u043c\\%u043c\\%u0430\\>", "examples": "\\%u04ae\\%u0440\\%u043d\\%u04d9\\%u043a\\%u043b\\%u04d9\\%u0440\\>\\|\\%u041c\\%u0438\\%u0441\\%u0430\\%u043b\\%u043b\\%u0430\\%u0440\\>", "feature": "\\%u04ae\\%u0437\\%u0435\\%u043d\\%u0447\\%u04d9\\%u043b\\%u0435\\%u043a\\%u043b\\%u0435\\%u043b\\%u0435\\%u043a\\>\\|\\%u041c\\%u04e9\\%u043c\\%u043a\\%u0438\\%u043d\\%u043b\\%u0435\\%u043a\\>", "given": "\\%u04d8\\%u0439\\%u0442\\%u0438\\%u043a\\>", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439\\>", "scenario_outline": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439\\%u043d\\%u044b\\%u04a3 \\%u0442\\%u04e9\\%u0437\\%u0435\\%u043b\\%u0435\\%u0448\\%u0435\\>", "then": "\\%u041d\\%u04d9\\%u0442\\%u0438\\%u0497\\%u04d9\\%u0434\\%u04d9\\>", "when": "\\%u04d8\\%u0433\\%u04d9\\%u0440\\>"},
      \"uk": {"and": "\\%u0410 \\%u0442\\%u0430\\%u043a\\%u043e\\%u0436\\>\\|\\%u0422\\%u0430\\>\\|\\%u0406\\>", "background": "\\%u041f\\%u0435\\%u0440\\%u0435\\%u0434\\%u0443\\%u043c\\%u043e\\%u0432\\%u0430\\>", "but": "\\%u0410\\%u043b\\%u0435\\>", "examples": "\\%u041f\\%u0440\\%u0438\\%u043a\\%u043b\\%u0430\\%u0434\\%u0438\\>", "feature": "\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0456\\%u043e\\%u043d\\%u0430\\%u043b\\>", "given": "\\%u041f\\%u0440\\%u0438\\%u043f\\%u0443\\%u0441\\%u0442\\%u0438\\%u043c\\%u043e, \\%u0449\\%u043e\\>\\|\\%u041f\\%u0440\\%u0438\\%u043f\\%u0443\\%u0441\\%u0442\\%u0438\\%u043c\\%u043e\\>\\|\\%u041d\\%u0435\\%u0445\\%u0430\\%u0439\\>\\|\\%u0414\\%u0430\\%u043d\\%u043e\\>", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0456\\%u0439\\>", "scenario_outline": "\\%u0421\\%u0442\\%u0440\\%u0443\\%u043a\\%u0442\\%u0443\\%u0440\\%u0430 \\%u0441\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0456\\%u044e\\>", "then": "\\%u0422\\%u043e\\%u0434\\%u0456\\>\\|\\%u0422\\%u043e\\>", "when": "\\%u042f\\%u043a\\%u0449\\%u043e\\>\\|\\%u041a\\%u043e\\%u043b\\%u0438\\>"},
      \"uz": {"and": "\\%u0412\\%u0430\\>", "background": "\\%u0422\\%u0430\\%u0440\\%u0438\\%u0445\\>", "but": "\\%u041b\\%u0435\\%u043a\\%u0438\\%u043d\\>\\|\\%u0411\\%u0438\\%u0440\\%u043e\\%u043a\\>\\|\\%u0410\\%u043c\\%u043c\\%u043e\\>", "examples": "\\%u041c\\%u0438\\%u0441\\%u043e\\%u043b\\%u043b\\%u0430\\%u0440\\>", "feature": "\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0438\\%u043e\\%u043d\\%u0430\\%u043b\\>", "given": "\\%u0410\\%u0433\\%u0430\\%u0440\\>", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439\\>", "scenario_outline": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439 \\%u0441\\%u0442\\%u0440\\%u0443\\%u043a\\%u0442\\%u0443\\%u0440\\%u0430\\%u0441\\%u0438\\>", "then": "\\%u0423\\%u043d\\%u0434\\%u0430\\>", "when": "\\%u0410\\%u0433\\%u0430\\%u0440\\>"},
      \"vi": {"and": "V\\%u00e0\\>", "background": "B\\%u1ed1i c\\%u1ea3nh\\>", "but": "Nh\\%u01b0ng\\>", "examples": "D\\%u1eef li\\%u1ec7u\\>", "feature": "T\\%u00ednh n\\%u0103ng\\>", "given": "Bi\\%u1ebft\\>\\|Cho\\>", "scenario": "T\\%u00ecnh hu\\%u1ed1ng\\>\\|K\\%u1ecbch b\\%u1ea3n\\>", "scenario_outline": "Khung t\\%u00ecnh hu\\%u1ed1ng\\>\\|Khung k\\%u1ecbch b\\%u1ea3n\\>", "then": "Th\\%u00ec\\>", "when": "Khi\\>"},
\"zh-CN": {"and": "\\%u800c\\%u4e14\\|\\%u5e76\\%u4e14\\|\\%u540c\\%u65f6", "background": "\\%u80cc\\%u666f\\>", "but": "\\%u4f46\\%u662f", "examples": "\\%u4f8b\\%u5b50\\>", "feature": "\\%u529f\\%u80fd\\>", "given": "\\%u5047\\%u5982\\|\\%u5047\\%u8bbe\\|\\%u5047\\%u5b9a", "scenario": "\\%u573a\\%u666f\\>\\|\\%u5267\\%u672c\\>", "scenario_outline": "\\%u573a\\%u666f\\%u5927\\%u7eb2\\>\\|\\%u5267\\%u672c\\%u5927\\%u7eb2\\>", "then": "\\%u90a3\\%u4e48", "when": "\\%u5f53"},
      \"zh-TW": {"and": "\\%u800c\\%u4e14\\|\\%u4e26\\%u4e14\\|\\%u540c\\%u6642", "background": "\\%u80cc\\%u666f\\>", "but": "\\%u4f46\\%u662f", "examples": "\\%u4f8b\\%u5b50\\>", "feature": "\\%u529f\\%u80fd\\>", "given": "\\%u5047\\%u5982\\|\\%u5047\\%u8a2d\\|\\%u5047\\%u5b9a", "scenario": "\\%u5834\\%u666f\\>\\|\\%u5287\\%u672c\\>", "scenario_outline": "\\%u5834\\%u666f\\%u5927\\%u7db1\\>\\|\\%u5287\\%u672c\\%u5927\\%u7db1\\>", "then": "\\%u90a3\\%u9ebc", "when": "\\%u7576"}}

function! s:pattern(key)
  let language = matchstr(getline(1),'#\s*language:\s*\zs\S\+')
  if &fileencoding == 'latin1' && language == ''
    let language = 'en'
  endif
  if has_key(g:cucumber_languages, language)
    let languages = [g:cucumber_languages[language]]
  else
    let languages = values(g:cucumber_languages)
  end
  return '\<\%('.join(map(languages,'get(v:val,a:key,"\\%(a\\&b\\)")'),'\|').'\)'
endfunction

function! s:Add(name)
  let next = " skipempty skipwhite nextgroup=".join(map(["Region","AndRegion","ButRegion","Comment","String","Table"],'"cucumber".a:name.v:val'),",")
  exe "syn region cucumber".a:name.'Region matchgroup=cucumber'.a:name.' start="\%(^\s*\)\@<=\%('.s:pattern(tolower(a:name)).'\)" end="$"'.next
  exe 'syn region cucumber'.a:name.'AndRegion matchgroup=cucumber'.a:name.'And start="\%(^\s*\)\@<='.s:pattern('and').'" end="$" contained'.next
  exe 'syn region cucumber'.a:name.'ButRegion matchgroup=cucumber'.a:name.'But start="\%(^\s*\)\@<='.s:pattern('but').'" end="$" contained'.next
  exe 'syn match cucumber'.a:name.'Comment "\%(^\s*\)\@<=#.*" contained'.next
  exe 'syn region cucumber'.a:name.'String start=+\%(^\s*\)\@<="""+ end=+"""+ contained'.next
  exe 'syn match cucumber'.a:name.'Table "\%(^\s*\)\@<=|.*" contained contains=cucumberDelimiter'.next
  exe 'hi def link cucumber'.a:name.'Comment cucumberComment'
  exe 'hi def link cucumber'.a:name.'String cucumberString'
  exe 'hi def link cucumber'.a:name.'But cucumber'.a:name.'And'
  exe 'hi def link cucumber'.a:name.'And cucumber'.a:name
  exe 'syn cluster cucumberStepRegions add=cucumber'.a:name.'Region,cucumber'.a:name.'AndRegion,cucumber'.a:name.'ButRegion'
endfunction

syn match   cucumberComment  "\%(^\s*\)\@<=#.*"
syn match   cucumberComment  "\%(\%^\s*\)\@<=#.*" contains=cucumberLanguage
syn match   cucumberLanguage "\%(#\s*\)\@<=language:" contained
syn match   cucumberUnparsed "\S.*" nextgroup=cucumberUnparsedComment,cucumberUnparsed,cucumberTags,cucumberBackground,cucumberScenario,cucumberScenarioOutline,cucumberExamples skipwhite skipempty contained
syn match   cucumberUnparsedComment "#.*" nextgroup=cucumberUnparsedComment,cucumberUnparsed,cucumberTags,cucumberBackground,cucumberScenario,cucumberScenarioOutline,cucumberExamples skipwhite skipempty contained

exe 'syn match cucumberFeature "\%(^\s*\)\@<='.s:pattern('feature').':" nextgroup=cucumberUnparsedComment,cucumberUnparsed,cucumberBackground,cucumberScenario,cucumberScenarioOutline,cucumberExamples skipwhite skipempty'
exe 'syn match cucumberBackground "\%(^\s*\)\@<='.s:pattern('background').':"'
exe 'syn match cucumberScenario "\%(^\s*\)\@<='.s:pattern('scenario').':"'
exe 'syn match cucumberScenarioOutline "\%(^\s*\)\@<='.s:pattern('scenario_outline').':"'
exe 'syn match cucumberExamples "\%(^\s*\)\@<='.s:pattern('examples').':" nextgroup=cucumberExampleTable skipempty skipwhite'

syn match   cucumberPlaceholder   "<[^<>]*>" contained containedin=@cucumberStepRegions
syn match   cucumberExampleTable  "\%(^\s*\)\@<=|.*" contains=cucumberDelimiter
syn match   cucumberDelimiter     "\\\@<!\%(\\\\\)*\zs|" contained
syn match   cucumberTags          "\%(^\s*\)\@<=\%(@[^@[:space:]]\+\s\+\)*@[^@[:space:]]\+\s*$" contains=@NoSpell

call s:Add('Then')
call s:Add('When')
call s:Add('Given')

hi def link cucumberUnparsedComment   cucumberComment
hi def link cucumberComment           Comment
hi def link cucumberLanguage          SpecialComment
hi def link cucumberFeature           Macro
hi def link cucumberBackground        Define
hi def link cucumberScenario          Define
hi def link cucumberScenarioOutline   Define
hi def link cucumberExamples          Define
hi def link cucumberPlaceholder       Constant
hi def link cucumberDelimiter         Delimiter
hi def link cucumberTags              Tag
hi def link cucumberString            String
hi def link cucumberGiven             Conditional
hi def link cucumberWhen              Function
hi def link cucumberThen              Type

let b:current_syntax = "cucumber"


