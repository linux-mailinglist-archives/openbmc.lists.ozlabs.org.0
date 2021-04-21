Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284136728B
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 20:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQTbs0tY0z302V
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 04:29:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Vn7+E2N4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Vn7+E2N4; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQTbc38hmz2yjB
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 04:29:15 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5FB4D123;
 Wed, 21 Apr 2021 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1619029750;
 bh=svOYheueA79L0peCZXaDTla1aQaIMKCRlqEeIVwaGSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vn7+E2N4nZ6IElUJ1gv2/zXNP4ngmrZu6MUT0y5WDoYg+cz4GEKmsmtY2Ndjaa/LN
 Ae4s7xGOH+pBXNMeNRGDuEeedvFZzR+fetarTa2lDjPDk6Q9PaeoURF4ODoQfAhVbE
 JIpaZtiEgz6ctXgLtdbzyiOFOgTaFuARIgopvnI4=
Date: Wed, 21 Apr 2021 13:29:07 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Enabling pmbus power control
Message-ID: <YIBu8w5w8r0j03PP@hatter.bewilderbeest.net>
References: <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
 <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
 <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
 <20210420161317.GE6073@sirena.org.uk>
 <YH8D+LWxWPqnFd2h@hatter.bewilderbeest.net>
 <20210420171540.GG6073@sirena.org.uk>
 <YH8jUuOEJKDDDoMb@hatter.bewilderbeest.net>
 <20210421110540.GA4617@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210421110540.GA4617@sirena.org.uk>
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

On Wed, Apr 21, 2021 at 06:05:40AM CDT, Mark Brown wrote:
>On Tue, Apr 20, 2021 at 01:54:10PM -0500, Zev Weiss wrote:
>
>> Consider the power shelf I mentioned earlier -- it's a rackmount power
>> supply and that's about it.  It provides DC power to arbitrary devices that
>> it has no other connection to, just ground and +12V.  Those devices might be
>> servers, or cooling fans, or vacuum cleaners or floodlights -- the power
>> shelf doesn't know, or care.  It's a lot like a switchable network PDU in
>
>If your chassis is particularly simple then it will be particularly
>simple to fit into a generic framework so that should make your life a
>lot easier here.  Generally the simpler your system is the easier it
>will be to use in something generic, it's not going to be stretching
>ideas about how things should look and is more likely to have good
>helpers available already.

The simplicity of the use-case should make it easy to implement via a 
generic framework, yes.  But at the same time, if we're talking about 
that being a new framework that doesn't currently exist, the minimal 
needs of this case make it difficult for me to see what sort of 
structure or additional functionality would be required of such a 
framework to support more complex cases, because the simple/minimal case 
is the only example I have at hand.  I think there's also (quite 
reasonably) a general reluctance to merge infrastructure that doesn't 
have any users.

Given that, I'd think the appropriate approach for a first-cut 
implementation of that would be to only implement what's presently 
needed, and put off incorporating any other bells and whistles until 
there's something that would use them.  It seems like a minimal, 
only-what's-needed version of that at present would end up looking 
extremely similar to reg-userspace-consumer though.  Would that not be 
problematic?


Zev

