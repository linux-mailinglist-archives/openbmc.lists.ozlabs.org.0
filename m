Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D22C2909
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 15:09:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgQrL5xgVzDqLJ
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 01:09:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=cRV2cpNl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Axn+34kc; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgQnY35BszDqWg
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 01:07:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 96A5D12D4;
 Tue, 24 Nov 2020 09:07:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 24 Nov 2020 09:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=742krtv7tWZzceVJ391ODculG6S
 e+xL0ibNN7pITFo4=; b=cRV2cpNl2zzqrCGFiyjg5gb6eoY33vQaDpDVZLyu4As
 LRV+sM0dZKijSx0lhSEO8lNhqDaM7d6psw21Sd2/ASmbNVSM3Zdf+fbQ88VwAKdM
 ikDKzs7AdXdPDi5O5CFQy5LBBXGi+cJsV8hmFisJ9pjOYGeGNfGOGuLORfT2NXLn
 HUKuCf/Xyn9cYdYhZTsi7SVTE81zJh0CbGroo671X2RegfFfDz4xXYGryEMzWAHb
 Oa+I+S6XB1LpTT1mBskJeeh2thQJkqCwEhLy01GtCRBQZfZj1Psn5M07EFGnRudJ
 /VTPk3esgWAZFL50HU/4k0W9/37r2U8VrtGe+21Y9lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=742krt
 v7tWZzceVJ391ODculG6Se+xL0ibNN7pITFo4=; b=Axn+34kcI5vFprRRGYW6Rk
 9S3YfxAgE34gT7g+UxbYUYHyM3SxHTlIfkg4MRUbash1I2vg14wx8OYJ56jYl8bI
 JSGehoF3BqVs/cdY+UJ+7C/7aSGI3ytlq/M9sRj7eRkbuvgH/yPgpV/AosD3rzWs
 yr4lbkKcwZZW/sZkPyooScpAGkskuXfLICDDck3tQfaftSx82WB5MqP/jK3HH/x3
 +nh2Qheij3HET84ytDQF90uyHcelRiaTaRm0gPL8r87exXoE+kvKKGyVEn/evcqB
 WIotDbgF0bUKUThRzTuGdGhlgHm9XAv4AW++BUNyAERrIYUCiD57jkbPElIJw8gg
 ==
X-ME-Sender: <xms:hxO9X_wSF-1-dIIdu7sbgdph_wXV-18mOwugFuiYdx4Cik9DvhpN-g>
 <xme:hxO9X3SZJ_6X6FhLKhR6PgBbs6twCx1qEjxSHZUOr89AT9MkS8CtFU6qjq7s_tuYG
 8siluWScAC6mNZjx1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:iBO9X5XmCtFJMh0rPVCJxC5jIycHZjk9xdPm4tuup92789IzobHHLQ>
 <xmx:iBO9X5h3DdlsjtzcJ_aEE5B4h8PC1mmysMZMPLj7rcgNWkSnECXxZw>
 <xmx:iBO9XxBAktDcDLLOpKgEU2wVavILPtbk3pQbb3ji_zFvNGD1w2gtrg>
 <xmx:iRO9X88G8gT_8dALmwPsoTdfGKqSscpJNBfMS5DhLuIcQmv3IOwimQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D3703280059;
 Tue, 24 Nov 2020 09:07:03 -0500 (EST)
Date: Tue, 24 Nov 2020 08:07:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Venture <venture@google.com>
Subject: Re: qemu for bmc
Message-ID: <20201124140701.GD1261035@heinlein>
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <20201118230938.GA1261035@heinlein>
 <CAO=notwTKgDD20KKXE=5gF4QOeT3SEpuEwrzRRgEkxPYGzFFqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <CAO=notwTKgDD20KKXE=5gF4QOeT3SEpuEwrzRRgEkxPYGzFFqw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 04:29:28PM -0800, Patrick Venture wrote:
> On Wed, Nov 18, 2020 at 3:09 PM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >
> > On Wed, Nov 18, 2020 at 01:11:42PM -0800, Patrick Venture wrote:
> >
> > Hi Patrick.
> >
> > > Patrick;
> > >
> > > I was looking at a patch series of yours that landed,
> > > https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> > > this line you're referencing a device that appears to be missing from
> > > qemu - namely, the pca i2c mux.
> > >
> > > My question is to the community at large, and you also, is anyone
> > > currently implementing this i2c-mux or a similar one?
> >
> > Timely question.
> >
> > I don't know of any current work going on in that space.
> >
> > Facebook has a hack-a-thon kind of event we are sponsoring at a local
> > university this weekend and that was one of the projects I gave as a
> > potential item.  So, maybe, if we're lucky, it'll be done by Monday.
> >
> > I'll keep you posted.
>=20
> Hahaha, thanks!  I'll keep an eye out for your update!  Seems like an
> excellent hack-a-thon project!
>=20
> Patrick
>=20
> >
> > --
> > Patrick Williams

Unfortunately, this was not one of the chosen projects.  Maybe next
time.

--=20
Patrick Williams

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+9E4QACgkQqwNHzC0A
wRnitA//UGOIHiFh9qRtAt++8sZAF6RDk9yFQm/8XeuOaiafyLuNhebwexS7wX2c
y0so3Mzhs3oKgevVNp2rS4ZPnxBpUP3E0xlmNq79xGERY6dtlAkStlj6i7n+5Ycf
W6716UycgLOKiERa8Eo5FM8ALXJkKeUExRspF9f57h7l6xByNivTO3eDvhLH/0vI
C+V85rRp0x+cHkdtd78ibtcQLDpOU7I468tHEacGpGB071NzQJqRis7lbMb/XNAX
PfOYuuIX0DvaW6myIgNLcrbqAZkJZatO+bVjL5OIdyBidPIESSzv8Sxhi9L9/K+W
wBROeV8LAoFNLw3hzRRZgJ2IlU/PZD2L2gmSBxjO0xIujozQSdHT8Y6U4ZwbkFuE
abgOvtKnxXqMzlriVhR8PG0Fqjo8cI9vVYHDA+aw+EUVQLV3ZwrfahLTU2HqXqPW
UICg/wlTOuvMuLShA/qCU34DUEO58ML5RCwI4RbfhPMcQ0s780Hb4js/ONIafAUk
H71/IaBaDAfTCq6qflKjPGn0l+95ymoGyFOwwqViGZINVYdMdeKZ5tZTFzbUnqIH
8oNIXEK5zBQvi4zSJCxMBZVmewHK/X9Ss4nSZVU/OspqFhlVDV7E/GPsSepLU3RC
eLNnZEVpYCE2ANaEXWDa2KnONxxGMfsDBqjfa5rxfnWBUV/epdM=
=F+/l
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
