package triperDteam.vietflix.Program.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import triperDteam.vietflix.Program.DAL.Package_DAL;
import triperDteam.vietflix.Program.Entity.Package.Package;

import java.util.List;
@Service
public class PackageService {
    @Autowired
    Package_DAL packageDal;
    public List<Package> setListPackage()
    {
        List<Package> packages = packageDal.getListPackage();
        return packages;
    }

}
