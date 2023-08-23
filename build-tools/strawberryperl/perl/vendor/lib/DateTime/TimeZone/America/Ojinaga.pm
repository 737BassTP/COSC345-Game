# This file is auto-generated by the Perl DateTime Suite time zone
# code generator (0.08) This code generator comes with the
# DateTime::TimeZone module distribution in the tools/ directory

#
# Generated from /tmp/h6QqPsv6Ap/northamerica.  Olson data version 2020e
#
# Do not edit this file directly.
#
package DateTime::TimeZone::America::Ojinaga;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '2.46';

use Class::Singleton 1.03;
use DateTime::TimeZone;
use DateTime::TimeZone::OlsonDB;

@DateTime::TimeZone::America::Ojinaga::ISA = ( 'Class::Singleton', 'DateTime::TimeZone' );

my $spans =
[
    [
DateTime::TimeZone::NEG_INFINITY, #    utc_start
60620943600, #      utc_end 1922-01-01 07:00:00 (Sun)
DateTime::TimeZone::NEG_INFINITY, #  local_start
60620918540, #    local_end 1922-01-01 00:02:20 (Sun)
-25060,
0,
'LMT',
    ],
    [
60620943600, #    utc_start 1922-01-01 07:00:00 (Sun)
60792616800, #      utc_end 1927-06-11 06:00:00 (Sat)
60620918400, #  local_start 1922-01-01 00:00:00 (Sun)
60792591600, #    local_end 1927-06-10 23:00:00 (Fri)
-25200,
0,
'MST',
    ],
    [
60792616800, #    utc_start 1927-06-11 06:00:00 (Sat)
60900876000, #      utc_end 1930-11-15 06:00:00 (Sat)
60792595200, #  local_start 1927-06-11 00:00:00 (Sat)
60900854400, #    local_end 1930-11-15 00:00:00 (Sat)
-21600,
0,
'CST',
    ],
    [
60900876000, #    utc_start 1930-11-15 06:00:00 (Sat)
60915391200, #      utc_end 1931-05-02 06:00:00 (Sat)
60900850800, #  local_start 1930-11-14 23:00:00 (Fri)
60915366000, #    local_end 1931-05-01 23:00:00 (Fri)
-25200,
0,
'MST',
    ],
    [
60915391200, #    utc_start 1931-05-02 06:00:00 (Sat)
60928524000, #      utc_end 1931-10-01 06:00:00 (Thu)
60915369600, #  local_start 1931-05-02 00:00:00 (Sat)
60928502400, #    local_end 1931-10-01 00:00:00 (Thu)
-21600,
0,
'CST',
    ],
    [
60928524000, #    utc_start 1931-10-01 06:00:00 (Thu)
60944338800, #      utc_end 1932-04-01 07:00:00 (Fri)
60928498800, #  local_start 1931-09-30 23:00:00 (Wed)
60944313600, #    local_end 1932-04-01 00:00:00 (Fri)
-25200,
0,
'MST',
    ],
    [
60944338800, #    utc_start 1932-04-01 07:00:00 (Fri)
62956159200, #      utc_end 1996-01-01 06:00:00 (Mon)
60944317200, #  local_start 1932-04-01 01:00:00 (Fri)
62956137600, #    local_end 1996-01-01 00:00:00 (Mon)
-21600,
0,
'CST',
    ],
    [
62956159200, #    utc_start 1996-01-01 06:00:00 (Mon)
62964547200, #      utc_end 1996-04-07 08:00:00 (Sun)
62956137600, #  local_start 1996-01-01 00:00:00 (Mon)
62964525600, #    local_end 1996-04-07 02:00:00 (Sun)
-21600,
0,
'CST',
    ],
    [
62964547200, #    utc_start 1996-04-07 08:00:00 (Sun)
62982082800, #      utc_end 1996-10-27 07:00:00 (Sun)
62964529200, #  local_start 1996-04-07 03:00:00 (Sun)
62982064800, #    local_end 1996-10-27 02:00:00 (Sun)
-18000,
1,
'CDT',
    ],
    [
62982082800, #    utc_start 1996-10-27 07:00:00 (Sun)
62995996800, #      utc_end 1997-04-06 08:00:00 (Sun)
62982061200, #  local_start 1996-10-27 01:00:00 (Sun)
62995975200, #    local_end 1997-04-06 02:00:00 (Sun)
-21600,
0,
'CST',
    ],
    [
62995996800, #    utc_start 1997-04-06 08:00:00 (Sun)
63013532400, #      utc_end 1997-10-26 07:00:00 (Sun)
62995978800, #  local_start 1997-04-06 03:00:00 (Sun)
63013514400, #    local_end 1997-10-26 02:00:00 (Sun)
-18000,
1,
'CDT',
    ],
    [
63013532400, #    utc_start 1997-10-26 07:00:00 (Sun)
63019317600, #      utc_end 1998-01-01 06:00:00 (Thu)
63013510800, #  local_start 1997-10-26 01:00:00 (Sun)
63019296000, #    local_end 1998-01-01 00:00:00 (Thu)
-21600,
0,
'CST',
    ],
    [
63019317600, #    utc_start 1998-01-01 06:00:00 (Thu)
63027450000, #      utc_end 1998-04-05 09:00:00 (Sun)
63019296000, #  local_start 1998-01-01 00:00:00 (Thu)
63027428400, #    local_end 1998-04-05 03:00:00 (Sun)
-21600,
0,
'CST',
    ],
    [
63027450000, #    utc_start 1998-04-05 09:00:00 (Sun)
63044985600, #      utc_end 1998-10-25 08:00:00 (Sun)
63027428400, #  local_start 1998-04-05 03:00:00 (Sun)
63044964000, #    local_end 1998-10-25 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63044985600, #    utc_start 1998-10-25 08:00:00 (Sun)
63058899600, #      utc_end 1999-04-04 09:00:00 (Sun)
63044960400, #  local_start 1998-10-25 01:00:00 (Sun)
63058874400, #    local_end 1999-04-04 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63058899600, #    utc_start 1999-04-04 09:00:00 (Sun)
63077040000, #      utc_end 1999-10-31 08:00:00 (Sun)
63058878000, #  local_start 1999-04-04 03:00:00 (Sun)
63077018400, #    local_end 1999-10-31 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63077040000, #    utc_start 1999-10-31 08:00:00 (Sun)
63090349200, #      utc_end 2000-04-02 09:00:00 (Sun)
63077014800, #  local_start 1999-10-31 01:00:00 (Sun)
63090324000, #    local_end 2000-04-02 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63090349200, #    utc_start 2000-04-02 09:00:00 (Sun)
63108489600, #      utc_end 2000-10-29 08:00:00 (Sun)
63090327600, #  local_start 2000-04-02 03:00:00 (Sun)
63108468000, #    local_end 2000-10-29 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63108489600, #    utc_start 2000-10-29 08:00:00 (Sun)
63124822800, #      utc_end 2001-05-06 09:00:00 (Sun)
63108464400, #  local_start 2000-10-29 01:00:00 (Sun)
63124797600, #    local_end 2001-05-06 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63124822800, #    utc_start 2001-05-06 09:00:00 (Sun)
63137520000, #      utc_end 2001-09-30 08:00:00 (Sun)
63124801200, #  local_start 2001-05-06 03:00:00 (Sun)
63137498400, #    local_end 2001-09-30 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63137520000, #    utc_start 2001-09-30 08:00:00 (Sun)
63153853200, #      utc_end 2002-04-07 09:00:00 (Sun)
63137494800, #  local_start 2001-09-30 01:00:00 (Sun)
63153828000, #    local_end 2002-04-07 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63153853200, #    utc_start 2002-04-07 09:00:00 (Sun)
63171388800, #      utc_end 2002-10-27 08:00:00 (Sun)
63153831600, #  local_start 2002-04-07 03:00:00 (Sun)
63171367200, #    local_end 2002-10-27 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63171388800, #    utc_start 2002-10-27 08:00:00 (Sun)
63185302800, #      utc_end 2003-04-06 09:00:00 (Sun)
63171363600, #  local_start 2002-10-27 01:00:00 (Sun)
63185277600, #    local_end 2003-04-06 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63185302800, #    utc_start 2003-04-06 09:00:00 (Sun)
63202838400, #      utc_end 2003-10-26 08:00:00 (Sun)
63185281200, #  local_start 2003-04-06 03:00:00 (Sun)
63202816800, #    local_end 2003-10-26 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63202838400, #    utc_start 2003-10-26 08:00:00 (Sun)
63216752400, #      utc_end 2004-04-04 09:00:00 (Sun)
63202813200, #  local_start 2003-10-26 01:00:00 (Sun)
63216727200, #    local_end 2004-04-04 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63216752400, #    utc_start 2004-04-04 09:00:00 (Sun)
63234892800, #      utc_end 2004-10-31 08:00:00 (Sun)
63216730800, #  local_start 2004-04-04 03:00:00 (Sun)
63234871200, #    local_end 2004-10-31 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63234892800, #    utc_start 2004-10-31 08:00:00 (Sun)
63248202000, #      utc_end 2005-04-03 09:00:00 (Sun)
63234867600, #  local_start 2004-10-31 01:00:00 (Sun)
63248176800, #    local_end 2005-04-03 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63248202000, #    utc_start 2005-04-03 09:00:00 (Sun)
63266342400, #      utc_end 2005-10-30 08:00:00 (Sun)
63248180400, #  local_start 2005-04-03 03:00:00 (Sun)
63266320800, #    local_end 2005-10-30 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63266342400, #    utc_start 2005-10-30 08:00:00 (Sun)
63279651600, #      utc_end 2006-04-02 09:00:00 (Sun)
63266317200, #  local_start 2005-10-30 01:00:00 (Sun)
63279626400, #    local_end 2006-04-02 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63279651600, #    utc_start 2006-04-02 09:00:00 (Sun)
63297792000, #      utc_end 2006-10-29 08:00:00 (Sun)
63279630000, #  local_start 2006-04-02 03:00:00 (Sun)
63297770400, #    local_end 2006-10-29 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63297792000, #    utc_start 2006-10-29 08:00:00 (Sun)
63311101200, #      utc_end 2007-04-01 09:00:00 (Sun)
63297766800, #  local_start 2006-10-29 01:00:00 (Sun)
63311076000, #    local_end 2007-04-01 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63311101200, #    utc_start 2007-04-01 09:00:00 (Sun)
63329241600, #      utc_end 2007-10-28 08:00:00 (Sun)
63311079600, #  local_start 2007-04-01 03:00:00 (Sun)
63329220000, #    local_end 2007-10-28 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63329241600, #    utc_start 2007-10-28 08:00:00 (Sun)
63343155600, #      utc_end 2008-04-06 09:00:00 (Sun)
63329216400, #  local_start 2007-10-28 01:00:00 (Sun)
63343130400, #    local_end 2008-04-06 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63343155600, #    utc_start 2008-04-06 09:00:00 (Sun)
63360691200, #      utc_end 2008-10-26 08:00:00 (Sun)
63343134000, #  local_start 2008-04-06 03:00:00 (Sun)
63360669600, #    local_end 2008-10-26 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63360691200, #    utc_start 2008-10-26 08:00:00 (Sun)
63374605200, #      utc_end 2009-04-05 09:00:00 (Sun)
63360666000, #  local_start 2008-10-26 01:00:00 (Sun)
63374580000, #    local_end 2009-04-05 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63374605200, #    utc_start 2009-04-05 09:00:00 (Sun)
63392140800, #      utc_end 2009-10-25 08:00:00 (Sun)
63374583600, #  local_start 2009-04-05 03:00:00 (Sun)
63392119200, #    local_end 2009-10-25 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63392140800, #    utc_start 2009-10-25 08:00:00 (Sun)
63398012400, #      utc_end 2010-01-01 07:00:00 (Fri)
63392115600, #  local_start 2009-10-25 01:00:00 (Sun)
63397987200, #    local_end 2010-01-01 00:00:00 (Fri)
-25200,
0,
'MST',
    ],
    [
63398012400, #    utc_start 2010-01-01 07:00:00 (Fri)
63404240400, #      utc_end 2010-03-14 09:00:00 (Sun)
63397987200, #  local_start 2010-01-01 00:00:00 (Fri)
63404215200, #    local_end 2010-03-14 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63404240400, #    utc_start 2010-03-14 09:00:00 (Sun)
63424800000, #      utc_end 2010-11-07 08:00:00 (Sun)
63404218800, #  local_start 2010-03-14 03:00:00 (Sun)
63424778400, #    local_end 2010-11-07 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63424800000, #    utc_start 2010-11-07 08:00:00 (Sun)
63435690000, #      utc_end 2011-03-13 09:00:00 (Sun)
63424774800, #  local_start 2010-11-07 01:00:00 (Sun)
63435664800, #    local_end 2011-03-13 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63435690000, #    utc_start 2011-03-13 09:00:00 (Sun)
63456249600, #      utc_end 2011-11-06 08:00:00 (Sun)
63435668400, #  local_start 2011-03-13 03:00:00 (Sun)
63456228000, #    local_end 2011-11-06 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63456249600, #    utc_start 2011-11-06 08:00:00 (Sun)
63467139600, #      utc_end 2012-03-11 09:00:00 (Sun)
63456224400, #  local_start 2011-11-06 01:00:00 (Sun)
63467114400, #    local_end 2012-03-11 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63467139600, #    utc_start 2012-03-11 09:00:00 (Sun)
63487699200, #      utc_end 2012-11-04 08:00:00 (Sun)
63467118000, #  local_start 2012-03-11 03:00:00 (Sun)
63487677600, #    local_end 2012-11-04 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63487699200, #    utc_start 2012-11-04 08:00:00 (Sun)
63498589200, #      utc_end 2013-03-10 09:00:00 (Sun)
63487674000, #  local_start 2012-11-04 01:00:00 (Sun)
63498564000, #    local_end 2013-03-10 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63498589200, #    utc_start 2013-03-10 09:00:00 (Sun)
63519148800, #      utc_end 2013-11-03 08:00:00 (Sun)
63498567600, #  local_start 2013-03-10 03:00:00 (Sun)
63519127200, #    local_end 2013-11-03 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63519148800, #    utc_start 2013-11-03 08:00:00 (Sun)
63530038800, #      utc_end 2014-03-09 09:00:00 (Sun)
63519123600, #  local_start 2013-11-03 01:00:00 (Sun)
63530013600, #    local_end 2014-03-09 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63530038800, #    utc_start 2014-03-09 09:00:00 (Sun)
63550598400, #      utc_end 2014-11-02 08:00:00 (Sun)
63530017200, #  local_start 2014-03-09 03:00:00 (Sun)
63550576800, #    local_end 2014-11-02 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63550598400, #    utc_start 2014-11-02 08:00:00 (Sun)
63561488400, #      utc_end 2015-03-08 09:00:00 (Sun)
63550573200, #  local_start 2014-11-02 01:00:00 (Sun)
63561463200, #    local_end 2015-03-08 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63561488400, #    utc_start 2015-03-08 09:00:00 (Sun)
63582048000, #      utc_end 2015-11-01 08:00:00 (Sun)
63561466800, #  local_start 2015-03-08 03:00:00 (Sun)
63582026400, #    local_end 2015-11-01 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63582048000, #    utc_start 2015-11-01 08:00:00 (Sun)
63593542800, #      utc_end 2016-03-13 09:00:00 (Sun)
63582022800, #  local_start 2015-11-01 01:00:00 (Sun)
63593517600, #    local_end 2016-03-13 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63593542800, #    utc_start 2016-03-13 09:00:00 (Sun)
63614102400, #      utc_end 2016-11-06 08:00:00 (Sun)
63593521200, #  local_start 2016-03-13 03:00:00 (Sun)
63614080800, #    local_end 2016-11-06 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63614102400, #    utc_start 2016-11-06 08:00:00 (Sun)
63624992400, #      utc_end 2017-03-12 09:00:00 (Sun)
63614077200, #  local_start 2016-11-06 01:00:00 (Sun)
63624967200, #    local_end 2017-03-12 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63624992400, #    utc_start 2017-03-12 09:00:00 (Sun)
63645552000, #      utc_end 2017-11-05 08:00:00 (Sun)
63624970800, #  local_start 2017-03-12 03:00:00 (Sun)
63645530400, #    local_end 2017-11-05 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63645552000, #    utc_start 2017-11-05 08:00:00 (Sun)
63656442000, #      utc_end 2018-03-11 09:00:00 (Sun)
63645526800, #  local_start 2017-11-05 01:00:00 (Sun)
63656416800, #    local_end 2018-03-11 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63656442000, #    utc_start 2018-03-11 09:00:00 (Sun)
63677001600, #      utc_end 2018-11-04 08:00:00 (Sun)
63656420400, #  local_start 2018-03-11 03:00:00 (Sun)
63676980000, #    local_end 2018-11-04 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63677001600, #    utc_start 2018-11-04 08:00:00 (Sun)
63687891600, #      utc_end 2019-03-10 09:00:00 (Sun)
63676976400, #  local_start 2018-11-04 01:00:00 (Sun)
63687866400, #    local_end 2019-03-10 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63687891600, #    utc_start 2019-03-10 09:00:00 (Sun)
63708451200, #      utc_end 2019-11-03 08:00:00 (Sun)
63687870000, #  local_start 2019-03-10 03:00:00 (Sun)
63708429600, #    local_end 2019-11-03 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63708451200, #    utc_start 2019-11-03 08:00:00 (Sun)
63719341200, #      utc_end 2020-03-08 09:00:00 (Sun)
63708426000, #  local_start 2019-11-03 01:00:00 (Sun)
63719316000, #    local_end 2020-03-08 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63719341200, #    utc_start 2020-03-08 09:00:00 (Sun)
63739900800, #      utc_end 2020-11-01 08:00:00 (Sun)
63719319600, #  local_start 2020-03-08 03:00:00 (Sun)
63739879200, #    local_end 2020-11-01 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63739900800, #    utc_start 2020-11-01 08:00:00 (Sun)
63751395600, #      utc_end 2021-03-14 09:00:00 (Sun)
63739875600, #  local_start 2020-11-01 01:00:00 (Sun)
63751370400, #    local_end 2021-03-14 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63751395600, #    utc_start 2021-03-14 09:00:00 (Sun)
63771955200, #      utc_end 2021-11-07 08:00:00 (Sun)
63751374000, #  local_start 2021-03-14 03:00:00 (Sun)
63771933600, #    local_end 2021-11-07 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63771955200, #    utc_start 2021-11-07 08:00:00 (Sun)
63782845200, #      utc_end 2022-03-13 09:00:00 (Sun)
63771930000, #  local_start 2021-11-07 01:00:00 (Sun)
63782820000, #    local_end 2022-03-13 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63782845200, #    utc_start 2022-03-13 09:00:00 (Sun)
63803404800, #      utc_end 2022-11-06 08:00:00 (Sun)
63782823600, #  local_start 2022-03-13 03:00:00 (Sun)
63803383200, #    local_end 2022-11-06 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63803404800, #    utc_start 2022-11-06 08:00:00 (Sun)
63814294800, #      utc_end 2023-03-12 09:00:00 (Sun)
63803379600, #  local_start 2022-11-06 01:00:00 (Sun)
63814269600, #    local_end 2023-03-12 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63814294800, #    utc_start 2023-03-12 09:00:00 (Sun)
63834854400, #      utc_end 2023-11-05 08:00:00 (Sun)
63814273200, #  local_start 2023-03-12 03:00:00 (Sun)
63834832800, #    local_end 2023-11-05 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63834854400, #    utc_start 2023-11-05 08:00:00 (Sun)
63845744400, #      utc_end 2024-03-10 09:00:00 (Sun)
63834829200, #  local_start 2023-11-05 01:00:00 (Sun)
63845719200, #    local_end 2024-03-10 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63845744400, #    utc_start 2024-03-10 09:00:00 (Sun)
63866304000, #      utc_end 2024-11-03 08:00:00 (Sun)
63845722800, #  local_start 2024-03-10 03:00:00 (Sun)
63866282400, #    local_end 2024-11-03 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63866304000, #    utc_start 2024-11-03 08:00:00 (Sun)
63877194000, #      utc_end 2025-03-09 09:00:00 (Sun)
63866278800, #  local_start 2024-11-03 01:00:00 (Sun)
63877168800, #    local_end 2025-03-09 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63877194000, #    utc_start 2025-03-09 09:00:00 (Sun)
63897753600, #      utc_end 2025-11-02 08:00:00 (Sun)
63877172400, #  local_start 2025-03-09 03:00:00 (Sun)
63897732000, #    local_end 2025-11-02 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63897753600, #    utc_start 2025-11-02 08:00:00 (Sun)
63908643600, #      utc_end 2026-03-08 09:00:00 (Sun)
63897728400, #  local_start 2025-11-02 01:00:00 (Sun)
63908618400, #    local_end 2026-03-08 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63908643600, #    utc_start 2026-03-08 09:00:00 (Sun)
63929203200, #      utc_end 2026-11-01 08:00:00 (Sun)
63908622000, #  local_start 2026-03-08 03:00:00 (Sun)
63929181600, #    local_end 2026-11-01 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63929203200, #    utc_start 2026-11-01 08:00:00 (Sun)
63940698000, #      utc_end 2027-03-14 09:00:00 (Sun)
63929178000, #  local_start 2026-11-01 01:00:00 (Sun)
63940672800, #    local_end 2027-03-14 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63940698000, #    utc_start 2027-03-14 09:00:00 (Sun)
63961257600, #      utc_end 2027-11-07 08:00:00 (Sun)
63940676400, #  local_start 2027-03-14 03:00:00 (Sun)
63961236000, #    local_end 2027-11-07 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63961257600, #    utc_start 2027-11-07 08:00:00 (Sun)
63972147600, #      utc_end 2028-03-12 09:00:00 (Sun)
63961232400, #  local_start 2027-11-07 01:00:00 (Sun)
63972122400, #    local_end 2028-03-12 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
63972147600, #    utc_start 2028-03-12 09:00:00 (Sun)
63992707200, #      utc_end 2028-11-05 08:00:00 (Sun)
63972126000, #  local_start 2028-03-12 03:00:00 (Sun)
63992685600, #    local_end 2028-11-05 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
63992707200, #    utc_start 2028-11-05 08:00:00 (Sun)
64003597200, #      utc_end 2029-03-11 09:00:00 (Sun)
63992682000, #  local_start 2028-11-05 01:00:00 (Sun)
64003572000, #    local_end 2029-03-11 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
64003597200, #    utc_start 2029-03-11 09:00:00 (Sun)
64024156800, #      utc_end 2029-11-04 08:00:00 (Sun)
64003575600, #  local_start 2029-03-11 03:00:00 (Sun)
64024135200, #    local_end 2029-11-04 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
64024156800, #    utc_start 2029-11-04 08:00:00 (Sun)
64035046800, #      utc_end 2030-03-10 09:00:00 (Sun)
64024131600, #  local_start 2029-11-04 01:00:00 (Sun)
64035021600, #    local_end 2030-03-10 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
64035046800, #    utc_start 2030-03-10 09:00:00 (Sun)
64055606400, #      utc_end 2030-11-03 08:00:00 (Sun)
64035025200, #  local_start 2030-03-10 03:00:00 (Sun)
64055584800, #    local_end 2030-11-03 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
    [
64055606400, #    utc_start 2030-11-03 08:00:00 (Sun)
64066496400, #      utc_end 2031-03-09 09:00:00 (Sun)
64055581200, #  local_start 2030-11-03 01:00:00 (Sun)
64066471200, #    local_end 2031-03-09 02:00:00 (Sun)
-25200,
0,
'MST',
    ],
    [
64066496400, #    utc_start 2031-03-09 09:00:00 (Sun)
64087056000, #      utc_end 2031-11-02 08:00:00 (Sun)
64066474800, #  local_start 2031-03-09 03:00:00 (Sun)
64087034400, #    local_end 2031-11-02 02:00:00 (Sun)
-21600,
1,
'MDT',
    ],
];

sub olson_version {'2020e'}

sub has_dst_changes {36}

sub _max_year {2030}

sub _new_instance {
    return shift->_init( @_, spans => $spans );
}

sub _last_offset { -25200 }

my $last_observance = bless( {
  'format' => 'M%sT',
  'gmtoff' => '-7:00',
  'local_start_datetime' => bless( {
    'formatter' => undef,
    'local_rd_days' => 733773,
    'local_rd_secs' => 0,
    'offset_modifier' => 0,
    'rd_nanosecs' => 0,
    'tz' => bless( {
      'name' => 'floating',
      'offset' => 0
    }, 'DateTime::TimeZone::Floating' ),
    'utc_rd_days' => 733773,
    'utc_rd_secs' => 0,
    'utc_year' => 2011
  }, 'DateTime' ),
  'offset_from_std' => 0,
  'offset_from_utc' => -25200,
  'until' => [],
  'utc_start_datetime' => bless( {
    'formatter' => undef,
    'local_rd_days' => 733773,
    'local_rd_secs' => 25200,
    'offset_modifier' => 0,
    'rd_nanosecs' => 0,
    'tz' => bless( {
      'name' => 'floating',
      'offset' => 0
    }, 'DateTime::TimeZone::Floating' ),
    'utc_rd_days' => 733773,
    'utc_rd_secs' => 25200,
    'utc_year' => 2011
  }, 'DateTime' )
}, 'DateTime::TimeZone::OlsonDB::Observance' )
;
sub _last_observance { $last_observance }

my $rules = [
  bless( {
    'at' => '2:00',
    'from' => '2007',
    'in' => 'Mar',
    'letter' => 'D',
    'name' => 'US',
    'offset_from_std' => 3600,
    'on' => 'Sun>=8',
    'save' => '1:00',
    'to' => 'max'
  }, 'DateTime::TimeZone::OlsonDB::Rule' ),
  bless( {
    'at' => '2:00',
    'from' => '2007',
    'in' => 'Nov',
    'letter' => 'S',
    'name' => 'US',
    'offset_from_std' => 0,
    'on' => 'Sun>=1',
    'save' => '0',
    'to' => 'max'
  }, 'DateTime::TimeZone::OlsonDB::Rule' )
]
;
sub _rules { $rules }


1;

