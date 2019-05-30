Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866692F83C
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 10:05:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F0WM5qRlzDqGC
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 18:05:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pK8Oed7W"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="L/0YwqG4"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45F0Tm006RzDqVf
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 18:04:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 86F6221F69;
 Thu, 30 May 2019 04:04:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 30 May 2019 04:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm2; bh=6BVOMOq1kOnfpSrLKYKQr7YVT8v64XHzBSMu7Mbc5Hg=; b=pK8Oed7W
 0/qLU9CONBR709//Z2E6gktEqLBWNJNRnuobVRBaXPsXqNSrLKGaxXFBWN++Xt7T
 g6a5lMmrsXgZqZQ36s86cBaXICLbCZRnEO1y37dRg8kRBoMU3TZvC+vSxvCZeBwL
 LsI4NUUTRUqFOmvKAU4DubJ3HbaGveIAXTnsmZExt2IK1chfgHdrpfGdhUjMgtZr
 dnv5eNqZON/En+21NSRTNFxaE+6gy6aPdMBygXSu8KGJIyDcMXR7d8bht+k6Dm8n
 aiEaXKpcSdpquYjN8ajfprVEBK/bvp6wZYriRcDWXkPneD3H70jWTRFvXUqGWNDs
 z6tpwYh+kroSFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=6BVOMOq1kOnfpSrLKYKQr7YVT8v64
 XHzBSMu7Mbc5Hg=; b=L/0YwqG4RI36V8w9k6ivTCq6cbSNxdVIvI++RPk0mFK57
 LCA5j/8w4cu9yI8A6tEh1ub7Ap/qXJwsm/QyrD7AD+3nhzaqGv3vcV2nOtVAHUi1
 si75g6ybb3S/+Ch/yJO3wesvkQ54678nL+kOCS0qpKtXhAJF7aiUZwSbiicd7vKK
 JwNA7NaKms4UfKRJAn+SsoWfyN+ZCYXzInHiayQF5400ZVa2y0/Lf1mEAf2tneBf
 ujWIu1xhZNTTsr5aip54Fiy8o8oLUJd0X57dl1ReocHeVDgB9tbFncbWPd0R4fmi
 ZAoJ3NqwrGRCG+kuSy28fSrxOhg9eeZJtK3i9hwbA==
X-ME-Sender: <xms:d47vXEZkjgunKNOUetW46zaVH5ocUuWVj1GJKNYaASwi8UGB6CTz8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvkedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvfedmnecujfgurhepofgfggfkfffhvffutgesthdtredtreer
 jeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiii
 pdhgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:d47vXIMFU1W36DOBDPCRax5pK3wFxqLFR-PO8fQ6eM2EpMGLSbbBJQ>
 <xmx:d47vXF7F5ZuWfvHDXrWJWKIeZeuNAZEtsjtBA_g2YZjNWhksX4aoGg>
 <xmx:d47vXIOyQhHngXCzErcZi7m9b-79zzoCoF5gSTHQz8wD_m9SfWKMiQ>
 <xmx:eI7vXPB959VBZj7N4eoESNw0hCblqogCW3G7ZA20NVrYb64mMy-IFQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8E6ADE00A1; Thu, 30 May 2019 04:04:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <18303a54-a3b0-4645-bdad-85a0c6ce4487@www.fastmail.com>
Date: Thu, 30 May 2019 17:34:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?An_in-kernel_implementation_of_MCTP_for_a_socket-based_interfa?=
 =?UTF-8?Q?ce_to_MCTP_networks?=
Content-Type: text/plain
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
Cc: supreeth.venkatesh@arm.com, Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

I'm working on exposing MCTP packets and messages from the kernel via sockets
and a new protocol/address family, AF_MCTP. The purpose of the email is to
outline what interactions will look like in userspace and some of the
justifications for why this is a useful thing to do.

If this piques your interest or provokes you in some way, please reply with
feedback!

Proposed Userspace Interface
----------------------------

To send and receive MCTP messages, a rough sketch in C looks like (not even
compiled, let alone tested):

```
	struct sockaddr_mctp ep = { .network = <UUID>, .eid = <EID> };
	uint8_t req[...] = { <Message Body> };
	ssize_t sent, recvd;
	uint8_t resp[...];
	int sock;

	/* Send full MCTP messages with SOCK_DGRAM */
	sock = socket(AF_MCTP, SOCK_DGRAM, 0);
	assert(s >= 0);

	sent = sendto(sock, req, sizeof(req), 0, &ep, sizeof(ep));
	assert(sent == sizeof(msg));

	recvd = recvfrom(sock, resp, sizeof(resp), 0, &ep, sizeof(ep));
	assert(recvd == sizeof(resp));

	/* Process response message body */
	...

	close(sock);
```

