Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBDC955E
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 02:07:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kCxH696RzDqTP
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 10:07:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bzu8Ts9R"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Z373g6b4"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCwf3bzNzDqSm
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 10:06:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6DB92534;
 Wed,  2 Oct 2019 20:06:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 02 Oct 2019 20:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=HjNWu0bDiQiNHDXrRln9qyNrNOVkaPn
 bYeTNWifveEI=; b=Bzu8Ts9RMWXu/bzxutngxjxkIURTVoJG7dvHGMd0jjrp+Bg
 8DlG6s3SZgkOflCkCsj5RrgVAah/1GihAsQQltpvl/GWuKThe+vv7KvbIoerku9c
 Zd85CsvYDdh6gcO6o2n4225bdD0HLaERmS9wRvVR3GggrWguWKcbaxOgHstBsNG8
 M8ns7LhY4y2c0+hB2jurYBhb4oSpuooRDEJ92P3YclUT0PCH25xjsCE95xv5usyk
 evP9doFtA+cKjdlmzinC9/kkt3NhCArb0Dw39Ia50sJqy5LlxKxQK6MMNrvrHPL0
 QJ3beMHtHCw7Twvx7K/s9TY2E1g1CDe0f4cXbvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HjNWu0
 bDiQiNHDXrRln9qyNrNOVkaPnbYeTNWifveEI=; b=Z373g6b43Nru/O2BBm/dFU
 QNe4//kb9xLTjiQftIoKIiOX7OlkQAzbEZdlWL3afhroVsfGvLM5NmFltiCOkhBH
 jzGQEDb775EQGEu9YBI2P0ZBuZU+18ZZNFXD+lNvlZytIDdXsjOFu9M3hNiQlLvw
 T4i1GBfz3OI35BJMdmZeXUIh1JK4fq1/gS+ugvVK0/A8uEuHm6wqmxw3UW6Fv/ir
 gtxoJVR0F1dY/TZhmVCcxsTXSnFGbEtqVfZbJOyhDQWWhYxFvsTksfix3txEaJDx
 RF04sCxCa7xWhSppn4qNrCs0va3E3i5hdiiJWLc2yQbeQ5GQgr4fyPQmG6G04WZw
 ==
X-ME-Sender: <xms:jjuVXYZLPbgoMVAdDq3pLJTCcoWeL-kU9xGCayGJD_XiYg4ki77c1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:jjuVXfGeFULOfpldSMFruvc6Z1CwCncFNgDhypljMGUIhucqSh581w>
 <xmx:jjuVXekXmRiX3fThJONVZOdl8kynWN5YvvhsQ9EFatb-SNhyIPORog>
 <xmx:jjuVXezi2gzNr1Ay4Wcy6UsCyw04SueM4arCLNI3uD7TpJNGl_NW4g>
 <xmx:jzuVXcddHUVpCnfnKWD6rxPYMZCX2rOmEeao39aer42tqU2Hp1s-Tw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 30823E00A5; Wed,  2 Oct 2019 20:06:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-359-g64bf1af-fmstable-20191002v2
Mime-Version: 1.0
Message-Id: <71992bb4-445f-45b9-aa0a-5eaf0dc71cbe@www.fastmail.com>
In-Reply-To: <20191002102328.5196-5-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-5-joel@jms.id.au>
Date: Thu, 03 Oct 2019 09:37:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_4/4]_ARM:_dts:_tacoma:_Enable_LPC_Fir?=
 =?UTF-8?Q?mware_region?=
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 2 Oct 2019, at 19:53, Joel Stanley wrote:
> Required to provide the host firmware to on Tacoma.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 02eeea6a9bd2..55d5227caf69 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -22,6 +22,17 @@
>  		device_type = "memory";
>  		reg = <0x80000000 0x40000000>;
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x2000000>; /* 32M */

Should put this at 0xba000000 if we're going to use 32M, or if you want to
use 64M like Rainier then 0xb8000000.

0x98000000 isn't wrong but it fragments the address space more than
necessary.

Andrew
