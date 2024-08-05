Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D2A948515
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 23:55:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=getcruise.com header.i=@getcruise.com header.a=rsa-sha256 header.s=google header.b=Nb3Eh8Yy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd9Gx5bRDz3cyL
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 07:55:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=getcruise.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=getcruise.com header.i=@getcruise.com header.a=rsa-sha256 header.s=google header.b=Nb3Eh8Yy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=getcruise.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=chuck.kamas@getcruise.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd9GN07vSz3c05
	for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2024 07:55:06 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so130180a12.3
        for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2024 14:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google; t=1722894899; x=1723499699; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u9+0M0L/oJ0ur3iC7tRBET2WXZAGGdnxoylP9z5FgfU=;
        b=Nb3Eh8Yyo97KiCyCQ29B8aDRwj6pAko8hXtLN0avwn2FbpTS8jjTdJIZgtPOTUskUu
         Ijz/lceUut8Fi8tAT/PpoIFiYitFGYoREYdr/eGJcxhv22F0nUKL7LcMopjsnMW34L5u
         Nm098RzcPi8hTGyzr11UPJDd2ncpIBB1vBJuJx1VHwM1Knu38nTWBWnAKKKfkRF+H8GJ
         ldisRKG+LGsOehnc8pwutdRiX5dHjTXH5SZAZv0AJMtWLBIzCEK0zRCSfdpa0APS1fod
         XRxhgWSSgCvjhVQiiyl6i9ea7y4WebjijgTGN+47NKx933pBJHhgBZ1ozMqxE4QuybO5
         wIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722894899; x=1723499699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9+0M0L/oJ0ur3iC7tRBET2WXZAGGdnxoylP9z5FgfU=;
        b=VCD+U5kS11XPGECGXMsfjSPiXg2LNMaGXNmAg+qbFb+AfEsoqhM9llH2PbZRH4mSEq
         g7+IVZ0sbpxysl2vj2KtBn0JqfC4Rkkdme4GtrsTHRKYx7knIz/lo+e0mAmMjseud8XG
         SwhIQMXRWoWpDf6fFvh0dPIPvOSBnJTBb/ICw+jbaRsKZVdoWogUliqvOSqfIQon0IYT
         lIAWsBHXhgamen6Vt0f8ejV+NhZ3EAWq3+d67h56hRU6ZpCxGDN7wJF2Lx2e95RFk0vH
         3F3TsLaztZ0M32U2r8mk2SByiJb49QciAmdMtDgZS6giM2qNNTo2dKq54HvFS4icGq+F
         pP1g==
X-Gm-Message-State: AOJu0YwaS5KvNP3xtPfHTlA1klD7YTKbgGM/UjLDKNxWgL7Fjrc5q0ZT
	YjmWegMptYU1he4Ai9YeLNTaFCRFzzsxAXFVUX2slVSROodV6sQAHsAANS63Z2SIAwJwBndwjti
	s2I9qaKi2rYoye3jJBXSZ4jRBPxPxflf3L/jywtH3uIDPVkuEI9uU7F0owuaT5H4mqkqIHuQq6x
	s7yeKaYGlwn2K5yITmoKufJaMN
X-Google-Smtp-Source: AGHT+IE1b2F5+ZULYkiap9vSma3Tplu4aDfUK/P80DsEkJsZOe6qHiKpw0kGWJkpSEIXsEkDHckG0/CXxVUevC5LIUA=
X-Received: by 2002:a05:6402:40c:b0:5a0:c709:aa0b with SMTP id
 4fb4d7f45d1cf-5b7f56fd439mr10032268a12.24.1722894898875; Mon, 05 Aug 2024
 14:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <CABMF29msHomoDwHG_kDjnT-ytdY0mxS_bh_1kZmtLk6z=7H0nA@mail.gmail.com>
 <31CA6E60-5E07-48DE-9580-E8586DF0EA1A@amperemail.onmicrosoft.com>
In-Reply-To: <31CA6E60-5E07-48DE-9580-E8586DF0EA1A@amperemail.onmicrosoft.com>
From: Chuck Kamas <chuck.kamas@getcruise.com>
Date: Mon, 5 Aug 2024 14:54:47 -0700
Message-ID: <CABMF29kwjAXL0tL-TMnU+s1J9QfV88z_MS4bK8nmA1a=5E8aug@mail.gmail.com>
Subject: Re: [EXT] Re: including libubootenv in Ampere's openbmc
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
Content-Type: multipart/alternative; boundary="0000000000006f5010061ef6ba5e"
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

