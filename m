Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9D7B414
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 22:14:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ynpR1gsFzDqDf
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 06:14:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+BoLwZT"; 
 dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ynl01B8WzDqW0
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 06:11:39 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id j6so1464855ybm.7
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/dGcnrDESnr44tuY0F5pDi8AWsx4Btidt/ahV2tYtFw=;
 b=N+BoLwZTjQcMhhK8PX6ND1SItSlbrstCBLEg9JKIHCWMSA++tMblGMPKL8TGM41+KE
 orn3ngMRB5pVxrBM1BE67M3dvGVqGvPHyqTfzSUv1PUYYVC/6CtArgOguX/sclT0NB2n
 FQztLjvkzXG1abFWVmzc5bmyBAHQnXKWH/ADo7V0RugL+sePQs4xfAPTt49aoWJpa1IP
 u1s5t1pbeUIHVPdbjHqRWWAKJkV1jvHosZw8P2MAPMD3v35XtsWfOjBSo8hNNiijqf/S
 4Yyq1sn3fVyQNGGNaqX8c0D4kkFCoIEJ1Jj4mSimJPX+d8PCuRLQQRrhoubH3/JYMOq/
 rROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/dGcnrDESnr44tuY0F5pDi8AWsx4Btidt/ahV2tYtFw=;
 b=LskLX1epNfL9Jrq3FON2pL9p7sgXnC57T/w21isd5uspgZ9fh3jKGNpVA0ibIf0pcT
 MOzMNNR9lZedT/FwW06qzXKs2EQaXtsO1sArAAl+6EW+XHFCsmmQErP8coL9hNMfx+kB
 ImqciwsBrcXBN9tqa9zDxKI+gOIYQo4sFqe3nfqm45ShZjaR0Vwq3GZ0D9uEjX2bKboc
 AMIkhVOuIn/ATuKb+VPypyZVmmqJpsaxdxZEDpNuhl+7SP419Fa5/ZYEvFs/tu7KpTPO
 8Egy5usJOuB3oitnPQprfATwwC5CYaRoZnwPQPHq5F3FpU08s+mKFERHCgbLPPquXY1X
 9ZCA==
X-Gm-Message-State: APjAAAU8fL+wal2Z+P6caih7HB7qcJGDYXHMRKJeGuTcPBb+AWEhxaej
 AoTnPNeXl8UIrwDq0CjviVAZUiYjY8VSTHfdd+hgRVOg
X-Google-Smtp-Source: APXvYqwMN4VhAEdLy8MWI9gRIyvElKoY/RQBJJakqiqHYVZaHJTV1C1ZHCjG9KSfFTsjyxTa681ZRatpxS/y18iHyiY=
X-Received: by 2002:a25:5010:: with SMTP id e16mr71331566ybb.296.1564517495621; 
 Tue, 30 Jul 2019 13:11:35 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 30 Jul 2019 15:11:24 -0500
Message-ID: <CAMTupoQ-_1w_O4vbKCXGhE4V7UWngwaKW5vy_GrPitR3PSgixg@mail.gmail.com>
Subject: Seeking updates on proposed GUI changes by Intel
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000924b1e058eeb9d22"
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

--000000000000924b1e058eeb9d22
Content-Type: text/plain; charset="UTF-8"

Hello all,

In the GUI design workgroup on May 8th, Intel team members mentioned they
would be making changes to the GUI that they would share with the
community.

The two items were:
1. Updates on Intel-specific icon changes.
---> We would love to review these icons to make sure they are in line with
the rest of the icon and feel like a cohesive visual library.

2. Make design layout changes based on research and conversations with
their customers. The agreement was to share research findings and updates
with the community to make sure the changes align with the entire
community, since it is a solution we will share.

When can we expect an update on these items?

Best,
Jandra Aranguren

--000000000000924b1e058eeb9d22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"verdana, sans-serif">Hello all,=C2=A0</font>=
<div><font face=3D"verdana, sans-serif"><br></font></div><div><font face=3D=
"verdana, sans-serif">In the GUI design workgroup on May 8th, Intel team me=
mbers mentioned they would be making changes to the GUI that they would sha=
re with the community.=C2=A0<br></font></div><div><font face=3D"verdana, sa=
ns-serif"><br></font></div><div><font face=3D"verdana, sans-serif">The two =
items were:=C2=A0</font></div><div><font face=3D"verdana, sans-serif">1. Up=
dates on Intel-specific icon changes.=C2=A0</font></div><div><font face=3D"=
verdana, sans-serif">---&gt; We would love to review these icons to make su=
re they are in line with the rest of the icon and feel like a cohesive visu=
al library.=C2=A0</font></div><div><font face=3D"verdana, sans-serif"><br><=
/font></div><div><font face=3D"verdana, sans-serif">2. Make design layout c=
hanges based on research and conversations with their customers. The agreem=
ent was to share research findings and updates with the community to make s=
ure the changes align with the entire community, since it is a solution we =
will share.=C2=A0</font></div><div><font face=3D"verdana, sans-serif"><br><=
/font></div><div><font face=3D"verdana, sans-serif">When can we expect an u=
pdate on these items?=C2=A0</font></div><div><font face=3D"verdana, sans-se=
rif"><br></font></div><div><font face=3D"verdana, sans-serif">Best,</font><=
/div><div><font face=3D"verdana, sans-serif">Jandra Aranguren</font></div><=
/div>

--000000000000924b1e058eeb9d22--
