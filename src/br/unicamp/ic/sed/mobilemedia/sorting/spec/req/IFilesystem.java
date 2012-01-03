package br.unicamp.ic.sed.mobilemedia.sorting.spec.req;

import br.unicamp.ic.sed.mobilemedia.main.spec.dt.IImageData;

public interface IFilesystem{

	public IImageData[] getImages ( String albumName ) ; 
			
	public boolean updateImageInfo(IImageData oldData, IImageData newData);

}