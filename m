Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57823469A
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 15:09:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ70G5r9ZzDqh3
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 23:09:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=E49TAGTb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Crgti9Vq; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ6z26kcwzDqb0
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 23:08:12 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4C0E7C0C;
 Fri, 31 Jul 2020 09:08:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 31 Jul 2020 09:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TCtM9AtvcJxIl5hQtrtzjv43yGb
 JQF29g0KqBSBsYds=; b=E49TAGTbRZPdzYC/An2sbsYm6Rcnk210PqQ+TXKorQC
 e/rS3YkYjctx8sFklmKLmn7RV1EQZ8HhDTkp1SlUFYVsXttiDqj7fMRXo67lb+jj
 jYkSFd8jhxLi55rgmy48mYsDKlrF7qk0tYy0wcLLHwiOPW/7AlSnbeJ7L6fToBW9
 ogOHwc3GzqPlRDuT5lr+en4nT/ZEIi8FmpaCeRhLDx0T4/NXBgqFnMQ0wsU39BCk
 50LpZOmDiLT+++fqFCeKehoIy8W9LiZKchXjXZOZl6wFZvpahT1wxegGxVyy3OAf
 Rpwpfiq4bt2LfrCYtNEa03jeQB8z3yW5j6bs/awwclg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TCtM9A
 tvcJxIl5hQtrtzjv43yGbJQF29g0KqBSBsYds=; b=Crgti9Vq/2eZEKoKAAvTvh
 mCXlylrNJabIv1dDgsbLiAknFmnBf9bH3xIgvd16KnI5WoK+m190G75DeCTsERhJ
 CmkrUQ5puADjQ+HEMzTExlOeDtcx832kF6wk7/UdxwTuQLziQtDZt8DlYf2TBgu6
 l3cb13ho2QGo9IBDrfkiyudXN3UerSt6umg16FwOkoHDAvF3zBPWSjnSn6Y6JxLw
 M2NAN/+7IV0x3c6eSkh/pqgQTBRQB4QHxvhHFPbYubey5V7an0yyDS6tuOleUrpj
 n4CQyhOp+R0nZnw1QJ85r47iT1POcnYg6TWl7MKIeqejucTAuWPUiKryasJOUG8w
 ==
X-ME-Sender: <xms:uBckX_ZnYWmzQgv_Ac7mG3U6EVt-9kkurATvnldjb069T62tnAcxRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:uBckX-ZjntRwzGcuuch0VqVUqW6VkCOCidVuiCqfJ4vwe4SJyVZojA>
 <xmx:uBckXx-FmVgNaJ0KKhw3v1hf9aIugWpLC9ktV8E1N5nvCQdhBPQ04g>
 <xmx:uBckX1r0boY-SOkCZa5MOvVfqo9nBW0TGfnM0IPfNG55goya7Wv7Jg>
 <xmx:uBckX4HteIL6BwALvTIGadkEaRaIzlt5AH2N3J8MlnQCXm46Cyxejg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D558F328005D;
 Fri, 31 Jul 2020 09:08:07 -0400 (EDT)
Date: Fri, 31 Jul 2020 08:08:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: using third party library
Message-ID: <20200731130806.GS3922@heinlein>
References: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
 <CADfYTpG3HBX2FPMwa4oQ8p_C6bv4Vno-LiJyRzf6dnRhBx15XA@mail.gmail.com>
 <A698A001-88FC-464E-9D56-E7EFB69624DE@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IpljlC28XhFjURzf"
Content-Disposition: inline
In-Reply-To: <A698A001-88FC-464E-9D56-E7EFB69624DE@fb.com>
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


--IpljlC28XhFjURzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 08:32:00PM +0000, Vijay Khemka wrote:
> There is no recipe available. It is just a github project and either we c=
an add as a SRC_URI+ into our recipe or write a new recipe to build a packa=
ge. This is header only library, all sources are in header file itself. So =
we should be able to just add as SRC_URI. I have no idea about how licensin=
g will work here.
>=20

I don't think you should add an additional SRC_URI onto your package in
order to get this dependency even though it is header-only.  There are
other header-only repositories that have recipes, such as nlohmann-json.

If you were to add this as an SRC_URI it would complicate the LICENSE
setting in your recipe because your code is Apache but you're also
including an MIT component.  It is clearer to simply have another recipe
that is MIT licensed, as appropriate.

The recommendation that "this belongs in openembedded" means we probably
shouldn't be carrying around the recipe for it ourselves since it has
potentially wider applicability than OpenBMC.  We [you] can contribute
the recipe upstream to OE and we'll get it indirectly that way.  We
similarlly did this for 'libmimetic' recently.

--=20
Patrick Williams

--IpljlC28XhFjURzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8kF7QACgkQqwNHzC0A
wRnP5Q/5AZNap3gUURxxublHC5nYDR3fLKHOXKt9Um0Yn6b/U43ashFSpbcGuZUt
TozZanH+BXlBx2Y4nIKgWGeRvVRSrBFgtfj26Eroz1xyS+WuUl16DNdbCywkN5RI
wsDcYJcO6GxjwRGiWVZxXuTNXSHOyvFIVgm/OdqIXFpnAq5MduYOWRSeeOxEnA+U
TbOSTNAk7X5oI3bZHZNnCJu0hrKQa1tS+6WAcwbut+hiDCzUlddGMqzKTRMJ5rUm
jgiU1i2fTMjd19/wcfDrkTeZoV+LcofdvLN9FA3MUaYLaDwg0BIg8ae6dzPRBcSl
SfThZ2I+3G1qXb7I8sTYxH8Qyt/3JQYGmCVrC+O9yHHcSCNqIF1oG+q+I+JvTLWG
8bk5GLMJaG7gcgivf2akOe1LvSTPpcsBlhRd5F3M5vtJ9jldKROQnlTXK816C4al
jV+waqUOZ/qar8b4KXhDj0mncN3aK7lJGSkaTuNYKgR8CorR4710Id0iu0Lis9bl
7GXv1uApylBtDxcBV3cNTWj1eN1/ll3o3b3GuQ24EUiqxjzlYYMzMY+eGVGUqnVp
51edzxrzM9fDSa4YnG3piCFfWyiXIKhNNFJzAH/pPB15NSKazrj7KiLSfoGdBIaH
s4eP466XT4XFuoA2MzpkidYHenylLX8prOhkkVes98gTLALpsuY=
=9+Qo
-----END PGP SIGNATURE-----

--IpljlC28XhFjURzf--
