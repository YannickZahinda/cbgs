class Eleve < ApplicationRecord
    # after_create_commit { broadcast_prepend_to "tweets" }
end
