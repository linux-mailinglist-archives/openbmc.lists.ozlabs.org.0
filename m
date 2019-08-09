Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23888485
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 23:19:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464ymS61lJzDrK3
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 07:19:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lqa11Ka1"; 
 dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464ylv0k1xzDrHl
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 07:18:50 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id d9so29787865ybf.3
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=V6Spd4XzVK0ABOBTSeoWqlLz/n5xL8gfN2LOYQJAYgs=;
 b=lqa11Ka1FDGrRcEw8lxOFN3k6sSe3bx4ZvvpAfv0phQ8ZRQSBA5AxQKbcm9dhgvZM4
 aMYaV5hFNU3SbCe3QST2uXhYXuD+2ase2twaNq44fQgRqg6EFvQyfNqaxqxJ3xnp6lI8
 jcr7gXSOfrQ2mfdCWKYelGE3LVoh5oKKLSPupY6qR6pCfPyFeut79DhAMXrB7B/xI+Y7
 wQVtSLLwJCFjfkNPSoQ7OSYusohdEiLICj7aGOixdl5q1Pq+uK3b2Nuc+hyukRE/aunJ
 AReKecnx1mdG68WKelXF0VoDbAjOyhHnFI8ntJTgyc9zOaNVsrJcqaYB2lrEJWObqCyS
 f4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=V6Spd4XzVK0ABOBTSeoWqlLz/n5xL8gfN2LOYQJAYgs=;
 b=n2x24hqHeuQoU+8vWxxEqYpOTjo5CbGW3UERzaXRIJv8JKxWeGuvXXo1Y+JeNz/YZ0
 OMefOI5rjr44UPhW7WSA5jS6E7T6Y39vSaaZlho4GyW7feVvcibnZunOd9GhMaMCyHn4
 fTN3aQohFTKJrEr45NuQ0DHaTyAGbSgMAxCe+ZLJPtbx2dEPrFPV7dm+WSjl6Hg1u8o3
 PxybBj4h/aByHatEMLqTRRf4/sR5aJ867ZC2prTappGfoKJzHG2Mw4zEPZ5qf41oGXBv
 UuU9g+RUIsbdgioXPmnxGWeXJUlIuhQIU8RtE8E1Bdjf4Nk7acWrq0agkFMAUV2E/Bz9
 Eg3A==
X-Gm-Message-State: APjAAAXwS7ESPc6+EbLN/zBIQQgc5QQfEaH3X2IOCxpi4n8QKO6GQlt1
 7uYWCJch9M/1RkTJVIco/RdtgNrZnbFuE2WI5kJhSjwi
X-Google-Smtp-Source: APXvYqwevGWuNNn9/R6gU5JDDmiAHJvPjKATik0axpSib4Ow9EBaP55ct92wJfLLF/Nk1tLW/NnlAGebQ3Y6p4fz24Q=
X-Received: by 2002:a25:ad45:: with SMTP id l5mr10880004ybe.134.1565385526820; 
 Fri, 09 Aug 2019 14:18:46 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Fri, 9 Aug 2019 16:18:36 -0500
Message-ID: <CAMTupoQYjPuVSJ_jJn8f5=7C9UD_azywbpjvTBr4yMVJ9bzanw@mail.gmail.com>
Subject: Firmware updates - GUI Redesign
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000434657058fb5b826"
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

--000000000000434657058fb5b826
Content-Type: text/plain; charset="UTF-8"

Hello all,

Please find below the links to the proposed redesigns for the firmware
update panels.

This design improves the usability of the current design by addressing the
following items:

   - Intuitiveness on which image is running
   - Clarity on what the current activated images are and what they will be
   on the next reboot
   - Updating terminology to match what customers are used to (Functional
   and active) is confusing
   - (For double file) Support uploading multiple images at the same time
   to avoid errors caused by a need for concurrent images.
   -Support for a single image file containing both BMC and server code

Single file upload prototype:
https://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319207132_4-8-S-1_Home

Double file upload prototype:

 https://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319212821_4-8-D-1_Home


Github story: https://github.com/openbmc/phosphor-webui/issues/92


*Note: These designs are only prototypes and not everything is clickable.
To navigate, click on any flashing blue rectangles or use the right and
left keyboard arrows. Comments are welcome in InVision (turn on comment
mode in the bottom right corner of the screen) and in the Github story.

