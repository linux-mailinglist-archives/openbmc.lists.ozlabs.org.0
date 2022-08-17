Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FB5977F5
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 22:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7KQ91Lghz3c2R
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 06:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=DerfQ5QB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KcPPQG5a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=DerfQ5QB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KcPPQG5a;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7KPh5cSMz2x9J
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 06:29:44 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B95F65C012A;
	Wed, 17 Aug 2022 16:29:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 17 Aug 2022 16:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660768180; x=1660854580; bh=84jrMQvWla
	BSULRuUDTh/oKKdGMSSQ5Yl/CB4IpIrNs=; b=DerfQ5QBmBToRGk1k2Agoj0K/v
	/hks1TTZTDu81y2DP1VYtI1RlmfyUEYs1odE49kZ6WXqJVhbNvjnpS+sAeZkm/pd
	Z2CO7y67X45oGo17555uwQJvzsvEJSKyWPdhAA8FKJci+D1rbpb2yj7VCbfvZ/Sd
	6E4iB8kzYT3ZT6S4/DR+jwAnF3iuZMhY2t+wCG++VatN313auaju9bG4yoHtSkB3
	nyRYtgJMhSEsiOLYz6FJoh7bn5CW1PRkhe7yHIGiEAkC5RFc5JHH9MS2I++CPPuE
	66uQIyZbNS3WVbllcLLhjyt6MIHKkrxNHPjcXRwQM0DRF8YIEfT2E4Xpz6CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660768180; x=1660854580; bh=84jrMQvWlaBSULRuUDTh/oKKdGMS
	SQ5Yl/CB4IpIrNs=; b=KcPPQG5ascNZir7ccmqxo5eDeOcCDzfBMJvw52hrL9xm
	vuYGZwS/8keiDsMy6LTyRl+GATaHFRDD/UITNLctefbwxqkhgfoIi+QJSzKYP60b
	1N4sxAHnM2rDqgPTGZbflmriqCZt+sDoycPITTMxKcJzRrk+E0CQLq8FTGZSFcXY
	z+T1BtRXla4doOMUAgowihiwihbm0dEeF0L54ebJypbz3AOvArqGeOiMpiNp4YE6
	N/4iLJfTNLVil2iYi9TU8z78aWtHTfLrHCvLZ9gPLi8eRgCDeladag0o8YIiCwYk
	pXg+NBk/3ycFsmaCckWuXbiy3VVC/6b+vUe8cJBtZg==
X-ME-Sender: <xms:tE_9YhLR34jeqOmKstnq84HmbwsPVB0vPgnnYY8ij-NlutXtC5V2BQ>
    <xme:tE_9YtJMsP1V0vHHGgxLGldCAdRtUZrKEJIzn6GZW2XArRQqSpNtAIJvM23QzaXXm
    pWgIXt3S1-1dmIoerU>
X-ME-Received: <xmr:tE_9Ypu5DU6D--iXnCtv2fhxKMsfQvq2gKpEmuDvoI9NRyf9hs1PF-558MpuMIUGTBenJd4QXRfpZ1EivxYLpOH-v1gkrgQT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgedthfehgeeljeeigfevhfdu
    kedtjeejhfeuheeigeevvddtgfekiefhjedtleelnecuffhomhgrihhnpehophgvnhgsmh
    gtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:tE_9Yia1YFrdz_FMkgK6G81Cy0DxwCcjesGY9SJAp04iIzFUR7Ducg>
    <xmx:tE_9YoYJOY3EVs8QPl-LcjV8c71exWo2Wx-7iP-g7DXXVBSdXP_Pfg>
    <xmx:tE_9YmAORtz5_Iej4imnqwBqnIJ_q05Q7x6wDq_yTlAnkkU-FR87Cg>
    <xmx:tE_9YhBPwNbgiPBOqEuX0tlqfw1p23OQ4YsNsBbpK5rHrvRS0NyVTQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 16:29:40 -0400 (EDT)
Date: Wed, 17 Aug 2022 15:29:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 17
Message-ID: <Yv1PsykUiUbKU3jm@heinlein.stwcx.org.github.beta.tailscale.net>
References: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
 <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lP6icKjEaXU3orer"
Content-Disposition: inline
In-Reply-To: <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
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


--lP6icKjEaXU3orer
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 03:11:46PM -0500, Joseph Reynolds wrote:
> On 8/16/22 10:07 PM, Joseph Reynolds wrote:
> 4 SELinux design.=A0 Request for re-review.=20
> https://gerrit.openbmc.org/c/openbmc/docs/+/53205=20
> <https://gerrit.openbmc.org/c/openbmc/docs/+/53205>
>=20
> Advice on how to create interest in re-reviewing a design.=A0 Use Discord=
:=20
> Ping specific reviewers and ask specific questions about design issues,=
=20
> if it is solved; ask if the design can be approved.

Step 1.  Do not disappear for months at a time, without responding to
any feedback, and then expect reviewers to drop everything when you
decide it is time to show up again.

--=20
Patrick Williams

--lP6icKjEaXU3orer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmL9T7EACgkQqwNHzC0A
wRkGrg/+Nn8xCQP5sNxVC+fAPW4OD5gZGBz59NUaPgiKnH0Uh0zJmdLSDFroq+An
LIE/6rW8BWtvo9CbCk5bqtO2jXDKAnk4m/7Pi04rjDcxCFHXthmeINN6lCpC+lGh
0PeoIQ0bbUaXhaYa3Tav9XdDsrphEB/67XQWRd/MwifSoZqrPevHwx7lc9YwTr+p
jtlOcyJuwQ7O/RRvLmvj785NnlyLD7Nr+3ZDnTuCGOMFmlJEH6qCd/6qT+N5Zihg
YiLGMP9pl1gdP7v+8uMHPA51MccmPs5fWYZHfp4ALDx4jvCZ6uehfLm9xgCKatue
8aVvdHA4ssOtCp98SeIsNKlh3lWThE0L8huvb0wSopucX2wksoWYM8Yb6DPwZvRw
C57URJTVU2bRLEnzRHKFbC/tihRjvnyTPnEX2c0B1TiepmNbWT/lsDVyqXODHB91
FxS0Qcsg0B3BVhsAyFT4WbZnR23ZUfmn5UHlplDywh6u6bKOZHZv5f+Cw+70MlNV
sspQMXyx11mE7HPJAg8LGPbpxV4TZhgdkecmEUVucFZwIuWRjiU5g7Jkd8163BJK
87u0vugxhPldHWZXsnLpaFiHAA2lwF4evNy+/xy6k+wjIRMTo2gbAcftRyznTMA2
6Bx69ZSZ+TPBf2obgVAPAPiPpezlaXLGn4VlOQsi2CUoVGSQO+0=
=aWMv
-----END PGP SIGNATURE-----

--lP6icKjEaXU3orer--
