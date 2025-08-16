import { LightningElement, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/PracticeComponentController.getContacts';

export default class PracticeComponent extends LightningElement {

    @track data = [];

    columns = [
        { label: "Id", fieldName: "Id", initialWidth: 100 },
        { label: "Name", fieldName: "Name", sortable: true, editable: true }
    ];

    @wire(getContacts)
    WiredContacts({data, error}){
        if(data){
            console.log('data: ',JSON.stringify(data));
            this.data = data;
        }else if(error){
            console.log('error: ', JSON.stringify(error));
            // doing some changes
        }
    }
}