Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE7478339
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFY5r5rL0z3c9S
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:36:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pRJvxIhR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pRJvxIhR; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFY5P3mGrz2yK3
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 13:36:23 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f186so2380006ybg.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 18:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nTCvXfQAJc321hU8RXV4CaGBuKc0qsPg8Vjo/ddfW0=;
 b=pRJvxIhRjrXodSEwNx0ZbzNRct0nU7RefJ2aXuL/L5Tne9oTjz7++OoFLFuj9hJvRU
 R3vyWiA59YjmxzhmltpRztcOc61jII8fGlgl4KU7bfyRDNqv6TnfYZeROPE9sHVJIV5d
 BlggXFnTAKt0U8ChdekVXwv6PlNhAPz5bssal4mDXEBLPsI/9Tarf5ZNqgjbaiDA0kDw
 6rqkQXi6kdVFGPSGhVx9tHo15WGj0SvAiRHSf6312yQqn4rFpFTCtQ0Jdf+klmjBFuuV
 mtFYI0P0FtjKX1o3mjRqtD1mpt897Yk8u2Oh1BpcaNMno76JZH/3CRgWWiUuto6fHFDu
 LKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nTCvXfQAJc321hU8RXV4CaGBuKc0qsPg8Vjo/ddfW0=;
 b=Kx3ibvRQmR1H3vJaiCfnku+LJ8MRROGR2RUB6njhn2V+ndyIE+27gD/l0NgLVFMH4O
 SOWoJdw/+SrBJzdQ/xgNkReynglD/il+aMj19cGfR+CljClZ5ET2x5+JIXs3yvDu7Vih
 Y9kWiaeeMcI6QaxxKV8rvqb9o+RhY0LLSf/NpuMS8EYqjHEXUMxuFl3bYpU9j2eX+nym
 GoI2kUrqzJw2dWwk1B6fvHdI4w0Qt4Qn7G0USCdDjKszK0YN0330liLXgAsOTc1uNWDO
 RpOxnMCHGtixvOgcxk9e8F28pD1zBEhQDbbD9r+ib+PIrWeuBjafvGwJhPFoaU+XRBRU
 1yiA==
X-Gm-Message-State: AOAM530zE1pfUGO3Fb+IjKWMeG4+gWd5DdMt20GYMrhNofuHo7tPaSp5
 lTWdPRmfg6NXDHs6aM6c1pxTN1l+2ZCIRD8Q7sc=
X-Google-Smtp-Source: ABdhPJzsp1XINoN27zHt5hWTvyRPIna2gMmNrKEeGiYR/w4scL6H0UPrEe3HaQMoNnXm+VKoDpKFMQ2zaFXutKCJUNE=
X-Received: by 2002:a25:aea4:: with SMTP id b36mr1582534ybj.182.1639708579825; 
 Thu, 16 Dec 2021 18:36:19 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
 <YbduMfjuc7TXT6Rw@heinlein>
 <CAO9PYRJD0MJsuY8M_80yJci-nT8idKL7VhSXJzvX_JS1wreJzA@mail.gmail.com>
 <YbtzcvbSwTjGzfcH@heinlein>
In-Reply-To: <YbtzcvbSwTjGzfcH@heinlein>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Fri, 17 Dec 2021 10:36:08 +0800
Message-ID: <CAO9PYRKPrVzew5KUcxL7HKo4VXNR+mEef7AiPas-5FxdcB5FeA@mail.gmail.com>
Subject: Re: Run unit-test during development
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000006f8b6805d34e67ca"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006f8b6805d34e67ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick:
    I try to build and run unit test repository which support meson such as
phosphor-logging and phosphor-network. There is dependency issue while
building them and I wonder it is a bug or my environment issue.
/openbmc/phosphor-logging$ meson builddir && ninja -C builddir test
The Meson build system
Version: 0.59.2
Source dir:  /openbmc/phosphor-logging
Build dir:  /openbmc/phosphor-logging/builddir
Build type: native build
Project name: phosphor-logging
Project version: 1.0.0
C++ compiler for the host machine: c++ (gcc 7.5.0 "c++ (Ubuntu
7.5.0-3ubuntu1~18.04) 7.5.0")
C++ linker for the host machine: c++ ld.bfd 2.30
Host machine cpu family: x86_64
Host machine cpu: x86_64
Program python3 found: YES (/usr/bin/python3)
Found pkg-config: /usr/bin/pkg-config (0.29.1)
Run-time dependency systemd found: YES 237
Found CMake: /usr/bin/cmake (3.10.2)
Run-time dependency sdbusplus found: NO (tried pkgconfig and cmake)
Cloning into 'sdbusplus'...
remote: Enumerating objects: 3559, done.
remote: Counting objects: 100% (609/609), done.
remote: Compressing objects: 100% (384/384), done.
remote: Total 3559 (delta 346), reused 403 (delta 162), pack-reused 2950
Receiving objects: 100% (3559/3559), 891.70 KiB | 7.37 MiB/s, done.
Resolving deltas: 100% (2289/2289), done.

