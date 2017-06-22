function binary_search(arr, el) {
	let high = arr.length - 1
	let low = 0
	while (low <= high) {
		const mid = Math.ceil((low + high)/2)
		console.log(low, high, mid);
		guess = arr[mid]
		if (guess == el) {
			return mid
		}
		if (guess > el) {
			high = mid - 1
		} else {
			low = mid + 1
		}
	}
	return -1
}

console.log(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 7));
console.log(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 8));
console.log(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 9));
// console.log(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 5));