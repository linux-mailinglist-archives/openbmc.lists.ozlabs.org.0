Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789734F03F
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 19:57:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xwp42TCz3c0m
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 04:57:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=PlnBWX/o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=PlnBWX/o; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xwb0KqCz3bp5
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 04:57:02 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8E16F8C;
 Tue, 30 Mar 2021 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617127019;
 bh=vkNDQZl9zqd2neyuTS3BDG1tfovdHaLGI2EfgQJp3os=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PlnBWX/ocnp+K3KqeKPhEbw+pUmxlPzcNplFen0zZty14F3wMH30rQOZX4GYkJ3vY
 8cTAm6/d2HsLfdDF0lxrNb2F+dcfx2N8ZYaw8Kngzl0oEF2mAPZ8XEOnIcVuvIAVxl
 ugkfb+QUFPgxmk6pV0foRupxdvNpIxyKumvIpfTo=
Date: Tue, 30 Mar 2021 12:56:56 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Enabling pmbus power control
Message-ID: <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210330174221.GJ4976@sirena.org.uk>
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

On Tue, Mar 30, 2021 at 12:42:21PM CDT, Mark Brown wrote:
>On Tue, Mar 30, 2021 at 12:19:29PM -0500, Zev Weiss wrote:
>> On Tue, Mar 30, 2021 at 06:22:54AM CDT, Mark Brown wrote:
>> > On Tue, Mar 30, 2021 at 03:34:16AM -0700, Guenter Roeck wrote:
>
>> > > (and I don't know if the userspace consumer code is appropriate - you
>> > > might want to check with the regulator maintainer on that).
>
>> > It's not, you should never see this in a production system.
>
>> Sorry, can you clarify what exactly "this" refers to here?
>
>The userspace consumer.
>
>> > I can't really tell what the issue is here without more context, the
>> > global name list should not be relevant for much in a system that's well
>> > configured so it sounds like it's user error.
>
>> My initial attempt I guess followed the existing ltc2978 code a little too
>> closely and I ended up with all my lm25066 regulators registered under the
>> same (static) name, so when I went to attach the reg-userspace-consumer
>> instances to them by way of that name I got this:
>
>I don't know what you're trying to do or why, nor how you're going about
>achieving it so I can't really comment.  Like I say anything that's
>instantiating a userspace consumer in upstream code is broken, it's
>there for test during development of regulator drivers.  Whatever device
>is supplied by the regulator should have a driver which should control
>the regulator at runtime if that is needed.

Okay, to expand a bit on the description in my initial message -- we've
got a single chassis with multiple server boards and a single manager 
board that handles, among other things, power control for the servers.
The manager board has one LM25066 for each attached server, which acts 
as the "power switch" for that server.  There thus really isn't any 
driver to speak of for the downstream device.

We need to be able to toggle that power switch from userspace on the 
manager board, which we could achieve via i2cset, but we don't want to 
give up the sensors provided by the hwmon driver.

The hardware seems perfectly capable of providing the functionality we 
need -- is there any way of implementing the requisite kernel support in 
a way that the relevant subsystem maintainers would find palatable, or 
is carrying an out-of-tree patch my only option for this?


Thanks,
Zev

