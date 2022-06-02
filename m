Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418153B38D
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 08:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDGKk2Lvdz3bkZ
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 16:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=TXrV9Vsk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4-zc7.zoho.com; envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=TXrV9Vsk;
	dkim-atps=neutral
Received: from sender4-zc7.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDGKJ0XMRz2xnP
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 16:27:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1654151262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HvMKRfeYsh6b9+ZjT4+Px+GhfZXXf8g10n2qzTsUasQHuPGd+aDrF3uMdkXl31uA4kuL+XY3jnCl47WQMuC0rpbMhYdCp/Y1iVqywm2NOImoEYwbcsErxwab4GMtSUZdZ/ze46vRutWXItmIO4gAz/xHBD9zxZxhtZJPpZCyEUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654151262; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JSlbTtx2gq0Pah34szhAxGrMyddKO3dIZHEfdK1Jedk=; 
	b=PxIm4Uem8iBMKyqdeHuoMUzLSkpDYphldegkSz40QX6cHVIRQFfFDZzHjItD37OtsWSS9aD0DvO0cqVYIINjmCZ0oaYJFzCjbgrlw1MAMOEqkitm3vlGhWUJqEQMvmxH5Omlr6+doryK956b0tnWdU421dDjqgyP1AomTWkGY5c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohocorp.com;
	spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
	dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654151262;
	s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
	bh=JSlbTtx2gq0Pah34szhAxGrMyddKO3dIZHEfdK1Jedk=;
	b=TXrV9Vsk/cdWQzmZX6mQWTtiBETEDoj3GmJYkVvJE8f6f3upYlF4HI63/sf8MJQh
	rMOABNVtiDchh6/Ni+vu8NOHEoDjdhWRgVQO962gBn5W2jJC84btBKKGajGJlfvrljV
	RxsEEUwwZkDcDFMdW8l8CW6djiGBQizzpAuz6Tug=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1654151260368405.78910246019075; Wed, 1 Jun 2022 23:27:40 -0700 (PDT)
Date: Thu, 02 Jun 2022 11:57:40 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "joel" <joel@jms.id.au>
Message-Id: <181231928ab.1255e42e125354.8114584519815620257@zohocorp.com>
In-Reply-To: <CACPK8XdtT9J6iX-bvrOX_hjnaaG6OoGVx0SPUd0waJCFsrzKEA@mail.gmail.com>
References: <1811e688e68.f6b260b112172.7670613845716605077@zohocorp.com> <CACPK8XdtT9J6iX-bvrOX_hjnaaG6OoGVx0SPUd0waJCFsrzKEA@mail.gmail.com>
Subject: Re: [ Entity Manager - Beaglebone Adc }
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_83134_2109507698.1654151260331"
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

------=_Part_83134_2109507698.1654151260331
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi joel,

Do you have your patches on gerrit for review?=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20

I do not have patches on gerrit but i can attach required file here. Let me=
 what files are required to be attached.



Thanks & Regards,

Nikhil Muley










---- On Thu, 02 Jun 2022 11:29:23 +0530 Joel Stanley <joel@jms.id.au> wrote=
 ----



