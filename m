Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290922BC18
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:41:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYNn2nWyzDrhl
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:41:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=RSyNu4L7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Kr6msf0L; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCYMH62jPzDqkR
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:39:54 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3DFB6B66;
 Thu, 23 Jul 2020 22:39:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 23 Jul 2020 22:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=10yd5wp6e3Io0Wuj2eAnbrWiNifKM4G
 A7+ibzjbj/Jk=; b=RSyNu4L7X4paw9968kJhhj0TNHn6dgIoH0f6bRO709ybtSA
 mGjGqR8UZS7Z90vqQau4CH1QKGagqy+KRP7j8+6UdSJ0FDELR+PSj3UxAVQ399KX
 mQsXHWwwd21vNlJMEIlx/TUd5jmC3o1CeLgPJWqWi5QwyYC49Ok0yT4w86wsQls1
 /2Eign0nB2H5AF2sWU6w3tlEmG/cNw9KWK1y39MHQFiVYP2vfJEj7pFTYpoOaEh8
 6fKeGLByr+BaUzMqWKoSn4ufktaE3STR9GRpTXJ9Nq5yvt/KmYI+kn9BCOWjRnYo
 lXHUg9QBZPdPxEkk+9yGM5R3blXj16VrqYMoOLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=10yd5w
 p6e3Io0Wuj2eAnbrWiNifKM4GA7+ibzjbj/Jk=; b=Kr6msf0Ly43JiFEN3Do6SM
 Ao61mJQKLBUAX5b+wqz6KskwkFBHDGzIHVmxo8ei2kiF8jjPVYMcWKN3e7qVgfxz
 dFeSerxP5Uehrqs/XShHKBqpGGRrLS5kJFaXe1uewWYHxkhjzkr0M2FGQQG+b0J8
 ZR/+hBAQfi53XgISWuLq+0e8nxAKoJ0vQpdO+pzE7MZ/vsBq83ybJs+8nGRHqCnW
 5P1ELd4cSWDb4dHrubSmFRnimF0BkWy46RCY3+O/yAUJ9BEv8EK/rOl7luE/SvoW
 wWk6M1ZGYQ62uU25baqdRG0GEyZd2dfXwLcklh2VqSg5GnPjc/Sl+VlhBmTFysyA
 ==
X-ME-Sender: <xms:9UkaX_jEqv88OJ3-0dRjHkIgu9PH6wMngUxzCBfrxa4sP88nNPWXsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrhedvgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:9UkaX8DJQjWaK3eStVtcGp2_te4bemo_zdcz0_4E14YhpDtaFjutnA>
 <xmx:9UkaX_G-EiNlNi75C1VymYcG7tBwwIemHZ8RYQyAVTM_PS_PCIiqhA>
 <xmx:9UkaX8Q-lw_KyP787pnF40SvsWEuzr4cK6sZlp_8TL3qegsZOzhoiA>
 <xmx:9UkaX7_WgRHZ-0t6yawzwz_VzLLC01nyesXGGMls03BgT8BdwikXog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1315BE00C9; Thu, 23 Jul 2020 22:39:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-92-g11c785d-fm-20200721.004-g11c785d5
Mime-Version: 1.0
Message-Id: <30f01c25-bf9e-4d54-ba01-544103819333@www.fastmail.com>
In-Reply-To: <20200724023036.354310-2-joel@jms.id.au>
References: <20200724023036.354310-1-joel@jms.id.au>
 <20200724023036.354310-2-joel@jms.id.au>
Date: Fri, 24 Jul 2020 12:09:28 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.4 1/3] fsi: aspeed: Support CFAM reset GPIO
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 24 Jul 2020, at 12:00, Joel Stanley wrote:
> Systems have a line for restting the remote CFAM. This is not part of
> the FSI master, but is associated with it, so it makes sense to include
> it in the master driver.
> 
> This exposes a sysfs interface to reset the cfam, abstracting away the
> direction and polarity of the GPIO, as well as the timing of the reset
> pulse. Userspace will be blocked until the reset pulse is finished.
> 
> The reset is hard coded to be in the range of (900, 1000) us. It was
> observed with a scope to regularly be just over 1ms.
> 
> If the device tree property is not preset the driver will silently
> continue.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
