package triperDteam.vietflix.Program.Model;

import triperDteam.vietflix.Program.Entity.Member.Member;

public class MemberModel {
    public String mail;
    public String name;
    public String expPackage;
    public MemberModel(Member member)
    {
        this.name = member.getMember_name();
        this.mail = member.getMail();
        this.expPackage = member.getExp_package();
    }
}
