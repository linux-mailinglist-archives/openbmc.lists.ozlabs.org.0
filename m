Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519F17011A4
	for <lists+openbmc@lfdr.de>; Fri, 12 May 2023 23:53:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJ2Zw6P2Fz3bWj
	for <lists+openbmc@lfdr.de>; Sat, 13 May 2023 07:53:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=JeOV8t5l;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oWX+SomH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=JeOV8t5l;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oWX+SomH;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJ2ZG6D9Lz3fPL
	for <openbmc@lists.ozlabs.org>; Sat, 13 May 2023 07:53:07 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 21AB43200437
	for <openbmc@lists.ozlabs.org>; Fri, 12 May 2023 17:53:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 12 May 2023 17:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1683928382; x=1684014782; bh=Nz
	D+kL3//8CtXYaRJ7WtNvuU+hVImREs+/mKnFxlntU=; b=JeOV8t5lTD/qY2+SAw
	eCrOsKcsyTmdpSd7DEYwi+L/rASsW0qxQn6Qs8nO+nWEK+IygB7vNYSe1k6TQduo
	rg2OoPeO3ZaNkUQThPOhFAu9q0jeTzGkpnQT5+8m9oUhcX01D8WMuUjXvw0SBSaf
	R4/VwrrcKuLNnOGn7H71hS5LQF8O/SFjJEIxdZyvtOwntreLd1VuKYVjeYLqb8Zm
	gi9eXSw7tM/KNlbNx0HiKCqVrv3DFtHaEi4nYy65Cj/4ameexqJpNazKB/67U7v3
	GyAnkHhy/w583sTgWbK2TC4MJwOoVMI2f1f74Sg8DAZCmSB/RJMtF3DnLh1El6pN
	mAcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1683928382; x=1684014782; bh=NzD+kL3//8CtX
	YaRJ7WtNvuU+hVImREs+/mKnFxlntU=; b=oWX+SomHcQHsOppVo+LpYqX/9k9LJ
	W1FgxuEr/KWBpEG71zuPrjM5W82C63JoemX+T1twnMZcvcVCVHx32i9G1d/AlRWm
	2kNYWUBhcLBTUnGtHFImxI/ZowutStZN9cx7qG5eVYcLLflzsRkNQkLMNrdmErDm
	WVt1VYEKhfZvoDkGu82VADswglY/oouMkAO9ytq9VmF1eLT8SaTQT+Zc7zim2AO2
	gTFoe8qjELOA7c7QAqrEWrflD7gC3IKmgPTrKMMYi8Wt7HdV1u4Z7cHY2pe0lKZL
	KsDeSv1J+7q/dMVepnKqDT6tpisv1+xX7fCoykc44R1Egbz38Ao8Y8ULw==
X-ME-Sender: <xms:PrVeZOs9zIdk0R36DWsMQX0YHYIuQ_TO7C7M3uOEvXPlFkxoF6hwig>
    <xme:PrVeZDebMXjbyvTR71j_wfyDO9HsoXBxdwhzmb_Y7iR4p6Mn0b0h9XJlETPw0h4-X
    54Gl_Ix3_sXI3jjOEg>
X-ME-Received: <xmr:PrVeZJzYpn70mXV9oWextfgFlmIKTOBwELPBEGX5nlk2CCtmkqmUqegtVSgQCAr64hPhjol-BQVWNRWraHoIVo0SRCpIGoa6z5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepieduvdffhfeuieetteffhffgkeek
    heejhffffeevledtudeileffudfggfetffegnecuffhomhgrihhnpehophgvnhgsmhgtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:PrVeZJPOWRC9J2Jkns6LJInIJ86uDrGNwqVC3yMY9BMHG9XXKWhjsg>
    <xmx:PrVeZO_KnMtmAqLCWHDo40B93sIcapF79Q2wnzqphfthymCEmD95ig>
    <xmx:PrVeZBW-T2fuq48K1wSCSq0nef_Np5fJqsmzC6JsLlJgoNEZJ7jSwg>
    <xmx:PrVeZPJdg1XmivPmhkoUtu3lJKdoGPKre6UrxXbWjH5iV76NF3Fl5A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 12 May 2023 17:53:01 -0400 (EDT)
Date: Fri, 12 May 2023 16:53:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: clang-16 rollout
Message-ID: <ZF61PFecCXksqX6v@heinlein.vulture-banana.ts.net>
References: <ZFuSH0kBl3uOp2wg@heinlein.vulture-banana.ts.net>
 <ZFxixiiHQrRY_5jf@heinlein.vulture-banana.ts.net>
 <ZF2sPuvx6O2hQF7i@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3bA0CgD/+3L2lB0q"
Content-Disposition: inline
In-Reply-To: <ZF2sPuvx6O2hQF7i@heinlein.vulture-banana.ts.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3bA0CgD/+3L2lB0q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 10:02:22PM -0500, Patrick Williams wrote:

Other than about 2 dozen unmerged commits, everything related to
clang-16 should now be resolved.

[1]: https://gerrit.openbmc.org/q/status:open+topic:reformat-clang-format-16

--=20
Patrick Williams

--3bA0CgD/+3L2lB0q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRetTsACgkQqwNHzC0A
wRnaYA//X8WNwPXbRcMU3A3GpPTifkfJG+hFVYZpuymZRBaPmf/IKztrp35x8HxE
styN4ka2FZvoEsswS9n8FbuLrIsq+PaKfquEtM3xB82f0sr9yGtPZJd4dJjFMLrm
WICpzahXAlEjyv8aVAGDikAXN/jNdsr107sffQcQaJwREj2sZvshMZmJ5OtJJ4V7
G0EX6TzHJolPA31+5eCrmnyX5LYwMpgx2OwWX9tQgQdjcvk6huhY7uLHcvvc8IIz
lbceGNXs+r4nvp+DOvAH/T0bvg+y3eSACRfSB+L+2Xny7ux35rN+rpr+r9ufvX2Z
iTwNR5FWKbzSx4IXMArns/AnekJMex4QE/yIwr14NLoI/B+lzaj6A9WUW/9OWDUO
l1aaFi2WWxoSvw6Qa91uX8gtLfa58kwRN2V/pzjl87D3jRObAgw/OZ6eIvXURh5s
Dvd+OrtzwpbfIM5vghfNnnnDU9kSv0bPIPRKT1cY08yjqHQlWwicQA0f+PHaAzEU
f/M6sSYxKvnYA7fdB4PdS5k+aWO70iA/VkwOkugzgiEhRKycpIL6jWCZDjgtBy2o
FwsP1vLmjYJxp3RKr8l6QmC5TivjdONohd51JFDTBhUVOsDjhSHSFKyPEFi2Cfwn
Ie12HKPSTWvCqVjUZ5or3JCF6xEvKFrZ+dIyWZwduafmP7Yb8yk=
=42sY
-----END PGP SIGNATURE-----

--3bA0CgD/+3L2lB0q--
