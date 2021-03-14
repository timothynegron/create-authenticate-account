# Purpose: To authenticate user of application.
use strict;
use warnings;
use Digest::MD5 qw(md5_hex);

my $fileName = "<userAccount.txt";
my $usernameAttempt;
my $passwordAttempt;
my $username;
my $password;

# This runs the main sub routine
main(); 

# Main method
sub main
{
	authenticateUser();
	genPassAttemptToHash();
	retrieveAccount();
	verifyUser();
	holdConsole();
}

# Gets username and password from user attempting to login
sub authenticateUser
{
	print "\nEnter username: ";
	$usernameAttempt = <STDIN>;
	print "Enter password: ";
	$passwordAttempt = <STDIN>;
}

# Generates password attempt to md5 hash
sub genPassAttemptToHash
{
	$passwordAttempt = md5_hex($passwordAttempt);
}

# Opens file where account info was stored
# and retrieves username and password
sub retrieveAccount
{
	open(USERACCOUNTFILE, $fileName) || die;
	$username = <USERACCOUNTFILE>;
	$password = <USERACCOUNTFILE>;
	close(USERACCOUNTFILE);
}

# Verifies if username attempt and password attempt is correct
sub verifyUser
{
	if($usernameAttempt eq $username)
	{
		if($passwordAttempt eq $password)
		{
			print "\nAccess Granted";
		}
		else
		{
			print "\nAccess Denied";
		}
	}
	else
	{
		print "\nAccess Denied";
	}
}

# Hold console so console window won't close
sub holdConsole
{
	print "\n\nPress enter to continue... \n";
	<STDIN>;
}