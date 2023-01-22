use std::path::PathBuf;
use clap::Parser;

#[derive(Parser)]
struct Cli {
    #[arg(long, short = 's')]
    pattern: String,

    #[arg(long, short = 'p')]
    path: PathBuf,
}

fn main() {
    let args = Cli::parse();

    println!("Looking for {} inside {}", args.pattern, args.path.display());

    let content = std::fs::read_to_string(&args.path).expect("Could not read file!");

    for line in content.lines() {
        if line.contains(&args.pattern) {
            println!("{}", line);
        }
    }

}
