# TODO:
# - put files with proper permissions/ownership in package instead of
#   modyfying them in %%post (thus breaking installed package - see `rpm -V`)
%include	/usr/lib/rpm/macros.perl
Summary:	The Open Ticket Request System
Summary(pl):	Open Ticket Request System - otwarty system zg³aszania ¿±dañ
Name:		otrs
Version:	1.0.2
Release:	01
Epoch:		1
License:	GPL
Group:		Applications/Mail
Source0:	http://ftp.gwdg.de/pub/misc/otrs/%{name}-%{version}-%{release}.tar.bz2
PreReq:		apache
Requires(post):	/bin/id
Requires(post):	/usr/sbin/useradd
Requires(post):	/usr/sbin/usermod
BuildRequires:	rpm-perlprov
Requires:	apache-mod_perl
Requires:	fetchmail
Requires:	mysql
Requires:	mysql-client
Requires:	perl-DBI
Requires:	perl-DBD-mysql
Requires:	perl-Digest-MD5
Requires:	perl-MIME-Base64
Requires:	perl-URI
Requires:	procmail
Requires:	smtpdaemon
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
OTRS (Open source Ticket Request System) to wolnodostêpny system
zg³aszania ¿±dañ z wieloma mo¿liwo¶ciami zarz±dzania telefonami i
e-mailami od klientów. Jest rozpowszechniany na Powszechnej Licencji
Publicznej GNU (GPL) i testowany na Linuksie, Solarisie, AIX-ie,
FreeBSD i MacOS X. Je¶li otrzymujemy wiele e-maili i chcemy odpowiadaæ
na nie poprzez zespó³ agentów, to OTRS mo¿e siê okazaæ bardzo dobrym
narzêdziem.

Lista mo¿liwo¶ci:
- interfejs WWW: ³atwy i logiczny w u¿yciu, z widokami dla agentów,
  administratorów i klientów, obs³ug± motywów, obs³ug± wielu jêzyków,
  modyfikowalnymi szablonami, obs³ug± za³±czników
- interfejs e-mailowy z obs³ug± za³±czników MIME, obs³ug± poczty w
  zale¿no¶ci od adresu lub x-nag³ówków, autoresponderami dla klientów,
  powiadomieniami dla agentów
- bilety z konfigurowalnymi widokami, blokowaniem, odpowiadaniem,
  autoresponderami, histori±, mo¿liwo¶ci± dodawania notatek,
  odbijaniem/przekierowywaniem poczty, priorytetami, rozliczaniem
  czasu, pe³notekstowym przeszukiwaniem zawarto¶ci
- system z tworzeniem i konfiguracj± kont u¿ytkowników, grup,
  standardowych odpowiedzi, sygnaturek, powiadomieniami dla
  administratorów i zg³aszaj±cych problemy, ostatecznymi terminami dla
  problematycznych biletów, ustawialnym formatem numerowania biletów,
  ró¿nymi poziomami uprawnieñ/praw dostêpu, centraln± baz± danych
  (MySQL, PostgreSQL...), uwierzytelnianiem u¿ytkowników przy u¿yciu
  bazy danych lub katalogu LDAP, ³atwym tworzeniem dodatków i
  frontendów.

%prep
%setup -q -n %{name}

%build
# copy config file
cp Kernel/Config.pm.dist Kernel/Config.pm
cd Kernel/Config/ && for foo in *.dist; do cp $foo `basename $foo .dist`; done && cd ../../
# copy all crontab dist files
for foo in var/cron/*.dist; do mv $foo var/cron/`basename $foo .dist`; done

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{otrsdir}

# copy files
cp -R . $RPM_BUILD_ROOT%{otrsdir}

# install init-Script & apache2 config
install -d -m 755 $RPM_BUILD_ROOT/etc/rc.d/init.d
install -d -m 755 $RPM_BUILD_ROOT/etc/sysconfig
install -d -m 755 $RPM_BUILD_ROOT/etc/httpd/httpd.conf

install -m 755 scripts/redhat-rcotrs $RPM_BUILD_ROOT/etc/rc.d/init.d/otrs
install scripts/redhat-rcotrs-config $RPM_BUILD_ROOT/etc/sysconfig/otrs
install scripts/apache-httpd.include.conf $RPM_BUILD_ROOT/etc/httpd/httpd.conf/88_otrs.conf

%clean
rm -rf $RPM_BUILD_ROOT

%post
if [ -n "`/bin/id -u %{otrsuser} 2>/dev/null`" ]; then
	if [ "`/bin/id -u %{otrsuser}`" != "31" ]; then
		echo "Error: user %{otrsuser} doesn't have uid=31. Correct this before installing otrs." >&2
		exit 1
	fi
	# update home dir
	/usr/sbin/usermod -d %{otrsdir} %{otrsuser}
else
	/usr/sbin/useradd -u 31 -d %{otrsdir} -s /bin/dalse -G http -c 'OTRS System user' %{otrsuser}
fi

# set permission
/home/services/otrs/bin/SetPermissions.sh /home/services/otrs %{otrsuser} http http http

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
%doc INSTAL* UPGRADING TODO CHANGES READM* doc/*

%dir %{otrsdir}
%{otrsdir}/RELEASE
%dir %{otrsdir}/Kernel
%attr(644,http,root) %config(noreplace) %{otrsdir}/Kernel/Config.pm
%dir %{otrsdir}/Kernel/Config
%config(noreplace) %{otrsdir}/Kernel/Config/GenericAgent.pm
%config(noreplace) %{otrsdir}/Kernel/Config/ModulesCusto*.pm
%{otrsdir}/Kernel/Config/Defaults.pm
%{otrsdir}/Kernel/Config/Modules.pm
%{otrsdir}/Kernel/Language.pm
%dir %{otrsdir}/Kernel/Language
%config(noreplace) %{otrsdir}/Kernel/Language/*.pm
%{otrsdir}/Kernel/Modules
%dir %{otrsdir}/Kernel/Output
%dir %{otrsdir}/Kernel/Output/HTML
%{otrsdir}/Kernel/Output/HTML/*.pm
%dir %{otrsdir}/Kernel/Output/HTML/Standard
%config(noreplace) %{otrsdir}/Kernel/Output/HTML/Standard/*.dtl
%dir %{otrsdir}/Kernel/Output/HTML/Lite
%config(noreplace) %{otrsdir}/Kernel/Output/HTML/Lite/*.dtl
%{otrsdir}/Kernel/System
%{otrsdir}/Kernel/cpan-lib*
%config(noreplace) %{otrsdir}/.procmailrc
%config(noreplace) %{otrsdir}/.fetchmailrc
%config(noreplace) %{otrsdir}/.mailfilter
%{otrsdir}/bin
%{otrsdir}/install*
%{otrsdir}/scripts
%dir %{otrsdir}/var
%dir %{otrsdir}/var/cron
%{otrsdir}/var/article
%config(noreplace) %{otrsdir}/var/cron/*
%{otrsdir}/var/httpd
%dir %{otrsdir}/var/log
%config(noreplace) %{otrsdir}/var/log/TicketCounter.log
%{otrsdir}/var/sessions
%{otrsdir}/var/spool
%{otrsdir}/var/tmp
%dir %{otrsdir}/var/pics
%{otrsdir}/var/pics/stats

%attr(754,root,root) /etc/rc.d/init.d/otrs
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/otrs
/etc/httpd/httpd.conf/88_otrs.conf
