Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C408D3ECEA7
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 08:31:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp47M42msz30J5
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 16:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=UYV6BcWi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AAjXgMlZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=UYV6BcWi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=AAjXgMlZ; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp46p39Q8z2yRS
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 16:30:58 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8A2463200912;
 Mon, 16 Aug 2021 02:30:54 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 16 Aug 2021 02:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=3qQbATUS/uOKtNomSkCWrwoBeg1Dtb1
 srSX36P6Jc2I=; b=UYV6BcWiX5tjyJTWgZVpSF2CJrFGlZsrADI0eWksEaQHe+j
 HzV8syFnYhsJ0Pg33b07XbBC8ebKe1chPL9Kgq/4UNV30SLOszRR9OE1Ca/si/Jm
 QPTuYsNGEUPbek9RhYm+2otXq9lqrP3Qwx7/4BdIVhEwwc1LN5rLZ6yLOrKT19WU
 ZFb/D7RSnz39Fo3x9VQm0kkA8qu0UV2PVWNTgn74CcsI3SlDcZOXCFTA36CSQt/f
 SVTRrpigH4oR+akKG28I/BhkaX68GW9z0BxgQcrsgFL4CNQw2pxMDly+KZWVKQMn
 oJKZjyDzYsTKMyrxpra8l/pY5jfA+s/3auKKEDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3qQbAT
 US/uOKtNomSkCWrwoBeg1Dtb1srSX36P6Jc2I=; b=AAjXgMlZFcbS4L8ReX8n7f
 TcHoJIU7DWEe0ANb/KtwIae5uWTEFCjvhCZCOGmalWyrm/pL9wLKM/GYIUkB/rkM
 f6C5aUy0OzhXXekkiQ5NanViY3uOHi+Y+/0Jg1yjeQTZu7c6vCARoi4TN9zzOaE4
 UN2CPXhB9wjFLtz0mS7mwpsGaWdZD7PrPYidIHNIHoJFZFu75izwJcvrL9Szc+7Y
 sya0tzWLTepoZ0X6f+7zEq6oMUp478f//peCyhBtjEvN05v2riFFS3XIjY/fW4wL
 Gjw6+TLISvuus6PxDU9DQTizYkQJ3hTBk0/IWMtS2dE4gjyMzoVR92ITAP6aclmw
 ==
X-ME-Sender: <xms:HAYaYVFNEtM6DppnYl3Xw5u4ft_xit8tp1dvl2Jsimz5N8cHqolr6g>
 <xme:HAYaYaXN4xygt31Me2a-qApvHQ5zXfq4RsSkHsXiZOAAmFh4QEKZi8ry_etidlymx
 vup_GNEb7eQFR5vYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledtgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:HAYaYXIlPZkVpedA62sIX0NG_rALfZaap-HdskD6nAul_4F0WYtHyg>
 <xmx:HAYaYbHJqNRQO8dOeP6oIksirIdiTeMMXlth8yYcPpNY3occFuttwg>
 <xmx:HAYaYbWqgtp71oYHBcZ_VhrPJ8gChUHMLDJF3wGm9DPcIElbkF8JJA>
 <xmx:HgYaYce-6hr_WPgkvjd9eGAD61tA7uJfrZ10d3i7whb6_D7ZZZfz7w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6033DAC0DD1; Mon, 16 Aug 2021 02:30:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1110-g95fe1040dc-fm-ubox-20210814.001-g95fe1040
Mime-Version: 1.0
Message-Id: <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
In-Reply-To: <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
Date: Mon, 16 Aug 2021 16:00:32 +0930
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

Hi Chris,

On Mon, 16 Aug 2021, at 13:22, Chris Chen (TPI) wrote:
> Hi Jason and others,
> 
> I think I figured out the problem is the GPIOP0 and GPIOP1 passthrough 
> was not set after system booting up. However, as I mentioned when 
> rising the question, I have already set GPIOP0 and P1 passthrough in 
> u-boot, it for now looks like was been turned off during Kernel or 
> OpenBMC application running up. Can you please give me a clue why the 
> GPIO passthrough would be turned off or where should I need to add 
> passthrough setting again?
> 

If the kernel is disabling it you might be able to find the cause with 
CONFIG_DEBUG_PINCTRL=y and the pinctrl attributes in debugfs. Having 
said that, the upstream kernel hasn't been taught about SCU510[28] on 
the 2600, so if it is touching it then it's doing so via out-of-tree 
patches.

Andrew
