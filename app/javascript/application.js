// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.getElementById("menu").addEventListener("click", () => {
    document.getElementById("links").classList.toggle("is-active");
})
