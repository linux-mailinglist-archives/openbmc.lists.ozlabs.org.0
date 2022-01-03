Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D8483152
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 14:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSGTS5r84z304y
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 00:15:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=RtxQ2JEk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4.zoho.com;
 envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com
 header.a=rsa-sha256 header.s=admin header.b=RtxQ2JEk; 
 dkim-atps=neutral
Received: from sender4.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSGT00B15z2x9S
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jan 2022 00:15:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1641215726; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZkbMwAWRCkXgUselmQhl/PX695LBi9f0ptJvaNkJWrEXwQYbcvs3mjz+ig0CLrOmaR4hi4xDvYud8CuRufYdtz1ZYLvQ9JFcCgNmsba4t//3KPzgaEj0h3F5VolPpvuYFoDdepyPf8mDd5OFK4bqQNi988ss0QaJidr3WcPg2uQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1641215726;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=OHqBWIjlfURatqFVe9HPvtcbpy7caqMjIgjNVpi+jfY=; 
 b=QtUlkxSSh7UmHbjOMDEBNxwCucFZndIio9bh0chp8zNLMjzBh6OZxAUaWqfKi2OfI8WYEI62BXvt79c2c80dET3T/69CwFN/lDVFuhWgPdeyB9B9U5E8DRUbXGngZAhzZ0SKodHky4hX0l3mgJUEbioyXfZNElaU13n3vaYKq0Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohocorp.com;
 spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
 dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641215725; 
 s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
 h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Subject:MIME-Version:Content-Type;
 bh=OHqBWIjlfURatqFVe9HPvtcbpy7caqMjIgjNVpi+jfY=;
 b=RtxQ2JEkZ2UhmnCx7h8F/3mrA76jw1y83gfv7+wRlOWWm6ZTpbgLAU7z0t9FZvW3
 Jq6OwZT//SC7dl1Lpuc++jgBujGr0bHyiIAOV1PjK4sQI06ciIJmR5lqg9CycikX6UP
 8wFiL5a3cgNg7boUYJk7qF2912bZQaOWj6uOlJwc=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1641215724219132.8694190386217;
 Mon, 3 Jan 2022 05:15:24 -0800 (PST)
Date: Mon, 03 Jan 2022 18:45:24 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "akartashev" <a.kartashev@yadro.com>
Message-Id: <17e20148a9c.10fd4f6105879.8717643372259739590@zohocorp.com>
In-Reply-To: <bd8a1dec629cc9dd69c44578122a178d7af6eb7e.camel@yadro.com>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
 <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
 <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
 <bd8a1dec629cc9dd69c44578122a178d7af6eb7e.camel@yadro.com>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_18639_695883902.1641215724188"
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

------=_Part_18639_695883902.1641215724188
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrei Kartashev,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for your patience and sup=
port.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 As suggested by you to try with =
normal yocto build and then go for OpenBMC.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have a success with yocto imag=
e for SAMA5D27 development board and tested and verified using steps descri=
bed in following link

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=C2=A0https://www.linux4sam.org/bin/v=
iew/Linux4SAM/Sama5d27Som1EKMainPage )

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 But i got error when i do same f=
or openbmc,=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 As i am new to openbmc and may be i am wrong with my interpretation

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have the following Interpretat=
ion towards problem.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0 If you look into meta/recipe-bsp/u-boot/libubootenv_0.3=
.1.bb

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0 It describe that it "It provides hardware-indepen=
dent replacement for fw_printenv/setenv utilities provided by U-Boot"

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0 If you look into meta-atmel/recipe-bsp=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 There is nothing indicating=C2=
=A0fw_printenv/setenv at u-boot-at91_2020.01.bb recipe.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Correct me if I am wrong.



Thanks & Regards,

Nikhil Muley








---- On Mon, 03 Jan 2022 18:00:56 +0530 Andrei Kartashev <a.kartashev@yadro=
.com> wrote ----



