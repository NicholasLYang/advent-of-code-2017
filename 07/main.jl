f = open("input")

lines = readlines(f)
parents_to_children = Dict{String,Array{String}}()
elements_to_weight = Dict{String,Integer}()
all_children = Set([])
all_elements = Set([])



for line in lines
    elements = split(line, " (")
    score = split(elements[2], ")")[1]
    parent = strip(elements[1])
    elements_to_weight[parent] = parse(Int64, score)
    push!(all_elements, parent)
end

for line in lines
    elements = split(line, "->")
    parent = split(elements[1], " (")[1]
    if size(elements)[1] > 1
        children = map(strip, split(elements[2], ","))
        parents_to_children[parent] = children
        for child in children
            push!(all_children, child)
        end
    end
end

function get_total_weight(element)
    total_weight = elements_to_weight[element]
    if (children = get(parents_to_children, element, nothing)) != nothing
        for child in children
            total_weight = total_weight + get_total_weight(child)
        end
    end
    return total_weight
end

root = collect(setdiff(all_elements, all_children))[1]

function compare_child_weights(root)
    children = get(parents_to_children, root, nothing)
    if children != nothing
        children_weights = map(get_total_weight, children)
        # If all the children's weights are the same
        if all(y -> y == children_weights[1], children_weights)
            return root
        else
z
            for child in children
                if (should_print_child)
                    println(child)
                    println(elements_to_weight[child])
                end
                # If children are equal
                if (result = compare_child_weights(child)) != nothing
                    println("Parent with equal children: ")
                    println(elements_to_weight[child])
                    should_print_child = true
                end

            end
            if (should_print_child)
                return nothing
            end
        end
    end
end

compare_child_weights(root)
