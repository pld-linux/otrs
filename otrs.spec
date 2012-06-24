# TODO:
# - separate 3 subpackages: common files, administration and client frontend
# - all otrs-var into /var/lib/otrs
# - put cron in proper place
# - write not so brain-damage init-script...
# - apache1 bcond is wrong. ie needs update
%bcond_with	apache1		# build for work with apache1 conf system
%include	/usr/lib/rpm/macros.perl
Summary:	The Open Ticket Request System
Summary(pl.UTF-8):   Open Ticket Request System - otwarty system zgłaszania żądań
Name:		otrs
Version:	1.3.2
%define	vrel	01
Release:	0.9
Epoch:		1
License:	GPL
Group:		Applications/Databases
Source0:	http://ftp.gwdg.de/pub/misc/otrs/%{name}-%{version}-%{vrel}.tar.bz2
# Source0-md5:	c632dca827a3c5386c92a4a7d4e18d69
Source1:	%{name}-http.conf
Source2:	%{name}-http1.conf
Source3:	%{name}-PLD-Config.pm
Source4:	%{name}-logrotate
Patch0:		%{name}-conf.patch
Patch1:		%{name}-default_conf.patch
Patch2:		%{name}-apache.patch
URL:		http://otrs.org/
BuildRequires:	rpm-perlprov
BuildRequires:	rpmbuild(macros) >= 1.202
PreReq:		apache
Requires(pre):	/bin/id
Requires(pre):	/usr/sbin/useradd
Requires(pre):	/usr/sbin/usermod
%if %{without apache1}
Requires:	apache >= 2
%endif
%if %{with apache1}
Requires:	apache < 2
%endif
Requires:	apache-mod_perl
Requires:	mysql
#Requires:	mysql-client
#Requires:	perl-DBI
# Not catched:
Requires:	perl-DBD-mysql
#Requires:	perl-Digest-MD5
#Requires:	perl-Email-Valid
#Requires:	perl-MIME-Base64
#Requires:	perl-MIME-tools
#Requires:	perl-URI
Requires:	procmail
Requires:	smtpdaemon
Buildarch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

# This auto don't work , i'm lame
%define		_noautoreq	'perl(Kernel::.*)'
%define		_noautoprov	'perl(Kernel::.*)'
%define		otrsdir		%{_datadir}/otrs
%define		otrsuser	otrs

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
Summary(pl.UTF-8):   Skrypty dla OTRS
Group:		Applications/Databases
Requires:	%{name}-%{version}-%{release}

%description scripts
Various scripts for OTRS.

%description scripts -l pl.UTF-8
Różne skrypty dla OTRS.

%prep
%setup -q -n %{name}
%patch0 -p1
%patch1 -p1
%patch2 -p1

%build
# copy config file
cp %{SOURCE3} Kernel/Config.pm
cp Kernel/Config/GenericAgent.pm.dist Kernel/Config/GenericAgent.pm
cd Kernel/Config/ && for foo in *.dist; do cp $foo `basename $foo .dist`; done && cd ../../
# copy all crontab dist files
for foo in var/cron/*.dist; do mv $foo var/cron/`basename $foo .dist`; done

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/etc/{logrotate.d,rc.d/init.d,sysconfig,httpd/httpd.conf,%{name}/Config,logrotate.d} \
	$RPM_BUILD_ROOT{/var/log/{,archiv/}%{name},%{_bindir},%{otrsdir}} \
	$RPM_BUILD_ROOT/var/lib/%{name}/{article,pics/stats}

# copy files
rm -Rf Kernel/cpan-lib/
rm -Rf doc/manual/*/sgml/
rm -Rf doc/manual/de/
cp -R . $RPM_BUILD_ROOT%{otrsdir}

# install init-Script & apache2 config
install -m 755 scripts/redhat-rcotrs $RPM_BUILD_ROOT/etc/rc.d/init.d/otrs
install scripts/redhat-rcotrs-config $RPM_BUILD_ROOT/etc/sysconfig/otrs
%if %{without apache1}
	#apache2
install %{SOURCE1} $RPM_BUILD_ROOT%{_sysconfdir}/httpd/httpd.conf/88_%{name}.conf
%endif
%if %{with apache1}
	#apache 1
	install %{SOURCE2} $RPM_BUILD_ROOT/etc/httpd/%{name}.conf
%endif

install %{SOURCE4} $RPM_BUILD_ROOT/etc/logrotate.d/%{name}

