extern mod extra;
extern mod std;
use extra::comm::DuplexStream;
use std::io::timer::sleep;

fn main() {

    println!("Oh no! Alice and Bob are at it again!");

    let (for_alice, for_bob) = DuplexStream::new();   

    do spawn {
        alice(&for_alice);
    }

    do spawn {
        bob(&for_bob);
    }
}

fn alice(channel: &DuplexStream<int, int>) {
    let mut bob_statement: int;
    let mut alice_response: int;
    println!("Alice has started arguing. Because she's more argumentative, she'll start");
    channel.send(0);
    loop {
        bob_statement = channel.recv();
        alice_response = bob_statement + 1;
        println!("That's patently preposterous, Bob! The answer isn't {:d}, it's {:d}", bob_statement, alice_response);
        channel.send(alice_response);
        sleep(1000);
    }
}

fn bob(channel: &DuplexStream<int, int>) {
    let mut alice_statement: int;
    let mut bob_response: int;
    println("Bob has started arguing");
    loop {
        alice_statement = channel.recv();
        bob_response = alice_statement + 2;
        println!("That's irreconcilably imbecilic, Alice! The answer isn't {:d}, it's {:d}", alice_statement, bob_response);
        channel.send(bob_response);
        sleep(1000);
    }
}