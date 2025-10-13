return {
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby", "yaml", "html", "javascript", "coffee" },
    config = function()
      -- vim-railsの設定
      vim.g.rails_projections = {
        ["app/controllers/*.rb"] = {
          type = "controller",
          alternate = "spec/controllers/{}_spec.rb",
          template = {
            "class {camelcase|capitalize|colons}Controller < ApplicationController",
            "end"
          }
        },
        ["app/models/*.rb"] = {
          type = "model",
          alternate = "spec/models/{}_spec.rb",
          template = {
            "class {camelcase|capitalize|colons} < ApplicationRecord",
            "end"
          }
        },
        ["app/views/*"] = {
          type = "view"
        },
        ["spec/models/*_spec.rb"] = {
          type = "spec",
          alternate = "app/models/{}.rb",
          template = {
            "require 'rails_helper'",
            "",
            "RSpec.describe {camelcase|capitalize|colons}, type: :model do",
            "  pending \"add some examples to (or delete) #{__FILE__}\"",
            "end"
          }
        },
        ["spec/controllers/*_spec.rb"] = {
          type = "spec",
          alternate = "app/controllers/{}.rb",
          template = {
            "require 'rails_helper'",
            "",
            "RSpec.describe {camelcase|capitalize|colons}, type: :controller do",
            "  pending \"add some examples to (or delete) #{__FILE__}\"",
            "end"
          }
        }
      }
    end
  }
}