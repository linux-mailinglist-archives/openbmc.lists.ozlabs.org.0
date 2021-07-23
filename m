Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F07423D3627
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 10:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWMS06XTPz30HY
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 18:09:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=d3XSI0+9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=sushilkdubey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d3XSI0+9; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWMRl5SwHz2yMw
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 18:09:39 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id r17so760018lfe.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vsvT8HEwoAcRR8cPlB0tQGgBv0RZN4tUWhEUZuy5Nzk=;
 b=d3XSI0+9Ao6k1tdlLO0NmQV5ZVQhSwZl+gEB9bvBjd9fzOh5BuSdgulb/qyoix/ULE
 wOks62QJjXb/FIO9rZ1ftzxFd5yNzvxx99GbNjBy2KBNpEcvtYuaD3W3/c1m3h4YACIf
 +Y5B0WzMfTH+6pElzGILsBzbh47vDN9URRz+DUDW0saYj7+gXU5oML+pFv07E8b3jqu8
 PG33obNi0PsaVl7JB/CepS2I/BfQkqlorkW966hEAgf1AIzjBs5Uq+MqjHvXzlPPEXQE
 182pzAZ8AjfXL0b54n+bLPtNU7F5chxuuwQNKVehGPTTK91eIP9fzZn7aFXkjhEteB3X
 sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vsvT8HEwoAcRR8cPlB0tQGgBv0RZN4tUWhEUZuy5Nzk=;
 b=Qhn25XCVZbUD2iV6iZdavx2W92A51kzyqWBjIANCp7gn5XYtri/WbVm+4fhF27fY8F
 rRqf2+VuoFDOgLkGuS2EXdJ2A918ZdqZSoWvWTV0QZECtDiV51Ge7A2IGfeIWKq6vTPJ
 jiOQPjqdsqbEWNQgpUr06DO3sZmCNgSoifvHEXyk13ph+EZ52J/Srk5z4HZmwkUwvwHE
 TeUqd6pHOSz4/QNLz/lLIUFf6bRnD9iAwo/+FnNB+4wgSitetf6dRiDkMhtd66Q+cpAU
 07ctHY+1+NQCQAzm7JWzRygimjxRVYqJ2RhxeGS8+kPPeKEYh4KrBty6MghluU0vu+Be
 fWEQ==
X-Gm-Message-State: AOAM530cdU6afvofNR6E2jG0AiMBCHSXzIKKA1v/r2h8yF0nTIjzkyXZ
 BCVLXDwzn1f5K/bPlaCRKy1iu3SxOXnAoNUBIZtLwe7D/KDLTg==
X-Google-Smtp-Source: ABdhPJxNTECD4e61wCYfvhMFoJi5xCKt1Lxz5Kf1ZuA1TWRaVrQha7fQs02iNmJkDQcpNaZ1iMN71zdLT2xedAwQXts=
X-Received: by 2002:ac2:549c:: with SMTP id t28mr2201787lfk.61.1627027772981; 
 Fri, 23 Jul 2021 01:09:32 -0700 (PDT)
MIME-Version: 1.0
From: Sushil Dubey <sushilkdubey@gmail.com>
Date: Fri, 23 Jul 2021 13:39:22 +0530
Message-ID: <CAMyVXe=jZxh+r-=t-KW-w0eEznVb02Wfg5NS60O+CDQQ-0w4jw@mail.gmail.com>
Subject: OpenBMC Uboot: Missing Driver for Ethernet Switch KSZ9893R
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Content-Type: multipart/alternative; boundary="00000000000072c41a05c7c5ec76"
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

--00000000000072c41a05c7c5ec76
Content-Type: text/plain; charset="UTF-8"

Hello All,



I am working on an AST2600 based OpenBMC project where we are
using Ethernet Switch KSZ9893R.



Microchip KSZ9893R is a 3-Port Gigabit Ethernet Switches with
RGMII/MII/RMII Interface.



I investigated OpenBMC/Uboot for KSZ9893R support but could not find it GitHub
- openbmc/u-boot: OpenBMC "Das U-Boot" Source Tree
<https://github.com/openbmc/u-boot>.



After further investigation, I found this driver is already upstream at
mainline Uboot :
https://github.com/u-boot/u-boot/blob/master/drivers/net/ksz9477.c



Can anyone please take a look and get this driver in the OpenBMC tree?



Thank you in advance for your help.



Regards,

Sushil Dubey

