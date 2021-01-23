Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50D301164
	for <lists+openbmc@lfdr.de>; Sat, 23 Jan 2021 01:10:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMxNL0C4hzDr5Q
	for <lists+openbmc@lfdr.de>; Sat, 23 Jan 2021 11:10:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qJGWvNVP; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMxMQ5jq7zDr3k
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jan 2021 11:09:34 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id c7so6999392qke.1
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 16:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8AGTWn3s01wAU0eUYTu0Gl6QWu6wQ9b9QVXqawIUK28=;
 b=qJGWvNVPPqmILFv7GBl8HqZhO6T0rIz4Dt7ClPXR9MB5oi07bnyE+dOHuQ5kwiVN9T
 pvb20aXIc9x1EYGLXpC82tc60rNhTTPkUp9gp8yxD0d8eiZZcvK8ip/G3SFSOsYprOy6
 1aOq+nGY4MEvYtP8y2oLgouBMryqPbnTn4T3wBKAeL7iAu0eg/BRIE9uNs3QUKKTZvCa
 CSk6v8vdPjjNjYfNKM1xGp/S3Vuem3gFisEocT60rlxUTH2u9lKhG6outxAtco0/W5Ys
 s6aRmliJY01FQC2sX/RHQBlJNirZZbwR8zcMVH8oWdEuxTJU7Lm95xDUJTdjhO85VFCD
 oRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8AGTWn3s01wAU0eUYTu0Gl6QWu6wQ9b9QVXqawIUK28=;
 b=ZOXdATfzznmgb6q5kwKNA8n+oizqeFAIwjrCqRQ+/pQzhiLvghR3FXErv8cybmiIqt
 n/hn6EGlrFkKexDE4sOG7toLktY9glIADQ2iVpVHgGBj5sMEzessqMD5bKy6fVrojN4U
 6ct3gLUhSV5nn8HvC15x/1Pd1GKHm/9QhgMI75oiif/EVMX6y4P/qyO7FLhD/RJv4XYV
 P06sEmnND6k1FECBQWI99OA2lc0rXHtKFGkos6lAAnbV4lTByOqVuJHddHRHDMIc4p1A
 2+Q5xJBc8raXQ6DheCw92NY/TQWdwO1ka0yXKeTIXOOkZqO4Adga3MPhgA+dviT8+DWg
 NVGw==
X-Gm-Message-State: AOAM5306XPm+3Zpk+3EvKpzDzH8ja7bnzy5gNE/GRAdulgECv46PPbv0
 wCF2sX3iPw2otTZJdte/YgsqkVjZdhm9VtLMHHva9cZiBoA=
X-Google-Smtp-Source: ABdhPJwDBtEWpM19/tO3E93Cu2Ad7lxSnW56l1lqezUX0YLKOGT30AUOMJ6Aw1zOPABMvq4muKLsBvUDDBWpUFK9eWw=
X-Received: by 2002:a02:a18f:: with SMTP id n15mr2842029jah.90.1611360158776; 
 Fri, 22 Jan 2021 16:02:38 -0800 (PST)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 22 Jan 2021 16:02:02 -0800
Message-ID: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
Subject: request repo meta-tyan
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000df0ce705b9860563"
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

--000000000000df0ce705b9860563
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are bringing up some Tyan machines using OpenBMC request the creation of
a meta-tyan repo.

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000df0ce705b9860563
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We are bringing up some Tyan machines using OpenBMC r=
equest the creation of a meta-tyan repo.</div><div><br></div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><span><div dir=3D"ltr" style=3D"margin-left:0pt" align=3D"left"><span=
><div dir=3D"ltr" align=3D"left"><table style=3D"border:none;border-collaps=
e:collapse"><colgroup><col width=3D"76"><col width=3D"7"><col width=3D"111"=
><col width=3D"7"><col width=3D"122"><col width=3D"7"><col width=3D"71"></c=
olgroup><tbody><tr style=3D"height:15pt"><td style=3D"border-top:solid #d50=
f25 1.5pt;vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);=
background-color:transparent;font-weight:700;vertical-align:baseline;white-=
space:pre-wrap">Nancy Yuen</span></p></td><td style=3D"border-top:solid #66=
6666 1.5pt;vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span s=
tyle=3D"font-size:11pt;font-family:Arial;color:rgb(255,0,0);background-colo=
r:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap"=
>=E2=80=A2</span></p></td><td style=3D"border-top:solid #3369e8 1.5pt;verti=
cal-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;=
text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-colo=
r:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap"=
>Google Platforms=C2=A0</span></p></td><td style=3D"border-top:solid #66666=
6 1.5pt;vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line=
-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(61,133,198);background-colo=
r:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap"=
>=E2=80=A2</span></p></td><td style=3D"border-top:solid #009939 1.5pt;verti=
cal-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;=
text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-colo=
r:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap"=
><a href=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</a>=
</span></p></td><td style=3D"border-top:solid #666666 1.5pt;vertical-align:=
middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-align=
:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:rgb(0,153,57);background-color:transparent;font-weight=
:700;vertical-align:baseline;white-space:pre-wrap">=E2=80=A2</span></p></td=
><td style=3D"border-top:solid #eeb211 1.5pt;vertical-align:middle;overflow=
:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Roboto=
,sans-serif;color:rgb(102,102,102);background-color:transparent;font-weight=
:700;vertical-align:baseline;white-space:pre-wrap">Google LLC</span></p></t=
d></tr></tbody></table></div></span></div></span></div></div></div>

--000000000000df0ce705b9860563--
