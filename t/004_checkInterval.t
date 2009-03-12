use Test::More tests => 10;
use strict;
use FindBin;
use File::Path;
BEGIN {
	require "$FindBin::RealBin/Test.pm";
}

my $rss = XML::RSS::FromHTML::Test->new();
isa_ok ($rss, 'XML::RSS::FromHTML');
my $cachedir = '/tmp/XML-RSS-FromHTML/cache';
rmtree $cachedir, 0;
mkpath $cachedir, 0;

# sub-class properties
is($rss->name,'Test');
is($rss->cacheDir,$cachedir);
is($rss->prop01,'foo');
is($rss->prop02,'bar');

# _getCacheFilePath
my $path = $rss->_getCacheFilePath;
is($path,$cachedir.'/Test.cache');

### checkInterval

# no cache
unlink $path;
ok( ($rss->checkInterval)[0] );

# no minInterval
my $mtmp = $rss->minInterval;
$rss->minInterval(0);
ok( ($rss->checkInterval)[0] );
$rss->minInterval($mtmp);

# okTime > nowTime
`touch $path`;
ok( !($rss->checkInterval)[0] );

# okTime < nowTime
$rss->minInterval(1);
sleep(2);
ok( ($rss->checkInterval)[0] );

unlink $path;

END {
    rmtree $cachedir, 0;
}
