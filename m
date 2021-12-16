Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D04769F4
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 06:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF1XD1hmHz2yyK
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 16:54:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=So7aMCEE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=So7aMCEE; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF1Wp3nksz2xsc
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 16:53:56 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id v138so61643374ybb.8
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 21:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZCoNeagTrRL2K3+7qFZlF+WVRrT+nP97XhQcSjlIBY=;
 b=So7aMCEE0eIviii72HQnc8lGaaXk9s//7hWE1MOQ/0mfq0gWjDoNIZVD+vaa6F8h7W
 9OoOC1quWgHVph3mzQ5u8jpI+1ndlixKkAkLSo32y99i7VWDPDYXPzU+VxBNFIk1cw23
 F7Ug16Nbr2gmQFBNcZC6JPCxTIJty0ypa5BfmGXDVmPN9/5/LR7dAhiq/27jx/cS3/r6
 oH3bsZmc0hhesN/BtLc0UZ2AYb/7JRr7bKy6Fmdq1+il1KcNBWxWGPxKT368/nGJKGfQ
 vZ1hcfAU1Xp6F6SSCmBQYdB7WDizqYOlnfC4NZwF17QpE/oyHe5JpD6+PVc9k5SREVfz
 Jqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZCoNeagTrRL2K3+7qFZlF+WVRrT+nP97XhQcSjlIBY=;
 b=qJaV0U0ADnFKOfdV+Q8/Zw9+XVm5ZjhzuHxoD4gmNNVRrriDBRl+fy73Fxur7T4PBB
 S1wgyRJvB5JqOcnutrieRUEtetl0zI+UIcn0/9oyGqgHKakgp5xvtiJGZ8XSKE0/nQG+
 zB+4CU6Mx29wZO927A1AJVI2xm16yyezgPahAoKtdWp2YVDQnltRsN1+GPa+RCNVIT7L
 MoTyi7qSdxV/Wr1uGCQXk4g+4cRYxrz/JkdnbTrrh8O3IvXKzNlMKfePSxNyGWBWuMpX
 hQ3AKi/7qt84PSnUAblJlY2XM4GjzPMPgBOerLQRb4tNVCJY38o1zpoX8PYepddhDess
 +/EQ==
X-Gm-Message-State: AOAM533szM7JZzrwOv84Gby/863CT5aQO1pOnQ2BthmAYY4Lf47MNNJS
 G6OtCrdqrw8exb3kKcNpJ6DCqS/eJXT9Ud+6ri+tvigQ
X-Google-Smtp-Source: ABdhPJwXatJ+MatBIWi3PMobVw9hYm15JApyMVHkDhdDac7lZ7XYMniPRCNc22YjaFOh5FU47RNr+Xulf5mEhRoL6Bg=
X-Received: by 2002:a25:41d0:: with SMTP id
 o199mr11005056yba.200.1639634032500; 
 Wed, 15 Dec 2021 21:53:52 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
 <YbduMfjuc7TXT6Rw@heinlein>
In-Reply-To: <YbduMfjuc7TXT6Rw@heinlein>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 16 Dec 2021 13:53:41 +0800
Message-ID: <CAO9PYRJD0MJsuY8M_80yJci-nT8idKL7VhSXJzvX_JS1wreJzA@mail.gmail.com>
Subject: Re: Run unit-test during development
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000011a4e005d33d0c70"
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

--00000000000011a4e005d33d0c70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick:
    Thank for your kind reply and that's really helpful. I am trying to
figure out the meson subprojects system but still encounter lot of barrier.
I run unt test using command "meson buiildir && ninja -C builddir test" in
my development environment but never work. Could you help to cite an
example in current openbmc repository? Do openbmc contributor run unit test
by meson subprojects or run-unit-test-docker.sh when they are developing?

Tyler

