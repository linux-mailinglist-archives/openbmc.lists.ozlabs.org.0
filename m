Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EA130CED
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 06:17:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkJr1xS3zDqCG
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:17:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="reyL3VM0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TdnjNui7"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkGz5PdKzDqCC
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 16:15:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 833C44E7;
 Mon,  6 Jan 2020 00:15:20 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 06 Jan 2020 00:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=h00L0hTKmnlWcqzol1Msdac8fiSmEkw
 NaRxn3KtDQIQ=; b=reyL3VM0saJ8bBKZX8DfMDAg8kyqMgBsU+gOmRqklj5NSOc
 HYiI00odhJ6eCXR3+r/Jfhgw3VuiyqGj4M7dCYYE9n52d3cuRKHILeMUb2bJA1mf
 i2+hV9UxZ2ayrHWzI7cnaD/Ekvlit9M/q30g9gWWYx6NEJuSGoNQUb6QDuU2y69t
 MHBzcqdTxLuxK1ZcZ9lRXY5ol9EMwCFyBuZ+jndLo0G5WVxem2rIQ2k4pgScVdQY
 rGX2pBMZkngRUQzNEbTmV2UCPVBQc97YvMR2ugzX3Ac3iXyr8fiqmMSo0/cWvEk7
 lnkeKKsBuP0aPTY2uPuDQnXRWRDeebRzADcR0xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=h00L0h
 TKmnlWcqzol1Msdac8fiSmEkwNaRxn3KtDQIQ=; b=TdnjNui7GmSxwu49hGe7sl
 RQl0BKcTL99c+Xdjd5sMepKcAtQ8iWC96I8sJ8jJF9CQEw5mx70dBrHKpgbWG04B
 qGF1x9+um2olEs4aEyp1OZ34BxV2pXYU8NVI6scv70yEzt6i7l0mUmb7kRmHRkct
 Pgy+VYwa3oogeR2BtgqQVQt1kHvryeRQwxpqeB5HrAwfn38uxYU5khehNq0o+Dt+
 TzXXCTSVWG5c7sGZFtIeg3KEChp1o/+HVX/oSXgf8K+9swoY9lRE6TnUQT3VN65l
 xNoOAaTX4BSBT9DRZGCfQxFwto2zLw7AoNBT49rRFW6gYXM/HNVULeaM+6gWn4bg
 ==
X-ME-Sender: <xms:aMISXktu5TIuikTDBXTbvF_S02yTh_a8-AWrJo7-4R_XFDc9leroUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:aMISXmAj7ZvIx61S-OMYyvP7mOOqkOmYTy_SkciLfypi1lpEVvkUTQ>
 <xmx:aMISXlPT8G3BQKtguVeqQ6kMBc_n3j8QoGWoBzYeMi9tmXgEZY_SMQ>
 <xmx:aMISXp302Fqi_nAnFHO2fgZ5w3c1ANULtubR6BswgleKA13C4IerZQ>
 <xmx:aMISXiuqdpTsMmCKDr2DPtiyWm5FRPH-EdkamT16l8HUi1WMZ_RRrw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F0ACFE00A7; Mon,  6 Jan 2020 00:15:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-731-g1812a7f-fmstable-20200106v2
Mime-Version: 1.0
Message-Id: <52607315-2a3f-4bc7-aad3-b7eade5af8a3@www.fastmail.com>
In-Reply-To: <20191223134735.559200-4-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
 <20191223134735.559200-4-joel@jms.id.au>
Date: Mon, 06 Jan 2020 15:47:19 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_3/4]_ARM:_dts:_aspeed:_tacoma:_Remove?=
 =?UTF-8?Q?_duplicate_flash_nodes?=
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



On Tue, 24 Dec 2019, at 00:17, Joel Stanley wrote:
> This is a revert of "ARM: dts: aspeed: tacoma: Enable FMC and SPI
> devices" which was already applied as part of "ARM: dts: aspeed: Add
> Tacoma machine".
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