Background
----------

A number of us in the community have been looking at enabling MCTP support in
OpenBMC. Currently we have Jeremy's libmctp implementation, which is intended
to be a minimal but capable, portable implementation of the MCTP base
specification and relevant bindings. Part of libmctp's mission is to be useful
to both BMC and host firmware, and on the BMC, this means being leveraged by
userspace applications.

The DMTF PCMI WG have defined various bindings for MCTP, including PCIe VDM,
KCS, serial and SMBus/I2C.

Putting my OpenPOWER hat on, we were looking at what bindings we could make use
of in our platform designs. We make heavy use of the LPC bus during early boot,
and so solutions needed to be useful across that interface. This requirement
eliminates PCIe VDM (as do constraints in our PHBs). There's also no path for
SMBus/I2C, leaving KCS and serial. KCS as it stands is pretty much MCTP wrapped
in IPMI across a slow interface, and serial's no speed demon either.
Additionally, we can only use the VUART, and there's only one in the
AST2400/AST2500, so if we were to use it we'd have to multiplex the console
with MCTP messages. This is all fairly ugly.

What Jeremy has proposed is a yet-to-be-standardised LPC MCTP binding that
makes use of both a portion of the LPC FW space and a KCS device in the LPC IO
space. This is made possible on ASPEED hardware by pointing the LPC2AHB bridge
at a region of RAM, and defining an ABI for Rx and Tx buffers within that
memory region. The KCS interface is then lightly used as an out-of-band
mechanism for arbitration of buffer ownership. This gets us an efficient
LPC-based interface for MCTP on our platforms that is compatible with existing
hardware.

Motivation for doing MCTP in the kernel
---------------------------------------

Problems start to appear when we try to support the LPC MCTP binding on the
BMC, as we need to coordinate between the reserved memory associated with the
LPC2AHB bridge, and the misuse of one of the KCS devices. It's a pretty ugly
interface for what is otherwise a mostly sane messaging protocol, and the
feeling is we can provide a better abstraction between the kernel and
userspace.

What I've cooked up with Jeremy's help is the concept of gluing MCTP into the
kernel's network infrastructure by exposing a new protocol/address family,
AF_MCTP, as demonstrated above. This gives userspace what is, IMO, a fairly
pleasant, socket-based programming model. I feel this fits well with the intent
of the MCTP base specification, which defines how to communicate on one or more
intra-platform networks of managed components. We can also leverage similar
concepts from IP networking with regards to bridging and routing of MCTP
packets and messages to plumb packets between different binding
implementations on the same network.

By defining the MCTP kernel interface as providing messages and packets over
sockets, we push the implementation of the bindings behind this interface into
the kernel, where we can easily take care of the implementation details without
trying to get a collection of userspace interfaces that collectively look like
a smashed crab past the upstream kernel community.

What it needs
-------------

There roughly four areas of work that fall out of the idea:

1. Doing the work to expose AF_MCTP from the kernel with support for SOCK_RAW
   (exposing raw MCTP packets) and SOCK_DGRAM (fully assembled MCTP messages).
2. Exposing an out-of-band management interface to describe MCTP networks to
   the kernel. The plan is to do this via the kernel's netlink interface.
3. Implementation of the MCTP bindings
4. Development of supporting userspace applications:
   a. mctp(1), the analogue of ip(1) for MCTP networks, used for manual
      interface, address and routing management
   b. mctpd(1), a daemon implementing the MCTP control protocol for automated
      management of MCTP networks.

If anyone's interested in following up we have an issue open[1] through which
you can get involved.

As we already had some movement on integrating libmctp into OpenBMC userspace,
we'll need to do some conversion of existing applications to take advantage of
the socket interface, so there's some additional work there to make it so once
the socket interface is available. The impact of this problem has been
minimised by a recent change to the integration plan, to provide a socket-based
MCTP demultiplexer daemon[2], but in the end we'll drop this too as its role
will be subsumed by the kernel.

[1] https://github.com/openbmc/openbmc/issues/3495
[2] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21089

Related Work
------------

For anyone interested in the kernel side, the AF_CAN implementation is similar
in scope and complexity to what we're trying to achieve with AF_MCTP. At least,
it has been a fairly handy reference so far, and demonstrates that the gist of
what I'm planning with AF_MCTP is at least acceptible to the upstream kernel
community.

Current Status
--------------

I've got some absolute hacks going that introduce AF_MCTP, a new network device
class and an implementation of a dummy MCTP net device. From there I've
successfully looped back a garbage packet through the socket interface under
QEMU. It's primitive stuff in the early days of the effort, but it demonstrates
that the concept is not too difficult to get off the ground. If you're
interested, let me know and I'll share the patches.

Cheers,

Andrew
