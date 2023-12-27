package triperDteam.vietflix.Program.Model;

import triperDteam.vietflix.Program.Entity.Member.Member;

public class MemberModel {
    public String mail;
    public String name;
    public MemberModel(Member member)
    {
        this.name = member.getName();
        this.mail = member.getMail();
    }
}
