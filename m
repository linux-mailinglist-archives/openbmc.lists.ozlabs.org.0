Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE343D6D0B
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 05:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYjjb4lS7z2ymS
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 13:59:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=ieeGj6z/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NQNKM4z2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=ieeGj6z/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NQNKM4z2; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYjjB1LMwz2yLr;
 Tue, 27 Jul 2021 13:59:25 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 890B23200927;
 Mon, 26 Jul 2021 23:59:18 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 26 Jul 2021 23:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=2uhanA0T2/qbc0Vl+mdfVmjeIGzYyTo
 LHqhrmBQ3bnw=; b=ieeGj6z/s5mH2CVss2y0XJXQWC1HJK8dwaG8JZwH2yq0uRA
 UdSo+zD3yFBP6neFCZoPBUQOkbW3JMgFXmf/S5Nd6KwddUtja/1Mix3gsn1Gqgpp
 j01cF8mIlhZ0n2R0HYxkQQ5ewgpv9MCkQEcPx10ve4tXcPAGJjuC1OUc1ISZXIDk
 8tMMbIXlc+o3SzvmJmBbTlFJFTXYdOylisx16PgUq26NTR2KYmFCEjIlONSikWa+
 u4tGSBVMLvilN6zLzx+we7iY+7d6e2YgByt4vYHZ2+8ScwNDDOaDUfUMQsrLBTEN
 ArHmTzF51Kl37WKhsyoMH9ZFY41/K0dhAb99AqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2uhanA
 0T2/qbc0Vl+mdfVmjeIGzYyToLHqhrmBQ3bnw=; b=NQNKM4z2Wc3xxC/Vuzv2VH
 wnimEYaAx2eJvUcXqsZgiIIjszJDh5EqYYdqMQz8QydVqkupfDiJnHO+pnTR1Vpq
 5dPmOEiGKZIMrvWU7kQetBJq4h4rLzUmh11speSkjR+WGFpDWEMK6jQN/cLmwX5k
 TBRvbbXEIhOgfFduYEVjt1k7LhSwSkDhIlwTBxte8kONwiJS3wpoPpOi5pQ0qECI
 0SwBrcX37S4t56J1OX80qVnDRhlQn95alB7i+UonMD2ZN6gP5nWwgE7wCcheVhcL
 FRNIsirKqG48cbgKgpoEuhF8WK2pwfmNb1uLAediTRA4WVIbA2nFRNCjhhXQKw7w
 ==
X-ME-Sender: <xms:lYT_YEt398h8Kk5U9q96636iuJJBGpOu7MTmmIM56z1NE3ePtf9v5Q>
 <xme:lYT_YBdJpTHw34haZx8BolM95s3hWbzrKASZrf6yPm6gTCkDn70RFxJR5jkFyqdGu
 ZMJn-8rEIfIOqkvnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeigdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelffetledvjedutefgvdejveetledukeeihfdvvdevgeekudeiteegueek
 udekvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvghvihgtvgdqthhrvggvqd
 hgphhiohdqnhgrmhhinhhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lYT_YPwgn-0jNP4SWpeVMpLr-KMZ42BsPmjIe_A_U_MF60ACua8TUQ>
 <xmx:lYT_YHPflllvJ4DH5I-UgCGnncT0Rg8bJivD4Flzon8Ss3kCLgQinA>
 <xmx:lYT_YE86RqYQha02qtFzuN-9VKFCTBWQRsNxpkGfrYg43_XSAibKqQ>
 <xmx:loT_YGKiekiY-3Om4nvezBZ7N2apnyzyderaQhnLvsyGRv6qkypIlw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64439AC0DD1; Mon, 26 Jul 2021 23:59:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-540-g21c5be8f1e-fm-20210722.001-g21c5be8f
Mime-Version: 1.0
Message-Id: <4836fc6e-1b82-4cac-939c-a7d2052a9ea4@www.fastmail.com>
In-Reply-To: <20210727033319.473152-2-joel@jms.id.au>
References: <20210727033319.473152-1-joel@jms.id.au>
 <20210727033319.473152-2-joel@jms.id.au>
Date: Tue, 27 Jul 2021 13:28:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 "Andrew Geissler" <geissonator@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: rainier, everest: Add TPM reset GPIO
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 27 Jul 2021, at 13:03, Joel Stanley wrote:
> The GPIO is used to place the BMC-connected TPM in reset. This state is
> latched until the BMC is next reset, blocking access to the TPM for that
> boot.
> 
> On both machines this net is called TPM_RESET_LATCH_B.

Hmm, unless we have different schematics where this has been changed, 
it's TPM_RESET_LATCH_N for Rainier (Ingraham) but TPM_RESET_LATCH_B for 
Everest (Tola).

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index aa24cac8e5be..4536cd538af9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -253,7 +253,7 @@ &gpio0 {
>  	/*O0-O7*/	"","","","","","","","",
>  	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
>  	/*Q0-Q7*/	"","","","","","","","",
> -	/*R0-R7*/	"","","","","","I2C_FLASH_MICRO_N","","",
> +	/*R0-R7*/	"bmc-tpm-reset","","","","","I2C_FLASH_MICRO_N","","",
>  	/*S0-S7*/	"","","","","","","","",
>  	/*T0-T7*/	"","","","","","","","",
>  	/*U0-U7*/	"","","","","","","","",
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 481d0ee1f85f..06b3d1573780 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -271,7 +271,7 @@ &gpio0 {
>  	/*O0-O7*/	"","","","usb-power","","","","",
>  	/*P0-P7*/	"","","","","pcieslot-power","","","",
>  	/*Q0-Q7*/	"cfam-reset","","","","","","","",
> -	/*R0-R7*/	"","","","","","","","",
> +	/*R0-R7*/	"bmc-tpm-reset","","","","","","","",

Andrew G (/ Joel): we should probably add a "*-reset" class of GPIOs to 
the documentation ([1]). bmc-tpm-reset seems fine to me.

We should probably resolve the net name issue, but other than that:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

[1] https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
