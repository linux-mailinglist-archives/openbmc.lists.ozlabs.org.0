Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D762F48F017
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 19:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb9HW4vDtz30LD
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 05:46:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Y9DWjTnZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=I8o+6BBL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Y9DWjTnZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=I8o+6BBL; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb9H75bpHz2ypY
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 05:45:55 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 199A15C0206;
 Fri, 14 Jan 2022 13:45:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 14 Jan 2022 13:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6B4o92jp4gFqgej4vHIc2gqrJr0
 VPm/R+tYyuSITs4w=; b=Y9DWjTnZzwImVBK9+M1nBIyqP3AoVjtwsJ0a/JElm0U
 MrK9I2CsE5TBDKsLF8bnWHjrZlzW2jgwGD2W1m7tdcwS0Naey/U4TLttp/wno4YV
 dKX+DTl6z80kWlq2ZFRrHItTbfU1d9Dy2gYCSKMt75WAPpZzWnlsbz3DybjVDgnT
 /bJ5KNKmxjVH20n8+CZHzkSDrECvyo5lE+cthTJocdkk/Q1JrsajXOC3nqlcPp+r
 0kfJ5iBFIsgl08kvb8w7Kgur7TtudU+hh2zITShzJ006KfqRIM0RMfbNGMWucf37
 8vSUvtkt1idInzQxf8jFZvkl6yiziicy8c0+tb3u0dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6B4o92
 jp4gFqgej4vHIc2gqrJr0VPm/R+tYyuSITs4w=; b=I8o+6BBL8SU8eeoywhS3NA
 wWJjR0vKRcaoQR106wi0x4CUsQiVb82gPtSlKW9o3fTmG6l3Q5stmnMe/D/zoGUC
 5n2c3lXOwS+nqrPnNS/MB3B6/fXgqJiDV5/MMZkEHMkxcYx2qZ/kfSz/BaHvCAHF
 pfxvZX8CED6lrOQ39yNdN6xWlQ4GgWO+bJQtB4h4sWYKilk99fj9tMNsw0pti6l/
 FhUGgTR3Vmpe7H2jcxAxZPO3qIZvJ6ZfoWiMT0FZpEm2563AE6ZXDG5ygMHByek6
 I7gvmGps3s4DvkUuMVDwtkNsrI8SDDIQmB41fx9sEW77mHxP9zIVTeQvGdm9behA
 ==
X-ME-Sender: <xms:4MThYQK8bSjOcIQssdTha2E3Zlem6t3j8pPHBsWpUVr8Wd_kITLMhA>
 <xme:4MThYQL1cCPb5g2DubnuhNq-9lTh817dVCJ_sLQUNI9vyikSJE6Zt6v7Nt-yCl9id
 OoGyiCMyErv4eK1EZ8>
X-ME-Received: <xmr:4MThYQt2cCToemNdjSKv1qfcF1EhrdOKU8rcL-RYaW07QciksNxIWjVGVIQs1fyP7gW-4WepIAFrAcvDz6jIY0GmR8Rt57TV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4MThYdaQ9y5rpKTB02gQvdftU6dGNzsdCtSxi81OD5IVniFddd7nTw>
 <xmx:4MThYXazFMFZWkLlSU5t2jQukd298NwIdqDSeWcLF4S0MywVtzE91g>
 <xmx:4MThYZAJuxTFZIP2cm_gQyA5B1R3s33BzPUZPrkFZsCooekUYUyWpw>
 <xmx:4cThYWl5-rXpTBYxmTiJJAdNpx67edQRap5IuLzNSmqI7WkwjKLczQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 13:45:51 -0500 (EST)
Date: Fri, 14 Jan 2022 12:45:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Procedure for the send review on u-boot patch
Message-ID: <YeHE3qPWS0LpmLIb@heinlein>
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DCUn7KY84hRCvIn0"
Content-Disposition: inline
In-Reply-To: <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com,
 logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DCUn7KY84hRCvIn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 10:40:40PM +0000, Joel Stanley wrote:
> Hello,
>=20
> On Thu, 13 Jan 2022 at 08:52, logananth hcl <logananth13.hcl@gmail.com> w=
rote:
> >
> > Hai All,
> >
> > In openbmc/u-boot repo(branch - v2016.07-aspeed-openbmc)
> > https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc
> >
> > I want to send a review on this particular branch in u-boot through ups=
tream.
> > Is there any specific procedure to upstream it,
> > kindly provide your suggestions.
>=20
> I strongly recommend using the newer v2019.04 based branch for any new
> system you're bringing up.

It doesn't seem like anyone is using this branch for any Aspeed system thou=
gh.

```
$ git grep "v2019.04"
meta-aspeed/recipes-bsp/u-boot/u-boot-common-aspeed-sdk_2019.04.inc:PV =3D =
"v2019.04+git${SRCPV}"
```

I think everyone doing AST2400/AST2500 work has been copying from existing
systems and still pointing to the v2016.07 branch that we have working in t=
he
tree.

> However, if you insist on the older branch, you can send patches to
> the list for it. Indicate in the subject that they are for the old
> branch:
>=20
> git format-patch --subject-prefix "PATCH u-boot v2017.07-aspeed-openbmc"

I think the question is two-fold:

1) How do we get the code into the tree that everyone is using? (Which you'=
ve
answered)

2) What is the best way to get feedback from upstream on the proper way to =
do
this?

Is most of the Aspeed content fully upstream now?  I thought it wasn't and =
was
still in yet another Aspeed U-Boot tree.

--=20
Patrick Williams

--DCUn7KY84hRCvIn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHhxN4ACgkQqwNHzC0A
wRkDFw/+LAlH2gahm8QaZv0nZhr52TVPsUMCs7dyM4YJkRN/BQyvj4TOtncObBoX
V/0CgWktTZ3ldK4rjClVyYekk6Q1DRMwymey97doUxKhcXhyzWjdEdkltzu++A4M
0Q+PHpsawjkzC1i9D6xtReJ8jNdoNI0Fu4VUwbOWg8EGuq3T5V8A9wQ/QdgdliHR
YGERrouJnucv5qK5asx7qbBwbg0w9u1gyMgndwqu4wdbP5f/iTB47l9/hsVe02P1
E/Mu78sHEl8nnm20O8oevC9utfZQEL1M8oYrIOwQkDYkjXe+/z2x7EFoTvPBPxeG
mSubjfyO3HF7RKKEfjP/5MXO+sFwGFmkzcPe7aP6eInCU++wxR3iTicILjJSOOEK
2z3rOORRGpT7YTel3t9DcPJi5G0pukDs7Hu7bPBIrDhDM1B4xqRSRB9a3UHOD/GV
iBH5788BZpluo5A6NBPvCKta8OQL0bxei4KpfPAs8NyawP9AC0UuKQWeSvyBQJpE
gJM4h21HV5oEs7BmkFIW3ycTQWxvehbS2+w6JNehoDnWrCgKVHdZwCSnl+n2D36x
03rNXR+zmLUHFBIWW9G096KSbUTHW6cUvMRRMVavl9nblUzlU3JtOgEgp/PUA0xP
AAhWHaL11EPDmy8orWnTnLpu3S5Mk8sGF12eqrTYAJfTFE41wco=
=mZnq
-----END PGP SIGNATURE-----

--DCUn7KY84hRCvIn0--
