require 'gosu'

class HeroesOfTheSky < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Heroes Of The Sky"

    @background_image = Gosu::Image.new("media/sky.jpg", :tileable => true)
    @player_two = PlayerTwo.new
    @player = Player.new
    @player.warp(350, 240)
    @player_two.warps(320, 240)
  end
  def updatee
    if Gosu.button_down? Gosu::KB_A or Gosu::button_down? Gosu::GP_A
        @player_two.turn_left
      end
      if Gosu.button_down? Gosu::KB_D or Gosu::button_down? Gosu::GP_D
        @player_two.turn_right
      end
      if Gosu.button_down? Gosu::KB_W or Gosu::button_down? Gosu::GP_BUTTON_0
        @player_two.accelerate
      end
      @player_two.move
  end 

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
        @player.move
    end 

    def draw
        @player.draw
        @background_image.draw(0, 0, 0)# ...
    end

    def draws
        @player_two.draws
        @background_image.draws(0, 0, 0)# ...
    end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

  def player_two_button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

HeroesOfTheSky.new.show