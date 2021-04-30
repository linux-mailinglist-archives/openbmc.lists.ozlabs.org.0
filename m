Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9C36FBE8
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvQd3mStz2yyM
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:10:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Iioyxz2U;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=e3q10bPm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Iioyxz2U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=e3q10bPm; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvQL2Yydz2xb2
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:10:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 209E65C00FF;
 Fri, 30 Apr 2021 10:10:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 30 Apr 2021 10:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=y/FYgctKte6EJNmZRv/+ZVllqR8
 D2lhxVFHD+ypTMdE=; b=Iioyxz2U8fTEOXhZ1NQtQFhvSxmyxTCR2EJFDFgPe6O
 G2qTwBcFYbT/rS3p03dLu28QysNkemWM8Pw8icW+b+YhFziiMpwxI7kMvhFiBs2C
 46dVqqvFNDz4YIBTmfbsCCRH9VBQV94hpMoeN+ehpKvjLntrDMKIFPRPAHuoLJiV
 15AhlyB1wcR4iUtCxCQ3Ri+6Y1JxW3GKPrqgjkalRFbBObNczTY9symWzeCw0N/k
 v2CWcyJYVIsUDSHJPPQAdQtYmdnv3K+ZvB5pSceJTfOqmKsSRDkNtcdCs9/baI8H
 Ha2yb4crcMbi7K/w15xnBXMdutZRPKIDHQskRel2vjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y/FYgc
 tKte6EJNmZRv/+ZVllqR8D2lhxVFHD+ypTMdE=; b=e3q10bPms+Wh4fVCT9KGhl
 Rno9LjcI3x1K19kBDF0Pmv77cGFMEdytQ0hpA32TznnVwoDTumdb75uUlKe5YWPO
 kU6DwToyp14/8CNoeGheVQ7maAs5yaVQGjmiYKGxIyhTCcdNnGflI/tfBjdya04m
 602R/RNuTke/3aZ35j7l3UY6FSvlYM2uT6dbZQZgsY9ynWpozEjrcMI9q77j85zK
 E6fzNbGH8/sQXn+jOFa5T8p9csCjDTIO/6Ye1fX+IuZ5sCwzGLfQ5bDyfYw5/ZUI
 T6IU7tXTEboQydAG9rWAGyWtVAAM2vYliDtuPayiiLJAv78B/LHW+XaIot7jYWOA
 ==
X-ME-Sender: <xms:tw-MYOM9LVNU3pkEA4-Xg_wqYWybEFwReoRXRDTI1rSVNP4p36WEqg>
 <xme:tw-MYM9nFz94uBWpQPCgP7ra7lCCbeZXclbqyfiYOg4g8xDgexmxvHF3XgXhyRBZM
 BmyLJcia3AZdqj0nt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:tw-MYFSFbxDl5TmWIzFYYhAU9zn_vWSOH5uBP3OrQz4MPqNBCOSTOA>
 <xmx:tw-MYOuomDcRJrfw0luWPY-tfDv32ifaUfy2Y89sqKliIIDlCc5zGg>
 <xmx:tw-MYGfSqpKO2RU_H706lU9oo12z8reuHbl6CxfiTrNOenJsnkxpJg>
 <xmx:uA-MYIolLa2ZYHZfHaw1Dddkd5PdA_7-kEtIU-5CZVs7El6YqSTDbA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 10:09:59 -0400 (EDT)
Date: Fri, 30 Apr 2021 09:09:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashree D <jayashree-d@hcl.com>
Subject: Re: Issue in displaying hardware name using Redfish
Message-ID: <YIwPtU8g5PhkLC6k@heinlein>
References: <SG2PR04MB3093D4832CB9DFE036DAA41DE15E9@SG2PR04MB3093.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rtZr6n/bQpEcecr0"
Content-Disposition: inline
In-Reply-To: <SG2PR04MB3093D4832CB9DFE036DAA41DE15E9@SG2PR04MB3093.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--rtZr6n/bQpEcecr0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 07:14:19AM +0000, Jayashree D wrote:
> I am using Redfish commands to verify the details of sensor and hardware.
> But I am getting the hardware name as "TiogaPass\ufffdseboard" instead of=
 "TiogaPass_Baseboard".

There is a github issue open tracking this and Ed is working on it.

https://github.com/openbmc/sdbusplus/issues/60

--=20
Patrick Williams

--rtZr6n/bQpEcecr0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMD7UACgkQqwNHzC0A
wRnklA/+LWFx/zpvF1cq3bljOeucXaFqkg9oIi08Ygmk99bZXcAd7s+tnEP6LHLi
CaNZyDFY4GmHeW5XRAxXkjHt2K+hq/hGqs1p0C3XUAQJ56onih8NsbSHB+46BWHm
TQrhctz2+cNwhktqbOtsZbNgzQkqY6caYKyxH6f13r8tht3tcYqqoc3ESlYiLA5T
8A0zEBKy7x0+4HIhhhPqjw6bsWjGS2At2FQsOvth5WW5W4h8vPtqgyrlejZ+YCxP
XqJMlcWteUXyjgwLGZemRKH4pgUMylJFQaa2DNhKFZLke7oygSXvIj+ItvSa4Wfm
bkRBlNyE/GQU8c8Ks3NaZRrzGmu3xlnNX4IBazfnFX+WnJeQCc2KEdJfZpRbb4VN
5HGLNl1cxXw5uePf/yT5arDogjVhO6sLTaQSUZL1rial8r6ErhpyXoa2rUDdhI9W
yfYu5viAgnqiYmT1qCst4XGiq2CNUOVSJT9F7bNV1bKteW5F6UQb052sBlai8LQj
0GVT2qguGZx0upjXIcESFjrPYqb56XxLoBlBSTVTb4+vMNop+PKG28ugEgAfyKTp
zuY8tFu8PzzS7i07K8xKZVbubUYlmCBcnRU3vOU3uow6zOC1xCCJ6+Xm6WEb4Zkf
uTo9zViG29gxO738OM5WpfJ7hU5XjQaL02WNLvzLQTM5Zntzy5A=
=GMV+
-----END PGP SIGNATURE-----

--rtZr6n/bQpEcecr0--
