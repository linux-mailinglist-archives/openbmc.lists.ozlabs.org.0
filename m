Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E313304D70
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 01:26:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQPXx58S0zDqvy
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 11:26:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ijJP6Zrc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=juzHo2ER; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQPWk1ps0zDqZB;
 Wed, 27 Jan 2021 11:25:20 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2F4A9580A86;
 Tue, 26 Jan 2021 19:25:17 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 26 Jan 2021 19:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=PWoGEuMDDaDq0/pzXUUiU1EckS7iVUN
 1oFV3i9oQBqU=; b=ijJP6ZrcT4CZpTc74xXzMI2pxevxBiB9raVSnMYyR3XEr9f
 ZvTbpO/Cv3Ts9ZgESw+B2H7zHkMQ81/s1YPxw9Umyf/DOkYHpTMbv0rJcFzZN6sz
 h6zLgANlm1G9OdyCsZhq4Xn0MbyT0szBEw0NDMC7qpbKb6ajKp+zZvPmxEF/Wa9h
 x/tYkP34EglzHAwI/9Rekk0jUvHjMvb95wuFVp5W6XSFv65Pe1ltmc23v8c3aKyR
 wsg+ed1PltmlLunEAQcaRBwiIRjhWa9QngDoCdl6v/QlxPArLxi8BfU0/0AskhJx
 8aZgHqfxRzfFe07tr/X0jX6RQ7Oda+lxtT7WhsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PWoGEu
 MDDaDq0/pzXUUiU1EckS7iVUN1oFV3i9oQBqU=; b=juzHo2ERd2n3YX6adW2OnL
 1N2Lcs+iMO3u0lHnRCNU+G0QiOiQ6Bxp88DZLVuycTPl2EZbp6pSvkAJuqbIiZVk
 7hKv5/ECVpBa428xHcpHMYMTzup8Z2dufAnY3ea7drNrTx0VvoYir1BQUkOavdPN
 h6EeFMfUXFb/5t1xqgg/DtJZUH+0Zkmz0OiNmvcw+gbaj7DaqbrdIwsG0sh1RxGz
 VpljwS3yLEGoSXcKHidiY7Ji0a9l7qw3FFgbvOzQDBZtL1ulonAMYYtKs0N0IyhL
 uvhfNPw2RWvneouixTI7Y2sNMdcG7uA5AWAkqQonnsVdnvM+0gcLxbmFX4UlRG/Q
 ==
X-ME-Sender: <xms:67IQYBn8zZXF8aV1RL_0StSGOYIqxaIZpgly8jt4COCgAgtGwllFeA>
 <xme:67IQYM3oNDYWI-tCEy477uy5A8_jkyYEDz9iZAlq_ATf5fsL7z_mzbh0JBe78vlkX
 HNdvqzoh6MJdz_HIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7LIQYHqlC_id2kk_RUPPOjvILObK-6rLPAF0rdMpgN-cO2dcN0PlBQ>
 <xmx:7LIQYBl9_LBn5Q2kfDBVLjH2lfV5yEtoavFtu2HhrMuLx4apq7EmcA>
 <xmx:7LIQYP19NXFgSEQW7lDZAmIcFU3kWOFppZ43ScCjIf_cWKOONFJySA>
 <xmx:7bIQYIt6bnrgYF6qn5gSA3F0qVPgYqpnlefxekr4vtmCelQAJagDWw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E5484A0005D; Tue, 26 Jan 2021 19:25:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <85f00459-4a39-441e-8119-8e12f8132cfe@www.fastmail.com>
In-Reply-To: <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
Date: Wed, 27 Jan 2021 10:54:55 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Lee Jones" <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
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
Cc: linux-arm-kernel@lists.infradead.org, BMC-SW@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

Any thoughts Lee? If you ack it would you be happy for the patch to go through 
the Aspeed tree?

Andrew
