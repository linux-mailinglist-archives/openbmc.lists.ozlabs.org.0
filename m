Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C00D63769FE
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 20:26:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcJnJ5jrWz3022
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 04:26:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nPxPyvvA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nPxPyvvA; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcJn054X8z2yYG
 for <openbmc@lists.ozlabs.org>; Sat,  8 May 2021 04:26:27 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id l6so9569063oii.1
 for <openbmc@lists.ozlabs.org>; Fri, 07 May 2021 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=NeRis/3mQ3sWnN9SVjsM4ko8kFfYACbZu9XqlbRzZX0=;
 b=nPxPyvvAhzC4OIeXRnijIMcK97qGggrBkILOT+RoV0Y7ffWoWSd+n/pQGEp97myc9H
 TmWUTSgHB4M3YWba6wSPrI70l8z9RFsDqJUarMBlL5RJDBi4TUU+DuEKN62mlgCII69x
 O3Rd6MSnkHv2A+PxLybNX1jnnnNsmG0EeVlLKuRN+YdacVgQ8S1HGtQ3XYQrrgDwn/tR
 EhZgQyX0kIK/9g2XkofiWD36lN7nAZFI5IqHSQ4RjX/syO/UVtNOI+2ATJ6BJcdEsRTZ
 J52ODqqHJX9ozu9i6ExtLwn3EoFppK256bAvVoXwCX1geuqWPR7Q8FRm42lQuRKQuR+d
 drgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=NeRis/3mQ3sWnN9SVjsM4ko8kFfYACbZu9XqlbRzZX0=;
 b=J1MiMY+g5e0F+V3mrupluPkKlcvAzJMbZJ9n98j5cnPB/6Oia06Jrw8SJU6D2Ib4lt
 5CYvmUuA811lKeAL1v/c80eRhNpYduw2XFlv6HlHmM08748bddvTQGMiqIxe/cGK3c2E
 tiBwTRx2ocqoMeThw8L7ugThJx7tbE8TQKW1oN/CEg3+K/7Gm2N21nT6zFpWCF1CfvAZ
 vBDmeLoZ1KfGOsXaoyjaaXGIdyYhc47mm5QsGl2qZOT8nyzZegIbW6UuIVAunTqfa+bE
 TU7PORdO/HElT3qzb2FsC8GtPbO5lWArUwwqazvlnD3i1usOJLw2dXQeyXSRfY/r9oKM
 A2GA==
X-Gm-Message-State: AOAM530uk8wDPr6bDYcYZSS4IpIzaiRpdAxQjWyhelbraNUZVn0xRBLo
 DWmzuePnGilRyfad0448eak=
X-Google-Smtp-Source: ABdhPJzCBF3ktqRYxXsOo1a+uDkUYrEVk3CWYmByz7vnqL/tYM4De5kR1VeqOjakLRfuGqNNx1lJKA==
X-Received: by 2002:aca:f2d6:: with SMTP id q205mr7753192oih.5.1620411982207; 
 Fri, 07 May 2021 11:26:22 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:19d8:1a7b:2001:4ddb])
 by smtp.gmail.com with ESMTPSA id g11sm1340337otk.11.2021.05.07.11.26.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 May 2021 11:26:21 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <7DAD0FAA-E02E-4666-846C-1363B45871FD@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F8C2A96C-4CDB-4801-8A1D-1E6FDD18AE6B"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: CI build for quanta/gbs
Date: Fri, 7 May 2021 13:26:20 -0500
In-Reply-To: <HK0PR04MB233989F62E1F9CE2C61AC99B8F579@HK0PR04MB2339.apcprd04.prod.outlook.com>
To: =?utf-8?B?Ikdlb3JnZSBIdW5nICjmtKrlv6DmlawpIg==?= <George.Hung@quantatw.com>
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
 <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
 <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
 <HK0PR04MB233989F62E1F9CE2C61AC99B8F579@HK0PR04MB2339.apcprd04.prod.outlook.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
Cc: Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 =?utf-8?B?IkZyYW4gSHN1ICjlvpDoqozorJkpIg==?= <Fran.Hsu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_F8C2A96C-4CDB-4801-8A1D-1E6FDD18AE6B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 7, 2021, at 2:10 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) =
<George.Hung@quantatw.com> wrote:
>=20
> Hi Andrew,
> =20
> We already fix the patch error for phosphor-hwmon, could you help =
proceed to join the quanta/gbs to CI build ?

Hey George, I=E2=80=99ve added it to our daily build, it=E2=80=99s still =
not passing for gbs though. Please take a look at =
https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,t=
arget=3Dgbs/ =
<https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,=
target=3Dgbs/>=20

Once I see that daily job pass I=E2=80=99ll add it to our official CI =
job.

