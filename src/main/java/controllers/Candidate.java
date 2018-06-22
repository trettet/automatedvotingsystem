package controllers;

public class Candidate {
    private final String name;
    private final Party party;
    private final CandidateType pos;
    private int votes;

    public Candidate(String name, CandidateType pos, Party party)
    {
        this.name = name;
        this.pos = pos;
        this.party = party;
        this.votes = 0;
    }

    public String getName()
    {
        return this.name;
    }

    public Party getParty()
    {
        return this.party;
    }

    public CandidateType getPosition()
    {
        return this.pos;
    }

    public void vote()
    {
        votes++;
    }
    public int getVotes() { return votes; }
}
