//This file was generated from UPPAAL 4.0.2 (rev. 2491), August 2006

/*

*/
E<> lc.Red && lc.time > (24*3600)

/*

*/
 A[] lc.NS_TurningGreen imply lc.time >= 2

/*
When switching from EW Green to NS Green, the red light should be on in all directions for at least 2 seconds
*/
 A[] lc.EW_TurningGreen imply lc.time >= 2

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
There should be no path where all lights are green
*/
A[] !(North.Green && East.Green && South.Green && West.Green)

/*

*/
A[] East.Red imply !West.Green

/*

*/
E<> cost < 100

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
