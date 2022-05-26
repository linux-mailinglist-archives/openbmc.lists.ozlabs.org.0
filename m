Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29E534FE9
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 15:30:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L881h69Cqz3bfr
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 23:30:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=hBaOudIA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=m0kOeMsG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=hBaOudIA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=m0kOeMsG;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L881D4QZbz2x9W
	for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 23:29:35 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id C35FB5C01A0;
	Thu, 26 May 2022 09:29:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 26 May 2022 09:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1653571771; x=
	1653658171; bh=5aNdfNYFbaWW3zZjMAE+YuvjudXHuzLKl8vCW+5uuW4=; b=h
	BaOudIA2X3IY4BbXZW5ntRAyQK0A9SOb12kQ/8vQXxSpdbj3zC4XCigkwbxmOkWK
	WU+RTWks5iNl7zwUcZ7BKungqCbRAYwR4hj14mJaMuKMenqVCGM7jFpRMMYq7Umz
	haegsbtDX8h/rvNG9eg7Dc8p12y2cOPgwkTAtFTjbp8wCDnxrhBozg2Hi/XfkHp2
	Gb6BBLHhmnPbGcySnJCQUncxvu3684yIohwXJUbxsbf662gsUulZSf5tRtPcbLvn
	3iFuSjvoRB3HmIIY1iA8Qfsj4QpBWIFaiS4RR1peQBejZ57hDe8Hfq0uc5lpWFU5
	YBjrNEpOm4B5OXxPtsQow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653571771; x=1653658171; bh=5aNdfNYFbaWW3zZjMAE+YuvjudXH
	uzLKl8vCW+5uuW4=; b=m0kOeMsGRYcJxqPL8zYD3BRVJU61jFLMJIMk61iaP2EM
	Z4eJC3FIcCeIn+HP6DptjslJEAsk3wDPHLXr//xASSLWmW5TtpdlNNCw39jxN7+h
	bjAWFcR7ArLROaU+tDx6P2b/HoGo2q4Jpa7PrevozpwDoo80VN8Fz9/MfiWEm3w8
	TstOATHHi5YREF5bhgXqP+lFKsxcbC/CWMhUn+CtFvnUYD7bb/ZCIU7CCPtDIZzK
	BTA/b7ZN85pCeHM4gzVy4NKQ5np7MDIBZRMt/MgrA3HYJWWeumLHiAsta5A8/Q1e
	PWT0RrFNle85DGcmXiEmzfoTAbv+LQSZ2vfqNTSVfA==
X-ME-Sender: <xms:u4CPYubl_j3hiS0SiTtgHv12Y7jUWQJEOipRualfvycdRhZ82Hk-FA>
    <xme:u4CPYhajEhTpPv_KrGggJYAyJlMsAirtweEhtU1W4alvjFzt8caVZ7aJN3o7I6yHT
    CVLr3jFEnZ_aL9K2XE>
X-ME-Received: <xmr:u4CPYo-MHa7uQbK_zwIVTBH9pEYUeji5W7LL4lwqcp5rl2DZvq5URi3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnhepgeetueffgeetgfeugfettddugfduvddukefhffetffef
    vdegledvieelteffudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:u4CPYgq_lImOQvLCyu2-2LaPkpP6nHx_Zc5NPokJf7XrzPFYkregiA>
    <xmx:u4CPYpoXdD3AMGFpVX5NTVWpJonpaMl-q9GUOdV6YU00CIPAOQgVVQ>
    <xmx:u4CPYuQEgUaP5v60u5KWjLOdmnIvRhn4Fq01jccsp8-enV0xRW8sIQ>
    <xmx:u4CPYqDhnAxDDhVipv-iuoVsf47X-OctVy68zhYBMkGTAmS-3bNXcg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 May 2022 09:29:31 -0400 (EDT)
Date: Thu, 26 May 2022 09:29:29 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Zev Weiss <zweiss@equinix.com>
Subject: Re: Equinix CCLA Schedule A update
Message-ID: <20220526132929.jfxsh7zwsjolwa4p@cheese>
References: <20220526074729.GM11809@packtop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220526074729.GM11809@packtop>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Rebello <Joel.Rebello@eu.equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 07:47:30AM +0000, Zev Weiss wrote:
>Hi Brad,
>
>An updated CCLA Schedule A for Equinix is attached.

Updated, thanks!

-brad
