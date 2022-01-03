Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD91A482FDA
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 11:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSBZM3QrPz3015
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 21:19:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=EsEbEuhJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zohocorp.com (client-ip=136.143.188.12;
 helo=sender4-op-o12.zoho.com; envelope-from=nikhil.vu@zohocorp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com
 header.a=rsa-sha256 header.s=admin header.b=EsEbEuhJ; 
 dkim-atps=neutral
X-Greylist: delayed 906 seconds by postgrey-1.36 at boromir;
 Mon, 03 Jan 2022 21:19:34 AEDT
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSBYy5KW6z2xDY
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 21:19:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1641204263; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MGhq0VmmhHTk7jv5qnMha7rNKqsm6QiaLHITppEabuECP55ftcsEdNtcZc5fF/3FKBTtvJcxaLWNRdTwLSTOyaguqJgt3ocJXiZQ9nUVTgBPgMH2YMYB++Lz/SoAHkuwtB+MW24S1bb7LGK5+LPLwrzdxOBhZJeWHUi9nlFyj00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; 
 t=1641204263; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=+nMPJk5K25N0AjFt1yk40x+lE7hn5LVa9nsdPEVwMco=; 
 b=FNnqTCYa82n3CETjFcU2DOrbuvFWwgDDf0yWi0LusdZmJqjHkVoFWHH5hVKlZVXjbbthS4LVuRSQ8Gg+MKOjSqSEwHWx6FRbcNIL1PY+ZY/lJiNl1R2EfcEZlTYhFtb7teRqeluqibxA25S/WHQgudPnvkcKN0+MvvcTQoOSqKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohocorp.com;
 spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
 dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641204263; 
 s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
 h=Date:From:To:Message-Id:In-Reply-To:Subject:MIME-Version:Content-Type;
 bh=+nMPJk5K25N0AjFt1yk40x+lE7hn5LVa9nsdPEVwMco=;
 b=EsEbEuhJsVm8pYO2unDrMNqje+hwLxSfUkdnjxTzMskc1815TJfRVn9wiJobMYdz
 NMshI3t7ce5GVdw/+Zwe1C31/nlEauKmAR0Qz1+rp6UA0hIF1RWsdlPQ2hVtkymUl4X
 BwafqYakK+r/VGAZYjo/euOqhm2Z18bR8Dk+7FiQ=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 164120426081871.14138913027955;
 Mon, 3 Jan 2022 02:04:20 -0800 (PST)
Date: Mon, 03 Jan 2022 15:34:20 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "openbmc" <openbmc@lists.ozlabs.org>
Message-Id: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
In-Reply-To: 
Subject: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_12668_362788887.1641204260764"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_12668_362788887.1641204260764
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

=C2=A0=C2=A0=C2=A0=C2=A0 I am trying to build image for openbmc on SAMA5D27=
-som1-ek1 development board made by microchip(atmel). SAMA5D27 board has yo=
cto support.

=C2=A0=C2=A0=C2=A0=C2=A0 I have added meta-atmel layer to openbmc, while bu=
ilding/compiling using " bitbake obmc-phosphor-image ", I am facing followi=
ng error,

=C2=A0=C2=A0=C2=A0=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ERROR: Nothing RPROVIDES 'u-boot-default-en=
v']



=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have tried by updating with following cont=
ent but didnt get any result.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PREFERRED_PROVIDER_u-boot =3D "u-boot-at91"


=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-at91"




=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Can you help me to find a solution.



=C2=A0=20

Thanks & Regards,

Nikhil Muley
------=_Part_12668_362788887.1641204260764
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp; I am tr=
ying to build image for openbmc on SAMA5D27-som1-ek1 development board made=
 by microchip(atmel). SAMA5D27 board has yocto support.<br></div><div>&nbsp=
;&nbsp;&nbsp;&nbsp; I have added meta-atmel layer to openbmc, while buildin=
g/compiling using <span class=3D"comment-copy">" bitbake obmc-phosphor-imag=
e ", I am facing following error,</span><br></div><div><span class=3D"comme=
nt-copy">&nbsp;&nbsp;&nbsp;&nbsp; </span><br></div><div><span class=3D"comm=
ent-copy">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> [ERROR: Nothing RPROVIDES 'u-bo=
ot-default-env']</b></span><br></div><div><br></div><div><span class=3D"com=
ment-copy">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have tried by updating with fol=
lowing content but didnt get any result.</span><br></div><div><p style=3D"m=
argin  :  0px;" class=3D""><span style=3D"font-family :  Calibri,  sans-ser=
if;" class=3D"x_1425412782font"><span style=3D"font-size :  11pt; margin : =
 0px;" class=3D"x_1425412782size"><span style=3D"font-family :  &quot;Verda=
na&quot;,  sans-serif;" class=3D"x_1425412782font"><span style=3D"font-size=
 :  10pt;" class=3D"x_1425412782size">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_PROVIDER_u-=
boot =3D "u-boot-at91"</span></span></span></span><br></p></div><div><p sty=
le=3D"margin  :  0px;" class=3D""><span style=3D"font-family :  Calibri,  s=
ans-serif;" class=3D"x_1425412782font"><span style=3D"font-size :  11pt; ma=
rgin :  0px;" class=3D"x_1425412782size"><span style=3D"font-family :  &quo=
t;Verdana&quot;,  sans-serif;" class=3D"x_1425412782font"><span style=3D"fo=
nt-size :  10pt;" class=3D"x_1425412782size">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREFERRED_PROVIDER_=
virtual/bootloader =3D "u-boot-at91"</span></span></span></span><br></p><di=
v><span style=3D"font-family :  Calibri,  sans-serif;" class=3D"x_142541278=
2font"><span style=3D"font-size :  11pt; margin :  0px;" class=3D"x_1425412=
782size"><span style=3D"font-family :  &quot;Verdana&quot;,  sans-serif;" c=
lass=3D"x_1425412782font"><span style=3D"font-size :  10pt;" class=3D"x_142=
5412782size"></span></span></span></span><br></div></div><div><span class=
=3D"comment-copy">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Can you help me to find a =
solution.</span><br></div><div><br></div><div><span class=3D"comment-copy">=
&nbsp; <br></span></div><div>Thanks &amp; Regards,<br></div><div>Nikhil Mul=
ey<br></div><div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"true" data-s=
igid=3D"58018000000014003"><div><br></div></div><div><br></div></div><br></=
body></html>
------=_Part_12668_362788887.1641204260764--

