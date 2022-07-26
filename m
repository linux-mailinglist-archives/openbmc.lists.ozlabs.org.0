Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 233645816FE
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 18:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lshh85Hvcz3bw6
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 02:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ZcM79gxb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MiaU8M26;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ZcM79gxb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MiaU8M26;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lshgl2sC3z304J
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 02:09:38 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id F2C8A5C0113
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 12:09:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 26 Jul 2022 12:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658851775; x=1658938175; bh=XoBfjee0ME
	dSeZ/wWHt1DbAyqdigdMKj0F32JKVbQzU=; b=ZcM79gxbLSGlTOkZtgvPT25cFs
	xum4ZWdZu+JSeDnfNMKKWw/l7kb80/xBCrGvxnOqh/rXRrj+aP4EVdMcpkDaswSF
	PRK+VKau6ks9FNaJ2g6FcJDUL+pc2slYw2ZC9hnS+uTQ0A5CzRA3OHYlPLcIquIf
	EhCBZqOSiw78sEbKBZguo2aemjQ9ydf+WMWNFT5ueLI4ttlanNVAjyOh4l3TefLN
	dyOYzF8Ero8YMPsuTaLjSkOt3cxJdahb7tWWPDeec7TARkLLziMIK3Tan8SCIgQX
	M3ItrZ6Ud4S9WsADG5SkETUT+EYtDeeOkupa4IFIkadGbCKY4DbXz1h4Ml2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658851775; x=1658938175; bh=XoBfjee0MEdSeZ/wWHt1DbAyqdig
	dMKj0F32JKVbQzU=; b=MiaU8M26LrHvWzhDRjgoMULrVUjSTga4fqXLq3ZbA+BX
	f4J5Ie5FduBOfldS4gtr/udTIt+HkbZ4bCUVZIynee7WVoCY8yS+caTq/JHvNWpS
	J13Cu39CExUZiwPUkwXilKckwxZQdBJg2sdUcBOdwD+DYqC1cqjVE6hcSMTRJMDY
	eVMtAY0YD++s+5DakT8k+icLCzS5Mzt8nl/AKEX4rzuHUMu6Hq0X096SAsPaWcMp
	B9FhHlQxwgxCcofs3NXakI0f0NcV8o6WwkpCLhB35RopPyNSPoV6terulCn8Wh7Y
	mjfZJvWRJGNRYugU3e8GPBMwylKpT8wcyp7s8L2rQA==
X-ME-Sender: <xms:vxHgYtw14344G6jZxe-5hmsZ_pZmq1IYcTTZghQqBPnfZJFsGl4iVQ>
    <xme:vxHgYtSy598Ia2uv-EDiwv6NUvHftU0WIRTryCdyL7QfidQN4FR82Tmpo52T0WZ-n
    4S70CTGUeqk34UlHk8>
X-ME-Received: <xmr:vxHgYnX0ISuB9t0nG9BSqoQ6xeJrsBzMUFtPhYbq_jXSRTrg3vm56X4i-iWMFvHELHrkvy3-mQXmUsvWVDxgplQhGc_4ysLK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
    geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vxHgYvif1fU2WOHAQhp_ALIgKHPapb2I6N90bBsu_R0r3HFtPzVukA>
    <xmx:vxHgYvCwkV71ilMdSWnvtL4AKFRSUDlcywIWK87aUuK5rO9hiEYkjg>
    <xmx:vxHgYoKSJueG6h58eCzeudWGoZJmNG4gex2WlaDPTov-Ft66k71UtA>
    <xmx:vxHgYi_sV7kPeE22fT3moBC0BxspQb_EEA2G4bhAHN1APG9h0HGQlw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 12:09:35 -0400 (EDT)
Date: Tue, 26 Jul 2022 11:09:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: 2022H2 TOF Elections
Message-ID: <YuARvnQFyv5yuikq@heinlein.stwcx.org.github.beta.tailscale.net>
References: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DrxdJRE3kvIZTK4H"
Content-Disposition: inline
In-Reply-To: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
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


--DrxdJRE3kvIZTK4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 04:10:24PM -0500, Patrick Williams wrote:

>    1. The current TOF publishes a list of eligible developers for the
>       next TOF election (that is the primary purpose of this email).
>=20
>    2. Nominations are open for TOF members and run through the end of
>       July.

Reminder that TOF nominations and voter eligibility petitions are due by
this Sunday, July 31st at 23:59:59 GMT.

--=20
Patrick Williams

--DrxdJRE3kvIZTK4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLgEb4ACgkQqwNHzC0A
wRniyBAAhzPV95DDiO7a7P1pGlT7iwe7Bfos+wQs5/Xn/byh55V5PGd2D6irr1L0
J9KWvM5HYJQ0hAgw2HMOYqk0HPNvYe1c68jfV3VlF8Pqm/LEBLvdTEVYxy3xvhnW
Xi/rZ9pnh/GQg8ZWGxOxFgB7LSZPkMxMG2vuMBnUxx5Suve3cQ5PW9BK2DDEVIPE
qfxjjRYICVU4Gsyr9TLPnplwU2t8120UDSTg2nLiHc8oZ7ZXeaZujISnIaECO15R
25SI+TbBPvhTF17s5L/IUItTY3RyvG7CyTFBKwBup6aNzzqVgvZ1ZCqsDN3KYYvf
ZJllaaF0WzYZ5NHlEkDb1x5IPh6R869W1eki0S9qDKMnZFjr/Adeu/bEyTkPmu+c
/yO8iShM+2uA+ulmwsuIWDrAF3BX0P+TxzHpBLvUE0utHh+zj5IEbfr4aZ3Q7ri9
GDBbJ8UbTFeWit4Ge7Miwx3C7WYDoGvI7TY/7MLrDCRrz1U95XnY9SNlr/zt1JFN
QLI5OClD5ZMGoRqyOdXZs9QadzLV/iSPjFJwy7vjHEwlah45357agsyEeKDVGuo0
cH5IvIlxGX4rkZtWvXPO6oxN1LKacPB2X9MlpANrqmHspahY2IQUw11OVa529Yi1
ne3ig7361udLnQLE/37BvNd4dTM+kZtz7Mv1D3JQP2LZkOwcZC4=
=cbK5
-----END PGP SIGNATURE-----

--DrxdJRE3kvIZTK4H--
