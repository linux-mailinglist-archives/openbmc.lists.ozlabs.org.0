Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A64784A7DAC
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 03:03:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq25h3WHgz3bck
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 13:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=j0eboRkc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XWSJnChz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=j0eboRkc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XWSJnChz; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq25D0dZJz30Qy
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 13:03:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 50C5432021A0;
 Wed,  2 Feb 2022 21:03:22 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 21:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=AZ0tXWyFyx8p9IW3KNtLTPZJXl30eMvv66HQlH
 TuyVU=; b=j0eboRkcOdtC1HHqLWBinQ+3FrssQ8fSGNg6o6sv1ZC9kwoG1+wgy7
 lVwxyqIktWH8cJqcsPyef308nC+OLaKl4IFGIeO/PAv9FBeRdf2qY7CeTXEeYb0E
 M5B8cM9gTWtckWbvvhHpvCfcNeTf5E7oStnOtH3W1GQwNRLcxZvR4HPLO+nPXgpL
 bj1APZndwzG0I/3+yweGOCTdVFNfPb2/Uj+ff1wjDWK3QyWbeKBvQ1bheaB5EMrj
 VuQZ+doMnbksZq2dRsrNnokpsbZRBAalQ+Frb3116ut/UT5+C4Gf7exxw08jL5vU
 pjH5yA3MKjIQjE2wD5i7u4fJKd4rvxHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AZ0tXWyFyx8p9IW3K
 NtLTPZJXl30eMvv66HQlHTuyVU=; b=XWSJnChzIiZ4Dklq+7AeadQeqJ59N3/VW
 g/3nOmdsJeiI1B33iG/4rXF5ge1JK90MDlLTfMMHq0cEgiZl6wwVCi6u+bco3Bpt
 pPXb1RQK6zedznU0rwqTbPmF0xq6VnxOW1h3jL+lVEgNBtNWwndTSkn/e93Hy66o
 wa1hdKxhaiI/gmUBE4P0Y0gQuD1E/FxTD7kcXeXNYaCyiNOSxH28nHCJQ4JM25gD
 GoKTxUgk1l10kX7tjKGGf4warl31k0Ke8qnGLiVP+S0cq3+MAvBREbP0xHNzMoF9
 OemRfAfClq1V6xtuMhrh2dOqHyfuiv2zLAyry2hdiihuZ7Y0fKlEg==
X-ME-Sender: <xms:6Tf7YWpEoKd0ck4ZuKMJ_emmZ9ALD72ipQ2a5WECW-mXjLF3bCBa4A>
 <xme:6Tf7YUp5YqJQIfQeSWgrab5Rmf4M3RP1xPNS2vaO9FXoyWG-yzD9TtpNqpraeZTyy
 YxFUm6I-meos1yTqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6Tf7YbN4fpD4jQ-y2MEQeuCLb-GOrky_GXvBabNqc-G8Zx5pmjcrUg>
 <xmx:6Tf7YV6iMeqRzI9rWKt2fRQx3C8RPO9vDfDzYZ3koa24haBeg0vEkA>
 <xmx:6Tf7YV5a7r16UuLtJNEKt6IibD-xpjf5fIB8dKilT-0Zon3b_iMfXw>
 <xmx:6Tf7YWXLfAUYSAkWWiO8pnKaVl9sKXWcFUiYXmVecJW1lRiLmLT6Rw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9DA47AC0E99; Wed,  2 Feb 2022 21:03:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <dcdac94e-a877-44b3-bdc5-9be8045c1e85@www.fastmail.com>
In-Reply-To: <20220124191503.88452-4-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-4-eajames@linux.ibm.com>
Date: Thu, 03 Feb 2022 12:33:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 3/6] gpio: fixes for
 gpio-hog support
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



On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
> From: Heiko Schocher <hs@denx.de>
>
> recently added gpio hog patch was "in discussion"
> state with Simon Glass. This patch now adds most
> of comments from Simon Glass.
>
> Signed-off-by: Heiko Schocher <hs@denx.de>

Cherry-picked from 49b10cb4926285b856b207c1f5bb40c75487f08b ?
