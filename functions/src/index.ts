import * as functions from 'firebase-functions';

//take in a user data (request type function)
//its basically an endpoint that you can hit. In our case, it looks like this:
//https://us-central1-project-alek.cloudfunctions.net/getSelection
exports.getRandomNumber = functions.https.onRequest((request, response) => {
    const recipients : number = 100; //maybe we can see now how this format helps us :D 
    const selection : number= Math.round(Math.random() * recipients);


    console.log("Ethan learns how to log"); //if you need a quick debug, this is the way to do it
    //this method returns whatever data we generated here
    response.send(selection.toString());
});

//this is an example of a callable function, which can be called directly from the code
exports.testCallable = functions.https.onCall((data, context) => {
    return {"data": "this is some data"};
});

//this is callable because we don't need to store any data in the firebase quite yet
exports.getSelection = functions.https.onCall((data, context) => {
    //first we need to make a time stamp
    const timestamp:Date = new Date();
    console.log(timestamp.toUTCString());
    let selection:number[];
    let recipients:number;
    let supply:number;

    //use data to generate an array
    if(!!data.recipients && !!data.supply){
        recipients= data.recipients;
        supply = data.supply;
        selection = new Array();

        //if there's enough supply that everyone gets one, just return every recipient
        if(supply > recipients){
            for (let index = 0; index < supply; index++) {
                selection.push(index+1);
            }
        }
        else {
            for (let index = 0; index < supply;) {
                const random:number = Math.round(Math.random() * recipients);
                if(!selection.includes(random)){
                    selection.push(random);
                    ++index;
                }
            }
        }
    } 
    else return 'invalid data';

    const toReturn : any = {
        "timestamp": timestamp.toUTCString(),
        "selection": selection,
        "recipients": recipients,
        "supply": supply
    };

    return <JSON> toReturn; 
})
