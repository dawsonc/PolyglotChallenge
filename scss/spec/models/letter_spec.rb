describe Letter do
  describe '::get_latest' do
    it 'should return only the most recent letter' do
      create(:letter, created_at: DateTime.new(2014, 01, 01),
                      body: 'Old Timer')
      create(:letter, created_at: DateTime.new(2014, 01, 02),
                      body: 'Spring Chicken')

      most_recent = Letter.most_recent
      expect(most_recent.body).to eq 'Spring Chicken'
      expect(most_recent.created_at).to eq DateTime.new(2014, 01, 02)
    end
  end
end
