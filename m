Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53C478018
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 23:46:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRzf5mGYz3056
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 09:46:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=KLxZBWVX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=e47xmrqE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=KLxZBWVX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=e47xmrqE; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFRz873Sjz2yJV
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 09:45:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D662A5C015C;
 Thu, 16 Dec 2021 17:45:36 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Thu, 16 Dec 2021 17:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=fkHHUnD8E85GLrYPdMFuHbpjkrEBbfb
 ZJMcvz6iecxg=; b=KLxZBWVXT0EqfeOFire2kikUJUaL1F2w9ICHHzpErhI381d
 V1jpfuA/W92viQ2NqBjfuMq5vIaTjHiazAfe+Rk4yk0b12F+5tHjDDNqJ+wFoifs
 S98C3R0L0n4U4xsHMdw+PPMtxaLVBInMPttBEUtOML35Vmu/OkECZFlXlmSCX7Zx
 Z9PHqxTpRJ+LEmQu5j7YHVdg1KuaVIgXVlBnDaHRZUJ20lxZdJiob/oQEcvD21XI
 0QOxIkWoNlvhZJ22MEhK1d8XlQ0YMxg8QwuTDsyOLmk8XnZb6/HfDZPx/Et41xPW
 6QFq5rI0LI8esfXGOhNrZK/J1KnMux0E/hBfkHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fkHHUn
 D8E85GLrYPdMFuHbpjkrEBbfbZJMcvz6iecxg=; b=e47xmrqEG7vFW+8l2QLuvj
 yr1S3jlCApP0ydlvzgEdkuhczkkXqn6xMnf46893PuRlfLksYoUJ96NJBmhHRtKa
 PsPHK6bX7YNAVa3lwl51c73GJSCApwVaV9GTxHtkRIIPIicayhIhF6CcJkmAdKfZ
 Heb0pT7WleUxj+GM7VGlGhLGC+f/kbzbDrzx70Z0plCvrFmI5b4Taxwx7Scqht1x
 Zg40P6Cf0ihkENw2TUNREtyWhTQUcRexbhN044UrXeOFm+4psR5MFVVAh8mvMeo2
 Zruy0Q1ZYxOtuD+CelY0niJmP7NS8Pka6tj9OBeFmuIy3kYfNC0XEBM3PoRewsiw
 ==
X-ME-Sender: <xms:kMG7YTUq_rFNYIvtfQshuA9fw3hcUlht2c1uLwJiF_j2mB9sLmdCEw>
 <xme:kMG7Ybmy9Um7l3IdFWFrCWDbYc_Vcwl5K6k5ikgaF1mWv2ZX33YZOeogNk0m76frz
 3DV8kyM2ifIHgZlpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleehucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgvficu
 lfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
 hrnhepleekgfffkeetjefhtdffgfevjeevvddvveegudduffduudekhffhkeevgfeitdff
 necuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:kMG7YfamG2TkeI1o1PT0tULQ9-c1aYuHbbxXnIvccpOalNYq1Kn37g>
 <xmx:kMG7YeWGcvvfFjlqEeNRVx3FeVnxLRida0dpZ_nMDUPxAwO5GRwA4w>
 <xmx:kMG7YdnxVCIO51hM-qv68xcs2vuYVM_16glZ5i9kL93w8cD24zJPBA>
 <xmx:kMG7YSwBUacrekn-EM-2otPL0vi4agI0PXnSRmMj3xn4_pGs1aaAWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 30B0EAC03DB; Thu, 16 Dec 2021 17:45:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4524-g5e5d2efdba-fm-20211214.001-g5e5d2efd
Mime-Version: 1.0
Message-Id: <f42a6852-ab70-48b8-ba5d-74ba503e63dd@www.fastmail.com>
In-Reply-To: <TYZPR06MB4015221527D36DC4780C1F23FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
References: <TYZPR06MB4015221527D36DC4780C1F23FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
Date: Fri, 17 Dec 2021 09:13:39 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Patrick Williams" <patrick@stwcx.xyz>, "Troy Lee" <troy_lee@aspeedtech.com>, 
 "Steven Lee" <steven_lee@aspeedtech.com>
Subject: Re: Create AST2600 OTP image
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

Hi Jamin,

