
% Sample user dataset
user(ali, 1234).
user(sara, 5678).
user(ahmed, 1111).

% Start login
login :-
    login_attempt(3).

% Check username and password
login_attempt(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (
        user(Username, Password)
    ->
        writeln('Login Successful')
    ;
        writeln('Login Unsuccessful'),
        Remaining is Attempts - 1,
        (
            Remaining > 0
        ->
            login_attempt(Remaining)
        ;
            writeln('Sorry, you exceeded the maximum number of attempts, try again later.')
        )
    ).
