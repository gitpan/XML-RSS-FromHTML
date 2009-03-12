use Test::More tests => 9;
use strict;
use FindBin;
BEGIN {
	require "$FindBin::RealBin/Test.pm";
}

# _getFeedFilePath
{
	my $rss = XML::RSS::FromHTML::Test->new();
	is($rss->_getFeedFilePath,$rss->feedDir.'/Test.xml');
}

# _loadOldRss - load nothing
{
	my $rss = XML::RSS::FromHTML::Test->new();
	my $fpath = $rss->_getFeedFilePath;
	unlink $fpath;
	my $oldrss = $rss->_loadOldRss;
	is(ref $oldrss, 'XML::RSS');
	is(scalar @{ $oldrss->{items} }, 0);
}

# _loadOldRSS
{
	my $rss = XML::RSS::FromHTML::Test->new();
	my $fpath = $rss->_getFeedFilePath;
	my $x = XML::RSS->new;
	$x->add_item(
		title => 'あいうえ',
		link  => 'http://hoge',
	);
	$x->save($fpath);
	my $oldrss = $rss->_loadOldRss;
	is(scalar @{ $oldrss->{items} }, 1);
	is($oldrss->{items}[0]{title}, 'あいうえ');
	ok(utf8::is_utf8( $oldrss->{items}[0]{title} ));
}
{	
	# with unicode downgrade
	my $rss = XML::RSS::FromHTML::Test->new();
	my $fpath = $rss->_getFeedFilePath;
	my $x = XML::RSS->new;
	$x->add_item(
		title => 'hoge',
		link  => 'http://hoge',
	);
	$x->save($fpath);
	$rss->unicodeDowngrade(1);
	my $oldrss2 = $rss->_loadOldRss;
	is(scalar @{ $oldrss2->{items} }, 1);
	is($oldrss2->{items}[0]{title}, 'hoge');
	ok(! utf8::is_utf8( $oldrss2->{items}[0]{title} ));
	unlink $fpath;
}
