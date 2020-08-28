Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D50255A54
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 14:37:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdJyk6C7mzDqLs
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 22:37:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=cY7PIY1i; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YdvepzPs; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdJx93fQfzDqrV
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 22:36:12 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9D1E7D25;
 Fri, 28 Aug 2020 08:36:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 28 Aug 2020 08:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8ohfJwDdWDwKNegx5wtvXLRDQ7I
 CJLA2O+teu3I5y4w=; b=cY7PIY1il/0wZX5vuNteV60cL/cuy5jPS+bnnqYIpNO
 iaNb3x5F2N86vB9e3LD+ZVwNHTBKI39F8HZbvI4BqZjD4t4qg2fNVte01TJUiwOo
 0HJTstqnAqALlAPQgrcYLt+IwyZUW19rlitVfGoux1TvPGeeUF/ZYgEH1w78bqnO
 nhMPDVzceCuO0tITdBT+xwR8dnMx/EeVS5kQQVxYLRSAA+7w5FVIWlBvQs+Utsp/
 YH8uR3JPpqMJtClqhBtET1yUqYRf5a9E7ttJTm4O8NtZMTeQIrSi0VmXykOHj2Fl
 E4HhRRYJKYMLzJm2RIh0eEzk9PZTzB+wKHo4KEsJdUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8ohfJw
 DdWDwKNegx5wtvXLRDQ7ICJLA2O+teu3I5y4w=; b=YdvepzPsWT00/HjxT+giV/
 cATmUXivhynNodGJiiPgWYpvrzTY0GND4wyJo1QKZoBorIN7bG2t9ixQbS64biPc
 2cwAzTvNSp2phaGg73a3VwvY3x3qg4sDgYW9jI7WPFrS4kotnit1wozUMNXB67w8
 80LpHyPTr/6PfpUGIruXrqdMDVUlnqWb5Hh4X1+0X2Qf7EPkjWE/v4tKHYeHX50f
 zv4ypP3AGs8hj6dpYl7VM0+NnkNodWPh207UiOPd0i3VmSUiTOWmuauJ2JapzQJq
 K/QoGmteXY2BstHO0uDclsvxZZmQxWNAHcLugJ/f5yBC9muqRoorI/P/WQZI2N4A
 ==
X-ME-Sender: <xms:N_pIX1_zc88U9hGIVylnZeHWapHm3BwaGhzcR6DSEHgj0xFKPwjKhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvjedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:N_pIX5sVkIbtvw1awQQymJxeZ19-XuzFkdecZ_5N3d_zkcYrKbpvfQ>
 <xmx:N_pIXzDNBgvXQgttSibK54Xiy30NKBoIIxaj7Jb2Dafo7AJk-Wx89Q>
 <xmx:N_pIX5fpYduG-9049MeB4DDcfyqpaFjpoXK0fXXW_zTeRcpd_D5Ccg>
 <xmx:OPpIXwbLJXwBYbVTHKKJthxvb5CMY40Tnb3ksCom_vfVVE7yk5a5Ag>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 891663280063;
 Fri, 28 Aug 2020 08:36:07 -0400 (EDT)
Date: Fri, 28 Aug 2020 07:36:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Subject: Re: Is there any reason or practical value of staying with
 https://github.com/openbmc/openbmc/tree/2.8.0
Message-ID: <20200828123606.GN3532@heinlein>
References: <fd8d46e97bc742b5b8dd9325f3835326@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U6leaJ20qZQc29iB"
Content-Disposition: inline
In-Reply-To: <fd8d46e97bc742b5b8dd9325f3835326@SCL-EXCHMB-13.phoenix.com>
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


--U6leaJ20qZQc29iB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 07:27:43PM +0000, Bruce Mitchell wrote:
> Is there any reason or practical value of staying with https://github.com=
/openbmc/openbmc/tree/2.8.0
> vs just using https://github.com/openbmc/openbmc ?

Hi Bruce,

