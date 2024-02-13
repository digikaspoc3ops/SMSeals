import { CurrentPageReference } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { LightningElement, wire } from 'lwc';
export default class UpLoadDocument extends LightningElement {
    relatedRecordId;
    relatedRecordBool = false;
    currentPageReference;

    @wire( CurrentPageReference )
    setCurrentPageReference( currentPageReference ) {

        this.currentPageReference = currentPageReference;
        if ( this.currentPageReference.state.c__recId ) {

            this.relatedRecordId = this.currentPageReference.state.c__recId;
            this.relatedRecordBool = true;
            console.log( 'Rec Id is ' + this.relatedRecordId );

        } else {

            this.relatedRecordBool = false;

        }

    }

    handleUploadFinished(event) {

        const uploadedFiles = event.detail.files;
        let noOfFiles = uploadedFiles.length;
        console.log( 'No. of files uploaded', noOfFiles );
        this.dispatchEvent(
            new ShowToastEvent( {
                title: 'File(s) Download',
                message: noOfFiles + 'File(s) Uploaded Successfully!!!',
                variant: 'success'
            } ),
        );

    }
}