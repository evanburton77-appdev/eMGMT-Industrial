require "ruby/openai"

Openai.api_key = "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"

def generate_text(prompt)
  response = Openai::Completion.create(
    engine: "text-davinci-002",
    prompt: prompt,
    max_tokens: 100,
    n: 1,
    stop: "",
    temperature: 0.5
  )

  response["choices"][0]["text"]
end

puts "Enter a prompt for ChatGPT to complete: "
prompt = gets.chomp

puts "Generated text: \n\n"
puts generate_text(prompt)
