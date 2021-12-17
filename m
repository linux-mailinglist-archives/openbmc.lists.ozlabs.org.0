Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 802604785EA
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 09:06:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFhQf3kb0z3cQX
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 19:06:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFhQM0kD6z2x9H
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 19:06:32 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BH7eY9M017060;
 Fri, 17 Dec 2021 15:40:34 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (118.99.190.129) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 17 Dec
 2021 16:06:03 +0800
Date: Fri, 17 Dec 2021 16:06:02 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Create AST2600 OTP image
Message-ID: <20211217080601.GA4293@aspeedtech.com>
References: <TYZPR06MB4015221527D36DC4780C1F23FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <f42a6852-ab70-48b8-ba5d-74ba503e63dd@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <f42a6852-ab70-48b8-ba5d-74ba503e63dd@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [118.99.190.129]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BH7eY9M017060
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The 12/16/2021 22:43, Andrew Jeffery wrote:
> Hi Jamin,
> 
> On Thu, 16 Dec 2021, at 17:11, Jamin Lin wrote:
> > Hi OpenBMC team
> >
> > I have some questions about OTP image creation in OpenBMC. To support 
> > AST2600 RoT(Root of Trust, AST2600 ROM code verified SPL), users should 
> > program "A public key" in OTP and uses "A private key" with SPL image 
> > to create signature and place it in SPL.
> > The SOCESEC tool help user to create OTP and SPL images for AST2600 
> > secure boot support.
> > The following are my questions and solutions
> >
> >   1.  There was a socsec-sign.bbclass in OpenBMC and it is used for SPL 
> > image generation with SOCSEC tool. Do you agree if I modify 
> > socsec-sign.bbclass to create OTP image?
> 
> I'm not convinced on this one. While the OTP configuration and the 
> output of the socsec signing process are tightly coupled they involve 
> separate processes. Off the top of my head, the fact that socsec and 
> otptool are separate utilities suggests to me that they should use 
> separate bbclasses in the build process.
> 
> >
> > If no, I will try to use solution 2.
> >
> 
> This is the path you should follow - I have some comments below.
> 
> >
> >
> >   1.  I will create a new recipe to create OTP image and this recipe 
> > will be placed in meta-aspeed/recipes-aspeed/otp/otp.bb
> 
> Okay.
> 
> >
> > To successfully build the OTP and SPL images, we should create the 
> > key-pair one for OTP(public key) and another for SPL(private key).
> >
> > Do you have any suggestion to place these keys in where?
> >
> >   1.  So far, we placed both private key and public keys here, 
> > https://github.com/openbmc/openbmc/tree/master/meta-aspeed/recipes-bsp/u-boot/files
> >
> > How to get the public key in OTP recipe? It seems I need to place 
> > public key, 
> > https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files/rsa_pub_oem_dss_key.pem
> >
> > in meta-aspeed/recipes-aspeed/otp/files and private key in u-boot, 
> > https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files/rsa_oem_dss_key.pem
> 
> We might need a separate recipe e.g. called 'aspeed-ast2600-rot-keys', 
> and move the files you've pointed to above into that recipe. From there 
> both the OTP and u-boot recipes can depend on 'aspeed-ast2600-rot-keys' 
> to gain access to the files.
> 
> >
> >   1.  The socsec tool settings should be consistent. For example: If 
> > user set the algorithm "RSA4096_SHA512" in SPL, it is required to use 
> > the corresponding *.json config in OTP.
> >
> > https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-sign.bbclass#L8
> 
> Yes, but maybe this creates too many headaches to enforce? We'd have to 
> parse the json and line it up with SOCSEC_SIGN_ALGO in the recipe. It 
> seems much easier if we just do a `socsec verify ...` once we've 
> generated all the artefacts, feeding in the OTP image we've also built 
> through the otptool bbclass. If the verification fails then the build 
> fails and someone can look at what happened.
> 
> >
> > By default, it set SOCSEC_SIGN_ALGO ?= "RSA4096_SHA512" to create SPL, 
> > it is required to use 
> > https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/meta-aspeed-sdk/recipes-aspeed/security/aspeed-secure-config/configs/ast2600/security/otp/evbA3_RSA4096_SHA512.json 
> > for OTP image generation.
> 
> This isn't true. How I want this to work is that each platform provides 
> its own OTP json configuration, and the otptool bbclass consumes that 
> to produce the OTP image.
> 
> Platform designers should have the freedom to pick their own 
> platform-specific OTP settings with respect to e.g. the ABR, boot 
> source fallback, secureboot etc features. There's no point generating 
> the cartesian product of configurations out of the box, it would just 
> be confusing and a *huge* amount of noise.
> 
> I've cooked up a platform-specific config for our p10bmc systems for 
> instance, and was planning on integrating that into the OpenBMC tree.
> 
> >
> >   How to share the environment variable between u-boot and otp recipes?
> >
> >   Do you prefer to add "SOCSEC_SIGN_ALGO" in machine configuration 
> > file, so this variable can be recognized between otp and u-boot recipes.
> >
> >   Do you have any suggestion?
> 
> It should be set by the platform config and so should be available to 
> any recipe executed in the build process, included e.g. an otptool 
> recipe. Platform bitbake configs shouldn't rely on any particular 
> default value being set in socsec-sign bbclass for SOCSEC_SIGN_ALGO (we 
> might change the default in the future - then any platforms relying on 
> a particular default value would break).
> 
> >
> >   1.  How to trigger the build process to build create OTP image if 
> > user only issues "bitbake obmc-phosphor-image"?
> >
> > https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/meta-aspeed-sdk/classes/image_types_phosphor_aspeed.bbclass#L84
> >
> > Our solution set the do_generate_static_tar task dependencies. So, 
> > build process create the otp image first, then run 
> > do_generate_static_tar task.
> 
> You probably want to add it as a dependency of u-boot. This way the 
> socsec-sign bbclass can implement the functionality to run `socsec 
> verify ...` with the OTP blob as its last step, triggered from the 
> u-boot recipe.
> 
> >
> > Do you have any suggestion? Do I need to modify this bbclass, 
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass 
> 
> No, I don't expect so.
> 
> Andrew

Hi Andrew
Thanks for all your suggestions and review.
I created two patches and waiting for review.
Thanks-Jamin

