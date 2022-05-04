Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DD251AF45
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtpTS5y9Yz3brF
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 06:34:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=U0zHKO3I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=U0zHKO3I; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtpT56hSCz3046
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 06:34:01 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1ADC8368;
 Wed,  4 May 2022 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651696440;
 bh=trlMOjtWkd7XqnXMGA5JjHGfbv9dxG2pazytgCE5Oyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0zHKO3IbCmer9BBIXCEN4j9MtcU9+XmJxldO8xQsIHcjzm+a5ivHI9AxXP20vIdS
 rc/0bpjTK09s+bB/uQNOlSHmlsi+kXyJEAiubmp1vGAFxnRDeUydTbFdvwm7FBfbAx
 5fpVKKWMYfCQftq0qIUkl93GM5ql0mCDBt3G2Nvo=
Date: Wed, 4 May 2022 13:33:58 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: regulator: Add reg-external-output
 binding
Message-ID: <YnLjNn9WVhvd4izZ@hatter.bewilderbeest.net>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
 <20220504065252.6955-2-zev@bewilderbeest.net>
 <YnJ32bG4IkSrRtHV@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YnJ32bG4IkSrRtHV@sirena.org.uk>
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 04, 2022 at 05:55:53AM PDT, Mark Brown wrote:
>On Tue, May 03, 2022 at 11:52:48PM -0700, Zev Weiss wrote:
>> This describes an external output supplied by a regulator, such as a
>> power outlet on a power distribution unit (PDU).
>
>OK, so this is that represnetation of the connection - which raises the
>question about why the regulator needs a property?
>
>> +description: |
>> +  This describes an external output supplied by a regulator, such as
>> +  a power outlet on a power distribution unit (PDU).
>> +
>> +properties:
>> +  compatible:
>> +    const: reg-external-output
>> +
>> +  vout-supply:
>> +    description:
>> +      Phandle of the regulator supplying the output, which should have
>> +      the regulator-external-output property.
>> +
>> +required:
>
>I think at a minimum anything like this would need some sort of
>representation of how the output physically appears so that people can
>work out how outputs are mapped to the hardware they see.

I don't quite understand what you're describing here -- could you 
elaborate on what you mean by "how the output physically appears", and 
what that might look like in a DT binding?

>However we
>already have a subsystem for external connectors - extcon.  Perhaps this
>should be a regulator client in the extcon API?  It's common for
>connectors to include some sort of power provision so it seems like this
>would fit right in.

Interesting -- I wasn't previously aware of the extcon subsystem, thanks 
for the pointer.  However, after looking at it a bit, I'm not sure I see 
how it'd be applicable here, since it looks like it's built to handle 
hardware that's at least sophisticated enough for software to tell 
whether or not something's plugged in, which isn't the case here.  The 
connector is just a ground pin and +12VDC pin, no presence-detection 
mechanism or anything else.  Outside of the regulator itself there's 
really no "device" there for software to talk to or otherwise interact 
with at all.


Thanks,
Zev

