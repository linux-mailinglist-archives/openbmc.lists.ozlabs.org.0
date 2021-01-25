Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE433025B9
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 14:51:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPWVZ248kzDqNL
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 00:51:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=Fsj+P4Mk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=di1W2jaN; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPWSh0YtbzDqx4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 00:49:40 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B49825C00B3;
 Mon, 25 Jan 2021 08:49:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 25 Jan 2021 08:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=nnc
 470NGga7i5YGQsWq30VeZPj917T2MTFqGfiWrbjA=; b=Fsj+P4MkbzxIpI9gCZM
 EnaKroovoIYpSimcOd6UZo1k20IbjV1LPAQmYNJpBYvjYA23KTppUcto0ostN6vZ
 sA7du8rkkDBTaZytrs4vHwNmBpgBi1y4jvhH4oyMUbRQLcc8g9o2Hh86gIVriuPj
 HnMbcp16MXme6K9mypZvRxOah2940UDHBFwYjQhdmYQkxWpy+2yKyR8mzdeoenp5
 TiK8XSAwvc4n5Db56aK0XcMoWqCU04g2AQFe+CMKCCERYYJvleIH4wRQir52fU22
 npGKSEMJWESLRWN2fSknty7EhwFw90HxUyV10WQcgOxuSS6DoRMWcvBqbYoAL3LP
 uBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nnc470
 NGga7i5YGQsWq30VeZPj917T2MTFqGfiWrbjA=; b=di1W2jaNwPjUzATXILqHaI
 DD3UzbijTX9x/KdipCMSKOW3L6nV+5gt3U3A5fjR/Q0I7bYel8mxZYVyqcWDXypY
 CQg/m7/OmlH2G7E7QCOfd7f3IBDsmWB1N/wosFFIFcwcyEr5H9twGkb4eC7fy3eo
 xLzFemM8Hf5D4I3WqEmBvs7MfSWQh4fsif7ErVOkt9m0HbTF9CbK+M4XR7Q9+grw
 k+SRbrkfbHXANibyeGF5rOLjpoMsTHlUu3jMpiCrxhdbp6YYJXS1JmJRWtzOMdgA
 EpTQtg+dKyhed5tZ4+BQ4LXcUaAgkq6TgmpHFl39X79NluPEUhAgfiBKBmE7DSJQ
 ==
X-ME-Sender: <xms:ccwOYGiKiCPZQ45KC_tV13wCSedv2frXwk9b7d2w8TmO7cljll_rXQ>
 <xme:ccwOYAoR8XAJvW0pgSWhIlFkpn1m61lvQBZDPN4Ktu6ryzFG0cTzlxvMY4UfaBc-p
 kukQKaYSehnGPY23PI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:ccwOYOE0_b7dNv11zMXZKt-2LXWLdQ2amknv16tdi32le2LUkxLIfA>
 <xmx:ccwOYCmyO-HE0bdNAqisOKNPYrPmlQbfXNRzLq-spl2AlUkK1i-lRg>
 <xmx:ccwOYBk1Ej3lFjdUtwk4UhhJHMhAlyYpeidcsnNkEnvdtGeQT0v04g>
 <xmx:ccwOYOzDLBGyPcl9LMnv9Na4fA1ip3BnVR9dMiAptou4XhG4DRoC1g>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59CA124005E;
 Mon, 25 Jan 2021 08:49:37 -0500 (EST)
Date: Mon, 25 Jan 2021 08:49:35 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Gerrit owners plugin coming
Message-ID: <20210125134935.paonxxi4pzbkplzr@thinkpad.fuzziesquirrel.com>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 11:23:25AM -0800, Ed Tanous wrote:
>Over the last few weeks, we've been slowly getting the gerrit owners
>plugin deployed and tested, and got the OWNERS files merged into their
>respective meta layers.

[snip]

>Overall, I hope that this will be a great improvement in the overall
>structure and usability of openbmc, and remove at least one stumbling
>block people new to the project tend to hit.

This is a great piece of work Ed, thank you for getting it done.

-brad
