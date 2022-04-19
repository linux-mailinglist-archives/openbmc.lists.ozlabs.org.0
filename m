Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F0506138
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 03:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj57M5W4bz2yfZ
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 10:59:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=QbG6vcra;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=QbG6vcra; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kj56y3H5zz2xy3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2022 10:59:37 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 06F9C32E;
 Mon, 18 Apr 2022 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1650329974;
 bh=SxYSTnv+EEtTUHGsqMCESG4EZyUb4fGkzaXwN5v2NLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QbG6vcraNdZ1/zYKzNzEUiUL9aLNpcjkoAz7uQeSuuR1T5tEaEXFFxjXbAaczvtGg
 52ZTEPrKQZra7WOSbs+2RrrjuKdgEv+iS9DF5ewOtdgI1AJQL0rgZI9Iqf9X7FlFRo
 0ij3tp8D/vCF73GlDQ14dDxRbQ40pu4C3HKtVaxQ=
Date: Mon, 18 Apr 2022 17:59:30 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Message-ID: <Yl4JcpZNvPQWcL3C@hatter.bewilderbeest.net>
References: <20220414224004.29703-1-zev@bewilderbeest.net>
 <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
 <Ylkm5L2wPl/OYR9g@hatter.bewilderbeest.net>
 <TY2PR06MB33910DF8FDDE1072646911B4F2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <TY2PR06MB33910DF8FDDE1072646911B4F2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 15, 2022 at 01:11:09AM PDT, Ryan Chen wrote:
>Hello,
>	Thanks your response.
>	And yes, I prefer apply patch without any config to disable it.
>
>Ryan
>

After thinking about this a bit more, I remembered that Ian Woloschin 
(CCed) had mentioned at some point that the systems he works with do in 
fact use the AST2500's built-in Super-IO, and hence would presumably be 
broken by a patch that unconditionally disabled that.  And in contrast, 
the ASRock boards I've been working with require the AST2500 Super-IO to 
be disabled for the host to boot properly, so it seems like we'll need  
*some* minimal amount of configurability to support at least those two 
classes of systems (i.e. a Kconfig boolean that determines whether the 
Super-IO should be enabled or disabled).

I don't know offhand what the interactions between SCU70[20], HICRB[6], 
and HICR5[10] are though, and I don't have any hardware that actually 
uses the AST2500 Super-IO to test with.  Would leaving SCU70[20]=0 to 
enable the Super-IO while leaving HICRB[6]=1 and HICR5[10]=0 work for 
systems like Ian's to enable the Super-IO while keeping everything else 
locked down as much as possible?


Zev