--000000000000434657058fb5b826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"box-sizing:border-box;margin-bottom:16px;margi=
n-top:0px;color:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Seg=
oe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px">Hello all,=
=C2=A0</p><p style=3D"box-sizing:border-box;margin-bottom:16px;margin-top:0=
px;color:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe UI&q=
uot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe U=
I Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px">Please find below=
 the links to the proposed redesigns for the firmware update panels.=C2=A0<=
/p><p style=3D"box-sizing:border-box;margin-bottom:16px;margin-top:0px;colo=
r:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe UI&quot;,He=
lvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px">This design improves the=
 usability of the current design by addressing the following items:</p><ul =
style=3D"box-sizing:border-box;margin-bottom:16px;margin-top:0px;padding-le=
ft:2em;color:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe =
UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Seg=
oe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px"><li style=3D"=
box-sizing:border-box;margin-left:0px">Intuitiveness on which image is runn=
ing</li><li style=3D"box-sizing:border-box;margin-top:0.25em;margin-left:0p=
x">Clarity on what the current activated images are and what they will be o=
n the next reboot</li><li style=3D"box-sizing:border-box;margin-top:0.25em;=
margin-left:0px">Updating terminology to match what customers are used to (=
Functional and active) is confusing</li><li style=3D"box-sizing:border-box;=
margin-top:0.25em;margin-left:0px">(For double file) Support uploading mult=
iple images at the same time to avoid errors caused by a need for concurren=
t images.<br style=3D"box-sizing:border-box">-Support for a single image fi=
le containing both BMC and server code</li></ul><p style=3D"box-sizing:bord=
er-box;margin-bottom:16px;margin-top:0px;color:rgb(36,41,46);font-family:-a=
pple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot=
;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&q=
uot;;font-size:14px">Single file upload prototype:=C2=A0<br style=3D"box-si=
zing:border-box"><a rel=3D"nofollow" href=3D"https://ibm.invisionapp.com/sh=
are/4XNZ0JAMJ7B#/319207132_4-8-S-1_Home" style=3D"box-sizing:border-box;bac=
kground-color:transparent;color:rgb(3,102,214);text-decoration-line:none">h=
ttps://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319207132_4-8-S-1_Home</a></p=
><p style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,41,46);font-=
family:-apple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-se=
rif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI=
 Symbol&quot;;font-size:14px;margin-bottom:0px">Double file upload prototyp=
e:</p><p style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,41,46);=
font-family:-apple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sa=
ns-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Seg=
oe UI Symbol&quot;;font-size:14px;margin-bottom:0px">=C2=A0<a rel=3D"nofoll=
ow" href=3D"https://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319212821_4-8-D-=
1_Home" style=3D"box-sizing:border-box;background-color:transparent;color:r=
gb(3,102,214);text-decoration-line:none">https://ibm.invisionapp.com/share/=
4XNZ0JAMJ7B#/319212821_4-8-D-1_Home</a></p><p style=3D"box-sizing:border-bo=
x;margin-top:0px;color:rgb(36,41,46);font-family:-apple-system,system-ui,&q=
uot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px;marg=
in-bottom:0px"><br></p><p style=3D"box-sizing:border-box;margin-top:0px;col=
or:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe UI&quot;,H=
elvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px;margin-bottom:0px">Githu=
b story:=C2=A0<a href=3D"https://github.com/openbmc/phosphor-webui/issues/9=
2" style=3D"font-family:Arial,Helvetica,sans-serif;font-size:small">https:/=
/github.com/openbmc/phosphor-webui/issues/92</a></p><p style=3D"box-sizing:=
border-box;margin-top:0px;color:rgb(36,41,46);font-family:-apple-system,sys=
tem-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:=
14px;margin-bottom:0px"><br></p><p style=3D"box-sizing:border-box;margin-to=
p:0px;color:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe U=
I&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Sego=
e UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px;margin-bottom:0=
px">*Note: These designs are only prototypes and not everything is clickabl=
e. To navigate, click on any flashing blue rectangles or use the right and =
left keyboard arrows. Comments are welcome in InVision (turn on comment mod=
e in the bottom right corner of the screen) and in the Github story.=C2=A0<=
/p></div>

--000000000000434657058fb5b826--
