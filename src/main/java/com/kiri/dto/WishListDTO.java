package com.kiri.dto;

public class WishListDTO {
	private int seq_wishlist;
	private int seq_group;
	private String user_email;
	
	public WishListDTO() {
		super();
	}

	public WishListDTO(int seq_wishlist, int seq_group, String user_email) {
		super();
		this.seq_wishlist = seq_wishlist;
		this.seq_group = seq_group;
		this.user_email = user_email;
	}

	public int getSeq_wishlist() {
		return seq_wishlist;
	}

	public void setSeq_wishlist(int seq_wishlist) {
		this.seq_wishlist = seq_wishlist;
	}

	public int getSeq_group() {
		return seq_group;
	}

	public void setSeq_group(int seq_group) {
		this.seq_group = seq_group;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "WishListDTO [seq_wishlist=" + seq_wishlist + ", seq_group=" + seq_group + ", user_email=" + user_email
				+ "]";
	}
	
	
}
