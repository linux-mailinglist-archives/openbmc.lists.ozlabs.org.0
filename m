Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499D5F55C6
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 15:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjG6z2jm6z3c1n
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 00:45:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=KKo0C5R8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bDODzCnQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=KKo0C5R8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bDODzCnQ;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjG6L125mz3bNj
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 00:45:13 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id CEBFF5C0130;
	Wed,  5 Oct 2022 09:45:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 05 Oct 2022 09:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1664977508; x=1665063908; bh=v/qp5/oW1V
	ML8Aq+UEAsRncv1SG9HKVWWJB1lR4ONS4=; b=KKo0C5R8tSZSrEze8/PpsBTaUS
	nHMraQTDXoGuGwBpobvkTZdUz3y8o/4lN1vgbfWHlAiZxRzBO1m8Ka3aRvDU3mhs
	MZWgK+L2JXqXVoiZv8T2We1H+pJ76ep2pl4uV1+LFm4DLiKpi93+3b1AKD3e8/Vd
	YaQ4RLTuI/5BC+d/+a6lSGcsDC7VFVEb3fXEwtauAeQRVvrukScrlaRYITRGK/G4
	127o9uF0gePmybYWHg/srme4NVvUbbluDLdj5U/P9/zYu9wMRoOG050DxERE50AI
	8l2hVvrvwuth43+AztZFuXvZcCtHtRqb8YeZzWJiE1I5goo22C28GgjA7wlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664977508; x=
	1665063908; bh=v/qp5/oW1VML8Aq+UEAsRncv1SG9HKVWWJB1lR4ONS4=; b=b
	DODzCnQle+yApH0+4BCRd+56tULQ8k2y2IF8zFvTI6CoJ2gqiS1mA2T8rKU0cvYR
	zJ7lQ7U6Geqr5ef0wk2Y2X0TcdVsaZWJ3HRxQ2dO8VS6jVKUddSfqu43WtzqLYvS
	k8x63I03HpQ+Tl8vA9MrklLHa3ADnYBghH4kbeJglJIi4pxOf/3C4Ap+B8rBtZrV
	D2RIl7ymQlFmxZKHSUiC1eeFFX7QN0VE5BVq1N0Bg5vgRFsySa2pM18qcvo9tBko
	EilRuIBJO8k1NxPUqWEm3ONw1S8BvUnBRLQonwPSdy7gjDj2BuEY04rU2UgxDSIb
	UzErJmxPAfVL77jU+7grg==
X-ME-Sender: <xms:ZIo9Y-nzpZK2ucQT4ZH7qw09VuZfixsOzRO31tEvFkfHM5GDmoxJjw>
    <xme:ZIo9Y11Mjrq9YmW-YqEgHbF-3QXsfMQZrELhmujwq9mTTa0QfTOCDSPZqdhEbquW_
    fXOv1LsVKRWkivwKxQ>
X-ME-Received: <xmr:ZIo9Y8ppTkqfnm72B8BecVdwHg6nY6-H4ZBG5RFINx6uXam8bpO22IFEeGDyXgm3PUEYVE3BTBmFbayHtxTO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:ZIo9YynziQ2UaXVcsHCkZhWlQx5J79uaDGENWaeQnMytkEZR5JjdRA>
    <xmx:ZIo9Y80iQ6jcWMjtVv9giSDoJuLnJoVS8iqNKB0jcNWPqKW-ttXmgA>
    <xmx:ZIo9Y5ubvFHam2LkZ-VwcomjpfEoXqnL8i_emhSD3w9J4O4ShBI-hA>
    <xmx:ZIo9Y5_aEiT_aIGQJelGsi3U2VacCs8sp4l87pTUiFG5QB3rFPtA5w>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 09:45:08 -0400 (EDT)
Message-ID: <501627f287423382af7e7346be5a0e17f6eda714.camel@fuzziesquirrel.com>
Subject: Re: Wiwynn's updated CCLA 20221004
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>, 
	"openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Wed, 05 Oct 2022 09:45:07 -0400
In-Reply-To: <HK0PR04MB33485A097A9877ADB07D9F10FA5A9@HK0PR04MB3348.apcprd04.prod.outlook.com>
References: 	<HK0PR04MB3348E51D857FFA157A24750AFA559@HK0PR04MB3348.apcprd04.prod.outlook.com>
	 <HK0PR04MB33485A097A9877ADB07D9F10FA5A9@HK0PR04MB3348.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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
Cc: Aldofo Lin/WYHQ/Wiwynn <ALDOFO_LIN@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2022-10-04 at 14:15 +0000, Delphine Chiu/WYHQ/Wiwynn wrote:
> Hi,
>=20
> Please find the updated schedule A from Wiwynn attached.

CCLA updated, thanks Delphine!
