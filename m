Return-Path: <openbmc+bounces-976-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E93DDCAC963
	for <lists+openbmc@lfdr.de>; Mon, 08 Dec 2025 10:06:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPx100yjQz2yGD;
	Mon, 08 Dec 2025 20:06:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765184772;
	cv=none; b=Osb/hDGzNCo07DrziGXOeQlrswRU/Z6Hia6bx79qkHwwj3wKnU6LaOpDSk1p9pViBB0ydfBI8M2Bt7MnkF7Jon69RomVMZFnYa24UnxrmqT/knMp1P4WizMuYUaEIg3jiNlkWhpQEkyquuoQQy+uJpsZl2YXTLjI3aM/zFBoqJr5ZtNsP+fGGPFgDhTnAVXoaCpCvljECRu5ISL/SJZNOjBlaoyWGTH034hONk79u+Zm1r6orwCRO42DcFSPvaugbwRIoMmCcBV9voDqTTsoyuQ3GigMYh1PQD5fpMxwoaei2dh9wxqHykgMwY9PLArIfCx7Qosc7vHCsvNW+qMZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765184772; c=relaxed/relaxed;
	bh=rI4kmm8q4SBgeZUfyMe9K0dGX4rw95g6gNmAZHmnGI4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Oz5vC5hz1tabrRGcSr6F23ImtCx9lCOWlqo5K34P6SyKWZlCInLjb430mzHKW3+yJF6/IQ30CxC8MZHmdg0E7GcIDaXeVNbyEAyY+D66tPt/LxDs824ctZ3s1DdOrX/fKPOeauhR9DHmFeWrFOI3NK4mGuqJRJrREp1vDkQ0xQxt0CUpNU3ceLM5tNLPIhnaJl1pl0T4CTd4U04kcJMMOZU1lq5P5Zlk7qnA7n1K2usSDl81wljN/eBYDOvNQnYNksyFNZcHQ/bhoMS8hpftxfEoQsY6sAAWP39eevZMy2J8ztcW59tpgae0nTHbu/CPK1fwJ2WxCRhrPeAHC6Csqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=KEQx/DoF; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eSeqyEsj; dkim-atps=neutral; spf=pass (client-ip=202.12.124.138; helo=flow-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=KEQx/DoF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eSeqyEsj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.138; helo=flow-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 602 seconds by postgrey-1.37 at boromir; Mon, 08 Dec 2025 20:06:08 AEDT
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPx0w2D5jz2yFq
	for <openbmc@lists.ozlabs.org>; Mon, 08 Dec 2025 20:06:08 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 0B6321300A3E;
	Mon,  8 Dec 2025 03:56:01 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 08 Dec 2025 03:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765184160;
	 x=1765191360; bh=rI4kmm8q4SBgeZUfyMe9K0dGX4rw95g6gNmAZHmnGI4=; b=
	KEQx/DoFTWe87vjgaF/lltZ4ROhdyVzifWOmm0ric0cJB5GIwIlXMBPdzfFUSjmu
	jc8YJftIpHI0P6Hr/mFAa7Hg0gne2WsNbxeDvrib6J4TNASjXySZhHqZg6aW1sfs
	OcTjac9718xt+KlzbSF/x7Yc9DD6c7iuDogGUJbnrxtnsPxKfEbVYIe4bsPD1GQh
	xU7hrvJclwTD95ij8Z0L5AweK2etlv2je4ICAc96VfsG5WQ5G831y//6BAb/4kDv
	jANl68EQ7NWvE4dgjg2Jgzh/W/muSag5AEZRtBprPYq0bBJ5Yw0DNKKikbfnd1I2
	A3K/NjEFytYRCq7veJpJ0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765184160; x=
	1765191360; bh=rI4kmm8q4SBgeZUfyMe9K0dGX4rw95g6gNmAZHmnGI4=; b=e
	SeqyEsjjH4KIDKVWZWQnPpkIj8V27aOGXCIUv3KqWLbPoVXVTB8CpxBHqQClHYsa
	kpDnrfmZ/Do4gHJ70tOwX4QJqMfbE5dFqjHzFX5vl7lRcUGD3fa2+Oson6+bqWdA
	KfzoD9RacrpnvX/Z6F2rgdN+g7HK2CzrdqwucakBqpI2TmtpwG4Ncr7GJEPKMweI
	8a1TxyyhWdGACgEMZG9PPKVuuNc16ylnzjv4VzhinhfMUrJT8vnXgJdM1VPNWLd9
	hIQHjQRFhZw/c3sbeLXLthF/QQ96cHNotcBAahBH0Mn51vxw6uB4yelZg3ZjMdcw
	lfPxGjJz0KwUhMjvMR/Ow==
X-ME-Sender: <xms:n5I2af3AOJhJM8AZu7vJj2vLP6N-g43FMHtVswkk4IQEA4JJTbnQfg>
    <xme:n5I2aY5NWPgdu6u-31Ph43b_F-Lsq264_Q7FV33-fn75S6mkFJ7D7W_wnOqIVfBmU
    DiIF2zko78sdD9QREmze-J_kJdp85MvKLQYBC5HqPr-YjYj4he15g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeejkeetleelgeeukeekhefhtedtkeduuefhffehueejgeeihfeulefhgeejhfegleen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvhedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsegtrhgrphhouhhilhhlohhurdhn
    vghtpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomh
    dprhgtphhtthhopehhvhgrihgshhgrvhdrlhhinhhugiesghhmrghilhdrtghomhdprhgt
    phhtthhopehjtghmvhgskhgstgesghhmrghilhdrtghomhdprhgtphhtthhopehmrgiiii
    hivghsrggttghouhhnthesghhmrghilhdrtghomhdprhgtphhtthhopehrughunhhlrghp
    sehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhitgdvfeeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepshhrihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    giekieeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:n5I2aWwfV8uojphryA4LMwvhxBD1lSSLxiL6gnkJPQjtfRjYR-x8vA>
    <xmx:n5I2abdylMnetpIIFpQZmx8ZEpFo6JUFVPuRC__c1vvm4enk8iT1mA>
    <xmx:n5I2aScjp6Ox44YOHm51rgR0Mr9Ks_Z-hseL7SDUtrPSG-OFb-WnTQ>
    <xmx:n5I2adZU1k7BYPSdKrT6-sy_WehWFCXQ_6Ovy7ofNuSa_TuuU6O_wA>
    <xmx:oJI2aeOU8RNJqW6MFLWxWiLR6QwmLwTtSNYK68Yfe2XTmH0U_4KugIRA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EC25DC40054; Mon,  8 Dec 2025 03:55:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AdXK0EwxrYhs
Date: Mon, 08 Dec 2025 09:55:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Cc: "Andy Shevchenko" <andy.shevchenko@gmail.com>, andrew.jones@linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>, openbmc@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Paul Kocialkowski" <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 "Paul Cercueil" <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matti Vaittinen" <mazziesaccount@gmail.com>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "Vaibhav Hiremath" <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, "Max Filippov" <jcmvbkbc@gmail.com>
Message-Id: <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Subject: Re: Kconfig dangling references (BZ 216748)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that 
> were noise).
>
> I'll try to Cc: all of the relevant mailing lists or individuals.
>
>
> ARCH_HAS_HOLES_MEMORYMODEL ---
> arch/arm/mach-omap1/Kconfig:7:	select ARCH_HAS_HOLES_MEMORYMODEL

