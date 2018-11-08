# README

Word API is a Rails API server with 3 endpoints: '/words/random', '/words/rhyming', and '/words/reverse'. 

# Prerequisites
* Ruby 2.5.1
* Rails 5

# Installation
```
  $ git clone https://github.com/Adjoa/rails-word-api.git
  $ cd rails-word-api
  $ bundle install
  $ rails server
```

# Run the test suite
`bundle exec rspec`

# About
'/words/random'
Returns a randomly selected word from an array of words

cURL Test
`curl -i -X POST -H 'Content-Type: application/json' -d '{"words": ["one", "two"]}' http://localhost:8080/words/random`

'/words/rhyming'
Returns an array of words that rhyme with the submitted word

cURL Test
`curl -i -X POST -H 'Content-Type: application/json' -d '{"word": "rotation"}' http://localhost:8080/words/rhyming`

'/words/reverse'
Returns the reversed equivalent of the submitted word

cURL Test
`curl -i -X POST -H 'Content-Type: application/json' -d '{"word": ""}' http://localhost:8080/words/reverse`



