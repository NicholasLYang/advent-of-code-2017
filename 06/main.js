
const main = (input) => {
    arr = input.split("\t")
    arrayStates = []
    intArray = arr.map(item => parseInt(item));
    arrayStates.push(intArray.join(" "));
    while(true) {
	const maxIndex = findMaxIndex(intArray);
	let bucket = intArray[maxIndex];
	intArray[maxIndex] = 0;
	let index = maxIndex + 1;
	while (bucket > 0) {
	    if (index >= intArray.length) {
		index = 0
	    }
	    intArray[index] = intArray[index] + 1;
	    index = index + 1;
	    bucket = bucket - 1;
	}
	const stringOfArray = intArray.join(" ");
	if (arrayStates.includes(stringOfArray)) {
	    console.log(arrayStates.length);
	    return;
	} else {
	    arrayStates.push(intArray.join(" "));
	}
    }
}

const findMaxIndex = arr => {
    let maxIndex = 0;
    for (let i = 0; i < arr.length; i++) {
	if (arr[i] > arr[maxIndex]) {
	    maxIndex = i;
	}
    }
    return maxIndex;
}

main("5	1	10	0	1	7	13	14	3	12	8	10	7	12	0	6")
