Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06766BFD9
	for <lists+openbmc@lfdr.de>; Mon, 16 Jan 2023 14:33:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwXzk61vHz3cBk
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 00:33:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=u6yLVjLC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.70; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=u6yLVjLC;
	dkim-atps=neutral
X-Greylist: delayed 397 seconds by postgrey-1.36 at boromir; Tue, 17 Jan 2023 00:33:18 AEDT
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwXz25Bfsz30Lt
	for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 00:33:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1673875994;
	bh=2WRmwP4EUAnZ074LMibxNdZMZTlz3R7ap8epKbDoicA=;
	h=Received:Received:From:To:Subject;
	b=u6yLVjLCJKeOApVRSOCFPMhS1RgKhDyESeHLEtDvfala4XSl/C7JJBejQtySQf8Tg
	 sncvKi609CT2Tfaey+BgupzohuQ6bWOJfJ/mdtkUdTIZkOmiHZ1mdehE6GTzyaVq0s
	 pwgIpCM5Xr3K+lGcJ+qexkzmCoZLjSuYDqIKiQV4=
Received: (qmail 471320 invoked from network); 16 Jan 2023 16:26:33 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO INVLT5250ZO)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (DHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 16 Jan 2023 16:26:33 +0300
From: <zehra.ozdemir@inventron.com.tr>
To: <openbmc@lists.ozlabs.org>
Subject: Sdbusplus Build Errors
Date: Mon, 16 Jan 2023 16:26:32 +0300
Message-ID: <000201d929ae$266f7fb0$734e7f10$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01D929C7.4BD6A850"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdkprCuEt6Mn8u4dR7WzjEBW18nalg==
Content-Language: en-us
X-PPP-Message-ID: <167387559364.471312.17731574252998398718@ns1.ihsdnsx51.com>
X-PPP-Vhost: inventron.com.tr
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0003_01D929C7.4BD6A850
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I am trying to build sdbusplus for phosphor-ipmi-flash host-tool.
Currrently, the ubuntu version  is 22.04 LTS, the gcc version is 12.1.0,
g++ and c++ versions are 11.3.0. 

 c++-20 is used in meson.build file and it is given as a parameter. There is
no latest version that i can install when i look at all c++ and g++ versions
in ubuntu 22.04. I got errors about some methods of cpp libraries when I run
ninja command :

 

 

[1/52] Compiling C++ object
example/calculator-server.p/calculator-server.cpp.o

FAILED: example/calculator-server.p/calculator-server.cpp.o 

ccache c++ -Iexample/calculator-server.p -Iexample/gen -I../example/gen
-I../include -I/usr/include -fdiagnostics-color=always
-D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -Werror
-std=c++20 -O2 -g -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_COROUTINES_NO_DEPRECATION_WARNING -MD -MQ
example/calculator-server.p/calculator-server.cpp.o -MF
example/calculator-server.p/calculator-server.cpp.o.d -o
example/calculator-server.p/calculator-server.cpp.o -c
../example/calculator-server.cpp

In file included from ../include/sdbusplus/server.hpp:4,

                 from example/gen/net/poettering/Calculator/server.hpp:6,

                 from ../example/calculator-server.cpp:3:

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::sender(std::string_view)':

../include/sdbusplus/bus/match.hpp:126:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::sender(std::string_view)'

  126 | inline constexpr auto sender(std::string_view s) noexcept

      |                       ^~~~~~

In file included from /usr/include/c++/11/string:55,

                 from ../include/sdbusplus/exception.hpp:8,

                 from example/gen/net/poettering/Calculator/error.hpp:4,

                 from ../example/calculator-server.cpp:2:

/usr/include/c++/11/bits/basic_string.h:85:11: note:
'std::__cxx11::basic_string<char>' is not literal because:

   85 |     class basic_string

      |           ^~~~~~~~~~~~

/usr/include/c++/11/bits/basic_string.h:85:11: note:
'std::__cxx11::basic_string<char>' does not have 'constexpr' destructor

In file included from ../include/sdbusplus/server.hpp:4,

                 from example/gen/net/poettering/Calculator/server.hpp:6,

                 from ../example/calculator-server.cpp:3:

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::interface(std::string_view)':

../include/sdbusplus/bus/match.hpp:130:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::interface(std::string_view)'

  130 | inline constexpr auto interface(std::string_view s) noexcept

      |                       ^~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::member(std::string_view)':

../include/sdbusplus/bus/match.hpp:134:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::member(std::string_view)'

  134 | inline constexpr auto member(std::string_view s) noexcept

      |                       ^~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::path(std::string_view)':

../include/sdbusplus/bus/match.hpp:138:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::path(std::string_view)'

  138 | inline constexpr auto path(std::string_view s) noexcept

      |                       ^~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::path_namespace(std::string_view)':

../include/sdbusplus/bus/match.hpp:142:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::path_namespace(std::string_view)'

  142 | inline constexpr auto path_namespace(std::string_view s) noexcept

      |                       ^~~~~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::destination(std::string_view)':

../include/sdbusplus/bus/match.hpp:146:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::destination(std::string_view)'

  146 | inline constexpr auto destination(std::string_view s) noexcept

      |                       ^~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::arg0namespace(std::string_view)':

../include/sdbusplus/bus/match.hpp:161:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::arg0namespace(std::string_view)'

  161 | inline constexpr auto arg0namespace(std::string_view s) noexcept

      |                       ^~~~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)':

