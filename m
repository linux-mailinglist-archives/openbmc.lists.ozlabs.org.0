Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF202B43E9
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 13:44:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZTKD0l64zDqMg
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 23:44:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=y0JQutj7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=n43mZexW; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZTHd65j7zDqL0
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 23:42:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4E4895CC;
 Mon, 16 Nov 2020 07:42:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 16 Nov 2020 07:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=AEs6t657OQr+wOSr6ZG5DP7WiR3
 KN+VJuRrcP16yUOQ=; b=y0JQutj7jziFlMnvCN1HdzL7uN4XuoySsmvzLtlNs4P
 PoPFTVdDimVHU1UCUlt8voIry1zopXUnkYEw/hCSMQLEU0rSRK5Nvl2WUBY5ROPy
 ZRWWmRKbzQpCEzjjChmLxNBWASk/ArvjDQRCsgHX5t/TsSlOo5PYcXiSioh9Ylsn
 GQpyFtqVVf8Nc0r02dDz5pxeVWWrtJPz/EROxjufFosw5jLWBblXVd5iaTMyioO3
 G6889Iet3rmYH8h/z00zIAD24wataG0BeP30UzYz9J65YvsvW9E63SwtpKqzejvU
 T92dFoN31yjLyMCfD1CURe83Yr3fe102fJwRzeESpOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AEs6t6
 57OQr+wOSr6ZG5DP7WiR3KN+VJuRrcP16yUOQ=; b=n43mZexWjtDFv+6LNHJYMs
 uoJgJ3/kKTVc/EBnFO+PnKJHO82Ol+iYKeiPnodfn8TvWNUcNyipWkMB88YtmMGk
 AzOGc8L7Fh/PeMa4YMFOjdDZufBnCeL4uQ4RGZi2e3en7xm6Lbd7Y57/wdAylrcw
 qFZ34mkRPAXwmmGFQDyOKkbCBblnOHQRTmUrYLLAdhItskLh4AC9sIyZvxCyzJbR
 hgKtevb0164l7fTlLlXptVi+wyvld6RZ9ZeRM6VQgbwESweTgH34pN0Q+jD0QLcU
 od3XdqyTYsBoVH8ka3uYQKrviqBoWoY4xztip9ehCcNkB0Pkmx1ZqrRxmRlQLWLw
 ==
X-ME-Sender: <xms:t3OyX-wfOirDzuSo-IQmKyatZx_EWRtCaMbu8XYgcw2YN_VSIsBBlg>
 <xme:t3OyX6S785AIsiPupXNXA95QZYn54rARdiJY3xSwNATw_HSpBcD-7YkqaazNx3MCN
 K0kVZKX1MagmrLSQps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:t3OyXwWV7NxHp5QdqiEL9khzgP6U18UT408lFfvNoyD0rwivM9a3sQ>
 <xmx:t3OyX0hdHZrA3rXPlobd0UvpTrJA75Hq879F_vV8eoIuT7mP2NJ6Sw>
 <xmx:t3OyXwAs86qjnHXkc98pLNUJF4aWL7igSogOfxqtmGbXnCrCCPTDBw>
 <xmx:t3OyXz8Fdws2jHtScyJ9ixBBm5l16EJL5djYk0jss_jICf4wj-oc2A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FF9D3064AAF;
 Mon, 16 Nov 2020 07:42:30 -0500 (EST)
Date: Mon, 16 Nov 2020 06:42:27 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Alan Kuo =?utf-8?B?KOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>
Subject: Re: Requests to create a repo in openbmc github
Message-ID: <20201116124227.GC4495@heinlein>
References: <39e45d166da14a83a3fc0e63ea73f14c@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline
In-Reply-To: <39e45d166da14a83a3fc0e63ea73f14c@quantatw.com>
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
Cc: "benjaminfair@google.com" <benjaminfair@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "ed@tanous.net" <ed@tanous.net>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "rhanley@google.com" <rhanley@google.com>, "ztai@google.com" <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alan.  We'll have a discussion in the docs review to see if this
fits better in an existing repository since it is a fairly minor
feature.

On Mon, Nov 16, 2020 at 03:21:25AM +0000, Alan Kuo (=E9=83=AD=E6=8C=AF=E7=
=B6=AD) wrote:
> For improve security, we propose a daemon that generate a self-signed htt=
ps certificate once the hostname is assigned.

I don't think that any self-signed certificate does anything to improve
security.  Any self-signed certificate, even with a valid hostname, can
simply be forged.  Finding a self-signed certificate where the hostname
matches does not give you any additional confidence over a certificate
without a hostname.

It doesn't look like you put this wording into the doc, which is good,
but we should not have it anywhere in the code either because it gives a
false sense of security.

--=20
Patrick Williams

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+yc7EACgkQqwNHzC0A
wRl7iA//ZGjbbSXJXsNLyoKpGwcDc4gUrmQgEVYRPtM35gGJ/8+ayPC7BAJExMCV
wvvpt5IH7McUvOIdEGM7kvIOR+QNlLZG36qG2QWvoOEAxyCMvwmMZZywDCB3puAp
Tl4IcnlcSVZe0qQlTItrEzrPOrAHid35HvMghOKM3nkz2jbBCbTATx7fb1atKeIS
L5A1ftfOXFDCk7xIJf6XicHvKiVMdXf4hYI/FLSKx17/nmEpIk9lhLOwlE3baIvu
9D3giLcCXTR4tIHGnNM6kaKy6VbuN1ydIERpqCp/4c8iA0uKG7GLiT2YY6COB+Lz
Tm3TVho9hTVFsHcZSV8mh7mP5Su2fnHVHPyEM9JkP7R/g0LqAAisdG9TfLg3fFPU
9d9ZN4vt7AtQLAdu8dyQhlLPK+qQDKwvNju9JnA+J9GNTBv0dUl3myJ1I3Joyys0
i0haD97W1PVqlI5qDmnm4Z1plrDmCgq5u7XDLAynCGodn6HcVv8bZDLEY7P1eqFz
T2CdZdszWeLwlTKMUi7/a/R//1c2xaspFhnZjetF2YyPBJEUSQvFW5P4UhSgPK6w
A9ZtYI22Vi6vkxfxECqKzVM0KQuuWxmLtmN4PGJIItZBepvNW1DkK4v7IzF5XPGh
vF0JgKXpKFQqbcEmSyVxE7Y+Q7fpedtVAY4ST9o1HF2hPcMYOrc=
=p4Tg
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
