package tbd.analisistweets.mysql;

import java.util.*;


public class Genre {

    private int id;

    private String name;

    private List<Artist> artists;



    private List<Statistic> statistic;
    private List<Statistic> geostatistic;

    public List<Statistic> getStatistic() {
        return statistic;
    }

    /**
	 * @return the geostatistic
	 */
	public List<Statistic> getGeostatistic() {
		return geostatistic;
	}

	/**
	 * @param geostatistic the geostatistic to set
	 */
	public void setGeostatistic(List<Statistic> geostatistic) {
		this.geostatistic = geostatistic;
	}

	public void setStatistic(List<Statistic> statistic) {
        this.statistic = statistic;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
