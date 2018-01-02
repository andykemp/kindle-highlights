module KindleHighlights
  class Highlight
    attr_accessor :asin, :text, :page, :location

    def self.from_html_elements(book:, html_elements:)
      new(
        asin: book.asin,
        text: html_elements.children.search("div.kp-notebook-highlight").first.text.squish,
        page: html_elements.children.search("span#annotationHighlightHeader").first.text.partition('|').last.lstrip.chop,
		location: html_elements.children.search("input#kp-annotation-location").first.attributes["value"].value,
      )
    end

    def initialize(asin:, text:, page:, location:)
      @asin = asin
      @text = text
	  @page = page
      @location = location
    end

    def to_s
      text
    end
  end
end
