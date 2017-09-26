class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :not_yet_released?
  validate :release_date_cannot_be_in_future

  def not_yet_released?
    released == true
  end

  def release_date_cannot_be_in_future
    if self.release_year && self.release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end


  # {scope: :released}
  # validate :check_release_year
  #
  #
  # def check_release_year
  #   if self.released == true
  #     self.release_year
  #   elsif self.released == false
  #     !self.release_year
  #   end
  # end
  #
  # def title_includes_keywords
  #   phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  #   unless self.title != nil && phrases.any? do |phrase|
  #     self.title.include?(phrase)
  #   end
  #     errors.add(:title, "True Facts")
  #   end
  # end
end
