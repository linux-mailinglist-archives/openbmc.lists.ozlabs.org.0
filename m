Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E97A4830A2
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 12:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSDHV6sN9z2ywp
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 22:37:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=OWxv6bC+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4.zoho.com;
 envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com
 header.a=rsa-sha256 header.s=admin header.b=OWxv6bC+; 
 dkim-atps=neutral
Received: from sender4.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSDH35sBpz2y7P
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 22:36:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1641209802; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CFGjEUOVft+j2AwrC665dMq0hpZl+bwE+O/kUZL/45MUrd35De5bt1fLL+E1p/DKWAjiJJgFeEpmiUgpccqMgkgwjk7NyOfA6YxrDy6Kc/wy5jRocq5z4TW90S5CO5hDGzNPKSdwvIhZP+l8C4LjM7wtIvIJZZx1o2Pdt5CcHjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1641209802;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=P/wgg4Wqn7NrGSevVnaoZKOK6E371VPOULsM2RyIgsY=; 
 b=c3xpZq7u98hBh57gYEBdLJV3Vl5XO2JkhtcwOK8/lHD97OICgxL5n0UYQ8Xq+1a1S1Vux1nPP2YEdd2GDbvpSZxa0iVRwO4y3aHthh71C4qHfMCas+8/1kp3zi3JDDCN9hbttKn4MV2FEaf30yAa1VpgEZ1XdX2QXfY/mZeO0UQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohocorp.com;
 spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
 dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641209802; 
 s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
 h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Subject:MIME-Version:Content-Type;
 bh=P/wgg4Wqn7NrGSevVnaoZKOK6E371VPOULsM2RyIgsY=;
 b=OWxv6bC+xm5y3GNQKakc7+j1gOh7fpPR74zqHfyqEkAZYVlFLiCKS2ICKfaXOkMv
 ucx0Ll1KGIgQs5vrFxN8YTuNETezIGXMMG6gN62OTCkemvmxiQ1MbhBBYKe/BGL/IPG
 hZoTDF01eklW5ADY0wAGAzhTs/58u7bhH2aDs6cY=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1641209801714496.25729524297606;
 Mon, 3 Jan 2022 03:36:41 -0800 (PST)
Date: Mon, 03 Jan 2022 17:06:41 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "akartashev" <a.kartashev@yadro.com>
Message-Id: <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
In-Reply-To: <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
 <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_15983_956509925.1641209801680"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_15983_956509925.1641209801680
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello kartashev,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for your q=
uick response, I will provide some background on what i am trying to achiev=
e.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am using openbm=
c, downloaded from following location, steps are as follow,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1)=C2=A0   =
          git clone https://github.com/openbmc/openbmc.git -b dunfell


=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2)=C2=A0 gi=
t clone git://github.com/linux4sam/meta-atmel.git -b dunfell

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3)=C2=A0 . =
openbmc-env build-sama5d27

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4)=C2=A0 th=
en add following layers

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bitbake-layers add-layer ../meta-atmel ../meta-security ../meta-open=
embedded/meta-perl ../meta-openembedded/meta-initramfs

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5)=C2=A0=C2=
=A0 Edit in local.conf


=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0 MACHINE=3D"sama5d27-som1-ek-sd"=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6)=C2=A0=C2=
=A0 bitbake obmc-phosphor-image



"Since there is no such platform as "at91" in OpenBMC, we don't know what r=
ecipe do you use for u-boot."

Here I am using meta-atmel layer provided by microchip. It has its own u-bo=
ot under meta-atmel/recipe-bsp.

you will find it once you downloaded it from step 2.



when i do bitbake obmc-phosphor-image i am getting error. ERROR: Nothing RP=
ROVIDES 'u-boot-default-env'



hope i have described my problem correctly.



For any query feel free to contact.



Thanks & Regards,

Nikhil Muley






---- On Mon, 03 Jan 2022 16:40:09 +0530 Andrei Kartashev <a.kartashev@yadro=
.com> wrote ----



Hello,=20
=20
It's hard to say what's wrong without knowing of what are you exactly=20
doing. Since there is no such platform as "at91" in OpenBMC, we don't=20
know what recipe do you use for u-boot.=20
Generally, u-boot recipe should include u-boot.inc:=20
=20
> require recipes-bsp/u-boot/u-boot.inc=20
=20
This include file provide u-boot-default-env recipe=20
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-boot=
/u-boot.inc#L215=20
=20
On Mon, 2022-01-03 at 15:34 +0530, Nikhil V wrote:=20
> Hi,=20
> =C2=A0=C2=A0=C2=A0=C2=A0 I am trying to build image for openbmc on SAMA5D=
27-som1-ek1=20
> development board made by microchip(atmel). SAMA5D27 board has yocto=20
> support.=20
> =C2=A0=C2=A0=C2=A0=C2=A0 I have added meta-atmel layer to openbmc, while =
building/compiling=20
> using " bitbake obmc-phosphor-image ", I am facing following error,=20
> =C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ERROR: Nothing RPROVIDES 'u-boot-default-=
env']=20
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have tried by updating with following co=
ntent but didnt get any=20
> result.=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PREFERRED_PROVIDER_u-boot =3D "u-boot-at91"=20
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-at91"=20
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Can you help me to find a solution.=20
>=20
> =C2=A0=20
> Thanks & Regards,=20
> Nikhil Muley=20
>=20
>=20
>=20
=20
--=20
Best regards,=20
Andrei Kartashev
------=_Part_15983_956509925.1641209801680
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hello kartashev,<br></div><div>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your quick response, I wi=
ll provide some background on what i am trying to achieve.<br></div><div>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am using openbmc,=
 downloaded from following location, steps are as follow,<br></div><div>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1)&nbsp;        =
     git clone <a target=3D"_blank" href=3D"https://github.com/openbmc/open=
