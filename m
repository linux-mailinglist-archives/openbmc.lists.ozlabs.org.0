Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D793FD61
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2024 20:33:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=getcruise.com header.i=@getcruise.com header.a=rsa-sha256 header.s=google header.b=NPl8pQ4o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXn6g1B8jz3cds
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2024 04:33:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=getcruise.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=getcruise.com header.i=@getcruise.com header.a=rsa-sha256 header.s=google header.b=NPl8pQ4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=getcruise.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=chuck.kamas@getcruise.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXn6665fdz3cXL
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2024 04:32:45 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so59224041fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2024 11:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google; t=1722277960; x=1722882760; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ri4Kv2KSf7u6buFpfsRzg9vwzY81FGS1BRmNjvLQ9m8=;
        b=NPl8pQ4oLE0yaRUfaAPEPWqJ98UrBLWB/2mXz6XQxi+yKlNU7KUGro7yaRdoPxMIGi
         hFD1RLaC54yDMzkY4xcMmEqxYaBzKkXVxrfJTbxuK2wZ1hc279oJRjEOwUGb8X5D+fD2
         0ktv9Kwd0e+aOQSmlIQlvab8gb7Qmf0n6MAf02o3ugyDiHLJlUlBXqW+wJ5Bs5tceh4W
         GBTahW1hnz4JnjttmW7Aeptbch5n2AY5IfJRjJOVZTDw78glPQuPI05ew81z3spHVwVv
         MjfmeS1Fk5SGSpoukaX2rkyH6D60aKjkTZOpnLuUYbC7JEtKuuvUwGPqsFekaFJP8932
         nQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722277960; x=1722882760;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ri4Kv2KSf7u6buFpfsRzg9vwzY81FGS1BRmNjvLQ9m8=;
        b=SpgEtTL/EmcGghWAqCLox+Wn/+MR+kI0jOSBZ3GPpw7sMdKwFzLuH8rJML5r4N9JGA
         GExIa8z2VOvs9xxIafXMED1cHyAgvgbvx8GIZtVH5lPYY87afH83xUIwdlG6uKbw4MAE
         AuLuqzV4m5lsiiC3xjr2I+w9ZpmKIWYLo2L3iSLjaBLBuEfpMMMlp6VGJj3fmoSIR+As
         ++oSVGw9TMOnHu8KDrJY2dybCDlfOM+9AHeHujd1+GPuYW4Vh3c781dY0HAxa3izG3BP
         juj+rOonAka7xB4VPwM+k/zhxu+QyuGZhUoq6Op+4spzwBd313ZI/1tat6JD32pF2vuw
         RYGA==
X-Gm-Message-State: AOJu0YxlT0fFH/N86DhK1quqndFv9XJql7klqYnNbgQNKe6aumVjk4xt
	R/8MkCPlPZ6IZUJ6zFVn6+p6WZmebWe/ndOsY/gzhcxYGuk3g9IgwnMfQkuLnIQZmhORtCmNdpt
	/71NjbVADugAmkEXvNmcXHSHHPGAp9ccJvl3U5SMP9ETaN07diRCocKUCxc96izxxonCBMBwBFs
	7aGX+k6DAcMP6mY31X1alhf7Rf6t3EjWXex8+01+lf
X-Google-Smtp-Source: AGHT+IH6Yc6W9LjJye8ovSVOj5RqrYkZOlBCFUyf6Sv608Q0b5AoRUBrluPcpWWE9sKntuBeubi++P2EDM49e20hJXM=
X-Received: by 2002:a2e:9ac5:0:b0:2ef:23ec:9356 with SMTP id
 38308e7fff4ca-2f12edef762mr56996561fa.8.1722277960132; Mon, 29 Jul 2024
 11:32:40 -0700 (PDT)
MIME-Version: 1.0
From: Chuck Kamas <chuck.kamas@getcruise.com>
Date: Mon, 29 Jul 2024 11:32:29 -0700
Message-ID: <CABMF29msHomoDwHG_kDjnT-ytdY0mxS_bh_1kZmtLk6z=7H0nA@mail.gmail.com>
Subject: including libubootenv in Ampere's openbmc
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000051fc4061e67165c"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000051fc4061e67165c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am in the process of adding swupdate to my Ampere openbmc build.

I have cloned openbmc:

   - git clone https://github.com/openbmc/openbmc.git

configured yocto:

   - . setup mtjade

and compiled with no problem.

   -  bitbake obmc-phosphor-image

