# TODO:
# - separate 3 subpackages: common files, administration and client frontend
# - all otrs-var into /var/lib/otrs
# - put cron in proper place
# - write not so brain-damage init-script...
# - do not provide system perl deps:
#   perl-MailTools-2.08-1.noarch: required "perl(Net::SMTP::SSL)" is provided by the following packages:
#   a) otrs-3.0.11-1.noarch
#   b) perl-Net-SMTP-SSL-1.01-1.noarch
%include	/usr/lib/rpm/macros.perl
Summary:	The Open Ticket Request System
Summary(pl.UTF-8):	Open Ticket Request System - otwarty system zgłaszania żądań
Name:		otrs
Version:	3.1.3
Release:	1
Epoch:		1
License:	GPL
Group:		Applications/Databases
Source0:	http://ftp.otrs.org/pub/otrs/%{name}-%{version}.tar.bz2
# Source0-md5:	2af2a1a2b8bcd959ee9cf532d0016953
Source1:	%{name}-logrotate
Source2:	%{name}.sysconfig
Patch0:		%{name}-paths.patch
URL:		http://otrs.org/
BuildRequires:	rpm-perlprov
BuildRequires:	rpmbuild(macros) >= 1.268
Requires(pre):	/bin/id
Requires(pre):	/usr/sbin/useradd
Requires(pre):	/usr/sbin/usermod
Requires:	apache(mod_perl)
Requires:	perl-Crypt-PasswdMD5
Requires:	perl-DBD-mysql
Requires:	perl-DBI
Requires:	perl-Text-CSV
Requires:	procmail
Requires:	smtpdaemon
Requires:	webapps
Requires:	webserver = apache
Suggests:	perl-PDF-API2
Conflicts:	logrotate < 3.7-4
BuildArch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

# This auto don't work , i'm lame
%define		_noautoreq	perl(Kernel::.*)
%define		_noautoprov	perl(Kernel::.*)

%define		otrsdir		%{_datadir}/otrs
%define		otrsuser	otrs
%define		_webapps	/etc/webapps
%define		_webapp		%{name}

%description
OTRS is an Open source Ticket Request System with many features to
manage customer telephone calls and e-mails. It is distributed under
the GNU General Public License (GPL) and tested on Linux, Solaris,
AIX, FreeBSD and MacOS X. Do you receive many e-mails and want to
answer them with a team of agents? You're going to love the OTRS!

Feature list:
- web-interface: easy and logical to use, with agent, admin and
  customer views, themes support, multi language support, customizable
  templates, attachments support
- email-interface with MIME attachments support, dispatching mail via
  address or x-header, autoresponders for customers, notifications to
  the agent
- tickets with customizable views, locking, replying, autoresponders,
  history, ability to add notes, email bouncing/forwarding, priorities,
  time accounting, content full-text search
- system with creation and configuration of user accounts, groups,
  standard responses, signatures, notifications for administrators and
  problem reporters, deadlines for trouble tickets, settable ticket
  number format, different levels of permissions/access-rights, central
  database (MySQL, PostgreSQL, ...), user authentication against
  database or LDAP directory, easy addons and frontends development.

%description -l pl.UTF-8
OTRS (Open source Ticket Request System) to wolnodostępny system
zgłaszania żądań z wieloma możliwościami zarządzania telefonami i
e-mailami od klientów. Jest rozpowszechniany na Powszechnej Licencji
Publicznej GNU (GPL) i testowany na Linuksie, Solarisie, AIX-ie,
FreeBSD i MacOS X. Jeśli otrzymujemy wiele e-maili i chcemy odpowiadać
na nie poprzez zespół agentów, to OTRS może się okazać bardzo dobrym
narzędziem.

Lista możliwości:
- interfejs WWW: łatwy i logiczny w użyciu, z widokami dla agentów,
  administratorów i klientów, obsługą motywów, obsługą wielu języków,
  modyfikowalnymi szablonami, obsługą załączników
- interfejs e-mailowy z obsługą załączników MIME, obsługą poczty w
  zależności od adresu lub x-nagłówków, autoresponderami dla klientów,
  powiadomieniami dla agentów
