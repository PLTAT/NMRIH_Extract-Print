




#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <clients>
#include <sdktools_functions>

public Plugin myinfo =
{
	name = "Extract Print",
	author = "PLTAT",
	description = "Print Extract Info",
	version = SOURCEMOD_VERSION,
	url = "http://www.github.com/PLTAT/"
};

public void OnPluginStart()
{
	
	LoadTranslations("NMRIH_Extract-Print.phrases");
	HookEvent("extraction_begin", Keep_Look_Engine_Event_Extraction_Begin);
	HookEvent("player_extracted", Keep_Look_Engine_Event_Player_Extracted);
	HookEvent("extraction_expire", Keep_Look_Engine_Event_Extraction_Expire);
	HookEvent("extraction_complete", Keep_Look_Engine_Event_Extraction_Complete);
	
}

public void Keep_Look_Engine_Event_Extraction_Begin(Event Event_Extraction_Begin_Data, const char[] Character_Extraction_Begin_Hook, bool Bool_Extraction_Begin_IsSilent)
{
	
	PrintToConsoleAll("%t", "Extraction_Begin_Print", "Extract_Prefix");
	PrintToChatAll("%t", "Extraction_Begin_Print", "Extract_Prefix");
	PrintToServer("%t", "Extraction_Begin_Print", "Extract_Prefix");
	
	int Target = -1;
	int Found = 0;
	
	while((Target = FindEntityByClassname(Target, "nmrih_extract_point")) != -1)
	{
		
	    Found++;
		
		float Extraction_Time;
		
		Extraction_Time = GetEntPropFloat(Target, Prop_Data, "m_flExtractionTime");
		
		PrintToConsoleAll("%t", "Extraction_Time_Print", "Extract_Prefix", Found, Extraction_Time);
		PrintToChatAll("%t", "Extraction_Time_Print", "Extract_Prefix", Found, Extraction_Time);
		PrintToServer("%t", "Extraction_Time_Print", "Extract_Prefix", Found, Extraction_Time);
		
	}
	
}

public void Keep_Look_Engine_Event_Player_Extracted(Event Event_Player_Extracted_Data, const char[] Character_Player_Extracted_Hook, bool Bool_Player_Extracted_IsSilent)
{
	
	int Event_Player_Extracted_SourceMod_Client_Index = Event_Player_Extracted_Data.GetInt("player_id");
	
	char Client_Name[MAX_NAME_LENGTH];
	GetClientName(Event_Player_Extracted_SourceMod_Client_Index, Client_Name, sizeof(Client_Name));
	
	PrintToConsoleAll("%t", "Player_Extracted_Print", "Extract_Prefix", Client_Name);
	PrintToChatAll("%t", "Player_Extracted_Print", "Extract_Prefix", Client_Name);
	PrintToServer("%t", "Player_Extracted_Print", "Extract_Prefix", Client_Name);
	
}

public void Keep_Look_Engine_Event_Extraction_Expire(Event Event_Extraction_Expire_Data, const char[] Character_Extraction_Expire_Hook, bool Bool_Extraction_Expire_IsSilent)
{
	
	PrintToConsoleAll("%t", "Extraction_Expire_Print", "Extract_Prefix");
	PrintToChatAll("%t", "Extraction_Expire_Print", "Extract_Prefix");
	PrintToServer("%t", "Extraction_Expire_Print", "Extract_Prefix");
	
}

public void Keep_Look_Engine_Event_Extraction_Complete(Event Event_Extraction_Complete_Data, const char[] Character_Extraction_Complete_Hook, bool Bool_Extraction_Complete_IsSilent)
{
	
	PrintToConsoleAll("%t", "Extraction_Complete_Print", "Extract_Prefix");
	PrintToChatAll("%t", "Extraction_Complete_Print", "Extract_Prefix");
	PrintToServer("%t", "Extraction_Complete_Print", "Extract_Prefix");
	
}




