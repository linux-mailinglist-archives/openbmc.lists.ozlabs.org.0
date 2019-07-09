Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA062CDD
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 02:04:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jMxB4QtyzDqPn
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 10:03:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="o7gBeCCT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MycKtDXa"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jMwZ2qnfzDqNP
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 10:03:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AD3C922076
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2019 20:03:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 08 Jul 2019 20:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=trszowY0aMDu6MwV+oqHgWVNW6uJwSv
 OeNg1riiqE9g=; b=o7gBeCCTRTtTpXZlYgo3JIFnoTCuQOEq8O8vsjpqmoJNi1o
 ZzC6lON0XQ+Ax3naxDjTfIWx8fJAISAKZKf6CfiP5GiaDOxHGSfRXpd+KDzaJV4x
 8m69JjyB8YVP83uL2oY9xRhvXoVyBmx5LfMOe4na1KMxnVxE6dTnmootuRbNjrqS
 53+vWDvwtewWHSgPNN5abvdW9vinoB22tVdvtcABCgQJIDJBjqPHSDYuTxBqA9Td
 3l4xVkAb8gjLuT/3ELT4s6RTOKlRah428AUCEO+Q0++JIlYNBY3Lk2vg42qjHCbU
 BSd/dQFVv4dFS2LUcG3n+7P9NFNfh3QWsBoA1PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=trszow
 Y0aMDu6MwV+oqHgWVNW6uJwSvOeNg1riiqE9g=; b=MycKtDXaQQ+4Ko/CRKbwax
 EjAW6Sg3fpFxpEYVjFtH1nSkSHY84cggbTBrEfFtzJYCo5KESP/xH2swAJ7xG1Vb
 7bbs4iwTQUuoNKcIBKS1yVqM8lze2wR+3e9/9hGTgbOSCKU3Z+PrjTt77r3yBGNM
 iyx2NKzZAoOs9thp+IMsT0sXr386aZ99eQYAfbEVLDJrciJQ/ERWDLJbcsMlLt27
 t/HY/0KQrdQYNIMs5NY/JytKgeX/9tDi1VCvTGRcnrXDrpQwP3yBRsDdry8JnDV4
 6MOUTkLCazHKmgmBQIUli+WSk4Z7I68mMhQ5aHEB3YZAsyis1K6Tgv9y4vuJ4g7w
 ==
X-ME-Sender: <xms:ydkjXYlfPXAgelQV0l3NonvMn2YLUX2A-80zooWpbdt_1vGLgwr67Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgedugddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrg
 hjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ydkjXeo1Z2KH863jiGIlCT799lbC9-U4k7qj_2lDw5GTLdFXV8EuTQ>
 <xmx:ydkjXX0kNdAUvlAmFD68naF18obI3a5mNkEjHOKGh17XlDNkw4AWRw>
 <xmx:ydkjXSUyu4LQjEWO80qod-cfySU3JpGLfHLSbaaT79EZPUE1Dsg46w>
 <xmx:ydkjXRboglQOm5z68flwzqGTXa9yyBDmQgSja9sev-GxfoHPV-t7Tg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 04160E0193; Mon,  8 Jul 2019 20:03:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <142fc044-fdc9-4a3b-a0eb-6034c1bd86b2@www.fastmail.com>
In-Reply-To: <20190708024749.22039-1-joel@jms.id.au>
References: <20190708024749.22039-1-joel@jms.id.au>
Date: Tue, 09 Jul 2019 09:33:25 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.2]_ARM:_dts:_aspeed:_Remove_mbox_node_f?=
 =?UTF-8?Q?rom_device_tree?=
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



On Mon, 8 Jul 2019, at 12:18, Joel Stanley wrote:
> This device driver was never upstreamed and so it has been dropped from
> the tree. Remove the node from systems that had it enabled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 4 ----
>  3 files changed, 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts 
> b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index c762c02dc716..628195b66d46 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -235,10 +235,6 @@
>  	flash = <&spi1>;
>  };
>  
> -&mbox {
> -	status = "okay";
> -};
> -
>  &mac0 {
>  	status = "okay";
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts 
> b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> index a3d6b71518fc..73319917cb74 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> @@ -163,10 +163,6 @@
>  	status = "okay";
>  };
>  
> -&mbox {
> -	status = "okay";
> -};
> -
>  &pwm_tacho {
>  	status = "okay";
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index 270c9236deff..caac895c60b4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -317,10 +317,6 @@
>  	flash = <&spi1>;
>  };
>  
> -&mbox {
> -	status = "okay";
> -};
> -
>  &mac0 {
>  	status = "okay";
>  	pinctrl-names = "default";
> -- 
> 2.20.1
> 
>
