Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FEA70DF2
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 02:12:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45szSP0stTzDqD5
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 10:12:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gfz4EdWC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="yoOf7DGo"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45szRk0lJ4zDqCM;
 Tue, 23 Jul 2019 10:11:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F064A18C;
 Mon, 22 Jul 2019 20:11:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 22 Jul 2019 20:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=OhbCTTG60O0DLmCkPQcpm3oAs+SHxL2
 0Bi+NL3pjrFY=; b=gfz4EdWCw5geR3T0Nv6uC10gwLgbXdG1NmooZZRWtJlPHLu
 Oi/TEL1TjlJo0WXQxv/btzpXRnf13/i+eSQSffupe/Pc5uHLoLqqlghOPolNBBHc
 TsbG7KmQWwR7QjGiHvI9qZHA5gRpQFrFOh1XJq+/aujstUMdsakglnn4fkBm8+UO
 h2ISpYcxPHA58X1JBZwjP7qgDY1LM/Sa2JW1Bv35gKZ/YXyPbTS1nro8D2qAr+dN
 C14UhQZ7f8QGHFu/8w1cXKEwkleStkKgqDbI4m5gr0g50JF8V1t4QL1GbIPqK/An
 LpiRKgXMkWtkDLBLzbnkLGk9BIY4NQ1/cYYCAIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OhbCTT
 G60O0DLmCkPQcpm3oAs+SHxL20Bi+NL3pjrFY=; b=yoOf7DGoRHotgDYBTTP/cE
 lnt03girjOtYtIuzMVM0RUB1zc49s3isN/xtLSINjtXtz0Cr1h4EUwqVxv+g5VAK
 S7jWf8w1qSXTWnHPZ5j3QXx275irrMjPl1GpIw52xMefLv0Jfmql+mHRbnvoy1E5
 JHEY/N5pA++41W0UsvEMmOc3CaBq7Q3f0nRn6YyWdU7kqg6Y2I6x14bCgEpKEvQN
 2V7AH/nBGNbtRmSuZGTR6y3xkRAyMNRvg9j/SFdiS/NRoqB8e929h47l9/FK5hw0
 dgKMO4b2w4dx+iS/SBk0MrOmEYjw3jGkcF61APuzm4uT/YtFZUGQn0CfjsAiuhmw
 ==
X-ME-Sender: <xms:uFA2Xdgv_ebNr7axUGjj1Sc48Nz5QsKlWi7EZcxD1oL89exJRIe67w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeehgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:uFA2XWRkDt-5HVxSikoh3EpqPJuAmCG-uTyerkaxsLXD4aUWc7MUug>
 <xmx:uFA2XYGDLe31OEgb3YUOdMua9jBcyIV5RA08FD5fUzEvu4L3zPjFMw>
 <xmx:uFA2XWntcQiSELRGzKyoqvilqtSyfImHWBVjuOjvRHr_0_cRjHb1Bw>
 <xmx:u1A2XeuF8Tq_FVjkjJTffj90tr-oZFL8N_CVcSST6GovERNF3d1Igg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4A9EAE07B2; Mon, 22 Jul 2019 20:11:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <802c5419-08ec-4a0e-8a50-ad4a1bbf7f3a@www.fastmail.com>
In-Reply-To: <20190722192451.1947348-1-vijaykhemka@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
Date: Tue, 23 Jul 2019 09:41:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Joel Stanley" <joel@jms.id.au>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: tiogapass: Add VR devices
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

A few nitpicks.

On Tue, 23 Jul 2019, at 05:10, Vijay Khemka wrote:
> Addes

Typo: Adds

> Voltage

Unnecessary capitalisation.

> regulators Infineon pxe1610 devices to Facebook
> tiogapass platform.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts 
> b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index c4521eda787c..b7783833a58c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -144,6 +144,42 @@
>  &i2c5 {
>  	status = "okay";
>  	// CPU Voltage regulators
> +	vr@48 {

The recommended generic name is 'regulator', so e.g. regulator@48

> +		compatible = "infineon,pxe1610";
> +		reg = <0x48>;
> +	};
> +	vr@4a {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x4a>;
> +	};
> +	vr@50 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x50>;
> +	};
> +	vr@52 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x52>;
> +	};
> +	vr@58 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x58>;
> +	};
> +	vr@5a {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x5a>;
> +	};
> +	vr@68 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x68>;
> +	};
> +	vr@70 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x70>;
> +	};
> +	vr@72 {
> +		compatible = "infineon,pxe1610";
> +		reg = <0x72>;
> +	};
>  };
>  
>  &i2c6 {
> -- 
> 2.17.1
> 
>
