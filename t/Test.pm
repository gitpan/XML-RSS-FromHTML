package XML::RSS::FromHTML::Test;
use base XML::RSS::FromHTML;
use strict;
use FindBin;
use File::Path;

__PACKAGE__->mk_accessors(qw(
	prop01
	prop02
));

sub init {
	my $self = shift;
	$self->name('Test');
    my $cachedir = '/tmp/XML-RSS-FromHTML/cache';
    my $feeddir = '/tmp/XML::RSS::FromHTML/feed';
    mkpath $cachedir, 0 if !-d $cachedir;
    mkpath $feeddir, 0 if !-d $feeddir;
	$self->cacheDir($cachedir);
	$self->feedDir($feeddir);
	$self->prop01('foo');
	$self->prop02('bar');
	return 1;
}

sub makeItemList {
	my $self = shift;
	my $html = shift;
	my @list;
	while ($html =~ m|<li><a href="(.+?)">(.+?)</a></li>|g){
		push(@list,{
			link  => $1,
			title => $2,
		});
	}
	return \@list;
}

sub addNewItem {
	my $self = shift;
	my ($rss,$item) = @_;
	$rss->add_item(
		title => $item->{title},
		link  => $item->{link},
		description => 'this is '. $item->{title},
	);
	return 1;
}

sub defineRSS {
	my $self = shift;
	my $rss  = shift;
	$rss->channel(
		title => 'ほげほげフィード',
		description => 'foo bar',
		link  => 'http://mysite/rss/',
	);
	$rss->image(
		title  => "blabla rss feed",
		url    => "http://mysite/rss/feed.png",
	);
	return 1;
}

sub DESTROY {
    my $self = shift;
    rmtree $self->cacheDir, 0;
    rmtree $self->feedDir, 0;
}

1;
