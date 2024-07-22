package com.cm.board.vo;

public class LocationGu {
	   private int localGuNo;
	    private String localGuName;
	    
	    
		public LocationGu() {
			super();

		}
		public LocationGu(int localGuNo, String localGuName) {
			super();
			this.localGuNo = localGuNo;
			this.localGuName = localGuName;
		}
		public int getLocalGuNo() {
			return localGuNo;
		}
		public void setLocalGuNo(int localGuNo) {
			this.localGuNo = localGuNo;
		}
		public String getLocalGuName() {
			return localGuName;
		}
		public void setLocalGuName(String localGuName) {
			this.localGuName = localGuName;
		}
		
		
}
