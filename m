Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0FA151BDC
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 15:09:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BmlY1ln9zDqQs
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 01:09:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=OJ/B8yVz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eo0Iquga; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Bmk75ljrzDqFs
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 01:07:58 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2031C6826;
 Tue,  4 Feb 2020 09:07:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Feb 2020 09:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=v1ltDGm7ixkDwOcYgpABzlKT8E5
 H2Nc/vCC0IlfvEXU=; b=OJ/B8yVzXi3CCsTnDK6sXWj94g/FQOzds9txLopLvKp
 mNNF3GUZF22R4YJ7dqym355R+ObUNWZ2zqa/YS/9f3jfEneFEo5P8nKb8EEIzZ23
 lVYY2GOkJ7AKKywAZzi/OZA3BZYBgLlMxk0zgyU84zehQi6+VaHc0gkqgNIRUNRh
 CzNFLFhH2NzuE/2UtzVw6SFNSR1FaAtnwu619UDHO5YGYmHw5JULHY7rcenHXup3
 y/4F7SYQh1P7LNzhn/4u3heRgVR4fmbr3Ap+exGAYDCDClVtLDCH3Z3a+bcWxl0q
 ecY/glB2BlK8Wtu0rBeIEWj9Iy1rdBH6tvqEDxNpXdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=v1ltDG
 m7ixkDwOcYgpABzlKT8E5H2Nc/vCC0IlfvEXU=; b=eo0IqugaQ2ME4YrAUjLNtf
 x7is8IMTx9CFRx9aTrD48xov0tzHMjIMh6zBdWxLUIMC2SOovrtxcUviQr7dYtv+
 C+q4mx/bagy8mhie5vaIlFijYIUkMYYUGiCrC9oIcSEV2ODyLmkX6o1oLmoE9+cF
 S8Hd2tGYE5zb9duQaJIMvGHT59l8EcXam+x0G2IjcZyxu+N/L5XZRmveabWC/SOk
 plkFznc9RmitHrah1ErhpaGmCb6t/R4Lm3pYs6F6wHdPhOEXK8SqAigLQOfkIJbo
 79o9PsMmyZXP2jcIBV/MDUwqnMSc8eZ45eybOeuILcWtk9b8tDKw7Zas7/I5XGGA
 ==
X-ME-Sender: <xms:uno5Xm-WsJUh7G1LpFnDj8WcqpuUlRDDIIXbScA3ZaCuWPpPVKHjQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucffohhmrghinhepghhith
 hhuhgsrdgtohhmnecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:uno5Xq-80PSzgp5MXykPSv0K8rt6RbV7r8YZOpUb0LKy4kvMRbW2nA>
 <xmx:uno5XnB9ZDsraNRaPx6H4ot44SxLTZAtn3AenuLJuz4vmtaiN9cN7w>
 <xmx:uno5XiwSu2T93O4bKhxjeWye3zFn-5rAFMPcD_f8gk6s6L1raiajig>
 <xmx:uno5XiJz4omBZblTVZ-ufnvyD1jIziA_O0i7G3OvxQa8HdAVut4ebpgNcDI>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60B943280059;
 Tue,  4 Feb 2020 09:07:54 -0500 (EST)
Date: Tue, 4 Feb 2020 08:07:53 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: python 2 deprecation - assistance required
Message-ID: <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
References: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Brad,

On Tue, Feb 04, 2020 at 08:49:25AM -0500, Brad Bishop wrote:
> With poky eaec1c4 python2 is fully deprecated upstream.  If you are
> using python, please move your scripts to python3 so we can continue to
> rebase on upstream.
>=20
> I grabbed a list of impacted recipes:
>=20
> https://gist.github.com/bradbishop/313b4b95014b8b17ff003c579cf6c70c
>=20
> thanks!
>=20
> -brad

I'm already working on sdbusplus; should have commits up shortly to
move it to python3.  I didn't see it on your list though and that is
because it is hidden behind 'obmc-phosphor-python-autotools':

https://github.com/openbmc/openbmc/blob/46ed6f50db610a39db126ebdaa1fcff5de9=
795fd/meta-phosphor/recipes-extended/sdbusplus/sdbusplus_git.bb#L10

You might want to expand your search to include that inherit as well.

--=20
Patrick Williams

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl45ercACgkQqwNHzC0A
wRkNhRAAkiG+EXn+cbY6FCOHuvgN+dBJijrWDBzppZJd6Il1SA4ySzOpRaLnfc2B
65miMGpYG/1hVzRe6fsiWMONdT0gJ3vn1f1P+Mofewo4EN83aihEWUhDDctf4XXq
zzZtmpM1S9eQ/9kpgoNFs4XRmHPxf0qJhHCfbbpYcbnqDlSYKXPs5QJFdgE4xr0G
L30bjQqW03Vg+JsiwXgzIgbJwPmagBfpdVqTN2ij1UJD/HhB4Qe6q1nSIseC+cww
ydAfKKGY7dI9gyU0qcmpDYc494Eqv6CTqnfFqtng7oL3nCgiOqzrVyTCNtcNGdMG
2lgsJsCFi946dO6DBEk7IFKbvBPg+ugUpngQZxYSPN/Fi4kGsUwTpKbrXy2Kr3fs
mk9o/6KrF9n8HH+0ZA0eWalw0uEl3akTazVbhHMzGpk7+Jha0BJKHMxsKzR13OXv
22I5pSLsiHxZ6115GywJB0vGSiHbxc0q6TZm226AwQGVajrnPlGRE/6aNvzuR+91
bODzCqAUPo1fxmot9DqoMLcAZ82L9acnds05PRHaUyyq7YeNHz2zWXxUvYHew5JJ
BnuaTwgGBH09Wfq3ZlhyS+QIyfxjSJy6j/1faLRNM0V2At2+eZetxntwOpWJ6YFl
gvIRk2jOvbMAzw9cMGrLcaWF26tsJdboXf4bw3bwQ0TLBy8VYTc=
=Hhkn
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
