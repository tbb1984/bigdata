package org.apache.shiro.web.tags;
import org.apache.shiro.web.tags.PermissionTag;

public class HasAnyPermissionsTag extends PermissionTag{
	
	private static final long serialVersionUID = 7064023875270273991L;
	
	private static final String ROLE_NAMES_DELIMETER = ",";

	public HasAnyPermissionsTag(){
		
	}

	@Override
	protected boolean showTagBody(String permissions) {
		 boolean hasAnyPermission = false;
		for(String p: permissions.split(ROLE_NAMES_DELIMETER)){
			if(isPermitted(p.trim())){
				hasAnyPermission = true;
				break;
			}
		}
		return hasAnyPermission;
	}

}
