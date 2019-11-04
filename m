Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159DED82B
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 05:10:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475zqR66kVzF547
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 15:10:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kMqe0PUL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="afwbLz6T"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475zpc3qSmzF51T
 for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2019 15:09:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F062C35F;
 Sun,  3 Nov 2019 23:09:55 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 03 Nov 2019 23:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=DvgC+wNNLlyVTwSvWeQpxD94rQl5bWe
 OfHB2HpQQlDs=; b=kMqe0PULxXxKO4TpwA9Cv+nNBduJl1fJv8tyguEnlcMPZHd
 R6LCTzXJZG3Eki02i3hTWx8D9mrwCYZ/i/9LT4/8RO2y5CVCmoJ8hk9YnaZ9ybTZ
 DHwf1yRvI19YiN7R2L3r2nzTb+l7kObqQafIgkoPkiJwBg6+8v3aTQnib45VFE6F
 ofxFFyGP8KoN9uX1/7xVCmhG2441xBZe+Fn7PkBZnnxtc12RfbNI7pDntnnVHkKp
 mOkHXRxT+Dk+DIwM00VADaPKFrATi86tX6XkiTsHoSpMofYXHlD9yunbJp7ptfNR
 wQUxEzmVPNIfinDqOno4VUG5O/GUwhNjGss/Mrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DvgC+w
 NNLlyVTwSvWeQpxD94rQl5bWeOfHB2HpQQlDs=; b=afwbLz6ToaX+USKUCbXGWE
 ThDTaCLp0z7/0IyrgtLT0l9Qp1b8/SNF3oN+QRw+aLZUT9P4Z2u1ACyzP9HwUUjN
 JkhpRz+dVlt/MefdtH79qPgYR3ErNK+XfEZXFo4Lro4XxAZ7Kf/ycsJ3ngADELzD
 pGm8Lmwl2iLDtztnJnHByMyUchMc+U96zzAcsYYnlC5EGz8pxzWJR2bCvRo2bqCm
 57NhTxI5V8f12uujDbRfFFg8/0xbqU+540YeVMYoizLFRvXQ/XW7YwyrJ6SCiwhr
 1Sw5tgGhaTRhXGC8f/VYwvCfntErMd2FvBpZjUueJh/KpouvX0jcfzr0L4LTwilg
 ==
X-ME-Sender: <xms:kqS_Xcuo_gum74EKtoRslMAtp5Lhe1aifcaFKdJ7YCWhBLszTYBtMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudduvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:kqS_XQ-YL0TZUxaiTQtRUFHGsY1pjq4rrYiJg2PwRuXVfwbt6TP7jw>
 <xmx:kqS_Xd1OWYR5MEXaIGT3iORU_m9RzjyPIIc547ToAaLfWgteSs0g5w>
 <xmx:kqS_XdQrTkC_ZosPxPWNEoqbOxSKMbqNAO2i7M9XC_Hc2HD1_855Rg>
 <xmx:k6S_XZrKg02ilP1alJwk07XViWN7n1yJ4ALT5aAy_Jws1Kc3Zzu06A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7DFF1E00A3; Sun,  3 Nov 2019 23:09:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <734758c8-66a9-494c-9dff-e7d4c57fb1ec@www.fastmail.com>
In-Reply-To: <20191104040226.24376-1-joel@jms.id.au>
References: <20191104040226.24376-1-joel@jms.id.au>
Date: Mon, 04 Nov 2019 14:39:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3]_fsi:_aspeed:_Clean_up_defines_and_do?=
 =?UTF-8?Q?cumentation?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 4 Nov 2019, at 14:32, Joel Stanley wrote:
> Some of the registers lacked documetation but now can be properly named.
> 
> Rename FW to FULLWORD so no one thinks it means 'firmware'.
> 
> The "enable DMA" comment was setting the FSI access direction for DMA.
> As the driver does not yet use DMA it can be removed without effect.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

This appears to go on top of my FSI series which goes on top of your other FSI that is a rework of my other FSI series. We should probably start merging these patches :D

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/fsi/fsi-master-aspeed.c | 34 ++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 94e9b4f3418a..8da29fb9a69e 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -63,15 +63,23 @@ static const u32 fsi_base = 0xa0000000;
>  #define OPB0_FSI_ADDR	0x1c
>  #define OPB0_FSI_DATA_W	0x20
>  #define OPB0_STATUS	0x80
> -/* half world */
> -#define  STATUS_HW_ACK	BIT(0)
> -/* full word */
> -#define  STATUS_FW_ACK	BIT(1)
> -#define  STATUS_ERR_ACK	BIT(2)
>  #define OPB0_FSI_DATA_R	0x84
>  
> -#define OPB0_W_ENDIAN	0x4c
> -#define OPB0_R_ENDIAN	0x5c
> +#define OPB0_WRITE_ORDER1	0x4c
> +#define OPB0_WRITE_ORDER2	0x50
> +#define OPB1_WRITE_ORDER1	0x54
> +#define OPB1_WRITE_ORDER2	0x58
> +#define OPB0_READ_ORDER1	0x5c
> +#define OPB1_READ_ORDER2	0x60
> +
> +#define OPB_RETRY_COUNTER	0x64
> +
> +/* OPBn_STATUS */
> +#define  STATUS_HALFWORD_ACK	BIT(0)
> +#define  STATUS_FULLWORD_ACK	BIT(1)
> +#define  STATUS_ERR_ACK		BIT(2)
> +#define  STATUS_RETRY		BIT(3)
> +#define  STATUS_TIMEOUT		BIT(4)
>  
>  /* OPB_IRQ_MASK */
>  #define OPB1_XFER_ACK_EN BIT(17)
> @@ -575,19 +583,19 @@ static int fsi_master_aspeed_probe(struct 
> platform_device *pdev)
>  	writel(0x1, aspeed->base + OPB_CLK_SYNC);
>  	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
>  			aspeed->base + OPB_IRQ_MASK);
> -	/* TODO: Try without this */
> -	writel(0x10, aspeed->base + 0x64); // Retry counter number ???
> -	writel(0x0f, aspeed->base + 0xe4); // DMA Enable
> +
> +	/* TODO: determine an appropriate value */
> +	writel(0x10, aspeed->base + OPB_RETRY_COUNTER);
>  
>  	writel(ctrl_base, aspeed->base + OPB_CTRL_BASE);
>  	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
>  
>  	/* Set read data order */
> -	writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
> +	writel(0x00030b1b, aspeed->base + OPB0_READ_ORDER1);
>  
>  	/* Set write data order */
> -	writel(0x0011101b, aspeed->base + OPB0_W_ENDIAN);
> -	writel(0x0c330f3f, aspeed->base + 0x50);
> +	writel(0x0011101b, aspeed->base + OPB0_WRITE_ORDER1);
> +	writel(0x0c330f3f, aspeed->base + OPB0_WRITE_ORDER2);
>  
>  	/*
>  	 * Select OPB0 for all operations.
> -- 
> 2.24.0.rc1
> 
>
