void Main()
{
	Console.WriteLine(Descriptors.Decode("vssgp.Uy0xLTktMTU1MTM3NDI0NS0zMTUxMTQxNTA2LTQxNzk5ODY1MDMtMzA2Njc5MzIyNi0zNjY1ODY4MTg5LTEtNDEyOTk1MDM0NC0zMzUxNDQzNzg5LTI0MTc2NDEyNjItMTMzMzUxMjI2NQ"));
}

// You can define other methods, fields, classes and namespaces here


/// <summary>
/// Class saved as gist at https://go.beeming.net/3BsihNy
/// </summary>
public class Descriptors
{
	/* List
	 * ====
	 * scp      Project
	 * aad      Azure Active Directory User
	 * msa      Microsoft Account User
	 * aadgp    Azure Active Directory Group
	 * 
	 * User Descriptors
	 * ================
	 * aad.ODcxMWYxZDItOxxxxxxxxxxxxxxxxxxxxxx
	 * Microsoft.IdentityModel.Claims.ClaimsIdentity;72aa0d83-xxxxxxxxxxxxxxxxxxxxxx\\Gordon.Beeming@company.com
	 * Microsoft.IdentityModel.Claims.ClaimsIdentity;domain\\principalName
	 *	 
	 * msa.ODcxMWYxZDItOxxxxxxxxxxxxxxxxxxxxxx
	 * Microsoft.IdentityModel.Claims.ClaimsIdentity;00037xxxxxxxxx@live.com
	 * Microsoft.IdentityModel.Claims.ClaimsIdentity;originId@live.com
	 * 
	 * AD Groups
	 * =========
	 * aadgp.Uy0xLTktMTU1MTM3xxxxxxxxxxxxxxxxxxxxxx
	 * Microsoft.TeamFoundation.Identity;S-1-9-1551xxxxxxxxxxxxxxxxxxxxxx
	 * 
	 */


	public static (string origin, string localId) Decode(string descriptor)
	{
		var indexOfDot = descriptor.IndexOf(".");
		if (indexOfDot == -1)
		{
			throw new Exception($"Invalid descriptor '{descriptor}'.");
		}
		int attempts = 0;
		while(attempts <= 2)
		{
			try
			{
				return (descriptor.Remove(indexOfDot), Encoding.UTF8.GetString(Convert.FromBase64String(descriptor.Remove(0, indexOfDot + 1) + new string('=',attempts))));
			}
			catch 
			{
				attempts++;				
			}
		}
		return (descriptor.Remove(indexOfDot),"error");
	}

	public static string Create(string origin, string localId)
	{
		return $"{origin}.{Convert.ToBase64String(Encoding.UTF8.GetBytes(localId)).TrimEnd('=')}";
	}
}