I added libubootenv to the image, in local.conf:

   - IMAGE_INSTALL:append =3D "libubootenv"

However when I build I get the following error:

ERROR: Multiple .bb files are due to be built which each provide
u-boot-fw-utils:##### | ETA: 0:00:01
openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
openbmc/meta-aspeed/recipes-bsp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04.b=
b
A list of tasks depending on these providers is shown and may help explain
where the dependency comes from.
openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb has unique dependees:
openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
do_populate_lic_deploy
openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
do_build
openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
do_create_runtime_spdx
openbmc/meta-aspeed/recipes-bsp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04.b=
b
has unique dependees:
openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb:
do_create_runtime_spdx
openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:
do_create_runtime_spdx
openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb:
do_package_qa
openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:
do_package_write_ipk
openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:
do_create_runtime_spdx
openbmc/meta-phosphor/recipes-phosphor/network/phosphor-network_git.bb:
do_package_write_ipk
openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:
do_package_qa
openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:
do_package_write_ipk
openbmc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:
do_package_qa
It could be that one recipe provides something the other doesn't and
should. The following provider and runtime provider differences may be
helpful.
openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb has unique provides:
libubootenv
openbmc/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb has unique rprovides:
libubootenv-dev
libubootenv-bin
libubootenv-doc
libubootenv-dbg
libubootenv
libubootenv-staticdev
^libubootenv-locale-.*
libubootenv-locale
libubootenv-src
openbmc/meta-aspeed/recipes-bsp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04.b=
b
has unique provides:
u-boot-fw-utils-aspeed-sdk
openbmc/meta-aspeed/recipes-bsp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04.b=
b
has unique rprovides:
^u-boot-fw-utils-aspeed-sdk-locale-.*
u-boot-fw-utils-aspeed-sdk-src
u-boot-fw-utils-aspeed-sdk
u-boot-fw-utils-aspeed-sdk-doc
u-boot-fw-utils-aspeed-sdk-locale
u-boot-fw-utils-aspeed-sdk-dbg
u-boot-fw-utils-aspeed-sdk-staticdev
u-boot-fw-utils-aspeed-sdk-dev


I have asked over on the swupdate reflector and Stefano suggested it was an
conflict resulting from a change back in Dunfell?

Any suggestions on how to resolve this error would be appreciated!

Chuck

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

--000000000000051fc4061e67165c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:large">Hi =
all,</div><div class=3D"gmail_default" style=3D"font-size:large"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:large">I am in the process =
of adding swupdate to my Ampere openbmc build.=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:large"><br></div><div class=3D"gmail_default=
" style=3D"font-size:large"><div class=3D"gmail-ptW7te" role=3D"region" ari=
a-labelledby=3D"c620" style=3D"margin:12px 0px;overflow:auto;padding-right:=
20px;color:rgba(0,0,0,0.87);font-family:Roboto,RobotoDraft,Helvetica,Arial,=
sans-serif;font-size:14px">I have cloned openbmc:<br><ul><li>git clone=C2=
=A0<a href=3D"https://github.com/openbmc/openbmc.git" target=3D"_blank" rel=
=3D"nofollow" style=3D"text-decoration-line:none;color:rgb(26,115,232)">htt=
ps://github.com/openbmc/openbmc.git</a><br></li></ul>configured yocto:<br><=
ul><li>. setup mtjade</li></ul>and compiled with no problem.<div><ul><li>=
=C2=A0bitbake obmc-phosphor-image<br></li></ul>I added libubootenv to the i=
mage, in local.conf:</div><div><ul><li>IMAGE_INSTALL:append =3D &quot;libub=
ootenv&quot;<br></li></ul>However when I build I get the following error:<b=
r><br></div><div><div style=3D"color:rgb(204,204,204);background-color:rgb(=
31,31,31);font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-s=
ize:12px;line-height:18px;white-space:pre"><div style=3D"line-height:18px">=
<div>ERROR: Multiple .bb files are due to be built which each provide u-boo=
t-fw-utils:#####                                                           =
                     <span style=3D"color:rgb(212,212,212)">|</span> ETA:  =
