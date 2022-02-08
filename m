Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928844ACFFC
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 04:57:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt8Nt1S9rz30Mj
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 14:57:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=SVWTxnN8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JinE16RL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=SVWTxnN8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=JinE16RL; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt8Mj6dkZz30NW
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 14:56:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3EAD75C0178;
 Mon,  7 Feb 2022 22:56:48 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 07 Feb 2022 22:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Pf1FVZIT3m6FzTw5Nz3yydfyvZrbzlW/e2zpW7
 p3UXg=; b=SVWTxnN8APycrQfujs4VFR+LfXdh/FqX1Z6P8h6YD5eA2/SueDaNec
 9MSUFE5F+D+alPKm0TPFVW5MYY1TxkDXb6O/B3USwVqxDRMkKCvheNI0UGXH0wpp
 YWqTHUzvkcotLSKsXi1p+A2zcZ1mR7uLMqsys6FAqcwCH2z+OvWRd919WhXISDKD
 59LIR7MA8gcqxtoaFx7o900vClgGl9I7bo8sq0U4bmEjPzc3h6lsLymZGaqxq+05
 XSxTbiiLjihhtP9uUy31BVgJydLxU5XlSzvvpUVwIoyImi8HtMLQBeORSgktCP7+
 llL8B7tUszh0rnrLtTBs9tD0MzHCWstg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Pf1FVZIT3m6FzTw5N
 z3yydfyvZrbzlW/e2zpW7p3UXg=; b=JinE16RL+I/ldk6MdtVno3FAEfyBEZeWk
 PEZWMEA1wBVonKmLeGrsGoY4gmaCWdM6tAdg+xjz+RsoKhCL6pqCF/iEclPpg3fA
 f+euL1ZMfItyoE/D9l6L0cH/nWt2T2OlqM6tEzWLdXpioW4ew/5ZgWMp7IdhIVr4
 IO1MHGiO0wQaUhOO8ie9Zv8+Xdwi9UjiclvJguDUV6x3SXrIA+QTQD/ZJgNMMAy6
 fxz44cbflt7c/4IwJK+cwU6tXiSw67IrMbmWgrJ955YJjlIZrHAVhHeY0DWf7GfD
 sAMOpFKW9Al9w4JT0wEy9aOAnNdbSJ+0nx05qTGi/G5XuKMIvZerQ==
X-ME-Sender: <xms:AOoBYiw4HTfqQSz7yFasaOCdPwnZ3DfIx2Iap6CAvamEEPA0KI3aAQ>
 <xme:AOoBYuSObvD716JiAUEsvA-ird_FOEz0FCbSlmJUgFL3qE0Eiw6HKJnoVg7KaccKJ
 0AhTZw3InZNOr5Saw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:AOoBYkUHBB0LmRq8YrL7LK_q44iyZ9RE5PZc7zBB1WbezM_RbxJpFw>
 <xmx:AOoBYoiCvsfV0-YfJJJXVjKqUamgmpnVZ7FpQ_ljGdtlChnSWu3GFA>
 <xmx:AOoBYkCIB7fyk2qfV-4a6X9ntrexLde3_re4UDmDZK2OTiYUU53eow>
 <xmx:AOoBYvrnTk5Jm7soHi-3UNP_KPMsROxOcn2CDY-nlpuviyKsoQmDNA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0B2631920083; Mon,  7 Feb 2022 22:56:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <f4b9c687-e716-45c1-82f9-ab3d03ff85d7@www.fastmail.com>
In-Reply-To: <20220207231334.59845-7-eajames@linux.ibm.com>
References: <20220207231334.59845-1-eajames@linux.ibm.com>
 <20220207231334.59845-7-eajames@linux.ibm.com>
Date: Tue, 08 Feb 2022 14:26:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
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



On Tue, 8 Feb 2022, at 09:43, Eddie James wrote:
> Hog the GPIO pin to reset the TPM.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/dts/ast2600-rainier.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
> index aae507b4c2..d0e82d1512 100755
> --- a/arch/arm/dts/ast2600-rainier.dts
> +++ b/arch/arm/dts/ast2600-rainier.dts
> @@ -108,3 +108,14 @@
>  	u-boot,dm-pre-reloc;
>  	status = "okay";
>  };
> +
> +&gpio0 {
> +	u-boot,dm-pre-reloc;
> +
> +	tpm_reset {
> +		u-boot,dm-pre-reloc;
> +		gpio-hog;
> +		output-high;
> +		gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> +	};
> +};
> -- 
> 2.27.0
