Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4071B5D034
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:09:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dPj10J4LzDqYL
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 23:09:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MdbqG/zq"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dPZt2FDxzDqJq
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 23:04:21 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id j133so1246097ybj.12
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=C2oGxu9EbFdIdi2xC9bV7j3G1KGgK1Gs3mc45ReXpt4=;
 b=MdbqG/zqroNMoib/nr9XecDGI3a0oSZ6YZIcxZn7+mpwaJc6C2dlbOspUiKJqewjMs
 cJagokezeOnbtUTC1mls7VhEVo7Z9MmoQH6D9lO+BCG0sqcgjsqbvRjTcUL4SRJWhw2i
 I85hFfEtMOKdp8j5i99PLAfZMJDb3IBCAhVOHF9+hzMqeFF5C9jOP+TzzvOVj7Su2W9i
 UXCb7htKwsTgu4Z1XjavkZm6kjJDGxi71IrLNyO8SFn4pAPDfqwUETkgoQYcyYzkIPqh
 HjcaFPJzzSl6PnTZgUO0kaZZRVrNZKvikhnMFVLngvM5BawCKFgkN1HQpx442MVQAW+E
 JVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C2oGxu9EbFdIdi2xC9bV7j3G1KGgK1Gs3mc45ReXpt4=;
 b=sfh/l+sp2KIZ/8aKcSeBghFnSOOHQzLPJrIfUBtTU9u+JDiQk0UbVOmJf714lztIfD
 vW6alWCkXKBpR9aWtBKFs4DQ7ZI8vpmnAG6eumwIiwgXJO2dUMT+ebHL6BVzIA0YuRKY
 9Ws66PhSsO04k5u5zR50vvMZcsKjwVap4adSqM6xrB9w79mMBWt8W8yK2o6frZsI1Rv1
 kVBzqECwhVtIq1d6ZlKUxgY0Rq+YjHqUfSTgVxFcLF54kWSuQWuvX3zP8Nu5HEPnQawB
 MbSa+hdeLVMA7eIdulWztxfcDZsgAaCqP1wNJmV+G2MW5Dfmvhnb9uUMvYQviU7KIYFq
 YdmQ==
X-Gm-Message-State: APjAAAW9XCuWWuA1rSFtmj74Z7hg2eaVzY1ANkNRk38I8dT/O364+6mz
 y7wxu8hCR3oMU+hiSxD80cCpAvQWruUGju7DGvUdWsM0Kic=
X-Google-Smtp-Source: APXvYqzFMszR0hYSKCJDTe8RgTO0xfaYDX83QsXDSbm5eP4XLS9F1xD3URNqQ13QbSLEJrtN32V6VbemXi1Ca9dH9+s=
X-Received: by 2002:a25:b52:: with SMTP id 79mr7440592ybl.6.1562072657873;
 Tue, 02 Jul 2019 06:04:17 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 2 Jul 2019 08:04:07 -0500
Message-ID: <CAMTupoRvXiZRoHMEG8iTYe+v76Xw0w6jW295-ZMXozEno0y-fw@mail.gmail.com>
Subject: GUI workgroup meeting - Wednesday 10:00 AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000e2d1ef058cb261c5"
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

--000000000000e2d1ef058cb261c5
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup will be meeting Wednesday July 3 at 10:00AM CST.

Tentative agenda:

   1. Updates on Intel-specific icon changes mentioned last meeting (Intel)
   2. Share research findings and updates on design layout (Intel)
   3. Review updates on Local User Management panel (IBM)
   4. Current System log page design features discussion (IBM)
   5. Review TPM required policy mockups (IBM)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

