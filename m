Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F11B966F
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 07:13:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Xxb6gbJzDqS7
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 15:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=nvIMh9PO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=c924mz2h; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Xwn6TzFzDqQC
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 15:13:12 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BA8C85D9;
 Mon, 27 Apr 2020 01:13:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 27 Apr 2020 01:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=BFqGdldW9cMvyu2zvmi6Ftg2Zeoy94i
 LEyT/dL712Xs=; b=nvIMh9PO01nepRWQ9kQYB98R34OH/NBV3NcK0i3yPrmQjZN
 QiwuoZt20xOhn3EkvwqRm8DrvXgAWMmJTCF7y3vaUqmverqfkGD176c1a+B/xOpJ
 k/JiOEhiVpmWPoA/Eaxl+LlSTwJIa8jLxt0JPaW6r/O0JYxr2SwMR8TljNqop4jG
 KJQRbBJpxq5Zuj+OMiBAzZ3MCMirv6zS/g0mI2Vl9hkCy5BeqiWJEX7GWj6KCnUF
 V7N6aAQco5TeQzbcZ7cVd4xWrwWK3YogprAYlnj0NtacbIySUn3J8xGgsgtiXTHO
 jYfmyzmbxPyRJ0BOEW4UFkprJ3DSGilOUH7xxSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BFqGdl
 dW9cMvyu2zvmi6Ftg2Zeoy94iLEyT/dL712Xs=; b=c924mz2hdHq1AFbChIHX2h
 zT55ps01fTgwItO3TJawxPJOb9vZdv48cplcM8ctwJ4DCXiI/xWJcAaNY8bi2YFv
 MvEa8vAGuhCIY+OqV1Mc7tq7em/zbog5Yus2MxQwOQ6aApM6HWZo3FnB+cub77NX
 M2Z05iQvxH4+s8OeTBvQ7qjchCU1kjWQX73iE9hwTUFVMChQExTdlpzTDQBuJVyz
 n+GGnBGVuzc6M/hy0S01MPY5CBZVqjFozOrknyVq+3l69f+16umpstPA0BmJysjS
 8kpSsB8h8Fn5YROmoRdxHC0kMC+S9lldx6EXDF9mfuafAsSn3VcFVKBpOIMXLzeQ
 ==
X-ME-Sender: <xms:5GmmXj8MJ_UzD5z4OsbcpySj-5JbAre_-_caRQZAIsQfVqCDUivgrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheekgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:5GmmXktu2qi26dXRwWUl5HD1-ddXTUuY_797rlJn-vNXWSkafOptJQ>
 <xmx:5GmmXh4fqfb3TGmLvsBto9CBFddY-BxQxRxdlOt2bw3bY8C59Bo8mg>
 <xmx:5GmmXlN3XYDdNgF-V5SVq0AuILkmxavW0JGVcTRjUofLxmmCXsyMtg>
 <xmx:5GmmXs8LwbwVreJmBP6-1p9thgrC_lMTJVDowhpKuQ7bJ8sWW4Kxhw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 21D93E00C7; Mon, 27 Apr 2020 01:13:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <7771a1a6-9641-4e21-8006-e88897dae626@www.fastmail.com>
In-Reply-To: <20200427050944.2177237-2-joel@jms.id.au>
References: <20200427050944.2177237-1-joel@jms.id.au>
 <20200427050944.2177237-2-joel@jms.id.au>
Date: Mon, 27 Apr 2020 14:42:47 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_1/2]_ast2600:_ram:_E?=
 =?UTF-8?Q?nable_device_tree_based_DDR_config?=
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



On Mon, 27 Apr 2020, at 14:39, Joel Stanley wrote:
> The driver supports specification of the M-PLL via the device tree, and
> partially supported using this to configure the SDRAM rate used for
> memory training.
> 
> This patch finishes the job and exposes the setting through Kconfig.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
