Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41054851A4
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 12:11:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTRcp4z0pz2yMp
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 22:11:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=mmGFzaa1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4.zoho.com;
 envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com
 header.a=rsa-sha256 header.s=admin header.b=mmGFzaa1; 
 dkim-atps=neutral
Received: from sender4.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTRcM1TStz2xF1
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 22:10:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1641381053; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZymfcvdSfoY8nDoSdUlsf8g8zIXdGHcjRZh/R0MoNq4RVuxMiUCSCrAG1LQisGu4BHVqVxYfuwnuNT+7YzrrbxnQyqCHY2KDi8HLGxPymee9NSMaifscU8Ndai7nQgKcnEIlgh3eBmHXPfj9pSU5uqGFDhCEkzRnIHOZGM69tXo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1641381053;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=JLL0tbRMVArpXlhy8YHkZoWg5s/fChbmYh61+eqwCHU=; 
 b=mbDWXSjFXLi/8kZPb0KE2G4AfEeaE7xJgE17DKpEy8xFJXUSdtG202jgdiy9EDXxsGV8lzRJeSAK6sqv2wddvM4JRMJsRWY+4vJOFui4U+Fbt+HLY4f/Jf+xb1vriueQiYEmZuiGMZwpUOyMz1ZmhKw6HOi65R/x8fMVnxQVi/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohocorp.com;
 spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
 dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641381053; 
 s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
 h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Subject:MIME-Version:Content-Type;
 bh=JLL0tbRMVArpXlhy8YHkZoWg5s/fChbmYh61+eqwCHU=;
 b=mmGFzaa1Ta8nnjlK+7jtdtes4XL9G1LBNuYvTbORFxFuQc/qUFH2vlKCwSMAoTyj
 Ts32udiJtxE6Z6yQoWMNxiwaeSFLvVw+AiXR2HcCZQOtt3ie7QbnCg1KMfBNG7zWqKm
 CJ5E6s4hSRu5vjUomqdDVDZgFxRZRx57x9dQeNJo=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1641381052143421.02518625373307;
 Wed, 5 Jan 2022 03:10:52 -0800 (PST)
Date: Wed, 05 Jan 2022 16:40:52 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "akartashev" <a.kartashev@yadro.com>
Message-Id: <17e29ef3ecb.f538ffea22697.1377643688691911450@zohocorp.com>
In-Reply-To: <17e20148a9c.10fd4f6105879.8717643372259739590@zohocorp.com>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
 <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
 <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
 <bd8a1dec629cc9dd69c44578122a178d7af6eb7e.camel@yadro.com>
 <17e20148a9c.10fd4f6105879.8717643372259739590@zohocorp.com>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_69321_2049536491.1641381052108"
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

------=_Part_69321_2049536491.1641381052108
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

=C2=A0=C2=A0=C2=A0 What are your expectations and final goal?

=C2=A0=C2=A0=C2=A0 Trying to implement openbmc on SAMA5D27 development boar=
d and to use secure boot feature provided by microchip. To make openbmc mor=
e secure.



=C2=A0=C2=A0=C2=A0 Looking at boot sequence of SAMA5D27=20

