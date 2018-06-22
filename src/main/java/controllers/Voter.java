package controllers;

public class Voter {
    private boolean hasVoted;
    private String name;

    public Voter(String name)
    {
        this.hasVoted = false;
    }

    public void stamp()
    {
        this.hasVoted = true;
    }
}