As a note, attendance has been solely IBM community members. We would love
to have others join. We are hoping that changing the time from 7:00 AM
Central
to 10:00 AM Central will make that possible for people invested in the
GUI to attend.

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--000000000000e2d1ef058cb261c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:transparent"><fo=
nt face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"backgr=
ound-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-ser=
if">The=C2=A0<span class=3D"gmail-m_-1492632449708843752gmail-il">GUI</span=
>=C2=A0design=C2=A0<span class=3D"gmail-m_-1492632449708843752gmail-il">wor=
kgroup</span>=C2=A0will be meeting Wednesday July 3 at 10:00AM CST.=C2=A0</=
font></span></div><div><span style=3D"background-color:transparent;color:rg=
b(36,41,46)"><font face=3D"verdana, sans-serif"><br></font></span></div><di=
v><font color=3D"#24292e" face=3D"verdana, sans-serif">Tentative agenda:=C2=
=A0</font></div></div><div><ol><li style=3D"margin-left:15px"><font face=3D=
"verdana, sans-serif">Updates on Intel-specific icon changes mentioned last=
 meeting (Intel)</font></li><li style=3D"margin-left:15px"><font face=3D"ve=
rdana, sans-serif">Share research findings and updates on design layout (In=
tel)</font></li><li style=3D"margin-left:15px"><font face=3D"verdana, sans-=
serif">Review updates on Local User Management panel (IBM)</font></li><li s=
tyle=3D"margin-left:15px"><font face=3D"verdana, sans-serif">Current System=
 log page design features discussion (IBM)</font></li><li style=3D"margin-l=
eft:15px"><font face=3D"verdana, sans-serif">Review TPM required policy moc=
kups (IBM)<br></font></li></ol></div><div><div><font face=3D"verdana, sans-=
serif">Please add any other agenda items here:=C2=A0<a href=3D"https://gith=
ub.com/openbmc/openbmc/wiki/GUI-Design-work-group" target=3D"_blank">https:=
//github.com/openbmc/openbmc/wiki/<span class=3D"gmail-m_-14926324497088437=
52gmail-il">GUI</span>-Design-<span class=3D"gmail-m_-1492632449708843752gm=
ail-il">work</span>-<span class=3D"gmail-m_-1492632449708843752gmail-il">gr=
oup</span></a></font></div><div><font face=3D"verdana, sans-serif"><br></fo=
nt></div><div><font face=3D"verdana, sans-serif">As a note, attendance has =
been solely IBM community members. We would love<br>to have others join. We=
 are hoping that changing the time from 7:00 AM Central<br>to 10:00 AM Cent=
ral will make that possible for people invested in the<br>GUI to attend.<br=
></font></div><div><font face=3D"verdana, sans-serif"><br></font></div><div=
><font face=3D"verdana, sans-serif"><span style=3D"box-sizing:border-box;co=
lor:rgb(36,41,46)">Meeting Link</span><span style=3D"color:rgb(36,41,46)">:=
=C2=A0</span><a href=3D"https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5=
af28f2823638d351732f3" rel=3D"nofollow" target=3D"_blank" style=3D"color:rg=
b(3,102,214);box-sizing:border-box;text-decoration-line:none">https://ibm.w=
ebex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3</a><br style=3D=
"box-sizing:border-box;color:rgb(36,41,46)"></font></div><div><font face=3D=
"verdana, sans-serif"><br></font></div><div><span style=3D"background-color=
:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">Best,<=
/font></span></div><div><span style=3D"background-color:transparent;color:r=
gb(36,41,46)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-m_-14=
92632449708843752gmail-m_-2158016735816270648gmail-m_-274210038052043966gma=
il-m_6525215738950614323gmail-m_-6172510825241159069gmail-il"><span class=
=3D"gmail-m_-1492632449708843752gmail-il">GUI</span></span>=C2=A0<span clas=
s=3D"gmail-m_-1492632449708843752gmail-m_-2158016735816270648gmail-m_-27421=
0038052043966gmail-m_6525215738950614323gmail-m_-6172510825241159069gmail-i=
l">Design</span>=C2=A0Team=C2=A0</font></span></div></div></div>

--000000000000e2d1ef058cb261c5--
