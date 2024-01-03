Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D94822CC7
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 13:15:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Hjq+NjuK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=0NmmIIEl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4pZn6XSMz3cl3
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 23:15:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Hjq+NjuK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=0NmmIIEl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4pZ61mZGz3cVb
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 23:14:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 6F13B5C01C4;
	Wed,  3 Jan 2024 07:14:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 Jan 2024 07:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1704284089; x=1704370489; bh=pl77qDcjg4
	1X5ZfqloQFn5q0kCMQP8UKn16+o41o3NA=; b=Hjq+NjuK0Pp1nVyYwIWlVkvfkO
	CzHznWY1CyWdfwbD+ZkVBHxBeJRk+E0J0mrLQAC/JZCB27d0QFovt4mN8G7ZEipc
	erayQrwhVSWWckxVV/6D29KAOOxyd3qfw+QD8eW6pA8Jhi1bAeSlc/OUuU63VY26
	/xsZAR0k4fz8t1qPCnQK56es08N0EKIWZEfut6xS2JDORvoYErsGe45wflstp1+D
	BRyodi7eMeThZgnYryKZ6mvrn6YEa5cXVLB5GQbD8h+HFQmNkQf8GjYtPgVzcioQ
	U92gB9g/I32LlJilwJm6wm1t7E3BWcA4Tes+lWlBpGzHo8/CfrHwbpZAQlFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704284089; x=1704370489; bh=pl77qDcjg41X5ZfqloQFn5q0kCMQ
	P8UKn16+o41o3NA=; b=0NmmIIEljc5zxhqP7OCDWinKSDkmXWyLJEXNgwHGxuEc
	0CZi8W3RGV5KD+HhlhFWuif4OLAkAK6KTmobMnxOfsBjP5upJx/GZ4LZ4FR0LZop
	XioZS3QvGthvj5nblXATJpx4FjNKyfKiJsTLVcLJA2cmFAdYfbMqjFPhZr8V3rP4
	VfEsCKQ1Xvn9/MJmfdyr2EF7WOV+xxj2xh0Tv7ScSp6jfw9XsfQe/EuXGL3EcjHS
	BFs/y6UFQpNNILw5e+y5QCKnVXaqqO5WgnbUmgiDTvDv5lC2REFSw9w+ekz8NTs8
	6ECq0WkDrLOtFoBC+5mWni74hHVbYooUXIr53aPkzg==
X-ME-Sender: <xms:uU-VZRwSpH3PY_qYl-dDtxaNZHLsxXDAE7BRdRDK9P2k4FMRNivoEQ>
    <xme:uU-VZRT65ijSsc88q-s4A713LcxrIc4_knXlHmmqxfENzjT8qopcE9qWQjnZAVQyf
    BIA_hzpB3RM0XTlQ34>
X-ME-Received: <xmr:uU-VZbXK1sjKIrEuIECGU7A1uA6ASxnoiQ11wK9ZSWlOW7dd5oagDDhwd596RqsldIhp0iqRjV1y8z3hlYgTsv3m97qyIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeghedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:uU-VZThZUpfuIM6EpM1366Zimj1mn4orgQxBY0jwQZ4vOXZa8v_uTw>
    <xmx:uU-VZTARHHaix5trOHPXz4agCYG0NMH6Brv8AYBSwiOXZZEugiCLPA>
    <xmx:uU-VZcINi3pbCmaES8Xy_1X0hf5d-35N-kwrWNXelZYdJyI9fHZCWQ>
    <xmx:uU-VZWqpDCsLbVARuLu-IQ1mCE-u_QwQgWcsPLKtI8BUIb8BGsL2YQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jan 2024 07:14:48 -0500 (EST)
Date: Wed, 3 Jan 2024 06:14:47 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashankar Padath <padathjayashankar@gmail.com>
Subject: Re: Question on passing username and password credentials through
 PLDM
Message-ID: <ZZVPt0JXDXxEX7pB@heinlein.vulture-banana.ts.net>
References: <CAFRDoiwOqE96Pxw9QVE7B2j_JnBbsvaEa38H5_=DVch8Xo8P9Q@mail.gmail.com>
 <ZZQBRhzMCiI3SC-Q@heinlein.vulture-banana.ts.net>
 <CAFRDoixW1aUVACo84wtGcmo09cgN9NieifB4uv-kWuxmBC2qsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eZqZ4DHlvfQH69OE"
Content-Disposition: inline
In-Reply-To: <CAFRDoixW1aUVACo84wtGcmo09cgN9NieifB4uv-kWuxmBC2qsg@mail.gmail.com>
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


--eZqZ4DHlvfQH69OE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2024 at 03:18:41PM +0530, Jayashankar Padath wrote:
> Hello Patrick,
>=20
> Thanks for your suggestion. From the host side they wanted  to attach a
> graphics adapter so that some of the system management service operations
> could be carried out.

I'm not understanding the relationship between a graphics adapter on the
host and authentication on the BMC over PLDM.

Are you aware that the Aspeed chip already has a graphics engine that
can be connected to the host?  OpenBMC already supports exposing that
graphics adapter as a KVM over the webui.

If you're suggesting a graphics adapter that the BMC itself uses, there
is currently no support for doing that.

> As you suggested we would consider the way, other external interface
> programs like bmcweb which support similar functionalities.
>=20
> Thanks and Best Regards,
> Jayashankar
>=20

--=20
Patrick Williams

--eZqZ4DHlvfQH69OE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWVT7YACgkQqwNHzC0A
wRkMtw//T/6FHnyb36IPFNX3Y32rqGnZjvar/IaSX/XHFAlwa5D4kT7272VDWY9x
90qWz1i1X40I24Vh6K/2rlWnrqE8FhHMJv+CJeAGK4JIxEJxDuinryMN6Wn45L2r
TRbactOk9Tzwzt1/FvhSivcn2tH66c0VswZv8Tf9njjMsjjzTa7r4hrtGfG++YtI
3bHsKaX9CTQVRGqSwVXhq/LFtGLx+iZRC32DH0Wrq/reF0qN68kF3LWWi4ZwB00+
Qcr12di8XXBCXfTJRkZlIjajSu5toCD4hhJOU482Br8cWjcVY34FLaF1WdXtBBal
wuv7t8djWE/NERTpRu6I5dk+IP6YjdO7DywTpU+rci8yNiagNOCX3J8BbjJDrCai
JV3+uqOitCqHn/Yq0FXqGhEeTwSZyllXTMfe5KdqSyrYrTraHuniezc035UZdjlb
gpLHIyBWiQLGp88/dwxiD9OfIvtu13tPo5uHb1LThhurROCWnEXKkqku17wSv4V2
bIcA91zpXXCVxcdroiHyEYXC/vaavYJLjMDRX196xn/ccK2JnKn9c/TAlOeyTqM/
N8Xr125DwiYj3YixaBrwYsDcOg/uz7ryq+54k4vju8uZMp9SGLg3pBCod5Fe/07v
cFtuDQdJVRw6kK+/uxa/qEoMioHMuyY1wZ5jKCwgeoebcLZJjRU=
=lPjN
-----END PGP SIGNATURE-----

--eZqZ4DHlvfQH69OE--
