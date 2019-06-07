Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0E3963C
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 21:54:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LCsm1cZvzDqNP
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2019 05:54:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
X-Greylist: delayed 600 seconds by postgrey-1.36 at bilbo;
 Sat, 08 Jun 2019 05:53:59 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45LCs35V05zDqxg
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2019 05:53:58 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA59E2B;
 Fri,  7 Jun 2019 12:43:54 -0700 (PDT)
Received: from supven01-thinkstation-p720.austin.arm.com
 (supven01-thinkstation-p720.austin.arm.com [10.118.30.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFEE73F718;
 Fri,  7 Jun 2019 12:43:54 -0700 (PDT)
Message-ID: <170efdca68cf69f93ee902b2c7ae7884e2a4217f.camel@arm.com>
Subject: Re: An in-kernel implementation of MCTP for a socket-based
 interface to MCTP networks
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 07 Jun 2019 19:43:54 +0000
In-Reply-To: <18303a54-a3b0-4645-bdad-85a0c6ce4487@www.fastmail.com>
References: <18303a54-a3b0-4645-bdad-85a0c6ce4487@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2019-05-30 at 17:34 +0930, Andrew Jeffery wrote:
> Hello,
Hello Andrew

> 
> I'm working on exposing MCTP packets and messages from the kernel via
> sockets
> and a new protocol/address family, AF_MCTP. The purpose of the email
> is to
> outline what interactions will look like in userspace and some of the
> justifications for why this is a useful thing to do.
> 
> If this piques your interest or provokes you in some way, please
> reply with
> feedback!
> 
> Proposed Userspace Interface
> ----------------------------
> 
> To send and receive MCTP messages, a rough sketch in C looks like
> (not even
> compiled, let alone tested):
> 
> ```
> 	struct sockaddr_mctp ep = { .network = <UUID>, .eid = <EID> };
Socket information usually contain family and data (protocol specific
address). So, not sure of the use for network and eid fields. Can you
clarify? 

> 	uint8_t req[...] = { <Message Body> };
> 	ssize_t sent, recvd;
> 	uint8_t resp[...];
> 	int sock;
> 
> 	/* Send full MCTP messages with SOCK_DGRAM */
> 	sock = socket(AF_MCTP, SOCK_DGRAM, 0);
> 	assert(s >= 0);
> 
> 	sent = sendto(sock, req, sizeof(req), 0, &ep, sizeof(ep));
> 	assert(sent == sizeof(msg));
> 
> 	recvd = recvfrom(sock, resp, sizeof(resp), 0, &ep, sizeof(ep));
> 	assert(recvd == sizeof(resp));
> 
> 	/* Process response message body */
> 	...
> 
> 	close(sock);
> ```
> 
> Background
> ----------
> 
> A number of us in the community have been looking at enabling MCTP
> support in
> OpenBMC. Currently we have Jeremy's libmctp implementation, which is
> intended
> to be a minimal but capable, portable implementation of the MCTP base
> specification and relevant bindings. Part of libmctp's mission is to
> be useful
> to both BMC and host firmware, and on the BMC, this means being
> leveraged by
> userspace applications.
Excellent.

> 
> The DMTF PCMI WG have defined various bindings for MCTP, including
> PCIe VDM,
> KCS, serial and SMBus/I2C.
> 
> Putting my OpenPOWER hat on, we were looking at what bindings we
> could make use
> of in our platform designs. We make heavy use of the LPC bus during
> early boot,
> and so solutions needed to be useful across that interface. This
> requirement
> eliminates PCIe VDM (as do constraints in our PHBs). There's also no
> path for
> SMBus/I2C, leaving KCS and serial. KCS as it stands is pretty much
> MCTP wrapped
> in IPMI across a slow interface, and serial's no speed demon either.
> Additionally, we can only use the VUART, and there's only one in the
> AST2400/AST2500, so if we were to use it we'd have to multiplex the
> console
> with MCTP messages. This is all fairly ugly.
> 
> What Jeremy has proposed is a yet-to-be-standardised LPC MCTP binding
> that
> makes use of both a portion of the LPC FW space and a KCS device in
> the LPC IO
> space. This is made possible on ASPEED hardware by pointing the
> LPC2AHB bridge
> at a region of RAM, and defining an ABI for Rx and Tx buffers within
> that
> memory region. The KCS interface is then lightly used as an out-of-
> band
> mechanism for arbitration of buffer ownership. This gets us an
> efficient
> LPC-based interface for MCTP on our platforms that is compatible with
> existing
> hardware.
Can LPC binding be proposed to DMTF PMCI group for standardization. I
heard it briefly mentioned by Deepak in one of the calls, but dont
think we have a document ready yet. Correct?

> 
> Motivation for doing MCTP in the kernel
> ---------------------------------------
> 
> Problems start to appear when we try to support the LPC MCTP binding
> on the
> BMC, as we need to coordinate between the reserved memory associated
> with the
> LPC2AHB bridge, and the misuse of one of the KCS devices. It's a
> pretty ugly
> interface for what is otherwise a mostly sane messaging protocol, and
> the
> feeling is we can provide a better abstraction between the kernel and
> userspace.
> 
> What I've cooked up with Jeremy's help is the concept of gluing MCTP
> into the
> kernel's network infrastructure by exposing a new protocol/address
> family,
> AF_MCTP, as demonstrated above. This gives userspace what is, IMO, a
> fairly
> pleasant, socket-based programming model. I feel this fits well with
> the intent
> of the MCTP base specification, which defines how to communicate on
> one or more
> intra-platform networks of managed components. We can also leverage
> similar
> concepts from IP networking with regards to bridging and routing of
> MCTP
> packets and messages to plumb packets between different binding
> implementations on the same network.
> 
> By defining the MCTP kernel interface as providing messages and
> packets over
> sockets, we push the implementation of the bindings behind this
> interface into
> the kernel, where we can easily take care of the implementation
> details without
> trying to get a collection of userspace interfaces that collectively
> look like
> a smashed crab past the upstream kernel community.
Ok.

> 
> What it needs
> -------------
> 
> There roughly four areas of work that fall out of the idea:
> 
> 1. Doing the work to expose AF_MCTP from the kernel with support for
> SOCK_RAW
>    (exposing raw MCTP packets) and SOCK_DGRAM (fully assembled MCTP
> messages).
> 2. Exposing an out-of-band management interface to describe MCTP
> networks to
>    the kernel. The plan is to do this via the kernel's netlink
> interface.
Not sure by what you mean by out of band interface here. MCTP is meant
to be used for "inside the box" communication. Can you please
elaborate?


> 3. Implementation of the MCTP bindings
> 4. Development of supporting userspace applications:
>    a. mctp(1), the analogue of ip(1) for MCTP networks, used for
> manual
>       interface, address and routing management
>    b. mctpd(1), a daemon implementing the MCTP control protocol for
> automated
>       management of MCTP networks.
> 
> If anyone's interested in following up we have an issue open[1]
> through which
> you can get involved.
> 
> As we already had some movement on integrating libmctp into OpenBMC
> userspace,
> we'll need to do some conversion of existing applications to take
> advantage of
> the socket interface, so there's some additional work there to make
> it so once
> the socket interface is available. The impact of this problem has
> been
> minimised by a recent change to the integration plan, to provide a
> socket-based
> MCTP demultiplexer daemon[2], but in the end we'll drop this too as
> its role
> will be subsumed by the kernel.
> 
> [1] https://github.com/openbmc/openbmc/issues/3495
> [2] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21089
> 
> Related Work
> ------------
> 
> For anyone interested in the kernel side, the AF_CAN implementation
> is similar
> in scope and complexity to what we're trying to achieve with AF_MCTP.
> At least,
> it has been a fairly handy reference so far, and demonstrates that
> the gist of
> what I'm planning with AF_MCTP is at least acceptible to the upstream
> kernel
> community.
> 
> Current Status
> --------------
> 
> I've got some absolute hacks going that introduce AF_MCTP, a new
> network device
> class and an implementation of a dummy MCTP net device. From there
> I've
> successfully looped back a garbage packet through the socket
> interface under
> QEMU. It's primitive stuff in the early days of the effort, but it
> demonstrates
> that the concept is not too difficult to get off the ground. If
> you're
> interested, let me know and I'll share the patches.
Please share the patches. I will be happy to take them for a spin and
understand what you have in mind a little bit better.

Thanks,
Supreeth
> 
> Cheers,
> 
> Andrew

