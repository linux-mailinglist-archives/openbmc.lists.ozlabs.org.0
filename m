Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3433866A80
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 08:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjsHZ3vwLz3d26
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 18:11:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjsH81hYfz3bYx;
	Mon, 26 Feb 2024 18:11:31 +1100 (AEDT)
Received: from [192.168.0.6] (ip5f5af3a7.dynamic.kabel-deutschland.de [95.90.243.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 73C9E61E5FE04;
	Mon, 26 Feb 2024 08:10:25 +0100 (CET)
Message-ID: <74cd8a61-3d9f-437e-8e3a-22139e23bda5@molgen.mpg.de>
Date: Mon, 26 Feb 2024 08:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Content-Language: en-US
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
 <572d53516dee6db5af7089090056185abb4e78c7.camel@codeconstruct.com.au>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <572d53516dee6db5af7089090056185abb4e78c7.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Supreeth,


Thank you for your patch. Should you resent three more nits.

Am 26.02.24 um 07:55 schrieb Andrew Jeffery:
> On Tue, 2024-01-09 at 21:35 -0600, Supreeth Venkatesh wrote:
>> This patch adds initial device tree and makefile updates for
>> AMD Onyx platform.
>>
>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>> ast2600 BMC manufactured by AMD.
>> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
>> present on AMD Onyx platform.

I’d capitalize I2Cs, UARTs, and MAC, but would write fans.

Also, could you please make the summary a statement by adding a verb in 
imperative mood. Maybe:

Add initial device tree for AMD Onyx Platform

I’d also add spaces after the colons in the commit message summary.

[…]


Kind regards,

Paul
