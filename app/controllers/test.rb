Complete the below given method which takes an array and prints the majority element
(if it exists), otherwise prints “No Majority Element”. A majority element in an array
A of size n is an element that appears more than n/2 times (and hence there is at most one such element).
    Test Cases:  I/P : [3, 3, 4, 2, 4, 4, 2, 4, 4] O/P : 4  I/P : [3, 3, 4, 2, 4, 4, 2, 4] O/P :
 end
    No Majority Element   def get_majority_element arr  # your code goes here end
    end

def cal_arr(arr=[3,3,4,2,4,4,2,4,4,3,3,3])
  size_of_arr = arr.count #n=9
  idx= size_od_arr/2 #4 3, , 2
  count = 1
  res = {}
  arr.each_with_index do |data,idx|
    res[data] = count+1
  end






  if (arr.include?idx)

  end
end