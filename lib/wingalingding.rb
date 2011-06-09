require File.join( File.dirname(__FILE__), "/scraper.rb")
require File.join( File.dirname(__FILE__), "/char.rb")

module Wingalingding
  
  CATEGORIES = ["ACCENT", "ACROPHONIC", "AEGEAN", "ALCHEMICAL", "ARABIAN", "ARABIC", 
    "ARAMAIC", "ARMENIAN", "AVESTAN", "BALINESE", "BENGALI", "BOPOMOFO", "BRACKET", 
    "BRAHMI", "BRAILLE", "BUGINESE", "BYZANTINE", "CANADIAN", "CAPITAL", "CARIAN", 
    "CARRIER", "CHARACTER", "CHEROKEE", "CHOSEONG", "CIRCLE", "CIRCLED", "CIRCUMFLEX", 
    "CLOSED", "COMBINING", "COMPATIBILITY", "CONSONANT", "COPTIC", "CROSSING", "CUNEIFORM", 
    "CYPRIOT", "CYRILLIC", "Chinese", "DESCENDER", "DESERET", "DEVANAGARI", "DIAERESIS", 
    "DIAGONAL", "DIAMOND", "DINGBAT", "DOMINO", "DOTTED", "DOUBLE", "DOWNWARDS", "DRAWINGS", 
    "EGYPTIAN", "EPSILON", "EQUALS", "ETHIOPIC", "FRACTION", "FRAKTUR", "FULLWIDTH", 
    "FUNCTIONAL", "GEORGIAN", "GLAGOLITIC", "GUJARATI", "GURMUKHI", "HALFWIDTH", 
    "HANGUL", "HARPOON", "HEBREW", "HEXAGRAM", "HIEROGLYPH", "HIRAGANA", 
    "HORIZONTAL", "HUNDRED", "IDEOGRAM", "IDEOGRAPH", "IDEOGRAPHIC", "IMPERIAL", 
    "INDICATOR", "INITIAL", "INSCRIPTIONAL", "INSTRUMENTAL", "INVERTED", "ISOLATED", 
    "ITALIC", "JAVANESE", "JONGSEONG", "JUNGSEONG", "KAITHI", "KANGXI", "KANNADA", 
    "KATAKANA", "KHAROSHTHI", "KangXi", "LEFTWARDS", "LEPCHA", "LETTER", "LIGATURE", 
    "LINEAR", "MACRON", "MAHJONG", "MAKSURA", "MALAYALAM", "MATHEMATICAL", "MEDIAL", 
    "MEETEI", "MIDDLE", "MODIFIER", "MONGOLIAN", "MONOSPACE", "MUSICAL", "MYANMAR", 
    "NEGATIVE", "NOTATION", "NUMBER", "NUMERAL", "NUMERIC", "OMICRON", "OPERATOR", "ORKHON", 
    "ORNAMENT", "OSMANYA", "PARENTHESIS", "PARENTHESIZED", "PARTHIAN", "PATTERN", 
    "PERISPOMENI", "PERSIAN", "PHAISTOS", "PLAYING", "POINTING", "PRESENTATION",
     "PUNCTUATION", "Province", "RADICAL", "REJANG", "REVERSED", "RIGHTWARDS", "SAMARITAN", 
     "SAURASHTRA", "SCRIPT", "SHAVIAN", "SINGLE", "SINHALA", "SQUARE", "SQUARED", "STROKE", 
     "SUBJOINED", "SUBSCRIPT", "SUNDANESE", "SYLLABICS", "SYLLABLE", "SYLOTI", "SYMBOL", 
     "SYRIAC", "Shandong", "Shanxi", "TELEGRAPH", "TELUGU", "TETRAGRAM", "THAANA", 
     "THOUSAND", "TIBETAN", "TIFINAGH", "TRIANGLE", "TRIPLE", "TURKIC", "TURNED", 
     "UGARITIC", "UNIFIED", "UPSILON", "UPWARDS", "VARIATION", "VERTICAL", "VOCALIC", 
     "YENISEI", "YPOGEGRAMMENI", "ancient", "animal", "bamboo", "basket", "beautiful", 
     "between", "bright", "carriage", "clothes", "coarse", "cooked", "county", "disease", 
     "earthenware", "family", "female", "fierce", "flowing", "flying", "grains", "imperial", 
     "insect", "instrument", "leather", "legendary", "little", "measure", "mountain", "musical", 
     "narrow", "number", "particle", "person", "province", "radical", "sacrifice", "second", 
     "something", "species", "stream", "strike", "strong", "surname", "through", "together", 
     "variant", "variety", "vessel", "without", "wooden", "yellow"]
  
  
  def self.collect_keywords
    Scraper.character_map.join.split(/\s+/).select{|w| w.match(/^[a-zA-Z]+$/) }#.uniq
  end
  
  def self.collect_popular_keywords
    all_keys = collect_keywords
    uniqs = all_keys.uniq
    matches = []
    uniqs.sort.each do |w|
      if w.length > 5 && all_keys.count(w) > 29
        matches << w
        puts w 
      end
    end
    puts matches.inspect
    matches
  end
  
end