Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775704CB3E2
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 01:43:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8C0P2vhyz3bsK
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 11:43:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=C/YsvAEM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=C/YsvAEM; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8Bzy5YLxz30hR
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 11:43:26 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9D943190;
 Wed,  2 Mar 2022 16:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646268203;
 bh=PkbqVC5uuCFUhGXJsfbzfFsRDz4AaaTMZaDH1fA7Inw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C/YsvAEMxarVn9CXlTD/RQxDBpiJGF6DkVS+2e57hpBWnK/AQHa0GNUAgG37ZlOTs
 kJjAkTYObLiDG0SDDEdUhyzHFeA+ca9fnDlgrmAerRDrb9FUOgQUe4KdFG760Bn9jJ
 IgOqBc93UMFY60vbTjA674PJjcOaY+iAzsg+6pCo=
Date: Wed, 2 Mar 2022 16:43:20 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
 <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
 <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 02, 2022 at 06:43:31AM PST, Peter Rosin wrote:
>On 2022-02-28 23:38, Zev Weiss wrote:
>> Hi Peter,
>>
>> Thanks for the reply!  (More below.)
>>
>> On Mon, Feb 28, 2022 at 01:54:09PM PST, Peter Rosin wrote:
>>> On 2022-02-01 01:18, Zev Weiss wrote:
>>>> Hello,
>>>>
>>>> This series adds support for a new pca9541 device-tree property
>>>> ("release-delay-us"), which delays releasing ownership of the bus
>>>> after a transaction for a configurable duration, anticipating that
>>>> another transaction may follow shortly.  By avoiding a
>>>> release/reacquisition between transactions, this can provide a
>>>> substantial performance improvement for back-to-back operations -- on
>>>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>>>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>>>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>>>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>>
>>> Hi!
>>>
>>> Sorry for the late reply. It seems I'm forever swamped...
>>>
>>> There is a risk with this scheme. If you have two (or more) of these
>>> chips on the same bus, and there are clients behind these two chips
>>> that have the same address, accesses to one of the clients might
>>> "leak through" the other arb to an unexpected client when its arb
>>> is in it's release-delay state.
>>>
>>> In other words, it is no coincidence that the segment lock is held
>>> over the whole acquire-access-release cycle.
>>
>> That's not a scenario I had considered, but I think I see what you're
>> saying.  Just to make sure I'm understanding correctly, the problematic
>> situation you're describing would involve multiple (sibling, not
>> parent/child cascaded) arbiters at distinct addresses on the same
>> (master-side) bus, in effect acting as a sort of "distributed mux" in
>> addition to arbitrating between multiple attached masters?  (So kind of
>> an M-to-N arrangement between M masters and N busses.)
>>
>> In which case if more than one of the arbiters had their downstream
>> busses simultaneously connected to the same master (as could result if
>> one were still connected due to a delayed release while the master had
>> already started a subsequent transaction via another arbiter), the
>> resulting "combined" bus could end up with address collisions between
>> devices downstream of the arbiters if there are common addresses in use
>> between the downstream busses.
>
>Yes, you understood me correctly. That is, if I understood you
>correctly :-)
>

Okay, thanks for confirming.

>>>
>>> Sure, you can always say "don't add a release-delay when ...", but I
>>> see no such documentation.
>>>
>>
>> Assuming I haven't misunderstood the above, would expanding the
>> description of the property in the DT binding like so be sufficient?
>>
>>   - release-delay-us: the number of microseconds to delay before
>>     releasing the bus after a transaction.  If unspecified the default
>>     is zero (the bus is released immediately).  Non-zero values can
>>     reduce arbitration overhead for back-to-back transactions, at the
>>     cost of delaying the other master's access to the bus.
>>
>>     If this property is employed on hardware with multiple parallel
>>     (not cascaded) arbiters selecting between multiple downstream
>>     busses, address conflicts can occur if a device on one of the
>>     downstream busses uses the same address as a device on another
>>     downstream bus.  This property should thus only be used if either
>>     (a) there is only one arbiter on the bus, (b) multiple arbiters are
>>     strictly cascaded to a single downstream bus, or (c) all of the
>>     devices on all downstream busses use addresses that are unique
>>     across all of those busses.
>>
>> If so I'll send a v3 with that change shortly.
>
>I'm not sure this is a bindings thing or a quality of implementation
>issue. You could imagine an implementation where the arb is
>opportunistically left connected for the release-delay, but that the
>arb is disconnected immediately if/when there is a change of the bus
>topology, possibly only if the topology change in turn cause address
>conflicts. The implication is that I'm not sure if this caveat should
>be described in the bindings documentation or elsewhere. It sure would
>be convenient to see it with the bindings, because if it is elsewhere
>I'm sure more people will fail to take notice.
>

Yeah, I was thinking along similar lines -- bindings don't seem like 
exactly the "right" place for it, but perhaps the pragmatic place in 
order for people to actually see it.  I guess maybe this sort of gets 
back into questions of what exactly DT should describe and to what 
extent this is a property of the hardware vs. the software running on 
it...

Automating an earlier release in the event of a potential conflict being 
detected would be nice, though given the possibility of devices on the 
bus that the kernel doesn't know about (e.g. things driven directly from 
userspace via the i2c-dev interface) it doesn't seem entirely feasible 
to do that soundly.  A conservative approximation (e.g. releasing on the 
next transaction on the parent physical bus that's not from the same 
arbiter's virtual bus) seems like it could probably retain most of the 
benefit of the delayed release, though implementing it would probably 
require some plumbing in the i2c code that I'm guessing doesn't 
currently exist.  Thoughts?

>Another risk with the scheme is that you possibly lock out the other
>master for so long time that you trigger it to force its way in, thus
>possible wrecking some transaction. Or is the PCA9541 defending against
>such wreckage on "hostile" takeovers? (I too lack the HW and time to
>tinker with this.) If so, that might of course happen anyway, but it
>might be so much more common if the bus is left connected.
>

Yeah, this is sort of what the "at the cost of..." bit in the 
dt-bindings description was getting at, if a bit obliquely.  It's a risk 
that's not unique to this feature being in use, but yes, using it does 
of course increase the risk.  For what my datapoint is worth, it hasn't 
been problematic in my use of it thus far in a system with two fairly 
heavily-utilized busses (and a handful of more lightly used ones) each 
shared by two masters, both of which are Linux hosts running this driver 
with a release delay of 10ms.


Thanks,
Zev

