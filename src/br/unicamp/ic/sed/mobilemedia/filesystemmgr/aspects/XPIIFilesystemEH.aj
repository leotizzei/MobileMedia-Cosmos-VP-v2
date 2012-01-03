package br.unicamp.ic.sed.mobilemedia.filesystemmgr.aspects;

import javax.microedition.lcdui.Image;

import br.unicamp.ic.sed.mobilemedia.main.spec.dt.IImageData;
import br.unicamp.ic.sed.mobilemedia.filesystemmgr.spec.excep.ImageNotFoundException;
import br.unicamp.ic.sed.mobilemedia.filesystemmgr.spec.excep.InvalidImageDataException;
import br.unicamp.ic.sed.mobilemedia.filesystemmgr.spec.excep.InvalidPhotoAlbumNameException;
import br.unicamp.ic.sed.mobilemedia.filesystemmgr.spec.excep.PersistenceMechanismException;
import br.unicamp.ic.sed.mobilemedia.filesystemmgr.spec.excep.UnavailablePhotoAlbumException;
import br.unicamp.ic.sed.mobilemedia.filesystemmgr.spec.excep.ImagePathNotValidException;


public aspect XPIIFilesystemEH {
	//=========IFilesystem============
	private pointcut getImagesIFilesystem():
		call(IImageData[] getImages(String)) 
		&& withincode(IImageData[] br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.getImages(String));
	
	private pointcut addNewPhotoToAlbumIFilesystem():
		call(void addNewPhotoToAlbum(String,String,String)) &&
		withincode(void br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.addNewPhotoToAlbum( String , String , String  ) );
			
	private pointcut deleteImageIFilesystem():
		call(void deleteImage(String,String)) &&
		withincode(void br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.deleteImage( String , String ) );
	
	private pointcut getImageFromRecordStoreIFilesystem():
		call(Image getImageFromRecordStore(String,String)) &&
		withincode(Image br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.getImageFromRecordStore( String , String ) );
	
	private pointcut resetImageDataIFilesystem():
		call(void resetImageData()) &&
		withincode(void br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.resetImageData( ) );
	
	private pointcut createNewPhotoAlbumIFilesystem():
		call(void createNewPhotoAlbum(String)) &&
		withincode(void br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.createNewPhotoAlbum(String) );
	
	private pointcut deletePhotoAlbumIFilesystem():
		call(void deletePhotoAlbum(String)) &&
		withincode(void br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.deletePhotoAlbum(String) );
	
	private pointcut readImageAsByteArrayIFilesystem():
		call(byte[] readImageAsByteArray(String)) &&
		withincode(byte[] br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.readImageAsByteArray(String) );
	
	private pointcut getBytesFromImageInfoIFilesystem():
		call(byte[] getBytesFromImageInfo(IImageData)) &&
		withincode(byte[] br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.getBytesFromImageInfo(IImageData) );
	
	private pointcut updateImageInfoIFilesystem():
		call(boolean updateImageInfo(IImageData,IImageData)) &&
		withincode(boolean br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.updateImageInfo(IImageData,IImageData) );
	
	private pointcut getImageInfoIFilesystem():
		call(IImageData getImageInfo(String)) &&
		withincode(IImageData br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.getImageInfo(String) );

	
	private pointcut addImageDataIFilesystem():
		call(void addImageData(String,IImageData,String)) &&
		withincode(void br.unicamp.ic.sed.mobilemedia.filesystemmgr.impl.IFilesystemFacade.addImageData(String,IImageData,String) );
	
	declare soft: UnavailablePhotoAlbumException:
		getImagesIFilesystem() ;
	
	declare soft: ImageNotFoundException: 
		deleteImageIFilesystem() ||
		getImageFromRecordStoreIFilesystem() ||
		getImageInfoIFilesystem();
	
	declare soft: ImagePathNotValidException: 
		readImageAsByteArrayIFilesystem();
	
	declare soft: InvalidImageDataException: 
		addNewPhotoToAlbumIFilesystem() ||
		getBytesFromImageInfoIFilesystem() ||
		readImageAsByteArrayIFilesystem() ||
		updateImageInfoIFilesystem() ||
		addImageDataIFilesystem(); 
	
	declare soft: PersistenceMechanismException: 
		deleteImageIFilesystem() ||
		addNewPhotoToAlbumIFilesystem() ||
		getImageFromRecordStoreIFilesystem() || 
		resetImageDataIFilesystem() ||
		createNewPhotoAlbumIFilesystem() ||
		deletePhotoAlbumIFilesystem() ||
		updateImageInfoIFilesystem() ||
		addImageDataIFilesystem();
	
	declare soft: InvalidPhotoAlbumNameException:
		createNewPhotoAlbumIFilesystem();
	
	//all exceptions
	public pointcut handleException() : 
		getImagesIFilesystem() ||
		addNewPhotoToAlbumIFilesystem() ||
		getBytesFromImageInfoIFilesystem() ||
		readImageAsByteArrayIFilesystem() ||
		deleteImageIFilesystem() ||
		getImageFromRecordStoreIFilesystem() || 
		resetImageDataIFilesystem() ||
		createNewPhotoAlbumIFilesystem() ||
		deletePhotoAlbumIFilesystem() ||
		updateImageInfoIFilesystem() ||
		addImageDataIFilesystem();
}
