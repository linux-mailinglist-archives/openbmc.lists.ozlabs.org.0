Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA70F3EE405
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 03:58:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpZ1p574jz308V
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 11:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=aMO8BNFz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rpDy+Mqy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=aMO8BNFz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rpDy+Mqy; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpZ1J6jG0z2yNW
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 11:57:56 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E52E55C0198;
 Mon, 16 Aug 2021 21:57:52 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 16 Aug 2021 21:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=EKu+Nrdu9HXNoO4kSyCE4FwogxMv9D6
 Hpv4jt+hCIYU=; b=aMO8BNFzXcUXGQlnTHPBo0wm3ZmTfcGsgrZj4lMrIPurt1u
 dk+W1Gh3CgdAfZbTnTCXiW2feo0Ommaeht3vpX6EiT9kflx0auYZrB3DMyIS6JLP
 7K/hqNKAkZ45PMGtH5fcxeksLWgC0gNrjEgW/EXyMn1GIjyRwiLLI/4V+3WqZmvL
 iknFLzpRjpE4f52cULVJ/EChHaPcfN57YxKZptoDpELz4BAk4LS2OBGkv8RcqLnv
 0gQZP4LMI058FyIP2cZu7bmL/dDum9QJlVvjhtqkjzqS8N2HFi2iYOvCzKIyuPgR
 OBT6c0M5q1T04cyfm3M1utMNNYFlPQeG+lTnL2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EKu+Nr
 du9HXNoO4kSyCE4FwogxMv9D6Hpv4jt+hCIYU=; b=rpDy+Mqy/SH4NWmYmvd2Fe
 BGn7x118JWhMO2Psef8VP9+EkDBjRtIJ0hgBw+aV2pZL4YukYz1iHPNhSUAm029e
 mHqLx/8pfpvDTgNYmWGIT0ijzkkZJBFE2rf+jUtBcTFyEgNTXrDKi/nQ4+gfzZI6
 eR+2EsJagmbQcIHdTp0TR69IwtLvhV8lmO/eS6MPxLeIwRIFWg6yF6d2fosXnp2C
 MH4PkPyeT3otMyA42Y0EQy69/6VPLK12leFnrHr4NcyVbKJ6yNSVkKtQD/8wT9gH
 ihE9Vjo4JjR3UePNAk6vwaIMCT6Mcfj9C1WZObIFRuSlxtbW3BPuQ9fU6T0NPgzQ
 ==
X-ME-Sender: <xms:oBcbYa4EtpK4aJE7rqW0qFGWeTUoJffJ7WuSG9H9c-pmw24PZbXGDQ>
 <xme:oBcbYT5uEnxV4i5wrmwa5bQ96JVWbgOExMPh0CK9H8rKhm-RWfOMV7xLCcVZvKi23
 JzN30k-rN_5CWfb9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oBcbYZf8bL_X67o72QbG2a3PCGRNUMneQRZS9wLxOMV2DQTjf0TRxA>
 <xmx:oBcbYXKibn7ZJKV40Ia7LQiBtUDF8JZd8po8yPui1zZajVHtqplGVA>
 <xmx:oBcbYeJaaRTcrE9bQZiGPaf5LUGUdit4rkfmvwYuF92gXnfjQ5bpzA>
 <xmx:oBcbYYx1DtGqukxZ4rNmxtmEwAK19M_DnGBMk9q0koWA6KYenmnp0g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F2860AC0E77; Mon, 16 Aug 2021 21:57:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <aef11e4c-0b18-47a3-8116-36db990b998c@www.fastmail.com>
In-Reply-To: <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
 <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
Date: Tue, 17 Aug 2021 11:27:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_[x86-power-control]:_press_the_power_button_for_a_long_tim?=
 =?UTF-8?Q?e_that_can't_force_turn_off_system_power?=
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

On Mon, 16 Aug 2021, at 20:15, Chris Chen (TPI) wrote:
>  Hi Andrew,
> 
> Thanks for your hint (CONFIG_DEBUG_PINCTRL=y) that let me see where the 
> passthrough setting was disabled.
> ======
> [   11.631044] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin 
> 120 (AB22) for 1e780000.gpio:120 
> [   11.631064] Muxing pin 120 for GPIO
> [   11.631071] Disabling signal PWM8 for PWM8
> [   11.631087] Want SCU41C[0x01000000]=0x1, got 0x0 from 0x000000C0
> [   11.631094] Disabling signal THRUIN0 for THRU0
> [   11.631102] Want SCU4BC[0x01000000]=0x1, got 0x1 from 0x0F000000
> [   11.631118] Want SCU4BC[0x01000000]=0x0, got 0x0 from 0x0E000000
> [   11.631124] Enabling signal GPIOP0 for GPIOP0
> ======
> 
> But something strange is the logs seems from "x86-power-control" 
> package because it would not appear after I commented out partial code 
> as below in the package.
> Could you or others tell me why, please? I mean did I miss any 
> configurations or code changes or anything when using the 
> "x86-power-control" package?
> 
> #if 0 //Added by Chris for testing 
>     // Request POWER_BUTTON GPIO events
>     if (!powerButtonName.empty())
>     {
>         if (!requestGPIOEvents(powerButtonName, powerButtonHandler,
>                                powerButtonLine, powerButtonEvent))
>         {
>             return -1;
>         }
>     }
>     else
>     {
>         phosphor::logging::log<phosphor::logging::level::ERR>(
>             "powerButton name should be configured from json config file");
>         return -1;
>     }
> #endif //Added by Chris for testing

Requesting the pin as GPIO removes the pass-through mux configuration.

If you want the pass-through behaviour when you obtain the pin as a 
GPIO then you need to also do that in software by requesting the GPIOP1 
pin and setting it to the state of the GPIOP0 pin when GPIOP0 changes.

This is a limitation of the kernel, though I'm open to ideas on how to 
avoid it.

Separately, I encourage you to encourage the author of the kernel patch 
that added pass-through support to send their changes upstream.

> 
> Another, last time I forgot to say that I have tried to use "devmem 
> 0x1e6e24BC 32 0x0F000000" to set passthrough back manually and the 
> power button works fine. This is why I think the passthrough was gone 
> after the system booting up.

I think it's possible to sense the input pin state even in the 
pass-through configuration, but at the point where you request the GPIO 
via pinctrl we've lost the intent of the request and the mux 
configuration mustn't assume any particular mode of use. As such it 
disables the pass-through mode and puts GPIOP0 in regular GPIO mode.

> Legal Disclaimer :
> The information contained in this message may be privileged and 
> confidential. 
> It is intended to be read only by the individual or entity to whom it 
> is addressed 
> or by their designee. If the reader of this message is not the intended 
> recipient, 
> you are on notice that any distribution of this message, in any form, 
> is strictly prohibited. If you have received this message in error, 
> please immediately notify the sender and delete or destroy any copy of 
> this message!

On a separate note, please don't include these disclaimers on mail sent 
to the mailing list.

Andrew
