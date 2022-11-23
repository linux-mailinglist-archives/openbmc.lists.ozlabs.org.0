Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840A9635AFD
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 12:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHJGl2N72z3cMx
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 22:06:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=XHerL+dM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DXuPSQyI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=XHerL+dM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DXuPSQyI;
	dkim-atps=neutral
X-Greylist: delayed 455 seconds by postgrey-1.36 at boromir; Wed, 23 Nov 2022 22:05:59 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHJFz0J5Dz2xBF
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 22:05:58 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 404755C018B;
	Wed, 23 Nov 2022 05:58:20 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 23 Nov 2022 05:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669201100; x=1669287500; bh=P/3gymjggx
	G0AGo8CB4kiNTmYVS5hoUgWnwMUY5zy6A=; b=XHerL+dM+qFeU/J/gClsNwqKYP
	+/f48/pxEFdBIrgqCgIQLzD9UFu9xP1tqyeSqfgwXjvIvRL8p3bCjb0bNiI9pfXR
	DWGqecxjuUkjtwe6CpBmkVnaHwop6wzEjYcy0pl938upDFhP/AkM73XSEGC7A3+N
	LcPLvZ9MFm+tPG3cRUTXK5slAxL/dBxMRCeSsA7s0qqzXQ/EEKvpMKUxH5+E7xvo
	loR6KfoexCYcdlW9TyduWMYvnqWH/eobTeAxW4Vj6xt1EYhWenZqwLwHCkALwKE3
	fdY1zhdIW83wFlwj7j/Gc1WNv63jnPWCYMnUZxsTCfC845UmY5WPFydbXPzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669201100; x=1669287500; bh=P/3gymjggxG0AGo8CB4kiNTmYVS5
	hoUgWnwMUY5zy6A=; b=DXuPSQyIBea+ygxBIrS1CUZ8KzYgBSuCeg3zFSY1x7Wy
	H35LLQSxcPV9GwtCUj4XHP0V8vIrTKuORP4QJP+vRXyA3S1sydeDaDSOxOt5/OnU
	HewPpYDKJabWFRxYGXCrmlaQgR6klwWTX8IHHCGPDnHkViHAi8wTbxypX9y59l1V
	0rxQCHvo0ZlnFmXuZgmGpxUVD8j3S8rDGBOqCkGvhrrw5XOy7lv82lQlzrkM0Aku
	rWsh13yD1uLsqzYdVhjuCcTfNyf8pbNqQeR2Z+dciT+ZLmmVrg3RROoXYewu9hf7
	Rq0ShKkYrXeYH+qTtfNv+BMTJoxU4CggQbRZuYv3bg==
X-ME-Sender: <xms:y_x9Y2q-16jMcKDaMHfpFitDAPXbIXmVFOwsx9ZxWSTs7MsxbkcI-A>
    <xme:y_x9Y0prnXaYP6gndujYUiB_tZI8ZEZs8UxJRl27wzVrJNI4tOxSD4305-gRr-HNx
    7SQYlhiBmDu3HVDujI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:y_x9Y7OCA_vrHQ-Vunm62PK5EGarJThVdKvx3qYwFvFoZEQ0cufGNQ>
    <xmx:y_x9Y17k0gMJkZohfz_FAR1ZKZEHExBzEF7hOEjpfYX_EFbCvcvFjA>
    <xmx:y_x9Y15042C56nmesMe3NyGdkvr8sJzz-UX_hMeVs-j-mHkZVyTEZw>
    <xmx:zPx9Y5qMcGBjs0kHvf_zCQ_oUueT6B7zkZASXWcd43LgFoPl2Y8FhQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2195EB60086; Wed, 23 Nov 2022 05:58:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <577e273d-ff9b-4d8d-b797-d7275ab8374f@app.fastmail.com>
In-Reply-To: <20221122201232.107065-3-tmaimon77@gmail.com>
References: <20221122201232.107065-1-tmaimon77@gmail.com>
 <20221122201232.107065-3-tmaimon77@gmail.com>
Date: Wed, 23 Nov 2022 11:57:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomer Maimon" <tmaimon77@gmail.com>, avifishman70@gmail.com,
 tali.perry1@gmail.com, "Joel Stanley" <joel@jms.id.au>, venture@google.com,
 yuenn@google.com, benjaminfair@google.com,
 "Hitomi Hasegawa" <hasegawa-hitomi@fujitsu.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Sven Peter" <sven@svenpeter.dev>, "Brian Norris" <briannorris@chromium.org>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 22, 2022, at 21:12, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM LPC BIOS post code (BPC) driver.
>
> The NPCM BPC monitoring two configurable I/O address written by the host
> on the Low Pin Count (LPC) bus.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/soc/Kconfig                |   1 +
>  drivers/soc/Makefile               |   1 +
>  drivers/soc/nuvoton/Kconfig        |  24 ++
>  drivers/soc/nuvoton/Makefile       |   3 +
>  drivers/soc/nuvoton/npcm-lpc-bpc.c | 396 +++++++++++++++++++++++++++++

In general, I try to keep drivers/soc/ for drivers that are
used purely inside of the kernel and don't provide their
own user space ABI, those should normally be part of
some subsystem grouped by functionality.

It appears that we have similar drivers for aspeed already,
so there is some precedent, but I would still like to ask
you and Joel to try to make sure the two are compatible,
or ideally share the code for the user-facing part of the
LPC driver.

> +config NPCM_PCI_MBOX
> +	tristate "NPCM PCI Mailbox Controller"
> +	depends on (ARCH_NPCM || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +	help
> +	  Expose the NPCM BMC PCI MBOX registers found on Nuvoton SOCs
> +	  to userspace.

This looks unrelated to the LPC driver, so this should
probably be a separate patch. The same comment about user
space presumably applies here, but I have not seen the driver.

The implementation of npcm-lpc-bpc looks fine otherwise, I only
noticed one minor detail that I would change:

> +	np = pdev->dev.parent->of_node;
> +	if (!of_device_is_compatible(np, "nuvoton,npcm750-lpc") &&
> +	    !of_device_is_compatible(np, "nuvoton,npcm845-lpc")) {
> +		dev_err(dev, "unsupported LPC device binding\n");
> +		return -ENODEV;
> +	}

This check doesn't seem to make sense here, since those are
the only two types you support.

      Arnd
