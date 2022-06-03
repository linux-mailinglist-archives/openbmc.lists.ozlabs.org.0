Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE853C4B8
	for <lists+openbmc@lfdr.de>; Fri,  3 Jun 2022 08:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDsjj6KzWz3bm3
	for <lists+openbmc@lfdr.de>; Fri,  3 Jun 2022 16:02:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=uAhxPAS0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4.zoho.com; envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=uAhxPAS0;
	dkim-atps=neutral
Received: from sender4.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDsjG0xCZz301N
	for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2022 16:02:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1654236124; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZUgqIdWszCmd7mbty2Frj1133oGHDxfvmxBnjP77UEGLZsXVL5DOFXeVGIyMrCjsfkDXFszLFC4SBoEQx1qHz2nn7KfFnh8D/1RHc9hrNJOG+1XDdR0VTkJwR/4+YET0gZqGh9MxviDlGZaLB40Afy3iN+cKcTQIqxystZq7zKY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654236124; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KVW3fR7R4Ne270YxlUBjMQ75pv0fPCJk+hosQQBVFQA=; 
	b=LNWoUKHhFhTkuxqbKVNtECdbVPaLES+5s8k/rfoL2irGxGl5R2m/L7iM7WHoQbT2F378ZRSo7+7vxJO3aVR+34caZ1jYut8N5NEAlQmR7IBqFAr9N3/ZbqpFXATx2SM7Hh9+SWs4qv3Oswhb5EVTwvZU02A6BJHOOkT7vrsXyiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohocorp.com;
	spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
	dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654236124;
	s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
	bh=KVW3fR7R4Ne270YxlUBjMQ75pv0fPCJk+hosQQBVFQA=;
	b=uAhxPAS0EgJ7akvs4QAcd/i92JMSUsdLFpvMc9g3jBcS4u8/vPwYdzcad6wMvQXv
	GqWuiuatc96D3EdlA36ePBCO1CoxuVL1eYb1nCQr1/PukQBGOgGA+fgWdsdUlGzYgNT
	RDqfY7SaDXVcWEpCCpecKZJUM9QzR2ONsTgKYtXI=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1654236123499297.1656373030577; Thu, 2 Jun 2022 23:02:03 -0700 (PDT)
Date: Fri, 03 Jun 2022 11:32:03 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "joel" <joel@jms.id.au>
Message-Id: <1812828112c.fe9476eb5163.6646456422598811027@zohocorp.com>
In-Reply-To: <181231928ab.1255e42e125354.8114584519815620257@zohocorp.com>
References: <1811e688e68.f6b260b112172.7670613845716605077@zohocorp.com> <CACPK8XdtT9J6iX-bvrOX_hjnaaG6OoGVx0SPUd0waJCFsrzKEA@mail.gmail.com> <181231928ab.1255e42e125354.8114584519815620257@zohocorp.com>
Subject: Re: [ Entity Manager - Beaglebone Adc }
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_16612_679760726.1654236123436"
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

------=_Part_16612_679760726.1654236123436
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

=C2=A0=C2=A0=C2=A0 I have displayed ADC and LM75 result through entity mana=
ger on beaglebone black.

=C2=A0=C2=A0=C2=A0 Now I want to control PWM fan on beaglebone black for th=
at i am referring=C2=A0

=C2=A0=C2=A0=C2=A0 https://elixir.bootlin.com/linux/latest/source/Documenta=
tion/devicetree/bindings/hwmon/pwm-fan.txt

=C2=A0=C2=A0=C2=A0 I have updated device tree with=20



=C2=A0=C2=A0=C2=A0 what are the steps required so that i can display FAN re=
sult through entity manager ?

=C2=A0=C2=A0 how do i check on command line that devicee has been successfu=
lly patched for PWM Fan control.





Thanks & Regards,

Nikhil=20

=C2=A0=C2=A0=20










---- On Thu, 02 Jun 2022 11:57:40 +0530 Nikhil V <nikhil.vu@zohocorp.com> w=
rote ----



Hi joel,

Do you have your patches on gerrit for review?=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20

I do not have patches on gerrit but i can attach required file here. Let me=
 what files are required to be attached.



Thanks & Regards,

Nikhil Muley










---- On Thu, 02 Jun 2022 11:29:23 +0530 Joel Stanley <mailto:joel@jms.id.au=
> wrote ----











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
------=_Part_16612_679760726.1654236123436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi,<br></div><div>&nbsp;&nbsp;&nbsp; I have displa=
yed ADC and LM75 result through entity manager on beaglebone black.<br></di=
v><div>&nbsp;&nbsp;&nbsp; Now I want to control PWM fan on beaglebone black=
 for that i am referring&nbsp;<br></div><div>&nbsp;&nbsp;&nbsp; <a target=
