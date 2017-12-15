fn main() {
    let mut vec: Vec<Vec<i32>> = Vec::new();

    for _i in 1..100 {
        vec.push(vec![0; 100]);
    }

    //////////////////////////////
    // let x = 50;              //
    // let y = 50;              //
    // let direction = "right"; //
    // let is_turning = false;  //
    // let path_length = 1;     //
    // let steps_taken = 0;     //
    // let times = 0;           //
    //////////////////////////////

    for row in &vec {

    }

    for row in &vec {
        for item in row {
            println!("{}", item)
        }
    }
}