--0000000000006f5010061ef6ba5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Thang! I was able to get rid of the compilation error by
following your recommendations!

Chuck


On Tue, Jul 30, 2024 at 3:21=E2=80=AFAM Thang Nguyen OS <
thang@amperemail.onmicrosoft.com> wrote:

>
>
> On 30 Jul 2024, at 01:32, Chuck Kamas <chuck.kamas@getcruise.com> wrote:
>
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender.
> Please be mindful of safe email handling and proprietary information
> protection practices.]
>
> Hi all,
>
> I am in the process of adding swupdate to my Ampere openbmc build.
>
> I have cloned openbmc:
>
>    - git clone https://github.com/openbmc/openbmc.git
>
> configured yocto:
>
>    - . setup mtjade
>
> and compiled with no problem.
>
>    -  bitbake obmc-phosphor-image
>
> I added libubootenv to the image, in local.conf:
>
>    - IMAGE_INSTALL:append =3D "libubootenv"
>
> However when I build I get the following error:
>
> ERROR: Multiple .bb files are due to be built which each provide
> u-boot-fw-utils:##### | ETA: 0:00:01
>
> The Mt.Jade OpenBMC uses u-boot 2019.07 which provides u-boot-fw-utils
> from
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-=
boot/u-boot-fw-utils-aspeed-sdk_2019.04.bb
> .
> When adding libubootenv, it also provides u-boot-fw-utils
> https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-bo=
ot/libubootenv_0.3.5.bb
> .
> Can you manually remove one?
> As I know, libubootenv is to provide fw_setenv and fw_getenv commands but
> they are already available.
> I tried below change and I can still compile Mt.Jade successfully:
> 1. Add
> to meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-fw-utils-aspeed_%.bbap=
pend
> DEPENDS +=3D " libubootenv=E2=80=9D
> 2. Remove from meta-aspeed/recipes-bsp/u-boot/
> u-boot-fw-utils-aspeed_2016.07.bb
> PROVIDES +=3D "u-boot-fw-utils"
>
> openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
> openbmc/meta-aspeed/recipes-bsp/u-boot/
> u-boot-fw-utils-aspeed-sdk_2019.04.bb
> A list of tasks depending on these providers is shown and may help explai=
n
> where the dependency comes from.
> openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb has unique dependees=
:
> openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_populate_lic_deploy
> openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_build
> openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_create_runtime_spdx
> openbmc/meta-aspeed/recipes-bsp/u-boot/
> u-boot-fw-utils-aspeed-sdk_2019.04.bb has unique dependees:
> openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb:
> do_create_runtime_spdx
> openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:
> do_create_runtime_spdx
> openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb:
> do_package_qa
> openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:
> do_package_write_ipk
> openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:
> do_create_runtime_spdx
> openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb:
> do_package_write_ipk
> openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:
> do_package_qa
> openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:
> do_package_write_ipk
> openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:
> do_package_qa
> It could be that one recipe provides something the other doesn't and
> should. The following provider and runtime provider differences may be
> helpful.
> openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb has unique provides:
> libubootenv
> openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb has unique rprovides=
:
> libubootenv-dev
> libubootenv-bin
> libubootenv-doc
> libubootenv-dbg
> libubootenv
> libubootenv-staticdev
> ^libubootenv-locale-.*
> libubootenv-locale
> libubootenv-src
> openbmc/meta-aspeed/recipes-bsp/u-boot/
> u-boot-fw-utils-aspeed-sdk_2019.04.bb has unique provides:
> u-boot-fw-utils-aspeed-sdk
> openbmc/meta-aspeed/recipes-bsp/u-boot/
> u-boot-fw-utils-aspeed-sdk_2019.04.bb has unique rprovides:
> ^u-boot-fw-utils-aspeed-sdk-locale-.*
> u-boot-fw-utils-aspeed-sdk-src
> u-boot-fw-utils-aspeed-sdk
> u-boot-fw-utils-aspeed-sdk-doc
> u-boot-fw-utils-aspeed-sdk-locale
> u-boot-fw-utils-aspeed-sdk-dbg
> u-boot-fw-utils-aspeed-sdk-staticdev
> u-boot-fw-utils-aspeed-sdk-dev
>
>
> I have asked over on the swupdate reflector and Stefano suggested it was
> an conflict resulting from a change back in Dunfell?
>
> Any suggestions on how to resolve this error would be appreciated!
>
> Chuck
>
>
>
> *Confidentiality Note:* We care about protecting our proprietary
> information, confidential material, and trade secrets. This message may
> contain some or all of those things. Cruise will suffer material harm if
> anyone other than the intended recipient disseminates or takes any action
> based on this message. If you have received this message (including any
> attachments) in error, please delete it immediately and notify the sender
> promptly.
>
>
>

