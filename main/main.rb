# frozen_string_literal: true
#! 
class GameLife
  def initialize(cols, rows)
    @cols = cols
    @rows = rows
    @tablero = crear_tablero
  end

  def crear_tablero
    # Crear el tablero con las dimensiones proporcionadas
    Array.new(@rows) { Array.new(@cols, '.') }
  end

  def mostrar_tablero
    @tablero.each { |row| puts row.join(' ') }
  end

  def generar_celula; end

  def crear_vida; end
end


puts 'Por favor, ingresa la cantidad de columnas:'
    cols = gets.chomp.to_i
puts 'Ahora, ingresa la cantidad de filas:'
    rows = gets.chomp.to_i

tablero = GameLife.new(cols, rows)
tablero.mostrar_tablero
