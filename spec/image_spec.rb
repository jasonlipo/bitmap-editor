require_relative "../IOManager"
require_relative "../Commands"
require_relative "../Image"
require_relative "../Utils"
require_relative "../BitmapEditor"

describe Image do

  describe "#fill" do
    it "should replace every pixel with this new letter" do
      im = Image.new(5, 5)
      im.fill("A")
      expect(im.show).to eq "AAAAA\nAAAAA\nAAAAA\nAAAAA\nAAAAA"
      im.fill("S")
      expect(im.show).to eq "SSSSS\nSSSSS\nSSSSS\nSSSSS\nSSSSS"
    end
  end

  describe "#line" do
    it "should draw either a horizontal or vertical line" do
      im = Image.new(3, 6)
      im.fill("O")
      im.line("H", 1, 3, 4, "N")
      expect(im.show).to eq "OOO\nOOO\nOOO\nNNN\nOOO\nOOO"
      im2 = Image.new(7, 2)
      im2.fill("O")
      im2.line("V", 4, 1, 2, "J")
      expect(im2.show).to eq "OOOJOOO\nOOOJOOO"
    end
  end

  describe "#fits_width" do
    it "should return true if the value is within the width" do
      im = Image.new(4, 8)
      expect(im.fits_width(0)).to be true
      expect(im.fits_width(1)).to be true
      expect(im.fits_width(2)).to be true
      expect(im.fits_width(4)).to be false
      expect(im.fits_width(5)).to be false
      expect(im.fits_width(8)).to be false
    end
  end

  describe "#fits_height" do
    it "should return true if the value is within the height" do
      im = Image.new(4, 8)
      expect(im.fits_height(0)).to be true
      expect(im.fits_height(4)).to be true
      expect(im.fits_height(5)).to be true
      expect(im.fits_height(8)).to be false
      expect(im.fits_height(9)).to be false
      expect(im.fits_height(10)).to be false
    end
  end

end