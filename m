Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE5555550
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 22:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSvyc15Ntz3brl
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 06:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=XrUdqUAR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jFZtigJ5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=XrUdqUAR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jFZtigJ5;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSvy46Kdsz30QW
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 06:24:59 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 045445C014E;
	Wed, 22 Jun 2022 16:24:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 22 Jun 2022 16:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1655929495; x=1656015895; bh=+ZDxgWDo/b
	VdpZRVDHQhua91sybMKIU0BvyqttwoE9A=; b=XrUdqUARmQCMVRj9NDynao0FNm
	xgmagpI0mClTJX+X8nqXjVpK6VGYKxmhp9IKvJha+TN+SoO6B8XXqI5u2rqaVqlF
	QljET1+oLpF2aqltBuk0y5AKw7Lee8uZ9YdsAlbpwAa23+ZKzIE8KPjyt6LYOzkd
	2+Ey5J7iY4757Y+iyx1b77UrFupElvuCmWcxjguY0K357rUMbgwSZIAcuPgDSDb/
	uThLL6IwusdNl7N8Xto5hRjKmREcMHUBDs6fLrwyS8r9G8M0x1knovw7XaOWEyOf
	0b1QgvZWZ8qEtF0JbE6kY3uVcUnlDyl+l+RAuI8b5te2ThIfU5nCIYJA4j3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1655929495; x=1656015895; bh=+ZDxgWDo/bVdpZRVDHQhua91sybM
	KIU0BvyqttwoE9A=; b=jFZtigJ5xHVs72rcDQj1VPnx3BuO9+gn52j61DnTTS9E
	PO+zBl7vRunyaitWu8iCBWutXzpZS9b9It6rcuO8TIAwmcBeFniinR5sEWbJQ7oV
	WBhMRtOq7rtdbG1GUn7Ih03uuSjd0aHvnj1sBzbvq5EFlptHgEBX/hVfsG/Je1/y
	wxRjB1LXtFiaWSox4UKajmq29tzptzHT83nnQojMCjM9TteV9hKOtHVTgcZhnaOa
	BJltwDjaC9nFepamBcuRh3mkOmLn7nspO3VoV1YpxCjhcSQ3S1xN7JgmcClatVKI
	nVX/SlsX30TPYkxdlpJZNaPQt5c4ixTbpvlaL3sU0A==
X-ME-Sender: <xms:l3qzYjNecrHJxR7OSJ9axabOlbK9I9VkRUVsvoTMKy1INlUXnTBbcA>
    <xme:l3qzYt8JTqdb-5bydVpvzg4AWtYpcALzc-e0u7v8sQEnrcHpJ0m17SFvLelY9BfuB
    qOsoxfeHZbaU_pdKwI>
X-ME-Received: <xmr:l3qzYiTmDMxQlpMSOUBitmgfnEPoalAuu7EDNTZRjgePUO0jReFKC-rKRWHzbYQorrJORT477SGAL6h0ZATNJt-z6kq7LoKOe8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdejjefgudeghfetvddugffh
    jeefjeefhffffeefleegudevjeellefffedvffelnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:l3qzYnvBVR7jbS8ROLJI5_vVce1Q45QNzg4PYUUP-sFif8pLF7Y5gQ>
    <xmx:l3qzYren_znnHyrZtYVb1a-UR6OwCUM9IvTDbuy5j8nhks7tg7jPqA>
    <xmx:l3qzYj1vIzKRVKEPKTWEza_4EBFL4bZBfC7iNJlq_8X_9L6SYXECkw>
    <xmx:l3qzYrkjGxjJCPU32b1wt_Ax7iZDd1UweCGMOV-ENjCRMOG4DrPEbQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 16:24:55 -0400 (EDT)
Date: Wed, 22 Jun 2022 15:24:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday June 22 - results
Message-ID: <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
 <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jYqu3WSNj2AmpIa8"
Content-Disposition: inline
In-Reply-To: <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
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


--jYqu3WSNj2AmpIa8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrote:
> On 6/22/22 10:19 AM, Joseph Reynolds wrote:
> 3 Measured boot

>     Enable network agents (like keylime server, possibly the host
>     system) to get measurements from TPM.=A0 Note the measurements are
>     digitally signed by the TPM to ensure their integrity.

Is there any work going on to define some kind of measurement schema in
Redfish?  Last I knew this was absent.

--=20
Patrick Williams

--jYqu3WSNj2AmpIa8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKzepQACgkQqwNHzC0A
wRl8Ag//ZdfKBkJEnTCLBK8F1Os94r3FGBWkbThfFuFYLojIh6Cx3UsUmitJOBCt
12ZI/e+AQPPFR4kAlbnVz5JyLgVVNAsGxpSGEsqrzE6fFnfalsA+RpBbq2p61vRS
yYNobs2iXLUERoN0T5/iUWFYcjBc1fYdOX8CZc3cFn2XYAMflOAnK35xsn9ppCBG
fQEecyGte91fgy8iLeOmzqJafzMijeSUTvtYEf7gjGsPylLsDX5QW06Z1CF6lA1H
7/VVTChynrnnWKJIaPxk1GNiv51vQ4QdzGUIBKNYJXjkYq71H3TfdndaZDrHrYqF
W3FCHpYiqGfXsdqn3u+C2W+KLe7vxSgN/T/VQnu0Tn7ellP43f9Qpmd9r0EaDqII
rd9rIMgEuehNKBBzcYliS3og2xjXNWl08HpQgUOqEQB6SgoswNJjMSUes3dzwiHp
8wTRYNJbdewdzxD/DyAD+OJrkPUs9231BQL30FZ4VBWCGb5nfFxLiTFPWAZ45Nx7
GlZmqoXVqM6NngfFVsqrzfaVW76L89VsiwoI7TDCD7t6LnBnCdi/QqT4nRU5GtUW
jZJGlzy0ugMQfB4z3kkxF70gjDsxNpufVAQb0q7MN1L4ytUBvZytVRwEPtsCaDIj
NuGWj+nZKEt9+i54Dlf31sqqKDcPa8ZVLrRAk5/q/XhlsEbwsdE=
=zlSd
-----END PGP SIGNATURE-----

--jYqu3WSNj2AmpIa8--
