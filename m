Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DA55E5D2
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 17:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXTcf2hVdz3c9W
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 01:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZPMmeXYb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZPMmeXYb;
	dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXTcD3jWTz3brm
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 01:51:55 +1000 (AEST)
Received: by mail-il1-x12e.google.com with SMTP id p9so8151301ilj.7
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8z9kpBHLUVewvym/4Uy093fsTTexEE47z5rhz1A2LI=;
        b=ZPMmeXYbQ25ddaSM8Eulno4Uu5HTh3KIpfKj7SM350uy615qurumv7JYk3iapXUr57
         aGhStiR6oToyaIaMl6IxX/wBQTnY3/RERQEyC4aPdBWkbxlIWhFoK4i+XVkmSBEy9sAq
         4P2EShSCgWGmIbSR66Sv6CYF1IS/evUXSJZ6WSwJHZzjgLTCfTyU6V6eWbeKzWQDzhk+
         b5gjO0MjpO/orL/CE1Hm+hHFTNQNAjxFqi5zXKNG9zvU/Lmj2u88cERkv6NBObHFKKFV
         BPnRmOdWRR+vbKEFN+dqzoMy+t/3/FGBrNWhZMU/M7jFkSpUB9arfojqqMfPjh2o5kTw
         MLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8z9kpBHLUVewvym/4Uy093fsTTexEE47z5rhz1A2LI=;
        b=7reGy5ZwpytUCCpi3ImB2KxrIE+Mfw93mngM8SVY1tLFikmr7qZjFkEdDzgtnaBcz1
         s4rqt/k1PBc4lOD2p5ybO3MM4SRUSM1WjDgvh+i+cBOhItrSgk1M9ONq69/cTgHpcy7I
         QHqi5k0oCMnFBLLTApdNMT7APiovBwtjlvUT2H/ZZFPrCDf6FMNY9/0VUx1w7Yaw6gmS
         8j6DKb58H1PEYN/MQT7OByXBgy1JqwQYvZt+NFiwnFmHJrqdm300CqROiS8ASHmq57RA
         ouuUkX+aZhl24MnM6UipLuvKGdG75lX1hP6tqrL9qaWLa/sFDVa1cyS+AFHLnG5lepdF
         ZH7A==
X-Gm-Message-State: AJIora9/N+Yey4BMYZxo0tmQw0Tm0yIHEGtbEIT1DfBZ214fid84J6Cc
	MonZOyENrV+R0Qyxop3fU3WiSvb/cNmwGlwYAoaWmrsXJG24E0Yn
X-Google-Smtp-Source: AGRyM1uhNucDNxaKRI+7T5Yy2wvT6DxOriM0EOHbYbij1rps9z4dNc0fltHq29EUwCjiSmx8jyeezYDHoE8ShD+FmcI=
X-Received: by 2002:a05:6e02:1749:b0:2da:9a89:3961 with SMTP id
 y9-20020a056e02174900b002da9a893961mr5240759ill.258.1656431512397; Tue, 28
 Jun 2022 08:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Tue, 28 Jun 2022 08:51:41 -0700
Message-ID: <CALGRKGO0Y6FGTYu1rqH-YJCZgKXsPBHjjERmU7_5tOa0xg3M=A@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>, Willy Tu <wltu@google.com>
Content-Type: multipart/alternative; boundary="000000000000e4973105e28403f6"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e4973105e28403f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, it seems like the email chains were broken up for some reason - seeing
this now after I replied to the other email chain.

It is totally possible that our instructions in the README is not up to
date anymore, but just to make sure - are you building each of the
components as specified by
https://github.com/openbmc/phosphor-ipmi-flash#building-the-host-tool ?

It details the commands to use for each of the dependencies.

