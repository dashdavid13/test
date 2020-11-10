require 'gosu'


class HeroesOfTheSky < Gosu::Window
   def initialize
    super 640, 480
    self.caption = "Heroes Of The Sky"

    @background_image = Gosu::Image.new("media/sky.jpg", :tileable => true)

    #@player_two = Player.new
    @player = Player.new
    @player.warp(350, 240)
    #@player_two.warp(320, 240)
    
    @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
    @stars = Array.new
  end
  #def updatee
    #if Gosu.button_down? Gosu::KB_A or Gosu::button_down? Gosu::GP_A
      #  @player_two.turn_left
      #end
      #if Gosu.button_down? Gosu::KB_D or Gosu::button_down? Gosu::GP_D
       # @player_two.turn_right
      #end
     # if Gosu.button_down? Gosu::KB_W or Gosu::button_down? Gosu::GP_BUTTON_0
        #@player_two.accelerate
      #end
     # @player_two.move
  #end 

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
        @player.collect_stars(@stars)

    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
      end
    end 

    def draw
        @background_image.draw(0, 0, ZOrder::BACKGROUND)
        @player.draw
        #@player_two.draw
        @stars.each { |star| star.draw }
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

# in the CLI when they're ready to start playing call this 
HeroesOfTheSky.new.show
# when we initialzie this can we pass in ids for the jets and game realted 