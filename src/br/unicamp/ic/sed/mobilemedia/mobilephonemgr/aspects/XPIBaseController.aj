package br.unicamp.ic.sed.mobilemedia.mobilephonemgr.aspects;

import javax.microedition.lcdui.Command;

import br.unicamp.ic.sed.mobilemedia.main.spec.dt.IImageData;

public aspect XPIBaseController {

	public pointcut postCommand(Command c):
	execution(public boolean br.unicamp.ic.sed.mobilemedia.mobilephonemgr.impl.BaseController.handleCommand(Command))
	&& args(c);
 
	public pointcut getImages(String recordName):
		call(public IImageData[] br.unicamp.ic.sed.mobilemedia.mobilephonemgr.spec.req.IFilesystem.getImages(String))
		&& args(recordName);   

	public pointcut getImageName( ) : 
		call( public String br.unicamp.ic.sed.mobilemedia.mobilephonemgr.impl.BaseController.getSelectedPhoto() )
		&& withincode(public boolean br.unicamp.ic.sed.mobilemedia.mobilephonemgr.impl.BaseController.handleCommand(Command));
	
	public pointcut getStoreName(): 
		execution(private String br.unicamp.ic.sed.mobilemedia.mobilephonemgr.impl.BaseController.getStoreName());	
	
}