I think the answer of if you should use a tag or master entirely depends
on what you're trying to accomplish.

If you are developing a new machine, you should do all your development
work off master.  Working off a tag is only going to cause yourself more
work because all of your work will have to be rebased in order to get
merged.

If you are releasing an image to production or customers, you need to
decide what your release process looks like and in that case a tag
_might_ align well with it. =20

At Facebook, we strive for CI/CD in all of our codebases.  In general
that means we "live at HEAD" and try to deploy directly from there.  We
do not have a need for any long-term maintanence on any particular
release because we are always releasing a new version anyhow and
continuously deploying to our fleet.  Therefore, it is very reasonable
for us to work off master in all cases.

Previously I worked for a "commercial server" vendor, and fix-releases
were very important for their customers.  There was an expectation that
a major release version would get security and other critical fixes for
years.  In a situation like that, I would certainly recommend starting
with an OpenBMC tag as the underlying base for your own release.

In any case of a release, I would expect that your company is taking
some point-in-time from OpenBMC (master or tag) and then doing some
qualification on it.  All software has bugs, so you're likely going to
find a few, and you'll want to backport the fixes into your own 'release
branch'.  Right now, there is not a strong process for qualifying an
OpenBMC tag and/or backporting fixes onto it (for example to make
2.8.1), so as a vendor you are left to do this on your own.  I suspect
that this is an area where the "commercial vendors" could work together
to create a stronger release qualification process and it would benefit
the community as a whole.

My understanding is that IBM's own release tags are available at [1], so
maybe someone there can chime in on how they manage these and what
collaboration they might like.

You really could start at any random 'master' commit as the underlying
base for your own release process and with today's process it is
probably just as bug-full as the current tags.  I would still recommend
starting with a tag because even today we align those tags with an
underlying Yocto tag.  The Yocto community has a more well-defined long
term support process on their tags, so you'll be able to get security
fixes in all the underlying Yocto packages straight from there.  If you
take a random commit, you're going to end up being responsible for all
of the work with Yocto backports.

Hopefully this helps.

1. https://github.com/ibm-openbmc/openbmc/tags=20

--=20
Patrick Williams

--U6leaJ20qZQc29iB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9I+jQACgkQqwNHzC0A
wRkYCBAAjnNr90eHliqj0StR3Ol/m3JUkTQuXvBnq91GDgoLIh7S27852h7IXS2M
b4Fccu589F7c+wO7ppTx/+Ae6p/uc4yyiOjNj3gOYgY+RbT3fS5GNHIXcQvmn6HK
QskQWhmnByM0Yq9XM68veDcB4roHR8jUqt8W343+UlFToEOe79Wu96mZ2drwI8AU
OzzCQAa+W+rbYYJ6k1oLYzwOWxkvB00JI6O8DtuuUETDY9RfrKiSqrcUG6V/l2TS
by9hBpPZCc2CqAvrK+O/tI//xNbu/14z23guBZyQbtptxBDH1Up3iDoodt+siXJO
iVAiXzWHk9XItk0SYIFOf4O/SjST5Dg5f3kclK2wLmUen37sxlcMfNGWEJbUDsyz
b2IpqtUbC6ILtlWkZVDgGXvvxUv72GHE/+dA2dwwNp1A/P64Uy8M+91AVlOKnmjG
HCEOFx7cUKDvNc3kVNChHXnA5TG4x9EJ0OConUFXJ+5vuXjDkSV6vWtFWw1ttoAn
cLlQb6NT8AWvrycLmkfzEOxf9IEmpWxNlbwsdP1uza2h7m43m+NSNaynv1OeDmNb
FXe+xC18bQPkV6ccQKXWLsaiEt1jEcGAoMqNcCpG7i9zTx2REzWi1s/M/gdTNt4o
LmvDyjbcUhNd3NGQnIw4/lBO1FlL+QqB4k8a90NVZwx6lOgcTrs=
=ORAi
-----END PGP SIGNATURE-----

--U6leaJ20qZQc29iB--
