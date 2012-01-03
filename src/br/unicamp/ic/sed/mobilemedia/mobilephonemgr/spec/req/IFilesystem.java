package br.unicamp.ic.sed.mobilemedia.mobilephonemgr.spec.req;
import javax.microedition.lcdui.Image;

import br.unicamp.ic.sed.mobilemedia.main.spec.dt.IImageData;

public interface IFilesystem{

	
	public IImageData[] getImages ( String albumName ) ; 
	
	public void addNewPhotoToAlbum ( String imageName, String imagePath, String albumName ); 
	
	public void deleteImage ( String imageName, String albumName ) ; 
	
	public Image getImageFromRecordStore ( String albumName, String imageName ) ; 
	
	/*aspectized*/
	public String[] getAlbumNames (  ); 
	
	/*aspectized*/
	public void resetImageData (  ) ; 
	
	public void createNewPhotoAlbum ( String albumName ) ; 
	
	public void deletePhotoAlbum ( String albumName ) ; 

	//[cosmos][add Sce 2. Edit Label]
	public IImageData getImageInfo( String imageName ) ;
	public boolean updateImageInfo(IImageData oldData, IImageData newData) ;
}