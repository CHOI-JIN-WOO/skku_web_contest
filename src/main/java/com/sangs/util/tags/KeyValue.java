package com.sangs.util.tags;

import java.io.Serializable;

public class KeyValue implements Serializable {

	private static final long serialVersionUID = 1511004937253036524L;

	private String key;

	private String value;

	private String description;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() { 
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("KeyValue [key=");
		builder.append(key);
		builder.append(", value=");
		builder.append(value);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

}