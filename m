Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE20B89CC
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 05:47:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZKRX4c84zF3nk
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 13:47:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KjQZNlHk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zcBR05pU"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZKQr42YYzF3m7
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 13:46:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1032D4F1;
 Thu, 19 Sep 2019 23:46:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 19 Sep 2019 23:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ZbSAGRhmP6Mm3sVdUGW7jx8KwJe3W77
 euPh1VSpVD28=; b=KjQZNlHkiaH9Ei4OcTI8EdTJz9EoqZ8QtIAaE+exuqqbw16
 LkV8t1rvWxkT0F2ZHmj3/lMl979Gv3MvgaEkAAId4I2rzPne61Qm1SHGNXc9Az0g
 SC0JyOO4n7PRK5ZC99cLpmKma976MK0CrFwJDhPJ1phBRXjeQmCvwQZwZCHkqfsA
 XFVZcYiGqMYhqe1vUDNetpsgdOGNKp7/RvCSWyyBd8H/VMPeqLY/ocNuxW8gZicD
 N5uNlVBMYeNVusevS5aNARlEvQx5Nk10N+IAk5ZjpyV7TzmxOtx4/umR5acRR745
 8Q64bR7H/fo9/oT9MiuodRb9blUPexED43bASkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZbSAGR
 hmP6Mm3sVdUGW7jx8KwJe3W77euPh1VSpVD28=; b=zcBR05pU0rW8+SRavIiwNA
 0XdY/B5vad4UEn7Zp8x6sc0Dom8B7QTcmS9TBYoXSBkE6793xOn8Rf1k8pUI1GzZ
 F+3Eu9oyoz4d858Dfgz6Zny2Ix6sg9vVZssLurBT8sy34QTIv+kZA0IOGIBruN48
 VPBUF/6VqoCRZVYbHFfa7z7x+3oHF69FOIWJvSyEpVx2U39AWox78uEPQqVdEoOG
 r4OkQRmCw/exoa52nQig5YJdcJrIRtkoyf06wi8Souxh3y3hV2ZJhN4u4/5uoe8l
 gCTvngZUEt5KwOWv7FSHORtqvysmQsbLmNidOfIAIDic0w33Y6jTWR+4EQ+PzPfg
 ==
X-ME-Sender: <xms:rUuEXRYiH-CmZyf8YZEswNuGRIJEc6KGyPuWCtaB0ySoGs_5n82rUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:rUuEXfVIvN-V9RCq3JS0aSeIMFM2oK3dOlnkQZ4DZ1R9_H4RVqfTcg>
 <xmx:rUuEXabZU7CuwAmjT29xAHWsWbJ5Nc5MAGKtoHfpJIYWilu13hQEpQ>
 <xmx:rUuEXeLYuUO8X43CjOXIoYimbs2KZNvKtgrzkK7WBGO4DprSgoY5Ew>
 <xmx:rkuEXcFIdeIn7GJ63HG8hoW8OaJQdGh0ePdAtnLe1p-gBfq7yGp1cw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9C13EE00A9; Thu, 19 Sep 2019 23:46:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <1bbdbc81-69a5-484e-9ee8-ba62a710e8fe@www.fastmail.com>
In-Reply-To: <c558c87c-7929-b9d2-8970-531f39979f38@linux.intel.com>
References: <c558c87c-7929-b9d2-8970-531f39979f38@linux.intel.com>
Date: Fri, 20 Sep 2019 13:17:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "James Feist" <james.feist@linux.intel.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: phosphor-isolation
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 20 Sep 2019, at 03:03, James Feist wrote:
> I enabled phosphor-isolation on my system and noticed that kcs no longer 
> worked afterwards. Commenting out this section:
> 
> https://github.com/openbmc/meta-phosphor/blob/a1cee09419cb1467c3d2b7bf996b40089f0d06f4/aspeed-layer/recipes-bsp/u-boot/files/0001-aspeed-Disable-unnecessary-features.patch#L230
> 
> +	/* iLPC2AHB */
> +	val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
> +	val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
> +	writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
> 
> 
> Seems to make KCS work again. 

That is an unexpected result. Have you asked ASPEED about it? I've added
Ryan to Cc. I must admit I didn't test the patch with systems that use KCS
because OpenPOWER exclusively uses BT for IPMI (though we're starting
to exploit the KCS interfaces for an LPC MCTP binding).

Having said that, the systems that we're testing our LPC MCTP binding on
would have this patch applied, so presumably we're not seeing the same
effect there. They're 2500-based systems, is that what you're testing with?

> Do we need this part set? If so, should we 
> create a phosphor-isolation-kcs and phosphor-isolation-bt?

I hope not, given that leaving the SuperIO decoding enable allows the
host to (slowly) scrape BMC memory (or if iLPC2AHB writes are allowed,
open faster backdoors). We should root-cause the issue before exploring
this path.

Andrew
