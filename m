Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E96475112
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 03:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDKVk4nngz307W
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 13:50:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gIRtGp7a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gIRtGp7a; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDKVL4cBvz2yZ6
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 13:50:18 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6490B3E8;
 Tue, 14 Dec 2021 18:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1639536614;
 bh=KQaQRP6Tw3usqEqoyvbweA1bP3Jg1Y5OszN8o3P2emI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gIRtGp7aeRDVqSAwgD5tEdImompocs4artMMGWTUQJPBmrGGo/cZdUXECtn/O16Zb
 FzVrWJqJ3IWF7yjIQnsbj34+pYxXLrBLUo0oVQDRFuD3geh+yEIEQ1y4s9eLCZ5Z66
 NJjoWjbqtGMeK6j7PtAw/3y4J7bBuHcNeR+ibd2Q=
Date: Tue, 14 Dec 2021 18:50:09 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Message-ID: <YblX4e2Zk/idHoAQ@hatter.bewilderbeest.net>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
 <HK0PR06MB3380B961DEE52F90241657FDF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgNgBDzrGEI+1/c@hatter.bewilderbeest.net>
 <HK0PR06MB3380C413C9024689082AC4E2F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgSyxUdI+tiG2L1@hatter.bewilderbeest.net>
 <HK0PR06MB3380C34C97A93A62C7053CA3F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3380C34C97A93A62C7053CA3F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
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
 ChiaWei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 13, 2021 at 09:21:36PM PST, Ryan Chen wrote:
>Hello,
>> -----Original Message-----
>> From: Zev Weiss <zev@bewilderbeest.net>
>> Sent: Tuesday, December 14, 2021 11:43 AM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>
>> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei Wang
>> <chiawei_wang@aspeedtech.com>
>> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
>> support for TXD3/RXD3 pins
>>
>> On Mon, Dec 13, 2021 at 07:29:48PM PST, Ryan Chen wrote:
>> >Hello,
>> >> -----Original Message-----
>> >> From: Zev Weiss <zev@bewilderbeest.net>
>> >> Sent: Tuesday, December 14, 2021 11:21 AM
>> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
>> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei
>> >> Wang <chiawei_wang@aspeedtech.com>
>> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400:
>> >> add support for TXD3/RXD3 pins
>> >>
>> >> On Mon, Dec 13, 2021 at 05:39:17PM PST, Ryan Chen wrote:
>> >> >Hello,
>> >> >
>> >> >> -----Original Message-----
>> >> >> From: Zev Weiss <zev@bewilderbeest.net>
>> >> >> Sent: Tuesday, December 14, 2021 9:33 AM
>> >> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
>> >> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>;
>> >> >> ChiaWei Wang <chiawei_wang@aspeedtech.com>
>> >> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400:
>> >> >> add support for TXD3/RXD3 pins
>> >> >>
>> >> >> On Mon, Dec 13, 2021 at 05:22:52PM PST, Ryan Chen wrote:
>> >> >> >Hello,
>> >> >> >	You may need claim for function group for link, not for pin link.
>> >> >> >	Ex.
>> >> >> >	static struct aspeed_sig_desc uart3_link[] = {
>> >> >> >		{ 0x80, BIT(22), 0},
>> >> >> >		{ 0x80, BIT(23), 0},
>> >> >> >	}
>> >> >> >
>> >> >> >	ast2400_groups[] = {
>> >> >> >	{ "UART3", 2, uart3_link },
>> >> >> >Ryan
>> >> >>
>> >> >> Hi Ryan,
>> >> >>
>> >> >> That possibility occurred to me, but the existing function/group
>> >> >> names in arch/arm/dts/ast2400.dtsi (lines 1130-1133 and 1375-1378)
>> >> >> made me think they should be separate.
>> >> >This device tree is copied from Linux kernel.
>> >> >
>> >> >> I'm certainly not an expert on pinctrl stuff though...is there
>> >> >> some other existing logic or mechanism to link a "UART3" to the
>> >> >> separate "TXD3" and "RXD3" in the device tree?
>> >> >There is no separate in u-boot device tree.
>> >>
>> >> Perhaps we're misunderstanding each other...
>> >>
>> >>
>> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
>> >> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1130-L1133
>> >>
>> >> and
>> >>
>> >>
>> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
>> >> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1375-L1378
>> >>
>> >The following is my point.
>> >https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a
>> 4fa
>> >5013d6dd/arch/arm/dts/ast2400.dtsi#L3
>> >
>>
>> I'm afraid I don't follow...how does it being copied from the Linux kernel device
>> tree affect whether or not we should group these two or keep them separate?
>My point is the original dtsi file is copy from kernel.
>So that dtsi define is inherit. So that you see in currently u-boot.
>

I mean, I saw that comment and I'm aware of the derivation of the file, 
but I'm still not sure what bearing it has on the question at hand.

Is your view that because the dts was initially just copied from the 
kernel, it's not necessarily the right fit for u-boot, and that we 
should change it to unify these two functions in a single group?  If so, 
I guess I'm still wondering what tangible benefit that would have, and 
about the flexibility issue I raised a few messages back.

If that's not what you're aiming to suggest, pardon me if I'm being 
dense here, but I'm going to need a more detailed explanation, because 
as it stands I'm still pretty mystified.


>>
>>
>> >> look fairly separate to me?
>> >>
>> >> >May I know why you need separate?
>> >>
>> >> In my particular case I don't need these two to be separate, but it
>> >> seems conceivable that there might be other cases that would require
>> >> a different set of signals to be enabled for a generic "UART3" group
>> >> -- possibly more (sideband signals like CTS and such), or perhaps
>> >> even fewer (e.g. if you had an output-only UART3 just for logging or
>> >> something, and only needed TXD3 for that, but still wanted to use pin
>> >> B14 as GPIOE7 instead of RXD3).  Keeping them separate seems like it
>> >> leaves things as flexible as possible, avoiding imposing any artificial
>> constraints.
>> >>
>> >>
>> >> Zev
>> >
