class GenerateWeeklyPagesJob < ApplicationJob
    queue_as :default
  
    def perform
      page_num = 3
      client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])
  
      response = client.chat_completions.create(
        model: "gpt-4",
        messages: [{ role: "system", content: "You are a creative writer specializing in crystals and metaphysical topics." }],
        max_tokens: 1000,
        temperature: 0.7
      )
  
      pages = response.choices[0].message.content.split("\n").map(&:strip)
  
      pages.each_with_index do |page, index|
        # Call the OpenAI API for HTML and JSON generation here.
        # Generate HTML, image, color scheme, etc., like in the Flask app.
        
        print(page)
        #Page.create!(
        #  title: page,
        #  json_data: json_data,  # Replace with JSON from OpenAI
        #  image_url: image_url,  # Replace with image URL from OpenAI or DALL-E
        #  html_content: html_content,  # Replace with generated HTML
        #  day_index: index + 1
        #)
      end
    end
  end