Patrick Williams <patrick@stwcx.xyz> =E6=96=BC 2021=E5=B9=B412=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:00=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On Mon, Dec 13, 2021 at 04:46:13PM +0800, Deng Tyler wrote:
> > Hi All:
> >     Is there any easier way to run unit-test during development instead
> of
> > running run-unit-test-docker.sh?
>
> If the repository is built using autotools or CMake there probably aren't
> a lot
> of other options.  Yocto has something called 'ptest' which would, in
> theory,
> allow the package to build test-cases and deploy them onto the hardware t=
o
> run
> the unit tests.  We don't have many repositories configured to support
> ptest
> though.
>
> Any repository that is building using Meson should be able to run the uni=
t
> tests
> on a typical Linux development box.  Some of them have not fully
> implemented
> this though.  What you want to look for is if the repository has a
> 'meson.build'
> and 'subprojects' subdirectory that contains a number of 'foo.wrap'
> files.  If
> it has this, you can probably build the repository outside of
> `run-unit-test-docker.sh` or a Yocto OE-SDK environment.
>
> In that case, simply `meson builddir && ninja -C builddir test`.
>
> If you come across a repository that supports Meson (meson.build file) bu=
t
> doesn't have correct wrap files, those can be added fairly easily.  I
> suspect
> you could use these repositories as a reference:
>
> ```
> $ ls */subprojects/phosphor-logging.wrap
> dbus-sensors/subprojects/phosphor-logging.wrap
> google-misc/subprojects/phosphor-logging.wrap
> openpower-debug-collector/subprojects/phosphor-logging.wrap
> openpower-occ-control/subprojects/phosphor-logging.wrap
> openpower-vpd-parser/subprojects/phosphor-logging.wrap
> phosphor-bmc-code-mgmt/subprojects/phosphor-logging.wrap
> phosphor-certificate-manager/subprojects/phosphor-logging.wrap
> phosphor-debug-collector/subprojects/phosphor-logging.wrap
> phosphor-health-monitor/subprojects/phosphor-logging.wrap
> phosphor-led-manager/subprojects/phosphor-logging.wrap
> phosphor-networkd/subprojects/phosphor-logging.wrap
> phosphor-objmgr/subprojects/phosphor-logging.wrap
> phosphor-sel-logger/subprojects/phosphor-logging.wrap
> phosphor-virtual-sensor/subprojects/phosphor-logging.wrap
> phosphor-watchdog/subprojects/phosphor-logging.wrap
> service-config-manager/subprojects/phosphor-logging.wrap
> telemetry/subprojects/phosphor-logging.wrap
> ```
>
> --
> Patrick Williams
>

--00000000000011a4e005d33d0c70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Patrick:<div>=C2=A0 =C2=A0 Thank for your kind reply an=
d that&#39;s really helpful. I am trying to figure out the meson subproject=
s system but still encounter=C2=A0lot of barrier. I run unt test using comm=
and &quot;meson buiildir &amp;&amp; ninja -C builddir test&quot; in my deve=
lopment environment but never work. Could you help to cite an example in cu=
rrent openbmc repository? Do openbmc contributor=C2=A0run unit test by meso=
n subprojects or run-unit-test-docker.sh when they are developing?</div><di=
v><br></div><div>Tyler</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Patrick Williams &lt;<a href=3D"mailto:patric=
k@stwcx.xyz">patrick@stwcx.xyz</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:00=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, D=
ec 13, 2021 at 04:46:13PM +0800, Deng Tyler wrote:<br>
&gt; Hi All:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Is there any easier way to run unit-test during dev=
elopment instead of<br>
&gt; running run-unit-test-docker.sh?<br>
<br>
If the repository is built using autotools or CMake there probably aren&#39=
;t a lot<br>
of other options.=C2=A0 Yocto has something called &#39;ptest&#39; which wo=
uld, in theory,<br>
allow the package to build test-cases and deploy them onto the hardware to =
run<br>
the unit tests.=C2=A0 We don&#39;t have many repositories configured to sup=
port ptest<br>
though.<br>
<br>
Any repository that is building using Meson should be able to run the unit =
tests<br>
on a typical Linux development box.=C2=A0 Some of them have not fully imple=
mented<br>
this though.=C2=A0 What you want to look for is if the repository has a &#3=
9;meson.build&#39;<br>
and &#39;subprojects&#39; subdirectory that contains a number of &#39;foo.w=
rap&#39; files.=C2=A0 If<br>
it has this, you can probably build the repository outside of<br>
`run-unit-test-docker.sh` or a Yocto OE-SDK environment.<br>
<br>
In that case, simply `meson builddir &amp;&amp; ninja -C builddir test`.<br=
>
<br>
If you come across a repository that supports Meson (meson.build file) but<=
br>
doesn&#39;t have correct wrap files, those can be added fairly easily.=C2=
=A0 I suspect<br>
you could use these repositories as a reference:<br>
<br>
```<br>
$ ls */subprojects/phosphor-logging.wrap<br>
dbus-sensors/subprojects/phosphor-logging.wrap<br>
google-misc/subprojects/phosphor-logging.wrap<br>
openpower-debug-collector/subprojects/phosphor-logging.wrap<br>
openpower-occ-control/subprojects/phosphor-logging.wrap<br>
openpower-vpd-parser/subprojects/phosphor-logging.wrap<br>
phosphor-bmc-code-mgmt/subprojects/phosphor-logging.wrap<br>
phosphor-certificate-manager/subprojects/phosphor-logging.wrap<br>
phosphor-debug-collector/subprojects/phosphor-logging.wrap<br>
phosphor-health-monitor/subprojects/phosphor-logging.wrap<br>
phosphor-led-manager/subprojects/phosphor-logging.wrap<br>
phosphor-networkd/subprojects/phosphor-logging.wrap<br>
phosphor-objmgr/subprojects/phosphor-logging.wrap<br>
phosphor-sel-logger/subprojects/phosphor-logging.wrap<br>
phosphor-virtual-sensor/subprojects/phosphor-logging.wrap<br>
phosphor-watchdog/subprojects/phosphor-logging.wrap<br>
service-config-manager/subprojects/phosphor-logging.wrap<br>
telemetry/subprojects/phosphor-logging.wrap<br>
```<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000011a4e005d33d0c70--