=C2=A0=C2=A0=C2=A0 (https://microchipdeveloper.com/32mpu:boot-sama5d2-serie=
s and http://ww1.microchip.com/downloads/en/AppNotes/DS00002748A.pdf)

=C2=A0=C2=A0=C2=A0 =E2=80=A2 ROM code (first stage loader)

=C2=A0=C2=A0=C2=A0 =E2=80=A2 AT91bootstrap bootloader (second stage loader)

=C2=A0=C2=A0=C2=A0 =E2=80=A2 U-Boot bootloader (third stage loader)



=C2=A0=C2=A0=C2=A0 In Normal Situation for eg. if we implement openbmc in b=
eaglebone black bootprocess seen by openbmc

=C2=A0=C2=A0=C2=A0 =E2=80=A2 ROM code (first stage loader)

=C2=A0=C2=A0=C2=A0 =E2=80=A2 U-Boot bootloader (second stage loader)





Is additional layer of AT91bootstrap causing problem to openbmc to give "ER=
ROR" during bitbake?



Thanks & Regards,

Nikhil Muley








---- On Mon, 03 Jan 2022 18:45:24 +0530 Nikhil V <nikhil.vu@zohocorp.com> w=
rote ----



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








---- On Mon, 03 Jan 2022 18:00:56 +0530 Andrei Kartashev <mailto:a.kartashe=
v@yadro.com> wrote ----



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
------=_Part_69321_2049536491.1641381052108
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>hi,<br></div><div>&nbsp;&nbsp;&nbsp; <b>What are y=
our expectations and final goal?</b><br></div><div>&nbsp;&nbsp;&nbsp; Tryin=
g to implement openbmc on SAMA5D27 development board and to use secure boot=
 feature provided by microchip. To make openbmc more secure.<br></div><div>=
<br></div><div>&nbsp;&nbsp;&nbsp; Looking at boot sequence of SAMA5D27 <br>=
</div><div>&nbsp;&nbsp;&nbsp; (<a target=3D"_blank" href=3D"https://microch=
ipdeveloper.com/32mpu:boot-sama5d2-series">https://microchipdeveloper.com/3=
2mpu:boot-sama5d2-series</a> and <a target=3D"_blank" href=3D"http://ww1.mi=
crochip.com/downloads/en/AppNotes/DS00002748A.pdf">http://ww1.microchip.com=
/downloads/en/AppNotes/DS00002748A.pdf</a>)<br></div><div>&nbsp;&nbsp;&nbsp=
; =E2=80=A2 ROM code (first stage loader)<br></div><div>&nbsp;&nbsp;&nbsp; =
=E2=80=A2 AT91bootstrap bootloader (second stage loader)<br></div><div>&nbs=
p;&nbsp;&nbsp; =E2=80=A2 U-Boot bootloader (third stage loader)<br></div><d=
iv><br></div><div>&nbsp;&nbsp;&nbsp; In Normal Situation for eg. if we impl=
ement openbmc in beaglebone black bootprocess seen by openbmc<br></div><div=
>&nbsp;&nbsp;&nbsp; =E2=80=A2 ROM code (first stage loader)<br></div><div>&=
nbsp;&nbsp;&nbsp; =E2=80=A2 U-Boot bootloader (second stage loader)<br></di=
v><div><br></div><div><br></div><div>Is additional layer of AT91bootstrap c=
ausing problem to openbmc to give "ERROR" during bitbake?<br></div><div><br=
></div><div>Thanks &amp; Regards,<br></div><div>Nikhil Muley<br></div><div =
id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"true" data-sigid=3D"580180000=
00014003"><div><br></div></div><div class=3D"zmail_extra_hr" style=3D"borde=
r-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10px; margin-=
bottom: 10px; line-height: 0px;"><br></div><div class=3D"zmail_extra" data-=
zbluepencil-ignore=3D"true"><div><br></div><div id=3D"Zm-_Id_-Sgn1">---- On=
 Mon, 03 Jan 2022 18:45:24 +0530 <b>Nikhil V &lt;nikhil.vu@zohocorp.com&gt;=
</b> wrote ----<br></div><div><br></div><blockquote style=3D"margin: 0px;">=
<div><div style=3D"font-family :  Verdana,  Arial,  Helvetica,  sans-serif;=
 font-size :  10pt;"><div>Hello Andrei Kartashev,<br></div><div>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your patience and support.<br></=
div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As suggested by you to =
try with normal yocto build and then go for OpenBMC.<br></div><div>&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a success with yocto image for SA=
MA5D27 development board and tested and verified using steps described in f=
ollowing link<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&nbsp;<a =
target=3D"_blank" href=3D"https://www.linux4sam.org/bin/view/Linux4SAM/Sama=
5d27Som1EKMainPage">https://www.linux4sam.org/bin/view/Linux4SAM/Sama5d27So=
m1EKMainPage</a> )<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 But i got error when i do same for openbmc, <br></div><div>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As i am new to openbmc and =
may be i am wrong with my interpretation<br></div><div>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; I have the following Interpretation towards problem.=
<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; If you look into meta/recipe-bsp/u-boot/li=
bubootenv_0.3.1.bb<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; It describe that it=
 "It provides hardware-independent replacement for fw_printenv/setenv utili=
