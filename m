Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DD2F709
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 07:10:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dwd25vtYzDqFw
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 15:10:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WFHLtSqa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tpKlEP7s"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dwc153LDzDqSP
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 15:09:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D179220C9;
 Thu, 30 May 2019 01:09:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 30 May 2019 01:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=xVibc6fFmDyDTyQek7k6RkVEzy94nFt
 WbQUA99YUo5s=; b=WFHLtSqaZJfyNg/sdYo4/NprgP27n5SEKYchtTxnqt2ncN3
 YCtirOJGky+8oNg4mI3SVqiO1HhS6ygfQHakZF7eWJCDKC/SEoEi7LCo6FyPi1r5
 02ib6jt2DdCnpEW2LmTj9s+pXopYbpa+4aEqvm7iheHKIneZQWBAVQ5PNW2Tkglh
 Hx9LuaRKGyTS3U/lTpXiVAZCgES2S8OOa65Hz95nBsgwLrPuAZPEpyS77ILiP+Pn
 tLs/7cXtjOIk6qkgYt9Bh/R38dGsRRXawF60URyTpmsUjxJf52t+P/zlzQo7hLVJ
 l0xbucsnIyvP4a1KoNzNQTe1ou8Vvt7RInH6b9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xVibc6
 fFmDyDTyQek7k6RkVEzy94nFtWbQUA99YUo5s=; b=tpKlEP7sMKXJQPv87UtbbD
 1t0JwIfMEzeFinRBrl2/JDpyfj1R74wLgRBVTbC+IJCxzL67wT3KB1BrGBrLgszk
 E6X30V3C9saiI24Ztu31WT7BRFnGR8Llz6fH7pp2gz1pVQr1KWDsKmN4vLYOUciI
 Byo4T3Br8xVuUbI6nfiox8dgO47SsE+8FYH5Fl1/4tUqFYsFxJ6W0uCR0i+TQMOJ
 3UPHesSg03ShDMhKKy9oT1oMhM3efKbxCk6RqOZFS8TZqZ8MaC9SImf7IwLAthg6
 OAyGx6ZovTbZ4K8j76ZQgRhVOVgsyH9ClgYj/40qvtdTtOXCBvakK6cMoLbyZKEQ
 ==
X-ME-Sender: <xms:fGXvXFUMh3zazIjcl9OCu6f7tcUx8DrFk25n2kYK0ysaYdv54nKRHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvkedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:fGXvXJ_XQTfVnqSM2NpNpoKKJi6JHGqHRFAc1tgVB_blu4A8TqXWVA>
 <xmx:fGXvXPTlA4qvr_Nyqytv88xF0vnQbSFEOx6yXhXL15otCaKToq3b6Q>
 <xmx:fGXvXGS3vB9_TY9Cl9EeGVR94PiOEZXGeWTpAgkMYLwNcpPD5Us7mQ>
 <xmx:fWXvXBq16bfXNpgQcF1XYFLDe7hEYHGDcnkJNPe4oY6m0scnwbZNFw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CBB57E00A0; Thu, 30 May 2019 01:09:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <d778f948-d440-492e-a7d0-a3685dee13b4@www.fastmail.com>
In-Reply-To: <AC132CC2BE8ECA4988A9953C168DE3C53ACA875A@MICEXVMS02.mitacad.com>
References: <1559025597-56042-1-git-send-email-ray.lue@mic.com.tw>
 <cbc6dde9-ceb1-4051-a952-0d56767d61d0@www.fastmail.com>
 <AC132CC2BE8ECA4988A9953C168DE3C53ACA875A@MICEXVMS02.mitacad.com>
Date: Thu, 30 May 2019 14:39:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ray Lue" <ray.lue@mic.com.tw>, "Ray Lue" <ray.lue@gmail.com>,
 openbmc@lists.ozlabs.org, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.1_v1_1/1]_ARM:_dts:_aspeed:_Add_s7106_B?=
 =?UTF-8?Q?MC_Machine?=
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

Hi Ray,

On Wed, 29 May 2019, at 19:45, ray.lue@mic.com.tw wrote:
> Hi Andrew, 
> 
> Thank you for reviewing this dts, I will test and update it based on 
> your recommendation. 

Great!

> 
> Regarding the "slave-mqueue"
> 
> > 
> > > +    status = "okay";
> > > +    spsfw1@10 {
> > > +        compatible = "slave-mqueue";
> > 
> > This compatible isn't documented anywhere. Do you have a bindings
> > document for it? We'll need that before we can merge the devicetree.
> 
> it's an Intel developed driver for IPMB, but yet upstream to kernel. 
> 
> https://lore.kernel.org/patchwork/patch/934565/
> https://github.com/Intel-BMC/openbmc/blob/a7715486507e75e4a7cee843a48067b15595defa/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0019-Add-I2C-IPMB-support.patch
> 
> However, it's a necessary driver for OpenBMC ipmbbridge service like below.  
> 
> https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.json
> {
>   "channels": [
>     {
>       "type": "me",
>       "master-path": "/dev/i2c-5",
>       "slave-path": "/sys/bus/i2c/devices/5-1010/slave-mqueue",
>       "bmc-addr": 32,
>       "remote-addr": 44
>     },
>     {
>       "type": "ipmb",
>       "master-path": "/dev/i2c-0",
>       "slave-path": "/sys/bus/i2c/devices/0-1010/slave-mqueue",
>       "bmc-addr": 32,
>       "remote-addr": 88
>     }
>   ]
> }
> 
> The IPMB to ME is a very important channel for Intel based platform to 
> retrieve critical sensors like CPU, DIMM, IO ...etc. What's your 
> recommendation? should I remove it from dts until this driver approved 
> by upstream? 

My recommendation here is to split the patch. In the first patch, add everything
you have here except for the IPMB node. Then in the following patch, add the
IPMB node. This way you can send the first patch upstream while you harass
Intel to upstream the IPMB bindings and driver.

Cheers,

Andrew
