Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365A857A31
	for <lists+openbmc@lfdr.de>; Fri, 16 Feb 2024 11:21:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AX393ypt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbnyj1JqYz3dXL
	for <lists+openbmc@lfdr.de>; Fri, 16 Feb 2024 21:21:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AX393ypt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbny36zhNz3cRv;
	Fri, 16 Feb 2024 21:20:43 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6F548E24;
	Fri, 16 Feb 2024 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708078838;
	bh=0elf/8DBFF9nD7HnEVv8mQ6pIMWx7HsQOmIWp2FVY/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AX393yptT4D1gnQTL0SLZpDFwTppZK18wmPWMfWUEguKzpArW7XJbW9RmHc7uDS3v
	 lSn7hSHxdHJVDHwQ2GW752BbF48UPsRnW215LappvaIN+6EqLREBTK2sY8cpdpfGk8
	 NTZIiTekG3ROb8sdELVBPNOYpons8lbxnHLAKzm8=
Date: Fri, 16 Feb 2024 02:20:37 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Subject: Re: [PATCH] Add eSPI device driver (flash channel)
Message-ID: <f63c3077-f8cc-4f05-92ef-9b2303b181f4@hatter.bewilderbeest.net>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, jk@codeconstruct.com.au, openbmc@lists.ozlabs.org, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 06:36:08AM PST, Manojkiran Eda wrote:
>This patch adds the driver support for the eSPI controller of
>Aspeed 5/6th generation SoCs. This controller is a slave device
>communicating with a master over Enhanced Serial Peripheral
>Interface (eSPI).
>
>eSPI supports 4 channels, namely peripheral, virtual wire,
>out-of-band, and flash, and operates at max frequency of 66MHz.
>
>But at the moment, this patch set only supports the flash channel.
>
>Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>

Hi Manojkiran,

Glad to see this progressing again!  It sounds like there may still be 
some open questions regarding the approach, and as others have noted 
there are things included here that should be split out into separate 
patches.

I did try it out in its current form though, and encountered a few 
problems...

Firstly, the calls to dev_notice() all appear to be missing the struct 
device * as their first argument and hence don't compile (I hacked 
around this to get it to build).

Second, the device-tree updates only include aspeed-g6.dtsi, so I 
manually imported the corresponding aspeed-g5.dtsi change from the last 
version Chia-Wei posted [1] and used that for the AST2500 system I need 
eSPI support on.

[1] https://lore.kernel.org/linux-arm-kernel/20220516005412.4844-1-chiawei_wang@aspeedtech.com/

And finally, after making the above changes and running it I got the 
following during boot:

[    0.288079] aspeed-espi-ctrl 1e6ee000.espi-ctrl: something went wrong
[    0.288120] aspeed-espi-ctrl 1e6ee000.espi-ctrl: failed to allocate flash channel

I'm not sure if there's some change in this new version such that the 
dtsi patch I imported from the old one no longer works, but if nothing 
else it might at least suggest that the error messages could be made a 
bit more informative.


Thanks,
Zev

