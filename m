Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA951B0F5
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 23:35:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtqrB0Vnrz3bdF
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 07:35:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=lugkWU3M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=lugkWU3M; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktqqk5zL2z3bbr
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 07:35:14 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2D00F368;
 Wed,  4 May 2022 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651700112;
 bh=TG2ba4y/RDwlDe7aExNpDRvQBRZU2FOjp8nvEg6cd1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lugkWU3M8aQidzPUa+dHs6yMf6mvFols8gAAPjnxADbicqw7Vawf0nVlFXHAKBXIM
 oej/qo8TkXReRDIV5f3qpZy/xJTgR1zzWwIArKgcTxibjps/HdiiWmdyDMmeHgXhOx
 0Ap6n1nxdYp9bGIwkgIA2fQ2KqdNfVf/7Aa4Bgnw=
Date: Wed, 4 May 2022 14:35:08 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: regulator: Add reg-external-output
 binding
Message-ID: <YnLxjJI8Vu3LqAnL@hatter.bewilderbeest.net>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
 <20220504065252.6955-2-zev@bewilderbeest.net>
 <YnJ32bG4IkSrRtHV@sirena.org.uk>
 <YnLjNn9WVhvd4izZ@hatter.bewilderbeest.net>
 <YnLmyHwMGnRL18LD@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YnLmyHwMGnRL18LD@sirena.org.uk>
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

[Adding extcon maintainers...]

On Wed, May 04, 2022 at 01:49:12PM PDT, Mark Brown wrote:
>On Wed, May 04, 2022 at 01:33:58PM -0700, Zev Weiss wrote:
>> On Wed, May 04, 2022 at 05:55:53AM PDT, Mark Brown wrote:
>
>> > I think at a minimum anything like this would need some sort of
>> > representation of how the output physically appears so that people can
>> > work out how outputs are mapped to the hardware they see.
>
>> I don't quite understand what you're describing here -- could you elaborate
>> on what you mean by "how the output physically appears", and what that might
>> look like in a DT binding?
>
>For example if the output comes out on a socket then that socket should
>be described.
>

Okay -- in the case of an Open19 power shelf like the ahe-50dc, there 
are 50 instances of this, 48 of which are in four ganged connectors each 
with 12 pairs of pins, but two of which have their own dedicated little 
individual sockets.  The connectors are physically different, but 
they're all identical as far as software is concerned, so I'm not clear 
on why it would need to be expressed in any DT properties or the like.  
Or did you just mean explanatory free-form text in the description 
field?

>> > However we
>> > already have a subsystem for external connectors - extcon.  Perhaps this
>> > should be a regulator client in the extcon API?  It's common for
>> > connectors to include some sort of power provision so it seems like this
>> > would fit right in.
>
>> Interesting -- I wasn't previously aware of the extcon subsystem, thanks for
>> the pointer.  However, after looking at it a bit, I'm not sure I see how
>> it'd be applicable here, since it looks like it's built to handle hardware
>> that's at least sophisticated enough for software to tell whether or not
>> something's plugged in, which isn't the case here.  The connector is just a
>> ground pin and +12VDC pin, no presence-detection mechanism or anything else.
>> Outside of the regulator itself there's really no "device" there for
>> software to talk to or otherwise interact with at all.
>
>Sure, but there's no reason why it can't scale down to something
>simpler.  It's easier to support something simpler than have to extend
>to support something more complicated.

Alright, so would you suggest creating something like 
drivers/extcon/extcon-regulator-output.c, and just having its extcon 
functionality be something of a stub for now?


Thanks,
Zev

