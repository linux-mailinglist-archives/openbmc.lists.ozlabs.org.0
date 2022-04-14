Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED416500890
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 10:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfCcn6Cbcz2yK2
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 18:42:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MeFJL9UP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=MeFJL9UP; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfCcN0RdSz2xY0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 18:41:39 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 86BD41C5;
 Thu, 14 Apr 2022 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1649925696;
 bh=8aPQ6mn1a+dS4jvx44OCm9e4xt2KupDeJsYBVbGOlBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MeFJL9UPGeTpKhlz9PG63sP+B0b4G4ZCbIqCEPxtLCVMhxAr4YZAbSF9lUwIg+xPt
 LFrPaFbl3+26THQruEpvNu73RxOuBteDgStEgeYXzbarS+cg3o/Ti7GmUXzbI0TLR7
 HlpWoP1UuFgTvprDV85K3I5E+mMnQGkvZN+CuGa4=
Date: Thu, 14 Apr 2022 01:41:32 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: add
 CONFIG_ASPEED_ISOLATE_BMC
Message-ID: <YlfePCrv0TBYtNHJ@hatter.bewilderbeest.net>
References: <20220414040448.27100-1-zev@bewilderbeest.net>
 <CACPK8XfKuNEvrZBxuD0Q891Wb23hkwRSRe6GcmZ_KR=3g4Q=mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XfKuNEvrZBxuD0Q891Wb23hkwRSRe6GcmZ_KR=3g4Q=mw@mail.gmail.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 01:13:37AM PDT, Joel Stanley wrote:
>On Thu, 14 Apr 2022 at 04:05, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This provides the functionality of the OpenBMC df-isolate-bmc distro
>> feature flag, and is very directly derived from Andrew Jeffery's patch
>> in the OpenBMC tree for the v2016.07 u-boot branch.  The
>> implementation currently only supports ast2500, though ast2400 and
>> ast2600 support should be fairly simple extensions.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>
>> This is meant more as something of an RFC to see if this seems like
>> approximately the right way of going about this (since as far as I can
>> see the existing df-isolate-bmc implementation only supports the old
>> 2016 u-boot branch), but if it looks OK I suppose it could potentially
>> go in as-is.
>
>Thanks for doing this. The only potential change I can suggest is we
>make each bit of hardware a different option (or we allow it to be
>configured in the device tree). That assumes someone has a use case
>for leaving one of the backdoorts open but closing the others.
>

This possibility came up on Discord with Andrew earlier -- I agree it'd 
be nice to have somewhat more fine-grained control over it, though I'm 
not aware of any platforms that really need it at the moment.  I'm 
certainly not as well-versed as Andrew in the precise details of exactly 
how all the various busses interact in different circumstances (this was 
just a fairly mechanical translation of his patch), so I'm not 100% 
confident I wouldn't unwittingly introduce screwy combinations with a 
more fine-grained set of config options (mostly w.r.t. to the LPC & iLPC 
stuff).

>> diff --git a/arch/arm/mach-aspeed/Kconfig 
>> b/arch/arm/mach-aspeed/Kconfig
>> index 579a547df61e..2b51f87e0732 100644
>> --- a/arch/arm/mach-aspeed/Kconfig
>> +++ b/arch/arm/mach-aspeed/Kconfig
>> @@ -45,6 +45,18 @@ config ASPEED_AST2600
>>           which is enabled by support of LPC and eSPI peripherals.
>>  endchoice
>>
>> +config ASPEED_ISOLATE_BMC
>> +       bool "Disable hardware features that provide unnecessary access to the BMC"
>> +       depends on ASPEED_AST2500
>> +       default n
>
>all kconfig are "default n", so you can omit this.
>

Ack, thanks.

>I suggest we invert the meaning of the option. The default should be
>turn off the backdoors, and someone can optionally re-enable them by
>selecting the option.
>

I was tempted to make it 'default y' (i.e. secure-by-default), but the 
possibility of compatibility breaks with existing systems that might 
depend on the current insecure-by-default arrangement gave me pause.  If 
we don't think that's a big concern though I'm happy to flip the sense 
of it and have the more aggressive default.

>config ASPEED_ALLOW_BACKDOORS?

Sounds reasonable to me, though maybe s/ALLOW/ENABLE/?


Thanks,
Zev