> =20
> Thanks a lot.
> =20
> Best Regards
> George Hung
>=20
> =20
> Hi Andrew,
> =20
> It looks like it's due to my patch to phosphor-hwmon (which, the repo =
is going through some overhaul and is causing conflicts with). The patch =
in question is in the process of getting upstreamed and the repo is =
settling down, so I'll ping you on Discord once it looks ready to be =
tried again (hopefully by end of the week).
> =20
> Thanks,
> Brandon
> =20
> On Thu, May 6, 2021 at 6:38 AM Andrew Geissler <geissonator@gmail.com =
<mailto:geissonator@gmail.com>> wrote:
> =20
>=20
>=20
> On May 5, 2021, at 2:37 PM, Brandon Kim <brandonkim@google.com =
<mailto:brandonkim@google.com>> wrote:
> =20
> Hi Andrew,
> =20
> `gbs` machine will provide meta-google coverage, so it would be great =
if `gbs` could be added in addition to `gsj` instead of as a =
replacement.
> =20
> Is there a shortage of OpenBMC CI nodes by any chance? Google has been =
providing 2 of the OpenBMC CI nodes, so it would be great if adding =
`gbs` could count towards one of those CI nodes.
> =20
> Yep, google donates two servers so sounds good. I added it to our =
daily build of master and it looks like it hit a build issue. We can =
coordinate in discord if you like but once we get this figured out, =
I=E2=80=99ll add it to the main openbmc/openbmc CI job.
> =20
> =
https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,t=
arget=3Dgbs/console =
<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fjenki=
ns.openbmc.org%2Fjob%2Flatest-master%2F231%2Flabel%3Ddocker-builder%2Ctarg=
et%3Dgbs%2Fconsole&data=3D04%7C01%7CGeorge.Hung%40quantatw.com%7C5daa46384=
b4e4cebf7f908d910a4efb6%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C63755=
9122843370643%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DuFv0h2aHwSVlOU6o330pT9hnRO9i=
5fYc21nUH1Y3ly4%3D&reserved=3D0>
>=20
>=20
> =20
> Thank you,
> Brandon
> =20
> On Wed, May 5, 2021 at 10:54 AM Patrick Venture <venture@google.com =
<mailto:venture@google.com>> wrote:
> On Wed, May 5, 2021 at 6:25 AM Andrew Geissler <geissonator@gmail.com =
<mailto:geissonator@gmail.com>> wrote:
> >
> >
> >
> > > On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC=
) <George.Hung@quantatw.com <mailto:George.Hung@quantatw.com>> wrote:
> > >
> > > Hi Andrew Geissler,
> > >
> > > We have ported many OpenBMC features to quanta/gbs machine =
(Nuvoton BMC platform) and hope it could be added to CI build, could you =
help add quanta/gbs machine to CI build verification ? (I'm not familiar =
with this, if there's anything we need to do first, please let us know)
> >
> > Hey George,
> >
> > Getting a new system into CI doesn=E2=80=99t have the most defined =
process but
> > I think in general it has to fall under one of these due to our =
constraints
> > in compute power for CI:
> >
> > 1) Propose an existing system in CI to replace (and the benefits of =
that)
> > 2) Donate a jenkins compute node to openbmc CI
> > 3) Convince the community that your system provides additional =
meta-*
> >     layer coverage (or some other critical benefit) that would be =
worth
> >     the additional hit to the existing CI infrastructure.
> >
> > We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it =
make sense to replace
> > it with this new =E2=80=9Cgbs=E2=80=9D machine?
>=20
> Jumping on this thread to say that I'm hoping to have quanta-gbs
> support in upstream qemu shortly --- so we could also enable this as a
> Qemu CI machine.
>=20
> >
> >
> > >
> > >
> > > Thanks a lot.
> > >
> > > Best Regards
> > > George Hung
> > >
> >


--Apple-Mail=_F8C2A96C-4CDB-4801-8A1D-1E6FDD18AE6B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 7, 2021, at 2:10 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC) &lt;<a href=3D"mailto:George.Hung@quantatw.com" =
class=3D"">George.Hung@quantatw.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><div class=3D"WordSection1" style=3D"page: =
WordSection1; caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><div style=3D"border-style: none none none solid; =
border-left-width: 1.5pt; border-left-color: blue; padding: 0cm 0cm 0cm =
4pt;" class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: =
12pt; font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif;" class=3D"">Hi =
Andrew,<o:p class=3D""></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" style=3D"font-family: =
Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" style=3D"font-family: =
Calibri, sans-serif;" class=3D"">We already fix the patch error for =
phosphor-hwmon, could you help proceed to join the quanta/gbs to CI =
build ?</span></div></div></div></div></blockquote><div><br =
class=3D""></div><div>Hey George, I=E2=80=99ve added it to our daily =
build, it=E2=80=99s still not passing for gbs though. Please take a look =
at&nbsp;<a =
href=3D"https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-b=
uilder,target=3Dgbs/" =
class=3D"">https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocke=
r-builder,target=3Dgbs/</a>&nbsp;</div><div><br class=3D""></div><div>Once=
 I see that daily job pass I=E2=80=99ll add it to our official CI =
