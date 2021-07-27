Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F083D6D1D
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 06:04:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYjqJ6mdlz30CZ
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 14:04:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=W5KyTH7G;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cbvNp3ze;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=W5KyTH7G; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cbvNp3ze; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYjpy647Fz2yLr;
 Tue, 27 Jul 2021 14:04:26 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 9365F3200923;
 Tue, 27 Jul 2021 00:04:24 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 27 Jul 2021 00:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=OFywGp/LS2dgA+eQQjr3OPX+xjiHG4y
 ADYluhs5qAZI=; b=W5KyTH7GGCGLK8De+FFZs4nE3GnyLenFUo9JxBAVDIrpgbM
 zYyDwhq8HotfbFh6wsIsacKCG+tlVTlXazpxxMfqESMJQwGzH/fph7ytrGHYXpT1
 krJixNsApSKn1K++Npa/IHHffb0riCoB7YRm5dwPdDIiTrw+hGiuy9Nu57eFjMMp
 of5K6l2eMUd7eZp0Pilci0EQfSHYfZhydzPRdiQXdfkejZ0ok8TnZjTfsQZWoqnc
 IL+4XT1pBlAkMQ52AYVI97H+6hAsWicu0a9snOzAFFcKx0/+P52QiREZyub0s/Uq
 x3DNUKRogK+v1UJzUi88yOI9NWhKtWNJz0Cp5uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OFywGp
 /LS2dgA+eQQjr3OPX+xjiHG4yADYluhs5qAZI=; b=cbvNp3zexn2M0mYG+UqUdT
 pShR3x/Tc0jq8WMJVY1CvKH8xfNeTRX1xOPfyWcflFReS9vH48wMfBbuMRIfVegs
 WQ5wwCLSYYJ+crRcvneL2lIyHbsDbslNDImIP4/joLVvXdF1n8Kmqar3bNHqy2x2
 yyAfbDOLNe2BofYVjuYRLbsWYPVFBSrD8e1j1AxGX8Tc9cwtoHKojgBEvtmCk7ps
 rcnFOQ4aAaumq8yAM4Z553meMtfqf4Hr5HvQHe82E2uvSDJTHvdLJ+EgUNHisXws
 /ShFmtfCIPYqXKVfhau2LgV69I1gGU2EAxKDN1EXluy0e7GJqFGm1KlAu3WMCnAw
 ==
X-ME-Sender: <xms:x4X_YMj1k8Iyee5Q8fFbkax3F1LJhMvd1Xv1n6tzWoNo1wm7GckZmQ>
 <xme:x4X_YFByJxRecSnjoUxDa-YQEGDkAR-Xc9urybx9r1IxQgyExpEzKs8v6yDfQXlJz
 gqHT5X1heqfstwMyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeigdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:x4X_YEHkn76cQn3JDuOpj-n83g0LTWq8SwtfKiHYFA_0PArYNGUAfA>
 <xmx:x4X_YNQB9t91h9RbKyobpoS5WkxfP0oz7y4aZhpMbQdVkSmP3QoRSQ>
 <xmx:x4X_YJwDFyUfy-cWuiR08kjN9SUqb0qtAUHwvoyar935EqtqBkDtTQ>
 <xmx:yIX_YKrz07STIqjtWggYdWojZUFdgKEs9S4lrW0K9aGHYz3hmOj19w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1562FAC0DD0; Tue, 27 Jul 2021 00:04:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-540-g21c5be8f1e-fm-20210722.001-g21c5be8f
Mime-Version: 1.0
Message-Id: <7b4c65c0-fd00-4a5e-986e-7072d20db6ea@www.fastmail.com>
In-Reply-To: <20210727033319.473152-3-joel@jms.id.au>
References: <20210727033319.473152-1-joel@jms.id.au>
 <20210727033319.473152-3-joel@jms.id.au>
Date: Tue, 27 Jul 2021 13:34:02 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: tacoma: Add TPM reset GPIO
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 27 Jul 2021, at 13:03, Joel Stanley wrote:
> The GPIO is used to place the BMC-connected TPM in reset.
> 
> The net is called BMC_TPM_RST_N on Tacoma.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index e33153dcaea8..e39f310d55eb 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -126,7 +126,7 @@ &gpio0 {
>  	/*M0-M7*/	"","","","","","","","",
>  	/*N0-N7*/	"","","","","","","","",
>  	/*O0-O7*/	"led-rear-power","led-rear-id","","usb-power","","","","",
> -	/*P0-P7*/	"","","","","","","","",
> +	/*P0-P7*/	"","","","","","bmc-tpm-reset","","",

Needs the documentation update, but otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
