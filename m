Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C656F4958F7
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 05:37:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg67K4wn2z30NW
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 15:37:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg6715Vn4z2xXd
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jan 2022 15:37:33 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B3FF820181;
 Fri, 21 Jan 2022 12:37:29 +0800 (AWST)
Message-ID: <e07dd78b9808ce0973f0adbe5ed7b3c062faca74.camel@codeconstruct.com.au>
Subject: Re: MCTP/PLDM BMC-host communication design
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>, "andrew@aj.id.au"
 <andrew@aj.id.au>
Date: Fri, 21 Jan 2022 12:37:29 +0800
In-Reply-To: <BL0PR01MB5156BFDEAE95BDF87F395F8AFF5B9@BL0PR01MB5156.prod.exchangelabs.com>
References: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
 <3f884ee81d2bfacf4a112369b79e7e5d367ad774.camel@codeconstruct.com.au>
 <BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9@BL0PR01MB5156.prod.exchangelabs.com>
 <BL0PR01MB5156BFDEAE95BDF87F395F8AFF5B9@BL0PR01MB5156.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2-1 
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
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tung,

> Appreciated of your comments. We are using theuserspace MCTP and will
> consider moving to kernel space MCTP as the suggestion. 
> Because of the specific requirements, we look forward for simpler
> way. In our case, we have on-chip sensors and events which are
> allocated in both 2 sockets, and the situation is: we must send the
> PLDM command to poll the data.

Yes, that all sounds fine.

> If using 2 interfaces to communicate
> with host, I think it would be complex when sending to multiple
> sockets. 

[We're at risk of overloading the term "socket" here, as it also refers
to the kernel interface to the MCTP stack - the sockets API. So I'll use
the word "CPU" instead, referring to the physical device, being the
MCTP/PLDM endpoint]

If you're using the kernel stack, there's no real additional complexity
with the two-interface model; you would just configure each interface,
and set up routes to each CPU EID. This is a once-off configuration at
BMC boot time. If you're using dynamic addressing, mctpd takes care of
that for you.

The PLDM application only needs to have knowledge of the EIDs of the
CPUs - the kernel handles the routing of which interface to transmit
packets over, based on the packets' destination EIDs.

> The things should be considered as :
> + If a socket is problem during runtime, is the process of MCTPL/PLDM
> still ok

The MCTP stack on the BMC will be fine. I assume the BMC PLDM
application will timeout any pending requests, and should handle that
gracefully too.

> + If one, or more socket problem. Can we reboot the whole system to
> recover ?

You could, but that's pretty heavy-handed. There should be no need to
reboot the BMC at all. And for the CPU's MCTP implementation, I assume
there's a way to perform recovery there, rather than requiring a host
reboot.

The two-interface architecture does give you more fault-tolerance there;
if one CPU's MCTP stack is not reachable, it doesn't prevent
communication with the other.

> When using 1 interface, i think:
> + From the host side, socket 0 (master) should manage its other
> sockets, (might be not via SMBus, but other faster sockets
> communication). Of course, the more work should be implemented in the
> firmware, and you have pointed.
> + BMC just recover the system (via reboot) when socket 0 issue,
> otherwise it does properly

Not sure what you mean by "it does properly" there - but I think avoiding
host reboots would definitely be a good thing. Also, if the fault on
CPU0 isn't recoverable, you won't be able to perform any communication
with CPU1.

Regards,


Jeremy
