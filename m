Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECB24279
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 23:05:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457BHZ1yHzzDqLX
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 07:05:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2d; helo=mail-yw1-xc2d.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MYO/WpkU"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2d.google.com (mail-yw1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457BH85F04zDqGl
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 07:04:52 +1000 (AEST)
Received: by mail-yw1-xc2d.google.com with SMTP id b74so6430144ywe.5
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dkYzjcM1XIyH1gCUo4hALhtJmbgDw1eAs9aPzLhbruc=;
 b=MYO/WpkUqhAUJ54oBw7x/u9GRDDNgeWTl9NileGPFlTsUR3SjhTC3G0QvxSK7Y/HDB
 0Xz0dMiHMlU+AbGb641sx//FUfMhNYMrZxEo/fRWHdMjvJCcxHF09DL5g7SoLvpLTMS3
 Dqw3d6ir9qgE1XpOE5XyzvePOVgvomvfYHM2AJWUl9XZEtYDiG7T2mXjgKVePjP92OxT
 31lEY3CiRQfFMy7mm3n2PVk2YjgbZ23AJ+DMc+QGXDwVxmkIuivBOy2bT7sKmVsvaVRo
 YLkNGvVy2nlH+JiKSxTpsWdqP4cdVlQPhuUD1ojnNOuzLbbJP08h9yBVpEJN6mjTmsv8
 pdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dkYzjcM1XIyH1gCUo4hALhtJmbgDw1eAs9aPzLhbruc=;
 b=oESZvYibXjW9XyXeU/hnxpXeAVIEA8i5rOBTrf1Icuz7kDMqeOsi2UMKptmh0Q4hLu
 rSpSE2s2vaDDaNMkjts5fUSCDYMq8tf0TBkT4TreG1aXCGpcx/A8iZZH3AFlTm7zDDIP
 3gGMoY32lkaI2kkOIKl934/IU+Agr2hZBvTTlvQMRKsqQ9nxhibiXuFM6Xg+oQl0jF6F
 Fjg3fYsF/p6ejz9ZxJrjRMhWj/87D8yUFjo1vZDjA2FGlhVmDiAD1eV9qyZNMPrXIH37
 QZdcJ5KKAiYnRmp9kajXSSjm9rk7xs/RyY+BxxYcYDkcIvTGNLx3K/fxTD0J3x0gisRI
 lWMg==
X-Gm-Message-State: APjAAAVsgGnYNGiBp58j0zovCVRZuR5WH5hUIaqZq6eYUbHSyKn6ebKl
 wyJttrf6dPEuSjNjfyxYssymJiHZjGQfVhNK2bCFSgwvx64=
X-Google-Smtp-Source: APXvYqxaOZMw8t2uVc8xdg4Z/+/4evTlVQz6lKlgpF5br/4cRD8tI6CBEo1H6tdwt8y3zn3gIOT/PiG3u15eRuHRL/Q=
X-Received: by 2002:a81:9b17:: with SMTP id s23mr35760789ywg.503.1558386288168; 
 Mon, 20 May 2019 14:04:48 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 20 May 2019 16:04:37 -0500
Message-ID: <CAMTupoTn2GEX8THhtrWqgXNpjebLnT6PwhWQUad8R7f_Hfoh0w@mail.gmail.com>
Subject: GUI Workgroup meeting - this Wednesday 7:30AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000021122105895815e3"
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

--00000000000021122105895815e3
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup meeting will be happening Wednesday May 22 at
7:30AM CST.

Tentative agenda:

   1. Updates on Intel-specific icon changes mentioned last meeting (Intel)
   2. Share research findings and updates on design layout (Intel)
   3. Review gathered user feedback on User Management panel and discuss a
   possible redesign (IBM)
   4. Current System log page design features discussion (IBM)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--00000000000021122105895815e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div><span style=3D"background-color=
:transparent"><font face=3D"verdana, sans-serif">Hello all,=C2=A0</font></s=
pan></div><div><span style=3D"background-color:transparent;color:rgb(36,41,=
46)"><font face=3D"verdana, sans-serif"><br></font></span></div><div><span =
style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"ve=
rdana, sans-serif">The GUI design workgroup meeting will be happening Wedne=
sday May 22 at 7:30AM CST.=C2=A0</font></span></div><div><span style=3D"bac=
kground-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-=
serif"><br></font></span></div><div><font color=3D"#24292e" face=3D"verdana=
, sans-serif">Tentative agenda:=C2=A0</font></div></div><div><ol><li><font =
face=3D"verdana, sans-serif">Updates on Intel-specific icon changes mention=
ed last meeting (Intel)</font></li><li><font face=3D"verdana, sans-serif">S=
hare research findings and updates on design layout (Intel)</font></li><li>=
<font face=3D"verdana, sans-serif">Review gathered user feedback on User Ma=
nagement panel and discuss a possible redesign (IBM)</font></li><li><font f=
ace=3D"verdana, sans-serif">Current System log page design features discuss=
ion (IBM)</font></li></ol></div><div><div><font face=3D"verdana, sans-serif=
">Please add any other agenda items here:=C2=A0<a href=3D"https://github.co=
m/openbmc/openbmc/wiki/GUI-Design-work-group" target=3D"_blank">https://git=
hub.com/openbmc/openbmc/wiki/GUI-Design-work-group</a></font></div><div><br=
></div><div><font face=3D"verdana, sans-serif"><span style=3D"box-sizing:bo=
rder-box;color:rgb(36,41,46)">Meeting Link</span><span style=3D"color:rgb(3=
6,41,46)">:=C2=A0</span><a href=3D"https://ibm.webex.com/ibm/j.php?MTID=3Dm=
49792ce33d5af28f2823638d351732f3" rel=3D"nofollow" style=3D"box-sizing:bord=
er-box;color:rgb(3,102,214);text-decoration-line:none">https://ibm.webex.co=
m/ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3</a><br style=3D"box-si=
zing:border-box;color:rgb(36,41,46)"></font></div><div><font face=3D"verdan=
a, sans-serif"><br></font></div><div><span style=3D"background-color:transp=
arent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">Best,</font><=
/span></div><div><span style=3D"background-color:transparent;color:rgb(36,4=
1,46)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-m_6525215738=
950614323gmail-m_-6172510825241159069gmail-il" style=3D"">GUI</span>=C2=A0<=
span class=3D"gmail-m_6525215738950614323gmail-m_-6172510825241159069gmail-=
il" style=3D"">Design</span>=C2=A0Team=C2=A0</font></span></div></div></div=
></div>

--00000000000021122105895815e3--
