Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4943742F
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 11:01:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbJHZ3HHhz3c8k
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 20:01:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=b1BPRMTI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=b1BPRMTI; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbJH62MB2z3c6C
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 20:01:05 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id CE5873F5;
 Fri, 22 Oct 2021 02:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634893262;
 bh=62xU6A5a1vC0BYtn1PBjgiBPmvcI1s9MDBG0hfgZCHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b1BPRMTItp4tsRe46NuFm5eStvDBte8uFyJHx1UH+qEkNwBbsujhWbNIi3Bi1RWqg
 HGFqBlHlAG4HVrUDOsFarXuo0nSz4sfqcrysR/G51A8BaRUT8toqIEbDqUFRB6mRvk
 SNGJFtO5SsEbzNA0MNH/DudirogvafmkmVegjADI=
Date: Fri, 22 Oct 2021 02:00:57 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/5] driver core, of: support for reserved devices
Message-ID: <YXJ9yR6b5vI3NwF7@hatter.bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <YXJfHwzIdksUKPIe@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXJfHwzIdksUKPIe@kroah.com>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 11:50:07PM PDT, Greg Kroah-Hartman wrote:
>On Thu, Oct 21, 2021 at 07:00:27PM -0700, Zev Weiss wrote:
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
>>
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
>
>Again, the driver core should not care about this, that is up to the bus
>that wants to read these "reserved" values and do something with them or
>not (remember the bus is the thing that does the binding, not the driver
>core).
>
>But are you sure you are using the "reserved" field properly?

Well, thus far both Rob Herring and Oliver O'Halloran (originator of the 
"reserved" status in the DT spec, whom I probably should have CCed 
earlier, sorry) have seemed receptive to this interpretation of it, 
which I'd hope would lend it some credence.

>You are
>wanting to do "something" to the device to later on be able to then have
>the kernel touch the device, while it seems that the reason for this
>field is for the kernel to NEVER touch the device at all.  What will
>break if you change this logic?

Given that there's no existing usage of or support for this status value 
anywhere I can see in the kernel, and that Oliver has indicated that it 
should be compatible with usage in OpenPower platform firmware, my 
expectation would certainly be that nothing would break, but if there 
are examples of things that could I'd be interested to see them.


Thanks,
Zev

