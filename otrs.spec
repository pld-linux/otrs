# TODO:
# - move it to /usr/share
%bcond_with	apache1		# build for work with apache1 conf system
%include	/usr/lib/rpm/macros.perl
Summary:	The Open Ticket Request System
Summary(pl):	Open Ticket Request System - otwarty system zg�aszania ��da�
Name:		otrs
Version:	1.2.2
%define	vrel	01
Release:	0.3
Epoch:		1
License:	GPL
Group:		Applications/Mail
Source0:	http://ftp.gwdg.de/pub/misc/otrs/%{name}-%{version}-%{vrel}.tar.bz2
# Source0-md5:	ef154439ec31224f1c60b0777d95dddc
Source1:	%{name}-http.conf
Source2:	%{name}-http1.conf
Patch0:		%{name}-conf.patch
BuildRequires:	rpm-perlprov
PreReq:		apache
Requires(post):	/bin/id
Requires(post):	/usr/sbin/useradd
Requires(post):	/usr/sbin/usermod
Requires:	apache-mod_perl
Requires:	fetchmail
#Requires:	mysql
#Requires:	mysql-client
#Requires:	perl-DBI
#Requires:	perl-DBD-mysql
#Requires:	perl-Digest-MD5
#Requires:	perl-Email-Valid
#Requires:	perl-MIME-Base64
#Requires:	perl-MIME-tools
#Requires:	perl-URI
Requires:	procmail
Requires:	smtpdaemon
Buildarch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		otrsdir		/home/services/otrs
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
  history, ability to add notes, email bouncing/forwarding,
  priorities, time accounting, content full-text search
- system with creation and configuration of user accounts, groups,
  standard responses, signatures, notifications for administrators and
  problem reporters, deadlines for trouble tickets, settable ticket
  number format, different levels of permissions/access-rights,
  central database (MySQL, PostgreSQL, ...), user authentication
  against database or LDAP directory, easy addons and frontends
  development.

%description -l pl
OTRS (Open source Ticket Request System) to wolnodost�pny system
zg�aszania ��da� z wieloma mo�liwo�ciami zarz�dzania telefonami i
e-mailami od klient�w. Jest rozpowszechniany na Powszechnej Licencji
Publicznej GNU (GPL) i testowany na Linuksie, Solarisie, AIX-ie,
FreeBSD i MacOS X. Je�li otrzymujemy wiele e-maili i chcemy odpowiada�
na nie poprzez zesp� agent�w, to OTRS mo�e si� okaza� bardzo dobrym
narz�dziem.

Lista mo�liwo�ci:
- interfejs WWW: �atwy i logiczny w u�yciu, z widokami dla agent�w,
  administrator�w i klient�w, obs�ug� motyw�w, obs�ug� wielu j�zyk�w,
  modyfikowalnymi szablonami, obs�ug� za��cznik�w
- interfejs e-mailowy z obs�ug� za��cznik�w MIME, obs�ug� poczty w
  zale�no�ci od adresu lub x-nag��wk�w, autoresponderami dla klient�w,
  powiadomieniami dla agent�w
- bilety z konfigurowalnymi widokami, blokowaniem, odpowiadaniem,
  autoresponderami, histori�, mo�liwo�ci� dodawania notatek,
  odbijaniem/przekierowywaniem poczty, priorytetami, rozliczaniem
  czasu, pe�notekstowym przeszukiwaniem zawarto�ci
- system z tworzeniem i konfiguracj� kont u�ytkownik�w, grup,
  standardowych odpowiedzi, sygnaturek, powiadomieniami dla
  administrator�w i zg�aszaj�cych problemy, ostatecznymi terminami dla
  problematycznych bilet�w, ustawialnym formatem numerowania bilet�w,
  r�nymi poziomami uprawnie�/praw dost�pu, centraln� baz� danych
  (MySQL, PostgreSQL...), uwierzytelnianiem u�ytkownik�w przy u�yciu
  bazy danych lub katalogu LDAP, �atwym tworzeniem dodatk�w i
  frontend�w.

