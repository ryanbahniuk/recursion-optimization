def binary_search(target, array, counter = 0)
	low = 0
	high = array.length - 1

	middle_index = array.length / 2

	return (counter + middle_index) if array[middle_index] == target
	return -1 if array.length == 1

	if target > array[middle_index]
		counter += (low..middle_index).size
		low = middle_index + 1
	elsif array[middle_index] > target
		high = middle_index - 1
	end

	binary_search(target, array[low..high], counter)
end


# Driver Code Below
require 'benchmark'

needle = 30
haystack = (0...100).to_a

Benchmark.bm do |x|
	x.report { $response = binary_search(needle, haystack) }
end
puts
puts "returns this value: #{$response}"
