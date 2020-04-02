Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0919C932
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 20:53:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tXKC1DCwzDrTn
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 05:53:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=NLAx3gQ8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FDMpjVsE; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tXJG2fYPzDqNv
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 05:53:01 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id F241C5C0143;
 Thu,  2 Apr 2020 14:52:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 02 Apr 2020 14:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0NWS7h83LBGUZT+AhJgEEgvqt4p
 kC4cpuvHZBXs9YDE=; b=NLAx3gQ8plwc9VxOABp21SRWinItyw4UVyl1UjGs4cM
 mE6oQ9FsviByVwJ7RkEkTk1JLeNQr3PDEovkaV17Ryr9ZTzqf/uHZbtwx1hw066C
 B7BHMp8R0j8mU+7i5hgKLdpP8a4d4/47M7JoLocw5T7RvAMYmBUcqZDmjndDdJyX
 eamwyboVrf82ZfnvfRY8tUCIw3/bBYteUO4MjfyG1WYFziS51J5qQVoReOqVgJoX
 Ml6PsJ0mirz8mwrWs6HFvd89w69qiYo2BnM4zFz+g6+3w+dYaZ161OL7M4EUhxoS
 colUgS163LiuTi/WrWX44zccUEQOzGUyj7wlokWdfQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0NWS7h
 83LBGUZT+AhJgEEgvqt4pkC4cpuvHZBXs9YDE=; b=FDMpjVsEI0bddnq2h5YaqT
 eYiu7DZKXl0TAtGNCDFhlVsQBR2PQ2gDR8IWYEAH6lhE4b98DvT5OD+8quxm4zO/
 6y3ValcXg5qgS19+vKOzKpBgezRQRxDMxrAx8l0X7651C4BM1tNeAmcV07wYsf+Y
 0J7l2iSJlGY0w0snA5arCqLkfDuBcrM+8NEcl96+NuJKzSHMscXaG6eNNzmaiJJ6
 UpoOO0Y0DZjmoB6bONwAnd13a5M00HgP418d2vayzm479HB99/jqc+RQtksBrdl+
 m+u2LhEBtTXhqy6QdZMaGm2HP0GnOTjPG4I3lxXeHJhpwSIQVFhMHU1HeXeiPJ8g
 ==
X-ME-Sender: <xms:gDSGXuWz4VWtv6Y3qHUtXPQVx6Y5bmHfVn8ploAg2vFcXii9Ty5rig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudei
 iedrudejvddruddvtddrudelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:gDSGXjCxmA62xZkb5DA9h7uRv17oqRFYuTkr9lt55IQ0dpJY07q-bA>
 <xmx:gDSGXi0BYkKOa-2J1RVgVNGe0rsz_VWNCQ-JdlHAkfP0b4mVN4-q4A>
 <xmx:gDSGXl29utJNo7W7FWbSJohgWJ9SupqwW9D5cIW5olXpVax1cQhcpA>
 <xmx:gDSGXvJF3ka0KAmNpA8fPfyG6TqoOsGBWQAzpOIp8ldY6AoU3FMzpw>
Received: from localhost (mobile-166-172-120-194.mycingular.net
 [166.172.120.194])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35879328005E;
 Thu,  2 Apr 2020 14:52:48 -0400 (EDT)
Date: Thu, 2 Apr 2020 13:52:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group - Wednesday April 1 - highlights
Message-ID: <20200402185247.GF580847@heinlein.lan.stwcx.xyz>
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <8e3e13eb-e974-4d32-ac01-074a1d4eb75a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
Content-Disposition: inline
In-Reply-To: <8e3e13eb-e974-4d32-ac01-074a1d4eb75a@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2020 at 01:44:45PM -0500, Joseph Reynolds wrote:
> On 3/31/20 11:21 AM, Joseph Reynolds wrote:
> > This is a reminder of the OpenBMC Security Working Group meeting=20
> > scheduled for this Wednesday April 1 at 10:00am PDT.
> >
> > We'll discuss current development items, and anything else that comes u=
p.
> >
> > The current topics:
> >
> > 1. SELinux or AppArmor plans
>=20
> Topic 1 has three points:
> 1a. We would also want to move away from all processes running as root.=
=20
> https://github.com/openbmc/openbmc/issues/3383=A0 Next step is create=20
> issue for each repo.

Have the technical issues all been worked out on that issue?  Is there a
design documented of what "each repo" is suppose to do?  It seems like
kind of a leap to ask each repo to just not run as root at this point.

--=20
Patrick Williams

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6GNH0ACgkQqwNHzC0A
wRktVw//a26Z8Q+PEOs1n63/3V3geEc5Ajqu9XgMLvpqSZnXsFg+i0ZPQ3GkvDvI
SGwS3SKnc9veg+izDbl6B4JMrqYjUXipzAI9vtddD1pTKeIf8JHzx/Qulg5ZD01p
1ATQ3Ps55N056G//NdQnMGz3IEhbKSO7wGT7aRJe3/3JdReX7lqvZPo6NPsPKun9
xCIZAGlenVrvfC73SVzxzTyEolqSjlVJ9GpiVvtaP9Fu+NjSs6VJc+Ttcuewvfwt
VdiSR4LjwhcP9ipPAhiW+R6iUmllVHW3ZckdcP1FzcE1mMKiUxq7xo5OCkwbjdGl
Z2lkw83h3EHjzGeTGeeE/LjAYGFX5Yrtdnn0UcMcjgkbGr6REt44lD305qxn5xjw
bmi9d+VGmsAhr+8kEsvNDp+Y2q+4MVgYvUif5X8UJ+vaklJ9lsxbVDx9afT4VLrD
YuKg/HENHumdKDkrCqh/LLVHqU1vywdmnHzz1Lyr+OXI9o4XT6spRmIIR0417fZA
WRzpSWMCZTsjrrq+l2eq5SVJuBBiNg0HDnrLSQ5KwBLlRbFHmklWO7HCfmpVXRPp
/2lHbjNa+eA67ZdEl/UjH25ZocAisySWSRfh+QuItA7PstWU+cG47bgdpDv06lbV
yOSLowR17LuZqXYl8JIkl8UqnmJdRevC2IdVFfA1iF6yK3XuZgQ=
=nwtA
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--
