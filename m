Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C26549453E
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 01:53:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfPBq6z4mz3bPS
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 11:53:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfPBX0C8Gz2xrj
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 11:53:07 +1100 (AEDT)
Received: from [172.16.68.165] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A58BB2012D;
 Thu, 20 Jan 2022 09:28:05 +0800 (AWST)
Message-ID: <3f884ee81d2bfacf4a112369b79e7e5d367ad774.camel@codeconstruct.com.au>
Subject: Re: MCTP/PLDM BMC-host communication design
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 20 Jan 2022 08:53:02 +0800
In-Reply-To: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
References: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tung,

> We are using community PLDM/MCTP code to design our MCTP/PLDM stack
> via SMBUS on aarch64 system. Basically, we have 2 CPU sockets
> corresponding with 2 SMBUS addresses, and the MCTP/PLDM stack looks
> like this image:
>  
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd39303bbb6e9c8a6f646/current_design.png

That looks good to me, but a couple of notes:

 - EID 0 and EID 1 are reserved addresses according to the spec, the
   usable range starts at 8

 - therefore, the *convention* so far for EID allocation is to assign
   EID 8 to the BMC, as the top-level bus owner, and allocate onwards
   from there. However, that's certainly not fixed if you require
   something different for your design.

 - you don't necessarily need two EIDs (0 and 1) for the BMC there.
   Even if there are two interfaces, you can use a single EID on the
   BMC, which simplifies things.

> Due to the not supported of discovery process, we are fixing the EIDs
> for host.

As Andrew has mentioned, we have the in-kernel stack working, including
the EID discovery process using MCTP Control Protocol messaging.

If you'd like to experiment with this, we have a couple of backport
branches for 5.10 and 5.15 kernels, depending on which you're working
with:

 https://codeconstruct.com.au/docs/mctp-on-linux-introduction/#our-development-branches

It's still possible to use fixed EID(s) for remote endpoints though, if
your host MCTP stack does not support the control protocol. You'll just
need to set up (on the BMC) some static routes for the fixed remote
EIDs. I'm happy to help out with configuring that if you like.

> A new way that is considering is like the image:  
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd39303bbb6e9c8a6f646/new_design.png

That looks like it has some considerable drawbacks though, being:

 - you'll now need to implement MCTP bridging between the SMBus link
   (between host and socket 0) and whatever interface you're using to
   communicate between socket 0 and socket 1. This may then require you
   to implement more of the control protocol stack on the host (for
   example, as you'll need to allocate EID pools from the top-level bus
   owner, if you're doing dynamic addressing).

   That's all still possible, but requires more firmware you'll need to
   implement

 - if there's an issue with the socket 0's link, (say, if the host
   has offlined offlined CPUs in socket 0), you might lose MCTP
   connectivity between the BMC and socket 1 too.

That said, it's still feasible, but I'd suggest your first design as a
simpler and more reliable solution.

Regards,


Jeremy