job.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"WordSection1" style=3D"page: WordSection1; =
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><div =
style=3D"border-style: none none none solid; border-left-width: 1.5pt; =
border-left-color: blue; padding: 0cm 0cm 0cm 4pt;" class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
style=3D"font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: &quot;MS PGothic&quot;, sans-serif;" =
class=3D""><span lang=3D"EN-US" style=3D"font-family: Calibri, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
style=3D"font-family: Calibri, sans-serif;" class=3D"">Thanks a lot.<o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: &quot;MS PGothic&quot;, sans-serif;" =
class=3D""><span lang=3D"EN-US" style=3D"font-family: Calibri, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
style=3D"font-family: Calibri, sans-serif;" class=3D"">Best Regards<br =
class=3D"">George Hung<br class=3D""><br class=3D""><o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: &quot;MS PGothic&quot;, sans-serif;" =
class=3D""><span lang=3D"EN-US" style=3D"font-family: Calibri, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; =
font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" class=3D"">Hi Andrew,<o:p =
class=3D""></o:p></span></div><div class=3D""><div style=3D"margin: 0cm =
0cm 0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">It looks like it's due to my patch to phosphor-hwmon (which, =
the repo is going through some overhaul and is causing conflicts with). =
The patch in question is in the process&nbsp;of getting upstreamed and =
the repo is settling down, so I'll ping you on Discord once it looks =
ready to be tried again (hopefully by end of the week).<o:p =
class=3D""></o:p></span></div></div><div class=3D""><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">Thanks,<o:p class=3D""></o:p></span></div></div><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; =
font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" class=3D"">Brandon<o:p =
class=3D""></o:p></span></div></div></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div><div class=3D""><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">On Thu, May 6, 2021 at 6:38 AM Andrew Geissler &lt;<a =
href=3D"mailto:geissonator@gmail.com" style=3D"color: purple; =
text-decoration: underline;" class=3D"">geissonator@gmail.com</a>&gt; =
wrote:<o:p class=3D""></o:p></span></div></div><blockquote =
style=3D"border-style: none none none solid; border-left-width: 1pt; =
border-left-color: rgb(204, 204, 204); padding: 0cm 0cm 0cm 6pt; =
margin-left: 4.8pt; margin-right: 0cm;" class=3D""><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D""><br class=3D""><br class=3D""><o:p =
class=3D""></o:p></span></div><blockquote style=3D"margin-top: 5pt; =
margin-bottom: 5pt;" class=3D""><div class=3D""><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D"">On May 5, 2021, =
at 2:37 PM, Brandon Kim &lt;<a href=3D"mailto:brandonkim@google.com" =
target=3D"_blank" style=3D"color: purple; text-decoration: underline;" =
class=3D"">brandonkim@google.com</a>&gt; wrote:<o:p =
class=3D""></o:p></span></div></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div><div class=3D""><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">Hi Andrew,<o:p class=3D""></o:p></span></div><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; =
font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">`gbs` machine will provide meta-google coverage, so it would =
be great if `gbs` could be added in addition to `gsj` instead of as a =
replacement.<o:p class=3D""></o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D""><o:p class=3D"">&nbsp;</o:p></span></div></div><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; =
font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" class=3D"">Is there a shortage of OpenBMC CI nodes by any =
chance? Google has been providing 2 of the OpenBMC CI nodes, so it would =
be great if adding `gbs` could count towards one of those CI nodes.<o:p =
class=3D""></o:p></span></div></div></div></div></blockquote><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; =
font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">Yep, google donates two servers so sounds good. I added it to =
our daily build of master and it looks like it hit a build issue. We can =
coordinate in discord if you like but once we get this figured out, =
I=E2=80=99ll add it to the main openbmc/openbmc CI job.<o:p =
class=3D""></o:p></span></div></div><div class=3D""><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D""><a =
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fjenkins.openbmc.org%2Fjob%2Flatest-master%2F231%2Flabel%3Ddocker-builder=
%2Ctarget%3Dgbs%2Fconsole&amp;data=3D04%7C01%7CGeorge.Hung%40quantatw.com%=
7C5daa46384b4e4cebf7f908d910a4efb6%7C179b032707fc4973ac738de7313561b2%7C1%=
7C0%7C637559122843370643%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DuFv0h2aHwSVlO=
U6o330pT9hnRO9i5fYc21nUH1Y3ly4%3D&amp;reserved=3D0" target=3D"_blank" =
style=3D"color: purple; text-decoration: underline;" =
class=3D"">https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocke=
r-builder,target=3Dgbs/console</a><o:p =
class=3D""></o:p></span></div></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><br class=3D""><br=
 class=3D""><o:p class=3D""></o:p></span></div><blockquote =
