# frozen_string_literal: true
#! 
class GameLife
  def initialize(cols, rows, cels)
    @cols = cols
    @rows = rows
    @cels = cels
    @tablero = crear_tablero
  end

  def crear_tablero
    # Crear el tablero con las dimensiones proporcionadas
    tablero = Array.new(@rows) { Array.new(@cols, '.') }
    if @cels < @rows && @cols
        @cels.times do
        tablero[rand(0..@rows)][rand(0..@cols)] = '*'
    end
    else
        
    end
    return tablero
  end

  def mostrar_tablero
    @tablero.each { |row| puts row.join(' ') }
  end

  def generar_celula
    random1 = rand(0..@cols)
    random2 = rand(0..@rows)

    @tablero[random1][random2] = "*"

    Array.new(@rows) { Array.new(@cols, '.') }

  end

  def crear_vida; end
end


puts 'Por favor, ingresa la cantidad de columnas:'
  cols = gets.chomp.to_i
puts 'Ahora, ingresa la cantidad de filas:'
  rows = gets.chomp.to_i

puts 'Cuantas celulas quieres generar'
  cels= gets.chomp.to_i

tablero = GameLife.new(cols, rows, cels)
tablero.mostrar_tablero
