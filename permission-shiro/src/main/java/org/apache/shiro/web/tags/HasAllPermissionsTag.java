package org.apache.shiro.web.tags;
import org.apache.shiro.web.tags.PermissionTag;

public class HasAllPermissionsTag extends PermissionTag{
	
	private static final long serialVersionUID = 7064023875270273991L;
	
	private static final String ROLE_NAMES_DELIMETER = ",";

	public HasAllPermissionsTag(){
		
	}

	@Override
	protected boolean showTagBody(String permissions) {
		 boolean hasAllPermission = true;
		for(String p: permissions.split(ROLE_NAMES_DELIMETER)){
			if(!isPermitted(p.trim())){
				hasAllPermission = false;
				break;
			}
		}
		return hasAllPermission;
	}

}