0:00:01</div><div>  openbmc/meta/recipes-bsp/u-boot/<a href=3D"http://libub=
ootenv_0.3.5.bb">libubootenv_0.3.5.bb</a></div><div>  openbmc/meta-aspeed/r=
ecipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils-aspeed-sdk_2019.04.bb">=
u-boot-fw-utils-aspeed-sdk_2019.04.bb</a></div><div>A list of tasks dependi=
ng on these providers is shown and may help explain <span style=3D"color:rg=
b(86,156,214)">where</span> the dependency comes from.</div><div>openbmc/me=
ta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb">libubootenv_0=
.3.5.bb</a> has unique dependees:</div><div>  openbmc/meta-phosphor/recipes=
-phosphor/images/obmc-phosphor-image.bb:do_populate_lic_deploy</div><div>  =
openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_bui=
ld</div><div>  openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-=
image.bb:do_create_runtime_spdx</div><div>openbmc/meta-aspeed/recipes-bsp/u=
-boot/<a href=3D"http://u-boot-fw-utils-aspeed-sdk_2019.04.bb">u-boot-fw-ut=
ils-aspeed-sdk_2019.04.bb</a> has unique dependees:</div><div>  openbmc/met=
a-phosphor/recipes-phosphor/network/phosphor-network_git.bb:do_create_runti=
me_spdx</div><div>  openbmc/meta-phosphor/recipes-phosphor/trace-enable/tra=
ce-enable.bb:do_create_runtime_spdx</div><div>  openbmc/meta-phosphor/recip=
es-phosphor/network/phosphor-network_git.bb:do_package_qa</div><div>  openb=
mc/meta-phosphor/recipes-phosphor/trace-enable/trace-enable.bb:do_package_w=
rite_ipk</div><div>  openbmc/meta-phosphor/recipes-phosphor/clear-once/clea=
r-once.bb:do_create_runtime_spdx</div><div>  openbmc/meta-phosphor/recipes-=
phosphor/network/phosphor-network_git.bb:do_package_write_ipk</div><div>  o=
penbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.bb:do_package_q=
a</div><div>  openbmc/meta-phosphor/recipes-phosphor/clear-once/clear-once.=
bb:do_package_write_ipk</div><div>  openbmc/meta-phosphor/recipes-phosphor/=
trace-enable/trace-enable.bb:do_package_qa</div><div>It could be that one r=
ecipe provides something the other doesn&#39;t and should. The following pr=
ovider and runtime provider differences may be helpful.</div><div>openbmc/m=
eta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb">libubootenv_=
0.3.5.bb</a> has unique provides:</div><div>  libubootenv</div><div>openbmc=
/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.5.bb">libubooten=
v_0.3.5.bb</a> has unique rprovides:</div><div>  libubootenv-dev</div><div>=
  libubootenv-bin</div><div>  libubootenv-doc</div><div>  libubootenv-dbg</=
div><div>  libubootenv</div><div>  libubootenv-staticdev</div><div>  <span =
style=3D"color:rgb(215,186,125)">^</span>libubootenv-locale-.*</div><div>  =
libubootenv-locale</div><div>  libubootenv-src</div><div>openbmc/meta-aspee=
d/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils-aspeed-sdk_2019.04.b=
b">u-boot-fw-utils-aspeed-sdk_2019.04.bb</a> has unique provides:</div><div=
>  u-boot-fw-utils-aspeed-sdk</div><div>openbmc/meta-aspeed/recipes-bsp/u-b=
oot/<a href=3D"http://u-boot-fw-utils-aspeed-sdk_2019.04.bb">u-boot-fw-util=
s-aspeed-sdk_2019.04.bb</a> has unique rprovides:</div><div>  <span style=
=3D"color:rgb(215,186,125)">^</span>u-boot-fw-utils-aspeed-sdk-locale-.*</d=
iv><div>  u-boot-fw-utils-aspeed-sdk-src</div><div>  u-boot-fw-utils-aspeed=
-sdk</div><div>  u-boot-fw-utils-aspeed-sdk-doc</div><div>  u-boot-fw-utils=
-aspeed-sdk-locale</div><div>  u-boot-fw-utils-aspeed-sdk-dbg</div><div>  u=
-boot-fw-utils-aspeed-sdk-staticdev</div><div>  u-boot-fw-utils-aspeed-sdk-=
dev</div><br></div></div></div><div><br>I have asked over on the swupdate r=
eflector and Stefano suggested it was an conflict resulting from a change b=
ack in Dunfell?=C2=A0</div><div><br></div><div>Any suggestions on how to re=
solve this error would be appreciated!</div><div><br></div><div>Chuck</div>=
<div>=C2=A0</div></div></div></div>

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
--000000000000051fc4061e67165c--
