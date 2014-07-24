import std.stdio;

void main() {
  // One of D's differences from C are built-in dynamic arrays
  // These arrays are bounds checked and you can change their size on the fly
  int[] array;
  array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; // Pre-sorted, as I didn't want to "cheat" by using the built in sort,
                                       // which comes in the same library as the built in search

  // Read in the target
  write("What number are you looking for? ");
  int target;
  readf("%s", &target);

  int i = search(array, target);

  if (i != -1) {
    write("Target found at index: ");
    writeln(i);
  } else {
    writeln("Target not found");
  }
}

int search(int[] a, int target) {
  int i = cast(int)a.length / 2;

  // Base case: if the element does not exist in the array, then the search
  // is over once the array shrinks to length 0
  if (a.length == 0) {
    return -1;
  }

  if (a[i] == target) {
    return i;
  } else if (a[i] > target) {
    int next_i = search(a[0..i], target); // Array slicing

    // If subsequent recursions cannot find the target, return -1
    if (next_i == -1) {
      return -1;
    }

    return next_i;
  } else {
    int next_i = search(a[(i+1)..a.length], target);

    // If subsequent recursions cannot find the target, return -1
    if (next_i == -1) {
      return -1;
    }

    return (i + 1) + next_i;
  }
}