package controllers;

import java.util.Map;

public class VoteController {
    private Map<Integer, Candidate> pres;
    private Map<Integer, Candidate> vp;
    private Map<Integer, Candidate> sen;
    private Map<Integer, Candidate> rep;
    private Map<Integer, Candidate> gov;
    private Map<Integer, Candidate> mayor;
    private Map<Integer, Voter> voters;

    public VoteController(Map<Integer, Candidate> pres, Map<Integer, Candidate> vp,
                          Map<Integer, Candidate> sen, Map<Integer, Candidate> rep,
                          Map<Integer, Candidate> gov, Map<Integer, Candidate> mayor)
    {
        this.pres = pres;
        this.vp = vp;
        this.sen = sen;
        this.rep = rep;
        this.gov = gov;
        this.mayor = mayor;
    }

    public void vote(Voter v, int c_id, CandidateType position)
    {
        switch (position) {
            case PRESIDENT:
                pres.get(c_id).vote();
                break;
            case VICEPRESIDENT:
                vp.get(c_id).vote();
                break;
            case SENATOR:
                sen.get(c_id).vote();
                break;
            case DISTRICTREP:
                rep.get(c_id).vote();
                break;
            case GOVERNOR:
                gov.get(c_id).vote();
                break;
            case MAYOR:
                mayor.get(c_id).vote();
                break;
        }
    }
}