On Thu, 16 Dec 2021, at 17:11, Jamin Lin wrote:
> Hi OpenBMC team
>
> I have some questions about OTP image creation in OpenBMC. To support 
> AST2600 RoT(Root of Trust, AST2600 ROM code verified SPL), users should 
> program "A public key" in OTP and uses "A private key" with SPL image 
> to create signature and place it in SPL.
> The SOCESEC tool help user to create OTP and SPL images for AST2600 
> secure boot support.
> The following are my questions and solutions
>
>   1.  There was a socsec-sign.bbclass in OpenBMC and it is used for SPL 
> image generation with SOCSEC tool. Do you agree if I modify 
> socsec-sign.bbclass to create OTP image?

I'm not convinced on this one. While the OTP configuration and the 
output of the socsec signing process are tightly coupled they involve 
separate processes. Off the top of my head, the fact that socsec and 
otptool are separate utilities suggests to me that they should use 
separate bbclasses in the build process.

>
> If no, I will try to use solution 2.
>

This is the path you should follow - I have some comments below.

>
>
>   1.  I will create a new recipe to create OTP image and this recipe 
> will be placed in meta-aspeed/recipes-aspeed/otp/otp.bb

Okay.

>
> To successfully build the OTP and SPL images, we should create the 
> key-pair one for OTP(public key) and another for SPL(private key).
>
> Do you have any suggestion to place these keys in where?
>
>   1.  So far, we placed both private key and public keys here, 
> https://github.com/openbmc/openbmc/tree/master/meta-aspeed/recipes-bsp/u-boot/files
>
> How to get the public key in OTP recipe? It seems I need to place 
> public key, 
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files/rsa_pub_oem_dss_key.pem
>
> in meta-aspeed/recipes-aspeed/otp/files and private key in u-boot, 
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files/rsa_oem_dss_key.pem

We might need a separate recipe e.g. called 'aspeed-ast2600-rot-keys', 
and move the files you've pointed to above into that recipe. From there 
both the OTP and u-boot recipes can depend on 'aspeed-ast2600-rot-keys' 
to gain access to the files.

>
>   1.  The socsec tool settings should be consistent. For example: If 
> user set the algorithm "RSA4096_SHA512" in SPL, it is required to use 
> the corresponding *.json config in OTP.
>
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-sign.bbclass#L8

Yes, but maybe this creates too many headaches to enforce? We'd have to 
parse the json and line it up with SOCSEC_SIGN_ALGO in the recipe. It 
seems much easier if we just do a `socsec verify ...` once we've 
generated all the artefacts, feeding in the OTP image we've also built 
through the otptool bbclass. If the verification fails then the build 
fails and someone can look at what happened.

>
> By default, it set SOCSEC_SIGN_ALGO ?= "RSA4096_SHA512" to create SPL, 
> it is required to use 
> https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/meta-aspeed-sdk/recipes-aspeed/security/aspeed-secure-config/configs/ast2600/security/otp/evbA3_RSA4096_SHA512.json 
> for OTP image generation.

This isn't true. How I want this to work is that each platform provides 
its own OTP json configuration, and the otptool bbclass consumes that 
to produce the OTP image.

Platform designers should have the freedom to pick their own 
platform-specific OTP settings with respect to e.g. the ABR, boot 
source fallback, secureboot etc features. There's no point generating 
the cartesian product of configurations out of the box, it would just 
be confusing and a *huge* amount of noise.

I've cooked up a platform-specific config for our p10bmc systems for 
instance, and was planning on integrating that into the OpenBMC tree.

>
>   How to share the environment variable between u-boot and otp recipes?
>
>   Do you prefer to add "SOCSEC_SIGN_ALGO" in machine configuration 
> file, so this variable can be recognized between otp and u-boot recipes.
>
>   Do you have any suggestion?

It should be set by the platform config and so should be available to 
any recipe executed in the build process, included e.g. an otptool 
recipe. Platform bitbake configs shouldn't rely on any particular 
default value being set in socsec-sign bbclass for SOCSEC_SIGN_ALGO (we 
might change the default in the future - then any platforms relying on 
a particular default value would break).

>
>   1.  How to trigger the build process to build create OTP image if 
> user only issues "bitbake obmc-phosphor-image"?
>
> https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/meta-aspeed-sdk/classes/image_types_phosphor_aspeed.bbclass#L84
>
> Our solution set the do_generate_static_tar task dependencies. So, 
> build process create the otp image first, then run 
> do_generate_static_tar task.

You probably want to add it as a dependency of u-boot. This way the 
socsec-sign bbclass can implement the functionality to run `socsec 
verify ...` with the OTP blob as its last step, triggered from the 
u-boot recipe.

>
> Do you have any suggestion? Do I need to modify this bbclass, 
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass 

No, I don't expect so.

Andrew
