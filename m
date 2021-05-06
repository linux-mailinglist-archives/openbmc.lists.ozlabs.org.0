Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172983754EE
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 15:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbZRq0C0Mz303y
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 23:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rcHvD66V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rcHvD66V; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbZRW4BsGz301K
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 23:38:45 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id d21so5475675oic.11
 for <openbmc@lists.ozlabs.org>; Thu, 06 May 2021 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=vnrv6RTm6RWMKDXEPrKui/uiq9uM01YwnB/Q9hEsNVY=;
 b=rcHvD66VBHG3PBpZG/reLv7j5Z4zU9rqn/JSYZbzePEQY0xkl49jWJduV2lUMrmln+
 h31r6o2FvMbiAXNKePjTgZInKNhP+Efnn6iv6Os1LnckpVd7xoQUW4/4UMVLeRBARlIs
 7bZfzymQqw73qj3ealBuHpzSjxMpzLCA8Mm6pIRyMU2bQCfNdOQb3QESUMeY2bg2xAjJ
 xBQcO/Dkhz2WglaXurEw7Q3A9mr767jwpF6q5RWqdkPrn1JNDaNw3l/B9vZwbfX9nLWs
 2MtsAsF7n84326rmbfMSpBF5MUGXcCwl7qL3L1/Ueiyz7BYTuj7aNAkXtYSE/bcPJ89C
 GEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=vnrv6RTm6RWMKDXEPrKui/uiq9uM01YwnB/Q9hEsNVY=;
 b=pbHucquCCtscb0JjGjUwT5gNOMQTKjR26PLFI2eEygthDNBLoKeVYhzOhPWQ6VkxRd
 PKp0dsqYBEsSr3bkwXrVG3kgf53p3TFx043wyMi3Iue1MIwnmiVLlS2abnprNU1tmYyx
 xpo5YW14IG7tpWHPtwQ2aStFvvupGOHR26bxFta7hzWLhBhEJ7RpgWa1cvxdbFTqxOyL
 4fMInQra1mGSBeoUmcFcOeGPLvDrDEb3rXVSyECaY7fTrCwL8swNdpaGkQK9bwA2Uuph
 9n0uViuQa4dt/qwdI76FHj7PBl3EsAiOIfnrRzPFHKG8SIcdxbx9766WtL8h4y4CRXrl
 1XSQ==
X-Gm-Message-State: AOAM530D2x9PYGkvH5bBizw2nLdxarLuNUsD46vYOEO7rmyPS80XGSvO
 TqmC+R4+Vd84Ty7i2IHmHLM=
X-Google-Smtp-Source: ABdhPJwfL/rKIxN+CJ7TTsZA/agovIepW07M+JCmlJKFXoCxseQaqJrNURwuVnh3BCcLWR4BNK37TQ==
X-Received: by 2002:aca:5c87:: with SMTP id
 q129mr10373894oib.163.1620308321938; 
 Thu, 06 May 2021 06:38:41 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:ed7c:f180:48f0:869e])
 by smtp.gmail.com with ESMTPSA id g11sm564341otk.11.2021.05.06.06.38.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 May 2021 06:38:41 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_BC847439-5E6C-4841-9F1D-F583497AA3A5"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: CI build for quanta/gbs
Date: Thu, 6 May 2021 08:38:40 -0500
In-Reply-To: <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
To: Brandon Kim <brandonkim@google.com>
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?utf-8?B?IkZyYW4gSHN1ICjlvpDoqozorJkpIg==?= <Fran.Hsu@quantatw.com>,
 =?utf-8?B?Ikdlb3JnZSBIdW5nICjmtKrlv6DmlawpIg==?= <George.Hung@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_BC847439-5E6C-4841-9F1D-F583497AA3A5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 5, 2021, at 2:37 PM, Brandon Kim <brandonkim@google.com> wrote:
>=20
> Hi Andrew,
>=20
> `gbs` machine will provide meta-google coverage, so it would be great =
if `gbs` could be added in addition to `gsj` instead of as a =
replacement.
>=20
> Is there a shortage of OpenBMC CI nodes by any chance? Google has been =
providing 2 of the OpenBMC CI nodes, so it would be great if adding =
`gbs` could count towards one of those CI nodes.