Executing subproject sdbusplus

sdbusplus| Project name: sdbusplus
sdbusplus| Project version: 1.0.0
sdbusplus| C compiler for the host machine: cc (gcc 7.5.0 "cc (Ubuntu
7.5.0-3ubuntu1~18.04) 7.5.0")
sdbusplus| C linker for the host machine: cc ld.bfd 2.30
sdbusplus| C++ compiler for the host machine: c++ (gcc 7.5.0 "c++ (Ubuntu
7.5.0-3ubuntu1~18.04) 7.5.0")
sdbusplus| C++ linker for the host machine: c++ ld.bfd 2.30
sdbusplus| Run-time dependency libsystemd found: NO (tried pkgconfig and
cmake)

subprojects/sdbusplus/meson.build:14:0: ERROR: Dependency "libsystemd" not
found, tried pkgconfig and cmake

A full log can be found at
 /openbmc/phosphor-logging/builddir/meson-logs/meson-log.txt

Patrick Williams <patrick@stwcx.xyz> =E6=96=BC 2021=E5=B9=B412=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:12=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Thu, Dec 16, 2021 at 01:53:41PM +0800, Deng Tyler wrote:
> > Hi Patrick:
> >     Thank for your kind reply and that's really helpful. I am trying to
> > figure out the meson subprojects system but still encounter lot of
> barrier.
> > I run unt test using command "meson buiildir && ninja -C builddir test"
> in
> > my development environment but never work. Could you help to cite an
> > example in current openbmc repository? Do openbmc contributor run unit
> test
> > by meson subprojects or run-unit-test-docker.sh when they are developin=
g?
>
> I can't really comment on what other people do, but I can tell you what I
> do.
>
> 1. If the repository supports Meson, I always attempt to build / test usi=
ng
>    standalone support (ie. meson subprojects).
>
> 2. If 'meson subprojects' doesn't seem to work, I fix it to make it work.
>
> 3. If the repository is anything else and it isn't too much effort, I try
> to
>    port it to meson.
>
> 4. When all else fails I use 'run-unit-test-docker.sh'.  I often execute
> it with
>    an alias I have: `NO_FORMAT_CODE=3D1 lf-ut`[1].
>
> ---
>
> Do you have examples of meson+ninja failing?  I'm fairly certain it works
> fine
> for almost every repository I'm listed as a maintainer on.  I've also use=
d
> it
> (or fixed it) fairly recently for: bmcweb, phosphor-logging, and
> phosphor-certificate-manager.
>
> Maybe you can point to what failure you're seeing in that case as well (y=
ou
> can upload a log to gist.github.com )?
>
>
>
> 1.
> https://github.com/williamspatrick/dotfiles/blob/fb542abf99c944051544990f=
69a6d20c82d2a904/env/30_linux/lfopenbmc.zsh#L76
>
> --
> Patrick Williams
>

