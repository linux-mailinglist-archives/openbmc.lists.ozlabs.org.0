Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37738BB44
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 03:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmT3p2Mwrz301k
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 11:07:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=qS/t6oHc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ey5WlOZo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=qS/t6oHc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ey5WlOZo; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmT3Q716pz2xxk;
 Fri, 21 May 2021 11:07:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0ED2580B35;
 Thu, 20 May 2021 21:07:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 20 May 2021 21:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=VqniBBYHeMtICu1bEyH03RfWAVnT/MX
 E1EJ8GYbbaIU=; b=qS/t6oHcnBbQftMtJ0RQdmwgJfF+Viz1BLmU3fi7QLkzVBL
 G0GMtJyc6L4tFuQIPl+SKBRuZRuAOOD9asnynSm1NhcKd2WBbiV/narmumRmd+2d
 tZ1jAjs420Na9JZBvlEIROdhokOBLmFzdabEg1a0RkDQgCsJ8dbwG4eW60DPf4nt
 bG8g3l31xwWMDvJmZ/FbND2x5B9FJdRyJlsa5dTqA9B5QJlZwXB3Dxzb9zQ+AGyF
 1qJDNIrYYcdt1af/qxmvMrnwvP27xpaKoq8pmhrdr0qjdVs1z3E846W7o7K0sZx7
 D2m88vjQCfTih0jydx7oMTUUrmgil8tXE9/5aLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VqniBB
 YHeMtICu1bEyH03RfWAVnT/MXE1EJ8GYbbaIU=; b=ey5WlOZouTBGAdwhFpqyzX
 jbGaUDMWEilCQk5crTx1sAnyUyraXVS7iCKyWbPFh6rStxCQrtN2ThiQMVy+jyIW
 ZJ1lldtYvzqhrvLPELLGjiKjii1LEpbFkg5LbzxEhaIx7zrZZoEA9OlEOxZDzC2l
 961TW0xLy4PafDCGlCyjBZIREoJcUrD+KkDO1NV0vn5Lh/HpwQrokKoe/yt0U/hy
 c0w9pMQpw+bSrRTJyxL90PDlXCtwUkVLspU01fdEitFeaaB8z9bDDhYwM9YynjEN
 Z8z1VFdaaCOFCrTs+8NnTHDpByL+YYTqX89yYgmtcjXAgP8E8SRxwlCwgNvdJBlA
 ==
X-ME-Sender: <xms:vQenYEIlsXuZBh4Yd4jeD___tJ3sNEw0cMzWi9klSCRxzlEYs4XL0Q>
 <xme:vQenYEJFtK67hGFzbyFHqtVueQvPwkgOzgFBD29Lvk0FZQz7bYp9HKGuODgUH4oaN
 VYjtE7XaMiMo5L-NQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejvddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:vQenYEshM2WB1_vWyH7_F5KCi6YeBvaFRFvtM2OA3UoLEU00G82U-w>
 <xmx:vQenYBb7tQZSWWjOXowm6behOalL5Jh-nik9VtRZn73PPsVBzOMvQA>
 <xmx:vQenYLZwnSMmEAXUSfAey6_wY7lzAO0A2xTw4Hz1a9bESlS1zncCow>
 <xmx:vgenYJBE1A-ARSFCTP7n6FYY5LDfREejcxH6pZe5IDaBGeWq_R1G6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 122C7A004B1; Thu, 20 May 2021 21:07:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <8fc49b36-256e-47ff-8834-bc60fb7a2450@www.fastmail.com>
In-Reply-To: <20210520101346.16772-4-steven_lee@aspeedtech.com>
References: <20210520101346.16772-1-steven_lee@aspeedtech.com>
 <20210520101346.16772-4-steven_lee@aspeedtech.com>
Date: Fri, 21 May 2021 10:36:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_3/3]_mmc:_sdhci-of-aspeed:_Configure_the_SDHCIs_?=
 =?UTF-8?Q?as_specified_by_the_devicetree.?=
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 20 May 2021, at 19:43, Steven Lee wrote:
> The hardware provides capability configuration registers for each SDHCI
> in the global configuration space for the SD controller. Writes to the
> global capability registers are mirrored to the capability registers in
> the associated SDHCI. Configuration of the capabilities must be written
> through the mirror registers prior to initialisation of the SDHCI.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
