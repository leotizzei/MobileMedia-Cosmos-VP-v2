package br.unicamp.ic.sed.mobilemedia.mobilephone_vp_sort_fav.impl;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.List;

import br.unicamp.ic.sed.mobilemedia.main.spec.dt.IImageData;
import br.unicamp.ic.sed.mobilemedia.mobilephonemgr.aspects.XPIBaseController;
import br.unicamp.ic.sed.mobilemedia.photo.aspects.XPIChangeScreen;

 
public privileged aspect Variant_sort_fav {
 
	private SortingStub sorting = new SortingStub();
	
	public pointcut getImages(String recordName):
		XPIBaseController.getImages(recordName);
	  
	IImageData[] around( String recordName ) : getImages( recordName ){
		sorting.returnGetImages = proceed( recordName );
		 
		return sorting.getImages( recordName );
	}  
	 
	
	pointcut getImageName() : XPIBaseController.getImageName();
	
	private String imageSelected = null;
	
	String around( ) : getImageName(){ 
		imageSelected = proceed();
		return imageSelected; 
	} 
	
	public pointcut postCommand(Command c):
		XPIBaseController.postCommand(c);
	
	boolean around( Command c ): postCommand( c ){
			
		
		if( sorting.postCommand( c ) ){ 
				c = new Command("Select", Command.ITEM, 1);
		}
		return proceed( c );
		
	}
	
	
	
	public pointcut getStoreName(): 
		XPIBaseController.getStoreName();

	String around( ) : getStoreName(  ){
		String storeName = proceed( );
		sorting.setCurrentStoreName( storeName );
		
		return storeName;
				
	}
	
	public pointcut initMenu( List photoListScreen ):
		XPIChangeScreen.initMenu(photoListScreen);
	
	void around( List photoListScreen ) : initMenu( photoListScreen ){
		proceed( photoListScreen );
		sorting.initMenu( photoListScreen );
	}
}
