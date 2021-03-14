use strict;
use warnings;
use Digest::MD5 qw(md5_hex);

my $fileName = ">>userAccount.txt";
my $username;
my $password;

# This runs the main sub routine
main();

# Main method
sub main
{
	createAccount();
	encryptPassword();
	saveAccount();
	holdConsole();
}

# Prompts user for username and password
sub createAccount
{
	print "\nEnter username: ";
	$username = <STDIN>;
	print "Enter password: ";
	$password = <STDIN>;
}

# Creates a md5 hash has based off of the password entered
sub encryptPassword
{
	$password = md5_hex($password);
}

# Stores hash password and username in a file
sub saveAccount
{
	open(USERACCOUNTFILE, $fileName) || die;
	print USERACCOUNTFILE $username;
	print USERACCOUNTFILE $password;
	close(USERACCOUNTFILE);
}

# Gives message to user and holds console.
sub holdConsole
{
	print "\n\nAccount created. Press enter to end the program... \n";
	<STDIN>;
}