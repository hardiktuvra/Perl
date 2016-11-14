sub getdelim{
print "Enter Delimeter to seperate Data For Column:";
    my($dem);

    while($dem = <STDIN>) {
	if($dem !~ /=/) { return $dem; }

}

}
sub getfile_name {
print "\n\nThis Program Conver Text File Into HTML table Formate :\n\n";
print "---------------------------INSTRUCTION TO USE PROGRAM-----------------------------------------------\n";
print "(1) write file content into [ ] brackets for Bold The Content\n";
print "(2) write file content into ( ) brackets for Italic The Content\n";
print "(3) write file content into { } brackets for Underline The Content\n";
print "-----------------------------------------------------------------------------------------------------\n";
print "Enter File Name To Conver Data in to table with Extension:";
    my($next_line);

    while($next_line = <STDIN>) {
	if($next_line !~ /=/) { return $next_line; }

	my($key, $data_value) = split(/\s*=\s*/, $next_line, 2);
	$key =~ s/^\s*//;
	$data_value =~ s/\s*$//;

	if(! exists $default_value{$key}) {
	    print STDERR "Illegal option $key.\n";
	    exit 10;
	}

	$default_value{$key} = $data_value;

	}
	
}

sub first_line {
    my($first_line) = @_;
    chomp $first_line;
  
    $first_line =~ s/^ /|/;
    my(@args) = ();

    while($first_line =~ /^\|/) {
        $first_line =~ s/^(\|[^|]*)//;
	my($flength) = length($1);
	
    }
   
   push @args, ".*";
    return @args;
}

 my $topline = getfile_name;
 chomp $topline;

 my $mychar1=getdelim;
chomp $mychar1;

my %trans = ( '\[' => '<b>', '\]' => '</b>',
	      '\{' => '<i>', '\}' => '</i>',
			'\(' => '<u>', '\)' => '</u>',
			 $mychar1 => '</td><td>',);

my %default_value = ( color => '#bb7777',
		title => $topline,
		colsep => 3 );

		 
sub scan {
open(DATA,$topline) or die "File Is Not Available";
open(DATA1,">table.html") or die "File Is Not Available";
print DATA1 "<html>\n";

    print  DATA1 qq|<title>$default_value{"title"}</title>\n|; 
	print   qq|<title>$default_value{"title"}</title>\n|; 

print DATA1 qq|<body bgcolor="$default_value{"color"}">\n|;
print  qq|<body bgcolor="$default_value{"color"}">\n|;

print DATA1 "<table border='2' align='center' style='font-size: 150%;'>\n";
print  "<table border='2' align='center' style='font-size: 150%;'>\n";

 print DATA1 qq|<center><h1>$default_value{"title"}</h1></center>\n|; #}
 print  qq|<center><h1>$default_value{"title"}</h1></center>\n|; #}
 
    while(my $next_line = <DATA>) {
	chomp $next_line;

	print  DATA1 "<tr>";
	print   "<tr>";
	
	foreach my $colpat (@_) {
	    $next_line =~ s/^($colpat)//;
	    my $colcont = $1;
			   
	    foreach my $ch(keys %trans) {
		$colcont =~ s/(^|[^\\])$ch/$1$trans{$ch}/g;
		
	    }
	  
	    print DATA1 "<td>$colcont</td>";
	    print  "<td>$colcont</td>";
	
	}
	print DATA1 "</tr>\n";
	print  "</tr>\n";
    }    

}


my @args = first_line($topline);

scan(@args);

print DATA1 "</table>\n";
print  "</table>\n";
print DATA1 "</body>\n";
print  "</body>\n";
print DATA1 "</html>\n";
print  "</html>\n";
close(DATA);
close(DATA1);