ties provided by U-Boot"<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; =
If you look into meta-atmel/recipe-bsp <br></div><div>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; There is nothing indicating&nbsp;fw_printenv/setenv a=
t u-boot-at91_2020.01.bb recipe.<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Correct me if I am wrong.<br></div><div><br></div><div>Thanks &amp; Regard=
s,<br></div><div>Nikhil Muley<br></div><div id=3D"x_-1269887710Zm-_Id_-Sgn"=
><div><br></div></div><div class=3D"x_-1269887710zmail_extra_hr" style=3D"b=
order-top :  1px solid rgb(204, 204, 204); min-height:  0px; margin-top :  =
10px; margin-bottom :  10px; line-height :  0px;"><br></div><div class=3D"x=
_-1269887710zmail_extra"><div><br></div><div id=3D"x_-1269887710Zm-_Id_-Sgn=
1">---- On Mon, 03 Jan 2022 18:00:56 +0530 <b>Andrei Kartashev &lt;<a href=
=3D"mailto:a.kartashev@yadro.com" target=3D"_blank">a.kartashev@yadro.com</=
a>&gt;</b> wrote ----<br></div><div><br></div><blockquote style=3D"margin :=
  0px;"><div>Well, as I say, they don't use u-boot.inc an they don't implem=
ent u- <br>boot-default-env. I can't give you an universal hint on how to s=
olve <br>this, but I advice you to build upstream Yocto for your platform f=
irst <br>(I mean, generic yocto, instead of OpenBMC). Once you succeeded wi=
th <br>upstream Yocto, integrating into OpenBMC would be less painful. <br>=
 <br>What you trying to do is not a typical usecase for OpenBMC, generally =
<br>we don't do like this. What are your expectations and final goal? <br> =
<br>On Mon, 2022-01-03 at 17:06 +0530, Nikhil V wrote: <br>&gt; Hello karta=
shev, <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Th=
anks for your quick response, I will provide <br>&gt; some background on wh=
at i am trying to achieve. <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; I am using openbmc, downloaded from following <br>&gt; l=
ocation, steps are as follow, <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1)&nbsp; git clone <br>&gt; <a href=3D"https://github.c=
om/openbmc/openbmc.git" target=3D"_blank">https://github.com/openbmc/openbm=
c.git</a> -b dunfell <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 2)&nbsp; git clone <br>&gt; git://github.com/linux4sam/m=
eta-atmel.git -b dunfell <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 3)&nbsp; . openbmc-env build-sama5d27 <br>&gt; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4)&nbsp; then ad=
d following layers <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitbake-layers add-layer ../meta-atmel <br=
>&gt; ../meta-security ../meta-openembedded/meta-perl ../meta- <br>&gt; ope=
nembedded/meta-initramfs <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 5)&nbsp;&nbsp; Edit in local.conf <br>&gt; &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp; MACHINE=3D"sama5d27-som1-ek-sd" <br>&gt; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6)&nbsp;&nbsp; bitbake obmc-phosph=
or-image <br>&gt; <br>&gt; "Since there is no such platform as "at91" in Op=
enBMC, we don't know <br>&gt; what recipe do you use for u-boot." <br>&gt; =
Here I am using meta-atmel layer provided by microchip. It has its <br>&gt;=
 own u-boot under meta-atmel/recipe-bsp. <br>&gt; you will find it once you=
 downloaded it from step 2. <br>&gt; <br>&gt; when i do bitbake obmc-phosph=