- bilety z konfigurowalnymi widokami, blokowaniem, odpowiadaniem,
  autoresponderami, historią, możliwością dodawania notatek,
  odbijaniem/przekierowywaniem poczty, priorytetami, rozliczaniem czasu,
  pełnotekstowym przeszukiwaniem zawartości
- system z tworzeniem i konfiguracją kont użytkowników, grup,
  standardowych odpowiedzi, sygnaturek, powiadomieniami dla
  administratorów i zgłaszających problemy, ostatecznymi terminami dla
  problematycznych biletów, ustawialnym formatem numerowania biletów,
  różnymi poziomami uprawnień/praw dostępu, centralną bazą danych
  (MySQL, PostgreSQL...), uwierzytelnianiem użytkowników przy użyciu
  bazy danych lub katalogu LDAP, łatwym tworzeniem dodatków i
  frontendów.

%package scripts
Summary:	OTRS scripts
Summary(pl.UTF-8):	Skrypty dla OTRS
Group:		Applications/Databases
Requires:	%{name} = %{epoch}:%{version}-%{release}

%description scripts
Various scripts for OTRS.

%description scripts -l pl.UTF-8
Różne skrypty dla OTRS.

%prep
%setup -q
%patch0 -p1

# copy config file
cp Kernel/Config/GenericAgent.pm.dist Kernel/Config/GenericAgent.pm
cd Kernel/Config/ && for foo in *.dist; do cp $foo `basename $foo .dist`; done && cd ../../
# copy all crontab dist files
for foo in var/cron/*.dist; do mv $foo var/cron/`basename $foo .dist`; done

# Remove regular CPAN libs - only HTML/Safe.pm has to stay, I can't find it...
rm -Rf Kernel/cpan-lib/{Authen,Date,Email,IO,MIME,Mail,XML,auto}
# Remove junk:
rm -Rf doc/manual/*/sgml/
rm -Rf doc/manual/de/

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/etc/{logrotate.d,rc.d/init.d,sysconfig,%{name}/Config,logrotate.d} \
	$RPM_BUILD_ROOT{/var/log/{,archive/}%{name},%{_bindir},%{otrsdir}} \
	$RPM_BUILD_ROOT/var/lib/%{name}/{article,pics/stats} \
	$RPM_BUILD_ROOT%{_webapps}/%{_webapp}

# copy files
cp -R . $RPM_BUILD_ROOT%{otrsdir}

# install init-Script & apache2 config
install scripts/redhat-rcotrs $RPM_BUILD_ROOT/etc/rc.d/init.d/otrs
install %{SOURCE2} $RPM_BUILD_ROOT/etc/sysconfig/otrs

install scripts/apache2-httpd.include.conf $RPM_BUILD_ROOT%{_webapps}/%{_webapp}/httpd.conf

install %{SOURCE1} $RPM_BUILD_ROOT/etc/logrotate.d/%{name}

# logs in proper place:
touch $RPM_BUILD_ROOT/var/log/%{name}/TicketCounter.log
touch $RPM_BUILD_ROOT/var/log/%{name}/otrs.log

