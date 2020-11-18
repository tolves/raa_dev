class ProductsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ProductsCleanupJob.perform_later products
    ProductsCleanupJob.set(wait_until: Date.tomorrow.noon).perform_later(products)
  end
end
