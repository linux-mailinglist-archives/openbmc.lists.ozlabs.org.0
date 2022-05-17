Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC168529ED0
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 12:08:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Wyz5jcrz3brk
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 20:08:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=dtOrTtJc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=dtOrTtJc; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Wyc0v13z3bWM
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:07:51 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 05B9E48B;
 Tue, 17 May 2022 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652782070;
 bh=7/tSQcJTwFlAYZHGtTGrf3lNts+XD/u1WDbgTy1/QUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtOrTtJckFMCgB1Kh/uKzZFiJTssUMa2AnTJ557wFFDA0lC0NeVbCReLIqNVRj4WI
 oRpRAKh+LlvUMDY2l2aWPXJH1SEHC23TLCjXCIRrZ4HurkFSU0XnwGDsbF3s0jA0WQ
 4tok2RfF7GhCzV1W4hZ5C+5xobLfDLI7z1mzbMF8=
Date: Tue, 17 May 2022 03:07:48 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 2/2] extcon: Add extcon-regulator driver
Message-ID: <YoNz9NPLkYSd8i/s@hatter.bewilderbeest.net>
References: <20220505232557.10936-1-zev@bewilderbeest.net>
 <20220505232557.10936-3-zev@bewilderbeest.net>
 <e27ff1b2-c82f-8335-340f-ae1fa914ed30@gmail.com>
 <YnkyIBh2HnXXLHw3@sirena.org.uk>
 <CGME20220517010322epcas1p45d7fdaa06d23f07533350b7d0cf9e9d6@epcas1p4.samsung.com>
 <YoL0UGR+TiZojL9Y@hatter.bewilderbeest.net>
 <bc6595c8-5f05-ac2c-63e0-f442f9ec83be@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc6595c8-5f05-ac2c-63e0-f442f9ec83be@samsung.com>
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
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>,
 openbmc@lists.ozlabs.org, Chanwoo Choi <cwchoi00@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 08:15:31PM PDT, Chanwoo Choi wrote:
> Hi Mark, Zev,
> 
> On 5/17/22 10:03 AM, Zev Weiss wrote:
> > [Adding Sebastian for drivers/power discussion]
> > 
> > On Mon, May 09, 2022 at 08:24:16AM PDT, Mark Brown wrote:
> >> On Mon, May 09, 2022 at 09:24:39PM +0900, Chanwoo Choi wrote:
> >>> Hi Zev,
> >>>
> >>> I checked this patch. But, it doesn't look like the extcon provider
> >>> driver. Because basically, extcon provider driver need the circuit
> >>> in order to detect the kind of external connector. But, there are
> >>> no any code for detection. Just add the specific sysfs attribute
> >>> for only this driver. It is not standard interface.
> >>
> >> OTOH it's something where if I look at the physical system with the
> >> hardware there's a clearly visible external connector that I can point
> >> to - it just happens to not support hotplug.  It's not clear what other
> >> system it would sit in, and it seems like an application that displays
> >> external connections on a system in a UI would be able to do something
> >> sensible with it.
> > 
> > Chanwoo, any further thoughts on Mark's reasoning above?
> > 
> > I certainly understand the reluctance to add an extcon driver that 
> > doesn't really do anything with the extcon API, and I have no idea when 
> > we might end up enhancing it to do something more meaningful with that 
> > API (I don't know of any hardware at the moment that would need it).
> > 
> > That said, as Mark points out, the hardware *is* ultimately an "external 
> > connector" (if a very simplistic one).
> > 
> > Do you have any other ideas for where this functionality could go?  Greg 
> > wasn't enthusiastic about a previous revision that had it in 
> > drivers/misc -- though now a fair amount of what was in that version is 
> > now going to be in the regulator core, so maybe that could be 
> > reconsidered?
> > 
> > Or maybe something under drivers/power, though it's not really a supply 
> > or a reset device...drivers/power/output.c or something?
> > 
> > Personally I don't have any terribly strong opinions on this, I'd just 
> > like to reach a mutually-agreeable consensus on a place for it to live.
> > 
> 
> After Mark's reply, I considered extcon provider driver without hotplug
> feature. I think that extcon need to support the following something:
> 
> 1. Need to specify the type of external connector instead of EXTCON_NONE.
> 2. extcon subsystem provides the standard sysfs interface
>    for non-hotplug extcon provider driver.
> 3. User can control the state of external connector via
>    the standard extcon sysfs attributes.
> 
> 
> For example of extcon provider driver,
> static const unsigned int supported_cables[] = {
> 	EXTCON_USB,
> 	EXTCON_NONE,
> };
> 
> int extcon_usb_callback(int connector_id, int property_id, int state, void *data) {
> 	struct extcon_dev *edev = data;
> 
> 	if (id == EXTCON_USB && property_id == EXTCON_NOT_HOTPLUG) {
> 		regulator_enable() or regulator_disable()
> 	}
> 
> 	return 0;
> }
> 
> int extcon_provider_probe(...) {
> 	edev = devm_extcon_dev_allocate(dev, supported_cables);
> 
> 	devm_extcon_dev_register(dev, edev);
> 
> 	extcon_set_property_capability(edev, EXTCON_USB, EXTCON_NOT_HOTPLUG);
> 	extcon_set_property_callback(edev, EXTCON_USB, extcon_usb_callback);
> 
> 	...
> }
> 
> And then user can change the state of each external connector
> via '/sys/class/extcon/extcon0/cable.0/state' 
> if cable.0 contains the EXTCON_NOT_HOTPLUG property.
> 
> I'm designing this approach. But it has not yet decided
> because try to check that this approach is right or not.
> 

Okay, so if I'm understanding correctly we'd be using the extcon 
subsystem's existing attached/detached state to model (and control) the 
on/off state of the power output?

That could work for the particular hardware I'm dealing with at the 
moment, though I'd be a bit concerned that conflating the two might 
constrain things in the future if there's some similar but slightly more 
sophisticated hardware we'd want to extend the same driver to support.  
For example on a power connector with some capability for presence 
detection, we might want to be able to support "attached but powered 
off" as a valid state for it to be in -- would the above approach be 
able to do that?


Thanks,
Zev