or-image i am getting error. ERROR: <br>&gt; Nothing RPROVIDES 'u-boot-defa=
ult-env' <br>&gt; <br>&gt; hope i have described my problem correctly. <br>=
&gt; <br>&gt; For any query feel free to contact. <br>&gt; <br>&gt; Thanks =
&amp; Regards, <br>&gt; Nikhil Muley <br>&gt; <br>&gt; <br>&gt; ---- On Mon=
, 03 Jan 2022 16:40:09 +0530 Andrei Kartashev <br>&gt; &lt;<a href=3D"mailt=
o:a.kartashev@yadro.com" target=3D"_blank">a.kartashev@yadro.com</a>&gt; wr=
ote ---- <br>&gt; <br>&gt; &gt; Hello, <br>&gt; &gt; &nbsp; <br>&gt; &gt; I=
t's hard to say what's wrong without knowing of what are you <br>&gt; &gt; =
exactly <br>&gt; &gt; doing. Since there is no such platform as "at91" in O=
penBMC, we <br>&gt; &gt; don't <br>&gt; &gt; know what recipe do you use fo=
r u-boot. <br>&gt; &gt; Generally, u-boot recipe should include u-boot.inc:=
 <br>&gt; &gt; &nbsp; <br>&gt; &gt; &gt; require recipes-bsp/u-boot/u-boot.=
inc <br>&gt; &gt; &nbsp; <br>&gt; &gt; This include file provide u-boot-def=
ault-env recipe <br>&gt; &gt; <a href=3D"https://github.com/openbmc/openbmc=
/blob/master/poky/meta/recipes-bsp/u-boot/u-boot.inc#L215" target=3D"_blank=
">https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-bo=
ot/u-boot.inc#L215</a> <br>&gt; &gt; &nbsp; <br>&gt; &gt; On Mon, 2022-01-0=
3 at 15:34 +0530, Nikhil V wrote: <br>&gt; &gt; &gt; Hi, <br>&gt; &gt; &gt;=
 &nbsp;&nbsp;&nbsp;&nbsp; I am trying to build image for openbmc on SAMA5D2=
7-som1-ek1 <br>&gt; &gt; &gt; development board made by microchip(atmel). S=
AMA5D27 board has <br>&gt; &gt; &gt; yocto <br>&gt; &gt; &gt; support. <br>=
&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp; I have added meta-atmel layer to op=
enbmc, while <br>&gt; &gt; &gt; building/compiling <br>&gt; &gt; &gt; using=
 " bitbake obmc-phosphor-image ", I am facing following <br>&gt; &gt; &gt; =
error, <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp; <br>&gt; &gt; &gt; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; [ERROR: Nothing RPROVIDES 'u-boot-default-env'] <=
br>&gt; &gt; &gt; <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have =
tried by updating with following content but didnt <br>&gt; &gt; &gt; get a=
ny <br>&gt; &gt; &gt; result. <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_=
PROVIDER_u-boot =3D "u-boot-at91" <br>&gt; &gt; &gt; &nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_P=
ROVIDER_virtual/bootloader =3D "u-boot- <br>&gt; &gt; &gt; at91" <br>&gt; &=
gt; &gt; <br>&gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Can you help me =
to find a solution. <br>&gt; &gt; &gt; <br>&gt; &gt; &gt; &nbsp; <br>&gt; &=
gt; &gt; Thanks &amp; Regards, <br>&gt; &gt; &gt; Nikhil Muley <br>&gt; &gt=
; &gt; <br>&gt; &gt; &gt; <br>&gt; &gt; &gt; <br>&gt; &gt; &nbsp; <br> <br>=
-- <br>Best regards, <br>Andrei Kartashev <br> <br> <br></div></blockquote>=
</div><div><br></div></div><div><br></div></div></blockquote></div><div><br=
></div></div><br></body></html>
------=_Part_69321_2049536491.1641381052108--

