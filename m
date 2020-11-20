Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF572BB59D
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 20:34:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd6FR0tLnzDr1K
	for <lists+openbmc@lfdr.de>; Sat, 21 Nov 2020 06:34:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Lb8BgWAQ; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd6DP6hZRzDqsh
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2020 06:33:54 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id u19so15059932lfr.7
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 11:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27k7aG7DmMY9JFgMXEE7InBYh3/n3zZoOuxDok0DdYk=;
 b=Lb8BgWAQfBtUSc0+ZRdbV1pd3a16DU8KIZ7KMrUKUIV8GU0BWRjyuv4cvEUSnnJaZs
 85kOZiDTHeh3WRn0ygIXGGlWkUIEbY4rQlWChywQCb5mw1Vgod0gdM8I812xjfc7Qexc
 DW8DCU7mkD+OSpGXRHtfsDFiQTIoMSrcXHvKSomY90D51r/0GW1tqxEZEH4ghHLIyttZ
 cx4f3OWRel/kh5nQ3RTAXJxEyji3Vec3RYVMYvViz7x6J00VuEYyO45wEqf9wO8gfZXL
 l6ShMDPWh+kxY4MCaNCb1Z9ZNPE23z69yDVTM3GHzedHAbfrn9j5dsq4zHSDQ5uZZnjt
 Yu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27k7aG7DmMY9JFgMXEE7InBYh3/n3zZoOuxDok0DdYk=;
 b=lMvpAMBwAC55aP7JGVZEpYQzSYFOM7c1qjNtTRVk9b5mdTYQdV9AP2tOVRmxH7mfAl
 gsyEYNB9tjY8LYwW6vV3xLzvunsLVxuasRNbR5RxXdmc+16iQwpZf3beYnpBWeeSKvUI
 QKPf0rcYokm4U++9xDDMXmInWtCBtJ5LkhToagCQ79B9p0cHtcHoDx0xUUPDwvcV+CmK
 hxTX41QbQXY/QreesDEBWg9L9EyRHgeMe2As5gLal7UI5Bbv9YHqHlqGL5pDOsSdIDYr
 7zo7Z8HnDguIZa9tzqISign8CEWTo4VFx/5J42LvdTC8c6YYwXGdXHG8BSErRHQFaz7W
 UW6Q==
X-Gm-Message-State: AOAM532LU/rGhm2v2zVij2V9T8fN9cfkW2/XPJW4mZUQ6t5oY8LVjRzo
 z7pKZvbZI51FujxpPw+RbCwjtjpYH3j4MYHtU/xUpQ==
X-Google-Smtp-Source: ABdhPJzTjo1Bj9/8xoAbMNINxOxcl/c7hI/UsjulX9Wbn8rrfG/D69VgAlOcaQoBkGFK5+ow6gcADjHG/Sw4FJ3kbX0=
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr9080736lfr.430.1605900829272; 
 Fri, 20 Nov 2020 11:33:49 -0800 (PST)
MIME-Version: 1.0
References: <5af426cdbf754c2d898d37d7f591464d@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxPWFReD04Rmqgnitot6VP6aEKLRmKyM4gce1s4VgQ_nw@mail.gmail.com>
In-Reply-To: <CAO=notxPWFReD04Rmqgnitot6VP6aEKLRmKyM4gce1s4VgQ_nw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Fri, 20 Nov 2020 14:33:38 -0500
Message-ID: <CAPnigK=gakwpicdz7ut-TN5ShQZ8HKBvZkObEJcO6qvNrs=9Xg@mail.gmail.com>
Subject: Re: Failure building burn_my_bmc
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000079beb905b48eecdd"
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "brandonkim@google.com" <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000079beb905b48eecdd
Content-Type: text/plain; charset="UTF-8"

Just make sure you have span-lite installed first if you are
installing everything locally https://github.com/martinmoene/span-lite

On Wed, Nov 18, 2020 at 7:28 PM Patrick Venture <venture@google.com> wrote:

> On Wed, Nov 18, 2020 at 3:18 PM Patrick Voelker
> <Patrick_Voelker@phoenix.com> wrote:
> >
> > I'm having an issue building burn_my_bmc with the instructions listed on
> https://github.com/openbmc/phosphor-ipmi-flash . Got through building all
> the dependencies but I get the following errors when building
> pci.cpp.  Looks like maybe stdplus changed?
>
> William, PTAL, thanks!
>
> >
> > pvoelker@bmc-dev:~/bmc/host-tool/phosphor-ipmi-flash$ make
> > make  all-recursive
> > make[1]: Entering directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> > Making all in .
> > make[2]: Entering directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> >   CXX      internal/libfirmware_common_la-sys.lo
> >   CXXLD    libfirmware_common.la
> > ar: `u' modifier ignored since `D' is the default (see `U')
> > make[2]: Leaving directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> > Making all in tools
> > make[2]: Entering directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> > Making all in .
> > make[3]: Entering directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> >   CXX      libupdater_la-updater.lo
> >   CXX      libupdater_la-handler.lo
> >   CXX      libupdater_la-helper.lo
> >   CXX      libupdater_la-bt.lo
> >   CXX      libupdater_la-lpc.lo
> >   CXX      libupdater_la-io.lo
> >   CXX      libupdater_la-net.lo
> >   CXX      libupdater_la-pci.lo
> > In file included from pci.cpp:17:0:
> > pci.hpp:40:39: error: 'span' in namespace 'stdplus' does not name a
> template type
> >      virtual void write(const stdplus::span<const std::uint8_t> data) =
> 0;
> >                                        ^~~~
> > pci.hpp:40:43: error: expected ',' or '...' before '<' token
> >      virtual void write(const stdplus::span<const std::uint8_t> data) =
> 0;
> >                                            ^
> > pci.hpp:51:39: error: 'span' in namespace 'stdplus' does not name a
> template type
> >      virtual void write(const stdplus::span<const std::uint8_t> data)
> override;
> >                                        ^~~~
> > pci.hpp:51:43: error: expected ',' or '...' before '<' token
> >      virtual void write(const stdplus::span<const std::uint8_t> data)
> override;
> >                                            ^
> > pci.cpp:105:44: error: 'span' in namespace 'stdplus' does not name a
> template type
> >  void PciAccessBridge::write(const stdplus::span<const std::uint8_t>
> data)
> >                                             ^~~~
> > pci.cpp:105:48: error: expected ',' or '...' before '<' token
> >  void PciAccessBridge::write(const stdplus::span<const std::uint8_t>
> data)
> >                                                 ^
> > pci.cpp: In member function 'virtual void
> host_tool::PciAccessBridge::write(int)':
> > pci.cpp:107:9: error: 'data' was not declared in this scope
> >      if (data.size() > dataLength)
> >          ^~~~
> > pci.cpp:107:9: note: suggested alternatives:
> > In file included from /usr/include/c++/7/string:51:0,
> >                  from /usr/include/c++/7/stdexcept:39,
> >                  from /usr/include/c++/7/system_error:41,
> >                  from ../internal/sys.hpp:19,
> >                  from pci.hpp:20,
> >                  from pci.cpp:17:
> > /usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
> >      data(initializer_list<_Tp> __il) noexcept
> >      ^~~~
> > In file included from pci.cpp:26:0:
> > /usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
> >  struct data : basic_data<> {};
> >         ^~~~
> > pci.cpp:114:36: error: 'data' was not declared in this scope
> >      std::memcpy(addr + dataOffset, data.data(), data.size());
> >                                     ^~~~
> > pci.cpp:114:36: note: suggested alternatives:
> > In file included from /usr/include/c++/7/string:51:0,
> >                  from /usr/include/c++/7/stdexcept:39,
> >                  from /usr/include/c++/7/system_error:41,
> >                  from ../internal/sys.hpp:19,
> >                  from pci.hpp:20,
> >                  from pci.cpp:17:
> > /usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
> >      data(initializer_list<_Tp> __il) noexcept
> >      ^~~~
> > In file included from pci.cpp:26:0:
> > /usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
> >  struct data : basic_data<> {};
> >         ^~~~
> > Makefile:654: recipe for target 'libupdater_la-pci.lo' failed
> > make[3]: *** [libupdater_la-pci.lo] Error 1
> > make[3]: Leaving directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> > Makefile:708: recipe for target 'all-recursive' failed
> > make[2]: *** [all-recursive] Error 1
> > make[2]: Leaving directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> > Makefile:608: recipe for target 'all-recursive' failed
> > make[1]: *** [all-recursive] Error 1
> > make[1]: Leaving directory
> '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> > Makefile:474: recipe for target 'all' failed
> > make: *** [all] Error 2
> >
>