--=20


*Confidentiality=C2=A0Note:*=C2=A0We care about protecting our proprietary=
=20
information,=C2=A0confidential=C2=A0material, and trade secrets.=C2=A0This =
message may=20
contain some or all of those things. Cruise will suffer material harm if=20
anyone other than the intended recipient disseminates or takes any action=
=20
based on this message. If you have received this message (including any=20
attachments) in error, please delete it immediately and notify the sender=
=20
promptly.

--0000000000006f5010061ef6ba5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:large">Tha=
nk you Thang! I was able to get rid of the compilation error by following y=
our recommendations!</div><div class=3D"gmail_default" style=3D"font-size:l=
arge"><br></div><div class=3D"gmail_default" style=3D"font-size:large">Chuc=
k</div><div class=3D"gmail_default" style=3D"font-size:large"><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Jul 30, 2024 at 3:21=E2=80=AFAM Thang Nguyen OS &lt;<a href=3D"mailto:=
thang@amperemail.onmicrosoft.com">thang@amperemail.onmicrosoft.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">



<div>
<br id=3D"m_7601450801192295393lineBreakAtBeginningOfMessage">
<div><br>
<blockquote type=3D"cite">
<div>On 30 Jul 2024, at 01:32, Chuck Kamas &lt;<a href=3D"mailto:chuck.kama=
s@getcruise.com" target=3D"_blank">chuck.kamas@getcruise.com</a>&gt; wrote:=
</div>
<br>
<div>
<div><span style=3D"font-weight:bold;font-size:12pt;font-family:Cambria;col=
or:rgb(249,56,34);line-height:15pt">[EXTERNAL EMAIL NOTICE: This email orig=
inated from an external sender. Please be mindful of safe email handling an=
d proprietary information protection practices.]</span><br>
<br>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_default" style=3D"font-size:large">Hi all,</div>
<div class=3D"gmail_default" style=3D"font-size:large"><br>
</div>
<div class=3D"gmail_default" style=3D"font-size:large">I am in the process =
of adding swupdate to my Ampere openbmc build.=C2=A0</div>
<div class=3D"gmail_default" style=3D"font-size:large"><br>
</div>
<div class=3D"gmail_default" style=3D"font-size:large">
<div role=3D"region" aria-labelledby=3D"c620" style=3D"margin:12px 0px;over=
flow:auto;padding-right:20px;font-family:Roboto,RobotoDraft,Helvetica,Arial=
,sans-serif;font-size:14px">
I have cloned openbmc:<br>
<ul>
<li>git clone=C2=A0<a href=3D"https://github.com/openbmc/openbmc.git" rel=
=3D"nofollow" style=3D"text-decoration-line:none;color:rgb(26,115,232)" tar=
get=3D"_blank">https://github.com/openbmc/openbmc.git</a><br>
</li></ul>
configured yocto:<br>
<ul>
<li>. setup mtjade</li></ul>
and compiled with no problem.
<div>
<ul>
<li>=C2=A0bitbake obmc-phosphor-image<br>
</li></ul>
I added libubootenv to the image, in local.conf:</div>
<div>
<ul>
<li>IMAGE_INSTALL:append =3D &quot;libubootenv&quot;<br>
</li></ul>
However when I build I get the following error:<br>
<br>
</div>
<div>
<div style=3D"color:rgb(204,204,204);background-color:rgb(31,31,31);font-fa=
mily:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;line-hei=
ght:18px;white-space:pre-wrap">
<div style=3D"line-height:18px">
<div>ERROR: Multiple .bb files are due to be built which each provide u-boo=
t-fw-utils:#####
<span style=3D"color:rgb(212,212,212)">|</span> ETA: 0:00:01</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
The Mt.Jade OpenBMC uses u-boot 2019.07 which provides=C2=A0u-boot-fw-utils=
 from=C2=A0<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-a=
