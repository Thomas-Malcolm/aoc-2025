
function get_data(f)

    moves = []

    for line in readlines(open(f, "r"))
        d = line[1]
        v = line[2:end]

        if d == 'R'
            D = 1
        else
            D = -1
        end

        push!(moves, D * parse(Int, v))
    end

    return moves
end

function part1(data)
    return count(x -> x == 0, cumsum(data) .% 100)
end

function part2(data)
    
    count = 0
    dial = 0

    for d in data

        count += abs(d ÷ 100)
        rem = d % 100

        new_dial = dial + rem

        if (dial != 0)
            # Does remainder tick it over (or onto) 0 again, in either direction
            if abs(new_dial - 50) >= 50
                count += 1
            end
        end
        
        dial = mod(new_dial, 100) # In Julia, operator '%' persists sign, mod takes the sign of the second argument
    end


    return count
end

function main()

    moves = get_data("data.txt")
    dial_data = [50 ; moves]

    d1 = part1(dial_data)
    println("Part 1: $d1")

    d2 = part2(dial_data)
    println("Part 2: $d2")
end

main()
