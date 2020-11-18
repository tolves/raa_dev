class ProductsCleanupJob < ApplicationJob
  queue_as :default
  queue_as :low_priority
  around_perform :around_cleanup

  def perform(trashable, depth)
    # Do something later
    ProductsCleanupJob.perform_later products
    ProductsCleanupJob.set(wait_until: Date.tomorrow.noon).perform_later(products)
    rescue_from(ActiveRecord::RecordNotFound) do |exception|
      retry_on exception # defaults to 3s wait, 5 attempts
      # Do something with the exception
    end


    discard_on ActiveJob::DeserializationError
    # I18n.locale = :ie
    # UserMailer.welcome(@user).deliver_later
    trashable.cleanup(depth)
  end

  private

  def around_cleanup
    # Do something before perform
    yield
    # Do something after perform
  end
end