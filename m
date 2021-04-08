Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED7357939
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 02:58:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG2v765LCz301x
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 10:58:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=pAHIJEIc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jE7y9Zhe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=pAHIJEIc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jE7y9Zhe; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG2ts16t6z2yxP;
 Thu,  8 Apr 2021 10:58:12 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E52E8580811;
 Wed,  7 Apr 2021 20:58:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 07 Apr 2021 20:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=JPUdlKMQjHPtG1cD72DyTfbFE4O/cJI
 Usrpufhou+vk=; b=pAHIJEIcH7Nr+ehc+Sz8Juhx576O7heog4hPquD1narYRlz
 oE2Pd5vl2RYPp4LMhshkQ/ca6vx4WC54FnRC7G93rMYibebQTX6T70ctYI9EkXHd
 bh5aftI2qvf1LQAQ1qYOR0Vz/ikWJMEklcTe9gl5T1vSXbKECBG8f/q/e0z6DOMA
 +3lIVwgrkLfweOcAaShMZxEc95oMj7ot55UydCRDistFiM618K4H2M/rOcOmAmFm
 xIM1NUbjJ+wHhqs56TwUrvm5R7iagaISvI+X3MOYzPpqQiwa3y7HnH7EvMd5/buH
 jqMWcr6kBHuLdxX+DkTdCfY5epLP1g3KPBEbcEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JPUdlK
 MQjHPtG1cD72DyTfbFE4O/cJIUsrpufhou+vk=; b=jE7y9ZhewMvo/hKQD/7Xg+
 /EJzRhGjpBM6OLpqLsJefcSqYTwokbCW90vOFQbiFOruU1/JGjTTlsEz6go9nHaz
 DKMLsjBi+gUzCHGukZ1CsK9XNWzxkrlrMY2TvyrqINwqWn9vGJWER1DMbP5waf0o
 rcNHGAifLEQ/eECtdrn97hJ6h92RYySd3MtYFMpWMSpW0uM0jTi/tVeAj7kN2s0V
 oJQ4xbG27ISH8QUshCASJEjjWyxfZG6J/RUDpMbgsNsaxJTeAZsW6BzM+6lYxObE
 CeLRnDTJgdXUGL0wSstMguTa90W4akIh+YtGNs4Q2vljuy+qlt5czWdm89gAAAUA
 ==
X-ME-Sender: <xms:H1VuYKSWbh_ppt2SwGYRTdci_zQysYvS-7qOG0rLJKrtuy3FjsiPqQ>
 <xme:H1VuYPyXkxzlp9i8p2RsOC5gdrbuKuPNIakNsfPhd2aKsXtNO2OXn91jqxYhsqKug
 BtVleAeTtC_zHHkww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejkedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:H1VuYH12FGFZNoaScZzJQuoQy7UHEGCXTE3aXDv1GhoKj30HwETQVA>
 <xmx:H1VuYGAtSp6-VHwWbzIWptPh62dQBvpyI3ipV727CR1rc9kp6Wollg>
 <xmx:H1VuYDhWHVs5RVxqO97fhfVOOmaVx9Pj4JFgrjC5-X_mZmSwV1GLaA>
 <xmx:IVVuYCRGg20FAF4k2MLWf4ZyJFHNhFoZLSXMf_UdTOeRrujnU-KMGQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6DDDFA00079; Wed,  7 Apr 2021 20:58:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
In-Reply-To: <20210319061952.145040-1-andrew@aj.id.au>
References: <20210319061952.145040-1-andrew@aj.id.au>
Date: Thu, 08 Apr 2021 10:27:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
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
Cc: devicetree@vger.kernel.org, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,

On Fri, 19 Mar 2021, at 16:49, Andrew Jeffery wrote:
> Hello,
> 
> This series is a bit of a mix of things, but its primary purpose is to
> expose BMC KCS IPMI devices to userspace in a way that enables userspace
> to talk to host firmware using protocols that are not IPMI.
> 
> v1 can be found here:
> 
> https://lore.kernel.org/openbmc/20210219142523.3464540-1-andrew@aj.id.au/
> 
> Changes in v2 include:
> 
> * A rebase onto v5.12-rc2
> * Incorporation of off-list feedback on SerIRQ configuration from
>   Chiawei
> * Further validation on hardware for ASPEED KCS devices 2, 3 and 4
> * Lifting the existing single-open constraint of the IPMI chardev
> * Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
>   binding to dt-schema
> * Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
>   property definition for the ASPEED KCS binding
> 
> A new chardev device is added whose implementation exposes the Input
> Data Register (IDR), Output Data Register (ODR) and Status Register
> (STR) via read() and write(), and implements poll() for event
> monitoring.
> 
> The existing /dev/ipmi-kcs* chardev interface exposes the KCS devices in
> a way which encoded the IPMI protocol in its behaviour. However, as
> LPC[0] KCS devices give us bi-directional interrupts between the host
> and a BMC with both a data and status byte, they are useful for purposes
> beyond IPMI.
> 
> As a concrete example, libmctp[1] implements a vendor-defined MCTP[2]
> binding using a combination of LPC Firmware cycles for bulk data
> transfer and a KCS device via LPC IO cycles for out-of-band protocol
> control messages[3]. This gives a throughput improvement over the
> standard KCS binding[4] while continuing to exploit the ease of setup of
> the LPC bus for early boot firmware on the host processor.
> 
> The series takes a bit of a winding path to achieve its aim:
> 
> 1. It begins with patches 1-5 put together by Chia-Wei, which I've
> rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
> non-KCS LPC-related ASPEED device drivers in a way that enables the
> SerIRQ patches at the end of the series. With Joel's review I'm hoping
> these 5 can go through the aspeed tree, and that the rest can go through
> the IPMI tree.
> 
> 2. Next, patches 6-13 fairly heavily refactor the KCS support in the
> IPMI part of the tree, re-architecting things such that it's possible to
> support multiple chardev implementations sitting on top of the ASPEED
> and Nuvoton device drivers. However, the KCS code didn't really have
> great separation of concerns as it stood, so even if we disregard the
> multiple-chardev support I think the cleanups are worthwhile.
> 
> 3. Patch 14 adds some interrupt management capabilities to the KCS
> device drivers in preparation for patch 16, which introduces the new
> "raw" KCS device interface. I'm not stoked about the device name/path,
> so if people are looking to bikeshed something then feel free to lay
> into that.
> 
> 4. The remaining patches switch the ASPEED KCS devicetree binding to
> dt-schema, add a new interrupt property to describe the SerIRQ behaviour
> of the device and finally clean up Serial IRQ support in the ASPEED KCS
> driver.
> 
> Rob: The dt-binding patches still come before the relevant driver
> changes, I tried to keep the two close together in the series, hence the
> bindings changes not being patches 1 and 2.
> 
> I've exercised the series under qemu with the rainier-bmc machine plus
> additional patches for KCS support[5]. I've also substituted this series in
> place of a hacky out-of-tree driver that we've been using for the
> libmctp stack and successfully booted the host processor under our
> internal full-platform simulation tools for a Rainier system.
> 
> Note that this work touches the Nuvoton driver as well as ASPEED's, but
> I don't have the capability to test those changes or the IPMI chardev
> path. Tested-by tags would be much appreciated if you can exercise one
> or both.
> 
> Please review!

Unfortunately the cover letter got detached from the rest of the series.

Any chance you can take a look at the patches?

https://lore.kernel.org/linux-arm-kernel/20210319062752.145730-1-andrew@aj.id.au/

Cheers,

Andrew