Yep, google donates two servers so sounds good. I added it to our daily =
build of master and it looks like it hit a build issue. We can =
coordinate in discord if you like but once we get this figured out, =
I=E2=80=99ll add it to the main openbmc/openbmc CI job.

=
https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,t=
arget=3Dgbs/console

>=20
> Thank you,
> Brandon
>=20
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


--Apple-Mail=_BC847439-5E6C-4841-9F1D-F583497AA3A5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 5, 2021, at 2:37 PM, Brandon Kim &lt;<a =
href=3D"mailto:brandonkim@google.com" =
class=3D"">brandonkim@google.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Hi Andrew,<div class=3D""><br class=3D""></div><div =
class=3D"">`gbs` machine will provide meta-google coverage, so it would =
be great if `gbs` could be added in addition to `gsj` instead of as a =
replacement.</div><div class=3D""><br class=3D""></div><div class=3D"">Is =
there a shortage of OpenBMC CI nodes by any chance? Google has been =
providing 2 of the OpenBMC CI nodes, so it would be great if adding =
`gbs` could count towards one of those CI =
nodes.</div></div></div></blockquote><div><br class=3D""></div><div>Yep, =
google donates two servers so sounds good. I added it to our daily build =
of master and it looks like it hit a build issue. We can coordinate in =
discord if you like but once we get this figured out, I=E2=80=99ll add =
it to the main openbmc/openbmc CI job.</div><div><br =
class=3D""></div><div><a =
href=3D"https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-b=
uilder,target=3Dgbs/console" =
class=3D"">https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocke=
r-builder,target=3Dgbs/console</a></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">Thank you,</div><div =
class=3D"">Brandon</div></div><br class=3D""><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May =
5, 2021 at 10:54 AM Patrick Venture &lt;<a =
href=3D"mailto:venture@google.com" class=3D"">venture@google.com</a>&gt; =
wrote:<br class=3D""></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, May 5, 2021 at 6:25 AM Andrew =
Geissler &lt;<a href=3D"mailto:geissonator@gmail.com" target=3D"_blank" =
class=3D"">geissonator@gmail.com</a>&gt; wrote:<br class=3D"">
&gt;<br class=3D"">
&gt;<br class=3D"">
&gt;<br class=3D"">
&gt; &gt; On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC) &lt;<a href=3D"mailto:George.Hung@quantatw.com" target=3D"_blank" =
class=3D"">George.Hung@quantatw.com</a>&gt; wrote:<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Hi Andrew Geissler,<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; We have ported many OpenBMC features to quanta/gbs machine =
(Nuvoton BMC platform) and hope it could be added to CI build, could you =
help add quanta/gbs machine to CI build verification ? (I'm not familiar =
with this, if there's anything we need to do first, please let us =
know)<br class=3D"">
&gt;<br class=3D"">
&gt; Hey George,<br class=3D"">
&gt;<br class=3D"">
&gt; Getting a new system into CI doesn=E2=80=99t have the most defined =
process but<br class=3D"">
&gt; I think in general it has to fall under one of these due to our =
constraints<br class=3D"">
&gt; in compute power for CI:<br class=3D"">
&gt;<br class=3D"">
&gt; 1) Propose an existing system in CI to replace (and the benefits of =
that)<br class=3D"">
&gt; 2) Donate a jenkins compute node to openbmc CI<br class=3D"">
&gt; 3) Convince the community that your system provides additional =
meta-*<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp;layer coverage (or some other critical benefit) =
that would be worth<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp;the additional hit to the existing CI =
infrastructure.<br class=3D"">
&gt;<br class=3D"">
&gt; We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it =
make sense to replace<br class=3D"">
&gt; it with this new =E2=80=9Cgbs=E2=80=9D machine?<br class=3D"">
<br class=3D"">
Jumping on this thread to say that I'm hoping to have quanta-gbs<br =
class=3D"">
support in upstream qemu shortly --- so we could also enable this as =
a<br class=3D"">
Qemu CI machine.<br class=3D"">
<br class=3D"">
&gt;<br class=3D"">
&gt;<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Thanks a lot.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Best Regards<br class=3D"">
&gt; &gt; George Hung<br class=3D"">
&gt; &gt;<br class=3D"">
&gt;<br class=3D"">
</blockquote></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_BC847439-5E6C-4841-9F1D-F583497AA3A5--
