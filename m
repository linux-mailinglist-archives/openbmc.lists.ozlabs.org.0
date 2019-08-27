Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E29F662
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 00:49:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J3vn4t7gzDqx9
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 08:49:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DaO3ZGdB"; 
 dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J3v65ysPzDqtN
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 08:48:34 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id u32so131646ybi.12
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 15:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zzxwlXC02QjZTi4Ug7MgTy3F2WGbBzfWU2eoWe4Ld8s=;
 b=DaO3ZGdBR5n6oAY2tGl0MOLAuyRxzT2HVvdbTij/fK4T3WONsRG8y4eM5D1Gg5Gzr1
 WTkvWgEAVOByqTerpo4r/NOqhGDFW3RGEkv1ViwvgUMLvhqH6fAiF1iioZTLDuBMcWy6
 l+xtYQI5dGYJg9bzPe9PxFGQzDMQ5J0NbgKbwfN5oi0RXPbWGm1240FacRegvHCkxG8z
 aHuXA47NTsEenYFvZA5/U7cQVuY7xbFDxgzN9baHmNP5mvoMzVUq416RAsAgasAwzul/
 ijHEvT4vSiRhNnaxC5B/Ic8lD3UdksIBf/jF4ULDIrEcX2VgE1naoZHkWbhqAYLwiKYh
 mQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zzxwlXC02QjZTi4Ug7MgTy3F2WGbBzfWU2eoWe4Ld8s=;
 b=pcMhk/ufMWV4t3W8GEyhNfxziY7NpzftZ7cGjjFRm2Pk+xNGEDxQ3+t8ig2zqXYm9w
 AUzrzfyiPyfa8JSWjQXge5MQrI2iyNBSvp066/e1sYBugVq1TLQLdaYgMdSOZvbUMJCM
 DRx2yUprDYN/ID++fPOxzTKzYxA6TkX0nu51ygf366nZPkzYKdgZPY5CyzQbl8wcrYDR
 AgL6F9g9Srmt/O2Zyf387SSirloz4X2ominyQCFgy2BqMhPrkN27IfE8ohM05jQMgXvn
 iZ9O+8fVGNXS3z0Y+WQen448YEARCyAfQpj7PoPKGTKRkkh31UWvF6yV3axmHhokezld
 9wpQ==
X-Gm-Message-State: APjAAAWQCuPztfB4YJ0N8z1DlieWXNHfpz3g0Edoq3NojsxGwQgNIY/T
 ERuMt4MudPH3ZQd2q9r7mX7cCWFhqM6dKn6IwOoIdrJ9m7g=
X-Google-Smtp-Source: APXvYqyAqbaFUPqpihdQ3V9KT8vUQmrkVV9YVyUffNYStzSjPjnfmfJYvAYXu9jCwkEVKpAgi2zXwAk4dKnkOuDOmho=
X-Received: by 2002:a25:ad45:: with SMTP id l5mr936047ybe.134.1566946110862;
 Tue, 27 Aug 2019 15:48:30 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 27 Aug 2019 17:48:20 -0500
Message-ID: <CAMTupoToAXGWaRmjv9fmFU+SFqL-788NvLGQXSY5SRTi9CAREA@mail.gmail.com>
Subject: GUI workgroup meeting - Wednesday 10:30 AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000051face05912112a2"
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

--00000000000051face05912112a2
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup meeting will be happening Wednesday August 27 at
10:30AM CST. As there was no attendees last meeting, this week we have the
same agenda.

Tentative agenda:

   1. Updates on Intel-specific icon changes mentioned last meeting (Intel)
   2. Share research findings and updates on design layout (Intel)
   3. Share research findings regarding Dumps (IBM)
   4. Review Power Operations design (IBM)
   5. Show firmware update (single file and double file) (IBM)
   6. Navigation structure change (IBM)
   7. Display warning and error icons - certificates (IBM)


Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--00000000000051face05912112a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:transparent"><fo=
nt face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"backgr=
ound-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-ser=
if">The=C2=A0<span class=3D"gmail-m_7793815221487717703gmail-il">GUI</span>=
=C2=A0design=C2=A0<span class=3D"gmail-m_7793815221487717703gmail-il">workg=
roup</span>=C2=A0meeting will be happening Wednesday August 27 at 10:30AM C=
ST. As there was no attendees last meeting, this week we have the same agen=
da.=C2=A0</font></span></div><div><span style=3D"background-color:transpare=
nt;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><br></font></spa=
n></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif">Tentative=
 agenda:=C2=A0</font></div></div><div><ol><li style=3D"margin-left:15px"><f=
ont face=3D"verdana, sans-serif">Updates on Intel-specific icon changes men=
tioned last meeting (Intel)</font></li><li style=3D"margin-left:15px"><font=
 face=3D"verdana, sans-serif">Share research findings and updates on design=
 layout (Intel)</font></li><li style=3D"margin-left:15px"><font face=3D"ver=
dana, sans-serif">Share research findings regarding Dumps (IBM)</font></li>=
<li style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">Review Po=
wer Operations design (IBM)</font></li><li style=3D"margin-left:15px"><font=
 face=3D"verdana, sans-serif">Show firmware update (single file and double =
file) (IBM)</font></li><li style=3D"margin-left:15px">Navigation structure =
change (IBM)</li><li style=3D"margin-left:15px">Display warning and error i=
cons - certificates (IBM)=C2=A0</li></ol><span style=3D"font-family:verdana=
,sans-serif"><div><span style=3D"font-family:verdana,sans-serif"><br></span=
></div>Please add any other agenda items here:=C2=A0</span><a href=3D"https=
://github.com/openbmc/openbmc/wiki/GUI-Design-work-group" target=3D"_blank"=
 style=3D"font-family:verdana,sans-serif">https://github.com/openbmc/openbm=
c/wiki/<span class=3D"gmail-m_7793815221487717703gmail-il">GUI</span>-Desig=
n-<span class=3D"gmail-m_7793815221487717703gmail-il">work</span>-<span cla=
ss=3D"gmail-m_7793815221487717703gmail-il">group</span></a><br></div><div><=
div><br></div><div><font face=3D"verdana, sans-serif"><span style=3D"box-si=
zing:border-box;color:rgb(36,41,46)">Meeting Link</span><span style=3D"colo=
r:rgb(36,41,46)">:=C2=A0</span><a href=3D"https://ibm.webex.com/ibm/j.php?M=
TID=3Dm49792ce33d5af28f2823638d351732f3" rel=3D"nofollow" target=3D"_blank"=
 style=3D"color:rgb(3,102,214);box-sizing:border-box;text-decoration-line:n=
one">https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732=
f3</a><br style=3D"box-sizing:border-box;color:rgb(36,41,46)"></font></div>=
<div><font face=3D"verdana, sans-serif"><br></font></div><div><span style=
=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana=
, sans-serif">Best,</font></span></div><div><span style=3D"background-color=
:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><span =
class=3D"gmail-m_7793815221487717703gmail-m_-2158016735816270648gmail-m_-27=
4210038052043966gmail-m_6525215738950614323gmail-m_-6172510825241159069gmai=
l-il"><span class=3D"gmail-m_7793815221487717703gmail-il">GUI</span></span>=
=C2=A0<span class=3D"gmail-m_7793815221487717703gmail-m_-215801673581627064=
8gmail-m_-274210038052043966gmail-m_6525215738950614323gmail-m_-61725108252=
41159069gmail-il">Design</span>=C2=A0Team=C2=A0</font></span></div></div></=
div>

--00000000000051face05912112a2--
