Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 614104E9846
	for <lists+openbmc@lfdr.de>; Mon, 28 Mar 2022 15:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRty82Jv0z3c2Q
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 00:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=D0kzSTq/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=D0kzSTq/; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtxm4yrtz3071
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 00:35:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648474523;
 bh=NfSRIzvzOPgU4rZ4xpgMRIXSS+N3V0+Ii+jGxlTZq5E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=D0kzSTq/FCQpdZRfcQx5HrPzqfiREQsAmtCed0R91VFj0oN/ymhy6uc+HsEFYd/WK
 vyjagMABiO1BKdOkyhuJ7iuYcYOSSa9vf3deQBwKyH1VdStR2xVP023B1NVoR5fj88
 DZ4bu+pwzQyDdbemXO2DW6kyPCxkoh3Z2lB0ek2Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1nN3y00Tep-00O1oc; Mon, 28
 Mar 2022 15:35:23 +0200
Date: Mon, 28 Mar 2022 15:35:18 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkG5lsXhNk+9ulnl@latitude>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
 <YkG3sQ3MDhVoW8l4@Ansuel-xps.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fF1LzePeKn57rJis"
Content-Disposition: inline
In-Reply-To: <YkG3sQ3MDhVoW8l4@Ansuel-xps.localdomain>
X-Provags-ID: V03:K1:qrlsZgi0Jlf5u32fwM6O7HB37vWISNYC2WTXBzEgnEUsaV8YaNw
 c3UuZWLJ+6kLvFkIEoGMdp/pY0xTM+H2S6Fg6FRdbibr+FtHBJSNmaMWRBPDJ6JWpI8ALlv
 xfvEbk/BLLn/YarzsR+ub+9viR80VK3a+J2yS7G8ktIyRuzmg9ViY8j72BhfFQFHHhZLLB+
 SgbBh2uDTnWNV+hXMQqHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MP+QskqFt+A=:uJofwvdWLtPOUsKxTtMRfW
 gxZRiIxqEgwxjrMywxPkJFoGhDNufjdlk39PoTohNeXdVyRnq90HET69O3eg2idoyCMY3SViO
 8h8rI8iQ8AIAX3kbhwdDHKi0L1qpo9AkOU6QGA0ylsV+3YB2X+RkPLmXC0cKcI4GsOD9GS0ar
 /uQ7PtRRHZc3Fg4GkUeK32qKIa+Kgf72YQHSGqbcz3zP4LRAnIgeKYl+4PeLZhQW0LVcv9TSY
 wRVeWcImeQqhu3NR9HzIw1MY2zCPyd/uhapAxn6FkkKg99pghPEhjoA6Zh7mHukMN4BAzt4ss
 0C4pXpCtLGl5UsbtASkZq+LhKbqO6QKTooICMBieIQcCNB39/HawAX4s7QtrPq7mNRZFSP8BN
 qHmjvMdVL0w6NXnIJ1O0a3Q4+Su3K/myV7F0tL3ypBC8y4ri27OiIQJqKg0TncNUUKXHD1YuO
 aHOMrwT8+tXErPEkRcjlV/p2f6AOt4HukuGlxII0nECqvi3jn5+k5vnBT9XJzysiyEnEU4gEL
 37kreFpUWVFwxXKBvuKH7kYMEJ5Y8Vbk3oFPWaEk7BFjeKX+ynQWKz82wROInu4NAn1msyRDH
 ahbTG9ZMrBeaignIG+D+xD5yIyAdjSv3ubh26T/w21aa+UNEx7aESH+H8OUK8Mf+u/xvSrzbO
 m7J8KLOCvfp5hw78x8EmXqE1P6z6MigI/vko7xIa4ax2wZwxqNn2E0b25iXFlHprK2RllbPY3
 ksUgfDw+fBOYIksvmkgFNntDVa/GEsL0AJRop45lRdj2449MwCWyX/yFjEdqYfRKeZuVC81BM
 i53118dVAebWLW0kE621qMPziCiX9AZe3KPeQmp9issm52vwKRB5sdBmgo1qgEmUPZETQuALl
 wsla0jmnMSYsbCKDf6kp5IxP/PS6bCFr7xmyKniy2wt4M2KWWffr6iJlpyJ4NnKOxaAGDwYox
 cQxxKRYBCzEekCRZR8KICGi+/6L0rH5i0SciI/fLkyX3nUuKuEB+uFMSYHfEVwGll3VLHadN8
 vN+qrpfwR+EHWZQk7XZ2dfoYQZfIYIiIwV+GoN6Tm3nLeDq4wRSUEXuQU6QpGLyEWoDi0ig9M
 aTSqjPozVHNams=
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--fF1LzePeKn57rJis
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 03:27:13PM +0200, Ansuel Smith wrote:
> On Mon, Mar 28, 2022 at 03:21:08PM +0200, Jonathan Neusch=C3=A4fer wrote:
> > On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > > Hi,
> > > as the title say, the intention of this ""series"" is to finally cate=
gorize
> > > the ARM dts directory in subdirectory for each oem.
> > [...]
> > > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
> >=20
> > Nice idea, thank you!
> >=20
> > A few notes on categorization below.
> >=20
> >=20
> > >  create mode 100644 arch/arm/boot/dts/broadcom/Makefile
> > >  rename arch/arm/boot/dts/{ =3D> broadcom}/bcm-cygnus-clock.dtsi (100=
%)
> >=20
> > Or maybe bcm instead of broadcom. Not sure which is preferred by
> > Broadcom people.
> >=20
>=20
> In arm64 they used broadcom so i assume the full name looks correct.