../include/sdbusplus/bus/match.hpp:191:30: error: invalid return type
'std::string' {aka 'std::__cxx11::basic_string<char>'} of 'constexpr'
function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)'

  191 | inline constexpr std::string interfacesAdded(std::string_view p)
noexcept

      |                              ^~~~~~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)':

../include/sdbusplus/bus/match.hpp:196:30: error: invalid return type
'std::string' {aka 'std::__cxx11::basic_string<char>'} of 'constexpr'
function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)'

  196 | inline constexpr std::string interfacesRemoved(std::string_view p)
noexcept

      |                              ^~~~~~~~~~~~~~~~~

[2/52] Compiling C++ object
example/ca...net_poettering_Calculator_server.cpp.o

FAILED:
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calculator
_server.cpp.o 

ccache c++ -Iexample/calculator-server.p -Iexample/gen -I../example/gen
-I../include -I/usr/include -fdiagnostics-color=always
-D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -Werror
-std=c++20 -O2 -g -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY
-DBOOST_COROUTINES_NO_DEPRECATION_WARNING -MD -MQ
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calculator
_server.cpp.o -MF
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calculator
_server.cpp.o.d -o
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calculator
_server.cpp.o -c example/gen/net/poettering/Calculator/server.cpp

In file included from ../include/sdbusplus/server.hpp:4,

                 from ../include/sdbusplus/sdbuspp_support/server.hpp:3,

                 from example/gen/net/poettering/Calculator/server.cpp:5:

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::sender(std::string_view)':

../include/sdbusplus/bus/match.hpp:126:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::sender(std::string_view)'

  126 | inline constexpr auto sender(std::string_view s) noexcept

      |                       ^~~~~~

In file included from /usr/include/c++/11/string:55,

                 from /usr/include/c++/11/bits/locale_classes.h:40,

                 from /usr/include/c++/11/bits/ios_base.h:41,

                 from /usr/include/c++/11/streambuf:41,

                 from /usr/include/c++/11/bits/streambuf_iterator.h:35,

                 from /usr/include/c++/11/iterator:66,

                 from /usr/include/c++/11/bits/ranges_algobase.h:36,

                 from /usr/include/c++/11/bits/ranges_algo.h:35,

                 from /usr/include/c++/11/algorithm:64,

                 from example/gen/net/poettering/Calculator/server.cpp:1:

/usr/include/c++/11/bits/basic_string.h:85:11: note:
'std::__cxx11::basic_string<char>' is not literal because:

   85 |     class basic_string

      |           ^~~~~~~~~~~~

/usr/include/c++/11/bits/basic_string.h:85:11: note:
'std::__cxx11::basic_string<char>' does not have 'constexpr' destructor

In file included from ../include/sdbusplus/server.hpp:4,

                 from ../include/sdbusplus/sdbuspp_support/server.hpp:3,

                 from example/gen/net/poettering/Calculator/server.cpp:5:

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::interface(std::string_view)':

../include/sdbusplus/bus/match.hpp:130:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::interface(std::string_view)'

  130 | inline constexpr auto interface(std::string_view s) noexcept

      |                       ^~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::member(std::string_view)':