speed/recipes-bsp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04.bb" target=3D"_=
blank">https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-b=
sp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04.bb</a>.</div>
<div>When adding libubootenv, it also provides u-boot-fw-utils=C2=A0<a href=
=3D"https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-=
boot/libubootenv_0.3.5.bb" target=3D"_blank">https://github.com/openbmc/ope=
nbmc/blob/master/poky/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb</a>.</di=
v>
<div>Can you manually remove one?</div>
<div>As I know, libubootenv is to provide fw_setenv and fw_getenv commands =
but they are already available.</div>
<div>I tried below change and I can still compile Mt.Jade successfully:</di=
v>
<div>1. Add to=C2=A0meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-fw-util=
s-aspeed_%.bbappend</div>
<div>DEPENDS +=3D &quot; libubootenv=E2=80=9D</div>
<div>2. Remove from=C2=A0meta-aspeed/recipes-bsp/u-boot/<a href=3D"http://u=
-boot-fw-utils-aspeed_2016.07.bb" target=3D"_blank">u-boot-fw-utils-aspeed_=
2016.07.bb</a></div>
<div>PROVIDES +=3D &quot;u-boot-fw-utils&quot;</div>
<div><br>
<blockquote type=3D"cite">
<div>
<div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_default" style=3D"font-size:large">
<div role=3D"region" aria-labelledby=3D"c620" style=3D"margin:12px 0px;over=
flow:auto;padding-right:20px;font-family:Roboto,RobotoDraft,Helvetica,Arial=
,sans-serif;font-size:14px">
<div>
<div style=3D"color:rgb(204,204,204);background-color:rgb(31,31,31);font-fa=
mily:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;line-hei=
ght:18px;white-space:pre-wrap">
<div style=3D"line-height:18px">
<div>openbmc/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb=
/" target=3D"_blank">libubootenv_0.3.5.bb</a></div>
<div>openbmc/meta-aspeed/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-uti=
ls-aspeed-sdk_2019.04.bb/" target=3D"_blank">u-boot-fw-utils-aspeed-sdk_201=
9.04.bb</a></div>
<div>A list of tasks depending on these providers is shown and may help exp=
lain <span style=3D"color:rgb(86,156,214)">
where</span> the dependency comes from.</div>
<div>openbmc/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb=
/" target=3D"_blank">libubootenv_0.3.5.bb</a> has unique dependees:</div>
<div>openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:d=
o_populate_lic_deploy</div>
<div>openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:d=
o_build</div>
<div>openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:d=
o_create_runtime_spdx</div>
<div>openbmc/meta-aspeed/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-uti=
ls-aspeed-sdk_2019.04.bb/" target=3D"_blank">u-boot-fw-utils-aspeed-sdk_201=
9.04.bb</a> has unique dependees:</div>
<div>openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb=
:do_create_runtime_spdx</div>
<div>openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:do=
_create_runtime_spdx</div>
<div>openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb=
:do_package_qa</div>
<div>openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:do=
_package_write_ipk</div>
<div>openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:do_cre=
ate_runtime_spdx</div>
<div>openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb=
:do_package_write_ipk</div>
<div>openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:do_pac=
kage_qa</div>
<div>openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:do_pac=
kage_write_ipk</div>
<div>openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:do=
_package_qa</div>
<div>It could be that one recipe provides something the other doesn&#39;t a=
nd should. The following provider and runtime provider differences may be h=
elpful.</div>
<div>openbmc/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb=
/" target=3D"_blank">libubootenv_0.3.5.bb</a> has unique provides:</div>
<div>libubootenv</div>
<div>openbmc/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb=
/" target=3D"_blank">libubootenv_0.3.5.bb</a> has unique rprovides:</div>
<div>libubootenv-dev</div>
<div>libubootenv-bin</div>
<div>libubootenv-doc</div>
<div>libubootenv-dbg</div>
<div>libubootenv</div>
<div>libubootenv-staticdev</div>
<div><span style=3D"color:rgb(215,186,125)">^</span>libubootenv-locale-.*</=
div>
<div>libubootenv-locale</div>
<div>libubootenv-src</div>
<div>openbmc/meta-aspeed/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-uti=
ls-aspeed-sdk_2019.04.bb/" target=3D"_blank">u-boot-fw-utils-aspeed-sdk_201=
9.04.bb</a> has unique provides:</div>
<div>u-boot-fw-utils-aspeed-sdk</div>
<div>openbmc/meta-aspeed/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-uti=
ls-aspeed-sdk_2019.04.bb/" target=3D"_blank">u-boot-fw-utils-aspeed-sdk_201=
9.04.bb</a> has unique rprovides:</div>
<div><span style=3D"color:rgb(215,186,125)">^</span>u-boot-fw-utils-aspeed-=
sdk-locale-.*</div>
<div>u-boot-fw-utils-aspeed-sdk-src</div>
<div>u-boot-fw-utils-aspeed-sdk</div>
<div>u-boot-fw-utils-aspeed-sdk-doc</div>
<div>u-boot-fw-utils-aspeed-sdk-locale</div>
<div>u-boot-fw-utils-aspeed-sdk-dbg</div>
<div>u-boot-fw-utils-aspeed-sdk-staticdev</div>
<div>u-boot-fw-utils-aspeed-sdk-dev</div>
<br>
</div>
</div>
</div>
<div><br>
I have asked over on the swupdate reflector and Stefano suggested it was an=
 conflict resulting from a change back in Dunfell?=C2=A0</div>