# move configs into proper place...
mv -f $RPM_BUILD_ROOT%{otrsdir}/.procmailrc.dist $RPM_BUILD_ROOT/etc/%{name}/procmailrc
mv -f $RPM_BUILD_ROOT%{otrsdir}/.fetchmailrc.dist $RPM_BUILD_ROOT/etc/%{name}/fetchmailrc
mv -f $RPM_BUILD_ROOT%{otrsdir}/.mailfilter.dist $RPM_BUILD_ROOT/etc/%{name}/mailfilter
mv -f $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config.pm.dist $RPM_BUILD_ROOT/etc/%{name}/Config.pm
mv -f $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config/GenericAgent.pm $RPM_BUILD_ROOT/etc/%{name}
# save dist versions
# TODO: drop .dist and rely on rpm %config(noreplace) feature
install $RPM_BUILD_ROOT/etc/%{name}/procmailrc $RPM_BUILD_ROOT/etc/%{name}/procmailrc.dist
install $RPM_BUILD_ROOT/etc/%{name}/fetchmailrc $RPM_BUILD_ROOT/etc/%{name}/fetchmailrc.dist
install $RPM_BUILD_ROOT/etc/%{name}/mailfilter $RPM_BUILD_ROOT/etc/%{name}/mailfilter.dist
install $RPM_BUILD_ROOT/etc/%{name}/Config.pm $RPM_BUILD_ROOT/etc/%{name}/Config.pm.dist
install $RPM_BUILD_ROOT/etc/%{name}/GenericAgent.pm $RPM_BUILD_ROOT/etc/%{name}/GenericAgent.pm.dist
# File for on-line configuration:
touch $RPM_BUILD_ROOT/etc/%{name}/ZZZAAuto.pm
ln -sf ../../../../../../etc/otrs/ZZZAAuto.pm $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config/Files/ZZZAAuto.pm
# link to proper places
ln -sf ../../../etc/otrs/procmailrc $RPM_BUILD_ROOT%{otrsdir}/.procmailrc
ln -sf ../../../etc/otrs/fetchmailrc $RPM_BUILD_ROOT%{otrsdir}/.fetchmailrc
ln -sf ../../../etc/otrs/mailfilter $RPM_BUILD_ROOT%{otrsdir}/.mailfilter
ln -sf ../../../../etc/otrs/Config.pm $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config.pm
ln -sf ../../../../../etc/otrs/GenericAgent.pm $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config/GenericAgent.pm

# Cleanup junk:
rm -f $RPM_BUILD_ROOT%{otrsdir}/scripts/apache* $RPM_BUILD_ROOT%{otrsdir}/scripts/redhat* $RPM_BUILD_ROOT%{otrsdir}/scripts/suse*
rm -rf $RPM_BUILD_ROOT%{otrsdir}/scripts/auto* $RPM_BUILD_ROOT%{otrsdir}/scripts/test
rm -rf $RPM_BUILD_ROOT%{otrsdir}/doc

# Needed for apache2:
install scripts/apache2-perl-startup.pl	$RPM_BUILD_ROOT%{otrsdir}/scripts/apache2-perl-startup

%clean
rm -rf $RPM_BUILD_ROOT

%pre
%useradd -u 31 -d %{otrsdir} -s /bin/false -g http -c 'OTRS System user' %{otrsuser}

# TODO move to trigger?
# update home dir
/usr/sbin/usermod -d %{otrsdir} %{otrsuser}

%post
if [ "$1" = 0 ]; then
	# note
%banner -e %{name} <<EOF
[install the OTRS database]
 Use a webbrowser and open this link: http://`hostname -f`/otrs/installer.pl
EOF
fi

%triggerin -- apache < 2.2.0, apache-base
%webapp_register httpd %{_webapp}

%triggerun -- apache < 2.2.0, apache-base
%webapp_unregister httpd %{_webapp}

%triggerpostun -- %{name} < 1:2.0.4-0.5
# nuke very-old config location (this mostly for Ra)
if [ -f /etc/httpd/httpd.conf ]; then
	sed -i -e "/^Include.*%{name}.conf/d" /etc/httpd/httpd.conf
fi

# apache2 config
if [ -f /etc/httpd/httpd.conf/88_otrs.conf.rpmsave ]; then
	cp -f %{_webapps}/%{_webapp}/httpd.conf{,.rpmnew}
	mv -f /etc/httpd/httpd.conf/88_otrs.conf.rpmsave %{_webapps}/%{_webapp}/httpd.conf
fi

/usr/sbin/webapp register httpd %{_webapp}
%service -q httpd reload

