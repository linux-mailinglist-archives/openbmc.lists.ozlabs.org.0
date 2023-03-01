Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C503A6A7578
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 21:36:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRmHX4BVdz3cFn
	for <lists+openbmc@lfdr.de>; Thu,  2 Mar 2023 07:36:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=mnVGx8zB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=mnVGx8zB;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRmGw0z3Jz3bjk
	for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2023 07:36:23 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-161-58.tukw.qwest.net [174.21.161.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3A62B341;
	Wed,  1 Mar 2023 12:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1677702975;
	bh=IRmYsMVKZO7oj/cHyStRNgW6UvFUZ3w6BCIHeycLvXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnVGx8zBSAvVSEXbzkQ3uAqbks7J8iX0ljiFBrh5zEu6CyjY3IsrZmuFOZ3y63y8K
	 /bf9/xnkLgmr6gEWeZercgWJSCYmwhTodkCuK7O/HaXG6DrRtdLBYz6WBV4rnIaIXc
	 hjCjIQFdpH+1v37ItHG94ruPSwiu5a2Xat+y0/Sg=
Date: Wed, 1 Mar 2023 12:36:13 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware flash
 SPI clocks
Message-ID: <Y/+3PSQzo+ZGM+hk@hatter.bewilderbeest.net>
References: <20230224000400.12226-1-zev@bewilderbeest.net>
 <20230224000400.12226-4-zev@bewilderbeest.net>
 <CACPK8XdFT=+VJJ=iDhcmWPh9m9of2b+2UYxkrAisp6tdmWOWKg@mail.gmail.com>
 <36da41c9-2396-5dd4-7fef-c85412f23045@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36da41c9-2396-5dd4-7fef-c85412f23045@kaod.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023 at 11:33:58PM PST, Cédric Le Goater wrote:
>On 3/1/23 02:30, Joel Stanley wrote:
>>On Fri, 24 Feb 2023 at 00:04, Zev Weiss <zev@bewilderbeest.net> wrote:
>>>
>>>While I'm not aware of any problems that have occurred running these
>>>at 100 MHz, the official word from ASRock is that 50 MHz is the
>>>correct speed to use, so let's be safe and use that instead.
>>
>>:(
>>
>>Validated with which driver?
>>

spi-nor, FWIW.

>>Cédric, do you have any thoughts on this?
>
>Transactions on the Firmware SPI controller are usually configured at
>50MHz by U-Boot and Linux to stay on the safe side, specially CE0 from
>which the board boots. The other SPI controllers are generally set at
>a higher freq : 100MHz, because the devices on these buses are not for
>booting the BMC, they are mostly only written to (at a default lower
>freq). There are some exceptions when the devices and the wiring permit
>higher rates.
>
>For the record, we lowered the SPI freq on the AST2400 (palmetto)
>because some chips would freak out once in a while at 100MHz.
>
>C.
>

Yeah, this actually grew out of some OpenBMC bringup work on another 
ASRock board -- I started out with a 100MHz clock since that's what I'd 
been using without a hitch on previous ASRock systems (such as these), 
but saw sporadic data corruption.  Some discussion on the OpenBMC 
Discord 
(https://discord.com/channels/775381525260664832/775694683589574659/1074904879023263774 
and 
https://discord.com/channels/775381525260664832/775694683589574659/1075336116212875335) 
prompted me to try 50MHz instead, which seemed to solve the problem -- 
then after enquiring about it with ASRock I discovered that the 100MHz 
clocks we've been using on these boards are also officially out of spec.


Zev

