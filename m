Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C88365FDA
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 20:54:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPtC85CZ0z2yy4
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 04:54:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iUIhGNV/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=iUIhGNV/; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPtBw4hC0z2yZB
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 04:54:15 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 70E5C201;
 Tue, 20 Apr 2021 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618944853;
 bh=yulT0IYFXA0d9SFFhQP/AEy/TBC8Zc5ZyTjauwYse80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUIhGNV/b+QFFfj9DHCCkklkHrURNYg+YduecDWpfmjOkw59mk2GfZ6+rF9ROQVgs
 rZkrtg2FRnvVUNyLlwSw01oPh+LKFNFvq23MApF5cCHzzedx1WmpXjp+H4DyrvJOeo
 0vodteOaTIu3mTwnCQ04JGHj5zOXCQfvqyfphE/0=
Date: Tue, 20 Apr 2021 13:54:10 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Enabling pmbus power control
Message-ID: <YH8jUuOEJKDDDoMb@hatter.bewilderbeest.net>
References: <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
 <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
 <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
 <20210420161317.GE6073@sirena.org.uk>
 <YH8D+LWxWPqnFd2h@hatter.bewilderbeest.net>
 <20210420171540.GG6073@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210420171540.GG6073@sirena.org.uk>
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

On Tue, Apr 20, 2021 at 12:15:40PM CDT, Mark Brown wrote:
>On Tue, Apr 20, 2021 at 11:40:24AM -0500, Zev Weiss wrote:
>> On Tue, Apr 20, 2021 at 11:13:18AM CDT, Mark Brown wrote:
>
>> > I already suggested writing a driver or drivers that represent the
>> > hardware you have, that advice remains.  It's hard to follow what you
>> > were trying to say with your long mail earlier today but it seems like
>
>> That email was an attempt to explain why writing a driver for the specific
>> hardware devices we're powering seems like a poor fit to me.  To summarize:
>
>>  - There's a wide variety of different devices potentially behind an
>> LM25066.
>
>This is true for lots of hardware, we still integrate things into
>frameworks.
>
>>  - A hypothetical driver for any one of them would be completely
>> non-specific to that device and functionally identical to a driver    for
>> any other, because the only hardware it would actually be    touching is the
>> LM25066, and in ways that are again completely    non-specific to anything
>> but the LM25066 itself.
>
>I don't see why that would be the case at all.  Even within the indended
>application as a power controller for a hotpluggable bus there's plenty
>of potential for integration into a wider representation of the socket
>things get inserted into - for example I've worked with buses that had
>support for operator signalling of hotplug (buttons to press to initiate
>hot removal, with lights to signal when a clean shutdown of the card had
>been completed), you might also want to have additional environment
>monitoring and of course the labelling that I mentioned in an earlier
>post.  I can imagine you probably have some other connection of some
>kind to the host too (eg, network ports) to join up and perhaps sync
>hotplug for.
>

Consider the power shelf I mentioned earlier -- it's a rackmount power 
supply and that's about it.  It provides DC power to arbitrary devices 
that it has no other connection to, just ground and +12V.  Those devices 
might be servers, or cooling fans, or vacuum cleaners or floodlights -- 
the power shelf doesn't know, or care.  It's a lot like a switchable 
network PDU in that it just provides a way for an operator to remotely 
cut power to a thing that's plugged into it.  There's no other bus or 
anything in the picture.  (And pragmatically, given that its most common 
usage is likely to be to provide a cold power cycle as a last-ditch 
recovery option when things are wedged in some unresponsive state, 
attempting any sort of coordination with the downstream device would 
probably be a dead end anyway.)


Zev

