package triperDteam.vietflix.Program.DAL;

import triperDteam.vietflix.Program.Entity.Member.Member;

import java.util.List;

public interface MemberRepository {
    Member getMemberInfoById(int id);
    void updatePackageMember(int memberId, int packageId);

    void updateHistory(int movieId, int memberId);
    List<Member> getListMember();
    String updateMemberInfo(Member member);
}
