Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054B704FBB
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 15:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLHbl6JXVz3f7X
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 23:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=AEq73Fyr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=qvjn7OXV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=AEq73Fyr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=qvjn7OXV;
	dkim-atps=neutral
X-Greylist: delayed 510 seconds by postgrey-1.36 at boromir; Tue, 16 May 2023 23:46:42 AEST
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLHb66ThRz3bh9
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 23:46:42 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 128A55C00F7;
	Tue, 16 May 2023 09:38:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 16 May 2023 09:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1684244286; x=1684330686; bh=FY
	9+jdUbnSCP4ANGxPqYUF1f4GDy6PvsNBSeP7m4V7U=; b=AEq73Fyr1Z5WRN9gKl
	/y5yfWhGUHEtILB0ZfNlxALVvnx4bDUUwjqanG8wwsQ6OMnPP/z1Dd2QndHiTe6V
	6Ope+K00N0YFolE/Pe06he2f4ae6riFo89SjWOrm07ZvnyRsbC9WF5XABlAr8vtH
	HmOU+XASeTVn1RKBK0ihqsKB3rk2rUo9V/i9AOrhUY/aA2hDvDZ1urztVx0eQ6aG
	SXXH+zpSZUVxvGqxCcOEew3149K+bcmrCOuzHJQUCrfluLDyUwcV8ThKa++6zEUq
	mBqfq8z7wkZdSw+cqvnAo8JS5OZIrTl3vteHpKlN/WNTB+BMH0Cp3QTKyqjK/YeD
	3r0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684244286; x=1684330686; bh=FY9+jdUbnSCP4ANGxPqYUF1f4GDy6PvsNBS
	eP7m4V7U=; b=qvjn7OXVsr7IiZrXGFAseftr9ivmBbmE3CvdsyclcNuNwu4Cb13
	sINZ+8bHBGgsN7LsTv3c7FkmVHVZF2HInlIe009yfkjaW44uxVFqd3zKWUHqSBkg
	bK630INIxJczKwIwIRzfoCUo6Sto/W8/8dsiF7w2jArCn/TBgqsgs/yXpI/WN7PD
	rWJ32FSNTRR/EarNP8vDX1cOvwEyOJJuF+Lo5dRTefpaPz/z19CSv8JoZnH1u8uk
	roqSh8LiUGEMEHK33SqQzA5H8HYsb19C/uMFx5KnqHoKvhydk98Ft7rMnMDIpdT1
	iayFL2uP1H0PVlJM6nkMp0pgaWC5T+4DmWg==
X-ME-Sender: <xms:PYdjZBhPFGBYTlCZ0s6_KkR5FnEUiF_dvvtL3_MlC0b6XmaamR3KRQ>
    <xme:PYdjZGBZyymwiP5vYzy5oU8FggFC6E-5YKUGauCkqwOctdhjSsOiTjC9y8JDD6xej
    IN8qQAVo69rZKHJA-8>
X-ME-Received: <xmr:PYdjZBGmwRkDwPhYfzfdSdJ_NGTHyf0HvuS-t7iPC8KDwLkBcXE9Rk-r-mgOv4NensN2ZVAUOAHzYCZqMHz_QRaHYOahB3cdM8Sa_az1AlK2Fz1aMsaVHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehledgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:PYdjZGRnNg0cWf_mnl0H-UIP8Jaoa8NMO2JqBHDPx7O966OIcCn_aw>
    <xmx:PYdjZOyhgcXMtK1BfEV-PqyZ0fgix7h1t94HJtU4T8uunBppyueygg>
    <xmx:PYdjZM6VIv6Ey-TMVyPXx0KrR8cTgi_eXGFmd_Fh7GgHMoiglNBiRQ>
    <xmx:PodjZDp7Bac63wDgDZAar33IZzvwnB8a2-ZRkQReEqhtvyUpE8_N7Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 May 2023 09:38:05 -0400 (EDT)
Message-ID: <17168f69d2af4f67078ee3af85f67551573e1561.camel@fuzziesquirrel.com>
Subject: Re: Wistron CCLA Schedule A update 20230510
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Claire Ku/WHQ/Wistron <Claire_Ku@wistron.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Tue, 16 May 2023 09:38:03 -0400
In-Reply-To: <TYZPR02MB5691BB7B54CE00AABA6E78F58E779@TYZPR02MB5691.apcprd02.prod.outlook.com>
References: <ae049cc953614f278f6493ceabd1e208@wistron.com>
	 <64d95725ad6abd0966b193cee06c9d7e6f5464f7.camel@fuzziesquirrel.com>
	 <TYZPR02MB5691BB7B54CE00AABA6E78F58E779@TYZPR02MB5691.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
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
Cc: Timothy Huang/WHQ/Wistron <Timothy_Huang@wistron.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-05-10 at 08:47 +0000, Claire Ku/WHQ/Wistron wrote:
> Dear Sir/Madam,
>=20
> Update the schedule A from Wistron Corporation.
> Please help to review it.
> Thank you very much.

CCLA update accepted, thanks!

-Brad
