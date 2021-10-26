Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA04D43A945
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 02:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdXpC4qg0z2yYS
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 11:32:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=G5hbVnk0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H6NSn7Pf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=G5hbVnk0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H6NSn7Pf; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdXnj6LGgz2xt0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 11:31:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 913B3580760;
 Mon, 25 Oct 2021 20:31:48 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 20:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=yGoSd29Cl/DpdxjWB405Kt4Sp2gFWlM
 pymgEnWabDSc=; b=G5hbVnk0JCzsRgIKCE/zxmoYd6SCcVHCbTJ+dq+ACnXagec
 iSCGQ7oc54Xnjt5E5RLshmhz+tplC9zrFFTMcVuLu/dJyLB37A5VCUm4P6xUecvK
 4MBTqH2xwfFIOS6wk5rrTgmzscT23IG/Flxuhmnb/OV62ziW4VvIgg+OG950tROR
 A6jWF8DMuE84bAOE+5UzqviLa8vFgUHctbuGhBoIi+iEjesbWrezhDBcG+iN2Neu
 W4Ierywl+bU2bvRzyYUrDOPX3XKIEXzGXZ6lBkpXCEUuye079Ib14dwux/htr09M
 7Fk9Fw4eXhA3x0YJ43OS8+2oXdxZEtBFMm1ggmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yGoSd2
 9Cl/DpdxjWB405Kt4Sp2gFWlMpymgEnWabDSc=; b=H6NSn7PfoZYoJsdI00BkD8
 ZLcFJreGwwR+oCgmERVQjkeV2Dwr2mjJ4stGIqGRjlwPEteX5/2fuG6pc6QrWQky
 NA5rDmD8E+0ApDejrxxn/bkbLSwL/tgP5jOjE69AMoCFh7iSF3S+LeVosNt/VL/r
 LexgmDGPzazWT4BtmNQyQFPgjuv4yz/dh8+CK2cWcNhTUhYvbUDvShp0QeGt+yDB
 E/vGE5EBbEPCNxgBk+zPgAqHzahQesU3viyQ3zMriy9I/0GJyhNIM3fb36SewzK5
 ufy2OsjcshliEGICJWU/U8HGUhwBCCPcM5DnqcaNcw71S043ZeVEOUE//ghwkQwg
 ==
X-ME-Sender: <xms:ckx3YSmWA47RG7TypvFraRZdeEJT5RmoQAYnfB9SezwsseoI6bu-1g>
 <xme:ckx3YZ3hMfTxOIa_hMNKi1KO-C64ei5HpM6kG_0_YVMCwD_X1pZZ2gIhWuocZbaGt
 Q9eC60oMWQ2grq5Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefiedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ckx3YQp2DORzmZFcnyrDUbEgLjmB651RleT8wCWVflujcIkzNhRXrg>
 <xmx:ckx3YWmqdg0WxajkV4mm3SvCnP9dsgV3cSNbw6CkZWP3esFswIq01g>
 <xmx:ckx3YQ2psLu7AFkqHm9P2oP8NNwIW42wNoY3T2Uqe5GKCI-v0QEykw>
 <xmx:dEx3YWNg6tgtgPfBxS4KDgRZLUHZVorYD5ucY1BqXBvG1qYtIgMreA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D76FCAC03DB; Mon, 25 Oct 2021 20:31:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <125453f3-55d5-4b2a-afe8-6e76b268ce01@www.fastmail.com>
In-Reply-To: <20210922103116.30652-3-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-3-chin-ting_kuo@aspeedtech.com>
Date: Tue, 26 Oct 2021 11:01:26 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mmc <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/10] sdhci: aspeed: Add SDR50 support
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
Cc: BMC-SW@aspeedtech.com, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chin-Ting,

Sorry for the delay in looking at your series.

On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> From the analog waveform analysis result, SD/SDIO controller
> of AST2600 cannot always work well with 200MHz. The upper bound
> stable frequency for SD/SDIO controller is 100MHz. Thus, SDR50
> supported bit, instead of SDR104, in capability 2 register
> should be set in advance.
>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index 6e4e132903a6..c6eaeb02e3f9 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -35,6 +35,8 @@
>  #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
>  /* SDIO{14,24} */
>  #define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
> +/* SDIO{14,24} */

I don't think we need to duplicate this comment.

> +#define ASPEED_SDC_CAP2_SDR50          (1 * 32 + 0)

Can we keep the defines in increasing bit order (i.e. put 
ASPEED_SDC_CAP2_SDR50 above ASPEED_SDC_CAP2_SDR104)?

> 
>  struct aspeed_sdc {
>  	struct clk *clk;
> @@ -410,11 +412,17 @@ static int aspeed_sdhci_probe(struct 
> platform_device *pdev)
>  	sdhci_get_of_property(pdev);
> 
>  	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> +		of_property_read_bool(np, "sd-uhs-sdr50") ||

Minor formatting issue, but can you make sure all the conditions are 
aligned vertically from the left?

>  	    of_property_read_bool(np, "sd-uhs-sdr104")) {
>  		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP1_1_8V,
>  					       true, slot);
>  	}
> 
> +	if (of_property_read_bool(np, "sd-uhs-sdr50")) {
> +		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR50,
> +					       true, slot);
> +	}
> +
>  	if (of_property_read_bool(np, "sd-uhs-sdr104")) {
>  		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR104,
>  					       true, slot);
> -- 
> 2.17.1
