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
      'Bug Report' => 'Zglos b³±d',
      'Cancel' => 'Anuluj',
      'change' => 'zmieñ',
      'Change' => 'Zmieñ',
      'change!' => 'Zmieñ!',
      'click here' => 'kliknij tutaj',
      'Comment' => 'Komentarz',
      'Customer' => 'Klient',
      'customer' => 'klient',
      'Customer Info' => 'Klient Info',
      'day' => 'dzieñ',
      'day(s)' => 'dzieñ(dni)',
      'days' => 'dni',
      'description' => 'opis',
      'Description' => 'Opis',
      'Dispatching by email To: field.' => 'Przekazywanie na podstawie pola DO:',
      'Dispatching by selected Queue.' => 'Przekazywanie na podstawie kolejki.',
      'Don\'t show closed Tickets' => 'Nie pokazuj zamkniêtych zg³oszeñ',
      'Don\'t work with UserID 1 (System account)! Create new users!' => 'Nie u¿ywaj u¿ytkownika z UserID 1 (System Account)! Stwórz nowych u¿ytkowników!',
      'Done' => 'Zrobione',
      'end' => 'koniec',
      'Error' => 'B³±d',
      'Example' => 'Przyk³ad',
      'Examples' => 'Przyk³ady',
      'Facility' => 'Udogodnienie',
      'FAQ-Area' => 'FAQ',
      'Feature not active!' => 'Funkcja nie aktywna!',
      'go' => 'Start',
      'go!' => 'Start!',
      'Group' => 'Grupa',
      'Hit' => 'Ods³ona',
      'Hits' => 'Ods³on',
      'hour' => 'godzin',
      'hours' => 'godziny',
      'Ignore' => 'Ignoruj',
      'invalid' => 'Nieu¿ywane',
      'Invalid SessionID!' => 'Niepoprawne SessionID!',
      'Language' => 'Jêzyk',
      'Languages' => 'Jêzyki',
      'last' => 'ostatni',
      'Line' => 'Linia',
      'Lite' => 'Lite',
      'Login failed! Your username or password was entered incorrectly.' => 'Logowanie niepoprawne! Twoj u¿ytkownik lub has³o zosta³y wpisane niepoprawnie.',
      'Logout successful. Thank you for using OTRS!' => 'Wylogowanie zakoñczone! Dziekujemy za u¿ywanie OTRS!',
      'Message' => 'Wiadomo¶æ',
      'minute' => 'minuta',
      'minutes' => 'minuty',
      'Module' => 'Modu³',
      'Modulefile' => 'Plik Modu³u',
      'month(s)' => 'miesi±c(e)',
      'Name' => 'Nazwa',
      'New Article' => 'Nowy Artyku³',
      'New message' => 'Nowa wiadomo¶æ',
      'New message!' => 'Nowa wiadomo¶æ!',
      'No' => 'Nie',
      'no' => 'nie',
      'No entry found!' => 'Danych nie odnaleziono!',
      'No suggestions' => 'Brak podpowiedzi',
      'none' => 'brak danych',
      'none - answered' => 'brak - odpowiedziane',
      'none!' => 'brak!',
      'Normal' => 'Normalny',
      'Off' => 'Wy³±czone',
      'off' => 'wy³±czone',
      'On' => 'W³±czone',
      'on' => 'w³±czone',
      'Password' => 'Has³o',
      'Pending till' => 'Oczekuje do',
      'Please answer this ticket(s) to get back to the normal queue view!' => 'Proszê odpowiedz na to zg³oszenie, by móc powróciæ do zwyk³ego widoku kolejki zg³oszeñ!',
      'Please contact your admin' => 'Skontaktuj siê z Administratorem',
      'please do not edit!' => 'nie edytowaæ!',
      'Please go away!' => 'Proszê odejdz!',
      'possible' => 'mo¿liwe',
      'Preview' => 'Podgl±d',
      'QueueView' => 'Widok kolejki',
      'reject' => 'odrzuæ',
      'replace with' => 'zamieñ z',
      'Reset' => 'Resetuj',
      'Salutation' => 'Zwrot grzeczno¶ciowy',
      'Session has timed out. Please log in again.' => 'Sesja wygas³a. Zaloguj siê ponownie',
      'Show closed Tickets' => 'Poka¿ zamkniête zg³oszenia',
      'Signature' => 'Podpis',
      'Sorry' => 'Niestety',
      'Stats' => 'Statystyki',
      'Subfunction' => 'Funkcja podrzêdna',
      'submit' => 'wy¶lij',
      'submit!' => 'wy¶lij!',
      'system' => 'System',
      'Take this User' => 'U¿yj tego u¿ytkownika',
      'Text' => 'Tekst',
      'The recommended charset for your language is %s!' => 'Sugerowany charset dla Twojego jêzyka to %s!',
      'Theme' => 'Schemat',
      'There is no account with that login name.' => 'Nie istnieje konto z takim loginem.',
      'Timeover' => 'Czas min±³',
      'To: (%s) replaced with database email!' => 'Do: (%s) zamieniony z emailem bazy',
      'top' => 'góra',
      'update' => 'aktualizuj',
      'Update' => 'Aktualizuj',
      'update!' => 'aktualizuj!',
      'User' => 'U¿ytkownik',
      'Username' => 'Nazwa u¿ytkownika',
      'Valid' => 'U¿ycie',
      'Warning' => 'Ostrze¿enia',
      'week(s)' => 'tydzieñ(tygodni)',
      'Welcome to OTRS' => 'Witamy w OTRS',
      'Word' => 'S³owo',
      'wrote' => 'napisa³',
      'year(s)' => 'rok(lat)',
      'yes' => 'tak',
      'Yes' => 'Tak',
      'You got new message!' => 'Masz now± wiadomo¶æ!',
      'You have %s new message(s)!' => 'Masz %s nowych wiadomo¶ci!',
      'You have %s reminder ticket(s)!' => 'Masz %s przypomnieñ!',

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
      'Oct' => 'Pa¼',
      'Sep' => 'Wrz',

    # Template: AAAPreferences
      'Closed Tickets' => 'Zamkniête zg³oszenia',
      'Custom Queue' => 'Osobista kolejka',
      'Follow up notification' => 'Kontynuuj±c powiadomienie',
      'Frontend' => 'Frontend',
      'Mail Management' => 'Zarz±dzanie poczt±',
      'Max. shown Tickets a page in Overview.' => 'Max. ilo¶æ pokazywanych zg³oszeñ na stronie Przegl±d',
      'Max. shown Tickets a page in QueueView.' => 'Max. ilo¶æ pokazywanych zg³oszeñ na stronie Widoku Kolejki',
      'Move notification' => 'Przesuñ powiadomienie',
      'New ticket notification' => 'Nowe powiadomienie o zg³oszeniu',
      'Other Options' => 'Inne opcje',
      'PhoneView' => 'Widok telefonów',
      'Preferences updated successfully!' => 'Ustawienia zapisano pomy¶lnie!',
      'QueueView refresh time' => 'Czas od¶wierzania widoku kolejki',
      'Screen after new ticket' => 'Strona po dodaniu zg³oszenia',
      'Select your default spelling dictionary.' => 'Wybierz domy¶lny s³ownik.',
      'Select your frontend Charset.' => 'Wybierz charset dla Twojej pracy w OTRS.',
      'Select your frontend language.' => 'Wybierz jêzyk.',
      'Select your frontend QueueView.' => 'Wybierz widok kolejki.',
      'Select your frontend Theme.' => 'Wybierz schemat dla OTRS.',
      'Select your QueueView refresh time.' => 'Wybierz czas od¶wierzania widoku kolejki.',
      'Select your screen after creating a new ticket.' => 'Wybierz stronê po dodaniu zg³oszenia',
      'Send me a notification if a customer sends a follow up and I\'m the owner of this ticket.' => 'Wy¶lij mi wiadomo¶æ gdy klient odpowie na zg³oszenie, a ja jestem w³a¶cicielem tego zg³oszenia.',
      'Send me a notification if a ticket is moved into a custom queue.' => 'Wy¶lij mi wiadomo¶æ gdy zg³oszenie zostanie przesuniete do osobistej kolejki.',
      'Send me a notification if a ticket is unlocked by the system.' => 'Wy¶lij mi wiadomo¶æ gdy zg³oszenie zostanie odblokowane przez system.',
      'Send me a notification if there is a new ticket in my custom queues.' => 'Wy¶lij mi wiadomo¶æ gdy pojawi siê nowe zg³osznie w moich kolejkach.',
      'Show closed tickets.' => 'Poka¿ zamkniête zg³oszenia.',
      'Spelling Dictionary' => 'S³ownik',
      'Ticket lock timeout notification' => 'Wiadomo¶æ o przekroczonym czasie dla zablokowanych zg³oszeñ',
      'TicketZoom' => 'Zobacz zg³oszenie',

    # Template: AAATicket
      '1 very low' => '1 bardzo niski',
      '2 low' => '2 niski',
      '3 normal' => '3 normalny',
      '4 high' => '4 wysoki',
      '5 very high' => '5 bardzo wysoki',
      'Action' => 'Akcja',
      'Age' => 'Wiek',
      'Article' => 'Artyku³',
      'Attachment' => 'Za³±cznik',
      'Attachments' => 'Za³±czniki',
      'Bcc' => 'Bcc',
      'Bounce' => 'Odbij',
      'Cc' => 'Cc',
      'Close' => 'Zamknij',
      'closed successful' => 'zamkniête z powodzeniem',
      'closed unsuccessful' => 'zamkniête bez powodzenia',
      'Compose' => 'Stwórz',
      'Created' => 'Utworzone',
      'Createtime' => 'Utworzone o',
      'email' => 'E-Mail',
      'eMail' => 'E-Mail',
      'email-external' => 'E-Mail zewnêtrzny',
      'email-internal' => 'E-Mail wewnêtrzny',
      'Forward' => 'Prze¶lij dalej',
      'From' => 'Od',
      'high' => 'wysoki',
      'History' => 'Historia',
      'If it is not displayed correctly,' => 'Je¶li nie jest wy¶wietlane poprawnie,',
      'lock' => 'zablokowane',
      'Lock' => 'Zablokowane',
      'low' => 'niski',
      'Move' => 'Przesuñ',
      'new' => 'nowe',
      'normal' => 'normalny',
      'note-external' => 'Notatka zewnêtrzna',
      'note-internal' => 'Notatka wewnêtrzna',
      'note-report' => 'Notatka raportuj±ca',
      'open' => 'otwarte',
      'Owner' => 'W³a¶ciciel',
      'Pending' => 'Oczekuj±ce',
      'pending auto close+' => 'oczekuj±ce na automatyczne zamkniêcie+',
      'pending auto close-' => 'oczekujace na automatyczne zamkniêcie-',
      'pending reminder' => 'przypomnienie',
      'phone' => 'Telefon',
      'plain' => 'czyste',
      'Priority' => 'Priorytet',
      'Queue' => 'Kolejka',
      'removed' => 'usuniête',
      'Sender' => 'Nadawca',
      'sms' => 'SMS',
      'State' => 'Status',
      'Subject' => 'Temat',
      'This is a' => 'To jest',
      'This is a HTML email. Click here to show it.' => 'To jest email w formacie HTML. Kliknij tutaj by go przeczytaæ.',
      'This message was written in a character set other than your own.' => 'Ta wiadomo¶æ zosta³a napisana z u¿yciem zestawu znaków innego ni¿ Twój.',
      'Ticket' => 'Zg³oszenie',
      'Ticket "%s" created!' => 'Zg³oszenie "%s" utworzone',
      'To' => 'Do',
      'to open it in a new window.' => 'by otworzyæ w oddzielnym oknie',
      'unlock' => 'odblokuj',
      'Unlock' => 'Odblokuj',
      'very high' => 'bardzo wysoki',
      'very low' => 'bardzo niski',
      'View' => 'Widok',
      'webrequest' => 'zg³oszenie z WWW',
      'Zoom' => 'Poka¿',

    # Template: AAAWekDay
      'Fri' => 'Ptk',
      'Mon' => 'Pnd',
      'Sat' => 'Sob',
      'Sun' => 'Ndz',
      'Thu' => 'Czw',
      'Tue' => 'Wtr',
      'Wed' => '¦rd',

    # Template: AdminAttachmentForm
      'Add' => '',
      'Attachment Management' => 'Zarz±dzanie za³±cznikami',

    # Template: AdminAutoResponseForm
      'Add auto response' => 'Dodaj automatyczn± odpowiedz',
      'Auto Response From' => 'Automatyczna odpowied¼ od',
      'Auto Response Management' => 'Zarz±dzanie automatycznymi odpowiedziami',
      'Change auto response settings' => 'Zmieñ ustawienia automatycznych odpowiedzi',
      'Note' => 'Notatka',
      'Response' => 'Odpowiedz',
      'to get the first 20 character of the subject' => 'by wstawiæ pierwsze 20 znaków tematu',
      'to get the first 5 lines of the email' => 'by wstawiæ 5 pierwszych linii wiadomo¶ci',
      'to get the from line of the email' => 'by wstawiæ pole Od wiadomo¶ci',
      'to get the realname of the sender (if given)' => 'by wstawiæ prawdziwe imiê i nazwisko klienta (je¶li podano)',
      'to get the ticket id of the ticket' => 'by wstawiæ ID zg³oszenia',
      'to get the ticket number of the ticket' => 'by wstawiæ numer zg³oszenia',
      'Type' => 'Typ',
      'Useable options' => 'U¿yteczne opcje',

    # Template: AdminCustomerUserForm
      'Customer User Management' => 'Konfiguracja u¿ytkownikow',
      'Customer user will be needed to to login via customer panels.' => 'Klient bedzie musia³ logowac siê poprzez interfejs klienta.',
      'Select source:' => 'Wybierz ¼ród³o',
      'Source' => '¬ród³o',

    # Template: AdminCustomerUserGeneric

    # Template: AdminCustomerUserGroupChangeForm
      'Change %s settings' => 'Zmieñ %s ustawienia',
      'Customer User <-> Group Management' => 'Klient <-> Zarz±dzanie Grupami',
      'Full read and write access to the tickets in this group/queue.' => 'Pe³en dostêp do odczytu i zapisu zg³oszeñ w tej grupie/kolejce',
      'If nothing is selected, then there are no permissions in this group (tickets will not be available for the user).' => 'Je¶li nic nie zaznaczono, nie ma uprawnien w tej grupie (zg³oszenia nie bêd± dostêpne dla tego u¿ytkownika',
      'Permission' => 'Pozwolenie',
      'Read only access to the ticket in this group/queue.' => 'Uprawnienia tylko do odczytu zdag³oszeñ w tej kolejce/grupie',
      'ro' => 'ro',
      'rw' => 'rw',
      'Select the user:group permissions.' => 'Wybierz uprawnienia dla u¿ytkownika:grupy',

    # Template: AdminCustomerUserGroupForm
      'Change user <-> group settings' => 'Zmien u¿ytkownika <-> ustawienia grupy',

    # Template: AdminCustomerUserPreferencesGeneric

    # Template: AdminEmail
      'Admin-Email' => 'Email Administratora',
      'Body' => 'Tre¶æ',
      'OTRS-Admin Info!' => 'Informacja od Administratora OTRS!',
      'Recipents' => 'Adresaci',
      'send' => 'Wy¶lij',

    # Template: AdminEmailSent
      'Message sent to' => 'Wiadomo¶æ wys³ana do',

    # Template: AdminGroupForm
      'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...).' => 'Stworz nowa grupê, by móc zarz±dzaæ dostêpem dla ró¿nych grup u¿ytkownikow (np. Serwis, Sprzeda¿, Zamówienia itp...).',
      'Group Management' => 'Zarz±dzanie grupami',
      'It\'s useful for ASP solutions.' => 'Pomocne w rozwiazanich ASP.',
      'The admin group is to get in the admin area and the stats group to get stats area.' => 'Grupa Admin pozwala dostaæ siê do sekcji Administracji systemu, Stats umo¿liwia przegl±danie statystyk.',

    # Template: AdminLog
      'System Log' => 'Log Systemu',

    # Template: AdminNavigationBar
      'AdminEmail' => 'Email od Admina',
      'Attachment <-> Response' => 'Za³±cznik <-> Odpowiedz',
      'Auto Response <-> Queue' => 'AutoOdpowied¼ <-> Kolejka',
      'Auto Responses' => 'AutoOdpowiedzi',
      'Customer User' => 'Klienci',
      'Customer User <-> Groups' => 'Klienci <-> Grupy',
      'Email Addresses' => 'Adresy Email',
      'Groups' => 'Grupy',
      'Logout' => 'Wyloguj',
      'Misc' => 'Ró¿ne',
      'Notifications' => 'Powiadomienia',
      'PostMaster Filter' => 'Filtr PostMaster',
      'PostMaster POP3 Account' => 'PostMaster Konto POP3',
      'Responses' => 'Odpowiedzi',
      'Responses <-> Queue' => 'Odpowiedzi <-> Kolejka',
      'Select Box' => 'Zapytanie SQL',
      'Session Management' => 'Zarz±dzanie sesjami',
      'Status' => 'Status',
      'System' => 'System',
      'User <-> Groups' => 'U¿ytkownik <-> Grupy',

    # Template: AdminNotificationForm
      'Config options (e. g. &lt;OTRS_CONFIG_HttpType&gt;)' => 'Opcje konfiguracyjne (np.  &lt;OTRS_CONFIG_HttpType&gt;)',
      'Notification Management' => 'Zarz±dzanie powiadomieniami',
      'Notifications are sent to an agent or a customer.' => 'Powiadomienia s± wysy³ane do agentów lub klientów',
      'Options of the current customer user data (e. g. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)' => 'Opcje dla aktualnego klienta (np. &lt;OTRS_CUSTOMER_DATA_USERFIRSTNAME&gt;)',
      'Options of the current user who requested this action (e. g. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)' => 'Opcje dla aktualnego u¿ytkownika (np. &lt;OTRS_CURRENT_USERFIRSTNAME&gt;)',
      'Ticket owner options (e. g. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)' => 'Opcje w³a¶cieciala zg³oszenia (np. &lt;OTRS_OWNER_USERFIRSTNAME&gt;)',

    # Template: AdminPOP3Form
      'All incoming emails with one account will be dispatched in the selected queue!' => 'Wszystkie przychodz±ce emaile na jedno konto bêd± umieszczone w zaznacznej kolejce!',
      'Dispatching' => 'Przekazanie',
      'Host' => 'Host',
      'If your account is trusted, the x-otrs header (for priority, ...) will be used!' => 'Je¶li Twoje konto jest zaufane, zostanie u¿yty nag³ówek x-otrs (dla priorytetu)!',
      'Login' => 'Login',
      'POP3 Account Management' => 'Zarz±dzanie kontem POP3',
      'Trusted' => 'Zaufane',

    # Template: AdminPostMasterFilterForm
      'Match' => 'Pasuje',
      'PostMasterFilter Management' => 'Zarz±dzanie filtrem dla PostMaster',
      'Set' => 'Ustaw',

    # Template: AdminQueueAutoResponseForm
      'Queue <-> Auto Response Management' => 'Kolejka <-> Zarz±dzanie AutoOdpowiedziami',

    # Template: AdminQueueAutoResponseTable

    # Template: AdminQueueForm
      '0 = no escalation' => '0 = brak eskalacji',
      '0 = no unlock' => '0 = bez odblokowania',
      'Customer Move Notify' => 'Powiadomienie klienta o przesunieciu',
      'Customer Owner Notify' => 'Powiadomienie klienta o zmianie w³a¶ciciela',
      'Customer State Notify' => 'Powiadomienie klienta o zmianie statusu',
      'Escalation time' => 'Czas eskalacji',
      'Follow up Option' => 'Opcja Follow Up',
      'If a ticket is closed and the customer sends a follow up the ticket will be locked for the old owner.' => 'Je¶li zg³oszenie by³o zamkniête, a klient przy¶le na nie Follow Up, wtedy zg³oszenie zostanie zablokowane w kolejce starego w³a¶ciciela.',
      'If a ticket will not be answered in thos time, just only this ticket will be shown.' => 'Je¶li nie zostanie udzielona odpowied¼ na zg³oszenie w podanym czasie, wtedy tylko to zg³oszenie bêdzie widoczne w kolejce.',
      'If an agent locks a ticket and he/she will not send an answer within this time, the ticket will be unlock automatically. So the ticket is viewable for all other agents.' => 'Je¶li agent zablokuje zg³oszenie, a nastêpnie nie odpowie w ciagu wskazanego czasu, wtedy zg³oszenie zostanie automtycznie odblokowane. Dzieki temu pozostali agenci bêd± mogli je zobaczyæ.',
      'Key' => 'Klucz',
      'OTRS sends an notification email to the customer if the ticket is moved.' => 'OTRS wy¶le emaila z informacj± do klienta gdy zg³oszenie zostanie przesuniête.',
      'OTRS sends an notification email to the customer if the ticket owner has changed.' => 'OTRS wy¶le emaila z informacj± do klienta, gdy zmieni siê w³a¶ciciel zg³oszenia.',
      'OTRS sends an notification email to the customer if the ticket state has changed.' => 'OTRS wy¶le emaila z informacj± do klienta, gdy zmieni siê status zg³oszenia.',
      'Queue Management' => 'Zarz±dzanie kolejkami',
      'Sub-Queue of' => 'Kolejka podrzêdna',
      'Systemaddress' => 'Adres systemowy',
      'The salutation for email answers.' => 'Zwrot grzeczno¶ciowy dla odpowiedzi emailowych.',
      'The signature for email answers.' => 'Podpis dla odpowiedzi emailowych.',
      'Ticket lock after a follow up' => 'Zg³oszenie zablokowane po odpowiedzi (FU)',
      'Unlock timeout' => 'Timeout odblokowania',
      'Will be the sender address of this queue for email answers.' => 'Bêdzie adres nadawcy tej kolejki dla odpowiedzi wysy³anych emailem.',

    # Template: AdminQueueResponsesChangeForm
      'Std. Responses <-> Queue Management' => 'Standardowe odpowiedzi <-> Zarz±dzanie kolejkami',

    # Template: AdminQueueResponsesForm
      'Answer' => 'Odpowied¼ (answer)',
      'Change answer <-> queue settings' => 'Zmieñ odpowied¼ (answer) <-> Ustawienia kolejki',

    # Template: AdminResponseAttachmentChangeForm
      'Std. Responses <-> Std. Attachment Management' => 'Standardowa odpowied¼ <-> Standardowe za³±czniki',

    # Template: AdminResponseAttachmentForm
      'Change Response <-> Attachment settings' => 'Zmieñ odpowied¼ <-> Ustawienia za³±cznikow',

    # Template: AdminResponseForm
      'A response is default text to write faster answer (with default text) to customers.' => 'Odpowied¼ to domy¶lny tekst wstawiany do odpowiedzi klientowi, dzieki czemu agent mo¿e szybciej odpowiedzieæ na zg³oszenie.',
      'Don\'t forget to add a new response a queue!' => 'Nie zapomnij dodaæ nowej odpowiedzi do kolejki!',
      'Next state' => 'Nastêpny status',
      'Response Management' => 'Zarz±dzanie Odpowiedziami',
      'The current ticket state is' => 'Aktualny status zg³oszenia to',

    # Template: AdminSalutationForm
      'customer realname' => 'Prawdziwe dane klienta',
      'for agent firstname' => 'dla imienia agenta',
      'for agent lastname' => 'dla nazwiska agenta',
      'for agent login' => 'dla loginu agenta',
      'for agent user id' => 'dla ID u¿ytkownika agenta',
      'Salutation Management' => 'Zarz±dzanie zwrotami grzecznosciowymi',

    # Template: AdminSelectBoxForm
      'Max Rows' => 'Maksymalna liczba wierszy',

    # Template: AdminSelectBoxResult
      'Limit' => 'Limit',
      'Select Box Result' => 'Wyniki Zapytania',
      'SQL' => 'SQL',

    # Template: AdminSession
      'Agent' => 'Agent',
      'kill all sessions' => 'Zamknij wszystkie sesje',
      'Overview' => 'Przegl±d',
      'Sessions' => 'Sesje',
      'Uniq' => 'Unikalny',

    # Template: AdminSessionTable
      'kill session' => 'Zamknij sesje',
      'SessionID' => 'ID Sesji',

    # Template: AdminSignatureForm
      'Signature Management' => 'Zarz±dzanie podpisami',

    # Template: AdminStateForm
      'See also' => 'Zobacz równie¿',
      'State Type' => 'Typ statusu',
      'System State Management' => 'Zarz±dzanie statusami',
      'Take care that you also updated the default states in you Kernel/Config.pm!' => 'Zadbaj o uaktualnienie stanów w swoim Kernel/Config.pm!',

    # Template: AdminSystemAddressForm
      'All incoming emails with this "Email" (To:) will be dispatched in the selected queue!' => 'Wszystkie wiadomo¶ci przys³ane na ten adres w polu (Do:) zostan± umieszczone w tej kolejce.',
      'Email' => 'E-Mail',
      'Realname' => 'Prawdziwe Imiê i Nazwisko',
      'System Email Addresses Management' => 'Zarz±dzanie adresem email systemu',

    # Template: AdminUserForm
      'Don\'t forget to add a new user to groups!' => 'Nie zapomnij dodaæ u¿ytkownika do grup!',
      'Firstname' => 'Imiê',
      'Lastname' => 'Nazwisko',
      'User Management' => 'Zarz±dzanie U¿ytkownikami',
      'User will be needed to handle tickets.' => 'U¿ytkownik bedzie niezbêdny do obslugi zg³oszenia.',

    # Template: AdminUserGroupChangeForm
      'create' => 'utwórz',
      'move_into' => 'przenie¶ do',
      'owner' => 'w³a¶ciciel',
      'Permissions to change the ticket owner in this group/queue.' => 'Uprawnienia do zmiany w³a¶ciciala zg³oszenia w tej grupie/kolejce.',
      'Permissions to change the ticket priority in this group/queue.' => 'Uprawnienia do zmiany priorytetu zg³oszenia w tej grupie/kolejce.',
      'Permissions to create tickets in this group/queue.' => 'Uprawnienia do tworzenia zg³oszeñ w tej grupie/kolejce',
      'Permissions to move tickets into this group/queue.' => 'Uprawnienia do przenoszenia zg³oszeñ do tej grupy/kolejki',
      'priority' => 'priorytet',
      'User <-> Group Management' => 'U¿ytkownik <-> Zarz±dzanie grupami',

    # Template: AdminUserGroupForm

    # Template: AdminUserPreferencesGeneric

    # Template: AgentBook
      'Address Book' => 'Ksi±¿ka Adresowa',
      'Discard all changes and return to the compose screen' => 'Anuluj wszystkie zmiany i powróæ do ekranu edycji',
      'Return to the compose screen' => 'Powróæ do ekranu edycji',
      'Search' => 'Szukaj',
      'The message being composed has been closed.  Exiting.' => 'Wiadomo¶æ edytowana zosta³a zamkniêta.  Wychodze.',
      'This window must be called from compose window' => 'To okno musi byæ wywolane z okna edycji',

    # Template: AgentBounce
      'A message should have a To: recipient!' => 'Wiadomo¶æ musi zawierac informacje w polu Do: (odbiorca)!',
      'Bounce ticket' => 'Odbij zg³oszenie',
      'Bounce to' => 'Odbij do',
      'Inform sender' => 'Powiadom nadawce',
      'Next ticket state' => 'Nastêpny status zg³oszenia',
      'Send mail!' => 'Wiadomo¶æ wys³ana!',
      'You need a email address (e. g. customer@example.com) in To:!' => 'Wymagany adres E-Mail (np. customer@example.com) w polu Do:!' ,
      'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further informations.' => 'Twoja wiadomo¶æ o zg³oszeniu numer: "<OTRS_TICKET>" zosta³a przekazana na adres "<OTRS_BOUNCE_TO>" . Prosimy kontaktowaæ siê pod tym adresem we wszystkich sprawach dotycz±cych tego zg³oszenia.',

    # Template: AgentClose
      ' (work units)' => ' (jednostek roboczych)',
      'A message should have a body!' => 'Wiadomo¶æ powinna zawieraæ tre¶æ!',
      'A message should have a subject!' => 'Wiadomo¶æ musi posiadac temat!',
      'Close ticket' => 'Zamknij zg³oszenie',
      'Close type' => 'Typ zamkniêcia',
      'Close!' => 'Zamknij!',
      'Note Text' => 'Tekst notatki',
      'Note type' => 'Typ notatki',
      'Options' => 'Opcje',
      'Spell Check' => 'Sprawd¼ poprawno¶æ',
      'Time units' => 'Jednostek czasu',
      'You need to account time!' => 'Musisz zaraportowaæ czas!',

    # Template: AgentCompose
      'A message must be spell checked!' => 'Wiadomo¶æ musi zostaæ sprawdzona s³ownikiem!',
      'Attach' => 'Do³±cz',
      'Compose answer for ticket' => 'Edytuj odpowied¼ na zg³oszenie',
      'for pending* states' => 'oczekuj±ce* statusy',
      'Is the ticket answered' => 'Czy zg³oszenie zawiera odpowiedz',
      'Pending Date' => 'Data oczekiwania',

    # Template: AgentCustomer
      'Back' => 'Powrót',
      'Change customer of ticket' => 'Zmieñ klienta dla zg³oszenia',
      'CustomerID' => 'ID klienta#',
      'Search Customer' => 'Szukaj klienta',
      'Set customer user and customer id of a ticket' => 'Wska¿ klienta i ID klienta dla zg³oszenia',

    # Template: AgentCustomerHistory
      'All customer tickets.' => 'Wszystkie zg³oszenia klienta',
      'Customer history' => 'Historia klienta',

    # Template: AgentCustomerMessage
      'Follow up' => '',

    # Template: AgentCustomerView
      'Customer Data' => 'Data klienta',

    # Template: AgentEmailNew
      'All Agents' => 'Wszyscy Agenci',
      'Clear From' => 'Wyczy¶æ pole Od:',
      'Compose Email' => 'Napisz E-Mail',
      'Lock Ticket' => 'Zablokój zg³oszenie',
      'new ticket' => 'nowe zg³oszenie',

    # Template: AgentForward
      'Article type' => 'Typ artyku³u',
      'Date' => 'Data',
      'End forwarded message' => 'Koniec przekazanej wiadomo¶ci',
      'Forward article of ticket' => 'Przeka¿ artyku³ zg³oszenia',
      'Forwarded message from' => 'Wiadomo¶æ przekazana przez',
      'Reply-To' => 'Odpowied¼ do',

    # Template: AgentFreeText
      'Change free text of ticket' => 'Zmieñ free text zg³oszenia',
      'Value' => 'Warto¶æ',

    # Template: AgentHistoryForm
      'History of' => 'Historia',

    # Template: AgentMailboxNavBar
      'All messages' => 'Wszysktie wiadomo¶ci',
      'down' => 'dó³',
      'Mailbox' => 'Skrzynka',
      'New' => 'Nowe',
      'New messages' => 'Nowe wiadomo¶ci',
      'Open' => 'Otwarte',
      'Open messages' => 'Otwarte wiadomo¶ci',
      'Order' => 'Porz±dek',
      'Pending messages' => 'Oczekuj±ce wiadomo¶ci',
      'Reminder' => 'Przypomnienie',
      'Reminder messages' => 'Tekst prztpomnienia',
      'Sort by' => 'Pososrtowano wedlug',
      'Tickets' => 'Zg³oszenia',
      'up' => 'góra',

    # Template: AgentMailboxTicket
      '"}' => '',
      '"}","14' => '',

    # Template: AgentMove
      'Move Ticket' => 'Przesuñ zg³oszenie',
      'New Owner' => 'Nowy W³a¶ciciel',
      'New Queue' => 'Nowa kolejka',
      'Previous Owner' => 'Poprzedni W³a¶ciciel',
      'Queue ID' => 'ID Kolejki',

    # Template: AgentNavigationBar
      'Locked tickets' => 'zablokowane zg³oszenia',
      'new message' => 'nowa wiadomo¶æ',
      'Preferences' => 'Ustawienia',
      'Utilities' => 'Narzêdzia',

    # Template: AgentNote
      'Add note to ticket' => 'Dodaj notatkê do zg³oszenia',
      'Note!' => 'Notatka!',

    # Template: AgentOwner
      'Change owner of ticket' => 'Zmieñ wla¶ciciela zg³oszenia',
      'Message for new Owner' => 'Wiadomo¶æ do nowego w³a¶ciciela',

    # Template: AgentPending
      'Pending date' => 'Data oczekiwania',
      'Pending type' => 'Typ oczekiwania',
      'Pending!' => 'Oczekuje!',
      'Set Pending' => 'Ustaw oczekiwanie',

    # Template: AgentPhone
      'Customer called' => 'Zadzwoni³ klient',
      'Phone call' => 'Telefon',
      'Phone call at %s' => 'Telefon o %s',

    # Template: AgentPhoneNew

    # Template: AgentPlain
      'ArticleID' => 'ID Artyku³u',
      'Plain' => 'Puste',
      'TicketID' => 'ID Zg³oszenia',

    # Template: AgentPreferencesCustomQueue
      'Select your custom queues' => 'Wybierz swoje kolejki',

    # Template: AgentPreferencesForm

    # Template: AgentPreferencesGeneric

    # Template: AgentPreferencesPassword
      'Change Password' => 'Zmieñ has³o',
      'New password' => 'Wpisz nowe has³o',
      'New password again' => 'Jeszcze raz wpisz nowe has³o',

    # Template: AgentPriority
      'Change priority of ticket' => 'Zmieñ priorytet zg³oszenia',

    # Template: AgentSpelling
      'Apply these changes' => 'Zastosuj te zmiany',
      'Spell Checker' => 'S³ownik',
      'spelling error(s)' => 'b³êdów',

    # Template: AgentStatusView
      'D' => 'Dól',
      'of' => 'z',
      'Site' => 'Strona',
      'sort downward' => 'sortuj malej±co',
      'sort upward' => 'sortuj rosn±co',
      'Ticket Status' => 'Status zg³oszenia',
      'U' => 'Góra',

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
      'Delete' => 'Usuñ',
      'Fulltext-Search in Article (e. g. "Mar*in" or "Baue*")' => 'Pe³ne wyszukiwanie w artykule (np. "Mar*in" or "Baue*")',
      'No time settings.' => 'Ustawienia bez czasu',
      'Profile' => 'Profil',
      'Result Form' => 'Wynik z ',
      'Save Search-Profile as Template?' => 'Zapisz profil wyszukiania jako szablon',
      'Search-Template' => 'Szukaj-szblon',
      'Select' => 'Wybierz',
      'Ticket created' => 'Zg³oszenie utworzone',
      'Ticket created between' => 'Zg³oszenie utworzone pomiêdzy',
      'Ticket Search' => 'Wyszukiwanie zg³oszenia',
      'TicketFreeText' => 'FreeText Zg³oszenia',
      'Times' => 'Czasy',
      'Yes, save it with name' => 'Tak, zapisz to z nazw±',

    # Template: AgentUtilSearchByCustomerID
      'Customer history search' => 'Przeszukiwanie historii klienta',
      'Customer history search (e. g. "ID342425").' => 'Przeszukiwanie historii klienta (np. "ID342425").',
      'No * possible!' => 'Nie u¿ywaj "*"!',

    # Template: AgentUtilSearchNavBar
      'Change search options' => 'Zmieñ kryteria wyszukiwania',
      'Results' => 'Wyniki',
      'Search Result' => 'Wynik wyszukiwania',
      'Total hits' => 'Wszystkie ods³ony',

    # Template: AgentUtilSearchResult
      '"}","15' => '',

    # Template: AgentUtilSearchResultPrint

    # Template: AgentUtilSearchResultPrintTable
      '"}","30' => '',

    # Template: AgentUtilSearchResultShort

    # Template: AgentUtilSearchResultShortTable

    # Template: AgentUtilSearchResultShortTableNotAnswered

    # Template: AgentUtilTicketStatus
      'All closed tickets' => 'Wszystkie zamkniete zg³oszenia',
      'All open tickets' => 'Wszystkie otwarte zg³oszenia',
      'closed tickets' => 'zamkniete zg³oszenia',
      'open tickets' => 'otwarte zg³oszenia',
      'or' => 'lub',
      'Provides an overview of all' => 'Pozwala obejrzec wszystkie',
      'So you see what is going on in your system.' => 'Dziêki temu widzisz co dzieje siê w systemie.',

    # Template: AgentZoomAgentIsCustomer
      'Compose Follow up' => 'Napisz Follow Up',
      'Your own Ticket' => 'Twoje w³asne zg³oszenia',

    # Template: AgentZoomAnswer
      'Compose Answer' => 'Napisz odpowiedz',
      'Contact customer' => 'Skontaktuj siê z klientem',
      'phone call' => 'Telefon',

    # Template: AgentZoomArticle
      'Split' => 'Rozdziel',

    # Template: AgentZoomBody
      'Change queue' => 'Zmieñ kolejkê',

    # Template: AgentZoomHead
      'Free Fields' => 'Wolne pola',
      'Print' => 'Drukuj',

    # Template: AgentZoomStatus
      '"}","18' => '',

    # Template: CustomerCreateAccount
      'Create Account' => 'Utwórz konto',

    # Template: CustomerError
      'Traceback' => '',

    # Template: CustomerFAQArticleHistory
      'Edit' => 'Edytuj',
      'FAQ History' => 'Historia FAQ',

    # Template: CustomerFAQArticlePrint
      'Category' => 'Kategoria',
      'Keywords' => 'S³owa kluczowe',
      'Last update' => 'Ostatnia aktualizacja',
      'Problem' => 'Problem',
      'Solution' => 'Rozwi±zanie',
      'Symptom' => 'Objawy',

    # Template: CustomerFAQArticleSystemHistory
      'FAQ System History' => 'System historii FAQ',

    # Template: CustomerFAQArticleView
      'FAQ Article' => 'Artyku³ FAQ',
      'Modified' => 'Modyfikowany',

    # Template: CustomerFAQOverview
      'FAQ Overview' => 'Przegl±d FAQ',

    # Template: CustomerFAQSearch
      'FAQ Search' => 'Wyszukiwanie FAQ',
      'Fulltext' => 'Pe³en tekst',
      'Keyword' => 'S³owa kluczowe',

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
      'Lost your password?' => 'Zapomnia³e¶ has³o?',
      'Request new password' => 'Pro¶ba o nowe has³o',

    # Template: CustomerMessage

    # Template: CustomerMessageNew

    # Template: CustomerNavigationBar
      'Create new Ticket' => 'Utwórz nowe zg³oszenie',
      'FAQ' => 'FAQ',
      'New Ticket' => 'Nowe zg³oszenie',
      'Ticket-Overview' => 'Zg³oszenia - Widok ogólny',
      'Welcome %s' => 'Witaj %s',

    # Template: CustomerPreferencesForm

    # Template: CustomerPreferencesGeneric

    # Template: CustomerPreferencesPassword

    # Template: CustomerStatusView
      'My Tickets' => 'Moje zg³oszenia',

    # Template: CustomerStatusViewTable

    # Template: CustomerTicketZoom

    # Template: CustomerWarning

    # Template: Error
      'Click here to report a bug!' => 'Kliknij tu by zg³osiæ b³±d!',

    # Template: FAQArticleDelete
      'FAQ Delete' => 'Usuñ FAQ',
      'You really want to delete this article?' => 'Czy naprawde chcesz usun±æ arytku³',

    # Template: FAQArticleForm
      'Comment (internal)' => 'Komentarz (wewnêtrzny)',
      'Filename' => 'Nazwa pliku',
      'Short Description' => 'Krótki opis',

    # Template: FAQArticleHistory

    # Template: FAQArticlePrint

    # Template: FAQArticleSystemHistory

    # Template: FAQArticleView

    # Template: FAQCategoryForm
      'FAQ Category' => 'Kategoria FAQ',

    # Template: FAQLanguageForm
      'FAQ Language' => 'Jêzyk FAQ',

    # Template: FAQNavigationBar

    # Template: FAQOverview

    # Template: FAQSearch

    # Template: FAQSearchResult

    # Template: FAQStateForm
      'FAQ State' => 'Status FAQ',

    # Template: Footer
      'Top of Page' => 'Góra strony',

    # Template: Header

    # Template: InstallerBody
      'Create Database' => 'Utwórz bazê',
      'Drop Database' => 'Usuñ bazê',
      'Finished' => 'Zakoñczono',
      'System Settings' => 'Ustawienia systemowe',
      'Web-Installer' => 'Instalator WWW',

    # Template: InstallerFinish
      'Admin-User' => 'Administrator',
      'After doing so your OTRS is up and running.' => 'Po pracy. OTRS jest gotowy.',
      'Have a lot of fun!' => '¯yczymy du¿o zabawy!',
      'Restart your webserver' => 'Zresetuj serwer WWW',
      'Start page' => 'Strona startowa',
      'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' => 'By móc urzywaæ OTRS musisz wykonaæ nastepuj±c± liniê poleceñ (Terminal/Pow³oka) jako root.',
      'Your OTRS Team' => 'Twója zespó³ OTRS',

    # Template: InstallerLicense
      'accept license' => 'zaakceptuj licencjê',
      'don\'t accept license' => 'nie akceptuj licencji',
      'License' => 'Licencja',

    # Template: InstallerStart
      'Create new database' => 'Utwórz now± bazê',
      'DB Admin Password' => 'Has³o administratora bazy danych',
      'DB Admin User' => 'U¿ytkownik administratora bazy danych',
      'DB Host' => 'Host bazy danych',
      'DB Type' => 'Tym bazy',
      'default \'hot\'' => 'domy¶lnie \'hot\'',
      'Delete old database' => 'Usuñ star± bazê',
      'next step' => 'Nastêpny krok',
      'OTRS DB connect host' => 'host bazy OTRS',
      'OTRS DB Name' => 'Nazwa bazy OTRS',
      'OTRS DB Password' => 'Has³o do bazy OTRS',
      'OTRS DB User' => 'U¿ytkownik do bazy OTRS',
      'your MySQL DB should have a root password! Default is empty!' => 'twoje has³o do bazy MySQL powinno mieæ has³o roota ! Domy¶lnie jest puste!',

    # Template: InstallerSystem
      '(Checks MX recordes of used email addresses by composing an answer. Don\'t use CheckMXRecord if your OTRS machine is behinde a dial-up line $!)' => '(Sprawd¼ rekord MX u¿ywanego adresu email podczas tworzenia odpowiedzi. Nie u¿ywaj sprawdzania rekordu MX jesli Twoja maszyna jest za lini± dial-up $!)',
      '(Email of the system admin)' => '(E-Mail do Administratora Systemu)',
      '(Full qualified domain name of your system)' => '(Pe³na z³o¿ona nazwa domeny)',
      '(Logfile just needed for File-LogModule!)' => '(Plik logu potrzebny tylko dla File-LogModule!!)',
      '(The identify of the system. Each ticket number and each http session id starts with this number)' => '(Identyfikacja systemu. Ka¿dy numer zg³oszenia i ka¿da sesja http zaczyna siê od tego numeru)',
      '(Ticket identifier. Some people want toset this to e. g. \'Ticket#\', \'Call#\' or \'MyTicket#\')' => '(Identyfikator zg³oszenia. Niektórzy chc± mieæ np. \'Ticket#\', \'Call#\' or \'MyTicket#\')',
      '(Used default language)' => '(U¿ywany domy¶lny jêzyk)',
      '(Used log backend)' => '(U¿ywany log backend)',
      '(Used ticket number format)' => '(U¿ywany format numeru zg³oszenia)',
      'CheckMXRecord' => 'Sprawd¼ rekord MX',
      'Default Charset' => 'Domy¶lny charset',
      'Default Language' => 'Domy¶lny jêzyk',
      'Logfile' => 'Plik logu',
      'LogModule' => 'Modu³ logowania',
      'Organization' => 'Organizacja',
      'System FQDN' => 'Pe³na domena systemu FQDN',
      'SystemID' => 'ID Systemu',
      'Ticket Hook' => 'Identyfikator zg³oszenia',
      'Ticket Number Generator' => 'Generator numerow zg³oszen',
      'Use utf-8 it your database supports it!' => 'U¿yj utf-8 twoja baza to wspiera!',
      'Webfrontend' => 'Interfejs webowy',

    # Template: Login

    # Template: LostPassword

    # Template: NoPermission
      'No Permission' => 'Brak dostêpu',

    # Template: Notify
      'Info' => 'Info',

    # Template: PrintFooter
      'URL' => 'URL',

    # Template: PrintHeader
      'printed by' => 'wydrukowane przez',

    # Template: QueueView
      'All tickets' => 'Wszystkie zg³oszenia',
      'Page' => 'Strona',
      'Queues' => 'Kolejki',
      'Tickets available' => 'Dostêpne zg³oszenia',
      'Tickets shown' => 'Pokazane zg³oszenia',

    # Template: SystemStats
      'Graphs' => 'Wykresy',

    # Template: Test
      'OTRS Test Page' => 'OTRS Strona testowa',

    # Template: TicketEscalation
      'Ticket escalation!' => 'Eskalacja zg³oszenia!',

    # Template: TicketView

    # Template: TicketViewLite
      'Add Note' => 'Dodaj notatke',

    # Template: Warning

    # Misc
      '(E-Mail of the system admin)' => '(Adres email Administratora)',
      'A message should have a From: recipient!' => 'Wiadomo¶c musi zawieraæ wype³nione pole Od: !',
      'AgentFrontend' => 'Frontend Agenta',
      'Article free text' => 'Dowolny tekst artyku³u',
      'Backend' => 'Backend',
      'BackendMessage' => 'Komunikat Backend',
      'Bottom of Page' => 'Dól strony',
      'Charset' => 'Charset',
      'Charsets' => 'Charsety',
      'Closed' => 'Zamkniête',
      'Create' => 'Utworz',
      'CustomerUser' => 'Klient',
      'Fulltext search' => 'Przeszukiwanie pe³notekstowe',
      'Fulltext search (e. g. "Mar*in" or "Baue*" or "martin+hallo")' => 'Przeszukiwanie pe³noteksotwe (np. "Tom*sz" lub "Jane*" lub "janek+rumianek")',
      'Handle' => 'Handle',
      'In Queue' => 'W kolejce',
      'New state' => 'Nowy status',
      'New ticket via call.' => 'Nowe zg³oszenie telefoniczne.',
      'New user' => 'Nowy u¿ytkownik',
      'Screen after new phone ticket' => 'Strona po dodaniu nowego zg³oszenia telefonicznego',
      'Search in' => 'Szukaj w',
      'Select your screen after creating a new ticket via PhoneView.' => 'Wybierz strone po dodaniu nowego zg³oszenia telefonicznego',
      'Set customer id of a ticket' => 'Ustaw ID klienta dla zg³oszenia',
      'Show all' => 'Poka¿ wszystko',
      'System Charset Management' => 'Konfiguracja systemowego charsetu',
      'System Language Management' => 'Konfiguracja jêzyka systemu',
      'Ticket free text' => 'Dowolny tekst zg³oszenia',
      'Ticket limit:' => 'Limit zg³oszenia',
      'Time till escalation' => 'Czas do eskalacji',
      'With Priority' => 'Z priorytetem',
      'With State' => 'Ze statusem',
      'You have to be in the admin group!' => 'Musisz nale¿eæ do grupy Admin!',
      'You have to be in the stats group!' => 'Musisz nale¿eæ do grupy Stats!',
      'You need a email address (e. g. customer@example.com) in From:!' => 'Musisz posiadac email (np. klient@przykladowafirma.com.pl) w polu Od:!',
      'auto responses set' => 'ustawione AutoOdpowiedzi',
      'invalid-temporarily' => 'Tymczasowo nieu¿ywane',
      'search' => 'szukaj',
      'search (e. g. 10*5155 or 105658*)' => 'szukaj (np. "10*5155" lub "105658*")',
      'store' => 'Zachowaj',
      'tickets' => 'Zg³oszenia',
      'valid' => 'U¿ywane',
    );

    # $$STOP$$

    $Self->{Translation} = \%Hash;
}
# --
1;
