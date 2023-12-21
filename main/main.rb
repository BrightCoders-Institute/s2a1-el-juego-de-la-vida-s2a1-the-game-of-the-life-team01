# frozen_string_literal: true

# Clase con funciones para la lógica del desarrollo del juego.
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
    if @cels < (@rows * @cols)
      @cels.times do
        tablero[rand(0..@rows - 1)][rand(0..@cols - 1)] = '*'
      end
    end
    tablero
  end

  def mostrar_tablero
    @tablero.each { |row| puts row.join(' ') }
  end

  def generar_celula
    random1 = rand(0..@cols)
    random2 = rand(0..@rows)

    @tablero[random1][random2] = '*'

    Array.new(@rows) { Array.new(@cols, '.') }
  end

  def evolucionar
    loop do
      print "\n"
      nuevo_tablero = Array.new(@rows) { Array.new(@cols, '.') }


      @tablero.each_with_index do |fila, i|
        fila.each_with_index do |celula, j|
          vecinos_vivos = contar_vecinos_vivos(i, j)

          nuevo_tablero[i][j] = if celula == '*' # Célula viva
                                  if vecinos_vivos < 2 || vecinos_vivos > 3
                                    '.' # Celula muere
                                  else
                                    '*' # Celula sigue viva
                                  end
                                elsif vecinos_vivos == 3 # Célula muerta
                                  '*'
                                else
                                  '.' # Celula sigue muerta
                                end
        end
      end

      break if @tablero == nuevo_tablero


      @tablero = nuevo_tablero
      mostrar_tablero
    end
  end

  def contar_vecinos_vivos(position_x, position_y)
    vecinos_vivos = 0

    ((position_x - 1)..(position_x + 1)).each do |i|
      ((position_y - 1)..(position_y + 1)).each do |j|
        next if i.negative? || i >= @rows || j.negative? || j >= @cols || (i == position_x && j == position_y)

        vecinos_vivos += 1 if @tablero[i][j] == '*'
      end
    end

    vecinos_vivos
  end
end


puts 'Por favor, ingresa la cantidad de columnas:'
cols = gets.chomp.to_i
puts 'Ahora, ingresa la cantidad de filas:'
rows = gets.chomp.to_i

puts 'Cuantas celulas quieres generar'
cels = gets.chomp.to_i

tablero = GameLife.new(cols, rows, cels)
tablero.mostrar_tablero

# puts 'Presiona enter para continuar'
# input= gets.chomp
# if input.empty?

tablero.evolucionar

# else
# puts 'No has presionado enter pra continuar'
# end
