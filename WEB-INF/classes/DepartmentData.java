
import java.util.*;
import java.io.Serializable;

public class DepartmentData implements Serializable {

    private int departmentId;
    private String departmentName;

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String department) {
        this.departmentName = department;
    }
	
	public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int id) {
        this.departmentId = id;
    }
    
}
