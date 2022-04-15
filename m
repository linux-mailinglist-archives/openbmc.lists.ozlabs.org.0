Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBD50267B
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 10:04:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfpkn4qblz3bWf
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 18:04:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bA5Se7z4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=bA5Se7z4; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfpkM5whrz2yXM
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2022 18:03:55 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 10909428;
 Fri, 15 Apr 2022 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1650009833;
 bh=caixAKfJiK3utvKXQyO6urE+I2Bw6wsROljV9mda8dU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bA5Se7z4/bY+z54I/wiILcnM2UspQw4bviKc3wmZKBm7tKkPGw+k62CF0yUR6S8g6
 7dJyqtdtMCEOFaRtf483vDAsYy2VVrCJEvX0XzBJNJ1NVxVAWEyZCoc4FuugGJnDTS
 wJgmsoxP1y3R6GtaWDMcv1jCF/yB0u9Jzh/2apn4=
Date: Fri, 15 Apr 2022 01:03:48 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Message-ID: <Ylkm5L2wPl/OYR9g@hatter.bewilderbeest.net>
References: <20220414224004.29703-1-zev@bewilderbeest.net>
 <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
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
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 08:21:00PM PDT, Ryan Chen wrote:
>Hello Zev,
>	I don't think it is good to send a patch to enable security backdoor.
>	It should not be enabled, even it user aware it.
>	That will cause big issues in BMC.
>

Hi Ryan,

To clarify, the current state of the code leaves the backdoors enabled 
on ast2400 and ast2500 (insecure/debug mode), with no easy way to turn 
them off.

With this patch they'll be turned off by default (secure/production 
mode), but a user that wants to turn them back on can still do so if 
they explicitly request it via the new Kconfig option.  The name and 
description of the option I think make it pretty clear that it's for 
debugging only and shouldn't be enabled on production systems.

Is your opinion that we should apply something like this patch, but 
without any configurability at all?  I think having the option available 
to leave the backdoors on could be worthwhile (I've found the debug UART 
useful now and then during my own development work, for example) as long 
as the security implications are clearly indicated.  It wouldn't be the 
first Kconfig option that's really only appropriate for development and 
shouldn't be enabled in a production build (e.g. ASPEED_PALLADIUM).


Thanks,
Zev