Good point on the burn_my_bmc command in the README description not being
not up to date and still using automake (
https://github.com/openbmc/phosphor-ipmi-flash#building-the-host-tool) -
I'll try to run this to verify when I get time later today, but in the
meantime perhaps @Willy Tu <wltu@google.com> may know the command off the
top of his head as he performed the big meson migration. As a first glance
the command looks correct.

Willy recently also migrated phospohr-host-ipmid to meson, so he may know
more about the PAM dependency as well.

Thanks,
Brandon


On Tue, Jun 28, 2022 at 8:04 AM Chris Chen (TPI) <Chris.Chen3@flex.com>
wrote:

> Hi Patrick,
>
> Thanks for your prompt reply, and the issue is solved after installing
> Ubuntu "libfmt-dev" package.
>
> >> Do you know why you disabled C++20?  This shouldn't have been necessar=
y
> >> and some of our code now requires C++20.
>
> I disabled C++20 of the "ipmi-blob-tool" package because I got errors
> below:
> =3D=3D=3D=3D=3D
> archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh
> + autoreconf -v -f -i
> autoreconf: export WARNINGS=3D
> autoreconf: Entering directory '.'
> autoreconf: configure.ac: not using Gettext
> autoreconf: running: aclocal --force -I m4
> configure.ac:38: error: invalid first argument `20' to
> AX_CXX_COMPILE_STDCXX
> /usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STDCXX is
> expanded from...
> configure.ac:38: the top level
> autom4te: error: /usr/bin/m4 failed with exit status: 1
> aclocal: error: /usr/bin/autom4te failed with exit status: 1
> autoreconf: error: aclocal failed with exit status: 1
> =3D=3D=3D=3D=3D
> Do you have ideas about how to solve it correctly?
>
> In addition, i have started to build the burn_my_bmc (the host-tool) on
> the Host by cloning the "phosphor-ipmi-flash" source. There are some
> questions came out:
>
>    - The "phosphor-ipmi-flash" package seems became to use "meson" rather
>    than "bootstrap.sh", so I run these commands in the source directory. =
Is it
>    correct?
>    -----
>    meson setup -Dbmc-blob-handler=3Ddisabled builddir
>    ninja -C builddir
>    ninja -C builddir install
>    - -----
>
>    - After running "meson setup -Dbmc-blob-handler=3Ddisabled builddir", =
it
>    occurred dependency errors, like 'sdbusplus', 'phosphor-dbus-interface=
s',
>    'libipmid', and so on is required respectively, is it correct?
>
>    - I for now have tried to install these dependencies one-by-one, but
>    be stuck at 'libipmid'. That is I clone the "phosphor-host-ipmid" and =
run
>    "meson builddir" command to build it, however, I got an error in blow =
and I
>    can't solve it. Could you please give me some suggestions?
>    - =3D=3D=3D=3D=3D
>    - Dependency sdeventplus from subproject subprojects/sdeventplus
>    found: YES 0.1
>    Dependency systemd found: YES 249 (cached)
>    Run-time dependency libcrypto found: YES 3.0.2
>
>    meson.build:89:0: ERROR: C++ shared or static library 'pam' not found
>    =3D=3D=3D=3D=3D
>
> Thanks.
>
> Regards,
> Chris Chen
>
> ------------------------------
> *=E5=AF=84=E4=BB=B6=E8=80=85:* Patrick Williams
> *=E5=B7=B2=E5=82=B3=E9=80=81:* =E6=98=9F=E6=9C=9F=E4=BA=8C, 2022 6 =E6=9C=
=88 28 =E6=97=A5 =E4=B8=8B=E5=8D=88 07:20
> *=E6=94=B6=E4=BB=B6=E8=80=85:* Chris Chen (TPI)
> *=E5=89=AF=E6=9C=AC:* openbmc@lists.ozlabs.org
> *=E4=B8=BB=E6=97=A8:* Re: [phosphor-ipmi-flash]: stdplus build failed bef=
ore building the
> host-tool on the Host
>
> On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:
> > And each library and tool is built successful(only one thing that is I
> had to disable C++20 for the ipmi-blob-tool, others were fine) untilI
> started to build the stdplus. I encountered a build failed issue as below=
.
> It looks like there is a problem for using libfmt.a, I tried to figure ou=
t
> a solution on google but nothing is related to this. Could anyone help on
> this? Thanks.
>
> Do you know why you disabled C++20?  This shouldn't have been necessary
> and some of our code now requires C++20.
>
> >
> > =3D=3D=3D=3D=3D
> > archer@archer-ArcherCityM:stdplus$
> > archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse
> -Dtests=3Ddisabled builddir
> > The Meson build system
> > Version: 0.61.2
> > Source dir: /home/archer/Downloads/host-tool/stdplus
> > Build dir: /home/archer/Downloads/host-tool/stdplus/builddir
> > Build type: native build
> > Project name: stdplus
> > Project version: 0.1
> > C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu
> 11.2.0-19ubuntu1) 11.2.0")
> > C++ linker for the host machine: c++ ld.bfd 2.38
> > Host machine cpu family: x86_64
> > Host machine cpu: x86_64
> > Found pkg-config: /usr/bin/pkg-config (0.29.2)
> > Run-time dependency fmt found: YES 8.1.2
>
> Where did this `fmt` come from?  Ubuntu has `libfmt-dev` that you can
> install which is version 8.1.1 on Jammy right now.
>
> > Library dl found: YES
> > Run-time dependency liburing found: YES 2.0
> > Build targets in project: 1
> >
> > stdplus 0.1
> >
> >   User defined options
> >     examples: false
> >     tests   : disabled
> >
> > Found ninja-1.10.1 at /usr/bin/ninja
> > archer@archer-ArcherCityM:stdplus$
> > archer@archer-ArcherCityM:stdplus$
> > archer@archer-ArcherCityM:stdplus$ ninja -C builddir
> > ninja: Entering directory `builddir'
> > [9/9] Linking target src/libstdplus.so.0.1
> > FAILED: src/libstdplus.so.0.1
> > c++  -o src/libstdplus.so.0.1
> src/libstdplus.so.0.1.p/stdplus_exception.cpp.o
> src/libstdplus.so.0.1.p/stdplus_signal.cpp.o
> src/libstdplus.so.0.1.p/stdplus_dl.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_managed.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_ops.cpp.o
> src/libstdplus.so.0.1.p/stdplus_io_uring.cpp.o -Wl,--as-needed
> -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libstdplus.so.0 /usr/local/lib/libfmt.a -ldl
> /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group
> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation
> against `stdout@@GLIBC_2.2.5' in read-only section `.text'
> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation
> R_X86_64_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when
> making a shared object; recompile with -fPIC
>
> However you obtained your libfmt, it was compiled incorrectly.  It
> shouldn't have a static library but a dynamic one.
>
> The `libfmt-dev` package has `libfmt.so` which should be sufficient for
> linking as a shared library.
>
> --
> Patrick Williams
> Legal Disclaimer :
> The information contained in this message may be privileged and
> confidential.
> It is intended to be read only by the individual or entity to whom it is
> addressed
> or by their designee. If the reader of this message is not the intended
> recipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of
> this message!
>

--000000000000e4973105e28403f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, it seems like the email chains were broken up for some=
 reason - seeing this now after I replied to the other email chain.<br><br>=
It is totally possible that our instructions in the README is not up to dat=
e anymore, but just to make sure - are you building each of the components =
as specified by <a href=3D"https://github.com/openbmc/phosphor-ipmi-flash#b=
uilding-the-host-tool">https://github.com/openbmc/phosphor-ipmi-flash#build=
ing-the-host-tool</a> ?<div><br></div><div>It details the commands to use f=
or each of the dependencies.</div><div><br></div><div>Good point on the bur=
n_my_bmc command in the README description not being not up to date and sti=
ll using automake (<a href=3D"https://github.com/openbmc/phosphor-ipmi-flas=
h#building-the-host-tool">https://github.com/openbmc/phosphor-ipmi-flash#bu=
ilding-the-host-tool</a>) - I&#39;ll try to run this to verify when I get t=
ime later today, but in the meantime=C2=A0perhaps=C2=A0<a class=3D"gmail_pl=
usreply" id=3D"plusReplyChip-1" href=3D"mailto:wltu@google.com" tabindex=3D=
"-1">@Willy Tu</a>=C2=A0may know the command off the top of his head as he =
performed the big meson migration. As a first glance the command looks corr=
ect.</div><div><br></div><div>Willy recently also migrated phospohr-host-ip=
mid to meson, so he may know more about the PAM dependency as well.</div><d=
iv><br></div><div>Thanks,</div><div>Brandon</div></div><br><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 28, 2022=
 at 8:04 AM Chris Chen (TPI) &lt;<a href=3D"mailto:Chris.Chen3@flex.com">Ch=
ris.Chen3@flex.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Patrick,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Thanks for your prompt reply, and the issue is solved after installing Ubun=
tu &quot;libfmt-dev&quot; package.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
&gt;&gt; Do you know why you disabled C++20?=C2=A0 This shouldn&#39;t have =
been necessary=C2=A0</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
&gt;&gt; and some of our code now requires C++20.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I disabled C++20 of the &quot;ipmi-blob-tool&quot; package because I got er=
rors below:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh
<div>+ autoreconf -v -f -i</div>
<div>autoreconf: export WARNINGS=3D</div>
<div>autoreconf: Entering directory &#39;.&#39;</div>
<div>autoreconf: <a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a>: not using Gettext</div>
<div>autoreconf: running: aclocal --force -I m4</div>
<div><a href=3D"http://configure.ac:38" target=3D"_blank">configure.ac:38</=
a>: error: invalid first argument `20&#39; to AX_CXX_COMPILE_STDCXX</div>
<div>/usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STDCXX =
is expanded from...</div>
<div><a href=3D"http://configure.ac:38" target=3D"_blank">configure.ac:38</=
a>: the top level</div>
<div>autom4te: error: /usr/bin/m4 failed with exit status: 1</div>
<div>aclocal: error: /usr/bin/autom4te failed with exit status: 1</div>
autoreconf: error: aclocal failed with exit status: 1<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Do you have ideas about how to solve it correctly?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
In addition, i have started to build the burn_my_bmc (the host-tool) on the=
 Host by cloning the &quot;phosphor-ipmi-flash&quot; source. There are some=
 questions came out:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<ul>
<li>The &quot;phosphor-ipmi-flash&quot; package seems became to use &quot;m=
eson&quot; rather than &quot;bootstrap.sh&quot;, so I run these commands in=
 the source directory. Is it correct?<br>
-----<br>
meson setup -Dbmc-blob-handler=3Ddisabled builddir<br>
ninja -C builddir<br>
ninja -C builddir install</li><li style=3D"display:block">-----<br>
<br>
</li><li>
<div>After running &quot;meson setup -Dbmc-blob-handler=3Ddisabled builddir=
&quot;, it occurred dependency errors, like &#39;sdbusplus&#39;, &#39;phosp=
hor-dbus-interfaces&#39;, &#39;libipmid&#39;, and so on is required respect=
ively, is it correct?<span style=3D"background-color:rgb(255,255,255);displ=
ay:inline"><br>
</span></div>
<span style=3D"background-color:rgb(255,255,255);display:inline"><br>
</span></li><li><span style=3D"background-color:rgb(255,255,255);display:in=
line">I for now have tried to install these dependencies one-by-one, but be=
 stuck at &#39;libipmid&#39;. That is I clone the &quot;phosphor-host-ipmid=
&quot; and run &quot;meson builddir&quot; command to build it,
 however, I got an error in blow and I can&#39;t solve it. Could you please=
 give me some suggestions?</span></li><li style=3D"display:block"><span sty=
le=3D"background-color:rgb(255,255,255);display:inline">=3D=3D=3D=3D=3D</sp=
an></li><li style=3D"display:block"><span style=3D"background-color:rgb(255=
,255,255);display:inline">Dependency sdeventplus from subproject subproject=
s/sdeventplus found: YES 0.1
<div>Dependency systemd found: YES 249 (cached)</div>
<div>Run-time dependency libcrypto found: YES 3.0.2</div>
<div><br>
</div>
<div>meson.build:89:0: ERROR: C++ shared or static library &#39;pam&#39; no=
t found</div>
=3D=3D=3D=3D=3D</span></li></ul>
<div><span style=3D"background-color:rgb(255,255,255);display:inline">Thank=
s.</span></div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen</div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
<hr style=3D"display:inline-block;width:98%">
<b>=E5=AF=84=E4=BB=B6=E8=80=85:</b> Patrick Williams<br>
<b>=E5=B7=B2=E5=82=B3=E9=80=81:</b> =E6=98=9F=E6=9C=9F=E4=BA=8C, 2022 6 =E6=
=9C=88 28 =E6=97=A5 =E4=B8=8B=E5=8D=88 07:20<br>
<b>=E6=94=B6=E4=BB=B6=E8=80=85:</b> Chris Chen (TPI)<br>
<b>=E5=89=AF=E6=9C=AC:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" targ=
et=3D"_blank">openbmc@lists.ozlabs.org</a><br>
<b>=E4=B8=BB=E6=97=A8:</b> Re: [phosphor-ipmi-flash]: stdplus build failed =
before building the host-tool on the Host
<div><br>
</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:<br>
&gt; And each library and tool is built successful(only one thing that is I=
 had to disable C++20 for the ipmi-blob-tool, others were fine) untilI star=
ted to build the stdplus. I encountered a build failed issue as below. It l=
ooks like there is a problem for using
 libfmt.a, I tried to figure out a solution on google but nothing is relate=
d to this. Could anyone help on this? Thanks.<br>
<br>
Do you know why you disabled C++20?=C2=A0 This shouldn&#39;t have been nece=
ssary<br>
and some of our code now requires C++20.<br>
<br>
&gt; <br>
&gt; =3D=3D=3D=3D=3D<br>
&gt; archer@archer-ArcherCityM:stdplus$<br>
&gt; archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse -Dte=
sts=3Ddisabled builddir<br>
&gt; The Meson build system<br>
&gt; Version: 0.61.2<br>
&gt; Source dir: /home/archer/Downloads/host-tool/stdplus<br>
&gt; Build dir: /home/archer/Downloads/host-tool/stdplus/builddir<br>
&gt; Build type: native build<br>
&gt; Project name: stdplus<br>
&gt; Project version: 0.1<br>
&gt; C++ compiler for the host machine: c++ (gcc 11.2.0 &quot;c++ (Ubuntu 1=
1.2.0-19ubuntu1) 11.2.0&quot;)<br>
&gt; C++ linker for the host machine: c++ ld.bfd 2.38<br>
&gt; Host machine cpu family: x86_64<br>
&gt; Host machine cpu: x86_64<br>
&gt; Found pkg-config: /usr/bin/pkg-config (0.29.2)<br>
&gt; Run-time dependency fmt found: YES 8.1.2<br>
<br>
Where did this `fmt` come from?=C2=A0 Ubuntu has `libfmt-dev` that you can<=
br>
install which is version 8.1.1 on Jammy right now.<br>
<br>
&gt; Library dl found: YES<br>
&gt; Run-time dependency liburing found: YES 2.0<br>
&gt; Build targets in project: 1<br>
&gt; <br>
&gt; stdplus 0.1<br>
&gt; <br>
&gt;=C2=A0=C2=A0 User defined options<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 examples: false<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 tests=C2=A0=C2=A0 : disabled<br>
&gt; <br>
&gt; Found ninja-1.10.1 at /usr/bin/ninja<br>
&gt; archer@archer-ArcherCityM:stdplus$<br>
&gt; archer@archer-ArcherCityM:stdplus$<br>
&gt; archer@archer-ArcherCityM:stdplus$ ninja -C builddir<br>
&gt; ninja: Entering directory `builddir&#39;<br>
&gt; [9/9] Linking target src/libstdplus.so.0.1<br>
&gt; FAILED: src/libstdplus.so.0.1<br>
&gt; c++=C2=A0 -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exc=
eption.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so=
.0.1.p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src=
/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
 src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o src/libstdplus.so.0.1.p/stdp=
lus_fd_managed.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_fd_ops.cpp.o src/libstdplus.so.0.1.p/stdplus_io_uri=
ng.cpp.o -Wl,--as-needed -Wl,--no-undefined
 -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/local/lib=
/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group<br>
&gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation=
 against `stdout@@GLIBC_2.2.5&#39; in read-only section `.text&#39;<br>
&gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X86_64=
_PC32 against symbol `stderr@@GLIBC_2.2.5&#39; can not be used when making =
a shared object; recompile with -fPIC<br>
<br>
However you obtained your libfmt, it was compiled incorrectly.=C2=A0 It<br>
shouldn&#39;t have a static library but a dynamic one.<br>
<br>
The `libfmt-dev` package has `libfmt.so` which should be sufficient for<br>
linking as a shared library.<br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font></div>
</div>

<div>
Legal Disclaimer :<br>
The information contained in this message may be privileged and confidentia=
l. <br>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <br>
or by their designee. If the reader of this message is not the intended rec=
ipient, <br>
you are on notice that any distribution of this message, in any form, <br>
is strictly prohibited. If you have received this message in error, <br>
please immediately notify the sender and delete or destroy any copy of this=
 message!<br>
</div></div>

</blockquote></div>

--000000000000e4973105e28403f6--