Well, as I say, they don't use u-boot.inc an they don't implement u-=20
boot-default-env. I can't give you an universal hint on how to solve=20
this, but I advice you to build upstream Yocto for your platform first=20
(I mean, generic yocto, instead of OpenBMC). Once you succeeded with=20
upstream Yocto, integrating into OpenBMC would be less painful.=20
=20
What you trying to do is not a typical usecase for OpenBMC, generally=20
we don't do like this. What are your expectations and final goal?=20
=20
On Mon, 2022-01-03 at 17:06 +0530, Nikhil V wrote:=20
> Hello kartashev,=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for you=
r quick response, I will provide=20
> some background on what i am trying to achieve.=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am using ope=
nbmc, downloaded from following=20
> location, steps are as follow,=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1)=C2=A0=
 git clone=20
> https://github.com/openbmc/openbmc.git -b dunfell=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2)=C2=A0=
 git clone=20
> git://github.com/linux4sam/meta-atmel.git -b dunfell=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3)=C2=A0=
 . openbmc-env build-sama5d27=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4)=C2=A0=
 then add following layers=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bitbake-layers add-layer ../meta-atmel=20
> ../meta-security ../meta-openembedded/meta-perl ../meta-=20
> openembedded/meta-initramfs=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5)=C2=A0=
=C2=A0 Edit in local.conf=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0 MACHINE=3D"sama5d27-som1-ek-sd"=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6)=C2=A0=
=C2=A0 bitbake obmc-phosphor-image=20
>=20
> "Since there is no such platform as "at91" in OpenBMC, we don't know=20
> what recipe do you use for u-boot."=20
> Here I am using meta-atmel layer provided by microchip. It has its=20
> own u-boot under meta-atmel/recipe-bsp.=20
> you will find it once you downloaded it from step 2.=20
>=20
> when i do bitbake obmc-phosphor-image i am getting error. ERROR:=20
> Nothing RPROVIDES 'u-boot-default-env'=20
>=20
> hope i have described my problem correctly.=20
>=20
> For any query feel free to contact.=20
>=20
> Thanks & Regards,=20
> Nikhil Muley=20
>=20
>=20
> ---- On Mon, 03 Jan 2022 16:40:09 +0530 Andrei Kartashev=20
> <mailto:a.kartashev@yadro.com> wrote ----=20
>=20
> > Hello,=20
> > =C2=A0=20
> > It's hard to say what's wrong without knowing of what are you=20
> > exactly=20
> > doing. Since there is no such platform as "at91" in OpenBMC, we=20
> > don't=20
> > know what recipe do you use for u-boot.=20
> > Generally, u-boot recipe should include u-boot.inc:=20
> > =C2=A0=20
> > > require recipes-bsp/u-boot/u-boot.inc=20
> > =C2=A0=20
> > This include file provide u-boot-default-env recipe=20
> > https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-=
boot/u-boot.inc#L215=20
> > =C2=A0=20
> > On Mon, 2022-01-03 at 15:34 +0530, Nikhil V wrote:=20
> > > Hi,=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 I am trying to build image for openbmc on SA=
MA5D27-som1-ek1=20
> > > development board made by microchip(atmel). SAMA5D27 board has=20
> > > yocto=20
> > > support.=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 I have added meta-atmel layer to openbmc, wh=
ile=20
> > > building/compiling=20
> > > using " bitbake obmc-phosphor-image ", I am facing following=20
> > > error,=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ERROR: Nothing RPROVIDES 'u-boot-defa=
ult-env']=20
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have tried by updating with followin=
g content but didnt=20
> > > get any=20
> > > result.=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PREFERRED_PROVIDER_u-boot =3D "u-boot-at91"=20
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-=20
> > > at91"=20
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Can you help me to find a solution.=20
> > >=20
> > > =C2=A0=20
> > > Thanks & Regards,=20
> > > Nikhil Muley=20
> > >=20
> > >=20
> > >=20
> > =C2=A0=20
=20
--=20
Best regards,=20
Andrei Kartashev
------=_Part_18639_695883902.1641215724188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hello Andrei Kartashev,<br></div><div>&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your patience and support.<br></d=
iv><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As suggested by you to t=
ry with normal yocto build and then go for OpenBMC.<br></div><div>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a success with yocto image for SAM=
A5D27 development board and tested and verified using steps described in fo=
llowing link<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&nbsp;<a t=
arget=3D"_blank" href=3D"https://www.linux4sam.org/bin/view/Linux4SAM/Sama5=
d27Som1EKMainPage">https://www.linux4sam.org/bin/view/Linux4SAM/Sama5d27Som=
1EKMainPage</a> )<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
But i got error when i do same for openbmc, <br></div><div>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As i am new to openbmc and m=
ay be i am wrong with my interpretation<br></div><div>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; I have the following Interpretation towards problem.<=
br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; If you look into meta/recipe-bsp/u-boot/lib=
ubootenv_0.3.1.bb<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; It describe that it =
"It provides hardware-independent replacement for fw_printenv/setenv utilit=
ies provided by U-Boot"<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; I=
f you look into meta-atmel/recipe-bsp <br></div><div>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; There is nothing indicating&nbsp;fw_printenv/setenv at=
 u-boot-at91_2020.01.bb recipe.<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Correct me if I am wrong.<br></div><div><br></div><div>Thanks &amp; Regards=