On Wed, 1 Jun 2022 at 08:51, Nikhil V <mailto:nikhil.vu@zohocorp.com> wrote=
:=20
>=20
> Hi ALL,=20
>           I have successfully ported openbmc on beaglebone black. I have =
displayed LM75, and ADC result on webui.=20
=20
Neat. Do you have your patches on gerrit for review?=20
=20
>           Now I am doing the same with Entity Manager. I have displayed L=
M75 result successfully, But unable to display ADC result through Entity Ma=
nager.=20
>           Below is my Config file.=20
> {=20
>     "Exposes": [=20
>     {=20
>             "Index": 0,=20
>             "Name": "PSU 12 Volt",=20
>             "ScaleFactor": 0.1124,=20
>             "Type": "ADC"=20
>         },=20
>     {=20
>             "Index": 1,=20
>             "Name": "PSU 5 Volt",=20
>             "ScaleFactor": 1,=20
>             "Type": "ADC"=20
>         },=20
>         {=20
>             "Address": "0x48",=20
>             "Bus": 2,=20
>             "Name": "Ambient 0 Temp",=20
>             "Type": "TMP75"=20
>         }=20
>     ],=20
>     "Name": "xplode",=20
>     "Probe": "True",=20
>     "Type": "Board"=20
> }=20
>=20
> 1) How to display ADC value through entity manager=20
> 2) I would like to control single pwm pin=20
>=20
> Any pointer would be helpful or what are the steps to display adc value/P=
WM control=20
>=20
> Board used : Beaglebone Black=20
>=20
> Thanks & Regards,=20
> Nikhil Muley=20
>
------=_Part_83134_2109507698.1654151260331
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi joel,<br></div><div>Do you have your patches on=
 gerrit for review?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; <br></div><div>I do not have patches on gerrit but i can attach requir=
ed file here. Let me what files are required to be attached.<br></div><div>=
<br></div><div>Thanks &amp; Regards,<br></div><div>Nikhil Muley<br></div><b=
r><div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"true" data-sigid=3D"58=
018000000014003"><div><br></div></div><br><div class=3D"zmail_extra_hr" sty=
le=3D"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10=
px; margin-bottom: 10px; line-height: 0px;"><br></div><div class=3D"zmail_e=
xtra" data-zbluepencil-ignore=3D"true"><div><br></div><div id=3D"Zm-_Id_-Sg=
n1">---- On Thu, 02 Jun 2022 11:29:23 +0530 <b>Joel Stanley &lt;joel@jms.id=
.au&gt;</b> wrote ----<br></div><div><br></div><blockquote style=3D"margin:=
 0px;"><div>On Wed, 1 Jun 2022 at 08:51, Nikhil V &lt;<a href=3D"mailto:nik=
hil.vu@zohocorp.com" target=3D"_blank">nikhil.vu@zohocorp.com</a>&gt; wrote=
: <br>&gt; <br>&gt; Hi ALL, <br>&gt;           I have successfully ported o=
penbmc on beaglebone black. I have displayed LM75, and ADC result on webui.=
 <br> <br>Neat. Do you have your patches on gerrit for review? <br> <br>&gt=
;           Now I am doing the same with Entity Manager. I have displayed L=
M75 result successfully, But unable to display ADC result through Entity Ma=
nager. <br>&gt;           Below is my Config file. <br>&gt; { <br>&gt;     =
"Exposes": [ <br>&gt;     { <br>&gt;             "Index": 0, <br>&gt;      =
       "Name": "PSU 12 Volt", <br>&gt;             "ScaleFactor": 0.1124, <=
br>&gt;             "Type": "ADC" <br>&gt;         }, <br>&gt;     { <br>&g=
t;             "Index": 1, <br>&gt;             "Name": "PSU 5 Volt", <br>&=
gt;             "ScaleFactor": 1, <br>&gt;             "Type": "ADC" <br>&g=
t;         }, <br>&gt;         { <br>&gt;             "Address": "0x48", <b=
r>&gt;             "Bus": 2, <br>&gt;             "Name": "Ambient 0 Temp",=
 <br>&gt;             "Type": "TMP75" <br>&gt;         } <br>&gt;     ], <b=
r>&gt;     "Name": "xplode", <br>&gt;     "Probe": "True", <br>&gt;     "Ty=
pe": "Board" <br>&gt; } <br>&gt; <br>&gt; 1) How to display ADC value throu=
gh entity manager <br>&gt; 2) I would like to control single pwm pin <br>&g=
t; <br>&gt; Any pointer would be helpful or what are the steps to display a=
dc value/PWM control <br>&gt; <br>&gt; Board used : Beaglebone Black <br>&g=
t; <br>&gt; Thanks &amp; Regards, <br>&gt; Nikhil Muley <br>&gt; <br></div>=
</blockquote></div><div><br></div></div><br></body></html>
------=_Part_83134_2109507698.1654151260331--