My mistake, this was a botched rebase.

> ARM_ERRATA_794072 ---
> arch/arm/mach-npcm/Kconfig:33:	select ARM_ERRATA_794072

This apparently never made it upstream because it was unreliable
https://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/244343.html

> MACH_JZ4755 ---
> drivers/clk/ingenic/Kconfig:20:	default MACH_JZ4755
> drivers/pinctrl/pinctrl-ingenic.c:158:	IS_ENABLED(CONFIG_MACH_JZ4755) 
> << ID_JZ4755 |
> drivers/pinctrl/pinctrl-ingenic.c:4616:		.data = 
> IF_ENABLED(CONFIG_MACH_JZ4755, &jz4755_chip_info)
>
> MACH_JZ4760 ---
> drivers/clk/ingenic/Kconfig:40:	default MACH_JZ4760
> drivers/pinctrl/pinctrl-ingenic.c:159:	IS_ENABLED(CONFIG_MACH_JZ4760) 
> << ID_JZ4760 |
> drivers/pinctrl/pinctrl-ingenic.c:4620:		.data = 
> IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
> drivers/pinctrl/pinctrl-ingenic.c:4624:		.data = 
> IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
>
> MACH_STM32MP25 ---
> drivers/pinctrl/stm32/Kconfig:58:	default MACH_STM32MP25 || (ARCH_STM32 
> && ARM64)

This was likely intended for 32-bit kernels on 64-bit STM32MP25
chips, which we don't support. I think this can go.

> MIPS_BAIKAL_T1 ---
> drivers/ata/Kconfig:197:	select MFD_SYSCON if (MIPS_BAIKAL_T1 || 
> COMPILE_TEST)
> drivers/bus/Kconfig:43:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> drivers/bus/Kconfig:58:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> drivers/clk/baikal-t1/Kconfig:4:	depends on (MIPS_BAIKAL_T1 && OF) || 

I don't think we'll merge the rest of Baikal, we should probably
remove the entire platform.

> PINCTRL_MILBEAUT ---
> arch/arm/mach-milbeaut/Kconfig:16:	select PINCTRL_MILBEAUT

Same for Milbeaut

> USB_OHCI_SH ---
> arch/sh/Kconfig:334:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:344:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:429:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:455:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/configs/sh7757lcr_defconfig:61:CONFIG_USB_OHCI_SH=y

Should have been removed as part of 7518f0763ecd ("sh: convert
boards to use the OHCI platform driver")

> X86_P6_NOP ---
> arch/x86/Kconfig.cpufeatures:41:	depends on X86_64 || X86_P6_NOP
> arch/x86/Makefile_32.cpu:48:ifneq ($(CONFIG_X86_P6_NOP),y)

I missed this in f388f60ca904 ("x86/cpu: Drop configuration options
for early 64-bit CPUs"). Both references can be removed, because
p6-nop was already disallowed for 32-bit CPUs at the time.

I don't know if any supported binutils still require -mtune=generic32

> XTENSA_PLATFORM_ESP32 ---
> drivers/tty/serial/Kconfig:1598:	depends on XTENSA_PLATFORM_ESP32 || 
> (COMPILE_TEST && OF)
> drivers/tty/serial/Kconfig:1611:	depends on XTENSA_PLATFORM_ESP32 || 
> (COMPILE_TEST && OF)

Max is still working on esp32 support as far as I know, it's just
slow progress, see
https://github.com/jcmvbkbc/linux-xtensa/commits/xtensa-6.16-esp32

       Arnd

