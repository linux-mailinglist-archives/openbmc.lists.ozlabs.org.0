Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA13424D99
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 08:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ2HS56Bdz30Qv
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 17:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=d5tMm6wv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=d5tMm6wv; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ2CR5vX6z2yWH
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 17:55:46 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B8E35F6;
 Wed,  6 Oct 2021 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633589744;
 bh=1Wnuz/Ot9jwM2pt8JkasgbgyztxL92GcR7WxaDAQsMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5tMm6wvON4Ka6HD3KVoHPZnEeSqOGW5/n2AeX6jFtaU8leqXHQu8oT2UNmuqcqJ4
 Wafw5+Mp3KeyDx0m0jaTH/2vxMlBW4NyWO+VwuEL3Z23iy37CM0GGSTQkSRk0qH2ql
 ZdtANJGsy5ExgP78bBO9UQQ46SzJQ+lw8Y5iTrMw=
Date: Wed, 6 Oct 2021 23:55:38 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/9] sysfs: add sysfs_remove_bin_file_self() function
Message-ID: <YV6Z6omsBKgKqeoZ@hatter.bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-2-zev@bewilderbeest.net>
 <YV6EVcKUQj5DNiXZ@kroah.com>
 <YV6Moz5eCsf6ZZWb@hatter.bewilderbeest.net>
 <YV6P1dM6U6sSsefc@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YV6P1dM6U6sSsefc@kroah.com>
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
Cc: devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 11:12:37PM PDT, Greg Kroah-Hartman wrote:
>On Wed, Oct 06, 2021 at 10:58:59PM -0700, Zev Weiss wrote:
>> On Wed, Oct 06, 2021 at 10:23:33PM PDT, Greg Kroah-Hartman wrote:
>> > On Wed, Oct 06, 2021 at 05:09:46PM -0700, Zev Weiss wrote:
>> > > This is simply the bin_attribute analog to sysfs_remove_file_self().
>> >
>> > No, no binary sysfs file should be triggering a remove.
>> >
>> > binary sysfs files are "pass-through-only" from userspace to hardware,
>> > the kernel should not be even knowing what is read/written to them.
>> >
>> > What do you think this is needed for?
>> >
>>
>> So, I initially set out to be able to activate/deactivate specific DT nodes
>> at runtime by using the device-tree "reserved" status as defined in the spec
>> (but not currently used anywhere in the kernel) to mean essentially "create
>> a device for this but don't bind a driver to it" (leaving it to userspace to
>> invoke bind/unbind or similar), and added initial support for the specific
>> driver I'm concerned with at the moment (aspeed-smc) -- that was the
>> previous patch series linked in the cover letter of this one.
>>
>> In the discussion of that series, Rob suggested as an alternate approach:
>>
>> > Another possibility is making 'status' writeable from userspace. It is
>> > just a sysfs file.
>>
>> That seemed sort of appealing to me, and this seemed like the most obvious
>> way to go about implementing it.  Given that DT properties are binary
>> attributes, I gather you'd consider that a non-starter though?
>
>Why would a text attribute of "status" be a binary sysfs file?  That
>feels really wrong as again, binary sysfs files are not supposed to be
>parsed or handled by the kernel at all, they are only a pass-through.
>

Well, at present all device tree properties are binary sysfs files 
regardless of type, and from a brief git history check it appears 
they've been that way since DT sysfs support was introduced in commit 
75b57ecf9d1d ("of: Make device nodes kobjects so they show up in 
sysfs").

On the surface it seems like it would make sense for string properties 
like status to be text files instead of binary, but (a) looking at some 
of the discussion that preceded that patch, it sounds like there may be 
some ambiguity regarding what the "true" types of different properties 
actually are [0], and (b) changing the contents of those files from e.g.  
"okay\0" to "okay\n" seems likely to lead to broken userspace, so I'd 
guess it's probably moot anyway.

[0] https://lore.kernel.org/lkml/1363801579.17680.3.camel@pasglop/


Zev

