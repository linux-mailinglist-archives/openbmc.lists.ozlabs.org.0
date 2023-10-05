Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D97B99EE
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 04:28:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=L1KlwZ52;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Fps64ZMz3cc6
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 13:28:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=L1KlwZ52;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1FpB0rzvz30hj;
	Thu,  5 Oct 2023 13:27:46 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D9693224;
	Wed,  4 Oct 2023 19:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1696472860;
	bh=k9dGTvabPa4GHbKIwp8xZ0TDgZ+c9lWcoPsXISUj8rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1KlwZ52gZzhy2d3kHVfD1Q7MkBdDApGOs7f6Eo1djfLQHkejGftyk4aDockPrk89
	 V1c6wwzaWJMZHoMq+tC1CYW5lOmhsDqfwqdfqQ+YjhVn/h8ejsAMn8fXRlwUldqvlk
	 mVWzAUBgGn6rCjEtYjl7zGMmpmmypNAJOhqQMyK4=
Date: Wed, 4 Oct 2023 19:27:38 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed: Allow changing hardware strap defaults
Message-ID: <f9b5694a-5859-4999-bb2d-0e6a79b35c95@hatter.bewilderbeest.net>
References: <20231004071605.21323-2-zev@bewilderbeest.net>
 <e5f0a67e05cf477bdb4ec6efd9c554f4aaa2cf8b.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e5f0a67e05cf477bdb4ec6efd9c554f4aaa2cf8b.camel@codeconstruct.com.au>
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 04, 2023 at 06:17:50PM PDT, Andrew Jeffery wrote:
>On Wed, 2023-10-04 at 00:16 -0700, Zev Weiss wrote:
>> Previously we've generally assumed that the defaults in the hardware
>> strapping register are in fact appropriate for the system and thus
>> have avoided making any changes to its contents (with the exception of
>> the bits controlling the GPIO passthrough feature).
>>
>> Unfortunately, on some platforms corrections from software are
>> required as the hardware strapping is simply incorrect for the system
>> (such as the SPI1 interface being configured for passthrough mode when
>> master mode is in fact the only useful configuration for it).  We thus
>> remove the checks preventing changes to the strap register so that the
>> pinctrl subsystem can be used for such corrections.
>
>So the strapping for the SPI1 configuration seems to be prone to
>(copy/paste?) mistakes. Is there evidence that motivates dropping all
>the protection instead of poking a hole for SPI1 like we did for the
>passthrough GPIOs?
>
>I'm still a little attached to the policy that software should be
>beholden to the strapping, and to try to mitigate software mistakes
>given the smattering of bits required to drive the Aspeed pinmux.
>

I have no idea what else might be lurking out there so I took a broader 
(perhaps overly heavy-handed) approach, but the SPI1 mode bits are the 
only ones I've personally encountered being strapped wrong, so sure, I'd 
be fine with just extending the "hole-punch" a bit to add those bits.  
I'll send a v2 doing that shortly.


Thanks,
Zev

