#MRAGAKSHI
#22229981
#MS5114

# Expected knowledge to resolve the assignment:
#  functions
#  strings
#  lists
#  tuples
#  dictionaries
#  conditionals
#  operators


# 1. donuts
# Given an int count of a number of donuts, return a string
# of the form 'Number of donuts: <count>', where <count> is the number
# passed in. However, if the count is 10 or more, then use the word 'many'
# instead of the actual count.
# So donuts(5) returns 'Number of donuts: 5'
# and donuts(23) returns 'Number of donuts: many'
def donuts(count):
    if(count < 10):
        string = "Number of donuts: "+str(count)
    else:
        string = "Number of donuts: many"
    return string


# 2. both_ends
# Given a string s, return a string made of the first 2
# and the last 2 chars of the original string,
# so 'spring' yields 'spng'. However, if the string length
# is less than 2, return instead the empty string.
def both_ends(s):
    string = ""
    if(len(s) > 2):
        string = s[0:2] + s[len(s) - 2] + s[len(s)-1]
    return string


# 3. fix_start
# Given a string s, return a string
# where all occurences of its first char have
# been changed to '*', except do not change
# the first char itself.
# e.g. 'babble' yields 'ba**le'
# Assume that the string is length 1 or more.
# Hint: s.replace(stra, strb) returns a version of string s
# where all instances of stra have been replaced by strb.
def fix_start(s):
    firstletter = s[0]
    string = s.replace(firstletter, "*")
    string = firstletter + string[1:]
    return string


# 4. MixUp
# Given strings a and b, return a single string with a and b separated
# by a space '<a> <b>', except swap the first 2 chars of each string.
# e.g.
#   'mix', pod' -> 'pox mid'
#   'dog', 'dinner' -> 'dig donner'
# Assume a and b are length 2 or more.
def mix_up(a, b):
    firstlettersa = a[0:2]
    firstlettersb = b[0:2]
    string = firstlettersb + a[2:] +" "+ firstlettersa + b[2:]
    return string


# 5. match_ends
# Given a list of strings, return the count of the number of
# strings where the string length is 2 or more and the first
# and last chars of the string are the same.
# Note: python does not have a ++ operator, but += works.
def match_ends(words):
    count = 0
    for word in words:
        if(word[0] == word[len(word)-1] and len(word)>2):
            count += 1
    return count


# 6. front_x
# Given a list of strings, return a list with the strings
# in sorted order, except group all the strings that begin with 'x' first.
# e.g. ['mix', 'xyz', 'apple', 'xanadu', 'aardvark'] yields
# ['xanadu', 'xyz', 'aardvark', 'apple', 'mix']
# Hint: this can be done by making 2 lists and sorting each of them
# before combining them.
def front_x(words):
    list1 = words
    list2 = []
    for word in words:
        if(word.startswith('x')):
            list2.append(word)
            list1.remove(word)
    list1.sort()
    list2.sort()
    for word in list1:
        list2.append(word)   
    return list2

front_x(['mix', 'xyz', 'apple', 'xanadu', 'aardvark'])

# 7. sort_last
# Given a list of non-empty tuples, return a list sorted in increasing
# order by the last element in each tuple.
# e.g. [(1, 7), (1, 3), (3, 4, 5), (2, 2)] yields
# [(2, 2), (1, 3), (3, 4, 5), (1, 7)]
# Hint: use a custom key= function to extract the last element form each tuple.
def sort_last(tuples):
    return sorted(tuples, key= lambda x: x[-1])


# 8. front_back
# Consider dividing a string into two halves.
# If the length is even, the front and back halves are the same length.
# If the length is odd, we'll say that the extra char goes in the front half.
# e.g. 'abcde', the front half is 'abc', the back half 'de'.
# Given 2 strings, a and b, return a string of the form
#  a-front + b-front + a-back + b-back
def front_back(a, b):
    afront= ""
    aback = ""
    bfront=""
    bback=""
    if(len(a) %2 == 0):
        afront = a[0:(len(a)//2)]
        aback = a[(len(a)//2):]
    else:
        afront = a[0:((len(a)//2)+1)]
        aback = a[((len(a)//2)+1):]
        
    if(len(b) %2 == 0):
        bfront = b[0:len(b)//2]
        bback = b[(len(b)//2):]
    else:
        bfront = b[0:((len(b)//2)+1)]
        bback = b[((len(b)//2)+1):]
    return afront +" + " + aback+" + " +bfront+" + " +bback


# 9. Given two lists sorted in increasing order, create and return a merged
# list of all the elements in sorted order. You may modify the passed in lists.
# Ideally, the solution should work in "linear" time, making a single
# pass of both lists.
def linear_merge(list1, list2):
    mergedlist =[]
    i = 0
    j = 0
    
    while len(mergedlist) != (len(list1) + len(list2)):
        if(len(list1) == i):
            mergedlist += list2[j:]
            break
        elif(len(list2) == j):
            mergedlist += list1[i:]
            break
        elif(list1[i]<list2[j]):
            mergedlist.append(list1[i])
            i+=1
        else:
            mergedlist.append(list2[j])
            j+=1
      
    return mergedlist


# 10.
#  Write a function called accept_login(users, username, password) with three parameters:
# users a dictionary of username keys and password values (already created below),
# username a string for a login name and password a string for a password.
# The function should return
# True if the user exists and the password is correct and False otherwise.

users = {
    "user1": "password1",
    "user2": "password2",
    "user3": "password3"
}


def accept_login(users, user, password):
    return user in users and users[user] == password


# 11.
# Write a function called
# find_value(mydict, val)
# that accepts a dictionary called mydict (already created below) and a variable of any type called
# val. The function should return a list of keys that map to the value val in mydict.
mydict = {
    "day1": "sunny",
    "day2": "rainy",
    "day3": "sunny"
}


def find_value(mydict, val):
    keys = []
    for key, value in mydict.items():
        if (value==val):
            keys.append(key)
    return keys


# 12. Write a function to invert a dictionary. It should accept a dictionary as a parameter and return a
# dictionary where the keys are
# values from the input dictionary and the values are lists of keys from the input dictionary.
# For example, this input:
# { "key1" : "value1", "key2" : "value2", "key3" : "value1" }
# should return this dictionary:
# { "value1" : ["key1", "key3"], "value2" : ["key2"] }

my_dict = {
    "key1": "value1",
    "key2": "value2",
    "key3": "value1"
}


def invert_dict(my_dict):
    newdict = {}
    for key in my_dict:
        newdict.setdefault(my_dict[key], [])
        newdict[my_dict[key]].append(key)
    return newdict

# 13.
# Write a function called word_frequencies(mylist) that accepts a list of strings
# called mylist and returns a dictionary where
# the keys are the words from mylist and the values are the number
# of times that word appears in mylist:
# INPUT
mylist = ['a', 'a', 'a', 'a', 'a', 'b', 'b', 'b', 'b', 'c', 'c', 'c', 'd', 'd', 'e']


# OUTPUT
# {'a': 5, 'b': 4, 'c': 3, 'd': 2, 'e': 1}


def word_frequencies(mylist):
    dictionary = {}
    for letter in mylist:
        if letter in dictionary:
            dictionary[letter] = dictionary.get(letter, 0) +1
        else:
            dictionary.update({letter: 1})
    return dictionary
