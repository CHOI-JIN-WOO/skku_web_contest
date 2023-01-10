package com.sangs.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

public class SangsCmmnExcepHndlr implements ExceptionHandler {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void occur(Exception ex, String packageName) {
	}	
}
