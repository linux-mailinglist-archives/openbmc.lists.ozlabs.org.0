Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDAB8B0D
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 08:30:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZP3268BvzDqV7
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 16:30:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="avS0Xz5k"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C26Freu/"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZP2Q411bzF3KQ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 16:29:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 647AA21FB5;
 Fri, 20 Sep 2019 02:29:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 02:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=LCsvt+zS7JZiA9dFOAyKd+z12wFQun4
 2Fw+fEvYe588=; b=avS0Xz5kFGlrt4gign+iaHN1+CqDH8sF1ptlm2yqkS8m8uI
 X1jTNjBZcKKFHNkc04DT7XFZ2jPtVh0ZB6ssjcb8itKQohh+SsURacPdmjtkwi45
 Y4sCFKGfFojR4Z8ymXES0VUAOkpjjDxWK7MTxR1o53m1IIlqBYlMYABdvti9Elc7
 ApikWRGs1b+4MyQVL1LVE5i5iy3zJX7D3L2i0N//2wh2GKUXj2uWSvAS+dNMX3Aj
 GQO7x1l8cXyBQ3eS7uvJutfAYyUMuNhqOAZwCD2a6nVyv0M+3DFN/55nxOUqTU+M
 EDPGlzePJpRO96Giv6skjB2teuPBiGHIYA56XfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LCsvt+
 zS7JZiA9dFOAyKd+z12wFQun42Fw+fEvYe588=; b=C26Freu/OTw1Rgn9QGNlfv
 SEyl/Mn8+x056a5zimtqzWUoVwNnt8rTlgYqYTgf9MHamQBtDUAXpomvgrHpqo41
 tOTvj4VkoG8+mpmNbQfabB6sSd7xH6v4nqvI28t3Fvi9bVj/deaJFyF1rSEBb7Es
 eJS1meht/Yu233m0ns1v6ATx9c/pjpOdGDle4paQ3hHUwzX+WmeWE7467magoJus
 O9JvF3iokILoMzW/XQ86j623sjNgqAFgCS5Y1ghPtrb9Qvjz5YtSap4GFxl5AAi6
 biX+bvd063CuVtFsyN7dYq8GHytjockXVSo5p4gGWZ6UQeOxt//Rwu6CdBCYtySw
 ==
X-ME-Sender: <xms:yHGEXcnixgq48gq--7HHQKhV-4lmV9_kiD7CX6RgoA7EGi4uQOxt8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:yHGEXbiTc0ccRj6WkcN-wmMfn4INKPw2yP6pYpVKkduYok7qDt_Xxw>
 <xmx:yHGEXQnoKu9zOc9HZjVGwbdKEK8Aq_zGMAyGNOOIdCQvK1uTEVNXbQ>
 <xmx:yHGEXS2esE-bCvZflqREg6o6PD6AllZoosucuLqERlQ4wveJiKsUSg>
 <xmx:yXGEXfWWRKAGKcwWFnV1LkqlJ60GpRhGLtXjKdIfoK4hxUNvRzHczw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 528F2E00B6; Fri, 20 Sep 2019 02:29:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <e7171298-e99d-4d22-aeeb-b08d530cc9ee@www.fastmail.com>
In-Reply-To: <e56e19b0-6483-a351-cc6e-8bc2ce7e74aa@linux.vnet.ibm.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-7-bradleyb@fuzziesquirrel.com>
 <e56e19b0-6483-a351-cc6e-8bc2ce7e74aa@linux.vnet.ibm.com>
Date: Fri, 20 Sep 2019 16:00:04 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.vnet.ibm.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_linux_dev-5.3_1/4]_dt-bindings:_lpc:_add_aspeed-?=
 =?UTF-8?Q?g6_compatible_strings?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 20 Sep 2019, at 01:55, Eddie James wrote:
> 
> On 9/19/19 10:23 AM, Brad Bishop wrote:
> > Assume The AST2600 SoCs contain the same LPC devices as the AST2500.

Has anyone validated the assumption?

> 
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 
> 
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > ---
> >   .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt   | 3 ++-
> >   Documentation/devicetree/bindings/mfd/aspeed-lpc.txt      | 8 +++++++-

This should be split in two for upstream as the IPMI changes will need to go
via Corey while the MFD changes go through Lee.

Otherwise, it's fine in principle.

Andrew

> >   2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> > index 028268fd99ee..4b43b7829bd9 100644
> > --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> > +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> > @@ -1,6 +1,6 @@
> >   * Aspeed BT (Block Transfer) IPMI interface
> >   
> > -The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
> > +The Aspeed SOCs (AST2400, AST2500 and AST2600) are commonly used as BMCs
> >   (BaseBoard Management Controllers) and the BT interface can be used to
> >   perform in-band IPMI communication with their host.
> >   
> > @@ -9,6 +9,7 @@ Required properties:
> >   - compatible : should be one of
> >   	"aspeed,ast2400-ibt-bmc"
> >   	"aspeed,ast2500-ibt-bmc"
> > +	"aspeed,ast2600-ibt-bmc"
> >   - reg: physical address and size of the registers
> >   
> >   Optional properties:
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > index 86446074e206..e1197bab57bb 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > @@ -46,6 +46,7 @@ Required properties
> >   - compatible:	One of:
> >   		"aspeed,ast2400-lpc", "simple-mfd"
> >   		"aspeed,ast2500-lpc", "simple-mfd"
> > +		"aspeed,ast2600-lpc", "simple-mfd"
> >   
> >   - reg:		contains the physical address and length values of the Aspeed
> >                   LPC memory region.
> > @@ -64,6 +65,7 @@ BMC Node
> >   - compatible:	One of:
> >   		"aspeed,ast2400-lpc-bmc"
> >   		"aspeed,ast2500-lpc-bmc"
> > +		"aspeed,ast2600-lpc-bmc"
> >   
> >   - reg:		contains the physical address and length values of the
> >                   H8S/2168-compatible LPC controller memory region
> > @@ -74,6 +76,7 @@ Host Node
> >   - compatible:   One of:
> >   		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> >   		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> > +		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
> >   
> >   - reg:		contains the address and length values of the host-related
> >                   register space for the Aspeed LPC controller
> > @@ -128,6 +131,7 @@ Required properties:
> >   - compatible:	One of:
> >   		"aspeed,ast2400-lpc-ctrl";
> >   		"aspeed,ast2500-lpc-ctrl";
> > +		"aspeed,ast2600-lpc-ctrl";
> >   
> >   - reg:		contains offset/length values of the host interface controller
> >   		memory regions
> > @@ -168,6 +172,7 @@ Required properties:
> >   - compatible:	One of:
> >   		"aspeed,ast2400-lhc";
> >   		"aspeed,ast2500-lhc";
> > +		"aspeed,ast2600-lhc";
> >   
> >   - reg:		contains offset/length values of the LHC memory regions. In the
> >   		AST2400 and AST2500 there are two regions.
> > @@ -187,7 +192,8 @@ state of the LPC bus. Some systems may chose to modify this configuration.
> >   
> >   Required properties:
> >   
> > - - compatible:		"aspeed,ast2500-lpc-reset" or
> > + - compatible:		"aspeed,ast2600-lpc-reset" or
> > +			"aspeed,ast2500-lpc-reset"
> >   			"aspeed,ast2400-lpc-reset"
> >    - reg:			offset and length of the IP in the LHC memory region
> >    - #reset-controller	indicates the number of reset cells expected
>
