module LtreeRails
  module Utils
    module PathUtils
      extend self

      def combine_paths(first_part, second_part)
        return second_part.to_s unless first_part
        "#{first_part}.#{second_part}".squeeze('.')
      end
    end
  end
end