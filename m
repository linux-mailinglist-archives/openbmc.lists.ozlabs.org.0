Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830A365D87
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 18:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPqDq2cqBz302f
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 02:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Sg9s9zHl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Sg9s9zHl; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPqDZ2bZGz2xb7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 02:40:29 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3AEA51D2;
 Tue, 20 Apr 2021 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618936826;
 bh=Tch6zNZ8+bLnr2ibPN+rNcWbhq3cKgA9oHN3Hx5qr1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sg9s9zHlsm+Q8pGm8h9JKhSGH2xykFRjB3oQUlEX/OlaCK7Nnpwcq702pnveukIlQ
 S3Q9AmEMx7oPGW5WpJeK7VUpSK2+Eu+OCxM81w0HMyC3ZP0tTvrj1gUV/4aq5zt4e3
 gXzKPI0d1SnBnSeErn/JRKZ9kywAfJD5sW+6tDTw=
Date: Tue, 20 Apr 2021 11:40:24 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Enabling pmbus power control
Message-ID: <YH8D+LWxWPqnFd2h@hatter.bewilderbeest.net>
References: <20210330180200.GK4976@sirena.org.uk>
 <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
 <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
 <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
 <20210420161317.GE6073@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210420161317.GE6073@sirena.org.uk>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 11:13:18AM CDT, Mark Brown wrote:
>On Tue, Apr 20, 2021 at 10:19:04AM -0500, Zev Weiss wrote:
>
>> Mark, do you have any further input on what a viable approach might look
>> like?
>
>I already suggested writing a driver or drivers that represent the
>hardware you have, that advice remains.  It's hard to follow what you
>were trying to say with your long mail earlier today but it seems like

That email was an attempt to explain why writing a driver for the 
specific hardware devices we're powering seems like a poor fit to me.  
To summarize:

  - There's a wide variety of different devices potentially behind an 
    LM25066.

  - A hypothetical driver for any one of them would be completely 
    non-specific to that device and functionally identical to a driver 
    for any other, because the only hardware it would actually be 
    touching is the LM25066, and in ways that are again completely 
    non-specific to anything but the LM25066 itself.

>you basically don't want to use any abstraction or framework, but that's
>not really suitable for upstream integration

I'm not at all opposed to using a abstractions or frameworks (I'd very 
much like to do so in fact).  The problem is that I've thus far been 
unable to determine exactly what the appropriate one is.

>other hardware that looks similar to the end user should look similar 
>in the kernel too.

Agreed -- hence my disinclination to write drivers artificially specific 
to whatever is behind the LM25066.  What it looks like to the end user, 
and I'd hope evetually the kernel as well, is a simple power switch and 
nothing more.


Zev

