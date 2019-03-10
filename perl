#!/usr/bin/env perl

use 5.026;
use strict;
use autodie;
use warnings;
use utf8::all;
use Log::Any '$log';
use Log::Any::Adapter;
use Getopt::Long::Descriptive;
use Path::Tiny 0.060;

use FindBin;
use lib "$FindBin::Bin/../lib/perl";
use CPqD::Utils qw/get_credentials/;

sub grok_options {
    my ($opt, $usage) = describe_options(
        '%c %o <parameters>',
        ['long=s',  "what this option do", {default => 'value', required => 1}],
        [],
        ['dont',    "do not do anything"],
        ['debug',   "show debug information"],
        ['help',    "print usage message and exit"],
        { show_defaults => 1},
    );

    if ($opt->help) {
        print $usage->text;
        exit 0;
    }

    Log::Any::Adapter->set('Stderr', log_level => $opt->debug ? 'debug' : 'info');

    @ARGV == $FIXME or $usage->die({pre_text => "Missing argument.\n\n"});

    return ($opt, $usage, @ARGV);
}

sub main {
    my ($opt, $usage, @args) = grok_options();

    # CODE...
    $log->error("an error occurred");

    return 0;
}

exit main();


__END__
=encoding utf8

=head1 NAME

template.pl -

=head1 SYNOPSIS

template.pl OPTIONS

=head1 DESCRIPTION

=head1 OPTIONS

=over

=item * B<>

=back

=head1 ENVIRONMENT

=head1 FILES

=head1 EXIT CODES

=head1 SEE ALSO

=head1 COPYRIGHT

Copyright 2019 CPqD.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Gustavo Chaves <gustavo@cpqd.com.br>
