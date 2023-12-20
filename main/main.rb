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
    if @cels < (@rows * @cols)
        @cels.times do
        tablero[rand(0..@rows-1)][rand(0..@cols-1)] = '*'
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
  def evolucionar
    nuevo_tablero = Array.new(@rows) { Array.new(@cols, '.') }

    @tablero.each_with_index do |fila, i|
      fila.each_with_index do |celula, j|
        vecinos_vivos = contar_vecinos_vivos(i, j)

        if celula == '*'  # Célula viva
          if vecinos_vivos < 2 || vecinos_vivos > 3
            nuevo_tablero[i][j] = '.'  # Celula muere
          else
            nuevo_tablero[i][j] = '*'  # Celula sigue viva
          end
        else  # Célula muerta
          if vecinos_vivos == 3
            nuevo_tablero[i][j] = '*'  # Celula nace
          else
            nuevo_tablero[i][j] = '.'  # Celula sigue muerta
          end
        end
      end
    end

    @tablero = nuevo_tablero
  end

  def contar_vecinos_vivos(x, y)
    vecinos_vivos = 0

    for i in (x - 1)..(x + 1)
      for j in (y - 1)..(y + 1)
        next if i < 0 || i >= @rows || j < 0 || j >= @cols || (i == x && j == y)

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
  cels= gets.chomp.to_i

tablero = GameLife.new(cols, rows, cels)
tablero.mostrar_tablero

#puts 'Presiona enter para continuar'
#input= gets.chomp
#if input.empty?
  while true 
    tablero.evolucionar 
  end
#else 
  #puts 'No has presionado enter pra continuar'
#end