package triperDteam.vietflix.Program.DAL;

import triperDteam.vietflix.Program.Entity.Member.Member;

public interface MemberRepository {
    Member getMemberInfoById(int id);
}
