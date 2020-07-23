Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB522ACFE
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 12:51:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC8Jx1MlxzDrPh
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 20:51:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p9BfG1A2; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC8G80kQdzDrMF
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 20:49:03 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id e8so2892594pgc.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 03:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OTrNsz4k51kxEvplR7WRa1fedN2ImnYEhI9ndn/3IAE=;
 b=p9BfG1A2+7hhFI/IcO9tlaTlYwiZdnVFPNkQuj37Yvn3B+y+AUIMNj4N2f+4G1p8VA
 JyJPT5JW8QByVZeF66xMW5HY60xtRUDKHv8X5Ou2uIqxg/AYcQaS2qJpqZNvKmfUcn7y
 T/1KQjOzAdciB8+JMgRx/VBS5J4cyq5fz4eNF0019Kx3uvMhDhLm7a+K/4dTYQLZV3cL
 ea7Nuv0Lvdb7CZVvKjBDjw8BAwPKBfFOwr2NqekdP3AwUnUuzdOWws95NQl+K3imZokC
 jnvMRHy4/2HRsDPSN3OG6s04P6sVroEd6bRROtFSTGdv0jdqOQfcNT0/IGBvlyJCRZaY
 4edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OTrNsz4k51kxEvplR7WRa1fedN2ImnYEhI9ndn/3IAE=;
 b=uih25lFBJDCzz/IEQMh2rT0CSR737RFZARotFLF+/wPg4IRIx8Mr+pg30cuPtYf8nI
 vqo3veCUDm15hCLGPLEfHiTQGx6eK0nKbLiriGGEYLEFpv7GAxG2KOGyIGny0Bfl5QDh
 o16lHa+a+QgHEOLN8SrjlDW1gSFCI/yChgEm/uDE/y3+MLLEJOWfzmC1Qz7ndKRQZLsr
 F9oQ4+sg/T3N4GJSmldWjCMJx/pf05IXICL9Polzi06ED9iKBluErcLcUq62j1ImRuAj
 Qo/n0LWXyXaYAqWv6p4z8KPJWW8BXwcg82VYoiHJfOi9j75fMdvAsy8IvjzNQo5vOW97
 1XPw==
X-Gm-Message-State: AOAM530CgDgturF1BC4HK6l0EhwSo/EhrVQ2knAH9rGML9d4r2OVActF
 7l+ll7yt5lebU9AkzWbq/OvgLFlyKSZrKU953Xs9iS7H
X-Google-Smtp-Source: ABdhPJziF9eFXAFl+vmMaBactkvgNLmbI/SRLYIESy0K+LA8Crd77dYNSojBiAQGPoymRrSSgZWGFvO2VRN9OmUoPh8=
X-Received: by 2002:a63:7802:: with SMTP id t2mr3671785pgc.421.1595501339806; 
 Thu, 23 Jul 2020 03:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+gp9A-mBeKrFTZdVuQ6uz3snDAv2zF-db_=edR=4pOtFcUuQ@mail.gmail.com>
In-Reply-To: <CAD+gp9A-mBeKrFTZdVuQ6uz3snDAv2zF-db_=edR=4pOtFcUuQ@mail.gmail.com>
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Thu, 23 Jul 2020 16:18:49 +0530
Message-ID: <CAD+gp9CSsZyhrzG+B+EqB+koBvUSpwB4s56RqrtRD3UHmQfu3w@mail.gmail.com>
Subject: Query regarding using the Redfish in OpenBMC
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>
Content-Type: multipart/alternative; boundary="000000000000990f9d05ab199ad4"
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

--000000000000990f9d05ab199ad4
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am newbiee to  Openbmc.  I want to view  the redfish/v1 (
https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser .Could you
please guide me on what changes i need to so that i view the /redfish/v1/
content in the browser .

here are the steps i have followed:

   1. Clone OpenBMC project : git clone
   https://github.com/openbmc/openbmc.git in the server machine .
   2. Compile using the following command: TEMPLATECONF=meta-phosphor/conf
   . openbmc-env
   3. modify the following files:


   -  #build vi conf/local.conf   (modify the  line "-MACHINE??=qemuarm" "
   to    "-MACHINE??=raspberrypi3-64" "
   - #build vi conf/bblayer.conf (add the following line
"/home/khader<username>/openbmc/meta-raspberrypi
   \"  to the line  above /home/khader<username>/openbmc/metaphosphor \"

       4. #build  bitbake obmc-phosphor-image

The above steps I have used to build an Openbmc project.


Can you help me what further steps should i need to do so that i can view
the /redfish/v1/  content in the webbrowser.

Note:- I am compiling the openbmc code in the server machine.

Any help /guidelines on this will really help me alot.
Appreciate all your help.

Thanks & Regards,
khader B Shaik

--000000000000990f9d05ab199ad4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Team,<br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr"><di=
v><br></div><div>I am newbiee to=C2=A0 Openbmc.=C2=A0 I want to view=C2=A0 =
the redfish/v1 (<a href=3D"https://10.xxx.xxx.xxx:8000/redfish/v1" target=
=3D"_blank">https://10.xxx.xxx.xxx:8000/redfish/v1</a>) contents in the bro=
wser .Could you please guide me on what changes i need to so that=C2=A0i=C2=
=A0view the /redfish/v1/ content in the browser .</div><div><br></div><div>=
here are the steps i have followed:</div><div><ol><li style=3D"margin-left:=
15px">Clone OpenBMC project : git clone=C2=A0<a href=3D"https://github.com/=
openbmc/openbmc.git" target=3D"_blank">https://github.com/openbmc/openbmc.g=
it</a>=C2=A0in the server machine .</li><li style=3D"margin-left:15px">Comp=
ile using the following command: TEMPLATECONF=3Dmeta-phosphor/conf=C2=A0 . =
openbmc-env</li><li style=3D"margin-left:15px">modify the following files:<=
/li></ol><ul><li style=3D"margin-left:15px">=C2=A0#build vi conf/local.conf=
=C2=A0 =C2=A0(modify the=C2=A0 line &quot;-MACHINE??=3Dqemuarm&quot; &quot;=
 to=C2=A0 =C2=A0 &quot;-MACHINE??=3Draspberrypi3-64&quot; &quot;</li><li st=
yle=3D"margin-left:15px">#build vi conf/bblayer.conf=C2=A0(add the followin=
g line &quot;<span style=3D"background-color:rgb(255,255,0)">/home/khader&l=
t;username&gt;/openbmc/meta-raspberrypi \</span>&quot;=C2=A0 to the line=C2=
=A0 above /home/khader&lt;username&gt;/openbmc/metaphosphor \&quot;</li></u=
l><div>=C2=A0 =C2=A0 =C2=A0 =C2=A04. #build=C2=A0 bitbake obmc-phosphor-ima=
ge</div><div><br></div><div>The above steps I have used to build an Openbmc=
 project.</div><div><br></div></div><div><br></div><div>Can you help me wha=
t further steps should i need to do so that i can view the /redfish/v1/=C2=
=A0 content in the webbrowser.</div><div><br></div><div>Note:- I am compili=
ng the openbmc code in the server machine.</div><div><br></div><div>Any hel=
p /guidelines on this will really help me alot.</div><div>Appreciate all yo=
ur help.</div><div><br></div><div>Thanks &amp; Regards,</div><div>khader B =
Shaik</div><div>=C2=A0</div></div>
</div></div>

--000000000000990f9d05ab199ad4--
