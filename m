Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7703E6FBB26
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 00:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFbyC0Vzpz3fGD
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 08:46:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bId/ZH83;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bId/ZH83;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFbxY4Xtrz2xVn
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 08:46:25 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C4BDD62B;
	Mon,  8 May 2023 15:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1683585974;
	bh=xXB80i1BGAJrYkC6S3V64Nru5porfxqeMebulsg0sbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bId/ZH83y2Ku3fwLtxndYquKnL3viAQv/jTZnAzE+1vkQarfhRtBt7OHs9Zu8QWAP
	 d6VvcKov4SnihKf0fIrMUApW+1R7h4cS0SsvDY0DkW+PYCiXuW5hNpzpkaKueTrWbo
	 iDuSOQzN/bEsFQCRJKmVk2O0u8IgCMJnMwBJHbjw=
Date: Mon, 8 May 2023 15:46:13 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: Hot-plugging non-sensor devices on non-PnP buses (was: Re:
 entity-manager: SBTSI and hwmontempsensor)
Message-ID: <17542652-2f18-4bd0-9432-f81ebc4c5f42@hatter.bewilderbeest.net>
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
 <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
 <ZFTK+ij4jMAqtQWw@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFTK+ij4jMAqtQWw@home.paul.comp>
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
Cc: Ed Tanous <edtanous@google.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 05, 2023 at 02:23:06AM PDT, Paul Fertser wrote:
>Hi Zev,
>
>I do not mean to hi-jack the topic as the issue I have a question about
>is closely related, please see inline.
>
>On Thu, May 04, 2023 at 02:10:15PM -0700, Zev Weiss wrote:
>> It shouldn't be in your DTS, because then it'd be statically defined and
>> hwmontempsensor wouldn't be able to remove it when the host is powered off
>> (which I assume you'd want).
>>
>> In terms of userspace/kernel separation, it's overall pretty similar to how
>> it had been previously, just with the management of device lifetimes
>> (instantiation & removal) moved to hwmontempsensor instead of
>> entity-manager.
>
>I see similar mechanism is also implemented in omnisensor, so this can
>be an option (probably preferred since it's a much cleaner code) too.
>

Yeah, omnisensor works the same way, at least in part out of necessity 
due to aiming to be drop-in compatible with dbus-sensors.

>But what if the device in consideration isn't a sensor at all? We're
>trying to use PCA9551 which is a LED driver controllable over
>I2C. Since it's meant to show statuses of the host storage devices
>it's powered only when the host is powered. The kernel driver
>leds-pca955x handles it nicely but the probe() needs to be run with
>the device powered.
>

Okay, that sounds pretty analogous to the scenario I had that initially 
motivated moving device management to hwmontempsensor (a sensor driver 
that needed to be bound when the host was powered on and unbound when it 
shut down), so trying to reuse the same solution seems sensible.

>I initially thought entity-manager should be the right place in the
>architecture to handle cases like this, but now that you say OpenBMC
>is moving towards implementing dynamic driver assigning functionality
>in the sensors daemons instead I wonder what the solution for the
>non-sensor devices should be (as duplicating the relevant code in
>phosphor-led-manager seems to be obviously wrong). I can also imagine
>e.g. SPI devices needing similar treatment, so it's neither sensors
>nor I2C specific in the big picture.
>

Yeah, the existing implementation is certainly a fairly small slice of 
the full generality we'd ideally have.  I'm afraid I don't have any 
particularly great thoughts offhand about the best way to generalize the 
approach though.  Code duplication is of course not ideal, though I 
think the amount of code involved isn't too huge; factoring it out into 
a library or something to be shared between dbus-sensors and 
phosphor-led-manager (do we know of any other potential users at the 
moment?) seems like a fair amount of added complexity to avoid 
duplicating it -- but then again, duplication of that sort of common 
infrastructure code is a large part of what drives me nuts about the 
dbus-sensors codebase, so I'd certainly sympathize with not wanting to 
head down that path...

>What further complicates situation with leds-pca955x specifically is
>that it /needs/ DT or platform data to work, and that makes it try
>binding automatically on startup, and probe() fails while the host
>system is off, and "new_device" sysfs node can't be used to retry (as
>the device is already defined), so either the driver needs to be
>modular and reloaded with essentially rmmod/insmod sequence or the
>userspace can use sysfs "bind" node to call probe() again (this is
>also problematic with entity-manager as $Address template argument
>isn't suitable for a string like 5-0019, where 19 is in hex).
>

This seems like the trickier part to me.  AFAIK the kernel as it stands 
doesn't really offer any way of specifying any of the additional 
parameters that DT properties and such can provide when dynamically 
instantiating devices, so if you need any non-default configuration your 
only option is a statically-defined device (via a DT node), and if 
that's not an option because you need dynamic instantiation then you're 
kind of out of luck unfortunately.

DT overlays should solve this problem, but they've never made it 
upstream into the mainline kernel, and the last time I looked into it 
the impression I got was that getting them there would probably be a 
years-long effort, and one with no guarantee of success at that.  :/

It's not a great situation.

>I would be happy to hear your and the other OpenBMC community member's
>thoughts on this matter.
>

I'd also be curious if others have thoughts -- Ed or Andrew perhaps?


Zev

