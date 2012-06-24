# --
# Kernel/Language/pl.pm - provides pl language translation
# Copyright (C) 2002-2004 Martin Edenhofer <martin at otrs.org>
# Translated by Tomasz Melissa <janek at rumianek.com>
# --
# $Id$
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --
package Kernel::Language::pl;

use strict;

use vars qw($VERSION);
$VERSION = '$Revision$';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

# --
sub Data {
    my $Self = shift;
    my %Param = @_;
    my %Hash = ();

    # $$START$$
    # Last translation Tue Feb 10 01:08:12 2004 by 

    # possible charsets
    $Self->{Charset} = ['iso-8859-2', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Jear;)
    $Self->{DateFormat} = '%D.%M.%Y %T';
    $Self->{DateFormatLong} = '%A %D %B %T %Y';
    $Self->{DateInputFormat} = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';

    %Hash = (
    # Template: AAABase
      ' 2 minutes' => ' 2 Minuty',
      ' 5 minutes' => ' 5 Minut',
      ' 7 minutes' => ' 7 Minut',
      '(Click here to add)' => '',
      '10 minutes' => '10 Minut',
      '15 minutes' => '15 Minut',
      'AddLink' => 'Dodaj link',
      'Admin-Area' => 'Administracja',
      'agent' => 'Agent',
      'Agent-Area' => '',
      'all' => 'wszystkie',
      'All' => 'Wszystkie',
      'Attention' => 'Uwaga',
      'before' => 'przed',
      'Bug Report' => 'Zglos b��d',
      'Cancel' => 'Anuluj',
      'change' => 'zmie�',
      'Change' => 'Zmie�',
      'change!' => 'Zmie�!',
      'click here' => 'kliknij tutaj',
      'Comment' => 'Komentarz',
      'Customer' => 'Klient',
      'customer' => 'klient',
      'Customer Info' => 'Klient Info',
      'day' => 'dzie�',
      'day(s)' => 'dzie�(dni)',
      'days' => 'dni',
      'description' => 'opis',
      'Description' => 'Opis',
      'Dispatching by email To: field.' => 'Przekazywanie na podstawie pola DO:',
      'Dispatching by selected Queue.' => 'Przekazywanie na podstawie kolejki.',
      'Don\'t show closed Tickets' => 'Nie pokazuj zamkni�tych zg�osze�',
      'Don\'t work with UserID 1 (System account)! Create new users!' => 'Nie u�ywaj u�ytkownika z UserID 1 (System Account)! Stw�rz nowych u�ytkownik�w!',
      'Done' => 'Zrobione',
      'end' => 'koniec',
      'Error' => 'B��d',
      'Example' => 'Przyk�ad',
      'Examples' => 'Przyk�ady',
      'Facility' => 'Udogodnienie',
      'FAQ-Area' => 'FAQ',
      'Feature not active!' => 'Funkcja nie aktywna!',
      'go' => 'Start',
      'go!' => 'Start!',
      'Group' => 'Grupa',
      'Hit' => 'Ods�ona',
      'Hits' => 'Ods�on',
      'hour' => 'godzin',
      'hours' => 'godziny',
      'Ignore' => 'Ignoruj',
      'invalid' => 'Nieu�ywane',
      'Invalid SessionID!' => 'Niepoprawne SessionID!',
      'Language' => 'J�zyk',
      'Languages' => 'J�zyki',
      'last' => 'ostatni',
      'Line' => 'Linia',
      'Lite' => 'Lite',
      'Login failed! Your username or password was entered incorrectly.' => 'Logowanie niepoprawne! Twoj u�ytkownik lub has�o zosta�y wpisane niepoprawnie.',
      'Logout successful. Thank you for using OTRS!' => 'Wylogowanie zako�czone! Dziekujemy za u�ywanie OTRS!',
      'Message' => 'Wiadomo��',
      'minute' => 'minuta',
      'minutes' => 'minuty',
      'Module' => 'Modu�',
      'Modulefile' => 'Plik Modu�u',
      'month(s)' => 'miesi�c(e)',
      'Name' => 'Nazwa',
      'New Article' => 'Nowy Artyku�',
      'New message' => 'Nowa wiadomo��',
      'New message!' => 'Nowa wiadomo��!',
      'No' => 'Nie',
      'no' => 'nie',
      'No entry found!' => 'Danych nie odnaleziono!',
      'No suggestions' => 'Brak podpowiedzi',
      'none' => 'brak danych',
      'none - answered' => 'brak - odpowiedziane',
      'none!' => 'brak!',
      'Normal' => 'Normalny',
      'Off' => 'Wy��czone',
      'off' => 'wy��czone',
      'On' => 'W��czone',
      'on' => 'w��czone',
      'Password' => 'Has�o',
      'Pending till' => 'Oczekuje do',
      'Please answer this ticket(s) to get back to the normal queue view!' => 'Prosz� odpowiedz na to zg�oszenie, by m�c powr�ci� do zwyk�ego widoku kolejki zg�osze�!',
      'Please contact your admin' => 'Skontaktuj si� z Administratorem',
      'please do not edit!' => 'nie edytowa�!',
      'Please go away!' => 'Prosz� odejdz!',
      'possible' => 'mo�liwe',
      'Preview' => 'Podgl�d',
      'QueueView' => 'Widok kolejki',
      'reject' => 'odrzu�',
      'replace with' => 'zamie� z',
      'Reset' => 'Resetuj',
      'Salutation' => 'Zwrot grzeczno�ciowy',
      'Session has timed out. Please log in again.' => 'Sesja wygas�a. Zaloguj si� ponownie',
      'Show closed Tickets' => 'Poka� zamkni�te zg�oszenia',
      'Signature' => 'Podpis',
      'Sorry' => 'Niestety',
      'Stats' => 'Statystyki',
      'Subfunction' => 'Funkcja podrz�dna',
      'submit' => 'wy�lij',
      'submit!' => 'wy�lij!',
      'system' => 'System',
      'Take this User' => 'U�yj tego u�ytkownika',
      'Text' => 'Tekst',
      'The recommended charset for your language is %s!' => 'Sugerowany charset dla Twojego j�zyka to %s!',
      'Theme' => 'Schemat',
      'There is no account with that login name.' => 'Nie istnieje konto z takim loginem.',
      'Timeover' => 'Czas min��',
      'To: (%s) replaced with database email!' => 'Do: (%s) zamieniony z emailem bazy',
      'top' => 'g�ra',
      'update' => 'aktualizuj',
      'Update' => 'Aktualizuj',
      'update!' => 'aktualizuj!',
      'User' => 'U�ytkownik',
      'Username' => 'Nazwa u�ytkownika',
      'Valid' => 'U�ycie',
      'Warning' => 'Ostrze�enia',
      'week(s)' => 'tydzie�(tygodni)',
      'Welcome to OTRS' => 'Witamy w OTRS',
      'Word' => 'S�owo',
      'wrote' => 'napisa�',
      'year(s)' => 'rok(lat)',
      'yes' => 'tak',
      'Yes' => 'Tak',
      'You got new message!' => 'Masz now� wiadomo��!',
      'You have %s new message(s)!' => 'Masz %s nowych wiadomo�ci!',
      'You have %s reminder ticket(s)!' => 'Masz %s przypomnie�!',

    # Template: AAAMonth
      'Apr' => 'Kwi',
      'Aug' => 'Sie',
      'Dec' => 'Gru',
      'Feb' => 'Lut',
      'Jan' => 'Sty',
      'Jul' => 'Lip',
      'Jun' => 'Cze',
      'Mar' => 'Mar',
      'May' => 'Maj',
      'Nov' => 'Lis',
      'Oct' => 'Pa�',
      'Sep' => 'Wrz',

    # Template: AAAPreferences
      'Closed Tickets' => 'Zamkni�te zg�oszenia',
      'Custom Queue' => 'Osobista kolejka',
      'Follow up notification' => 'Kontynuuj�c powiadomienie',
      'Frontend' => 'Frontend',
      'Mail Management' => 'Zarz�dzanie poczt�',
      'Max. shown Tickets a page in Overview.' => 'Max. ilo�� pokazywanych zg�osze� na stronie Przegl�d',
      'Max. shown Tickets a page in QueueView.' => 'Max. ilo�� pokazywanych zg�osze� na stronie Widoku Kolejki',
      'Move notification' => 'Przesu� powiadomienie',
      'New ticket notification' => 'Nowe powiadomienie o zg�oszeniu',
      'Other Options' => 'Inne opcje',
      'PhoneView' => 'Widok telefon�w',
      'Preferences updated successfully!' => 'Ustawienia zapisano pomy�lnie!',
      'QueueView refresh time' => 'Czas od�wierzania widoku kolejki',
      'Screen after new ticket' => 'Strona po dodaniu zg�oszenia',
      'Select your default spelling dictionary.' => 'Wybierz domy�lny s�ownik.',
      'Select your frontend Charset.' => 'Wybierz charset dla Twojej pracy w OTRS.',
      'Select your frontend language.' => 'Wybierz j�zyk.',
      'Select your frontend QueueView.' => 'Wybierz widok kolejki.',
      'Select your frontend Theme.' => 'Wybierz schemat dla OTRS.',
      'Select your QueueView refresh time.' => 'Wybierz czas od�wierzania widoku kolejki.',
      'Select your screen after creating a new ticket.' => 'Wybierz stron� po dodaniu zg�oszenia',
      'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' => 'Wy�lij mi wiadomo�� gdy klient odpowie na zg�oszenie, a ja jestem w�a�cicielem tego zg�oszenia.',
      'Send me a notification if a ticket is moved into a custom queue.' => 'Wy�lij mi wiadomo�� gdy zg�oszenie zostanie przesuniete do osobistej kolejki.',
      'Send me a notification if a ticket is unlocked by the system.' => 'Wy�lij mi wiadomo�� gdy zg�oszenie zostanie odblokowane przez system.',
      'Send me a notification if there is a new ticket in my custom queues.' => 'Wy�lij mi wiadomo�� gdy pojawi si� nowe zg�osznie w moich kolejkach.',
      'Show closed tickets.' => 'Poka� zamkni�te zg�oszenia.',
      'Spelling Dictionary' => 'S�ownik',
      'Ticket lock timeout notification' => 'Wiadomo�� o przekroczonym czasie dla zablokowanych zg�osze�',
      'TicketZoom' => 'Zobacz zg�oszenie',

    # Template: AAATicket
      '1 very low' => '1 bardzo niski',
      '2 low' => '2 niski',
      '3 normal' => '3 normalny',
      '4 high' => '4 wysoki',
      '5 very high' => '5 bardzo wysoki',
      'Action' => 'Akcja',
      'Age' => 'Wiek',
      'Article' => 'Artyku�',
      'Attachment' => 'Za��cznik',
      'Attachments' => 'Za��czniki',
      'Bcc' => 'Bcc',
      'Bounce' => 'Odbij',
      'Cc' => 'Cc',
      'Close' => 'Zamknij',
      'closed successful' => 'zamkni�te z powodzeniem',
      'closed unsuccessful' => 'zamkni�te bez powodzenia',
      'Compose' => 'Stw�rz',
      'Created' => 'Utworzone',
      'Createtime' => 'Utworzone o',
      'email' => 'E-Mail',
      'eMail' => 'E-Mail',
      'email-external' => 'E-Mail zewn�trzny',
      'email-internal' => 'E-Mail wewn�trzny',
      'Forward' => 'Prze�lij dalej',
      'From' => 'Od',
      'high' => 'wysoki',
      'History' => 'Historia',
      'If it is not displayed correctly,' => 'Je�li nie jest wy�wietlane poprawnie,',
      'lock' => 'zablokowane',
      'Lock' => 'Zablokowane',
      'low' => 'niski',
      'Move' => 'Przesu�',
      'new' => 'nowe',
      'normal' => 'normalny',
      'note-external' => 'Notatka zewn�trzna',
      'note-internal' => 'Notatka wewn�trzna',
      'note-report' => 'Notatka raportuj�ca',
      'open' => 'otwarte',
      'Owner' => 'W�a�ciciel',
      'Pending' => 'Oczekuj�ce',
      'pending auto close+' => 'oczekuj�ce na automatyczne zamkni�cie+',
      'pending auto close-' => 'oczekujace na automatyczne zamkni�cie-',
      'pending reminder' => 'przypomnienie',
      'phone' => 'Telefon',
      'plain' => 'czyste',
      'Priority' => 'Priorytet',
      'Queue' => 'Kolejka',
      'removed' => 'usuni�te',
      'Sender' => 'Nadawca',
      'sms' => 'SMS',
      'State' => 'Status',
      'Subject' => 'Temat',
      'This is a' => 'To jest',
      'This is a HTML email. Click here to show it.' => 'To jest email w formacie HTML. Kliknij tutaj by go przeczyta�.',
      'This message was written in a character set other than your own.' => 'Ta wiadomo�� zosta�a napisana z u�yciem zestawu znak�w innego ni� Tw�j.',
      'Ticket' => 'Zg�oszenie',
      'Ticket "%s" created!' => 'Zg�oszenie "%s" utworzone',
      'To' => 'Do',
      'to open it in a new window.' => 'by otworzy� w oddzielnym oknie',
      'unlock' => 'odblokuj',
      'Unlock' => 'Odblokuj',
      'very high' => 'bardzo wysoki',
      'very low' => 'bardzo niski',
      'View' => 'Widok',
      'webrequest' => 'zg�oszenie z WWW',
      'Zoom' => 'Poka�',

    # Template: AAAWekDay
      'Fri' => 'Ptk',
      'Mon' => 'Pnd',
      'Sat' => 'Sob',
      'Sun' => 'Ndz',
      'Thu' => 'Czw',
      'Tue' => 'Wtr',
      'Wed' => '�rd',

    # Template: AdminAttachmentForm
      'Add' => '',
      'Attachment Management' => 'Zarz�dzanie za��cznikami',

    # Template: AdminAutoResponseForm
      'Add auto response' => 'Dodaj automatyczn� odpowiedz',
      'Auto Response From' => 'Automatyczna odpowied� od',
      'Auto Response Management' => 'Zarz�dzanie automatycznymi odpowiedziami',
      'Change auto response settings' => 'Zmie� ustawienia automatycznych odpowiedzi',
      'Note' => 'Notatka',
      'Response' => 'Odpowiedz',
      'to get the first 20 character of the subject' => 'by wstawi� pierwsze 20 znak�w tematu',
      'to get the first 5 lines of the email' => 'by wstawi� 5 pierwszych linii wiadomo�ci',
      'to get the from line of the email' => 'by wstawi� pole Od wiadomo�ci',
      'to get the realname of the sender (if given)' => 'by wstawi� prawdziwe imi� i nazwisko klienta (je�li podano)',
      'to get the ticket id of the ticket' => 'by wstawi� ID zg�oszenia',
      'to get the ticket number of the ticket' => 'by wstawi� numer zg�oszenia',
      'Type' => 'Typ',
      'Useable options' => 'U�yteczne opcje',

    # Template: AdminCustomerUserForm
      'Customer User Management' => 'Konfiguracja u�ytkownikow',
      'Customer user will be needed to to login via customer panels.' => 'Klient bedzie musia� logowac si� poprzez interfejs klienta.',
      'Select source:' => 'Wybierz �r�d�o',
      'Source' => '�r�d�o',

    # Template: AdminCustomerUserGeneric

    # Template: AdminCustomerUserGroupChangeForm
      'Change %s settings' => 'Zmie� %s ustawienia',
      'Customer User <-> Group Management' => 'Klient <-> Zarz�dzanie Grupami',
      'Full read and write access to the tickets in this group/queue.' => 'Pe�en dost�p do odczytu i zapisu zg�osze� w tej grupie/kolejce',
      'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' => 'Je�li nic nie zaznaczono, nie ma uprawnien w tej grupie (zg�oszenia nie b�d� dost�pne dla tego u�ytkownika',
      'Permission' => 'Pozwolenie',
      'Read only access to the ticket in this group/queue.' => 'Uprawnienia tylko do odczytu zdag�osze� w tej kolejce/grupie',
      'ro' => 'ro',
      'rw' => 'rw',
      'Select the user:group permissions.' => 'Wybierz uprawnienia dla u�ytkownika:grupy',

    # Template: AdminCustomerUserGroupForm
      'Change user <-> group settings' => 'Zmien u�ytkownika <-> ustawienia grupy',

    # Template: AdminCustomerUserPreferencesGeneric

    # Template: AdminEmail
      'Admin-Email' => 'Email Administratora',
      'Body' => 'Tre��',
      'OTRS-Admin Info!' => 'Informacja od Administratora OTRS!',
      'Recipents' => 'Adresaci',
      'send' => 'Wy�lij',

    # Template: AdminEmailSent
      'Message sent to' => 'Wiadomo�� wys�ana do',

    # Template: AdminGroupForm
      'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' => 'Stworz nowa grup�, by m�c zarz�dza� dost�pem dla r�nych grup u�ytkownikow (np. Serwis, Sprzeda�, Zam�wienia itp...).',
      'Group Management' => 'Zarz�dzanie grupami',
      'It\'s useful for ASP solutions.' => 'Pomocne w rozwiazanich ASP.',
      'The admin group is to get in the admin area and the stats group to get stats area.' => 'Grupa Admin pozwala dosta� si� do sekcji Administracji systemu, Stats umo�liwia przegl�danie statystyk.',

    # Template: AdminLog
      'System Log' => 'Log Systemu',

    # Template: AdminNavigationBar
      'AdminEmail' => 'Email od Admina',
      'Attachment <-> Response' => 'Za��cznik <-> Odpowiedz',
      'Auto Response <-> Queue' => 'AutoOdpowied� <-> Kolejka',
      'Auto Responses' => 'AutoOdpowiedzi',
      'Customer User' => 'Klienci',
      'Customer User <-> Groups' => 'Klienci <-> Grupy',
      'Email Addresses' => 'Adresy Email',
      'Groups' => 'Grupy',
      'Logout' => 'Wyloguj',
      'Misc' => 'R�ne',
      'Notifications' => 'Powiadomienia',
      'PostMaster Filter' => 'Filtr PostMaster',
      'PostMaster POP3 Account' => 'PostMaster Konto POP3',
      'Responses' => 'Odpowiedzi',
      'Responses <-> Queue' => 'Odpowiedzi <-> Kolejka',
      'Select Box' => 'Zapytanie SQL',
      'Session Management' => 'Zarz�dzanie sesjami',
      'Status' => 'Status',
      'System' => 'System',
      'User <-> Groups' => 'U�ytkownik <-> Grupy',

    # Template: AdminNotificationForm
      'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Opcje konfiguracyjne (np.  &lt;OTRS_CONFIG_HttpType&gt;)',
      'Notification Management' => 'Zarz�dzanie powiadomieniami',
      'Notifications are sent to an agent or a customer.' => 'Powiadomienia s� wysy�ane do agent�w lub klient�w',
      'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' => 'Opcje dla aktualnego klienta (np. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)',
      'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' => 'Opcje dla aktualnego u�ytkownika (np. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
      'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' => 'Opcje w�a�cieciala zg�oszenia (np. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',

    # Template: AdminPOP3Form
      'All incoming emails with one account will be dispatched in the selected queue!' => 'Wszystkie przychodz�ce emaile na jedno konto b�d� umieszczone w zaznacznej kolejce!',
      'Dispatching' => 'Przekazanie',
      'Host' => 'Host',
      'If your account is trusted, the x-otrs header (for priority, ...) will be used!' => 'Je�li Twoje konto jest zaufane, zostanie u�yty nag��wek x-otrs (dla priorytetu)!',
      'Login' => 'Login',
      'POP3 Account Management' => 'Zarz�dzanie kontem POP3',
      'Trusted' => 'Zaufane',

    # Template: AdminPostMasterFilterForm
      'Match' => 'Pasuje',
      'PostMasterFilter Management' => 'Zarz�dzanie filtrem dla PostMaster',
      'Set' => 'Ustaw',

    # Template: AdminQueueAutoResponseForm
      'Queue <-> Auto Response Management' => 'Kolejka <-> Zarz�dzanie AutoOdpowiedziami',

    # Template: AdminQueueAutoResponseTable

    # Template: AdminQueueForm
      '0 = no escalation' => '0 = brak eskalacji',
      '0 = no unlock' => '0 = bez odblokowania',
      'Customer Move Notify' => 'Powiadomienie klienta o przesunieciu',
      'Customer Owner Notify' => 'Powiadomienie klienta o zmianie w�a�ciciela',
      'Customer State Notify' => 'Powiadomienie klienta o zmianie statusu',
      'Escalation time' => 'Czas eskalacji',
      'Follow up Option' => 'Opcja Follow Up',
      'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' => 'Je�li zg�oszenie by�o zamkni�te, a klient przy�le na nie Follow Up, wtedy zg�oszenie zostanie zablokowane w kolejce starego w�a�ciciela.',
      'If a ticket will not be answered in thos time, just only this ticket will be shown.' => 'Je�li nie zostanie udzielona odpowied� na zg�oszenie w podanym czasie, wtedy tylko to zg�oszenie b�dzie widoczne w kolejce.',
      'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' => 'Je�li agent zablokuje zg�oszenie, a nast�pnie nie odpowie w ciagu wskazanego czasu, wtedy zg�oszenie zostanie automtycznie odblokowane. Dzieki temu pozostali agenci b�d� mogli je zobaczy�.',
      'Key' => 'Klucz',
      'OTRS sends an notification email to the customer if the ticket is moved.' => 'OTRS wy�le emaila z informacj� do klienta gdy zg�oszenie zostanie przesuni�te.',
      'OTRS sends an notification email to the customer if the ticket owner has changed.' => 'OTRS wy�le emaila z informacj� do klienta, gdy zmieni si� w�a�ciciel zg�oszenia.',
      'OTRS sends an notification email to the customer if the ticket state has changed.' => 'OTRS wy�le emaila z informacj� do klienta, gdy zmieni si� status zg�oszenia.',
      'Queue Management' => 'Zarz�dzanie kolejkami',
      'Sub-Queue of' => 'Kolejka podrz�dna',
      'Systemaddress' => 'Adres systemowy',
      'The salutation for email answers.' => 'Zwrot grzeczno�ciowy dla odpowiedzi emailowych.',
      'The signature for email answers.' => 'Podpis dla odpowiedzi emailowych.',
      'Ticket lock after a follow up' => 'Zg�oszenie zablokowane po odpowiedzi (FU)',
      'Unlock timeout' => 'Timeout odblokowania',
      'Will be the sender address of this queue for email answers.' => 'B�dzie adres nadawcy tej kolejki dla odpowiedzi wysy�anych emailem.',

    # Template: AdminQueueResponsesChangeForm
      'Std. Responses <-> Queue Management' => 'Standardowe odpowiedzi <-> Zarz�dzanie kolejkami',

    # Template: AdminQueueResponsesForm
      'Answer' => 'Odpowied� (answer)',
      'Change answer <-> queue settings' => 'Zmie� odpowied� (answer) <-> Ustawienia kolejki',

    # Template: AdminResponseAttachmentChangeForm
      'Std. Responses <-> Std. Attachment Management' => 'Standardowa odpowied� <-> Standardowe za��czniki',

    # Template: AdminResponseAttachmentForm
      'Change Response <-> Attachment settings' => 'Zmie� odpowied� <-> Ustawienia za��cznikow',

    # Template: AdminResponseForm
      'A response is default text to write faster answer (with default text) to customers.' => 'Odpowied� to domy�lny tekst wstawiany do odpowiedzi klientowi, dzieki czemu agent mo�e szybciej odpowiedzie� na zg�oszenie.',
      'Don\'t forget to add a new response a queue!' => 'Nie zapomnij doda� nowej odpowiedzi do kolejki!',
      'Next state' => 'Nast�pny status',
      'Response Management' => 'Zarz�dzanie Odpowiedziami',
      'The current ticket state is' => 'Aktualny status zg�oszenia to',

    # Template: AdminSalutationForm
      'customer realname' => 'Prawdziwe dane klienta',
      'for agent firstname' => 'dla imienia agenta',
      'for agent lastname' => 'dla nazwiska agenta',
      'for agent login' => 'dla loginu agenta',
      'for agent user id' => 'dla ID u�ytkownika agenta',
      'Salutation Management' => 'Zarz�dzanie zwrotami grzecznosciowymi',

    # Template: AdminSelectBoxForm
      'Max Rows' => 'Maksymalna liczba wierszy',

    # Template: AdminSelectBoxResult
      'Limit' => 'Limit',
      'Select Box Result' => 'Wyniki Zapytania',
      'SQL' => 'SQL',

    # Template: AdminSession
      'Agent' => 'Agent',
      'kill all sessions' => 'Zamknij wszystkie sesje',
      'Overview' => 'Przegl�d',
      'Sessions' => 'Sesje',
      'Uniq' => 'Unikalny',

    # Template: AdminSessionTable
      'kill session' => 'Zamknij sesje',
      'SessionID' => 'ID Sesji',

    # Template: AdminSignatureForm
      'Signature Management' => 'Zarz�dzanie podpisami',

    # Template: AdminStateForm
      'See also' => 'Zobacz r�wnie�',
      'State Type' => 'Typ statusu',
      'System State Management' => 'Zarz�dzanie statusami',
      'Take care that you also updated the default states in you Kernel/Config.pm!' => 'Zadbaj o uaktualnienie stan�w w swoim Kernel/Config.pm!',

    # Template: AdminSystemAddressForm
      'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' => 'Wszystkie wiadomo�ci przys�ane na ten adres w polu (Do:) zostan� umieszczone w tej kolejce.',
      'Email' => 'E-Mail',
      'Realname' => 'Prawdziwe Imi� i Nazwisko',
      'System Email Addresses Management' => 'Zarz�dzanie adresem email systemu',

    # Template: AdminUserForm
      'Don\'t forget to add a new user to groups!' => 'Nie zapomnij doda� u�ytkownika do grup!',
      'Firstname' => 'Imi�',
      'Lastname' => 'Nazwisko',
      'User Management' => 'Zarz�dzanie U�ytkownikami',
      'User will be needed to handle tickets.' => 'U�ytkownik bedzie niezb�dny do obslugi zg�oszenia.',

    # Template: AdminUserGroupChangeForm
      'create' => 'utw�rz',
      'move_into' => 'przenie� do',
      'owner' => 'w�a�ciciel',
      'Permissions to change the ticket owner in this group/queue.' => 'Uprawnienia do zmiany w�a�ciciala zg�oszenia w tej grupie/kolejce.',
      'Permissions to change the ticket priority in this group/queue.' => 'Uprawnienia do zmiany priorytetu zg�oszenia w tej grupie/kolejce.',
      'Permissions to create tickets in this group/queue.' => 'Uprawnienia do tworzenia zg�osze� w tej grupie/kolejce',
      'Permissions to move tickets into this group/queue.' => 'Uprawnienia do przenoszenia zg�osze� do tej grupy/kolejki',
      'priority' => 'priorytet',
      'User <-> Group Management' => 'U�ytkownik <-> Zarz�dzanie grupami',

    # Template: AdminUserGroupForm

    # Template: AdminUserPreferencesGeneric

    # Template: AgentBook
      'Address Book' => 'Ksi��ka Adresowa',
      'Discard all changes and return to the compose screen' => 'Anuluj wszystkie zmiany i powr�� do ekranu edycji',
      'Return to the compose screen' => 'Powr�� do ekranu edycji',
      'Search' => 'Szukaj',
      'The message being composed has been closed.  Exiting.' => 'Wiadomo�� edytowana zosta�a zamkni�ta.  Wychodze.',
      'This window must be called from compose window' => 'To okno musi by� wywolane z okna edycji',

    # Template: AgentBounce
      'A message should have a To: recipient!' => 'Wiadomo�� musi zawierac informacje w polu Do: (odbiorca)!',
      'Bounce ticket' => 'Odbij zg�oszenie',
      'Bounce to' => 'Odbij do',
      'Inform sender' => 'Powiadom nadawce',
      'Next ticket state' => 'Nast�pny status zg�oszenia',
      'Send mail!' => 'Wiadomo�� wys�ana!',
      'You need a email address (e. g. customer@example.com) in To:!' => 'Wymagany adres E-Mail (np. customer@example.com) w polu Do:!' ,
      'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further informations.' => 'Twoja wiadomo�� o zg�oszeniu numer: "<OTRS_TICKET>" zosta�a przekazana na adres "<OTRS_BOUNCE_TO>" . Prosimy kontaktowa� si� pod tym adresem we wszystkich sprawach dotycz�cych tego zg�oszenia.',

    # Template: AgentClose
      ' (work units)' => ' (jednostek roboczych)',
      'A message should have a body!' => 'Wiadomo�� powinna zawiera� tre��!',
      'A message should have a subject!' => 'Wiadomo�� musi posiadac temat!',
      'Close ticket' => 'Zamknij zg�oszenie',
      'Close type' => 'Typ zamkni�cia',
      'Close!' => 'Zamknij!',
      'Note Text' => 'Tekst notatki',
      'Note type' => 'Typ notatki',
      'Options' => 'Opcje',
      'Spell Check' => 'Sprawd� poprawno��',
      'Time units' => 'Jednostek czasu',
      'You need to account time!' => 'Musisz zaraportowa� czas!',

    # Template: AgentCompose
      'A message must be spell checked!' => 'Wiadomo�� musi zosta� sprawdzona s�ownikiem!',
      'Attach' => 'Do��cz',
      'Compose answer for ticket' => 'Edytuj odpowied� na zg�oszenie',
      'for pending* states' => 'oczekuj�ce* statusy',
      'Is the ticket answered' => 'Czy zg�oszenie zawiera odpowiedz',
      'Pending Date' => 'Data oczekiwania',

    # Template: AgentCustomer
      'Back' => 'Powr�t',
      'Change customer of ticket' => 'Zmie� klienta dla zg�oszenia',
      'CustomerID' => 'ID klienta#',
      'Search Customer' => 'Szukaj klienta',
      'Set customer user and customer id of a ticket' => 'Wska� klienta i ID klienta dla zg�oszenia',

    # Template: AgentCustomerHistory
      'All customer tickets.' => 'Wszystkie zg�oszenia klienta',
      'Customer history' => 'Historia klienta',

    # Template: AgentCustomerMessage
      'Follow up' => '',

    # Template: AgentCustomerView
      'Customer Data' => 'Data klienta',

    # Template: AgentEmailNew
      'All Agents' => 'Wszyscy Agenci',
      'Clear From' => 'Wyczy�� pole Od:',
      'Compose Email' => 'Napisz E-Mail',
      'Lock Ticket' => 'Zablok�j zg�oszenie',
      'new ticket' => 'nowe zg�oszenie',

    # Template: AgentForward
      'Article type' => 'Typ artyku�u',
      'Date' => 'Data',
      'End forwarded message' => 'Koniec przekazanej wiadomo�ci',
      'Forward article of ticket' => 'Przeka� artyku� zg�oszenia',
      'Forwarded message from' => 'Wiadomo�� przekazana przez',
      'Reply-To' => 'Odpowied� do',

    # Template: AgentFreeText
      'Change free text of ticket' => 'Zmie� free text zg�oszenia',
      'Value' => 'Warto��',

    # Template: AgentHistoryForm
      'History of' => 'Historia',

    # Template: AgentMailboxNavBar
      'All messages' => 'Wszysktie wiadomo�ci',
      'down' => 'd�',
      'Mailbox' => 'Skrzynka',
      'New' => 'Nowe',
      'New messages' => 'Nowe wiadomo�ci',
      'Open' => 'Otwarte',
      'Open messages' => 'Otwarte wiadomo�ci',
      'Order' => 'Porz�dek',
      'Pending messages' => 'Oczekuj�ce wiadomo�ci',
      'Reminder' => 'Przypomnienie',
      'Reminder messages' => 'Tekst prztpomnienia',
      'Sort by' => 'Pososrtowano wedlug',
      'Tickets' => 'Zg�oszenia',
      'up' => 'g�ra',

    # Template: AgentMailboxTicket
      '"}' => '',
      '"}","14' => '',

    # Template: AgentMove
      'Move Ticket' => 'Przesu� zg�oszenie',
      'New Owner' => 'Nowy W�a�ciciel',
      'New Queue' => 'Nowa kolejka',
      'Previous Owner' => 'Poprzedni W�a�ciciel',
      'Queue ID' => 'ID Kolejki',

    # Template: AgentNavigationBar
      'Locked tickets' => 'zablokowane zg�oszenia',
      'new message' => 'nowa wiadomo��',
      'Preferences' => 'Ustawienia',
      'Utilities' => 'Narz�dzia',

    # Template: AgentNote
      'Add note to ticket' => 'Dodaj notatk� do zg�oszenia',
      'Note!' => 'Notatka!',

    # Template: AgentOwner
      'Change owner of ticket' => 'Zmie� wla�ciciela zg�oszenia',
      'Message for new Owner' => 'Wiadomo�� do nowego w�a�ciciela',

    # Template: AgentPending
      'Pending date' => 'Data oczekiwania',
      'Pending type' => 'Typ oczekiwania',
      'Pending!' => 'Oczekuje!',
      'Set Pending' => 'Ustaw oczekiwanie',

    # Template: AgentPhone
      'Customer called' => 'Zadzwoni� klient',
      'Phone call' => 'Telefon',
      'Phone call at %s' => 'Telefon o %s',

    # Template: AgentPhoneNew

    # Template: AgentPlain
      'ArticleID' => 'ID Artyku�u',
      'Plain' => 'Puste',
      'TicketID' => 'ID Zg�oszenia',

    # Template: AgentPreferencesCustomQueue
      'Select your custom queues' => 'Wybierz swoje kolejki',

    # Template: AgentPreferencesForm

    # Template: AgentPreferencesGeneric

    # Template: AgentPreferencesPassword
      'Change Password' => 'Zmie� has�o',
      'New password' => 'Wpisz nowe has�o',
      'New password again' => 'Jeszcze raz wpisz nowe has�o',

    # Template: AgentPriority
      'Change priority of ticket' => 'Zmie� priorytet zg�oszenia',

    # Template: AgentSpelling
      'Apply these changes' => 'Zastosuj te zmiany',
      'Spell Checker' => 'S�ownik',
      'spelling error(s)' => 'b��d�w',

    # Template: AgentStatusView
      'D' => 'D�l',
      'of' => 'z',
      'Site' => 'Strona',
      'sort downward' => 'sortuj malej�co',
      'sort upward' => 'sortuj rosn�co',
      'Ticket Status' => 'Status zg�oszenia',
      'U' => 'G�ra',

    # Template: AgentStatusViewTable

    # Template: AgentStatusViewTableNotAnswerd

    # Template: AgentTicketLink
      'Link' => 'Link',
      'Link to' => 'Link do',

    # Template: AgentTicketLocked
      'Ticket locked!' => 'Zgloszenie zablokowane!',
      'Ticket unlock!' => 'Zgloszenie odblokowane!',

    # Template: AgentTicketPrint
      'by' => 'przez',

    # Template: AgentTicketPrintHeader
      'Accounted time' => 'Zarachowany czas',
      'Escalation in' => 'Eskalowane w',

    # Template: AgentUtilSearch
      '(e. g. 10*5155 or 105658*)' => '(np. 10*5155 or 105658*)',
      '(e. g. 234321)' => '(np. 234321)',
      '(e. g. U5150)' => '(np. U5150)',
      'and' => 'i',
      'Customer User Login' => 'Login Klienta',
      'Delete' => 'Usu�',
      'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Pe�ne wyszukiwanie w artykule (np. "Mar*in" or "Baue*")',
      'No time settings.' => 'Ustawienia bez czasu',
      'Profile' => 'Profil',
      'Result Form' => 'Wynik z ',
      'Save Search-Profile as Template?' => 'Zapisz profil wyszukiania jako szablon',
      'Search-Template' => 'Szukaj-szblon',
      'Select' => 'Wybierz',
      'Ticket created' => 'Zg�oszenie utworzone',
      'Ticket created between' => 'Zg�oszenie utworzone pomi�dzy',
      'Ticket Search' => 'Wyszukiwanie zg�oszenia',
      'TicketFreeText' => 'FreeText Zg�oszenia',
      'Times' => 'Czasy',
      'Yes, save it with name' => 'Tak, zapisz to z nazw�',

    # Template: AgentUtilSearchByCustomerID
      'Customer history search' => 'Przeszukiwanie historii klienta',
      'Customer history search (e. g. "ID342425").' => 'Przeszukiwanie historii klienta (np. "ID342425").',
      'No * possible!' => 'Nie u�ywaj "*"!',

    # Template: AgentUtilSearchNavBar
      'Change search options' => 'Zmie� kryteria wyszukiwania',
      'Results' => 'Wyniki',
      'Search Result' => 'Wynik wyszukiwania',
      'Total hits' => 'Wszystkie ods�ony',

    # Template: AgentUtilSearchResult
      '"}","15' => '',

    # Template: AgentUtilSearchResultPrint

    # Template: AgentUtilSearchResultPrintTable
      '"}","30' => '',

    # Template: AgentUtilSearchResultShort

    # Template: AgentUtilSearchResultShortTable

    # Template: AgentUtilSearchResultShortTableNotAnswered

    # Template: AgentUtilTicketStatus
      'All closed tickets' => 'Wszystkie zamkniete zg�oszenia',
      'All open tickets' => 'Wszystkie otwarte zg�oszenia',
      'closed tickets' => 'zamkniete zg�oszenia',
      'open tickets' => 'otwarte zg�oszenia',
      'or' => 'lub',
      'Provides an overview of all' => 'Pozwala obejrzec wszystkie',
      'So you see what is going on in your system.' => 'Dzi�ki temu widzisz co dzieje si� w systemie.',

    # Template: AgentZoomAgentIsCustomer
      'Compose Follow up' => 'Napisz Follow Up',
      'Your own Ticket' => 'Twoje w�asne zg�oszenia',

    # Template: AgentZoomAnswer
      'Compose Answer' => 'Napisz odpowiedz',
      'Contact customer' => 'Skontaktuj si� z klientem',
      'phone call' => 'Telefon',

    # Template: AgentZoomArticle
      'Split' => 'Rozdziel',

    # Template: AgentZoomBody
      'Change queue' => 'Zmie� kolejk�',

    # Template: AgentZoomHead
      'Free Fields' => 'Wolne pola',
      'Print' => 'Drukuj',

    # Template: AgentZoomStatus
      '"}","18' => '',

    # Template: CustomerCreateAccount
      'Create Account' => 'Utw�rz konto',

    # Template: CustomerError
      'Traceback' => '',

    # Template: CustomerFAQArticleHistory
      'Edit' => 'Edytuj',
      'FAQ History' => 'Historia FAQ',

    # Template: CustomerFAQArticlePrint
      'Category' => 'Kategoria',
      'Keywords' => 'S�owa kluczowe',
      'Last update' => 'Ostatnia aktualizacja',
      'Problem' => 'Problem',
      'Solution' => 'Rozwi�zanie',
      'Symptom' => 'Objawy',

    # Template: CustomerFAQArticleSystemHistory
      'FAQ System History' => 'System historii FAQ',

    # Template: CustomerFAQArticleView
      'FAQ Article' => 'Artyku� FAQ',
      'Modified' => 'Modyfikowany',

    # Template: CustomerFAQOverview
      'FAQ Overview' => 'Przegl�d FAQ',

    # Template: CustomerFAQSearch
      'FAQ Search' => 'Wyszukiwanie FAQ',
      'Fulltext' => 'Pe�en tekst',
      'Keyword' => 'S�owa kluczowe',

    # Template: CustomerFAQSearchResult
      'FAQ Search Result' => 'Wynik wtszukiwania FAQ',

    # Template: CustomerFooter
      'Powered by' => 'Oparte na',

    # Template: CustomerHeader
      'Contact' => 'Kontakt',
      'Home' => 'Dom',
      'Online-Support' => 'Serwis Online',
      'Products' => 'Oferta',
      'Support' => 'Serwis',

    # Template: CustomerLogin

    # Template: CustomerLostPassword
      'Lost your password?' => 'Zapomnia�e� has�o?',
      'Request new password' => 'Pro�ba o nowe has�o',

    # Template: CustomerMessage

    # Template: CustomerMessageNew

    # Template: CustomerNavigationBar
      'Create new Ticket' => 'Utw�rz nowe zg�oszenie',
      'FAQ' => 'FAQ',
      'New Ticket' => 'Nowe zg�oszenie',
      'Ticket-Overview' => 'Zg�oszenia - Widok og�lny',
      'Welcome %s' => 'Witaj %s',

    # Template: CustomerPreferencesForm

    # Template: CustomerPreferencesGeneric

    # Template: CustomerPreferencesPassword

    # Template: CustomerStatusView
      'My Tickets' => 'Moje zg�oszenia',

    # Template: CustomerStatusViewTable

    # Template: CustomerTicketZoom

    # Template: CustomerWarning

    # Template: Error
      'Click here to report a bug!' => 'Kliknij tu by zg�osi� b��d!',

    # Template: FAQArticleDelete
      'FAQ Delete' => 'Usu� FAQ',
      'You really want to delete this article?' => 'Czy naprawde chcesz usun�� arytku�',

    # Template: FAQArticleForm
      'Comment (internal)' => 'Komentarz (wewn�trzny)',
      'Filename' => 'Nazwa pliku',
      'Short Description' => 'Kr�tki opis',

    # Template: FAQArticleHistory

    # Template: FAQArticlePrint

    # Template: FAQArticleSystemHistory

    # Template: FAQArticleView

    # Template: FAQCategoryForm
      'FAQ Category' => 'Kategoria FAQ',

    # Template: FAQLanguageForm
      'FAQ Language' => 'J�zyk FAQ',

    # Template: FAQNavigationBar

    # Template: FAQOverview

    # Template: FAQSearch

    # Template: FAQSearchResult

    # Template: FAQStateForm
      'FAQ State' => 'Status FAQ',

    # Template: Footer
      'Top of Page' => 'G�ra strony',

    # Template: Header

    # Template: InstallerBody
      'Create Database' => 'Utw�rz baz�',
      'Drop Database' => 'Usu� baz�',
      'Finished' => 'Zako�czono',
      'System Settings' => 'Ustawienia systemowe',
      'Web-Installer' => 'Instalator WWW',

    # Template: InstallerFinish
      'Admin-User' => 'Administrator',
      'After doing so your OTRS is up and running.' => 'Po pracy. OTRS jest gotowy.',
      'Have a lot of fun!' => '�yczymy du�o zabawy!',
      'Restart your webserver' => 'Zresetuj serwer WWW',
      'Start page' => 'Strona startowa',
      'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' => 'By m�c urzywa� OTRS musisz wykona� nastepuj�c� lini� polece� (Terminal/Pow�oka) jako root.',
      'Your OTRS Team' => 'Tw�ja zesp� OTRS',

    # Template: InstallerLicense
      'accept license' => 'zaakceptuj licencj�',
      'don\'t accept license' => 'nie akceptuj licencji',
      'License' => 'Licencja',

    # Template: InstallerStart
      'Create new database' => 'Utw�rz now� baz�',
      'DB Admin Password' => 'Has�o administratora bazy danych',
      'DB Admin User' => 'U�ytkownik administratora bazy danych',
      'DB Host' => 'Host bazy danych',
      'DB Type' => 'Tym bazy',
      'default \'hot\'' => 'domy�lnie \'hot\'',
      'Delete old database' => 'Usu� star� baz�',
      'next step' => 'Nast�pny krok',
      'OTRS DB connect host' => 'host bazy OTRS',
      'OTRS DB Name' => 'Nazwa bazy OTRS',
      'OTRS DB Password' => 'Has�o do bazy OTRS',
      'OTRS DB User' => 'U�ytkownik do bazy OTRS',
      'your MySQL DB should have a root password! Default is empty!' => 'twoje has�o do bazy MySQL powinno mie� has�o roota ! Domy�lnie jest puste!',

    # Template: InstallerSystem
      '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' => '(Sprawd� rekord MX u�ywanego adresu email podczas tworzenia odpowiedzi. Nie u�ywaj sprawdzania rekordu MX jesli Twoja maszyna jest za lini� dial-up $!)',
      '(Email of the system admin)' => '(E-Mail do Administratora Systemu)',
      '(Full qualified domain name of your system)' => '(Pe�na z�o�ona nazwa domeny)',
      '(Logfile just needed for File-LogModule!)' => '(Plik logu potrzebny tylko dla File-LogModule!!)',
      '(The identify of the system. Each ticket number and each http session id starts with this number)' => '(Identyfikacja systemu. Ka�dy numer zg�oszenia i ka�da sesja http zaczyna si� od tego numeru)',
      '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' => '(Identyfikator zg�oszenia. Niekt�rzy chc� mie� np. \'Ticket#\', \'Call#\' or \'MyTicket#\')',
      '(Used default language)' => '(U�ywany domy�lny j�zyk)',
      '(Used log backend)' => '(U�ywany log backend)',
      '(Used ticket number format)' => '(U�ywany format numeru zg�oszenia)',
      'CheckMXRecord' => 'Sprawd� rekord MX',
      'Default Charset' => 'Domy�lny charset',
      'Default Language' => 'Domy�lny j�zyk',
      'Logfile' => 'Plik logu',
      'LogModule' => 'Modu� logowania',
      'Organization' => 'Organizacja',
      'System FQDN' => 'Pe�na domena systemu FQDN',
      'SystemID' => 'ID Systemu',
      'Ticket Hook' => 'Identyfikator zg�oszenia',
      'Ticket Number Generator' => 'Generator numerow zg�oszen',
      'Use utf-8 it your database supports it!' => 'U�yj utf-8 twoja baza to wspiera!',
      'Webfrontend' => 'Interfejs webowy',

    # Template: Login

    # Template: LostPassword

    # Template: NoPermission
      'No Permission' => 'Brak dost�pu',

    # Template: Notify
      'Info' => 'Info',

    # Template: PrintFooter
      'URL' => 'URL',

    # Template: PrintHeader
      'printed by' => 'wydrukowane przez',

    # Template: QueueView
      'All tickets' => 'Wszystkie zg�oszenia',
      'Page' => 'Strona',
      'Queues' => 'Kolejki',
      'Tickets available' => 'Dost�pne zg�oszenia',
      'Tickets shown' => 'Pokazane zg�oszenia',

    # Template: SystemStats
      'Graphs' => 'Wykresy',

    # Template: Test
      'OTRS Test Page' => 'OTRS Strona testowa',

    # Template: TicketEscalation
      'Ticket escalation!' => 'Eskalacja zg�oszenia!',

    # Template: TicketView

    # Template: TicketViewLite
      'Add Note' => 'Dodaj notatke',

    # Template: Warning

    # Misc
      '(E-Mail of the system admin)' => '(Adres email Administratora)',
      'A message should have a From: recipient!' => 'Wiadomo�c musi zawiera� wype�nione pole Od: !',
      'AgentFrontend' => 'Frontend Agenta',
      'Article free text' => 'Dowolny tekst artyku�u',
      'Backend' => 'Backend',
      'BackendMessage' => 'Komunikat Backend',
      'Bottom of Page' => 'D�l strony',
      'Charset' => 'Charset',
      'Charsets' => 'Charsety',
      'Closed' => 'Zamkni�te',
      'Create' => 'Utworz',
      'CustomerUser' => 'Klient',
      'Fulltext search' => 'Przeszukiwanie pe�notekstowe',
      'Fulltext search (e. g. "Mar*in" or "Baue*" or "martin+hallo")' => 'Przeszukiwanie pe�noteksotwe (np. "Tom*sz" lub "Jane*" lub "janek+rumianek")',
      'Handle' => 'Handle',
      'In Queue' => 'W kolejce',
      'New state' => 'Nowy status',
      'New ticket via call.' => 'Nowe zg�oszenie telefoniczne.',
      'New user' => 'Nowy u�ytkownik',
      'Screen after new phone ticket' => 'Strona po dodaniu nowego zg�oszenia telefonicznego',
      'Search in' => 'Szukaj w',
      'Select your screen after creating a new ticket via PhoneView.' => 'Wybierz strone po dodaniu nowego zg�oszenia telefonicznego',
      'Set customer id of a ticket' => 'Ustaw ID klienta dla zg�oszenia',
      'Show all' => 'Poka� wszystko',
      'System Charset Management' => 'Konfiguracja systemowego charsetu',
      'System Language Management' => 'Konfiguracja j�zyka systemu',
      'Ticket free text' => 'Dowolny tekst zg�oszenia',
      'Ticket limit:' => 'Limit zg�oszenia',
      'Time till escalation' => 'Czas do eskalacji',
      'With Priority' => 'Z priorytetem',
      'With State' => 'Ze statusem',
      'You have to be in the admin group!' => 'Musisz nale�e� do grupy Admin!',
      'You have to be in the stats group!' => 'Musisz nale�e� do grupy Stats!',
      'You need a email address (e. g. customer@example.com) in From:!' => 'Musisz posiadac email (np. klient@przykladowafirma.com.pl) w polu Od:!',
      'auto responses set' => 'ustawione AutoOdpowiedzi',
      'invalid-temporarily' => 'Tymczasowo nieu�ywane',
      'search' => 'szukaj',
      'search (e. g. 10*5155 or 105658*)' => 'szukaj (np. "10*5155" lub "105658*")',
      'store' => 'Zachowaj',
      'tickets' => 'Zg�oszenia',
      'valid' => 'U�ywane',
    );

    # $$STOP$$

    $Self->{Translation} = \%Hash;
}
# --
1;
