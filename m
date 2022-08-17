Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5DC596861
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 07:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6x3B411dz3bgC
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 15:12:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Yn6ehUCT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kow2z6oL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Yn6ehUCT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kow2z6oL;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6x2l6Mv2z2xG8
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 15:11:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id AF8CF5C00C7;
	Wed, 17 Aug 2022 01:11:57 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 01:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660713117; x=1660799517; bh=FfpxuAmVi6
	X/23fxe5GsECt2krLU1VWK9iaB0+2+71k=; b=Yn6ehUCTpmdPjS088mqVyT32aV
	Kfb1mgX74eaPF7KAb9xpWpPagtGP01WV01AMu6sReggZoFSKfNNh+dOKywTtm7iK
	+ylcfQf8poRvFExeV5ANYNy4eEkae0th9v3ns7lgnsupiU3XVPjoD8g42IvojDc+
	Pa1Bxu9EQEzJD+8JHS8QFvtVNFR8930Bq2WW7ncaT1KYCpTuqdHxtpM1iaHikTjh
	jRvjOIoTHrphdZjIKpONXvQAhmOmR9aAPQFYD/B0Pb0qvtgJblW/mi9IH0fUx7kS
	XsQDbNCgU8AyeoJER1OdrylkxWKp9OKzOmL84ijHTmR9YbxnDVp+QRGbEUyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660713117; x=1660799517; bh=FfpxuAmVi6X/23fxe5GsECt2krLU
	1VWK9iaB0+2+71k=; b=kow2z6oLU48nIDhnfu6kKF/4wsVJUL+O1PVld7IHoOuo
	w9Ff6eg2T8luK2+9fpsVYk2+orlNcQ//rSHdT1aTmvuhMq8vX8mc0kgbIbguEaWd
	CWtq0GtVMRRwQ48pVRauEdvSuZL/mYqxWnwN3G1VVdqP/WALWjAZJu3IId1jt+U0
	XdrS0PBw8KjbmM9VGIb1fmGqp1eE+ZCLJ3RlJAyc+3E8hG7LaEoqC0U/OPKGMi3E
	rI8q09Cq2q86z2kpeU3EZz34cxSubT08EHaGh1svQ7rdJ1Of2nX4F8e+aNMPVcp9
	fJDVTKaHBz10wxhDegjGdQpIvIpxoZTswmQFz7p8Tw==
X-ME-Sender: <xms:nXj8YjVc06V_8UKD3XOGYb_3KpXX-W7ob2NiVAudTDAuZAbmqpctoA>
    <xme:nXj8Yrn8p75811_tQgHDa9eVkoiZZLZbuNzyYZNpLeJZ_bI7OcOMGBSoWUyTEO6IE
    bVHnCrYFJdZQyN1hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:nXj8YvYogXptLuPqJLxrcboh_dAFVY8z3Lkx1M0IzvlJnriw3DiU0g>
    <xmx:nXj8YuXgdo-Zu2Bmv-DcpFDtsHXgu-SsDhWt1kjk3sFcMR9MKTaTfA>
    <xmx:nXj8YtlDCwmjumlpqgQIZiQVZ8bHXYSXJCp2pa2iEf-_SW7eqQcZHg>
    <xmx:nXj8YrStH8fXszjrhPrxXxyW4k6nYGwyjeMG-Dl9blV2tLQ_tVqWeQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 726391700082; Wed, 17 Aug 2022 01:11:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <61158439-f152-4399-86f8-a4f730dd967b@www.fastmail.com>
In-Reply-To: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
References: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
Date: Wed, 17 Aug 2022 14:41:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday August 17
Content-Type: text/plain
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



On Wed, 17 Aug 2022, at 12:37, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 17 at 10:00am PDT.

Given the discussion from last meeting, is this on Discord?

Andrew
