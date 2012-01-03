
package br.unicamp.ic.sed.mobilemedia.photo.impl;

import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.List;

import br.unicamp.ic.sed.mobilemedia.photo.spec.prov.IPhoto;

class IPhotoFacade implements IPhoto{

	private PhotoController photoController;
	
	public IPhotoFacade( ){
		photoController = new PhotoController( );
	}
	
	
	public void initPhotoListScreen ( String[] imageNames ){
		
		/*debugging*/
		System.out.println("entering initPhotoListScreen...");
		
		photoController.initPhotoListScreen(imageNames);

	}

	public void initPhotoViewScreen ( Image image ){
		photoController.initPhotoViewScreen(image);

	} 

	public String getSelectedPhoto (  ){
		return photoController.getSelectedPhoto();

	}
	
	public String getAddedPhotoName() {
			
		return photoController.getAddedPhotoName();
	}
	
	public String getAddedPhotoPath() {
	
		return photoController.getAddedPhotoPath();
	}
	
	
	public void initAddPhotoToAlbum(String albumName) {
		photoController.initAddPhotoToAlbum(albumName);

	} 
	
	//[cosmos][add Sce. 3 Edit Label]
	public String getNewLabel() {
		System.out.println("Get new label - facade");
		return photoController.getNewLabel();
	}


	//[cosmos][add Sce. 3 Edit Label]
	public void initEditLabelScreen() {
		photoController.initEditLabelScreen();		
	} 

}