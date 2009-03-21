use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'XML::RSS::FromHTML',
    VERSION_FROM => 'lib/XML/RSS/FromHTML.pm', # finds \$VERSION
    AUTHOR       => 'Toshimasa Ishibashi (bashi@cpan.org)',
    ABSTRACT     => 'simple framework for creating RSS out of HTML',
    PREREQ_PM    => {
        'XML::RSS'       => 1.43,
        'XML::Parser'    => 2.34,
        'LWP::UserAgent' => 0,
        'HTTP::Cookies'  => 0,
        'HTML::Entities' => 1.35,
        'HTTP::Date'     => 0,
        'Test::Simple'   => 0.44,
        'Test::More'     => 0,
        'File::Temp'     => 0,
        'Class::Accessor::Fast' => 0,
    },
);
