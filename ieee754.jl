function ieee754(input)
    if input < 0 #negative number, set sign bit to 1
        signBit = 1
        input = input * -1
    else #otherwise set sign bit to 0
        signBit = 0
    end

    leftOfDec = floor(input) #the number to the left of the decimal point
    rightOfDec = input - leftOfDec #the number to the right of the decimal point
    leftDigits = 0 #number of binary digits to left of decimal
    rightDigits = 0 #number of binary digits to right of decimal
    binaryLeftOfDec = "" #binary of number left of decimal
    binaryRightOfDec = "" #binary number right of the decimal

    while leftOfDec != 0 #iterate through binary digits
        result = int(leftOfDec % 2)
        leftOfDec = int((leftOfDec - result) / 2) #new decimal is half rounded down of older
        binaryLeftOfDec = "$result$binaryLeftOfDec" #add one in binary place if there is a remainder of 1, 0 otherwise
        leftDigits = leftDigits + 1 #increment binary digits by one
    end

    if leftDigits > 53 #make sure it isn't longer than there is storage
        binaryLeftOfDec = binaryLeftOfDec[1:53]
    end

    while rightDigits < (53 - leftDigits) #determine that mantissa is not too long
        temp = int(floor(rightOfDec * 2)) #execute algorithm to build binary to right of decimal
        binaryRightOfDec = "$binaryRightOfDec$temp" #append answer
        rightOfDec = (rightOfDec * 2) - temp #continue cycle
        rightDigits = rightDigits + 1 #increment binary digits by one
    end

    if leftDigits > 0 #if there the number is >= 1
        exponent = leftDigits + 1022 #calculate exponent bias
        binaryExponent = ""
        exponentDigits = 0
        while exponentDigits < 11 #translate bias to binary
            result = exponent % 2
            exponent = int((exponent - result) / 2)
            binaryExponent = "$result$binaryExponent"
            exponentDigits = exponentDigits + 1
        end
        mantissa = "$binaryLeftOfDec$binaryRightOfDec" #calculate mantissa
        mantissa = mantissa[2:end]
        println("$signBit$binaryExponent$mantissa") #print answer

    elseif input == 0 #in special case of 0
        println("0000000000000000000000000000000000000000000000000000000000000000") #print answer

    else #nonzero less than 1
        count = 1
        while binaryRightOfDec[count] != '1'
            count = count + 1
        end
        rightDigits = rightDigits - count
        binaryRightOfDec = binaryRightOfDec[(count+1):end] #find mantissa
        while rightDigits < 52 #fill out rest of mantissa
            temp = int(floor(rightOfDec * 2))
            binaryRightOfDec = "$binaryRightOfDec$temp"
            rightOfDec = (rightOfDec * 2) - temp
            rightDigits = rightDigits + 1
        end
        exponent = 1023 - count #calculate exponent bias
        binaryExponent = ""
        exponentDigits = 0
        while exponentDigits < 11 #build binary bias
            result = exponent % 2
            exponent = int((exponent - result) / 2)
            binaryExponent = "$result$binaryExponent"
            exponentDigits = exponentDigits + 1
        end
        println("$signBit$binaryExponent$binaryRightOfDec") #print answer
    end
end
