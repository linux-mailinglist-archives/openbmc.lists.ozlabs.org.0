Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90151339A8
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 22:24:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hmjr0vpdzDqRs
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 06:24:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c35; helo=mail-yw1-xc35.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g+k/wOKc"; 
 dkim-atps=neutral
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HmjJ5V8JzDqL0
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 06:23:46 +1000 (AEST)
Received: by mail-yw1-xc35.google.com with SMTP id t2so91688ywe.10
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CSVGDRXhO43m6TupVbt0ikHq4hCuqhYTSe7ifZ6fAPk=;
 b=g+k/wOKcaeuf6OM4G9ognCAcQF1vt6mSVkD0Cr4UPli0ieZE3R6IiI9e3M89st6qSC
 HmuNE9YDpcZRpsybL+J41809u3jTz32OI1KdwA8k5VcpdGlH7bRAruwCmqNB9XRiiH0I
 lfgNil6YxBNIbEwDe/+Roqpfhs49dHsRiRi0gjrWEzeGFApTJM8JGbU345KMqosB5bY/
 3rMZVCktheHr0Rf/qZ2Aj0zzzgomgeVPRENviZzISw/l21R/vTWq5zKbNoskf9OrcTok
 2cFEX15EtWR7OLjpQ5rThMf1XsuT7UvIURKXrc1B3aGSGgajEn4cce/xQAZtfUx5O5bX
 0b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CSVGDRXhO43m6TupVbt0ikHq4hCuqhYTSe7ifZ6fAPk=;
 b=QrcDXqIqPa7MMOPqgOChCRyQwav/7mtcAYOKJNmZwSZylhy6U3AU5ldjaxLK2jhCFm
 kxN0W1eceganpn5aE8t4QoAOyQfNR8MICBkKtlKNlcdbwP9aFpB1Y6/P9GtTEwMWRY4L
 /R5DQbaplYBUxHekrCMoMqmEnXbZRv6PAPIuMM+R/D/dFcmjPt9+V+GDXsFJFw/PSevG
 cEqkn7mRElrzP5yAtHft4YC2AqZY+S8UlCVLoxbwCoPI31mM2cn5PTuN1YVbDtAhv5/F
 wtDCV3uEFrmnxCuOboVOPAZZakKvTlRcHo8e71ZmbynfR8V3T6pwygpCSvxLEG45CWkq
 z9Fg==
X-Gm-Message-State: APjAAAXI5CrUJWbIg2UTtzzQ1L89sFmqMuryYJqi4JoPJYR4+5S/CSi2
 4hlWFVsWbkhRr/GYESLT58SkUzIei+egzi+pemEzJisIz9Q=
X-Google-Smtp-Source: APXvYqwQg0xMO863ffS4Ga8Ms+BAX+BgnZnhHvGlF/Sb6GGfUZmBcEWRBonkeCcY54XAm6QtcqQcpCxm9JRvIGEENXw=
X-Received: by 2002:a81:6083:: with SMTP id
 u125mr14454462ywb.485.1559593422703; 
 Mon, 03 Jun 2019 13:23:42 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 3 Jun 2019 15:23:32 -0500
Message-ID: <CAMTupoTagP0=uyg1DsNVZYvFvH23yAAwkxoGpYHoQtowCx2N-A@mail.gmail.com>
Subject: GUI Workgroup meeting - this Wednesday 7:30AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000f451bd058a712378"
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

--000000000000f451bd058a712378
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup meeting will be happening Wednesday June 5 at
7:30AM CST. As there was no attendees last meeting, this week we have the
same agenda.

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

--000000000000f451bd058a712378
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:transparent"><fo=
nt face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"backgr=
ound-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-ser=
if">The GUI design workgroup meeting will be happening Wednesday June 5 at =
7:30AM CST. As there was no attendees last meeting, this week we have the s=
ame agenda.=C2=A0</font></span></div><div><span style=3D"background-color:t=
ransparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><br></fo=
nt></span></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif">T=
entative agenda:=C2=A0</font></div></div><div><ol><li style=3D"margin-left:=
15px"><font face=3D"verdana, sans-serif">Updates on Intel-specific icon cha=
nges mentioned last meeting (Intel)</font></li><li style=3D"margin-left:15p=
x"><font face=3D"verdana, sans-serif">Share research findings and updates o=
n design layout (Intel)</font></li><li style=3D"margin-left:15px"><font fac=
e=3D"verdana, sans-serif">Review gathered user feedback on User Management =
panel and discuss a possible redesign (IBM)</font></li><li style=3D"margin-=
left:15px"><font face=3D"verdana, sans-serif">Current System log page desig=
n features discussion (IBM)</font></li></ol></div><div><div><font face=3D"v=
erdana, sans-serif">Please add any other agenda items here:=C2=A0<a href=3D=
"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group" target=3D"_=
blank">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a></f=
ont></div><div><br></div><div><font face=3D"verdana, sans-serif"><span styl=
e=3D"box-sizing:border-box;color:rgb(36,41,46)">Meeting Link</span><span st=
yle=3D"color:rgb(36,41,46)">:=C2=A0</span><a href=3D"https://ibm.webex.com/=
ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3" rel=3D"nofollow" target=
=3D"_blank" style=3D"color:rgb(3,102,214);box-sizing:border-box;text-decora=
tion-line:none">https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f282=
3638d351732f3</a><br style=3D"box-sizing:border-box;color:rgb(36,41,46)"></=
font></div><div><font face=3D"verdana, sans-serif"><br></font></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif">Best,</font></span></div><div><span style=3D"backg=
round-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-se=
rif"><span class=3D"gmail-m_-274210038052043966gmail-m_6525215738950614323g=
mail-m_-6172510825241159069gmail-il">GUI</span>=C2=A0<span class=3D"gmail-m=
_-274210038052043966gmail-m_6525215738950614323gmail-m_-6172510825241159069=
gmail-il">Design</span>=C2=A0Team=C2=A0</font></span></div></div></div>

--000000000000f451bd058a712378--
