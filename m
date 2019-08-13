Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8118C3C6
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 23:33:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Qtj0NZzzDqTP
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 07:33:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2a; helo=mail-yw1-xc2a.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OrZUXHIn"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2a.google.com (mail-yw1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Qst1VsQzDqS2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 07:32:33 +1000 (AEST)
Received: by mail-yw1-xc2a.google.com with SMTP id n126so2847875ywf.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 14:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+W7hfzgt0Oe5Z2lEUd/LZfisai2OMQqrtEhqG0L5IfE=;
 b=OrZUXHInnj3WY6FYFfun6cIg23WX4Xvb9bgoSCs3DZSae/mOr8R3QyIq22ogKOXKWi
 lGZ+doOg94rODoUvlkxUqACx52i0vX6b8oHjhjQvyi78rXR+FmnO3QdHqHimAGjQ50EY
 QCs71qGCZbEPMqDDsA4zDj2Dd578Lph/wdjmTivPByVKHbYikO+F809N68m4vRPvBwFW
 XNYCKZzawtFJNGIO5NXU9n60mzuDpmRebyRH2KAWLo5yPAqcgFwgnCQta4ryuKR5EsSu
 1jAs9LUiM4QmxakYiOcSpuDBPUTTZmhaGUCZCeYBMf3BCh0eP1p0Hoj+H1fkU1t+EPeq
 FlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+W7hfzgt0Oe5Z2lEUd/LZfisai2OMQqrtEhqG0L5IfE=;
 b=Fw3wbMAmCQYObAKl5HXs+ReaB/R6yZZBO6zKbGlDNTyNF6uSvhym3v0tdT6PLgI7g6
 ITJH8HOaZDHon9v9ilT/Iiu8kdXHOE/DungsHPKLGaqHAUxlFmHyM+yUmeiOHVRNFup/
 vYUMNt9IfVboRX5B9k2pzyz3h7EFM7D5DKLY7zxXrqmDqHDbAqRiIoZc629MR9+Co1XT
 cgcyIUUSClWL7q2V+uYm6SvVsZflt7dVk6EF8jlAK9Y/853HExkS9EjHlrpOOu1yb+gN
 urzGg3zFpJqMp8RzK4OGcW8k2jj9XuSiiNjqes5hBy0n0tt0DyRozA0dWq7MEo9x1WQA
 KxtA==
X-Gm-Message-State: APjAAAWGC4xLcNl87toAD6ds/wiGMr+UYfFSyEJ/No3ycHYJJojzC9/d
 iv2DQbHFd6AF4JiRfFHug4vBcE0n2ciOVQZg4EFcMUU5
X-Google-Smtp-Source: APXvYqwM+2gTQoIy77G/1KHeThCVPu8NDP3SEq9EQJKb6AKxcG9iMl3F84p1jtHzHDhYEcO+lebUxi+6T0ivzYL9pMU=
X-Received: by 2002:a81:4b16:: with SMTP id y22mr20253947ywa.485.1565731950048; 
 Tue, 13 Aug 2019 14:32:30 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 13 Aug 2019 16:32:19 -0500
Message-ID: <CAMTupoTsqEzGO8kfp030vquT4kHZDjdkCYFG9YFx_hFSqWAz8A@mail.gmail.com>
Subject: GUI Workgroup - this Wed Aug 14 at 10AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b2380c0590066025"
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

--000000000000b2380c0590066025
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup will be meeting this Wednesday July 31 at 10:00AM
CST.

Tentative agenda:

   1. Server Power Operations
   2. Firmware update
   3. Local User Management review (TBD)
   4. Changes to the navigation structure (TBD)
   5. CPU / GPU Throttling (TBD)
   6. Event Logs (TBD)
   7. IF THERE IS INTEL REPRESENTATION - Updates on Intel-specific icon
   changes mentioned last meeting (Intel)
   8. IF THERE IS INTEL REPRESENTATION - Share research findings and
   updates on design layout (Intel)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

