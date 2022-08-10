Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6C58E637
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 06:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2cHv4MLrz305W
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 14:23:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=IZvNq6qu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=5O8u1AzZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=IZvNq6qu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=5O8u1AzZ;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2cHV37skz2xHr
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 14:23:02 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F1C223200931;
	Wed, 10 Aug 2022 00:22:59 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 10 Aug 2022 00:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660105379; x=1660191779; bh=uPpc5J9C0c
	mgKwSQdVasbvc/kCI68LfhUl19QvMEFSw=; b=IZvNq6quYB6W4g6FtXOORhG3ug
	tjfuNsMNHFVtRMDqW6EV/MXeJEZpDC0Gz2A0RIRIh+XuJn+bOYi36kTr9ShuL+J1
	LYbxkL4bRlwJfWaM+gBONUFC3agRkPQ3zfQ2hohbWOR9k25woO6BHLr/+g0XyTZZ
	6oFY/1ymxuia7auT5a344j4GvBZrwc1+yRYIp5M+ebLt5/arPJFshI2JLNlhl0Y2
	OPVchZJh+Hko5HBiyYa3LpVpmMeupe8AKem0vikguFqmsSA2tEDv90NniGt4B81F
	S0ZqksfJfq6/GeGit8shGNajyImJYO8MpEA862SgZoUhl684nhCy99/RDoGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660105379; x=1660191779; bh=uPpc5J9C0cmgKwSQdVasbvc/kCI6
	8LfhUl19QvMEFSw=; b=5O8u1AzZPsf87E5veF9yKc2jwCXQ536+Lml+8wh7wWrV
	haVBzRN59yMMasyqDWxRzBfnQqMD7Fx3+KoukEpkA9HQMb8GPn21YGcMou/R2cS0
	rEZWS8d07RxYhuMV4DYM3GB7Ymvnkx4ObIHXS2+1pyPaNdW+GimmfTrKO3sn87z8
	XU6upCl2RL0ZMl1LUi0686UzgQmAEuFmqiGHdZBKQbAVAnDhnLqkNbTLStMZ0kCn
	xgJ8Khq58ba1s6ANLOrFXyJmZx1UM6pDjUqSfpV6iPqfp16Y4WRQD9O2SeFBqRK5
	Dgc4MhQLX5lT/lErOTYQ69hFD6iioD2+6TdwKzoaOQ==
X-ME-Sender: <xms:ozLzYuFeBEY0ij9T-nr_ASrvwfIrwKVMuPVjhaxy5POTfPZsWuwipw>
    <xme:ozLzYvWnfJo1ZxoorWU2r22_edXRgDoZPuZAmTuGUmc_keiITGWz5c8Atp9x9Je47
    b2_ugtDdxdL50H9ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ozLzYoL5NQlefOa5_k-g2L0Zzj-szh0OLy_Xyo5eDRpQlh4htdiypQ>
    <xmx:ozLzYoF04W45YVLFHHZqsvME4dJZwpDxCxjGiyYsyddwRoyPe55bzA>
    <xmx:ozLzYkVF2kWblLzFxSu574_l2bonqGelFCbcd8rCIpCVXVTCx14RIQ>
    <xmx:ozLzYrTBTyaNS3XaGUk3ToVvzGHN7-OIrPXoCUlHOpTNSsrBH5fptw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0B2031700082; Wed, 10 Aug 2022 00:22:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-811-gb808317eab-fm-20220801.001-gb808317e
Mime-Version: 1.0
Message-Id: <945f5419-3352-4be5-b8fa-5973138f37aa@www.fastmail.com>
In-Reply-To: <20220630110745.345705-2-patrick.rudolph@9elements.com>
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
 <20220630110745.345705-2-patrick.rudolph@9elements.com>
Date: Wed, 10 Aug 2022 13:52:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Rudolph" <patrick.rudolph@9elements.com>,
 "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts: Add IBM
 Genesis3 board
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
Cc: christian.walter@9elements.com, takken@us.ibm.com, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 30 Jun 2022, at 20:37, Patrick Rudolph wrote:
> Add devicetree source file. It uses the evb-ast2500 board files.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Zev Weiss <zweiss@equinix.com>
> ---
>  arch/arm/dts/Makefile             |  1 +
>  arch/arm/dts/ast2500-genesis3.dts | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/arm/dts/ast2500-genesis3.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 3515100c65..ed9714d832 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -678,6 +678,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	ast2400-evb.dtb \
>  	ast2400-ahe-50dc.dtb \
>  	ast2500-evb.dtb \
> +	ast2500-genesis3.dtb \
>  	ast2600a0-evb.dtb \
>  	ast2600a1-evb.dtb \
>  	ast2600-bletchley.dtb \
> diff --git a/arch/arm/dts/ast2500-genesis3.dts 
> b/arch/arm/dts/ast2500-genesis3.dts
> new file mode 100644
> index 0000000000..544758c5b8
> --- /dev/null
> +++ b/arch/arm/dts/ast2500-genesis3.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * IBM Genesis3
> + *
> + * Copyright (C) 2022 9elements GmbH
> + */
> +
> +#include "ast2500-evb.dts"
> +
> +/ {
> +	model = "IBM Genesis3";
> +	compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
> +};
> +
> +&spi1 {
> +	status = "disabled";
> +};
> +
> +&fmc {
> +	flash@0 {
> +		compatible = "spansion,s25fl256l", "spi-flash";
> +	};
> +
> +	flash@1 {
> +		compatible = "spansion,s25fl256l", "spi-flash";
> +	};
> +};

So looking at ast2500-evb.dts, you still have both the SD card slots,
both MACs (in RGMII mode) and i2c{3,7} enabled. Is this intended?

Andrew