,<br></div><div>Nikhil Muley<br></div><div id=3D"Zm-_Id_-Sgn" data-zbluepen=
cil-ignore=3D"true" data-sigid=3D"58018000000014003"><div><br></div></div><=
div class=3D"zmail_extra_hr" style=3D"border-top: 1px solid rgb(204, 204, 2=
04); height: 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0px;"=
><br></div><div class=3D"zmail_extra" data-zbluepencil-ignore=3D"true"><div=
><br></div><div id=3D"Zm-_Id_-Sgn1">---- On Mon, 03 Jan 2022 18:00:56 +0530=
 <b>Andrei Kartashev &lt;a.kartashev@yadro.com&gt;</b> wrote ----<br></div>=
<div><br></div><blockquote style=3D"margin: 0px;"><div>Well, as I say, they=
 don't use u-boot.inc an they don't implement u- <br>boot-default-env. I ca=
n't give you an universal hint on how to solve <br>this, but I advice you t=
o build upstream Yocto for your platform first <br>(I mean, generic yocto, =
instead of OpenBMC). Once you succeeded with <br>upstream Yocto, integratin=
g into OpenBMC would be less painful. <br> <br>What you trying to do is not=
 a typical usecase for OpenBMC, generally <br>we don't do like this. What a=
re your expectations and final goal? <br> <br>On Mon, 2022-01-03 at 17:06 +=
0530, Nikhil V wrote: <br>&gt; Hello kartashev, <br>&gt; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your quick response, I w=
ill provide <br>&gt; some background on what i am trying to achieve. <br>&g=
t; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am using ope=
nbmc, downloaded from following <br>&gt; location, steps are as follow, <br=
>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&gt; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1)&nbsp; git =
clone <br>&gt; <a href=3D"https://github.com/openbmc/openbmc.git" target=3D=
"_blank">https://github.com/openbmc/openbmc.git</a> -b dunfell <br>&gt; &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2)&nbsp; git c=
lone <br>&gt; git://github.com/linux4sam/meta-atmel.git -b dunfell <br>&gt;=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3)&nbsp; .=
 openbmc-env build-sama5d27 <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 4)&nbsp; then add following layers <br>&gt; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
bitbake-layers add-layer ../meta-atmel <br>&gt; ../meta-security ../meta-op=
enembedded/meta-perl ../meta- <br>&gt; openembedded/meta-initramfs <br>&gt;=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5)&nbsp;&n=
bsp; Edit in local.conf <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MACHINE=3D"sama5d27-so=
m1-ek-sd" <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 6)&nbsp;&nbsp; bitbake obmc-phosphor-image <br>&gt; <br>&gt; "Since=
 there is no such platform as "at91" in OpenBMC, we don't know <br>&gt; wha=
