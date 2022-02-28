Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6471C4C7D89
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 23:39:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6wKW3k4nz3bgR
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 09:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=FZ7rnZFk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=FZ7rnZFk; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6wK440FJz3bYF
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 09:38:41 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5FF0B139;
 Mon, 28 Feb 2022 14:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646087919;
 bh=2uC6078oH3Bjn5+qeOcOt6vnpU3SmGke5RIrxVw/quI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZ7rnZFkjZ8C/yuOSSKaqEbPCDZXUV/GQa0MjtB27Dr1dNJRSo44erX1FbORiDDHH
 M2T5cFeytDEiGq/iGlDIz+GqRaEYEAov/DlIjaT6kSpeXExGWf/qh4q498F/dacnzM
 DjaFNUtTTolR8HupEEgwlSmelIK28uy0Es+fUGLU=
Date: Mon, 28 Feb 2022 14:38:35 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
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

Hi Peter,

Thanks for the reply!  (More below.)

On Mon, Feb 28, 2022 at 01:54:09PM PST, Peter Rosin wrote:
>On 2022-02-01 01:18, Zev Weiss wrote:
>> Hello,
>>
>> This series adds support for a new pca9541 device-tree property
>> ("release-delay-us"), which delays releasing ownership of the bus
>> after a transaction for a configurable duration, anticipating that
>> another transaction may follow shortly.  By avoiding a
>> release/reacquisition between transactions, this can provide a
>> substantial performance improvement for back-to-back operations -- on
>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>
>Hi!
>
>Sorry for the late reply. It seems I'm forever swamped...
>
>There is a risk with this scheme. If you have two (or more) of these
>chips on the same bus, and there are clients behind these two chips
>that have the same address, accesses to one of the clients might
>"leak through" the other arb to an unexpected client when its arb
>is in it's release-delay state.
>
>In other words, it is no coincidence that the segment lock is held
>over the whole acquire-access-release cycle.

That's not a scenario I had considered, but I think I see what you're 
saying.  Just to make sure I'm understanding correctly, the problematic 
situation you're describing would involve multiple (sibling, not 
parent/child cascaded) arbiters at distinct addresses on the same 
(master-side) bus, in effect acting as a sort of "distributed mux" in 
addition to arbitrating between multiple attached masters?  (So kind of 
an M-to-N arrangement between M masters and N busses.)

In which case if more than one of the arbiters had their downstream 
busses simultaneously connected to the same master (as could result if 
one were still connected due to a delayed release while the master had 
already started a subsequent transaction via another arbiter), the 
resulting "combined" bus could end up with address collisions between 
devices downstream of the arbiters if there are common addresses in use 
between the downstream busses.

>
>Sure, you can always say "don't add a release-delay when ...", but I
>see no such documentation.
>

Assuming I haven't misunderstood the above, would expanding the 
description of the property in the DT binding like so be sufficient?

  - release-delay-us: the number of microseconds to delay before
    releasing the bus after a transaction.  If unspecified the default
    is zero (the bus is released immediately).  Non-zero values can
    reduce arbitration overhead for back-to-back transactions, at the
    cost of delaying the other master's access to the bus.

    If this property is employed on hardware with multiple parallel
    (not cascaded) arbiters selecting between multiple downstream
    busses, address conflicts can occur if a device on one of the
    downstream busses uses the same address as a device on another
    downstream bus.  This property should thus only be used if either
    (a) there is only one arbiter on the bus, (b) multiple arbiters are
    strictly cascaded to a single downstream bus, or (c) all of the
    devices on all downstream busses use addresses that are unique
    across all of those busses.

If so I'll send a v3 with that change shortly.

Thanks,
Zev