style=3D"margin-top: 5pt; margin-bottom: 5pt;" class=3D""><div =
class=3D""><div class=3D""><div class=3D""><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">Thank you,<o:p class=3D""></o:p></span></div></div><div =
class=3D""><div style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; =
font-family: &quot;MS PGothic&quot;, sans-serif;" class=3D""><span =
lang=3D"EN-US" class=3D"">Brandon<o:p =
class=3D""></o:p></span></div></div></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div><div class=3D""><div class=3D""><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: =
&quot;MS PGothic&quot;, sans-serif;" class=3D""><span lang=3D"EN-US" =
class=3D"">On Wed, May 5, 2021 at 10:54 AM Patrick Venture &lt;<a =
href=3D"mailto:venture@google.com" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" class=3D"">venture@google.com</a>&gt;=
 wrote:<o:p class=3D""></o:p></span></div></div><blockquote =
style=3D"border-style: none none none solid; border-left-width: 1pt; =
border-left-color: rgb(204, 204, 204); padding: 0cm 0cm 0cm 6pt; =
margin-left: 4.8pt; margin-right: 0cm;" class=3D""><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 12pt; font-family: &quot;MS PGothic&quot;, =
sans-serif;" class=3D""><span lang=3D"EN-US" class=3D"">On Wed, May 5, =
2021 at 6:25 AM Andrew Geissler &lt;<a =
href=3D"mailto:geissonator@gmail.com" target=3D"_blank" style=3D"color: =
purple; text-decoration: underline;" =
class=3D"">geissonator@gmail.com</a>&gt; wrote:<br class=3D"">&gt;<br =
class=3D"">&gt;<br class=3D"">&gt;<br class=3D"">&gt; &gt; On May 5, =
2021, at 1:26 AM, George Hung (</span><span lang=3D"JA" =
class=3D"">=E6=B4=AA=E5=BF=A0=E6=95=AC</span><span lang=3D"EN-US" =
class=3D"">) &lt;<a href=3D"mailto:George.Hung@quantatw.com" =
target=3D"_blank" style=3D"color: purple; text-decoration: underline;" =
class=3D"">George.Hung@quantatw.com</a>&gt; wrote:<br class=3D"">&gt; =
&gt;<br class=3D"">&gt; &gt; Hi Andrew Geissler,<br class=3D"">&gt; =
&gt;<br class=3D"">&gt; &gt; We have ported many OpenBMC features to =
quanta/gbs machine (Nuvoton BMC platform) and hope it could be added to =
CI build, could you help add quanta/gbs machine to CI build verification =
? (I'm not familiar with this, if there's anything we need to do first, =
please let us know)<br class=3D"">&gt;<br class=3D"">&gt; Hey George,<br =
class=3D"">&gt;<br class=3D"">&gt; Getting a new system into CI =
doesn=E2=80=99t have the most defined process but<br class=3D"">&gt; I =
think in general it has to fall under one of these due to our =
constraints<br class=3D"">&gt; in compute power for CI:<br =
class=3D"">&gt;<br class=3D"">&gt; 1) Propose an existing system in CI =
to replace (and the benefits of that)<br class=3D"">&gt; 2) Donate a =
jenkins compute node to openbmc CI<br class=3D"">&gt; 3) Convince the =
community that your system provides additional meta-*<br =
class=3D"">&gt;&nbsp; &nbsp; &nbsp;layer coverage (or some other =
critical benefit) that would be worth<br class=3D"">&gt;&nbsp; &nbsp; =
&nbsp;the additional hit to the existing CI infrastructure.<br =
class=3D"">&gt;<br class=3D"">&gt; We currently have a =E2=80=9Cgsj=E2=80=9D=
 system in CI. Would it make sense to replace<br class=3D"">&gt; it with =
this new =E2=80=9Cgbs=E2=80=9D machine?<br class=3D""><br =
class=3D"">Jumping on this thread to say that I'm hoping to have =
quanta-gbs<br class=3D"">support in upstream qemu shortly --- so we =
could also enable this as a<br class=3D"">Qemu CI machine.<br =
class=3D""><br class=3D"">&gt;<br class=3D"">&gt;<br class=3D"">&gt; =
&gt;<br class=3D"">&gt; &gt;<br class=3D"">&gt; &gt; Thanks a lot.<br =
class=3D"">&gt; &gt;<br class=3D"">&gt; &gt; Best Regards<br =
class=3D"">&gt; &gt; George Hung<br class=3D"">&gt; &gt;<br =
class=3D"">&gt;</span></div></blockquote></div></div></blockquote></div></=
div></blockquote></div></div></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_F8C2A96C-4CDB-4801-8A1D-1E6FDD18AE6B--