../include/sdbusplus/bus/match.hpp:134:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::member(std::string_view)'

  134 | inline constexpr auto member(std::string_view s) noexcept

      |                       ^~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::path(std::string_view)':

../include/sdbusplus/bus/match.hpp:138:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::path(std::string_view)'

  138 | inline constexpr auto path(std::string_view s) noexcept

      |                       ^~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::path_namespace(std::string_view)':

../include/sdbusplus/bus/match.hpp:142:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::path_namespace(std::string_view)'

  142 | inline constexpr auto path_namespace(std::string_view s) noexcept

      |                       ^~~~~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::destination(std::string_view)':

../include/sdbusplus/bus/match.hpp:146:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::destination(std::string_view)'

  146 | inline constexpr auto destination(std::string_view s) noexcept

      |                       ^~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr auto
sdbusplus::bus::match::rules::arg0namespace(std::string_view)':

../include/sdbusplus/bus/match.hpp:161:23: error: invalid return type
'std::__cxx11::basic_string<char>' of 'constexpr' function 'constexpr auto
sdbusplus::bus::match::rules::arg0namespace(std::string_view)'

  161 | inline constexpr auto arg0namespace(std::string_view s) noexcept

      |                       ^~~~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)':

../include/sdbusplus/bus/match.hpp:191:30: error: invalid return type
'std::string' {aka 'std::__cxx11::basic_string<char>'} of 'constexpr'
function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)'

  191 | inline constexpr std::string interfacesAdded(std::string_view p)
noexcept

      |                              ^~~~~~~~~~~~~~~

../include/sdbusplus/bus/match.hpp: In function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)':

../include/sdbusplus/bus/match.hpp:196:30: error: invalid return type
'std::string' {aka 'std::__cxx11::basic_string<char>'} of 'constexpr'
function 'constexpr std::string
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)'

  196 | inline constexpr std::string interfacesRemoved(std::string_view p)
noexcept

      |                              ^~~~~~~~~~~~~~~~~

[3/52] Compiling C++ object libsdbusplus.so.1.0.0.p/src_async_match.cpp.o

FAILED: libsdbusplus.so.1.0.0.p/src_async_match.cpp.o 

ccache c++ -Ilibsdbusplus.so.1.0.0.p -I. -I.. -I../include
-fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch
-Wextra -Wpedantic -Werror -std=c++20 -O2 -g -fPIC -MD -MQ
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o -MF
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o.d -o
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o -c ../src/async/match.cpp

In file included from ../include/sdbusplus/async/match.hpp:4,

                 from ../src/async/match.cpp:1...

 

I could not see any documentation that contains which versions must be used
to avoid getting these errors actually. Could you please give me some
information about it?

 