# logs in proper place:
touch $RPM_BUILD_ROOT/var/log/%{name}/TicketCounter.log
touch $RPM_BUILD_ROOT/var/log/%{name}/otrs.log

# move configs into proper place...
mv -f $RPM_BUILD_ROOT%{otrsdir}/.procmailrc $RPM_BUILD_ROOT/etc/%{name}/procmailrc
mv -f $RPM_BUILD_ROOT%{otrsdir}/.fetchmailrc $RPM_BUILD_ROOT/etc/%{name}/fetchmailrc
mv -f $RPM_BUILD_ROOT%{otrsdir}/.mailfilter $RPM_BUILD_ROOT/etc/%{name}/mailfilter
mv -f $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config.pm $RPM_BUILD_ROOT/etc/%{name}
mv -f $RPM_BUILD_ROOT%{otrsdir}/Kernel/Config/GenericAgent.pm $RPM_BUILD_ROOT/etc/%{name}
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
%useradd -u 31 -d %{otrsdir} -s /bin/false -G http -c 'OTRS System user' %{otrsuser}

# TODO move to trigger?
# update home dir
/usr/sbin/usermod -d %{otrsdir} %{otrsuser}

%post
# if apache2
if [ -f /etc/httpd/httpd.conf ] && ! grep -q "^Include.*%{name}.conf" /etc/httpd/httpd.conf; then
        echo "Include /etc/httpd/%{name}.conf" >> /etc/httpd/httpd.conf
fi
if [ -f /var/lock/subsys/httpd ]; then
	/etc/rc.d/init.d/httpd restart 1>&2
fi
# note
echo "[install the OTRS database]"
echo " Use a webbrowser and open this link: http://`hostname -f`/otrs/installer.pl"

%triggerpostun -- %{name} < 1.3.0
echo "WARNING: you need to prepare %{name} upgrade! Database format has changed."
echo "To do that make:"
echo "cat %{otrsdir}/scripts/DBUpdate-to-1.3.mysql.sql | mysql -u <otrs_user> -p <otrs_db>" 

