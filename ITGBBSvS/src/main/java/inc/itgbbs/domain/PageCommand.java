package inc.itgbbs.domain;

import org.apache.ibatis.type.Alias;

@Alias("PageCommand")
public class PageCommand {
	private String id;
	private int start;
	private int end;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
}
