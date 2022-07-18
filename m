Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79665577987
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 04:07:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmQMc4yT9z3c1w
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 12:07:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ffViAl5u;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zrV9zUzI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ffViAl5u;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zrV9zUzI;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmQM64DXLz2xT9
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 12:06:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 122BC32003CE;
	Sun, 17 Jul 2022 22:06:53 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 17 Jul 2022 22:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658110013; x=1658196413; bh=ME3d8otMLw
	Fq6VXKm9lqKO0pV2kj73m7Jwdh4sBmdok=; b=ffViAl5uQtx94HMORlDeoKyT6W
	taHUWENWK1XxlnoA8CzVnO2t6/fuRIrS0fPmXjvgyv1Rv0C6UcK3Og8z88QoCtGM
	roCkOEEpwLmEUm9JhJpcppPVGhV0Suu1/HsatzhAbuU+ZjS0CHK174sHaJ8OJ7mv
	s62AWQCEuqD8FurALJajsF+sL1+2FR2YaHO6tn6YslojclIAYlfvOnbMQ3/SUz6I
	7SRfiHeB55L41py+eJNWyEpo272VkS7ArYWyy55x4RNox64E1dF22cDainvK1Ur/
	notCgPnOjFwPO9nW/grMP1iaYC/0f5Ygggb9SbAWVJOQlWVE5CorUBnYfYVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658110013; x=1658196413; bh=ME3d8otMLwFq6VXKm9lqKO0pV2kj
	73m7Jwdh4sBmdok=; b=zrV9zUzIHtFVzAKul6LkjFh26URtSEoZhjohmiBpjxmg
	txCewhl92Cw6bQ9ngMyuEYb7XCIAZnVXtEdDzTOGpeAsdzNNH32f2CIlMGqOniN0
	AstBeUbmtRfhOY1gtnAisXbrg3pF71qQ9VkGeBtSXP6s/BKTvOWL7qVu1Y2HNGLb
	OcJyOkqs30ixAMn2Nge/+76jsR3C1dYHJZdOW7dFJg1sltZ/0tLdDIeOnL9CM+zA
	k+gWmRa7mOX7jLNjY0ojgvAKo4NpR4ZRF4rA7dTaZgEKBWpRw3zA1kMeH145ZEda
	Jjk7p1uN4dAPyV6twX+DEOEMo1uGt/tdguEZ5aRf0Q==
X-ME-Sender: <xms:PMDUYjMNzLFPTwx4YJbUcvpYjQsVcOdq9jnFcs9I2DOap20X01XoYA>
    <xme:PMDUYt-Mt7QZ6HK88qK8T4Tq_LIQKgwuFLuJz3GqV2OCrrNsUm1-TstaxS5jnSoqr
    6INz37blPNyEUYCnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeefjeekgedtjeevudeffffhledugfetieduheethefhgfdvgfetteeu
    leevhfejffenucffohhmrghinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
    uh
X-ME-Proxy: <xmx:PMDUYiStqxHXtMJX4XRdoZYjw_NPR5zgJMPd4_3nyj5wTbJZ5M_TGw>
    <xmx:PMDUYnt8ut14f2aVwZ5YZ-e6mOMC3geUYjRPMtWpjGp6lFW0VxopwQ>
    <xmx:PMDUYrdG5Zvm8DSQREKjq7ZSuryWlyggx23eeF8U7LKMccAJXyK_qg>
    <xmx:PcDUYsE0VRKqZVls_0u5vHMyx-B13XEi4r70eObseaIf4aDMocuOWA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 98736170007E; Sun, 17 Jul 2022 22:06:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <13ced7c6-e714-4213-929c-136ee0bc404d@www.fastmail.com>
In-Reply-To:  <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
References:  <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
Date: Mon, 18 Jul 2022 11:36:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "sri d" <srid.11486@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Physical LED Design Proposal
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
Cc: Matt Spinler <spinler@us.ibm.com>, jayashree-d@hcl.com, Brad Bishop <bradleyb@fuzziesquirrel.com>, "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jayashree,

First up, apologies for the extreme length of time it took me to get to this.

On Fri, 27 May 2022, at 16:42, Jayashree D wrote:
> Hi Team,
>
> Problem Description :
>
> In the existing phosphor-led-sysfs design, it exposes one service per LED.
> Therefore, multiple services will be created for multiple GPIO pins
> configured for LED. To abstract this method and also to create LEDs under a
> single service, a new implementation is proposed.
>
> Existing Implementation :
>
> 1. Physical Leds are defined in the device tree under "leds" section.
> 2. Corresponding GPIO pin are defined for the physical LEDs.
> 3. "udev rules" are used to monitor the physical LEDs.
> 4. Once the LED in initialized in device tree, udev event will be created
> and it will trigger a systemd service for that LED.
> 5. Therefore, if multiple GPIO pins are configured for LEDs, then it will
> create a multiple systemd services
> (xyz.openbmc_project.led.controller@.service)
> for phosphor-led-sysfs based on the LED name.
>
> Example :
>
> busctl tree xyz.openbmc_project.LED.Controller.led1
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/led
>       `-/xyz/openbmc_project/led/physical
>         `-/xyz/openbmc_project/led/physical/led1
>
> busctl tree xyz.openbmc_project.LED.Controller.led2
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/led
>       `-/xyz/openbmc_project/led/physical
>         `-/xyz/openbmc_project/led/physical/led2
>
>
>
> New Implementation :
>
> 1. Physical Leds are defined in the device tree under "leds" section.
> 2. Corresponding GPIO pin are defined for the physical LEDs.
> 3. "udev rules" are used to monitor the physical LEDs.
> 4. Once the udev event is initialized for the LED, it will store those LED
> name using the script in udev instead of triggering systemd   service.
> 5. Phosphor-led-sysfs will have a single systemd service
> (xyz.openbmc_project.led.controller.service) running by default at system
> startup.
> 6. A dbus method call will be exposed from the service. udev will notify
> the LEDs detected in the driver.
>
> Example :
>
> busctl tree xyz.openbmc_project.LED.Controller
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/led
>       `-/xyz/openbmc_project/led/physical
>         `-/xyz/openbmc_project/led/physical/led1
>         `-/xyz/openbmc_project/led/physical/led2
>
>
> This was already discussed in the previous mail thread. Please refer to the
> below link.
> https://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html
>
> Please provide your suggestions on this new proposal.

This looks good to me.

Thanks.

Andrew
