module Customization
  COLORS = {
    red: "\e[31m",
    green: "\e[32m",
    yellow: "\e[33m",
    blue: "\e[34m",
    purple: "\e[35m",
    orange: "\e[38;5;208m",
    dark_red: "\e[38;5;52m"
  }.freeze

  FORMATS = {
    bold: "\e[1m",
    italic: "\e[3m",
    reset: "\e[0m"
  }.freeze

  def self.color_text(text, color)
    "#{COLORS[color]}#{text}#{FORMATS[:reset]}"
  end

  def self.format_text(text, format)
    "#{FORMATS[format]}#{text}#{FORMATS[:reset]}"
  end

  def self.visible_length(text)
    text.gsub(/\e\[\d+(;\d+)*m/, '').length
  end

  def self.center_text(text, width)
    padding = [(width - visible_length(text)) / 2, 0].max
    ' ' * padding + text
  end
end