bmc.git">https://github.com/openbmc/openbmc.git</a> -b dunfell
<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 2)&nbsp; git clone git://github.com/linux4sam/meta-atmel.git -b dunfell=
<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 3)&nbsp; . openbmc-env build-sama5d27<br></div><div>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4)&nbsp; then add following la=
yers<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; bitbake-layers add-layer ../meta-atmel ../meta-secu=
rity ../meta-openembedded/meta-perl ../meta-openembedded/meta-initramfs<br>=
</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
5)&nbsp;&nbsp; Edit in local.conf
<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MACHINE=3D"sama5d27-som1-ek-sd" <br></di=
v><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6)&n=
bsp;&nbsp; bitbake obmc-phosphor-image<br></div><div><br></div><div><span c=
lass=3D"highlight" style=3D"background-color:#ffffcc">"Since there is no su=
ch platform as "at91" in OpenBMC, we don't know what recipe do you use for =
u-boot."</span><br></div><div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D=
"true" data-sigid=3D"58018000000014003"><div>Here I am using meta-atmel lay=
er provided by microchip. It has its own u-boot under meta-atmel/recipe-bsp=
.<br></div><div>you will find it once you downloaded it from step 2.<br></d=
iv><div><br></div><div>when i do bitbake obmc-phosphor-image i am getting e=
rror. ERROR: Nothing RPROVIDES 'u-boot-default-env'<br></div><div><br></div=
><div>hope i have described my problem correctly.<br></div><div><br></div><=
div>For any query feel free to contact.<br></div><div><br></div><div>Thanks=
 &amp; Regards,<br></div><div>Nikhil Muley<br></div></div><div class=3D"zma=
il_extra_hr" style=3D"border-top: 1px solid rgb(204, 204, 204); height: 0px=
; margin-top: 10px; margin-bottom: 10px; line-height: 0px;"><br></div><div =
class=3D"zmail_extra" data-zbluepencil-ignore=3D"true"><div><br></div><div =
id=3D"Zm-_Id_-Sgn1">---- On Mon, 03 Jan 2022 16:40:09 +0530 <b>Andrei Karta=
shev &lt;a.kartashev@yadro.com&gt;</b> wrote ----<br></div><div><br></div><=
blockquote style=3D"margin: 0px;"><div>Hello, <br> <br>It's hard to say wha=
t's wrong without knowing of what are you exactly <br>doing. Since there is=
 no such platform as "at91" in OpenBMC, we don't <br>know what recipe do yo=
u use for u-boot. <br>Generally, u-boot recipe should include u-boot.inc: <=
br> <br>&gt; require recipes-bsp/u-boot/u-boot.inc <br> <br>This include fi=
le provide u-boot-default-env recipe <br>https://github.com/openbmc/openbmc=
/blob/master/poky/meta/recipes-bsp/u-boot/u-boot.inc#L215 <br> <br>On Mon, =
2022-01-03 at 15:34 +0530, Nikhil V wrote: <br>&gt; Hi, <br>&gt; &nbsp;&nbs=
p;&nbsp;&nbsp; I am trying to build image for openbmc on SAMA5D27-som1-ek1 =
<br>&gt; development board made by microchip(atmel). SAMA5D27 board has yoc=
to <br>&gt; support. <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp; I have added meta-at=
mel layer to openbmc, while building/compiling <br>&gt; using " bitbake obm=
c-phosphor-image ", I am facing following error, <br>&gt; &nbsp;&nbsp;&nbsp=
;&nbsp; <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ERROR: Nothing RPROVIDES '=
u-boot-default-env'] <br>&gt; <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I hav=
e tried by updating with following content but didnt get any <br>&gt; resul=
t. <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_PROVIDER_u-boot =3D "u-boot-at91" <br=
>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-at91" <b=
r>&gt; <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Can you help me to find a so=
lution. <br>&gt; <br>&gt; &nbsp; <br>&gt; Thanks &amp; Regards, <br>&gt; Ni=
khil Muley <br>&gt; <br>&gt; <br>&gt; <br> <br>-- <br>Best regards, <br>And=
rei Kartashev <br> <br> <br></div></blockquote></div><div><br></div></div><=
br></body></html>
------=_Part_15983_956509925.1641209801680--

