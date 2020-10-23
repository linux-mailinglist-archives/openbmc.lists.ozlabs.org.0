Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214D29683B
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 03:01:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHQsP19RGzDqyn
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 12:01:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AKMFDWoU; dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHQr86CM1zDqyk
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 12:00:06 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id q25so3643035ioh.4
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WoW1whEbSRFNdP9G9lFk7lToGzmKH23v8RdB/o/okfo=;
 b=AKMFDWoUYA6E4/Py8FwvlwWtVq0MxIWmSeyHcuwDYfuVE5bqgdM6DB8YFG3dp8YD/C
 BWj4TISSl7l7VwjmHrAbulLXevdj39fHZjG5NqYp3UEwUXH8TdxZwHV5CcsFVrIV3odL
 HLFDpVJ42c8ARSCxinYFf0ppuLPpwi1yWy1srtHZI9Q8TQnCda0Gbin8QfQRNcTBI4AY
 AaUOHrIsNE3EjWZEoGGoEWAqHIZu9GVB9q4ekUvdHOHFMUF/ruaBOEIt783dkr/PoQTT
 6tGxlzwPFaASD12AhYVOL6gPUarvRimLbdFwhOqD0ebXY/2bSoEXR09FAGynGUAixt+Y
 6Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WoW1whEbSRFNdP9G9lFk7lToGzmKH23v8RdB/o/okfo=;
 b=YVqT6I1DvuYgVM5y2qI/p/hUxsaiw75t/1k3cKJ5EepYnMk3nDTHQRFKCmQ/Nb8U7d
 kGVWDUKVcuHXEU+Ke3ermorQIZDcbigryy1sBK7mNHZjAvctwFTMg1Rj9KDw2pIYAz/n
 iOxMt4x2ROp7fZ5K3ayNA/+JmS4JRdAhre4zsgLEtE0krKDnRK580+MxZuylpxo9sIXD
 qAdyXrEx/MwmnLEoWAjNNu6k5lp8IrP4YbMrANE/8WPmMgHNP/EZkxHwaAbHGaL2jxlg
 Pm12WkFixxXrwwpX87b1QddDOgkWY47gblaI71uIDx7R2Y3ysVMi1dWE7r1OV1MqiCaI
 EhrQ==
X-Gm-Message-State: AOAM530vImrBrGkdm1Lr7/xtlOl/P0JdVpPz++19F3FyJryfZtTrt+TW
 kNnR7mgKQKdBlGJ6MQfRoWIyFLAFRYAqcUpiMVu6fyWvopUiOg==
X-Google-Smtp-Source: ABdhPJx1RBrBwhxTEZZnfWWy8zF2uQn7PJMpmHXAzkZwWGmuaiJlCeWnUEfjAb4rqNMTjvAv2ob4x+yKyI3BLfWtwc0=
X-Received: by 2002:a02:c80a:: with SMTP id p10mr30268jao.114.1603414802586;
 Thu, 22 Oct 2020 18:00:02 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 22 Oct 2020 17:59:26 -0700
Message-ID: <CADfYTpGw9G0ACwhmiZU_v8HoT4nZy8a3wnCGbozM1QiNFaX9og@mail.gmail.com>
Subject: thoughts on livepatch?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bccf3905b24c19cf"
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

--000000000000bccf3905b24c19cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anyone tried it with OpenBMC?  Any thoughts?

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000bccf3905b24c19cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Anyone tried it with OpenBMC?=C2=A0 Any thoughts?<br clear=
=3D"all"><div><br></div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><table style=3D"border:none;border-collaps=
e:collapse"><colgroup><col width=3D"73"><col width=3D"7"><col width=3D"111"=
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
d></tr></tbody></table></div></span></div></div></div>

--000000000000bccf3905b24c19cf--