<div><br>
</div>
<div>Any suggestions on how to resolve this error would be appreciated!</di=
v>
<div><br>
</div>
<div>Chuck</div>
<div>=C2=A0</div>
</div>
</div>
</div>
<br>
<div><span style=3D"color:rgb(34,34,34);font-family:sans-serif;font-size:12=
.8px;background-color:rgb(255,255,255)"><br>
</span></div>
<b style=3D"color:rgb(34,34,34);background-color:rgb(255,255,255);font-fami=
ly:Calibri,sans-serif;font-size:14.6667px"><span style=3D"font-size:10pt;li=
ne-height:14.2667px;font-family:Arial,sans-serif;color:rgb(136,136,136)"><s=
pan>Confidentiality</span>=C2=A0Note:</span></b><span style=3D"font-size:7.=
5pt;line-height:10.7px;font-family:Arial,sans-serif;color:rgb(136,136,136);=
background-color:white">=C2=A0We
 care about protecting our proprietary information,=C2=A0<span>confidential=
</span>=C2=A0material, and trade secrets.=C2=A0</span><span style=3D"font-s=
ize:7.5pt;line-height:10.7px;font-family:Arial,sans-serif;color:rgb(136,136=
,136);background-color:white">This message may
 contain some or all of those things. Cruise will suffer material harm if a=
nyone other than the intended recipient disseminates or takes any action ba=
sed on this message. If you have received this message (including any attac=
hments) in error, please delete
 it immediately and notify the sender promptly.</span></div>
</div>
</div>
</blockquote>
</div>
<br>
</div>

</blockquote></div>

<br>
<div><span style=3D"color:rgb(34,34,34);font-family:sans-serif;font-size:12=
.8px;background-color:rgb(255,255,255)"><br></span></div><b style=3D"color:=
rgb(34,34,34);background-color:rgb(255,255,255);font-family:Calibri,sans-se=
rif;font-size:14.6667px"><span style=3D"font-size:10pt;line-height:14.2667p=
x;font-family:Arial,sans-serif;color:rgb(136,136,136)"><span>Confidentialit=
y</span>=C2=A0Note:</span></b><span style=3D"font-size:7.5pt;line-height:10=
.7px;font-family:Arial,sans-serif;color:rgb(136,136,136);background-color:w=
hite">=C2=A0We care about protecting our proprietary information,=C2=A0<spa=
n>confidential</span>=C2=A0<wbr>material, and trade secrets.=C2=A0</span><s=
pan style=3D"font-size:7.5pt;line-height:10.7px;font-family:Arial,sans-seri=
f;color:rgb(136,136,136);background-color:white">This message may contain s=
ome or all of those things. Cruise will suffer material harm if anyone othe=
r than the intended recipient disseminates or takes any action based on thi=
s message. If you have received this message (including any attachments) in=
 error, please delete it immediately and notify the sender promptly.</span>
--0000000000006f5010061ef6ba5e--