--0000000000006f8b6805d34e67ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Patrick:<div>=C2=A0 =C2=A0 I try to build and run unit =
test repository which support meson such as phosphor-logging and phosphor-n=
etwork. There is dependency issue while building them and I wonder it is a =
bug or my environment issue.</div><div>/openbmc/phosphor-logging$ meson bui=
lddir &amp;&amp; ninja -C builddir test<br>The Meson build system<br>Versio=
n: 0.59.2<br>Source dir: =C2=A0/openbmc/phosphor-logging<br>Build dir: =C2=
=A0/openbmc/phosphor-logging/builddir<br>Build type: native build<br>Projec=
t name: phosphor-logging<br>Project version: 1.0.0<br>C++ compiler for the =
host machine: c++ (gcc 7.5.0 &quot;c++ (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0&=
quot;)<br>C++ linker for the host machine: c++ ld.bfd 2.30<br>Host machine =
cpu family: x86_64<br>Host machine cpu: x86_64<br>Program python3 found: YE=
S (/usr/bin/python3)<br>Found pkg-config: /usr/bin/pkg-config (0.29.1)<br>R=
un-time dependency systemd found: YES 237<br>Found CMake: /usr/bin/cmake (3=
.10.2)<br>Run-time dependency sdbusplus found: NO (tried pkgconfig and cmak=
e)<br>Cloning into &#39;sdbusplus&#39;...<br>remote: Enumerating objects: 3=
559, done.<br>remote: Counting objects: 100% (609/609), done.<br>remote: Co=
mpressing objects: 100% (384/384), done.<br>remote: Total 3559 (delta 346),=
 reused 403 (delta 162), pack-reused 2950<br>Receiving objects: 100% (3559/=
3559), 891.70 KiB | 7.37 MiB/s, done.<br>Resolving deltas: 100% (2289/2289)=
, done.<br><br>Executing subproject sdbusplus<br><br>sdbusplus| Project nam=
e: sdbusplus<br>sdbusplus| Project version: 1.0.0<br>sdbusplus| C compiler =
for the host machine: cc (gcc 7.5.0 &quot;cc (Ubuntu 7.5.0-3ubuntu1~18.04) =
7.5.0&quot;)<br>sdbusplus| C linker for the host machine: cc ld.bfd 2.30<br=
>sdbusplus| C++ compiler for the host machine: c++ (gcc 7.5.0 &quot;c++ (Ub=
untu 7.5.0-3ubuntu1~18.04) 7.5.0&quot;)<br>sdbusplus| C++ linker for the ho=
st machine: c++ ld.bfd 2.30<br>sdbusplus| Run-time dependency libsystemd fo=
und: NO (tried pkgconfig and cmake)<br><br>subprojects/sdbusplus/meson.buil=
d:14:0: ERROR: Dependency &quot;libsystemd&quot; not found, tried pkgconfig=
 and cmake<br><br>A full log can be found at =C2=A0/openbmc/phosphor-loggin=
g/builddir/meson-logs/meson-log.txt<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Patrick Williams &lt;<a href=
=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; =E6=96=BC 2021=E5=
=B9=B412=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:12=E5=
=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Dec 16, 2021 at 01:53:41PM +0800, Deng Tyler wrote:<br>
&gt; Hi Patrick:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank for your kind reply and that&#39;s really hel=
pful. I am trying to<br>
&gt; figure out the meson subprojects system but still encounter lot of bar=
rier.<br>
&gt; I run unt test using command &quot;meson buiildir &amp;&amp; ninja -C =
builddir test&quot; in<br>
&gt; my development environment but never work. Could you help to cite an<b=
r>
&gt; example in current openbmc repository? Do openbmc contributor run unit=
 test<br>
&gt; by meson subprojects or run-unit-test-docker.sh when they are developi=
ng?<br>
<br>
I can&#39;t really comment on what other people do, but I can tell you what=
 I do.<br>
<br>
1. If the repository supports Meson, I always attempt to build / test using=
<br>
=C2=A0 =C2=A0standalone support (ie. meson subprojects).<br>
<br>
2. If &#39;meson subprojects&#39; doesn&#39;t seem to work, I fix it to mak=
e it work.<br>
<br>
3. If the repository is anything else and it isn&#39;t too much effort, I t=
ry to<br>
=C2=A0 =C2=A0port it to meson.<br>
<br>
4. When all else fails I use &#39;run-unit-test-docker.sh&#39;.=C2=A0 I oft=
en execute it with<br>
=C2=A0 =C2=A0an alias I have: `NO_FORMAT_CODE=3D1 lf-ut`[1].<br>
<br>
---<br>
<br>
Do you have examples of meson+ninja failing?=C2=A0 I&#39;m fairly certain i=
t works fine<br>
for almost every repository I&#39;m listed as a maintainer on.=C2=A0 I&#39;=
ve also used it<br>
(or fixed it) fairly recently for: bmcweb, phosphor-logging, and<br>
phosphor-certificate-manager.<br>
<br>
Maybe you can point to what failure you&#39;re seeing in that case as well =
(you<br>
can upload a log to <a href=3D"http://gist.github.com" rel=3D"noreferrer" t=
arget=3D"_blank">gist.github.com</a> )?<br>
<br>
<br>
<br>
1. <a href=3D"https://github.com/williamspatrick/dotfiles/blob/fb542abf99c9=
44051544990f69a6d20c82d2a904/env/30_linux/lfopenbmc.zsh#L76" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/williamspatrick/dotfiles/blob/fb5=
42abf99c944051544990f69a6d20c82d2a904/env/30_linux/lfopenbmc.zsh#L76</a><br=
>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000006f8b6805d34e67ca--
