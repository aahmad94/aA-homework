// Phase I
// mystery scoping

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping1(); // in block, in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2(); // SyntaxError: Identifier 'x' has already been declared

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping3(); // SyntaxError: Identifier 'x' has already been declared

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4(); // in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

mysteryScoping5(); // SyntaxError: Identifier 'x' has already been declared

// "We shall VERB the ADJECTIVE NOUN".

function madLib(verb, noun, adj) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(query, subquery) {
  return query.includes(subquery)
}

function fizzBuzz(arr) {
  const result = []

  for(let i=0; i < arr.length; i++) {
    if (arr[i] % 15 === 0) {
      continue;
    }
    else if (true) {
      result.push(arr[i]);
    }
  }
  return result
}

function isPrime(num) {
  if (num < 2) { return false; }
  for(let i=2; i < num-1; i++) {
    if (num % i === 0) {
      return false;
      break;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let num_primes = 0;

  for(let i = 1; num_primes < n; i++) {
    if (isPrime(i)) {
      num_primes += 1;
      sum += i;
    }
  }
  return sum;
}
