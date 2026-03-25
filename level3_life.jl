module GameOfLife
using Plots
mutable struct Life
    current_frame::Matrix{Int}
    next_frame::Matrix{Int}
end

function count_live_neighbors(grid::Matrix{Int}, x::Int, y::Int)
    n, m = size(grid)
    live_count = 0
    
    for dx in -1:1 #соседи
        for dy in -1:1
            if dx == 0 && dy == 0
                continue
            end
            
            # тор
            nx = mod1(x + dx, n)
            ny = mod1(y + dy, m)
            
            live_count += grid[nx, ny]
        end
    end
    
    return live_count
end

function step!(state::Life)
    curr = state.current_frame
    next = state.next_frame
    n, m = size(curr)
    
    #следующее поколение
    for i in 1:n
        for j in 1:m
            live_neighbors = count_live_neighbors(curr, i, j)
            
            if curr[i, j] == 1  
                if live_neighbors < 2 || live_neighbors > 3
                    next[i, j] = 0  
                else
                    next[i, j] = 1  
                end
            else  
                if live_neighbors == 3
                    next[i, j] = 1  
                else
                    next[i, j] = 0
                end
            end
        end
    end
    
    state.current_frame, state.next_frame = state.next_frame, state.current_frame
    
    return nothing
end

function (@main)(ARGS)
    n = 30
    m = 30
    
    init = zeros(Int, n, m)
    
    if n > 10 && m > 10
        init[2, 3] = 1
        init[3, 4] = 1
        init[4, 2] = 1
        init[4, 3] = 1
        init[4, 4] = 1
    end
    
    if n > 5 && m > 5
        init[5, 5] = 1
        init[5, 6] = 1
        init[6, 5] = 1
        init[6, 6] = 1
    end
    
    if n > 8 && m > 8
        init[8, 8] = 1
        init[8, 9] = 1
        init[8, 10] = 1
    end
    
    game = Life(init, zeros(Int, n, m))
    
    anim = @animate for time = 1:100
        step!(game)
        cr = game.current_frame
        heatmap(cr, 
                title = "Game of Life - Generation $time",
                color = :blues,
                cbar = false,
                aspect_ratio = :equal,
                size = (600, 600))
    end
    
    gif(anim, "life.gif", fps = 10)
    println("Animation saved as life.gif")
end

export main

end

using .GameOfLife
GameOfLife.main("")