t recipe do you use for u-boot." <br>&gt; Here I am using meta-atmel layer =
provided by microchip. It has its <br>&gt; own u-boot under meta-atmel/reci=
pe-bsp. <br>&gt; you will find it once you downloaded it from step 2. <br>&=
gt; <br>&gt; when i do bitbake obmc-phosphor-image i am getting error. ERRO=
R: <br>&gt; Nothing RPROVIDES 'u-boot-default-env' <br>&gt; <br>&gt; hope i=
 have described my problem correctly. <br>&gt; <br>&gt; For any query feel =
free to contact. <br>&gt; <br>&gt; Thanks &amp; Regards, <br>&gt; Nikhil Mu=
ley <br>&gt; <br>&gt; <br>&gt; ---- On Mon, 03 Jan 2022 16:40:09 +0530 Andr=
ei Kartashev <br>&gt; &lt;<a href=3D"mailto:a.kartashev@yadro.com" target=
=3D"_blank">a.kartashev@yadro.com</a>&gt; wrote ---- <br>&gt; <br>&gt; &gt;=
 Hello, <br>&gt; &gt; &nbsp; <br>&gt; &gt; It's hard to say what's wrong wi=
thout knowing of what are you <br>&gt; &gt; exactly <br>&gt; &gt; doing. Si=
nce there is no such platform as "at91" in OpenBMC, we <br>&gt; &gt; don't =
<br>&gt; &gt; know what recipe do you use for u-boot. <br>&gt; &gt; General=
ly, u-boot recipe should include u-boot.inc: <br>&gt; &gt; &nbsp; <br>&gt; =
&gt; &gt; require recipes-bsp/u-boot/u-boot.inc <br>&gt; &gt; &nbsp; <br>&g=
t; &gt; This include file provide u-boot-default-env recipe <br>&gt; &gt; <=
a href=3D"https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-=
bsp/u-boot/u-boot.inc#L215" target=3D"_blank">https://github.com/openbmc/op=
enbmc/blob/master/poky/meta/recipes-bsp/u-boot/u-boot.inc#L215</a> <br>&gt;=
 &gt; &nbsp; <br>&gt; &gt; On Mon, 2022-01-03 at 15:34 +0530, Nikhil V wrot=
e: <br>&gt; &gt; &gt; Hi, <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp; I am =
trying to build image for openbmc on SAMA5D27-som1-ek1 <br>&gt; &gt; &gt; d=
evelopment board made by microchip(atmel). SAMA5D27 board has <br>&gt; &gt;=
 &gt; yocto <br>&gt; &gt; &gt; support. <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbs=
p;&nbsp; I have added meta-atmel layer to openbmc, while <br>&gt; &gt; &gt;=
 building/compiling <br>&gt; &gt; &gt; using " bitbake obmc-phosphor-image =
", I am facing following <br>&gt; &gt; &gt; error, <br>&gt; &gt; &gt; &nbsp=
;&nbsp;&nbsp;&nbsp; <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ERRO=
R: Nothing RPROVIDES 'u-boot-default-env'] <br>&gt; &gt; &gt; <br>&gt; &gt;=
 &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have tried by updating with followin=
g content but didnt <br>&gt; &gt; &gt; get any <br>&gt; &gt; &gt; result. <=
br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_PROVIDER_u-boot =3D "u-boot-at9=
1" <br>&gt; &gt; &gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_PROVIDER_virtual/bootloader =3D =
"u-boot- <br>&gt; &gt; &gt; at91" <br>&gt; &gt; &gt; <br>&gt; &gt; &gt; &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; Can you help me to find a solution. <br>&gt; &g=
t; &gt; <br>&gt; &gt; &gt; &nbsp; <br>&gt; &gt; &gt; Thanks &amp; Regards, =
<br>&gt; &gt; &gt; Nikhil Muley <br>&gt; &gt; &gt; <br>&gt; &gt; &gt; <br>&=
gt; &gt; &gt; <br>&gt; &gt; &nbsp; <br> <br>-- <br>Best regards, <br>Andrei=
 Kartashev <br> <br> <br></div></blockquote></div><div><br></div></div><br>=
</body></html>
------=_Part_18639_695883902.1641215724188--