Alright.


[...]
> > >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> >=20
> > armv7-m.dtsi is a bit confusing, because it contains a few devices at
> > fixed addresses, so it looks vendor-specific at a first glance into the
> > file. However, if it is actually as vendor-neutral as the name implies,
> > I think it should live dts/ directly, rather than in vendor
> > subdirectories.
> >
>=20
> Considering it's really just 3 binding IMHO it should be just dropped
> and merged in other dtsi... But lets not extend this too much.
> This is really just a simplic link and armv7-m.dtsi is placed in dts/
> I create links in each oem that includes it to skip any changes to the
> dts.

Ah, I missed the link bit (hidden in the file permissions) :)
I agree, this is something that can be cleaned up later.


Jonathan

--fF1LzePeKn57rJis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmJBuUMACgkQCDBEmo7z
X9ur/BAAxp7NDDTo4RBniT+eRykNPIJqV8+GHgUE3wvhGZOkoojmuiOEbi9oqjeS
b2FyMFrZ8yEgl87fra/tP0pq11rAHFlgTJFIS8WxfNyA8OH70j0pZN6C30ZpUst4
W4SXDyfvQfyzM6W2xfcpb+TJn4v0CX6t0HL0/Oy3kO8KzP9fuEi9Kn7Zi9kIM5U8
BZ2K0MueiWCobUaQYTApyJs3oFAD2QoHyT+u9wQasbUKyLZcuMaNrSjIV84rs+9y
UlsIw5CVbqbrUAwLJqZFjW06DO86JwmvLtn3AT1tpC3enzoPuQUqhGfKh9lYRfRe
DWaQr7+81KMWwO4MvMPjzOYpE30ejDnoKQUN1hQpVnQn6n/to0xZBTEgm5t4453c
YBBUPG4z1Na8V671xU7Z1vhOtDHhcBhlPdvo5Jjyb3BLdAeKaQxXz0PEtW+/8HYE
ds1ajff627fAyrlTf89qzY0Hr9dfh9Ig8jLOiiMsXhoOpEp4/G5dGZhl2rj4XlkM
arHIOOSO+2Inoa1WnCvxI0qFSCP7oFvB6mZc6mbrKssh3nB/InQig4rPZvvf8bwY
PGxmj+VaapfZwxRXSI6cEpAlmFk3sWeWD/Qm2Wgm6iJV30OVPSaaYQN5A2ZxNiVg
oDJI2Sthg7qN10DGIscE4FqOVhKJ4KrhCosnkONoYhjYsC1ZxoE=
=sVOd
-----END PGP SIGNATURE-----

--fF1LzePeKn57rJis--
