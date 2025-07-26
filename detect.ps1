# Set variable with default admin accounts
$WellKnownAdmin = Get-LocalUser | where {$_.SID -like 'S-1-5-21*500'}
$DefaultAdmins = @(
    "$env:COMPUTERNAME\$WellKnownAdmin",
    "$env:COMPUTERNAME\local-admin",
    "S-1-12-1-1159141282-AAAAAAAAAA-BBBBBBBBBB-4034911353",
    "S-1-12-1-2819076202-CCCCCCCCCC-DDDDDDDDDD-2871121577"
)

# Get group name by SID
$AdminGroup = Get-LocalGroup | Where-Object { $_.SID -eq "S-1-5-32-544" }

# Get Members of this group
$GroupMembersList = @()
$GroupMembers = Get-LocalGroupMember -Group $AdminGroup.Name
foreach ($groupmember in $GroupMembers) {
    $GroupMembersList += $groupmember.Name
}

# Remove default accounts from the list
foreach ($DefaultAdmin in $DefaultAdmins) {
    $GroupMembersList = $GroupMembersList | Where-Object { $_ -ne $DefaultAdmin }
}

# Output result
$hash = @{ numberOfExtraAdmins = $GroupMembersList.Count }
$hash | ConvertTo-Json -Compress