Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D194A55E5C8
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 17:46:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXTV04z0Zz3cgX
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 01:46:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QEFgVDeu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QEFgVDeu;
	dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXTS16yG3z3drd
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 01:44:49 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id h85so13281347iof.4
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=plAmfIpdLVqVhdsu89IDMKpQeGkbL3ddxOt1uomHIn4=;
        b=QEFgVDeuHqZ2YC3SedqHDExb1DUQaD5YzDm62e7JPNbYYscqJRjrEhYKZ52PSPnZ/y
         0VmTqgHakx5Ehjrmosj54kPjAcIuUIk2C/t1r4s8KY8P7MceD4kR2YfIFJ8p4MRjIiXU
         zjAZs+hRJ/4mBGCkRfHFrD1YIbYUTzZgQXMi5BuUR70FlnaW5aMsy4FH9bhif8a5Uoj/
         SkrO3iaoz7+yE6AJws+ivWjTB4lKyB+/pv/vO2PfOGq/Uq8ismAcYPRByMQfrti81HHC
         8bdFmHwaiHWHcamYaof9GuDRwh1+6RBkBK1heG8+U+Xd5iX5SXZYW02UBG8tvten6UTk
         xp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=plAmfIpdLVqVhdsu89IDMKpQeGkbL3ddxOt1uomHIn4=;
        b=zSMakHB4R8CtLWG8OcfZBstieNnKghggVw0Iw6hlDDRwXzXx29wrWzWhp7BdyVbxtB
         dp3ZDw+VG5vTPuwTgISpPYyzqJW36H4/s1wOqysN2O6lsureHpabXL68+HfvQQlczEwq
         xX8fQfmOVTiXM4qjAy9SAf45EB2VyQj6Qti6sdOR54XRL7kLyTXYR7kqgqtrU+BANsZx
         EaXBikVPlYJyXMRW2gfftHBam6vR6LDcunRf+Lp/QGHS2P2AepbLYDioAp7dkRnK4MS+
         A12ykU63kGCnu8FnJ0tksBDxKzkRGImsAV2LjQENVCDG3kl2rNvVDjqCo0O/cro8V3HV
         2m6Q==
X-Gm-Message-State: AJIora8McveWNreQGAv5QMVM6eYfAx8Q/AU400wynvQY0ANdw1NgCu4j
	Y/6Y8ta4U5UUyUryOaD9Ad5EHVZZq2aaAk9kDO8kIg==
X-Google-Smtp-Source: AGRyM1vydxhS8tkq++2zQtCFEYYv3M8Gzoao+1Ps8oKAUki/cJbF6wRXPxJC5inqc38NwwIVON9/zE4UQj5+3rE1ajg=
X-Received: by 2002:a5d:96da:0:b0:674:f433:3595 with SMTP id
 r26-20020a5d96da000000b00674f4333595mr9783162iol.184.1656431086634; Tue, 28
 Jun 2022 08:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB55142CF0ABFA607D4F2C8317DCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
 <YrrkFWpbWyfx90CL@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YrrkFWpbWyfx90CL@heinlein.stwcx.org.github.beta.tailscale.net>
From: Brandon Kim <brandonkim@google.com>
Date: Tue, 28 Jun 2022 08:44:35 -0700
Message-ID: <CALGRKGPD3CgQb6Qesa6_WixUiRP1mgudcSyudZGp4og=iSCoWQ@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Chris Chen \(TPI\)" <Chris.Chen3@flex.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Apologies, I must have missed the first email - please let me and
wak@google.com know if there are any further issues you're
experiencing with the repo. Thanks Patrick for the help.

Cheers,
Brandon


On Tue, Jun 28, 2022 at 4:21 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:
> > And each library and tool is built successful(only one thing that is I =
had to disable C++20 for the ipmi-blob-tool, others were fine) untilI start=
ed to build the stdplus. I encountered a build failed issue as below. It lo=
oks like there is a problem for using libfmt.a, I tried to figure out a sol=
ution on google but nothing is related to this. Could anyone help on this? =
Thanks.
>
> Do you know why you disabled C++20?  This shouldn't have been necessary
> and some of our code now requires C++20.
>
> >
> > =3D=3D=3D=3D=3D
> > archer@archer-ArcherCityM:stdplus$
> > archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse -Dtes=
ts=3Ddisabled builddir
> > The Meson build system
> > Version: 0.61.2
> > Source dir: /home/archer/Downloads/host-tool/stdplus
> > Build dir: /home/archer/Downloads/host-tool/stdplus/builddir
> > Build type: native build
> > Project name: stdplus
> > Project version: 0.1
> > C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu 11.2.0-=
19ubuntu1) 11.2.0")
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
> > c++  -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exception=
.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so.0.1.p=
/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src/libst=
dplus.so.0.1.p/stdplus_fd_dupable.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_=
impl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_managed.cpp.o src/libstdplus.=
so.0.1.p/stdplus_fd_mmap.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_ops.cpp.o=
 src/libstdplus.so.0.1.p/stdplus_io_uring.cpp.o -Wl,--as-needed -Wl,--no-un=
defined -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/lo=
cal/lib/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group
> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation =
against `stdout@@GLIBC_2.2.5' in read-only section `.text'
> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X86_64_=
PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making a sha=
red object; recompile with -fPIC
>
> However you obtained your libfmt, it was compiled incorrectly.  It
> shouldn't have a static library but a dynamic one.
>
> The `libfmt-dev` package has `libfmt.so` which should be sufficient for
> linking as a shared library.
>
> --
> Patrick Williams
