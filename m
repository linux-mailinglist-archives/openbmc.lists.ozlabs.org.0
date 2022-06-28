Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449955E5D8
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 17:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXTjy1ZPNz3c7h
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 01:56:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HIRVM22O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=wltu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HIRVM22O;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXTjY5432z2ypf
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 01:56:32 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id 136so7281826pfy.10
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K8m5XDfeL411A8/CJmp8i5y7mOOo4YuTjqUARLusJqg=;
        b=HIRVM22ObId1kJCUPMB/N97uNNwh5eV0zTmiM9NgoBSqZJpSwiMYeuptHmNbDgAe5A
         Dp9YoWEm4aW2To4BNGIo4jENtVwdm0NB4y8YxNAp3IAr8nZyc9a9upJif7pUJPYMpExh
         AzYqyd0dV4jK6UCt4LUJXmcSAwlMESp31pWxDYKSpfR3ZRB/7SYYjbyINXSl/TamkCH4
         ObW/4kStCbij8mmUBfoKKX2Szd3iFRwoH7nDQakLLYecDWHYCaIAdlcnF5MuLuswaYw5
         upz14xxnTdtLyoYO//B26mepg8GW+8LTsoRMou2fm/s/x4EjEsLAs83J4RFFCtYmL4s2
         ERyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K8m5XDfeL411A8/CJmp8i5y7mOOo4YuTjqUARLusJqg=;
        b=RiDXqmiurmEk/lcC0s5SH4m9qEp5KKbC3SeZaDb5bHBu+nBhamzll6A7K9f19DAzaY
         Nq+1ujpnaSFlastN+23DBIP8MBhFkFDo/lQL4MelSxgnFC2JQhMnftwaP/zFPoCGbWjD
         z+fyrrf68FuaKBEkHTwe0/jPWA1J+PCkM95Epm35Lde0YWnwncdRbQqi60ecmK7UVBJH
         h4rqwwj76FdvS69wPVihUmwT3UQVlUXLh1OdMWCeV+l+OU1RIUckPcH2wbkiZVhlfaW5
         OEsZmMHTYQZOdzekJ9KUBsktRaCsEv1/dUVMWij8z3YcZSCP6JCayg78S5I6hXduyCOS
         eN6g==
X-Gm-Message-State: AJIora8Q/Z62eC4jM6hd25Bm8Oy6TigI4RIZGYaOwOki1izNtzHzheJf
	pBV06UVoxtwllH6NzV3455PSE+mfGqitY7NsRn60Tw==
X-Google-Smtp-Source: AGRyM1v12jjSABzOw6dKGdvIm3hEbxPsmYaZBJD0es8s3AEek2Zb84MvUNYjTCnkaZy+dq535v1Sw6TSQH8jps2HTWo=
X-Received: by 2002:aa7:8890:0:b0:525:85db:c0d1 with SMTP id
 z16-20020aa78890000000b0052585dbc0d1mr5412545pfe.69.1656431790647; Tue, 28
 Jun 2022 08:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGO0Y6FGTYu1rqH-YJCZgKXsPBHjjERmU7_5tOa0xg3M=A@mail.gmail.com>
In-Reply-To: <CALGRKGO0Y6FGTYu1rqH-YJCZgKXsPBHjjERmU7_5tOa0xg3M=A@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 28 Jun 2022 08:56:19 -0700
Message-ID: <CAHwn2XnPHOQzBq1MOpEG+4nD=AY3x40w1UV29jKK+w4pnvNEOQ@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
To: Brandon Kim <brandonkim@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Chris Chen \(TPI\)" <Chris.Chen3@flex.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Oh yeah, the README is 100% outdated. We have moved to meson and we
should update it at some point in life.

I think your command to build burn_my_bmc should be fine. The
`host-tool` should be enabled by default.

Can try the following, just in case.
```
meson setup -Dhost-tool=3Denabled builddir
ninja -C builddir
ninja -C builddir install
```

Willy Tu


