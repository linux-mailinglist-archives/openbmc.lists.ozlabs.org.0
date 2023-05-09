Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE656FC405
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 12:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFvgz5f93z3fMb
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 20:35:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iRKzOqXa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iRKzOqXa;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFvgN635Rz3f51
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 20:35:12 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 7CEE3CCC;
	Tue,  9 May 2023 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1683628510;
	bh=7iMGV4tLm3HmazMtfLfAQna6/xbZ5/qvUaB4DKROWT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRKzOqXaerQKZjz67y4Oq+40ixhZGeUommSM5ce8qB4d7YStqUTmtaGsFGjCB+OUi
	 Wpx7AZ+6KZPL9T4sMksYPsj25V3KLApW3DP4vEAl+xylo3cKp1vmEjHXeypXshoOXW
	 fmOUEzGsIos4jVB59uxjBafUu/CCnk7CxWZdVJAE=
Date: Tue, 9 May 2023 03:35:09 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: Hot-plugging non-sensor devices on non-PnP buses (was: Re:
 entity-manager: SBTSI and hwmontempsensor)
Message-ID: <93fcd898-7eef-4855-b93d-cd34bf7dd758@hatter.bewilderbeest.net>
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
 <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
 <ZFTK+ij4jMAqtQWw@home.paul.comp>
 <17542652-2f18-4bd0-9432-f81ebc4c5f42@hatter.bewilderbeest.net>
 <ZFn46vES/XAKOtuF@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFn46vES/XAKOtuF@home.paul.comp>
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

On Tue, May 09, 2023 at 12:40:26AM PDT, Paul Fertser wrote:
>Hi Zev,
>
>Thank you for answering. A quick additional point inline.
>
>On Mon, May 08, 2023 at 03:46:13PM -0700, Zev Weiss wrote:
>> On Fri, May 05, 2023 at 02:23:06AM PDT, Paul Fertser wrote:
>> > What further complicates situation with leds-pca955x specifically is
>> > that it /needs/ DT or platform data to work, and that makes it try
>> > binding automatically on startup, and probe() fails while the host
>> > system is off, and "new_device" sysfs node can't be used to retry (as
>> > the device is already defined), so either the driver needs to be
>> > modular and reloaded with essentially rmmod/insmod sequence or the
>> > userspace can use sysfs "bind" node to call probe() again (this is
>> > also problematic with entity-manager as $Address template argument
>> > isn't suitable for a string like 5-0019, where 19 is in hex).
>> >
>>
>> This seems like the trickier part to me.  AFAIK the kernel as it stands
>> doesn't really offer any way of specifying any of the additional parameters
>> that DT properties and such can provide when dynamically instantiating
>> devices, so if you need any non-default configuration your only option is a
>> statically-defined device (via a DT node), and if that's not an option
>> because you need dynamic instantiation then you're kind of out of luck
>> unfortunately.
>
>Dynamic instantiation is still possible either by having the
>corresponding kernel driver modular 

True to an extent, though it's rather more of a blunt instrument, since 
it's a per-driver operation instead of per-device (it's a different 
operation that happens to trigger the desired behavior as a side-effect, 
I'd say).

>or by using "bind" and "unbind"
>sysfs nodes.

Ah right, I'd forgotten about that one -- I actually sent some patches 
upstream to try to make that mode work a little more gracefully a while 
back (adding a way of preventing automatic driver-bind on boot so it 
would only be done when explicitly requested), but never arrived at 
anything that all the relevant maintainers approved of.

Also (this is arguably somewhat pedantic, but for the kinds of things we 
might end up dealing with perhaps relevant): while it is at least 
operating at the same per-device granularity, bind/unbind is still 
semantically a distinct operation from true dynamic instantiation 
though.  For a bind operation you need an extant device to attach a 
driver to, whereas the i2c new_device operation actually creates a new 
thing that wasn't previously there.  There are many cases where 
bind/unbind might be sufficient, but in other scenarios it might not be.

>In this specific case we tested having the driver
>built-in, it tries binding on BMC startup, fails if the host is off,
>then at any point of time one can do "echo 5-0019 >
>/sys/bus/i2c/drivers/leds-pca955x/bind" and it'll re-try binding, and
>that works if the host is on at the moment. And of course it can be
>"unbind" later if needed. This could even almost work with current
>entity-manager code if it was listening for host power state events,
>if it wasn't skipping the devices that it already tried exporting, and
>if it had something like $HexAddress for the template arguments.
>

Perhaps that's something worth experimenting with and posting E-M 
patches for?  Though the "bouncing off the guardrails" aspect (the 
futile bind attempt on boot) is a bit unfortunate of course...and it 
might need some additional consideration of what happens if the host 
_does_ happen to be powered on when the BMC boots (and the boot-time 
bind succeeds instead of failing).


Zev

