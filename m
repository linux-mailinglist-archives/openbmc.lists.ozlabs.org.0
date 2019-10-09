Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDFD1C22
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 00:46:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pTqK04DfzDqYj
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 09:46:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="omZQsiim"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SlaloSVV"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pTpH5fpyzDqW8
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 09:45:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AD85922136;
 Wed,  9 Oct 2019 18:45:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 09 Oct 2019 18:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=BfLbljg8Ml0iwdTyvuOjdBCRfVPwKFZ
 gbVyN513g31c=; b=omZQsiim+e2TgOLeIh5zUUFp11wr0Gn1wY4vfxKVmAdxVqX
 4Ap+e80kXEVH1j0BVBe66ifw/Df5BIS/YqsWv/RIxIwoi5cpXEsekohGaGsfLg7o
 fJ4FBlfSBBUDnWFQddB898064AZjC/u2MUdUapyE/xxBqREMs5uTWN5UQ80PReJg
 WA+hxiw75fIZy6+XBX/boWYG6Y6wk7KUyQtuHscAQAAUUYSLUwbhUA76Y0JpaTkj
 itS+oNuqYXjTqGtxno0/dA0L813bBaJG+XBFTM7L4GqbASODPyBLUBKLXzHOJRDN
 CsnK4amkcnBAs+NcbI9vXpmRRUkte1rKZWvfWlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BfLblj
 g8Ml0iwdTyvuOjdBCRfVPwKFZgbVyN513g31c=; b=SlaloSVVkk/S/1uMXuT+Fl
 a3DVNa1ihP0LD2jly++J9a2A687tsTQm9WaFygsB5g5YIXgda5vlsyYXgfYdm8g0
 W0tA0If4Yfsg8h2LxiNKnXgDv2AURiUcLc4vNFPMM4Y9z0FS5m/4mwWBQS98rcz4
 mCcCjKJVko2JSoyqEN+H+7LJ0a4at1KnPujwI0rfjOzd5ZngYyy2Zcitc9uD3MHI
 aMm61YrENPTdLmRBaqs6f9+nyxIVjWzcJo+9F3Z1suC0Co3WFJreD0p0rk+eqFV3
 3IZ1JW6L1CmzCn59MCK/rh1vpZ0y+YpRE1obkdPCZLaCWbqt5B9BNgEcd/S3xkQA
 ==
X-ME-Sender: <xms:ImOeXeRC29yld7KIBz5RsApDM4PAVZivFBVRWWZgUUBZzFOJVMO7vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ImOeXUPpQq9in6cCWB-4AshvqSFoaytPop1WBBQ1uqiUZZsLGrpTrQ>
 <xmx:ImOeXSvGpbs9SJMejIqsUseC4Zg6PVmgecDlWrD79mbywF15YRKdUw>
 <xmx:ImOeXQRyVyaBc07J8n2NKVilKpN2GZeI2-PyjRTPFSyOXoKLnTn14g>
 <xmx:ImOeXbNFP2BMKRofsgMlRsmdvaZk9ncMprAg5n6P0rHCz9QRf9_pIw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1ACE3E00A5; Wed,  9 Oct 2019 18:45:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <06d793dc-a0f0-4917-a0c7-135767f6c19b@www.fastmail.com>
In-Reply-To: <81DE4370-D135-48EE-A8FC-B079C4CE3648@fb.com>
References: <81DE4370-D135-48EE-A8FC-B079C4CE3648@fb.com>
Date: Thu, 10 Oct 2019 09:16:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: speed-bmc-misc driver
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

On Thu, 10 Oct 2019, at 04:17, Vijay Khemka wrote:
>  
> Hi Andrew,
> 
> I saw this driver in LF aspeed Linux 

What do you mean by "LF aspeed Linux"? The only place this driver lives is
in the OpenBMC kernel tree (openbmc/linux on github).

> and was wondering how to use. Can 
> you please suggest some usage example like device tree entry as well as 
> sysfs interface.

Honestly, I wouldn't recommend using (yet). It can't be upstreamed in its
current form (I've tried), and so using it as is comes with userspace-breaking
changes in the future. I reserve the right to break your machines if you do
make use of it when I get the time to rework the patches.

Having said that, its purpose is to expose arbitrary fields in arbitrary registers
on the BMC to userspace via sysfs. This is useful when the field's value is
entirely determined by userspace policy and there's no need for additional
kernel infrastructure around the configuration.

Originally this was intended to expose to userspace the bits that control the
state of the ASPEED hardware backdoors, but we changed tack on the
solution to CVE-2019-6260 before the bmc-misc idea got very far.

However you can find some slightly abusive uses if you search the dtsis:

https://github.com/openbmc/linux/blob/dev-5.3/arch/arm/boot/dts/aspeed-g5.dtsi#L1682

In that instance we're exposing the SuperIO scratch registers to userspace
using this mechanism. The attributes can be found in sysfs associated with
the devicetree node. I did have a hack to add a sysfs class for them, but that
was even more controversial than the general concept of the "driver" so
you're going to have to cope with changes to the devicetree potentially
breaking userspace unless you're willing to rework the patches yourself.

Hope that helps.

Andrew