%prep
%setup -q -n %{name}
%patch0 -p1

%build
# copy config file
cp Kernel/Config.pm.dist Kernel/Config.pm
cp Kernel/Config/GenericAgent.pm.dist Kernel/Config/GenericAgent.pm
cd Kernel/Config/ && for foo in *.dist; do cp $foo `basename $foo .dist`; done && cd ../../
# copy all crontab dist files
for foo in var/cron/*.dist; do mv $foo var/cron/`basename $foo .dist`; done

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{%{otrsdir},/etc/{rc.d/init.d,sysconfig,httpd/httpd.conf}}

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
	install %{SOURCE1} $RPM_BUILD_ROOT/etc/httpd/httpd.conf/88_%{name}.conf
%endif
%if %{with apache1}
	#apache 1
	install %{SOURCE2} $RPM_BUILD_ROOT/etc/httpd/%{name}.conf
%endif

touch $RPM_BUILD_ROOT%{otrsdir}/var/log/TicketCounter.log

%clean
rm -rf $RPM_BUILD_ROOT

%pre
if [ -n "`/bin/id -u %{otrsuser} 2>/dev/null`" ]; then
	if [ "`/bin/id -u %{otrsuser}`" != "31" ]; then
		echo "Error: user %{otrsuser} doesn't have uid=31. Correct this before installing otrs." >&2
		exit 1
	fi
	# update home dir
	/usr/sbin/usermod -d %{otrsdir} %{otrsuser}
else
	/usr/sbin/useradd -u 31 -d %{otrsdir} -s /bin/false -G http -c 'OTRS System user' %{otrsuser}
fi

# set permission
# /home/services/otrs/bin/SetPermissions.sh /home/services/otrs %{otrsuser} http http http

%post
# if apache1
if [ -f /etc/httpd/httpd.conf ] && ! grep -q "^Include.*%{name}.conf" /etc/httpd/httpd.conf; then
        echo "Include /etc/httpd/%{name}.conf" >> /etc/httpd/httpd.conf
fi
# note
echo ""
echo "Next steps: "
echo ""
echo "[otrs sysconfig]"
echo "edit /etc/sysconfig/otrs"
echo ""
echo "[httpd services]"
echo " Restart httpd '/etc/rc.d/init.d/httpd restart'"
echo ""
echo "[mysqld service]"
echo " Start mysqld '/etc/rc.d/init.d/mysql start'"
echo ""
echo "[install the OTRS database]"
echo " Use a webbrowser and open this link:"
echo " http://`hostname -f`/otrs/installer.pl"
echo ""
echo "[OTRS services]"
echo " Start OTRS '/etc/rc.d/init.d/otrs start' ({start|stop|status|restart})."
echo ""
echo "Have fun!"
echo ""
echo " Your OTRS Team"
echo ""

%files
%defattr(644,root,root,755)
%doc INSTALL* UPGRADING TODO CHANGES README* doc/

%attr(755,otrs,http) %dir %{otrsdir}
%{otrsdir}/RELEASE
%dir %{otrsdir}/Kernel
%config(noreplace) %{otrsdir}/Kernel/Config.pm
%dir %{otrsdir}/Kernel/Config
%config(noreplace) %{otrsdir}/Kernel/Config/GenericAgent.pm
%config(noreplace) %{otrsdir}/Kernel/Config/ModulesCusto*.pm
%{otrsdir}/Kernel/Config/Defaults.pm
%{otrsdir}/Kernel/Config/Modules.pm
%{otrsdir}/Kernel/Language.pm
%attr(644,otrs,http) %{otrsdir}/Kernel/*/*/*.pm
%attr(644,otrs,http) %{otrsdir}/Kernel/*/*/*/*.pm
%dir %{otrsdir}/Kernel/Language
%config(noreplace) %{otrsdir}/Kernel/Language/*.pm
%{otrsdir}/Kernel/Modules
%dir %{otrsdir}/Kernel/Output
%dir %{otrsdir}/Kernel/Output/HTML
%dir %{otrsdir}/Kernel/Output/HTML/Standard
%attr(644,otrs,http) %config(noreplace) %{otrsdir}/Kernel/Output/HTML/Standard/*.dtl
%dir %{otrsdir}/Kernel/Output/HTML/Lite
%attr(644,otrs,http) %config(noreplace) %{otrsdir}/Kernel/Output/HTML/Lite/*.dtl
%attr(755,root,root) %dir %{otrsdir}/Kernel/System
%attr(644,otrs,http) %{otrsdir}/Kernel/System/*.pm
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Auth
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/AuthSession
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/CustomerAuth
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Log
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/CustomerUser
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/CustomerUser/Preferences
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/User
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/User/Preferences
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Email
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/PostMaster
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/PostMaster/LoopProtection
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Ticket
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Ticket/CustomerPermission
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Ticket/Permission
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Ticket/IndexAccelerator
%attr(755,otrs,http) %dir %{otrsdir}/Kernel/System/Ticket/Number
%attr(644,otrs,http) %config(noreplace) %{otrsdir}/.procmailrc
%attr(710,otrs,http) %config(noreplace) %{otrsdir}/.fetchmailrc
%attr(600,otrs,http) %config(noreplace) %{otrsdir}/.mailfilter
%attr(755,root,root) %dir %{otrsdir}/bin
%attr(700,otrs,root) %{otrsdir}/bin/*.pl
%attr(700,otrs,root) %{otrsdir}/bin/*.sh
%attr(700,otrs,root) %{otrsdir}/bin/otrs.*
%attr(755,root,root) %dir %{otrsdir}/bin/cgi-bin/
%attr(750,otrs,http) %{otrsdir}/bin/cgi-bin/*.pl
%attr(644,otrs,http) %{otrsdir}/INSTALL
%attr(755,otrs,http) %dir %{otrsdir}/scripts
%attr(640,otrs,http) %{otrsdir}/scripts/*.sql
%attr(700,otrs,http) %{otrsdir}/scripts/*.pl
%attr(644,otrs,http) %{otrsdir}/scripts/*.pm
%attr(755,otrs,http) %dir %{otrsdir}/scripts/auto_build
%attr(644,otrs,http) %{otrsdir}/scripts/auto_build/*.txt
%attr(755,otrs,http) %dir %{otrsdir}/scripts/database
%attr(640,otrs,http) %{otrsdir}/scripts/database/*
%attr(755,otrs,http) %dir %{otrsdir}/scripts/test
%attr(700,otrs,http) %{otrsdir}/scripts/test/*.pl
%attr(755,otrs,http) %dir %{otrsdir}/scripts/tools
%attr(700,otrs,http) %{otrsdir}/scripts/tools/*.pl
%attr(755,otrs,http) %dir %{otrsdir}/var/cron
%attr(2775,otrs,http) %{otrsdir}/var/article
%attr(775,otrs,http) %dir %{otrsdir}/var/
%attr(644,otrs,http) %config(noreplace) %{otrsdir}/var/cron/*
%attr(755,otrs,http) %{otrsdir}/var/httpd
%attr(2775,otrs,http) %dir %{otrsdir}/var/log
%attr(664,otrs,http) %config(noreplace) %{otrsdir}/var/log/TicketCounter.log
%attr(755,otrs,http) %{otrsdir}/var/sessions
%attr(755,otrs,http) %{otrsdir}/var/spool
%attr(2775,otrs,http) %{otrsdir}/var/tmp
%attr(755,otrs,http) %dir %{otrsdir}/var/pics
%attr(755,otrs,http) %{otrsdir}/var/pics/stats

%attr(754,root,root) /etc/rc.d/init.d/otrs
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/otrs
%if %{without apache1}
	#apache2
	/etc/httpd/httpd.conf/88_%{name}.conf
%endif 
%if %{with apache1}
	#apache1
	/etc/httpd/%{name}.conf
%endif
