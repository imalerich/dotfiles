#include <iostream>
#include <vector>
#include <time.h>
#include <cmath>

using namespace std;

#define MOD_RAND 10

/**
 * Generates a sequence, which can be used
 * to order an array for the folding problem.
 * The returned vector will be of size 2^n
 * uniquely containing the elements {0,1,2,...n}.
 */
vector<int> gen_seq(const unsigned n) {
	vector<int> ret;
	if (n < 0) { return ret; }

	// initial setup - base case
	ret.push_back(0);

	for (auto K=0; K<n; K++) {
		// first, double our vector
		for (auto i=0; i<ret.size(); i++) {
			ret[i] *= 2;
		}

		// then, push back the interlacing odds
		const auto S = ret.size();
		for (auto i=0; i<S; i++) {
			ret.push_back(ret[i] + 1);
		}
	}

	return ret;
}

/**
 * Performs the "folding sort" algorithm
 * on the given input array. Assumes the length
 * of arr is a power of 2.
 */
vector<int> folding_sort(vector<int> arr) {
	// construct the sequenc determining the order of arr
	const auto N = (unsigned)log2(arr.size());
	vector<int> seq = gen_seq(N);

	// now just build up the new array using those indecies
	vector<int> ret;
	for (auto i : seq) {
		ret.push_back(arr[i]);
	}

	return ret;
}

/**
 * Prints the results of sequence for 2^n where n\in{0,1,2,3,4}.
 * Then, constructs a random array (power of 2, max size 16) and
 * performs the folding sort algorithm. Printing the state of the
 * array before and after the folding sort.
 */
int main(int argc, char ** argv) {
	cout << "Array Index sequence for arrays up to size 16." << endl;
	cout << "----------------------------------------------" << endl;
	for (int n=0; n<=4; n++) {
		vector<int> seq = gen_seq(n);

		cout << "[";
		for (auto i : seq) {
			cout << i << " ";
		} cout << "]" << endl;
	}

	cout << "----------------------------------------------" << endl;
	cout << "And a random example of the algorithm sorting an array." << endl;
	// generate a random array to be sorted
	const auto size = pow(2, rand() % 4);
	vector<int> arr;
	for (int i=0; i<size; i++) { arr.push_back(rand() % MOD_RAND); }

	// print the initial state of the array
	cout << "[";
	for (auto i : arr) {
		cout << i << " ";
	} cout << "]" << endl;

	// sort, and print the sort result
	arr = folding_sort(arr);
	cout << "[";
	for (auto i : arr) {
		cout << i << " ";
	} cout << "]" << endl;
	cout << "----------------------------------------------" << endl;

	return 0;
}