------=_NextPart_000_0003_01D929C7.4BD6A850
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:inherit;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.E-postaStili17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DTR =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p class=3DMsoNormal>I am trying =
to build sdbusplus for phosphor-ipmi-flash host-tool. Currrently, the =
ubuntu version &nbsp;is 22.04 LTS, the gcc version is 12.1.0, &nbsp;g++ =
and c++ versions are 11.3.0. <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;c++-20 is used in meson.build file and it is =
given as a parameter. There is no latest version that i can install when =
i look at all c++ and g++ versions in ubuntu 22.04. I got errors about =
some methods of cpp libraries when I run ninja command =
:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>[1/52] Compiling C++ object =
example/calculator-server.p/calculator-server.cpp.o<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>FAILED: =
example/calculator-server.p/calculator-server.cpp.o =
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>ccache c++ -Iexample/calculator-server.p =
-Iexample/gen -I../example/gen -I../include -I/usr/include =
-fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall =
-Winvalid-pch -Wextra -Wpedantic -Werror -std=3Dc++20 -O2 -g =
-DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB =
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY =
-DBOOST_COROUTINES_NO_DEPRECATION_WARNING -MD -MQ =
example/calculator-server.p/calculator-server.cpp.o -MF =
example/calculator-server.p/calculator-server.cpp.o.d -o =
example/calculator-server.p/calculator-server.cpp.o -c =
../example/calculator-server.cpp<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
../include/sdbusplus/server.hpp:4,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
example/gen/net/poettering/Calculator/server.hpp:6,<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../example/calculator-server.cpp:3:<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::sender(std::string_view)&#8217;:<o:p></o:p>=
</span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:126:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::sender(std::string_view)&#8217;<o:p></o:p><=
/span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 126 | inline constexpr auto =
sender(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
/usr/include/c++/11/string:55,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../include/sdbusplus/exception.hpp:8,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
example/gen/net/poettering/Calculator/error.hpp:4,<o:p></o:p></span></p><=
p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../example/calculator-server.cpp:2:<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>/usr/include/c++/11/bits/basic_string.h:85:11: note: =
&#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; is not literal =
because:<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp; 85 |&nbsp;&nbsp;&nbsp;&nbsp; class =
basic_string<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>/usr/include/c++/11/bits/basic_string.h:85:11: =
note:&nbsp;&nbsp; &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
does not have &#8216;constexpr&#8217; destructor<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
../include/sdbusplus/server.hpp:4,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;from =
example/gen/net/poettering/Calculator/server.hpp:6,<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../example/calculator-server.cpp:3:<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::interface(std::string_view)&#8217;:<o:p></o=
:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:130:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::interface(std::string_view)&#8217;<o:p></o:=
p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 130 | inline constexpr auto =
interface(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::member(std::string_view)&#8217;:<o:p></o:p>=
</span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:134:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::member(std::string_view)&#8217;<o:p></o:p><=
/span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 134 | inline constexpr auto =
member(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::path(std::string_view)&#8217;:<o:p></o:p></=
span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:138:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::path(std::string_view)&#8217;<o:p></o:p></s=
pan></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 138 | inline constexpr auto =
path(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::path_namespace(std::string_view)&#8217;:<o:=
p></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:142:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::path_namespace(std::string_view)&#8217;<o:p=
></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 142 | inline constexpr auto =
path_namespace(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::destination(std::string_view)&#8217;:<o:p><=
/o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:146:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::destination(std::string_view)&#8217;<o:p></=
o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 146 | inline constexpr auto =
destination(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ^~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::arg0namespace(std::string_view)&#8217;:<o:p=
></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:161:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::arg0namespace(std::string_view)&#8217;<o:p>=
</o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 161 | inline constexpr auto =
arg0namespace(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)&#8217;:<o=
:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:191:30: error: =
invalid return type &#8216;std::string&#8217; {aka =
&#8216;std::__cxx11::basic_string&lt;char&gt;&#8217;} of =
&#8216;constexpr&#8217; function &#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)&#8217;<o:=
p></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 191 | inline constexpr std::string =
interfacesAdded(std::string_view p) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)&#8217;:=
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:196:30: error: =
invalid return type &#8216;std::string&#8217; {aka =
&#8216;std::__cxx11::basic_string&lt;char&gt;&#8217;} of =
&#8216;constexpr&#8217; function &#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)&#8217;<=
o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 196 | inline constexpr std::string =
interfacesRemoved(std::string_view p) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>[2/52] Compiling C++ object =
example/ca...net_poettering_Calculator_server.cpp.o<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>FAILED: =
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calcula=
tor_server.cpp.o <o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>ccache c++ -Iexample/calculator-server.p =
-Iexample/gen -I../example/gen -I../include -I/usr/include =
-fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall =
-Winvalid-pch -Wextra -Wpedantic -Werror -std=3Dc++20 -O2 -g =
-DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB =
-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY =
-DBOOST_COROUTINES_NO_DEPRECATION_WARNING -MD -MQ =
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calcula=
tor_server.cpp.o -MF =
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calcula=
tor_server.cpp.o.d -o =
example/calculator-server.p/meson-generated_.._gen_net_poettering_Calcula=
tor_server.cpp.o -c =
example/gen/net/poettering/Calculator/server.cpp<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
../include/sdbusplus/server.hpp:4,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../include/sdbusplus/sdbuspp_support/server.hpp:3,<o:p></o:p></span></p><=
p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
example/gen/net/poettering/Calculator/server.cpp:5:<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::sender(std::string_view)&#8217;:<o:p></o:p>=
</span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:126:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::sender(std::string_view)&#8217;<o:p></o:p><=
/span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 126 | inline constexpr auto =
sender(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
/usr/include/c++/11/string:55,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/bits/locale_classes.h:40,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/bits/ios_base.h:41,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/streambuf:41,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/bits/streambuf_iterator.h:35,<o:p></o:p></span></p><p=
 class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/iterator:66,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/bits/ranges_algobase.h:36,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/bits/ranges_algo.h:35,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
/usr/include/c++/11/algorithm:64,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
example/gen/net/poettering/Calculator/server.cpp:1:<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>/usr/include/c++/11/bits/basic_string.h:85:11: note: =
&#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; is not literal =
because:<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp; 85 |&nbsp;&nbsp;&nbsp;&nbsp; class =
basic_string<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>/usr/include/c++/11/bits/basic_string.h:85:11: =
note:&nbsp;&nbsp; &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
does not have &#8216;constexpr&#8217; destructor<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
../include/sdbusplus/server.hpp:4,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../include/sdbusplus/sdbuspp_support/server.hpp:3,<o:p></o:p></span></p><=
p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
example/gen/net/poettering/Calculator/server.cpp:5:<o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::interface(std::string_view)&#8217;:<o:p></o=
:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:130:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::interface(std::string_view)&#8217;<o:p></o:=
p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 130 | inline constexpr auto =
interface(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::member(std::string_view)&#8217;:<o:p></o:p>=
</span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:134:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::member(std::string_view)&#8217;<o:p></o:p><=
/span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 134 | inline constexpr auto =
member(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::path(std::string_view)&#8217;:<o:p></o:p></=
span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:138:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::path(std::string_view)&#8217;<o:p></o:p></s=
pan></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 138 | inline constexpr auto =
path(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::path_namespace(std::string_view)&#8217;:<o:=
p></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:142:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::path_namespace(std::string_view)&#8217;<o:p=
></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 142 | inline constexpr auto =
path_namespace(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::destination(std::string_view)&#8217;:<o:p><=
/o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:146:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::destination(std::string_view)&#8217;<o:p></=
o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 146 | inline constexpr auto =
destination(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr auto =
sdbusplus::bus::match::rules::arg0namespace(std::string_view)&#8217;:<o:p=
></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:161:23: error: =
invalid return type &#8216;std::__cxx11::basic_string&lt;char&gt;&#8217; =
of &#8216;constexpr&#8217; function &#8216;constexpr auto =
sdbusplus::bus::match::rules::arg0namespace(std::string_view)&#8217;<o:p>=
</o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 161 | inline constexpr auto =
arg0namespace(std::string_view s) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~~~<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)&#8217;:<o=
:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:191:30: error: =
invalid return type &#8216;std::string&#8217; {aka =
&#8216;std::__cxx11::basic_string&lt;char&gt;&#8217;} of =
&#8216;constexpr&#8217; function &#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesAdded(std::string_view)&#8217;<o:=
p></o:p></span></p><p class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 191 | inline constexpr std::string =
interfacesAdded(std::string_view p) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp: In function =
&#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)&#8217;:=
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>../include/sdbusplus/bus/match.hpp:196:30: error: =
invalid return type &#8216;std::string&#8217; {aka =
&#8216;std::__cxx11::basic_string&lt;char&gt;&#8217;} of =
&#8216;constexpr&#8217; function &#8216;constexpr std::string =
sdbusplus::bus::match::rules::interfacesRemoved(std::string_view)&#8217;<=
o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp; 196 | inline constexpr std::string =
interfacesRemoved(std::string_view p) noexcept<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>[3/52] Compiling C++ object =
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>FAILED: =
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o <o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>ccache c++ -Ilibsdbusplus.so.1.0.0.p -I. -I.. =
-I../include -fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall =
-Winvalid-pch -Wextra -Wpedantic -Werror -std=3Dc++20 -O2 -g -fPIC -MD =
-MQ libsdbusplus.so.1.0.0.p/src_async_match.cpp.o -MF =
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o.d -o =
libsdbusplus.so.1.0.0.p/src_async_match.cpp.o -c =
../src/async/match.cpp<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>In file included from =
../include/sdbusplus/async/match.hpp:4,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'background:white'><span =
style=3D'font-size:10.0pt;font-family:"inherit",serif;color:#1D1C1D;mso-f=
areast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
../src/async/match.cpp:1...<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I could not =
see any documentation that contains which versions must be used to avoid =
getting these errors actually. Could you please give me some information =
about it?<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0003_01D929C7.4BD6A850--