On Tue, Jun 28, 2022 at 8:51 AM Brandon Kim <brandonkim@google.com> wrote:
>
> Ah, it seems like the email chains were broken up for some reason - seein=
g this now after I replied to the other email chain.
>
> It is totally possible that our instructions in the README is not up to d=
ate anymore, but just to make sure - are you building each of the component=
s as specified by https://github.com/openbmc/phosphor-ipmi-flash#building-t=
he-host-tool ?
>
> It details the commands to use for each of the dependencies.
>
> Good point on the burn_my_bmc command in the README description not being=
 not up to date and still using automake (https://github.com/openbmc/phosph=
or-ipmi-flash#building-the-host-tool) - I'll try to run this to verify when=
 I get time later today, but in the meantime perhaps @Willy Tu may know the=
 command off the top of his head as he performed the big meson migration. A=
s a first glance the command looks correct.
>
> Willy recently also migrated phospohr-host-ipmid to meson, so he may know=
 more about the PAM dependency as well.
>
> Thanks,
> Brandon
>
>
> On Tue, Jun 28, 2022 at 8:04 AM Chris Chen (TPI) <Chris.Chen3@flex.com> w=
rote:
>>
>> Hi Patrick,
>>
>> Thanks for your prompt reply, and the issue is solved after installing U=
buntu "libfmt-dev" package.
>>
>> >> Do you know why you disabled C++20?  This shouldn't have been necessa=
ry
>> >> and some of our code now requires C++20.
>>
>> I disabled C++20 of the "ipmi-blob-tool" package because I got errors be=
low:
>> =3D=3D=3D=3D=3D
>> archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh
>> + autoreconf -v -f -i
>> autoreconf: export WARNINGS=3D
>> autoreconf: Entering directory '.'
>> autoreconf: configure.ac: not using Gettext
>> autoreconf: running: aclocal --force -I m4
>> configure.ac:38: error: invalid first argument `20' to AX_CXX_COMPILE_ST=
DCXX
>> /usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STDCXX is=
 expanded from...
>> configure.ac:38: the top level
>> autom4te: error: /usr/bin/m4 failed with exit status: 1
>> aclocal: error: /usr/bin/autom4te failed with exit status: 1
>> autoreconf: error: aclocal failed with exit status: 1
>> =3D=3D=3D=3D=3D
>> Do you have ideas about how to solve it correctly?
>>
>> In addition, i have started to build the burn_my_bmc (the host-tool) on =
the Host by cloning the "phosphor-ipmi-flash" source. There are some questi=
ons came out:
>>
>> The "phosphor-ipmi-flash" package seems became to use "meson" rather tha=
n "bootstrap.sh", so I run these commands in the source directory. Is it co=
rrect?
>> -----
>> meson setup -Dbmc-blob-handler=3Ddisabled builddir
>> ninja -C builddir
>> ninja -C builddir install
>> -----
>>
>> After running "meson setup -Dbmc-blob-handler=3Ddisabled builddir", it o=
ccurred dependency errors, like 'sdbusplus', 'phosphor-dbus-interfaces', 'l=
ibipmid', and so on is required respectively, is it correct?
>>
>> I for now have tried to install these dependencies one-by-one, but be st=
uck at 'libipmid'. That is I clone the "phosphor-host-ipmid" and run "meson=
 builddir" command to build it, however, I got an error in blow and I can't=
 solve it. Could you please give me some suggestions?
>> =3D=3D=3D=3D=3D
>> Dependency sdeventplus from subproject subprojects/sdeventplus found: YE=
S 0.1
>> Dependency systemd found: YES 249 (cached)
>> Run-time dependency libcrypto found: YES 3.0.2
>>
>> meson.build:89:0: ERROR: C++ shared or static library 'pam' not found
>> =3D=3D=3D=3D=3D
>>
>> Thanks.
>>
>> Regards,
>> Chris Chen
>>
>> ________________________________ =E5=AF=84=E4=BB=B6=E8=80=85: Patrick Wi=
lliams
>> =E5=B7=B2=E5=82=B3=E9=80=81: =E6=98=9F=E6=9C=9F=E4=BA=8C, 2022 6 =E6=9C=
=88 28 =E6=97=A5 =E4=B8=8B=E5=8D=88 07:20
>> =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI)
>> =E5=89=AF=E6=9C=AC: openbmc@lists.ozlabs.org
>> =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: stdplus build failed befo=
re building the host-tool on the Host
>>
>> On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:
>> > And each library and tool is built successful(only one thing that is I=
 had to disable C++20 for the ipmi-blob-tool, others were fine) untilI star=
ted to build the stdplus. I encountered a build failed issue as below. It l=
ooks like there is a problem for using libfmt.a, I tried to figure out a so=
lution on google but nothing is related to this. Could anyone help on this?=
 Thanks.
>>
>> Do you know why you disabled C++20?  This shouldn't have been necessary
>> and some of our code now requires C++20.
>>
>> >
>> > =3D=3D=3D=3D=3D
>> > archer@archer-ArcherCityM:stdplus$
>> > archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse -Dte=
sts=3Ddisabled builddir
>> > The Meson build system
>> > Version: 0.61.2
>> > Source dir: /home/archer/Downloads/host-tool/stdplus
>> > Build dir: /home/archer/Downloads/host-tool/stdplus/builddir
>> > Build type: native build
>> > Project name: stdplus
>> > Project version: 0.1
>> > C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu 11.2.0=
-19ubuntu1) 11.2.0")
>> > C++ linker for the host machine: c++ ld.bfd 2.38
>> > Host machine cpu family: x86_64
>> > Host machine cpu: x86_64
>> > Found pkg-config: /usr/bin/pkg-config (0.29.2)
>> > Run-time dependency fmt found: YES 8.1.2
>>
>> Where did this `fmt` come from?  Ubuntu has `libfmt-dev` that you can
>> install which is version 8.1.1 on Jammy right now.
>>
>> > Library dl found: YES
>> > Run-time dependency liburing found: YES 2.0
>> > Build targets in project: 1
>> >
>> > stdplus 0.1
>> >
>> >   User defined options
>> >     examples: false
>> >     tests   : disabled
>> >
>> > Found ninja-1.10.1 at /usr/bin/ninja
>> > archer@archer-ArcherCityM:stdplus$
>> > archer@archer-ArcherCityM:stdplus$
>> > archer@archer-ArcherCityM:stdplus$ ninja -C builddir
>> > ninja: Entering directory `builddir'
>> > [9/9] Linking target src/libstdplus.so.0.1
>> > FAILED: src/libstdplus.so.0.1
>> > c++  -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exceptio=
n.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so.0.1.=
p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_fd_dupable.cpp.o src/libstdplus.so.0.1.p/stdplus_fd=
_impl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_managed.cpp.o src/libstdplus=
.so.0.1.p/stdplus_fd_mmap.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_ops.cpp.=
o src/libstdplus.so.0.1.p/stdplus_io_uring.cpp.o -Wl,--as-needed -Wl,--no-u=
ndefined -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/l=
ocal/lib/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-grou=
p
>> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation=
 against `stdout@@GLIBC_2.2.5' in read-only section `.text'
>> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X86_64=
_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making a sh=
ared object; recompile with -fPIC
>>
>> However you obtained your libfmt, it was compiled incorrectly.  It
>> shouldn't have a static library but a dynamic one.
>>
>> The `libfmt-dev` package has `libfmt.so` which should be sufficient for
>> linking as a shared library.
>>
>> --
>> Patrick Williams
>> Legal Disclaimer :
>> The information contained in this message may be privileged and confiden=
tial.
>> It is intended to be read only by the individual or entity to whom it is=
 addressed
>> or by their designee. If the reader of this message is not the intended =
recipient,
>> you are on notice that any distribution of this message, in any form,
>> is strictly prohibited. If you have received this message in error,
>> please immediately notify the sender and delete or destroy any copy of t=
his message!
