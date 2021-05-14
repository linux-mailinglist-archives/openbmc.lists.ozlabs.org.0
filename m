Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BC3801AB
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 03:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhBXw3qLxz2yX6
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 11:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=VWdzUswQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S+nXEMIH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=VWdzUswQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=S+nXEMIH; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhBXd3cCKz2xb7;
 Fri, 14 May 2021 11:59:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A2D5580FC6;
 Thu, 13 May 2021 21:59:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 13 May 2021 21:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=WmqIQTqnEJWvVrfGX+C2FLyHx7PJc6n
 Zc8QqMEYpaKc=; b=VWdzUswQmSUFWkCmVSY8g2rGY5uWPT8QMRK0Q4IJRi3IQFR
 PiZj/goblkVDb7uC95KdWiRqtIvt+ePhwu+rXJuh29DTQdDal62vclssDyKhqjiT
 e1SrF/qE7Asjc8cHJdlkorGscmO0xJpuXzryNuufNnN6sTX9vIORTlD2LxvhD3RK
 qnuw87fm+5d5T05POisfA3m78URHDrV0Ijw1znQS3aOnyv++OqcHGb6F50utHov6
 Bos5jwqF6PUHeQdw9fMMFJfpk863rS3403Gzcqn0CPn9e+kciIvT79LS4Lr4Zmze
 /mgZYfwoOM2KYQEq8HbAeRXtcSdQeCjJ4/bvmDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WmqIQT
 qnEJWvVrfGX+C2FLyHx7PJc6nZc8QqMEYpaKc=; b=S+nXEMIH7sQwiRHH9ajJU2
 lHbljkxbBQgv0Cr07hKCRpUSssZS7YvdankJzslZIn4ahyWvp0eU+N2vCw/rHNw9
 PS3CPQYlCyCfajw6tSzHdCD8xcZid4lqvhEFzjA8AX68awwXbri/cPKis+SyGydR
 vaWVjlA/Jtmm/YFtJ6UXAUgCMpyczN6RHaQfWCESaxbHyhMh9R4H3hnsV0ZVz+mX
 q90cESyu4ftexbtHQWj3Z3zu5nRg704iCRfij7T4UEBGe/7en9J2XjDRIq7Owg5V
 NAJ5BdNVTiQ5OZmxJ2kvm2pl5smiJ0F2GA2d8E9BEVnUswdqMisOAPLJrSPzrbiA
 ==
X-ME-Sender: <xms:bdmdYGoRzAGXkFuI5E-3JG7OGqfrILIh_Q8m7m0Z39M_mC3JO-UKpg>
 <xme:bdmdYErCNl2z3yT_P2vu51-1SoKugdOQYgY6XCLHuSYVVvDW2Y9awXztcrrPvY-zU
 dQmoKXh_TOpd4QRoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:bdmdYLONdyLo5c0IBglkOiM1X3HYVdoHtEmX1UhywuFygccdWoe0gQ>
 <xmx:bdmdYF6THTYgFKDvT25YS0RwNg0eHAHtMtmM0_abOUCh_h25eXU9Rg>
 <xmx:bdmdYF736TcMnSmPyKydAXQvUV_SDVzFibg4nPc0gW6Yw82gLtzcnA>
 <xmx:b9mdYPtIQTyTtrQwpRYqTjYFWm9a9A-vvVif0bI7JwctFXEBHtWN6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C3F3AA00079; Thu, 13 May 2021 21:59:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <6f530a9e-7d73-4ed8-90d4-29af079c0c2f@www.fastmail.com>
In-Reply-To: <YJ19LMLV1HXk6BMf@hatter.bewilderbeest.net>
References: <20210510014231.647-1-zev@bewilderbeest.net>
 <20210510014231.647-3-zev@bewilderbeest.net>
 <6d4338e2-d9be-411a-aeb7-7d46121b73d4@www.fastmail.com>
 <YJ19LMLV1HXk6BMf@hatter.bewilderbeest.net>
Date: Fri, 14 May 2021 11:28:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>
Subject: =?UTF-8?Q?Re:_[PATCH_2/3]_serial:_8250=5Faspeed=5Fvuart:_initialize_vuar?=
 =?UTF-8?Q?t->port_in_aspeed=5Fvuart=5Fprobe()?=
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
Cc: linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 14 May 2021, at 04:55, Zev Weiss wrote:
> On Wed, May 12, 2021 at 08:34:06PM CDT, Andrew Jeffery wrote:
> >
> >
> >On Mon, 10 May 2021, at 11:12, Zev Weiss wrote:
> >> Previously this had only been initialized if we hit the throttling path
> >> in aspeed_vuart_handle_irq(); moving it to the probe function is a
> >> slight consistency improvement and avoids redundant reinitialization in
> >> the interrupt handler.  It also serves as preparation for converting the
> >> driver's I/O accesses to use port->port.membase instead of its own
> >> vuart->regs.
> >>
> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >> ---
> >>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 5 ++---
> >>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> index 9e8b2e8e32b6..249164dc397b 100644
> >> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> @@ -349,11 +349,9 @@ static int aspeed_vuart_handle_irq(struct
> >> uart_port *port)
> >>  			struct aspeed_vuart *vuart = port->private_data;
> >>  			__aspeed_vuart_set_throttle(up, true);
> >>
> >> -			if (!timer_pending(&vuart->unthrottle_timer)) {
> >> -				vuart->port = up;
> >> +			if (!timer_pending(&vuart->unthrottle_timer))
> >>  				mod_timer(&vuart->unthrottle_timer,
> >>  					  jiffies + unthrottle_timeout);
> >> -			}
> >>
> >>  		} else {
> >>  			count = min(space, 256);
> >> @@ -511,6 +509,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
> >>  		goto err_clk_disable;
> >>
> >>  	vuart->line = rc;
> >> +	vuart->port = serial8250_get_port(vuart->line);
> >
> >The documentation of serial8250_get_port() is somewhat concerning wrt
> >the use:
> >
> >https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/8250/8250_core.c?h=v5.13-rc1#n399
> 
> Hmm, good point -- though despite that comment it looks like there is 
> some existing code using it outside of suspend/resume callbacks (in 
> 8250_pci.c and 8250_pnp.c).  I'm not certain if those would necessarily 
> be considered good precedent to follow for this, but I don't see any 
> obvious better way of getting hold of the corresponding uart_8250_port 
> (or its port.membase).
> 
> I did receive a notification that Greg had added this series to his 
> tty-testing branch; not sure if that means he thinks it's OK or if it 
> just kind of slipped by unnoticed though.

Yeah, I just highlighted it in case anyone else wanted to weigh in.

Essentially I'm just deferring to Greg. If he's picked them up, great!

> 
> >
> >However, given the existing behaviour it shouldn't be problematic?
> >
> 
> "existing behaviour" referring to what here?

Well, we were poking at the registers through vuart->regs anyway.

So I don't think what you've done is any less correct.

Andrew