--00000000000079beb905b48eecdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just make sure you have span-lite installed first if you a=
re installing=C2=A0everything locally=C2=A0<a href=3D"https://github.com/ma=
rtinmoene/span-lite">https://github.com/martinmoene/span-lite</a></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, No=
v 18, 2020 at 7:28 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.=
com">venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Wed, Nov 18, 2020 at 3:18 PM Patrick Voelker<br>
&lt;<a href=3D"mailto:Patrick_Voelker@phoenix.com" target=3D"_blank">Patric=
k_Voelker@phoenix.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I&#39;m having an issue building burn_my_bmc with the instructions lis=
ted on <a href=3D"https://github.com/openbmc/phosphor-ipmi-flash" rel=3D"no=
referrer" target=3D"_blank">https://github.com/openbmc/phosphor-ipmi-flash<=
/a> . Got through building all the dependencies but I get the following err=
ors when building<br>
pci.cpp.=C2=A0 Looks like maybe stdplus changed?<br>
<br>
William, PTAL, thanks!<br>
<br>
&gt;<br>
&gt; pvoelker@bmc-dev:~/bmc/host-tool/phosphor-ipmi-flash$ make<br>
&gt; make=C2=A0 all-recursive<br>
&gt; make[1]: Entering directory &#39;/home/pvoelker/bmc/host-tool/phosphor=
-ipmi-flash&#39;<br>
&gt; Making all in .<br>
&gt; make[2]: Entering directory &#39;/home/pvoelker/bmc/host-tool/phosphor=
-ipmi-flash&#39;<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 internal/libfirmware_common_la-sys=
.lo<br>
&gt;=C2=A0 =C2=A0CXXLD=C2=A0 =C2=A0 <a href=3D"http://libfirmware_common.la=
" rel=3D"noreferrer" target=3D"_blank">libfirmware_common.la</a><br>
&gt; ar: `u&#39; modifier ignored since `D&#39; is the default (see `U&#39;=
)<br>
&gt; make[2]: Leaving directory &#39;/home/pvoelker/bmc/host-tool/phosphor-=
ipmi-flash&#39;<br>
&gt; Making all in tools<br>
&gt; make[2]: Entering directory &#39;/home/pvoelker/bmc/host-tool/phosphor=
-ipmi-flash/tools&#39;<br>
&gt; Making all in .<br>
&gt; make[3]: Entering directory &#39;/home/pvoelker/bmc/host-tool/phosphor=
-ipmi-flash/tools&#39;<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-updater.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-handler.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-helper.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-bt.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-lpc.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-io.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-net.lo<br>
&gt;=C2=A0 =C2=A0CXX=C2=A0 =C2=A0 =C2=A0 libupdater_la-pci.lo<br>
&gt; In file included from pci.cpp:17:0:<br>
&gt; pci.hpp:40:39: error: &#39;span&#39; in namespace &#39;stdplus&#39; do=
es not name a template type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 virtual void write(const stdplus::span&lt;const st=
d::uint8_t&gt; data) =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<=
br>
&gt; pci.hpp:40:43: error: expected &#39;,&#39; or &#39;...&#39; before &#3=
9;&lt;&#39; token<br>
&gt;=C2=A0 =C2=A0 =C2=A0 virtual void write(const stdplus::span&lt;const st=
d::uint8_t&gt; data) =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
&gt; pci.hpp:51:39: error: &#39;span&#39; in namespace &#39;stdplus&#39; do=
es not name a template type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 virtual void write(const stdplus::span&lt;const st=
d::uint8_t&gt; data) override;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<=
br>
&gt; pci.hpp:51:43: error: expected &#39;,&#39; or &#39;...&#39; before &#3=
9;&lt;&#39; token<br>
&gt;=C2=A0 =C2=A0 =C2=A0 virtual void write(const stdplus::span&lt;const st=
d::uint8_t&gt; data) override;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
&gt; pci.cpp:105:44: error: &#39;span&#39; in namespace &#39;stdplus&#39; d=
oes not name a template type<br>
&gt;=C2=A0 void PciAccessBridge::write(const stdplus::span&lt;const std::ui=
nt8_t&gt; data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~<br>
&gt; pci.cpp:105:48: error: expected &#39;,&#39; or &#39;...&#39; before &#=
39;&lt;&#39; token<br>
&gt;=C2=A0 void PciAccessBridge::write(const stdplus::span&lt;const std::ui=
nt8_t&gt; data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; pci.cpp: In member function &#39;virtual void host_tool::PciAccessBrid=
ge::write(int)&#39;:<br>
&gt; pci.cpp:107:9: error: &#39;data&#39; was not declared in this scope<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 if (data.size() &gt; dataLength)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; pci.cpp:107:9: note: suggested alternatives:<br>
&gt; In file included from /usr/include/c++/7/string:51:0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /us=
r/include/c++/7/stdexcept:39,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /us=
r/include/c++/7/system_error:41,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../=
internal/sys.hpp:19,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from pci=
.hpp:20,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from pci=
.cpp:17:<br>
&gt; /usr/include/c++/7/bits/range_access.h:318:5: note:=C2=A0 =C2=A0&#39;s=
td::data&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 data(initializer_list&lt;_Tp&gt; __il) noexcept<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; In file included from pci.cpp:26:0:<br>
&gt; /usr/local/include/fmt/format.h:952:8: note:=C2=A0 =C2=A0&#39;fmt::v7:=
:detail::data&#39;<br>
&gt;=C2=A0 struct data : basic_data&lt;&gt; {};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; pci.cpp:114:36: error: &#39;data&#39; was not declared in this scope<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 std::memcpy(addr + dataOffset, data.data(), data.s=
ize());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; pci.cpp:114:36: note: suggested alternatives:<br>
&gt; In file included from /usr/include/c++/7/string:51:0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /us=
r/include/c++/7/stdexcept:39,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /us=
r/include/c++/7/system_error:41,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../=
internal/sys.hpp:19,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from pci=
.hpp:20,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from pci=
.cpp:17:<br>
&gt; /usr/include/c++/7/bits/range_access.h:318:5: note:=C2=A0 =C2=A0&#39;s=
td::data&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 data(initializer_list&lt;_Tp&gt; __il) noexcept<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; In file included from pci.cpp:26:0:<br>
&gt; /usr/local/include/fmt/format.h:952:8: note:=C2=A0 =C2=A0&#39;fmt::v7:=
:detail::data&#39;<br>
&gt;=C2=A0 struct data : basic_data&lt;&gt; {};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; Makefile:654: recipe for target &#39;libupdater_la-pci.lo&#39; failed<=
br>
&gt; make[3]: *** [libupdater_la-pci.lo] Error 1<br>
&gt; make[3]: Leaving directory &#39;/home/pvoelker/bmc/host-tool/phosphor-=
ipmi-flash/tools&#39;<br>
&gt; Makefile:708: recipe for target &#39;all-recursive&#39; failed<br>
&gt; make[2]: *** [all-recursive] Error 1<br>
&gt; make[2]: Leaving directory &#39;/home/pvoelker/bmc/host-tool/phosphor-=
ipmi-flash/tools&#39;<br>
&gt; Makefile:608: recipe for target &#39;all-recursive&#39; failed<br>
&gt; make[1]: *** [all-recursive] Error 1<br>
&gt; make[1]: Leaving directory &#39;/home/pvoelker/bmc/host-tool/phosphor-=
ipmi-flash&#39;<br>
&gt; Makefile:474: recipe for target &#39;all&#39; failed<br>
&gt; make: *** [all] Error 2<br>
&gt;<br>
</blockquote></div>

--00000000000079beb905b48eecdd--