%files
%defattr(644,root,root,755)
%doc INSTALL* UPGRADING TODO CHANGES README* doc/
%doc scripts/test Kernel/Config/GenericAgent.pm.examples
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/otrs
%attr(751,otrs,http) %dir %{_sysconfdir}/%{name}
%attr(751,otrs,http) %dir %{_sysconfdir}/%{name}/Config/
%attr(644,otrs,http) %config(noreplace) %verify(not size mtime md5) %{_sysconfdir}/%{name}/procmailrc
%attr(710,otrs,http) %config(noreplace) %verify(not size mtime md5) %{_sysconfdir}/%{name}/fetchmailrc
%attr(600,otrs,http) %config(noreplace) %verify(not size mtime md5) %{_sysconfdir}/%{name}/mailfilter
%attr(640,otrs,http) %config(noreplace) %verify(not size mtime md5) %{_sysconfdir}/%{name}/Config.pm
%attr(640,otrs,http) %config(noreplace) %verify(not size mtime md5) %{_sysconfdir}/%{name}/GenericAgent.pm
%attr(644,otrs,http) %config(noreplace) %verify(not size mtime md5) %{otrsdir}/var/cron/*
%config(noreplace) %verify(not size mtime md5) %{otrsdir}/Kernel/Config/ModulesCusto*.pm
%attr(754,root,root) /etc/rc.d/init.d/%{name}
%attr(640,root,root) %config(noreplace) %verify(not size mtime md5) /etc/logrotate.d/%{name}
%attr(755,otrs,http) %dir %{otrsdir}
%{otrsdir}/RELEASE
%{otrsdir}/.procmailrc
%{otrsdir}/.fetchmailrc
%{otrsdir}/.mailfilter
%dir %{otrsdir}/Kernel
%{otrsdir}/Kernel/Config.pm
%dir %{otrsdir}/Kernel/Config
%{otrsdir}/Kernel/Config/Defaults.pm
%{otrsdir}/Kernel/Config/Modules.pm
%{otrsdir}/Kernel/Config/GenericAgent.pm
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
%dir %{otrsdir}/Kernel/Output/HTML/Lite
%attr(644,otrs,http) %config(noreplace) %{otrsdir}/Kernel/Output/HTML/Lite/*.dtl
%attr(755,root,root) %dir %{otrsdir}/Kernel/System
%{otrsdir}/Kernel/System/*.pm
%dir %{otrsdir}/Kernel/System/Auth
%dir %{otrsdir}/Kernel/System/AuthSession
%dir %{otrsdir}/Kernel/System/Crypt
%dir %{otrsdir}/Kernel/System/CustomerAuth
%dir %{otrsdir}/Kernel/System/CustomerUser
%dir %{otrsdir}/Kernel/System/CustomerUser/Preferences
%dir %{otrsdir}/Kernel/System/Email
%dir %{otrsdir}/Kernel/System/GenericAgent
%dir %{otrsdir}/Kernel/System/Log
%dir %{otrsdir}/Kernel/System/PostMaster
%dir %{otrsdir}/Kernel/System/PostMaster/LoopProtection
%dir %{otrsdir}/Kernel/System/PostMaster/Filter
%dir %{otrsdir}/Kernel/System/Stats
%dir %{otrsdir}/Kernel/System/Ticket
%dir %{otrsdir}/Kernel/System/Ticket/CustomerPermission
%dir %{otrsdir}/Kernel/System/Ticket/Permission
%dir %{otrsdir}/Kernel/System/Ticket/IndexAccelerator
%dir %{otrsdir}/Kernel/System/Ticket/Number
%dir %{otrsdir}/Kernel/System/User
%dir %{otrsdir}/Kernel/System/User/Preferences
%dir %{otrsdir}/bin
%attr(700,otrs,root) %{otrsdir}/bin/*.pl
%attr(700,otrs,root) %{otrsdir}/bin/*.sh
%attr(700,otrs,root) %{otrsdir}/bin/otrs.*
%dir %{otrsdir}/bin/cgi-bin/
%attr(750,root,http) %{otrsdir}/bin/cgi-bin/*.pl
%{otrsdir}/INSTALL
%dir %{otrsdir}/scripts
%dir %{otrsdir}/scripts/database
%{otrsdir}/scripts/*.sql
%{otrsdir}/scripts/apache2-perl-startup
%{otrsdir}/scripts/database/*
%attr(751,otrs,http) %dir /var/log/%{name}
%attr(751,otrs,http) %dir /var/log/archiv/%{name}
%attr(664,otrs,http) %config(noreplace) %verify(not size mtime md5) /var/log/otrs/otrs.log
%attr(664,otrs,http) %config(noreplace) %verify(not size mtime md5) /var/log/otrs/TicketCounter.log
# This entries should be changed into links and proper trigger to move data:
%attr(751,otrs,http) %dir %{otrsdir}/var/
%attr(755,otrs,http) %dir %{otrsdir}/var/cron
%attr(2775,otrs,http) %{otrsdir}/var/article
%attr(755,otrs,http) %{otrsdir}/var/httpd
%attr(755,otrs,http) %{otrsdir}/var/sessions
%attr(755,otrs,http) %{otrsdir}/var/spool
%attr(2775,otrs,http) %{otrsdir}/var/tmp
%attr(755,otrs,http) %dir %{otrsdir}/var/pics
%attr(755,otrs,http) %{otrsdir}/var/pics/stats
# attempt to move to /var/lib:
%attr(751,otrs,http) %dir /var/lib/%{name}
%attr(2775,otrs,http) %dir /var/lib/%{name}/article
%attr(755,otrs,http) %dir /var/lib/%{name}/cron
%attr(751,otrs,http) %dir /var/lib/%{name}/pics
%attr(751,otrs,http) %dir /var/lib/%{name}/pics/stats
%attr(755,otrs,http) %dir /var/lib/%{name}/sessions
%attr(755,otrs,http) %dir /var/lib/%{name}/spool
%attr(2775,otrs,http) %dir /var/lib/%{name}/tmp

%if %{without apache1}
# apache2
%config(noreplace) %{_sysconfdir}/httpd/httpd.conf/88_%{name}.conf
%endif
%if %{with apache1}
# apache1
%config(noreplace) /etc/httpd/%{name}.conf
%endif

%files scripts
%defattr(644,root,root,755)
%attr(700,otrs,http) %{otrsdir}/scripts/*.pl
%attr(700,otrs,http) %{otrsdir}/scripts/tools/*.pl
%attr(700,otrs,http) %{otrsdir}/scripts/*.sh
%{otrsdir}/scripts/*.pm
%{otrsdir}/scripts/*.php
%dir %{otrsdir}/scripts/tools
