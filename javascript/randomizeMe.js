console.log("Hello");

// This bit is for debugging only, so that I can get repeatable random #s
// // the initial seed
// Math.seed = 6;

// // in order to work 'Math.seed' must NOT be undefined,
// // so in any case, you HAVE to provide a Math.seed
// Math.seededRandom = function(max, min) {
//     max = max || 1;
//     min = min || 0;

//     Math.seed = (Math.seed * 9301 + 49297) % 233280;
//     var rnd = Math.seed / 233280;

//     return min + rnd * (max - min);
// }

$(document).ready(function() {
  $('*').each( function() {
    // // So I can debug w/ the same seed
    // var rand_color = Math.floor(Math.seededRandom(16777215, 0)).toString(16);

    var rand_color = Math.floor(Math.random()*16777215).toString(16);

    var rand_complement = rand_color.substring(2, 4) + rand_color.substring(0, 2) + rand_color.substring(4, 6);

    $( this ).css('background-color', "#" + rand_color);
    $( this ).css('color', "#" + rand_complement);
  });
});

console.log("Goodbye");