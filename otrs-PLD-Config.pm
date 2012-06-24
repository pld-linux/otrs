# --
# Kernel/Config.pm - Config file for OTRS kernel
# Copyright (C) 2001-2003 Martin Edenhofer <martin+code@otrs.org>
# --
# $Id$
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see 
# the enclosed file COPYING for license information (GPL). If you 
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --
#  Note: 
#
#  -->> OTRS does have a lot of config settings. For more settings 
#       (Notifications, TicketViewAccelerator, TicketNumberGenerator, 
#       LDAP, PostMaster, Session, Preferences, ...) see 
#       Kernel/Config/Defaults.pm and copy your wanted lines into "this" 
#       config file. This file will not be changed on update! 
#
# -- 
package Kernel::Config;
# --
sub Load {
    my $Self = shift;
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    #         Start of your own config options!!!          #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #

    # ---------------------------------------------------- #
    # system data                                          #
    # ---------------------------------------------------- #
    # SecureMode
    # (Enable this so you can't use the installer.pl)
    $Self->{SecureMode} = 0;
    # SystemID
    # (The identify of the system. Each ticket number and
    # each http session id starts with this number)
    $Self->{SystemID} = 10; 
    # TicketHook 
    # (To set the Ticket identifier. Some people want to 
    # set this to e. g. 'Call#', 'MyTicket#' or 'TN'.)
    $Self->{TicketHook} = 'Ticket#';
    # FQDN
    # (Full qualified domain name of your system.)
    $Self->{FQDN} = 'yourhost.example.com';
    # AdminEmail 
    # (Email of the system admin.)
    $Self->{AdminEmail} = 'admin@example.com';
    # Organization
    # (If this is anything other than '', then the email will have an
    # Organization X-Header)
    $Self->{Organization} = 'Example Company';

    # ---------------------------------------------------- #
    # database settings                                    #
    # ---------------------------------------------------- #
    # DatabaseHost
    # (The database host.)
    $Self->{DatabaseHost} = 'localhost';
    # Database
    # (The database name.)
    $Self->{Database} = 'otrs';
    # DatabaseUser
    # (The database user.)
    $Self->{DatabaseUser} = 'otrs';
    # DatabasePw
    # (The password of database user.)
    $Self->{DatabasePw} = 'some-pass';
    # DatabaseDSN
    # (The database DSN for MySQL ==> more: "man DBD::mysql")
    $Self->{DatabaseDSN} = "DBI:mysql:database=$Self->{Database};host=$Self->{DatabaseHost};";
    # (The database DSN for PostgrSQL ==> more: "man DBD::Pg") 
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};";

    # (The database DSN for Oracle ==> more: "man DBD::oracle")
#    $Self->{DatabaseDSN} = "DBI:Oracle:sid=$Self->{Database};host=$Self->{DatabaseHost};port=1521;";
    # if needed, oracle env settings
#    $ENV{ORACLE_HOME} = '/opt/ora9/product/9.2';
#    $ENV{NLS_DATE_FORMAT} = 'YYYY-MM-DD HH24:MI:SS';
#    $ENV{NLS_LANG} = "german_germany.we8iso8859p15";

    # (The database DSN for DBI:ODBC ==> more: "man DBD::ODBC")
#    $Self->{DatabaseDSN} = "DBI:ODBC:$Self->{Database}";
    # If you use ODBC, no database auto detection is possible,
    # so set the database type here. Possible: mysq,postgresql,oracle,sapdb
#    $Self->{'Database::Type'} = 'sapdb';

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    $Self->{Home} = '/usr/share/otrs';

    # **************************************************** #
    # insert your own config settings "here"               # 
    # config settings taken from Kernel/Config/Defaults.pm # 
    # **************************************************** #
    # $Self->{SessionUseCookie} = 0;

    # **************************************************** #

    # ---------------------------------------------------- #
    # data inserted by installer                           #
    # ---------------------------------------------------- #
    # $DIBI$

    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    #           End of your own config options!!!          #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
}

# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #
use strict;
use vars qw(@ISA $VERSION);
use Kernel::Config::Defaults;
push (@ISA, 'Kernel::Config::Defaults');
$VERSION = '$Revision$';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;
# -----------------------------------------------------#

1;
