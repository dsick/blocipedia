module ApplicationHelper

  def stripe_btn_data
    @stripe_btn_data ||= {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Blocipedia Subscription - #{current_user.username}",
      amount: 19_00 #Amount.default
    }
  end
  

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
