Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6D43A961
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 02:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdY2x6P36z2yPs
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 11:43:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=W4lnkCAy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=E0Fmka/h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=W4lnkCAy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=E0Fmka/h; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdY2T5sBjz2xX5;
 Tue, 26 Oct 2021 11:42:57 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 88CA4580675;
 Mon, 25 Oct 2021 20:42:55 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 20:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=KfId3zDeeQQl/KssBDK5CIkF0Ft/Bsc
 n5IlmX7vmGVQ=; b=W4lnkCAy+fi3mjBX+CM5qW7hAbHq3VZYlD+PMtAShxwH/T3
 f0C1FVl5eQwqzd8hgesNoANfK9O8gjtlD1EVks9Rbz7NxnH9TsBOBSwZxPoouzrs
 tD/qmJcZEcPGveCqo/m4wFqAcPRigmoubMt7ETgLT70WCYExweBnNrfYU7VcfTEa
 4lVgXHNHivZ7ke52osnw0xUEmMwS3FKrdln7bzcLLKzeVbh69XS4FqLO3wxc1Z/O
 TUZaxLymXwZj3aT+Ac6CAGjuz+7wRgd8IuYPY2QmfY39O5IYBnlupUwzmWTE1FWk
 wd2CZTTMjmamxiU+QnVjfbEAXjGriV7llQFGuew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KfId3z
 DeeQQl/KssBDK5CIkF0Ft/Bscn5IlmX7vmGVQ=; b=E0Fmka/huuODDXk8U8NmIJ
 1WcVUjvdrU3fYHSVt6ky7uto4GlfrUM2Ofyhds1xnfDiCmF8GBpWamEO8mqjuBcM
 hg0PNudUs1yQ5jU/WcI2TcebcnTFuCjW+kDPM+nQ7ueKCzPeE3jvskfeUqSE7O7Z
 ur9dfFtxu/vrnxyGATk/aOW8O1Pt50doqYk1h/OhC/5uc6Te34OufaZfW2xnP8B8
 6aUUrT9QQWsCz2bIXSTVQygl7tTrHymeQy3liI01Ii1cGZJgAhxKglUIKDIvWybm
 +3onXGQotpa1lDj0tLE56M7zm/S6CvuYmhx8Rv7zU0BT4Ypw9cFvxCNFzftCiIXw
 ==
X-ME-Sender: <xms:Dk93YdrdScfPNM669ixbDglfvCYJlkGfPhlFj-rovAy7OsJcIZvvEw>
 <xme:Dk93YfptsxCQlYw-MwV6kMJNzG99CrNzQgr0LhMorY78JyFS9yyhWexcb-8gpt8-i
 hhtsJmRLLBV4O-qEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefiedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Dk93YaPHDHcE8xOKScKhhKiak8JaZ0CI9hiinkes00SWVOz-g32h2g>
 <xmx:Dk93YY7e9NS8MNVG2d582L6fVkNYyTmJZoHkuZJ5V-BNiw2qTVsfvQ>
 <xmx:Dk93Yc4aYjfRxfyxNUmTcL-y8jZ4XyZzr5BMkATk4MUOTxlPY5zQVA>
 <xmx:D093YcxuyNIo92npvjc8wF_uKt6VT4dwT4MeEVp75DU127SoyWrNTg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B396CAC03DB; Mon, 25 Oct 2021 20:42:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <88c261c2-797a-4803-ac30-24f95a397496@www.fastmail.com>
In-Reply-To: <20210922103116.30652-4-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-4-chin-ting_kuo@aspeedtech.com>
Date: Tue, 26 Oct 2021 11:12:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mmc <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 03/10] dts: aspeed: ast2600: Support SDR50 for SD device
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



On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> The maximum frequency for SD controller on AST2600 EVB is
> 100MHz. In order to achieve 100MHz, sd-uhs-sdr50 property
> should be added and the driver will set the SDR50 supported
> bit in capability 2 register during probing stage.
>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

As this is a limitation of the SoC it should be done in aspeed-g6.dtsi. 
Unless I've misunderstood?

Andrew

> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts 
> b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index b7eb552640cb..4551dba499c2 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -280,6 +280,7 @@
>  &sdhci0 {
>  	status = "okay";
>  	bus-width = <4>;
> +	sd-uhs-sdr50;
>  	max-frequency = <100000000>;
>  	sdhci-drive-type = /bits/ 8 <3>;
>  	sdhci-caps-mask = <0x7 0x0>;
> @@ -292,6 +293,7 @@
>  &sdhci1 {
>  	status = "okay";
>  	bus-width = <4>;
> +	sd-uhs-sdr50;
>  	max-frequency = <100000000>;
>  	sdhci-drive-type = /bits/ 8 <3>;
>  	sdhci-caps-mask = <0x7 0x0>;
> -- 
> 2.17.1
