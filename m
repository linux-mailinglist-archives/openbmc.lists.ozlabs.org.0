Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9371388C9
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 00:37:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47wtRJ5DqszDqM5
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 10:37:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=cRxw/FBr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XM3aTD2t; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47wtQN2SSNzDqLf
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 10:36:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9FFFF22015;
 Sun, 12 Jan 2020 18:36:07 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 12 Jan 2020 18:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=TqWOZTRsbQ9uWY2q8k9fdhsg4RTG4Zy
 99YSoKP91yLA=; b=cRxw/FBrlHAmO9TA/gX8sMWXdd4ayZDLvvQfDYzrpCiNQcQ
 LlfmhwOsxTJmB1T792vGBZD6W1bXgGV1g9rULloArNnuQSRxdKNxZHIo5JYhdAcQ
 8XSFeWcJTbEq8tcx8+25jsAdcanlRwWiDNnlEockMxbtTMV+kYNUr0U4PwQb5YqH
 rXXDU07eeozN9wHP9RMalEx72F3wZ08WzXu2uTlhJvxSsEdHRvTxmP5NPcNaTVHF
 sfSQbn9xw7xdO22iqvzW4c6mQwHF6teFOjBV3yUSo1OXUB9OfGl9du86r5qAHYp6
 n3bQoVd170k1B543GyYV+7wQ56CfCm/ZbInf1gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TqWOZT
 RsbQ9uWY2q8k9fdhsg4RTG4Zy99YSoKP91yLA=; b=XM3aTD2t+e/q1VhRY6dFnc
 TpZPBVzzT5Moez4Z7EHx5BbqEQMvvInmtY+bFPeCUQ7dbsodLoOSVlU4ayWRAZwH
 DwgRH4ag5z3aTRIXtgIaLAYPMQcUSqmOxVCgJqctR2wACtTf3sKsOx6Phd5oYxig
 XKFACArZF2+HCga4NuOpPO7cpuLBdgrd39qX2cX7u1MM9oLMUEzvaUfh/grAfJnJ
 QJTLnPaMeykKf1gItFaK3TL9im/CYP9xzalIWLBqeHk4fOweNyLc457g6OpqPuW+
 u/5xYspcaaLzsYRMihVqigU7Cb6DhktmxJlyYgaUqdZWDfRO0Tzw3iiV++fJEPBw
 ==
X-ME-Sender: <xms:Zq0bXnL7BFFekjI0rS_YiP92T8QM-G_QRcCaC_b7TKSMdd1sHnLPDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Zq0bXrsSsF1uFDk3x0nuOIS3EKrlSva1Au08F_eyT1bKOchSCXWurw>
 <xmx:Zq0bXg4KDddnYf01LUXM3_GuPd_wYb1BujGI1Up2jqtsUtciFxQCOA>
 <xmx:Zq0bXqHwtoz_1Ar53IDBka6YuXDOzKEIZ9Khr9R7-4qmbGAthjoIrA>
 <xmx:Z60bXsWUBzxc3X7_lY_xHhjcZ-2epadDa1Aqh0iyeISD8keqXguADQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 83279E00A2; Sun, 12 Jan 2020 18:36:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <b33a4247-e76d-46bb-9853-cf246f55d6bf@www.fastmail.com>
In-Reply-To: <27265.1578670688@localhost>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <29717.1578627606@localhost>
 <a21918d0-d5ba-4959-82b9-3193748fcf72@www.fastmail.com>
 <27265.1578670688@localhost>
Date: Mon, 13 Jan 2020 10:08:09 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Michael Richardson" <mcr@sandelman.ca>
Subject: Re: MCTP over PCI on AST2500
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
Cc: Sharad Khetan <sharad.khetan@intel.com>, rgrs <rgrs@protonmail.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 11 Jan 2020, at 02:08, Michael Richardson wrote:
> 
> Andrew Jeffery <andrew@aj.id.au> wrote: 
>     > 
> https://github.com/openbmc/meta-phosphor/blob/master/aspeed-layer/recipes-bsp/u-boot/files/0001-aspeed-Disable-unnecessary-features.patch
> 
>     > The distro feature is opt-in as it has impacts beyond simply 
> disabling the backdoors
>     > (there are some unfortunate side-effects to enforcing 
> confidentiality of the BMC's
>     > address space.
> 
> okay, so the bridge gets turned off, and it has some other effects.
> What are the side effects?  I'm guessing by the inclusion of the VGA defines
> in that board init that they are video related.

We have a slightly more detailed description here:

https://github.com/openbmc/openbmc/issues/3475

With respect to PCIe, disabling the P2A causes the host kernel to fail probing
the  AST DRM driver on kernels before 4.12 (from memory). This impacts
POWER more than other host architectures due to invalid accesses triggering
EEH.

With respect to LPC, the issue is largely that the bit in the LPC controller to
disable the iLPC2AHB bridge only disables write access, the host can still
continue to issues arbitrary reads of the BMC address space. To prevent
arbitrary reads the BMC must disable the entire SuperIO controller, which
knocks out the ability to configure UARTs, GPIOs, and the LPC mailbox
among other functionality. On some platforms disabling SuperIO is feasible
(POWER based), but others may require some of this functionality be
present.

> 
> I can see that doing this in uboot is the earliest possible;

It's actually possible to disable the backdoors before the first instruction is
run on the ARM core with the firmware strapping feature, but it's likely the
result becomes platform-specific and integrating the configuration
into the flash image can be a bit fiddly (you could implement it with  a
custom u-boot linker script).

> but in most
> cases the main CPU has no power until the BMC boots, so it can't attack until
> the BMC is running.  Are there some situations in which the BMC (or the P2A
> bridge) could get reset without the host CPU also being reset?

See the discussion of the watchdog reset modes in the link above.

Cheers,

Andrew
