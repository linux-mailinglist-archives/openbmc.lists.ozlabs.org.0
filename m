Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4B52EC09
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 14:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4QsY6NmMz3bqx
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 22:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f19xTe4h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f19xTe4h; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Qs72PXFz2xss
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 22:24:42 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id x65so2483425qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:message-id:references:to:date;
 bh=Qw81m1rwlhtMqvSjiIJNpppkKKVqjR2LiJV28/XBhRc=;
 b=f19xTe4hD6jlohB1WNASw/OC4z3rGY3YvizhUnCUgeTt5AICVGX9rtA6sOe4w7MXqS
 q6VCw1KoV7oql0Z4euxZjARA8c7LkCMrdxUG3I/OlivrsUmQ+SJt1y20ym8FtVo1BdkC
 Fn0pNuBqJUp5sUk+zaCH3rEzm6yR7L2JebJnJBgtlIk4l8PXJS3LqkfV+qqq9avuCqeE
 pWWGq8WH+9kqCHD2+LHTHy210HwP8Nt45THCq48VhbP33zTVYwB0TsxdegUN6+PtyxdC
 61L8zaBbCFPkUCOdJhN1kQ4W9jFMU0RYEHZMawmcMz98yaFlyg8Y0HhifQItWmRMZUlC
 LLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:message-id:references
 :to:date;
 bh=Qw81m1rwlhtMqvSjiIJNpppkKKVqjR2LiJV28/XBhRc=;
 b=vqhPrA33S0NMQpWAnDeUFAWEE1dOIPKyO1DaPA43Tir7BQKFgXK0PuJDLgMMQz3GuT
 T+Fc8VxeBrVRXDmVD3b/qnrzucPhp/OTp2CWBmQcM3WHxnq6UE/rvuJIBnUd2buK5x7C
 b+rdc++kMnC6E6VLMSAGs0VacJ+AsA+9d7KPPlVgATI27V2ExXpU3d5j4jU8ErhpJXzj
 rT+dnlT+zy/FVJV5LA7Tz9injqvHo9bOTdJA0sgATjWPghwMmc3+rvjRmhzlLJouAjh8
 HxpEEVedX15GgKWPojdd/mhI6WJ7oQkdFNlpKkSl3eMPm4SHU8rFIpLm6mICYnmhGkTN
 BmdQ==
X-Gm-Message-State: AOAM531OJq3O0Q0FkbxhbUt78W9+8SFm8+XQFMxZIsaWFMgpcahq0ZHN
 m2xCkDhzhYgKBlG34pAMq2i2C2LHIFs=
X-Google-Smtp-Source: ABdhPJz08qh+Y9wykGQYOyKY60mxnVKkehpNs/MXkC9fo4jn5/+Q4Yh3z27lTbmTp92wZTvyb+0ylQ==
X-Received: by 2002:a37:9204:0:b0:69b:f7ea:4638 with SMTP id
 u4-20020a379204000000b0069bf7ea4638mr6224438qkd.77.1653049478532; 
 Fri, 20 May 2022 05:24:38 -0700 (PDT)
Received: from smtpclient.apple ([2600:6c60:0:586f:1822:f1be:f903:44d7])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05622a111300b002f90544c7ddsm3250490qty.50.2022.05.20.05.24.37
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 May 2022 05:24:38 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_5A716C9C-A42B-41E2-B32E-E6A977718FEF"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Fwd: Gerrit and Jenkins server transition May 20th (Today)
Message-Id: <3E12FF01-9770-4281-B3E5-33A62426FF1B@gmail.com>
References: <E6809659-C4B1-45FF-A19A-3DF59B598F2D@gmail.com>
To: openBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 20 May 2022 08:24:36 -0400
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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


--Apple-Mail=_5A716C9C-A42B-41E2-B32E-E6A977718FEF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Reminder that Gerrit and Jenkins will be down today for server
transfer and upgrades.

I=E2=80=99ll email the list when done. Gerrit may be up for periods of
time as I test and get it working but no promises on any of
the transactions done to it today being saved, so best to
wait for the all-clear.

Andrew

> Begin forwarded message:
>=20
> From: Andrew Geissler <geissonator@gmail.com>
> Subject: Gerrit and Jenkins server transition May 20th
> Date: May 13, 2022 at 10:12:22 AM EDT
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>=20
> Greetings,
>=20
> The current gerrit/jenkins/opengrok software is running on a bare =
metal server
> which is reaching end of life (it was a great ~5 years).
>=20
> A new server has already been created and some basic testing has =
passed.
> My tentative plan is to take gerrit/jenkins/opengrok offline next =
Friday,
> May 20th, to do the swap to the new server. This would start around
> 8:00am US Central time.
>=20
> As with all of these types of events, I have no idea how long it=E2=80=99=
s going
> to take :)  So plan on no access Fri-Sun.
>=20
> I=E2=80=99ll send up a follow up email as we get closer and keep the =
Infrastructure
> channel in discord updated.
>=20
> Andrew


--Apple-Mail=_5A716C9C-A42B-41E2-B32E-E6A977718FEF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Reminder that Gerrit and Jenkins will be down today for =
server<div class=3D"">transfer and upgrades.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I=E2=80=99ll email the list when done. =
Gerrit may be up for periods of</div><div class=3D"">time as I test and =
get it working but no promises on any of</div><div class=3D"">the =
transactions done to it today being saved, so best to</div><div =
class=3D"">wait for the all-clear.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Andrew<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Begin =
forwarded message:</div><br class=3D"Apple-interchange-newline"><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px;" class=3D""><span style=3D"font-family: =
-webkit-system-font, Helvetica Neue, Helvetica, sans-serif; =
color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">From: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">Andrew Geissler &lt;<a =
href=3D"mailto:geissonator@gmail.com" =
class=3D"">geissonator@gmail.com</a>&gt;<br class=3D""></span></div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px;" class=3D""><span style=3D"font-family: =
-webkit-system-font, Helvetica Neue, Helvetica, sans-serif; =
color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">Subject: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D""><b class=3D"">Gerrit and =
Jenkins server transition May 20th</b><br class=3D""></span></div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px;" class=3D""><span style=3D"font-family: =
-webkit-system-font, Helvetica Neue, Helvetica, sans-serif; =
color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">Date: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">May 13, 2022 at 10:12:22 AM =
EDT<br class=3D""></span></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span=
 style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">To: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">OpenBMC Maillist &lt;<a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a>&gt;<br class=3D""></span></div><br=
 class=3D""><div class=3D""><div class=3D"">Greetings,<br class=3D""><br =
class=3D"">The current gerrit/jenkins/opengrok software is running on a =
bare metal server<br class=3D"">which is reaching end of life (it was a =
great ~5 years).<br class=3D""><br class=3D"">A new server has already =
been created and some basic testing has passed.<br class=3D"">My =
tentative plan is to take gerrit/jenkins/opengrok offline next =
Friday,<br class=3D"">May 20th, to do the swap to the new server. This =
would start around<br class=3D"">8:00am US Central time.<br class=3D""><br=
 class=3D"">As with all of these types of events, I have no idea how =
long it=E2=80=99s going<br class=3D"">to take :) &nbsp;So plan on no =
access Fri-Sun.<br class=3D""><br class=3D"">I=E2=80=99ll send up a =
follow up email as we get closer and keep the Infrastructure<br =
class=3D"">channel in discord updated.<br class=3D""><br =
class=3D"">Andrew</div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_5A716C9C-A42B-41E2-B32E-E6A977718FEF--
