Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB3250AE1
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:29:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4yr4BPWzDqHf
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:29:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=VoZfTJbE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=W0ImVrit; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4vp4nCmzDqBl
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 07:27:17 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 64F4F5C00E6;
 Mon, 24 Aug 2020 17:27:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 24 Aug 2020 17:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=WvBerpkod8Gh1u6UZeRWY7dEZae
 9B4upi8rTZKNu3PI=; b=VoZfTJbEHZdsMSuT0b0MvWmMY5SIhrZbrjqHYPHTzI3
 MbxeDf117oii7BOqXzuiKF2gv8LsLMptOiXmRh3pL7Tvo+B0Vmuev5WJkyO3do2W
 84Imp7j73xRQzvDfnUZdb5r4+X2Us/akwEDlGpVanV5+SZ9TE35N50kCG4oNkgef
 E6XXZdxc1Ji2l1V3iB6xNgSwN3TggXAT1hDWRSTFW4kHwHALpujqqfrAE85Izp+3
 k5YVIiJLCysjOTj13zbxx0BGeVxx+InQXmwgUHzeED0uhXSkXXk9VEXDU3HJCGqb
 8MSaAkrY+pdinxSRB+np0YPK2kgRlopx5qjYeSATTqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WvBerp
 kod8Gh1u6UZeRWY7dEZae9B4upi8rTZKNu3PI=; b=W0ImVritJ8mogAc5YUGUto
 0uKE27534mGpDHVVnmkBwCgP1x70cSR9cxonJXVZ5cY5ZB897t37SP26/bpSqHvn
 hnhLqRaNvU09vWo4PsGYmqYUtPKs7r15L52vQn7cejBzw6HPeOp/yr/vs1Yvg4iv
 zsr/uVyjMmHv3PPV+8Nj6Jj9f/O+KnCIVZLly7GT9F36DTDE/zhaMYOuh8yX97ee
 YQr/4EOS8/p1LX0dpuoTq3ddvNHPvaUFhzfDNwqWRY9YKG9Y6GXKf1Vy+njRHCG9
 XrMFcKY3Dp7fqSP3I0m2iaHJUJW1AmcJV8SJrx4iueGQDlTK4vGZrbKODkB47DyA
 ==
X-ME-Sender: <xms:pzBEX3qolPnXiUTq4S-PHbfskNIakQA3G-ce_vBFq76UG1X5O3RgEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddukedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudef
 heelfeehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pzBEXxp0FzhqvIHYMmCcxGvkprU4elcXJ8xspIhLaLlUFVv8YZpY0w>
 <xmx:pzBEX0MjpH9JlMLv0WtIWJKnoOs9ZK7UmP_Xn0c9My-S-_vkxIfRdA>
 <xmx:pzBEX66hOLGT4c4XE3vv4ahYtC_EYaJbC_i7GG7wH9nGPSki555XJg>
 <xmx:qDBEX2E8z1jjj06RF1KVvPNbcexxWAWuhTYwWIjrDiOA1ohwWRtrvQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1DD1230600B1;
 Mon, 24 Aug 2020 17:27:03 -0400 (EDT)
Date: Mon, 24 Aug 2020 16:27:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Subject: Re: IPMI implementation of Get Device ID command
Message-ID: <20200824212702.GD3532@heinlein>
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
 <20200814231020.GA16853@mauery.jf.intel.com>
 <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline
In-Reply-To: <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 benjaminfair@google.com, "Mauery, Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 05:27:55PM +0530, TOM JOSEPH wrote:
> My proposal is to add major and minor version to the dev_id.json and=20
> this can be populated in the meta-xxx layer (something like this=20
> https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/=
ipmi/phosphor-ipmi-config.bbappend).=20
> If the format of the VERSION_ID does not match the master tag format,=20
> then major and minor version will be picked from the dev_id.json. With=20
> this approach every company can share the upstream implementation of the=
=20
> command. Thoughts?

Hi Tom,

Would you be able to work out an example where the git-describe is used
to create this, similar to what we do with os-release?  I think this is
going to be the typical use case and we had a huge trouble getting
os-release to be done "correctly" at the beginning.  I think having a
well-tested example to copy from should limit the issues others will
have in trying to implement their own.

--=20
Patrick Williams

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9EMKQACgkQqwNHzC0A
wRl5Xg/7BXCMsgfIIUDlZt3j2TG+MVAatzAZj82/D26QOAzkXjFXXgdnYcKn5QU1
kzn67B0b3Hskn18a9fLTMoY23wGfb6qnZnvDzHmG6mOhFwgHnH01iYxeGCXjMsUF
Ql3fnqzCmegx1WMga8N3RVCx8sxrU1ELGEqB8iqLFWb25eiGtp4bcNAt90/EFJ+X
4Rf88379xx3YGcl55CM+V7pOFhYdRAWGHKVaK9+lBlblss16nH/QV6pJunnQx9CC
WnI0UBREoVu1iPGFpmqmQ75dOXS+nLr5WCgO22Rtar6HSKxiUDO02AUCdZDuVwbI
lfmyOLftzhj82OGuzbmIov+EWYCL42FcgLwgRSDFYT6bX1THLpLRAY46RDaVIK0F
lDEo6bac8StuwUvwpb47mFN/rGOuEhm0nTNWQF6DbCuZ3GVZ7BB0ZFvqPpWlObTe
2F31sYYWlcbF+ru71vo4gWJ1tBMBCJM9iuiNHSLOE5jNK5JTt8jDQubX4I4ViGpo
qbXHkTvZY9eXBPxVk1Njij6VDpMxsOfphENTbBplqzAVdkYJfA9cz+pXAuxIvRCu
Yl6xVHiT03EP4eG4c7TehQvDBeHd4xZxn+uMkBc1Zj3qLe5FxOnXpnLkY01ETI+K
DgM8pxQNa8CvB2qIC4jfUAts8zmbrhX19/Jz1QalN6dyt6DQS48=
=eNGr
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
