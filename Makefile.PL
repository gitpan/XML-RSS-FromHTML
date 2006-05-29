use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'XML::RSS::FromHTML',
    VERSION_FROM => 'lib/XML/RSS/FromHTML.pm', # finds \$VERSION
    AUTHOR       => 'Toshimasa Ishibashi (iandeth99@ybb.ne.jp)',
    ABSTRACT     => 'simple framework for creating RSS out of HTML',
    PREREQ_PM    => {
        'XML::RSS'       => 0,
        'LWP::UserAgent' => 0,
        'HTTP::Cookies'  => 0,
        'HTTP::Date'     => 0,
        'Test::Simple'   => 0.44,
        'Test::More'     => 0,
        'Class::Accessor::Fast' => 0,
        'Unicode::RecursiveDowngrade' => 0,
    },
);