=3D"_blank" href=3D"https://elixir.bootlin.com/linux/latest/source/Document=
ation/devicetree/bindings/hwmon/pwm-fan.txt">https://elixir.bootlin.com/lin=
ux/latest/source/Documentation/devicetree/bindings/hwmon/pwm-fan.txt</a><br=
></div><div>&nbsp;&nbsp;&nbsp; I have updated device tree with <br></div><d=
iv><br></div><div>&nbsp;&nbsp;&nbsp; what are the steps required so that i =
can display FAN result through entity manager ?<br></div><div>&nbsp;&nbsp; =
how do i check on command line that devicee has been successfully patched f=
or PWM Fan control.<br></div><div><br></div><div><br></div><div>Thanks &amp=
; Regards,<br></div><div>Nikhil <br></div><div>&nbsp;&nbsp; <br></div><br><=
div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"true" data-sigid=3D"58018=
000000014003"><div><br></div></div><br><div class=3D"zmail_extra_hr" style=
=3D"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 10px=
; margin-bottom: 10px; line-height: 0px;"><br></div><div class=3D"zmail_ext=
ra" data-zbluepencil-ignore=3D"true"><div><br></div><div id=3D"Zm-_Id_-Sgn1=
">---- On Thu, 02 Jun 2022 11:57:40 +0530 <b>Nikhil V &lt;nikhil.vu@zohocor=
p.com&gt;</b> wrote ----<br></div><div><br></div><blockquote style=3D"margi=
n: 0px;"><div><div style=3D"font-family :  Verdana,  Arial,  Helvetica,  sa=
ns-serif; font-size :  10pt;"><div>Hi joel,<br></div><div>Do you have your =
patches on gerrit for review?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; <br></div><div>I do not have patches on gerrit but i can att=
ach required file here. Let me what files are required to be attached.<br><=
/div><div><br></div><div>Thanks &amp; Regards,<br></div><div>Nikhil Muley<b=
r></div><br><div id=3D"x_759725354Zm-_Id_-Sgn"><div><br></div></div><br><di=
v class=3D"x_759725354zmail_extra_hr" style=3D"border-top :  1px solid rgb(=
204, 204, 204); min-height:  0px; margin-top :  10px; margin-bottom :  10px=
; line-height :  0px;"><br></div><div class=3D"x_759725354zmail_extra"><div=
><br></div><div id=3D"x_759725354Zm-_Id_-Sgn1">---- On Thu, 02 Jun 2022 11:=
29:23 +0530 <b>Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt;</b> wrote ----<br></div><div><br></div><div=
 id=3D"zmail_block"><br></div></div><div><br></div></div><br></div><blockqu=
ote style=3D"margin :  0px;"><div>On Wed, 1 Jun 2022 at 08:51, Nikhil V &lt=
;<a href=3D"mailto:nikhil.vu@zohocorp.com" target=3D"_blank">nikhil.vu@zoho=
corp.com</a>&gt; wrote: <br>&gt; <br>&gt; Hi ALL, <br>&gt;           I have=
 successfully ported openbmc on beaglebone black. I have displayed LM75, an=
d ADC result on webui. <br> <br>Neat. Do you have your patches on gerrit fo=
r review? <br> <br>&gt;           Now I am doing the same with Entity Manag=
er. I have displayed LM75 result successfully, But unable to display ADC re=
sult through Entity Manager. <br>&gt;           Below is my Config file. <b=
r>&gt; { <br>&gt;     "Exposes": [ <br>&gt;     { <br>&gt;             "Ind=
ex": 0, <br>&gt;             "Name": "PSU 12 Volt", <br>&gt;             "S=
caleFactor": 0.1124, <br>&gt;             "Type": "ADC" <br>&gt;         },=
 <br>&gt;     { <br>&gt;             "Index": 1, <br>&gt;             "Name=
": "PSU 5 Volt", <br>&gt;             "ScaleFactor": 1, <br>&gt;           =
  "Type": "ADC" <br>&gt;         }, <br>&gt;         { <br>&gt;            =
 "Address": "0x48", <br>&gt;             "Bus": 2, <br>&gt;             "Na=
me": "Ambient 0 Temp", <br>&gt;             "Type": "TMP75" <br>&gt;       =
  } <br>&gt;     ], <br>&gt;     "Name": "xplode", <br>&gt;     "Probe": "T=
rue", <br>&gt;     "Type": "Board" <br>&gt; } <br>&gt; <br>&gt; 1) How to d=
isplay ADC value through entity manager <br>&gt; 2) I would like to control=
 single pwm pin <br>&gt; <br>&gt; Any pointer would be helpful or what are =
the steps to display adc value/PWM control <br>&gt; <br>&gt; Board used : B=
eaglebone Black <br>&gt; <br>&gt; Thanks &amp; Regards, <br>&gt; Nikhil Mul=
ey <br>&gt; <br></div></blockquote></blockquote></div><div><br></div></div>=
<br></body></html>
------=_Part_16612_679760726.1654236123436--