%files
%defattr(644,root,root,755)
%doc ARCHIVE CHANGES  COPYING  COPYING-Third-Party CREDITS doc/ README README.database README.webserver RELEASE UPGRADING
%doc scripts/test Kernel/Config/GenericAgent.pm.examples
%config(noreplace) %verify(not md5 mtime size) /etc/sysconfig/otrs
%attr(751,otrs,http) %dir %{_sysconfdir}/%{name}
%attr(751,otrs,http) %dir %{_sysconfdir}/%{name}/Config/
%attr(644,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{_sysconfdir}/%{name}/procmailrc
%attr(710,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{_sysconfdir}/%{name}/fetchmailrc
%attr(600,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{_sysconfdir}/%{name}/mailfilter
%attr(660,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{_sysconfdir}/%{name}/Config.pm
%attr(640,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{_sysconfdir}/%{name}/GenericAgent.pm
%attr(660,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{_sysconfdir}/%{name}/ZZZAAuto.pm
%attr(640,otrs,http) %{_sysconfdir}/%{name}/*.dist
%attr(644,otrs,http) %config(noreplace) %verify(not md5 mtime size) %{otrsdir}/var/cron/*
%attr(754,root,root) /etc/rc.d/init.d/%{name}
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/logrotate.d/%{name}
%attr(755,otrs,http) %dir %{otrsdir}
%{otrsdir}/RELEASE
%{otrsdir}/.procmailrc
%{otrsdir}/.fetchmailrc
%{otrsdir}/.mailfilter
%dir %{otrsdir}/Kernel
%{otrsdir}/Kernel/Config.pm
%dir %{otrsdir}/Kernel/Config
%{otrsdir}/Kernel/Config/Defaults.pm
%{otrsdir}/Kernel/Config/GenericAgent.pm
%dir %{otrsdir}/Kernel/Config/Files
%{otrsdir}/Kernel/Config/Files/*.pm
%{otrsdir}/Kernel/Config/Files/*.xml
%dir %{otrsdir}/Kernel/GenericInterface
%{otrsdir}/Kernel/GenericInterface/*.pm
%dir %{otrsdir}/Kernel/GenericInterface/Event
%dir %{otrsdir}/Kernel/GenericInterface/Invoker
%dir %{otrsdir}/Kernel/GenericInterface/Invoker/Test
%dir %{otrsdir}/Kernel/GenericInterface/Mapping
%dir %{otrsdir}/Kernel/GenericInterface/Operation
%dir %{otrsdir}/Kernel/GenericInterface/Operation/Session
%dir %{otrsdir}/Kernel/GenericInterface/Operation/Test
%dir %{otrsdir}/Kernel/GenericInterface/Operation/Ticket
%dir %{otrsdir}/Kernel/GenericInterface/Transport
%dir %{otrsdir}/Kernel/GenericInterface/Transport/HTTP
%{otrsdir}/Kernel/Language.pm
%{otrsdir}/Kernel/*/*/*.pm
%{otrsdir}/Kernel/*/*/*/*.pm
%dir %{otrsdir}/Kernel/Language
%{otrsdir}/Kernel/Language/*.pm
%{otrsdir}/Kernel/Modules
%dir %{otrsdir}/Kernel/Output
%dir %{otrsdir}/Kernel/Output/HTML
%dir %{otrsdir}/Kernel/Output/HTML/Standard
%attr(644,otrs,http) %config(noreplace) %{otrsdir}/Kernel/Output/HTML/Standard/*.dtl
%dir %{otrsdir}/Kernel/Scheduler
%{otrsdir}/Kernel/Scheduler/*.pm
%dir %{otrsdir}/Kernel/Scheduler/TaskHandler
%{otrsdir}/Kernel/Scheduler/TaskHandler/*.pm
%dir %{otrsdir}/Kernel/System
%{otrsdir}/Kernel/System/*.pm
%dir %{otrsdir}/Kernel/System/Auth
%dir %{otrsdir}/Kernel/System/Auth/Sync
%dir %{otrsdir}/Kernel/System/AuthSession
%dir %{otrsdir}/Kernel/System/Cache
%dir %{otrsdir}/Kernel/System/Crypt
%dir %{otrsdir}/Kernel/System/CustomerAuth
%dir %{otrsdir}/Kernel/System/CustomerUser
%dir %{otrsdir}/Kernel/System/CustomerUser/Preferences
%dir %{otrsdir}/Kernel/System/DB
%dir %{otrsdir}/Kernel/System/DynamicField
%dir %{otrsdir}/Kernel/System/DynamicField/Backend
%dir %{otrsdir}/Kernel/System/DynamicField/ObjectType
%dir %{otrsdir}/Kernel/System/Email
%dir %{otrsdir}/Kernel/System/GenericAgent
%dir %{otrsdir}/Kernel/System/GenericInterface
%dir %{otrsdir}/Kernel/System/LinkObject
%dir %{otrsdir}/Kernel/System/Log
%dir %{otrsdir}/Kernel/System/MailAccount
%dir %{otrsdir}/Kernel/System/PostMaster
%dir %{otrsdir}/Kernel/System/PostMaster/LoopProtection
%dir %{otrsdir}/Kernel/System/PostMaster/Filter
%dir %{otrsdir}/Kernel/System/Queue
%dir %{otrsdir}/Kernel/System/Scheduler
%dir %{otrsdir}/Kernel/System/SLA
%dir %{otrsdir}/Kernel/System/Service
%dir %{otrsdir}/Kernel/System/Stats
%dir %{otrsdir}/Kernel/System/Stats/Static
%dir %{otrsdir}/Kernel/System/Stats/Dynamic
%dir %{otrsdir}/Kernel/System/SysConfig
%dir %{otrsdir}/Kernel/System/Ticket
%dir %{otrsdir}/Kernel/System/Ticket/Acl
%dir %{otrsdir}/Kernel/System/Ticket/ArticleSearchIndex
%dir %{otrsdir}/Kernel/System/Ticket/CustomerPermission
%dir %{otrsdir}/Kernel/System/Ticket/Event
%dir %{otrsdir}/Kernel/System/Ticket/Permission
%dir %{otrsdir}/Kernel/System/Ticket/IndexAccelerator
%dir %{otrsdir}/Kernel/System/Ticket/Number
%dir %{otrsdir}/Kernel/System/UnitTest
%dir %{otrsdir}/Kernel/System/User
%dir %{otrsdir}/Kernel/System/User/Preferences
%dir %{otrsdir}/Kernel/System/Web
%dir %{otrsdir}/Kernel/System/Web/UploadCache
%dir %{otrsdir}/Kernel/System/VirtualFS
%dir %{otrsdir}/Kernel/cpan-lib
%{otrsdir}/Kernel/cpan-lib/*.pm
%dir %{otrsdir}/Kernel/cpan-lib/Algorithm
%dir %{otrsdir}/Kernel/cpan-lib/Apache
%dir %{otrsdir}/Kernel/cpan-lib/Apache2
%dir %{otrsdir}/Kernel/cpan-lib/CGI
%dir %{otrsdir}/Kernel/cpan-lib/Class
%dir %{otrsdir}/Kernel/cpan-lib/Class/Inspector
%dir %{otrsdir}/Kernel/cpan-lib/Crypt
%dir %{otrsdir}/Kernel/cpan-lib/CSS
%dir %{otrsdir}/Kernel/cpan-lib/Digest
%dir %{otrsdir}/Kernel/cpan-lib/Digest/SHA
%dir %{otrsdir}/Kernel/cpan-lib/Encode
%dir %{otrsdir}/Kernel/cpan-lib/File
%dir %{otrsdir}/Kernel/cpan-lib/HTTP
%dir %{otrsdir}/Kernel/cpan-lib/HTTP/Headers
%dir %{otrsdir}/Kernel/cpan-lib/HTTP/Request
%dir %{otrsdir}/Kernel/cpan-lib/JSON
%dir %{otrsdir}/Kernel/cpan-lib/JSON/PP
%dir %{otrsdir}/Kernel/cpan-lib/JSON/backportPP
%dir %{otrsdir}/Kernel/cpan-lib/JavaScript
%dir %{otrsdir}/Kernel/cpan-lib/LWP
%dir %{otrsdir}/Kernel/cpan-lib/LWP/Authen
%dir %{otrsdir}/Kernel/cpan-lib/LWP/Protocol
%dir %{otrsdir}/Kernel/cpan-lib/Locale
%dir %{otrsdir}/Kernel/cpan-lib/Locale/Codes
%dir %{otrsdir}/Kernel/cpan-lib/Mozilla
%dir %{otrsdir}/Kernel/cpan-lib/Mozilla/CA
%{otrsdir}/Kernel/cpan-lib/Mozilla/CA/cacert.pem
%dir %{otrsdir}/Kernel/cpan-lib/Net
%dir %{otrsdir}/Kernel/cpan-lib/Net/IMAP
%dir %{otrsdir}/Kernel/cpan-lib/Net/IMAP/Simple
%{otrsdir}/Kernel/cpan-lib/Net/IMAP/Simple/*.pm
%dir %{otrsdir}/Kernel/cpan-lib/Net/POP3
%dir %{otrsdir}/Kernel/cpan-lib/Net/SMTP
%dir %{otrsdir}/Kernel/cpan-lib/Net/SMTP/TLS
%{otrsdir}/Kernel/cpan-lib/Net/SMTP/TLS/*.pm
%dir %{otrsdir}/Kernel/cpan-lib/Proc
%dir %{otrsdir}/Kernel/cpan-lib/SOAP
%dir %{otrsdir}/Kernel/cpan-lib/SOAP/Lite
%dir %{otrsdir}/Kernel/cpan-lib/SOAP/Lite/Deserializer
%{otrsdir}/Kernel/cpan-lib/SOAP/Lite/Deserializer/*.pm
%dir %{otrsdir}/Kernel/cpan-lib/SOAP/Transport
%dir %{otrsdir}/Kernel/cpan-lib/Text
%dir %{otrsdir}/Kernel/cpan-lib/Text/Diff
%dir %{otrsdir}/Kernel/cpan-lib/URI
%dir %{otrsdir}/Kernel/cpan-lib/URI/file
%dir %{otrsdir}/Kernel/cpan-lib/URI/urn
%dir %{otrsdir}/Kernel/cpan-lib/YAML
%dir %{otrsdir}/Kernel/cpan-lib/YAML/Dumper
%dir %{otrsdir}/Kernel/cpan-lib/YAML/Loader
%dir %{otrsdir}/bin
%attr(700,otrs,root) %{otrsdir}/bin/*.pl
%attr(700,otrs,root) %{otrsdir}/bin/*.sh
%attr(700,otrs,root) %{otrsdir}/bin/otrs.*
%dir %{otrsdir}/bin/cgi-bin/
%attr(750,root,http) %{otrsdir}/bin/cgi-bin/*.pl
%dir %{otrsdir}/bin/fcgi-bin/
%attr(750,root,http) %{otrsdir}/bin/fcgi-bin/*.pl
%{otrsdir}/INSTALL
%dir %{otrsdir}/scripts
%dir %{otrsdir}/scripts/database
%{otrsdir}/scripts/*.sql
%{otrsdir}/scripts/apache2-perl-startup
%{otrsdir}/scripts/database/*
%attr(751,otrs,http) %dir /var/log/%{name}
%attr(751,otrs,http) %dir /var/log/archive/%{name}
%attr(664,otrs,http) %config(noreplace) %verify(not md5 mtime size) /var/log/otrs/otrs.log
%attr(664,otrs,http) %config(noreplace) %verify(not md5 mtime size) /var/log/otrs/TicketCounter.log
# This entries should be changed into links and proper trigger to move data:
%attr(751,otrs,http) %dir %{otrsdir}/var/
%{otrsdir}/var/*.png
%attr(755,otrs,http) %dir %{otrsdir}/var/cron
%attr(2775,otrs,http) %{otrsdir}/var/article
%attr(755,otrs,http) %{otrsdir}/var/fonts
%attr(755,otrs,http) %{otrsdir}/var/httpd
%attr(755,otrs,http) %{otrsdir}/var/sessions
%attr(755,otrs,http) %{otrsdir}/var/spool
%attr(755,otrs,http) %{otrsdir}/var/stats
%attr(2775,otrs,http) %{otrsdir}/var/tmp
# attempt to move to /var/lib:
%attr(751,otrs,http) %dir /var/lib/%{name}
%attr(2775,otrs,http) %dir /var/lib/%{name}/article
%attr(751,otrs,http) %dir /var/lib/%{name}/pics
%attr(751,otrs,http) %dir /var/lib/%{name}/pics/stats

%dir %attr(750,root,http) %{_webapps}/%{_webapp}
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) %{_webapps}/%{_webapp}/httpd.conf

%files scripts
%defattr(644,root,root,755)
%attr(700,otrs,http) %{otrsdir}/scripts/*.pl
%attr(700,otrs,http) %{otrsdir}/scripts/tools/*.pl
%{otrsdir}/scripts/*.pm
%dir %{otrsdir}/scripts/tools
