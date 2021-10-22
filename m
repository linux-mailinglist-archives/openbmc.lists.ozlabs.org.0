Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18195437067
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 05:14:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb8Zp3sn2z3cDX
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 14:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=IKgkUD9b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=IKgkUD9b; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb8Z048ntz3cDm
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 14:13:27 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 949F582;
 Thu, 21 Oct 2021 20:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634872404;
 bh=LLNRJiKGUMP7EoEUR5wD7aBtbHYbva/6dCa1Qn54veA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKgkUD9bQNVd0XbhImJSr8B9499DdErazMVErWDoirEAEC+tFs0P/BCzyQWEi625B
 CLioUn/XybYiEDiTPUzYo2PGkG5J08gr84dqq6JWu+2nTxAfL0l15t8F1DEgteW6Mi
 hdfS4zkF/77d6chq5yp1zOLPgb6rIMlbASLrxKio=
Date: Thu, 21 Oct 2021 20:13:19 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/5] driver core, of: support for reserved devices
Message-ID: <YXIsTxprltXzBv+6@hatter.bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <CAL_JsqLmonXoV2qJ4zY1wfDTRuQAYQuymXEB2kTpUmkKWwPGjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAL_JsqLmonXoV2qJ4zY1wfDTRuQAYQuymXEB2kTpUmkKWwPGjg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 07:58:46PM PDT, Rob Herring wrote:
>On Thu, Oct 21, 2021 at 9:00 PM Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> Hello all,
>>
>> This series is another incarnation of a couple other patchsets I've
>> posted recently [0, 1], but again different enough in overall
>> structure that I'm not sure it's exactly a v2 (or v3).
>>
>> As compared to [1], it abandons the writable binary sysfs files and at
>> Frank's suggestion returns to an approach more akin to [0], though
>> without any driver-specific (aspeed-smc) changes, which I figure might
>> as well be done later in a separate series once appropriate
>> infrastructure is in place.
>
>I skimmed this, and overall I like the approach.
>
>> The basic idea is to implement support for a status property value
>> that's documented in the DT spec [2], but thus far not used at all in
>> the kernel (or anywhere else I'm aware of): "reserved".  According to
>> the spec (section 2.3.4, Table 2.4), this status:
>>
>>   Indicates that the device is operational, but should not be used.
>>   Typically this is used for devices that are controlled by another
>>   software component, such as platform firmware.
>>
>> With these changes, devices marked as reserved are (at least in some
>> cases, more on this later) instantiated, but will not have drivers
>> bound to them unless and until userspace explicitly requests it by
>> writing the device's name to the driver's sysfs 'bind' file.  This
>> enables appropriate handling of hardware arrangements that can arise
>> in contexts like OpenBMC, where a device may be shared with another
>> external controller not under the kernel's control (for example, the
>> flash chip storing the host CPU's firmware, shared by the BMC and the
>> host CPU and exclusively under the control of the latter by default).
>> Such a device can be marked as reserved so that the kernel refrains
>> from touching it until appropriate preparatory steps have been taken
>> (e.g. BMC userspace coordinating with the host CPU to arbitrate which
>> processor has control of the firmware flash).
>>
>> Patches 1-3 provide some basic plumbing for checking the "reserved"
>> status of a device, patch 4 is the main driver-core change, and patch
>> 5 tweaks the OF platform code to not skip reserved devices so that
>> they can actually be instantiated.
>>
>> One shortcoming of this series is that it doesn't automatically apply
>> universally across all busses and drivers -- patch 5 enables support
>> for platform devices, but similar changes would be required for
>> support in other busses (e.g. in of_register_spi_devices(),
>> of_i2c_register_devices(), etc.) and drivers that instantiate DT
>> devices.  Since at present a "reserved" status is treated as
>> equivalent to "disabled" and this series preserves that status quo in
>> those cases I'd hope this wouldn't be considered a deal-breaker, but
>> a thing to be aware of at least.
>>
>> Greg: I know on [1] you had commented nack-ing the addition of boolean
>> function parameters; patch 4 adds a flags mask instead in an analogous
>> situation.  I'm not certain how much of an improvement you'd consider
>> that (hopefully at least slightly better, in that the arguments passed
>> at the call site are more self-explanatory); if that's still
>> unsatisfactory I'd welcome any suggested alternatives.
>
>Can't we add a flag bit in struct device to reflect manual binding?
>bind will set it and unbind clears it.
>

I considered this (and actually drafted up a version that did exactly 
that), but it seemed like turning a parameter-passing problem into a 
state-maintenance problem (finding all the places that flag would need 
to be cleared and ensuring newly-added ones don't get missed, which 
unlike a function parameter the compiler can't really check for us).  
Given that the live range (definition to use) of that value is entirely 
within the codepath of a single call-chain (bind_store() -> 
device_driver_attach() -> __driver_probe_device()), continuing to 
maintain that state beyond that call chain seemed like unnecessary 
complexity to me, but if there's a consensus that that would actually be 
preferable I can certainly do it that way instead.


Zev

