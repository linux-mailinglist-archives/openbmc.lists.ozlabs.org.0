Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 353CC5EA7A6
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 15:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbkhL5jrHz3bkm
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 23:52:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=SJQagbMt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o9U1FN/+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=SJQagbMt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o9U1FN/+;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbkgt1WqYz2ypV
	for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 23:51:37 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A23935C00C1;
	Mon, 26 Sep 2022 09:51:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 26 Sep 2022 09:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1664200292; x=1664286692; bh=CSsjWL5u3K
	ghReYrpgqoDKopIKPM0B88U8YNTw1LuqQ=; b=SJQagbMt8UAFqcI+B8NIwpySm4
	wZUGu6jDYc4cXoCrtj4K8kHMiKzEeqFRwyD91vMHD9Cp6ay9XY9WIJk3TSxg8/1x
	8LDwhMnfRhvV2uuxFjJcRIZ7T38tILvNTpDRU2Ur4ARk+9og5aWdKpVmfqZRtyN+
	N2qLaJDssP0oNEb2VrXU96TjFJld0N/JFmq1883HneoyMuJSuYYr45kE+mAY4S3u
	NeBd8Fv+a/JdY2Rj6QkcyiXn2uHZXg16tF4XZ2Jj9XGKPBm0tWujTH+wrL6lIxOx
	+AyJZ7JAr0KAe+rBU8qPZfnO57AN9HwsIRWYcvmjoKduQO+pTLljfbHZ1msg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664200292; x=
	1664286692; bh=CSsjWL5u3KghReYrpgqoDKopIKPM0B88U8YNTw1LuqQ=; b=o
	9U1FN/+xkzwVsq65cVVhdQP87aH94mLPQIGrVTA+rqyK36Y0h2biYcrofyXH6OQY
	p//+8d3NUj4oanZDC6ZH/GVNniGzWZjZ6ujW0cEqZPu/7ZzlPfRbx7EUpHNQEHWT
	4f9Lzca+gr657KbeZ5J8Lo/bYlquNRmaohdvaAC+tN9cC2jjD1oFOUTdKHkQokf7
	BABvjKABZ7oDxYp9ewaLy+VTWP42H2YgN3/CV3zuNSEJdz+dW1nHLu+kpmUUM0S6
	VB1VuOAFqrW2SbzK1Xo7YzzgyRwomgiwJ0erGToMnJwxJW45yODW+mEKoj/q9eqT
	7LbLzQBqKq4Bqo3HhQPoQ==
X-ME-Sender: <xms:Y64xY4dqdT2m7PwpW4nTGCbT5iwbo_coc3y_TB59JzN9HyllLQSWPw>
    <xme:Y64xY6PBHTfpwJOuHNUAVUzuY8YfUbFOQpdr9WOD-PmT01lGZ8ZFIE93lc_x9CkJf
    oMO3MMm77zJzUDcgio>
X-ME-Received: <xmr:Y64xY5g8SAf_-B6Mbw_0YpDujy0oEzhrGylp1hFN2SAIbqS4znPJODZDJNwuvrekl1rHNKBJm2seFcPqntcH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:Y64xY9_INfFCHagVOShGWqKGYmy8KNeJZPFdEf9gesBB2zMyL2g2dw>
    <xmx:Y64xY0ulNtIVcTHXR77uEuuGcPGNBXfhAJbYvEt_V8KkfZdvXj0BGA>
    <xmx:Y64xY0Ff0IWbVFtJD7Sbk-_-rlOFgJdkX1EZW_Xo7xLwHf--lMJSFg>
    <xmx:ZK4xYxVxQyRVJMn9-aIJwhLI-8M1Fi1C2Ndlz22EYHKw3-hj--iR-Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 09:51:31 -0400 (EDT)
Message-ID: <b2ffccdce4ae46b569fa7821375114905f48ca28.camel@fuzziesquirrel.com>
Subject: Re: Wistron CCLA Schedule A update 20220922
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Claire Ku/WHQ/Wistron <Claire_Ku@wistron.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Mon, 26 Sep 2022 09:51:29 -0400
In-Reply-To: <TYZPR02MB5691CB20935915E840F81A728E4E9@TYZPR02MB5691.apcprd02.prod.outlook.com>
References: 	<TYZPR02MB5691CB20935915E840F81A728E4E9@TYZPR02MB5691.apcprd02.prod.outlook.com>
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
Cc: Andrew Geissler <andrewg@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-22 at 02:37 +0000, Claire Ku/WHQ/Wistron wrote:
> Dear Sir/Madam,
>=20
> Update the schedule A from Wistron Corporation.
> Please help to review it.
> Thank you very much.

Hi Claire, Sched A updated, thanks!

-Brad
