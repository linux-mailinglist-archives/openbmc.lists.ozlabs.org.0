Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E32135E89
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 17:44:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tsQM4Rx0zDqNS
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 03:44:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.a=rsa-sha256
 header.s=zoho header.b=L6tMK+Er; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tsPb02g9zDqM1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 03:43:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1578588205; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jfkG6MfAHPX1pZP1WcPfELe/mpDDopB40xjDAg1yvhj1BL8NQPcadZw07Y/HNQu1DVGkHeHqNrtCWd7cZ0eYhRdsBLyw9E+M28GFM6pnN7N9nzRRUO/MYOVVXrzB4l2S5h/1qbIGcHiQanQbFAkDpZWiQzLdALZzcGgYJH09mwY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578588205;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=zjy299zeK369Ko5AUG0Q1xDuzV/G3uf7QQjYpdaBn2s=; 
 b=UXprO44bvPLK6YzUUquCGVeuvSarF7/qQeKd641vRINQeDRUh627dtGycvFTs9GyQXIJOiP//BeHTom0y6tF8FcnUtwzPAU7UzT+/924cnlrLBKkSzMrJH+ZRuL+a4r9zfuROsCxW7PuVXBfRfubx409e6hmtKvdOU2VNM7cnXQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578588205; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=zjy299zeK369Ko5AUG0Q1xDuzV/G3uf7QQjYpdaBn2s=;
 b=L6tMK+ErdkEq+XFKvCJZ/26tT6Gwh3eahTzXKE2WpwCBq8dBfW12UuTxzpq3dKzS
 yEEFRVf5CGeyG8iTdNRSEuyuYqOJy1rMaKDrkQ6Xdtp6n8z15A4SeS+qtdXKWg5wDqf
 tGniqpb9gMZ8vtxKpazE2/FvqNOYChiql6NPB3fM=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1578588200044300.1622882173341;
 Thu, 9 Jan 2020 08:43:20 -0800 (PST)
Date: Thu, 9 Jan 2020 10:43:17 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: Aspeed SPI driver upstreaming
Message-ID: <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
 <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline
In-Reply-To: <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: taoren@fb.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for the reply C=E9dric.

On Tue, Jan 07, 2020 at 09:34:03AM +0100, C=E9dric Le Goater wrote:
> Regarding the SMC driver, the maintainers are requesting a rewrite=20
> of the driver using the spimem layer, but we lack handlers to do=20
> the read training and compute the timing register value.
>=20
> This is the first thing to address on the todo list. When available,
> it shouldn't take too long to upstream the driver. Some more info=20
> here :
>=20
>    https://www.spinics.net/lists/linux-mtd/msg09417.html
>=20

It looks like this patch set is still the MTD-only implementation, which
is useful for SPI-NOR chips but not useful for non-flash devices such as
TPMs.  Is there any work or thought into how we could do a generic SPI
controller and then layer the MTD above it?

We have some system designs where we have both a NOR device and a TPM on
the same SPI bus.  What we're currently doing is using the
(non-upstream) aspeed-spi driver which lets us use both the TPM and
MTD/SPI-NOR driver, but since it doesn't have the calibration routines
the SPI-NOR runs at a slower speed than optimal.

I'd really like to get a generic SPI controller driver upstreamed, even if =
it
doesn't have the calibration (the SPI-NOR device in this case is not as
performance critical as the BMC's own NOR devices).  Is there any path
to combining the features of the aspeed-smc and aspeed-spi into a single
driver, or do you think we should start with them as separate and get
aspeed-spi upstreamed as an alternative to aspeed-smc?

Also, do you have any soft timeline on the follow-ups to this patch set?

--=20
Patrick Williams

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4XWCMACgkQqwNHzC0A
wRmz3w//YAAUwbGTtPOVHl7zyWfMmp56bSs531jHmHPsmVeoB1nS6qhbRHb1h1AL
Fxi08rx74NI5gD2+ayIRN+514ASdxljd8l3Glc/sK1flWHTPjeYXJczerFWqjIIo
u9vsw2h8b4fz8GipfgKW7rv1aP2kjZfo7U1E71eQ5kK8xiOCbylYap+xv2x0YUZO
zkP1Eq2WddrgY/meBkPrvVBLsAdZ09Yd2cIPtphBGR8Mp94Xh9IKvAwe7cQR27Fw
R9trd/CQHYCJEgQIhWOiowsiQBi0d6OP9o7/W3Bhhyp9VpYmgdOZG9vN5HDiLdmX
c6AdqkxfjNSUIJ7wKTlqIljfXXcPT/gKoYjqZX3YqqVDIQUFtriKRtwQAMMwW1zg
+pufdlBGKKU7Y4eomeBsE6H7Sckf+xA7UXf3Prf3l9BL7SJtcuNogvrTlrLH6pP8
4CLTkmK/JcuxdYRi65y9iLBv17B0ds4sDNi+2d+zqnQV1BQJBmadHGqwo3pilOde
gCOAWvmv50w7MCxDxSNt7yZYThPXgkX1p/N9cGeWL5xzajIltdP/A+CreX8wPe1B
ggyAq1i748ZQuo+ihOwVpYrNAHqiuY7TnFclJkdWfBgrMIpUkSVYjQn7W4+0u9io
VTvexWfI82LRhxY8lJupE8rgXDprR57V4qKNEOSkHZ3IXOhHISI=
=pSfT
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--

