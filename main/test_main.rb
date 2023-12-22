require 'minitest/autorun'
require_relative 'main'  # Ajusta el nombre del archivo según tu estructura de archivos

class TestGameLife < Minitest::Test
  def setup
    @cols = 5
    @rows = 5
    @cells = 12
    @game_life = GameLife.new(@cols, @rows, @cells)
  end

  def test_crear_tablero
    assert_equal @rows, @game_life.instance_variable_get(:@tablero).size
    assert_equal @cols, @game_life.instance_variable_get(:@tablero).first.size
  end

  def test_mostrar_tablero
    assert_output(/^[.*\s]*$/) { @game_life.mostrar_tablero }
  end

  def test_generar_celula
    before_tablero = @game_life.instance_variable_get(:@tablero).clone
    @game_life.generar_celula
    after_tablero = @game_life.instance_variable_get(:@tablero)
    refute_equal before_tablero, after_tablero
  end
  # Agrega más pruebas según sea necesario para cubrir otras funciones de tu clase GameLife
end
