Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7D4C71FC
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 17:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6mfg1s9Hz3bbT
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 03:53:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=uD+06iZA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VyWV7PEs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=uD+06iZA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VyWV7PEs; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6mf9222Jz30QD
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 03:53:03 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 38DE732007F9;
 Mon, 28 Feb 2022 11:53:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Feb 2022 11:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=Bj3pnXyWQLgHHTfkJJJfXTEFBerHbkcc1GqvsM
 RZby8=; b=uD+06iZAjPsifIIT96Vos7jFQxUV/mtzfq3+MQpOvm7L3mADfpKOvy
 sxj13txWlw6Z7d4SrqaagufT2TeF/bqfcvP3q/baIWhO4d1n1lGoDWKj+L51sVBr
 y6DqV1XOktLzUS04g/44Sk5WuAoFz6G6qPKmaVXL8bCt0WZNKD6dr4kD45zqCJB5
 3OyYuE37pNTN2ICGyvyGJoUGUldpncT74z96ewBdjYapsQ6ju0+km1NVF91dpfKX
 kN7dSfpz7AXIrAXFO/C0HtTIzxTHrq+bKs1bdl+w6ylL0jIiqpVzhw41DyFgEgeq
 HexGzvY9qQ3rhU156iwVOkytClffg+5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Bj3pnXyWQLgHHTfkJJJfXTEFBerHbkcc1GqvsMRZb
 y8=; b=VyWV7PEstGoC4MvuiajN8crKg52dY4ya3PuW2+q/mYih1QPBARTuPkPqg
 v1QMy54IVp2Rytj3EmqHE8atB/iqydva94WQm65XS/3JEZZkU5/Q/u/G3W1YLBUX
 miJNHbGbbeW6gsx4hR1i5y7k+TRFlfyIpSazjz2Vmk3pV2cx/ODzhjJMsF0HlNk+
 sZNnwSCbedTmDbGL+veWOSm9iYUMrnhddVs+Pi+jTspeEz9ZTWWwO5tqqaM3/yZa
 KWikVJ9fKaXLwUFndg2toyYvJb6LkktMqr/eYuyFRtu6nh0khV6nMoXuoz+Q0iGK
 lVA/BCZI43FvhN+Fq6jfOC58Um+QA==
X-ME-Sender: <xms:7P0cYpMdKF4im_W0ygbitJvVNJ5V6KbZm1cDpw8yRBVTMb2IBDg7Bg>
 <xme:7P0cYr_FICeIZbEmtk70mJJ4tS14oCCNuFvBszSeEjXIdQbzOR0ULMQDWZ7jjAl1J
 uanh8ZjuDG2q1Eg_u4>
X-ME-Received: <xmr:7P0cYoQkEgAZ5G6h1_GmkR0pXESRI2SnX3ekVZSCfryu9NevnUmJd9JBqZbfWRiKq7V-JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpegtggfuhfgjfffgkfhfvffosehtqh
 hmtdhhtdejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepudffkeehff
 efveffvedufedtvdejveelkeehgfekfeetheektdefudelvddtffeknecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuh
 iiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:7P0cYluQG7u9mSMtk8UA9MOg-lr-s1gVHaPox3llTZnH-IgDq-heOA>
 <xmx:7P0cYhf9lajYHLht7QGScTghA1jyQrvYEGQ0p8pyCGB0-UrwM4_5aA>
 <xmx:7P0cYh0JWk3vrTnKhZ3wssYld9LtWRTBPixwIQjIONYmdYJfI5KCUw>
 <xmx:7P0cYhnOZbIAEQyo8GsyKEtacDmT0YzlWJVPKqLxxJT06CUceiBgJQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 11:52:59 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Bytedance's CCLA Schedule A update 2022-02
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGm54UEQEiMCre5BZSbN8-cY+BQSCnWb0XCeisVQroTWLKuJFw@mail.gmail.com>
Date: Mon, 28 Feb 2022 11:52:59 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B882470-1567-49C9-8289-36AA84148102@fuzziesquirrel.com>
References: <CAGm54UEQEiMCre5BZSbN8-cY+BQSCnWb0XCeisVQroTWLKuJFw@mail.gmail.com>
To: Lei Yu <yulei.sh@bytedance.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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


> On Feb 28, 2022, at 12:51 AM, Lei Yu <yulei.sh@bytedance.com> wrote:
>=20
> This is an update of Schedule A from Bytedance.
> Please help to review and update it.

We can only take Schedule A updates from CLA managers.

>=20
> @Brad Could you please also grant the permission for Bytedance CCLA
> folder to me?

I=E2=80=99d be happy to but first can you please get Peng Liang to send =
an updated Schedule A with =E2=80=9CCLA Manager=E2=80=9D listed next to =
your name?

thx - brad=
