Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054874A7DDB
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 03:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq2QV51V2z3bZG
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 13:18:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=OKkUEbzl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AmL84h41;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=OKkUEbzl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AmL84h41; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq2Q51Hzgz2xBl
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 13:18:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 49848320228F;
 Wed,  2 Feb 2022 21:18:03 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 21:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=mfHgXyBL5vOzlOZpEO504I99xzlqObygshih5J
 bBvFM=; b=OKkUEbzlyab9IF/dkJocni5eQTRqU4h3cSwX64uHwTdsQPli7VMBt4
 oSLKCPOiyjNpIe9UlzVNHifwt7ycaofliHuqOYWNMnR4oGcn99y+aJ5dWHunBb39
 bpH9HeqiAN3EDQ1eDmbtwS5ke3t4xf+7i8NeH8tqWd1d+BCnX5vVH97fOR+ytRag
 /7t36LqUtT7983iKKDUhQZceIZEH/wfTuB0UCHQQq6L+Wv6IpU9ZtKWMAzZ2g9ty
 8OdvIVsAaTnSkg7osy6aShJjZUVgR7tdJUheH8XWYpVfD8Nj+nt6QE3qIGtNgMvK
 phgJ2GwqgQnWCNWSExwigZnwjtXlK/NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mfHgXyBL5vOzlOZpE
 O504I99xzlqObygshih5JbBvFM=; b=AmL84h412ssaRp2yCo4Gr8aJdtJIPC0Gv
 H9dtPd5dj23RJc/z9lo3KhoZsNV3V3o+nbMcV/LJeQPQPJ5Q7CZddMtXjZ6iNH+3
 VigPKKWT2B4zAASYDZKiiwaKAsMj/2g1I/nF1Mr9VHQNRfJGZnz5n0P/XLTnT33Z
 CPQEY/UFm0KO6g+kxxYNEBht9bO0wylok9AYynPYAT6WtNmEJ7btOvSFK7Gai38P
 ArDpaTGgZPevOKUnnVXgL8xcF8BBzNp7baQhik6xYA7n/vvb1pvYJXFECrabIHZL
 GoeJfL3cGVAeDDy7vfLJXziLSsv/XtsDPI29GtJaFL8ZmS+8Rxp5g==
X-ME-Sender: <xms:Wjv7YWzkKsxAVd5ZYIsbxB1gSWj-1pnLReVFwpw4pZ48XXk4XLF6yQ>
 <xme:Wjv7YSRmAvvEBBByV395vYnEm-_z4w1FcBDXIUyrn7dh8MlXvgd_P5p2uSsAzG2qg
 7ymVnmw9Ur2VNFc2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Wjv7YYUtWmC_1neitkQcMu89DBAReR_xEnV8PbWWw1QwEccWOFXxoA>
 <xmx:Wjv7YchLypyS_paqWObUOJbQwag87QYjfesQ1bbvPLv1O-2oS-b0-w>
 <xmx:Wjv7YYC42wp2UUG8Xbdf_7lIsYiizgLhy4lSa_2kQXT9Cb4FVKE1lQ>
 <xmx:Wjv7YX-5t2fbWFQu4hoMiqQK9iVwvrIaGs6idVif1y9yT8tfQWAwYQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9FE3AAC0E9A; Wed,  2 Feb 2022 21:18:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <4bd0324e-9226-4072-8cb2-81ae305db55a@www.fastmail.com>
In-Reply-To: <20220124191503.88452-7-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-7-eajames@linux.ibm.com>
Date: Thu, 03 Feb 2022 12:47:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 6/6] ast2600: Add GPIO
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



On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
> Hog the GPIO pin to reset the TPM.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
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

Do we need this in the hog node? Seems like it's only necessary in controller nodes.

> +		gpio-hog;
> +		output-high;
> +		gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> +	};
> +};
> -- 
> 2.27.0
