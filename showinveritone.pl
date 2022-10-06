#! /usr/bin/perl

#Link Exanple:
#https://core.wazeedigital.com/video/searchResults.do?search.type=intermediate&search.withinKeywords=&search.withinResults=&search.type=intermediate&pageSize=&search.sortBy=Date&search.userFilterSetName=None&search.pageResultDisplayFormat=&search.mvp=false&page=1&filter=v1:Fremantle.HouseNumber:BUZ_JFFC00031%20OR%20Fremantle.HouseNumber:BUZ_JFFC00032%20,f110,f110


sub getLink
{
  $base = "https://core.wazeedigital.com/video/searchResults.do?search.type=intermediate&search.withinKeywords=&search.withinResults=&search.type=intermediate&pageSize=&search.sortBy=Date&search.userFilterSetName=None&search.pageResultDisplayFormat=&search.mvp=false&page=1&filter=v1:";
  #$end = "Fremantle.HouseNumber:BUZ_JFFC00031%20OR%20Fremantle.HouseNumber:BUZ_JFFC00032%20,f110,f110";
  $end = "";
  $filter = shift(@_);
  $i    = 0;
  $nums = "";
  foreach $hn (@_)
  {
    if ($i != $#_)
    {
      $end .= "$filter:$hn%20OR%20";
    }
    else
    {
      $end .= "$filter:$hn%20,f110,f110";
    }
    $i += 1;
  }

  print("\n$base$end\n");
}

@hns = ();

$ans = "start";
print("\n  Enter Your House Numbers:\n\n");

while ($ans ne "")
{
  chomp ($ans = <STDIN>);
  if ($ans =~ /^(BUZ_[A-Z]{4}\d{5})$/)
  {
    push(@hns,$ans);
  }
}


&getLink("Fremantle.HouseNumber",@hns);