--00000000000072c41a05c7c5ec76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in;line-height:nor=
mal;font-size:11pt"><font face=3D"arial, sans-serif">Hello All,=C2=A0</font=
></p><p class=3D"MsoNormal" style=3D"margin:0in;line-height:normal;font-siz=
e:11pt"><font face=3D"arial, sans-serif">=C2=A0</font></p><p class=3D"MsoNo=
rmal" style=3D"margin:0in;line-height:normal;font-size:11pt"><font face=3D"=
arial, sans-serif">I am working on an
AST2600 based OpenBMC project where we are using=C2=A0Ethernet Switch KSZ98=
93R.</font></p><p class=3D"MsoNormal" style=3D"margin:0in;line-height:norma=
l;font-size:11pt"><font face=3D"arial, sans-serif">=C2=A0</font></p><p clas=
s=3D"MsoNormal" style=3D"margin:0in;line-height:normal;font-size:11pt"><spa=
n style=3D"color:black"><font face=3D"arial, sans-serif">Microchip KSZ9893R=
 is a 3-Port
Gigabit Ethernet Switches with RGMII/MII/RMII Interface.</font></span></p><=
p class=3D"MsoNormal" style=3D"margin:0in;line-height:normal;font-size:11pt=
"><font face=3D"arial, sans-serif">=C2=A0</font></p><p class=3D"MsoNormal" =
style=3D"margin:0in;line-height:normal;font-size:11pt"><font face=3D"arial,=
 sans-serif">I investigated OpenBMC/Uboot for
KSZ9893R support but could not find it=C2=A0<a href=3D"https://github.com/o=
penbmc/u-boot"><span style=3D"color:rgb(5,99,193)">GitHub -
openbmc/u-boot: OpenBMC &quot;Das U-Boot&quot; Source Tree</span></a>.</fon=
t></p><p class=3D"MsoNormal" style=3D"margin:0in;line-height:normal;font-si=
ze:11pt"><font face=3D"arial, sans-serif">=C2=A0</font></p><p class=3D"MsoN=
ormal" style=3D"margin:0in;line-height:normal;font-size:11pt"><font face=3D=
"arial, sans-serif">After further investigation, I
found=C2=A0this driver is already upstream at mainline=C2=A0Uboot :=C2=A0<a=
 href=3D"https://github.com/u-boot/u-boot/blob/master/drivers/net/ksz9477.c=
"><span style=3D"color:rgb(5,99,193)">https://github.com/u-boot/u-boot/blob=
/master/drivers/net/ksz9477.c</span></a></font></p><p class=3D"MsoNormal" s=
tyle=3D"margin:0in;line-height:normal;font-size:11pt"><span style=3D"color:=
black"><font face=3D"arial, sans-serif">=C2=A0</font></span></p><p class=3D=
"MsoNormal" style=3D"margin:0in;line-height:normal;font-size:11pt"><font fa=
ce=3D"arial, sans-serif"><span style=3D"color:rgb(32,31,30)">Can anyone ple=
ase take a look
and get this driver in the OpenBMC tree</span><span style=3D"color:black">?=
 </span></font></p><p class=3D"MsoNormal" style=3D"margin:0in;line-height:n=
ormal;font-size:11pt"><span style=3D"color:black"><font face=3D"arial, sans=
-serif">=C2=A0</font></span></p><p class=3D"MsoNormal" style=3D"margin:0in;=
line-height:normal;font-size:11pt"><span style=3D"color:rgb(32,31,30)"><fon=
t face=3D"arial, sans-serif">Thank you in advance for your
help. </font></span></p><p class=3D"MsoNormal" style=3D"margin:0in;line-hei=
ght:normal;font-size:11pt"><span style=3D"color:rgb(32,31,30)"><font face=
=3D"arial, sans-serif">=C2=A0</font></span></p><p class=3D"MsoNormal" style=
=3D"margin:0in;line-height:normal;font-size:11pt"><span style=3D"color:rgb(=
32,31,30)"><font face=3D"arial, sans-serif">Regards,</font></span></p><p cl=
ass=3D"MsoNormal" style=3D"margin:0in;line-height:normal;font-size:11pt">





























</p><p class=3D"MsoNormal" style=3D"margin:0in;line-height:normal;font-size=
:11pt"><span style=3D"color:rgb(32,31,30)"><font face=3D"arial, sans-serif"=
>Sushil Dubey</font></span></p></div>

--00000000000072c41a05c7c5ec76--