As a note, attendance has been solely IBM community members. We would love
to have others join.

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--000000000000b2380c0590066025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:transparent"><fo=
nt face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"backgr=
ound-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-ser=
if">The=C2=A0<span class=3D"gmail-m_-603141577188602554gmail-m_-58042478128=
78174296gmail-m_-4492976450962714341gmail-m_-1492632449708843752gmail-il">G=
UI</span>=C2=A0design=C2=A0<span class=3D"gmail-m_-603141577188602554gmail-=
m_-5804247812878174296gmail-m_-4492976450962714341gmail-m_-1492632449708843=
752gmail-il">workgroup</span>=C2=A0will be meeting this Wednesday July 31 a=
t 10:00AM CST.=C2=A0</font></span></div><div><span style=3D"background-colo=
r:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><br><=
/font></span></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif=
">Tentative agenda:=C2=A0</font></div></div><div><ol><li style=3D"box-sizin=
g:border-box">Server Power Operations</li><li style=3D"box-sizing:border-bo=
x;margin-top:0.25em">Firmware update</li><li style=3D"box-sizing:border-box=
;margin-top:0.25em">Local User Management review (TBD)</li><li style=3D"box=
-sizing:border-box;margin-top:0.25em">Changes to the navigation structure (=
TBD)</li><li style=3D"box-sizing:border-box;margin-top:0.25em">CPU / GPU Th=
rottling (TBD)</li><li style=3D"box-sizing:border-box;margin-top:0.25em">Ev=
ent Logs (TBD)</li><li style=3D"box-sizing:border-box;margin-top:0.25em">IF=
 THERE IS INTEL REPRESENTATION - Updates on Intel-specific icon changes men=
tioned last meeting (Intel)</li><li style=3D"box-sizing:border-box;margin-t=
op:0.25em">IF THERE IS INTEL REPRESENTATION - Share research findings and u=
pdates on design layout (Intel)</li></ol></div><div><div><font face=3D"verd=
ana, sans-serif">Please add any other agenda items here:=C2=A0<a href=3D"ht=
tps://github.com/openbmc/openbmc/wiki/GUI-Design-work-group" target=3D"_bla=
nk">https://github.com/openbmc/openbmc/wiki/<span class=3D"gmail-m_-6031415=
77188602554gmail-m_-5804247812878174296gmail-m_-4492976450962714341gmail-m_=
-1492632449708843752gmail-il">GUI</span>-Design-<span class=3D"gmail-m_-603=
141577188602554gmail-m_-5804247812878174296gmail-m_-4492976450962714341gmai=
l-m_-1492632449708843752gmail-il">work</span>-<span class=3D"gmail-m_-60314=
1577188602554gmail-m_-5804247812878174296gmail-m_-4492976450962714341gmail-=
m_-1492632449708843752gmail-il">group</span></a></font></div><div><font fac=
e=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verdana, sans=
-serif">As a note, attendance has been solely IBM community members. We wou=
ld love<br>to have others join.<br></font></div><div><font face=3D"verdana,=
 sans-serif"><br></font></div><div><font face=3D"verdana, sans-serif"><span=
 style=3D"box-sizing:border-box;color:rgb(36,41,46)">Meeting Link</span><sp=
an style=3D"color:rgb(36,41,46)">:=C2=A0</span><a href=3D"https://ibm.webex=
.com/ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3" rel=3D"nofollow" t=
arget=3D"_blank" style=3D"color:rgb(3,102,214);box-sizing:border-box;text-d=
ecoration-line:none">https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af2=
8f2823638d351732f3</a><br style=3D"box-sizing:border-box;color:rgb(36,41,46=
)"></font></div><div><font face=3D"verdana, sans-serif"><br></font></div><d=
iv><span style=3D"background-color:transparent;color:rgb(36,41,46)"><font f=
ace=3D"verdana, sans-serif">Best,</font></span></div><div><span style=3D"ba=
ckground-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans=
-serif"><span class=3D"gmail-m_-603141577188602554gmail-m_-5804247812878174=
296gmail-m_-4492976450962714341gmail-m_-1492632449708843752gmail-m_-2158016=
735816270648gmail-m_-274210038052043966gmail-m_6525215738950614323gmail-m_-=
6172510825241159069gmail-il"><span class=3D"gmail-m_-603141577188602554gmai=
l-m_-5804247812878174296gmail-m_-4492976450962714341gmail-m_-14926324497088=
43752gmail-il">GUI</span></span>=C2=A0<span class=3D"gmail-m_-6031415771886=
02554gmail-m_-5804247812878174296gmail-m_-4492976450962714341gmail-m_-14926=
32449708843752gmail-m_-2158016735816270648gmail-m_-274210038052043966gmail-=
m_6525215738950614323gmail-m_-6172510825241159069gmail-il">Design</span>=C2=
=A0Team=C2=A0</font></span></div></div></div>

--000000000000b2380c0590066025--
