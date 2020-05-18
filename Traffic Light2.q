//This file was generated from (Academic) UPPAAL 4.1.24 (rev. 29A3ECA4E5FB0808), November 2019

/*

*/
E<> lc.Red && lc.time > (24*3600*1000)

/*

*/
 A[] lc.NS_TurningGreen imply lc.time >= 2000

/*
When switching from EW Green to NS Green, the red light should be on in all directions for at least 2 seconds
*/
 A[] lc.EW_TurningGreen imply lc.time >= 2000

/*

*/
A[] (West.TurningGreen && East.TurningGreen) imply (West.t == East.t)

/*

*/
A[]((West.Red && East.Red) imply (West.t == East.t))

/*

*/
A[] ((West.Green && East.Green) imply (West.t == East.t))

/*

*/
A[] SysTimer == c.time

/*

*/
 c.EW_ControllerTurningGreen --> West.Green && East.Green && SysTimer < 12500

/*

*/
inf{North.Green && South.Green}: glock

/*

*/
(c.NS_ControllerTurningGreen && North.Red && South.Red && West.Red && East.Red) --> North.Green && South.Green && SysTimer < 4200

/*

*/
(c.ControllerTurningAllRed && East.Green && West.Green) --> North.Red && South.Red && West.Red && East.Red && SysTimer < 2100

/*
The system should be able to changefrom the state where the lights are green in the North and Southdirections to the state where all lights are red in less than XXXmilliseconds
*/
(c.ControllerTurningAllRed && North.Green && South.Green) --> North.Red && South.Red && West.Red && East.Red && SysTimer < 2100

/*
After NS_turnGreen!, North and South should be green within 10 or so seconds
*/
 c.NS_ControllerTurningGreen --> North.Green && South.Green && SysTimer < 6200

/*
There should be no path where all lights are green
*/
A[] !(North.Green && East.Green && South.Green && West.Green)

/*

*/
A[] East.Red imply !West.Green

/*

*/
A[] !deadlock

/*

*/
A[] 1>0

/*
If West is red, East should be red (maybe use NEXT)
*/
A[] West.Red imply !East.Green

/*

*/
A[] North.Red imply !(South.Green)

/*
If North is red, South should be red (maybe use NEXT)
*/
A[] North.Red imply (South.Red or South.TurningRed or South.TurningGreen)

/*
If South is red, North should be red (maybe use NEXT)
*/
A[] South.Red imply (North.Red or North.TurningRed or North.TurningGreen)

/*
There is a path to a state where North\/South are red and East\/West are green
*/
E<> North.Green && South.Green && East.Red && West.Red

/*
There is a path to a state where North\/South are red and East\/West are green
*/
E<> North.Red && South.Red && East.Green && West.Green

/*
 All paths should have a state where all lights are red
*/
A<> North.Red && South.Red && East.Red && West.Red
