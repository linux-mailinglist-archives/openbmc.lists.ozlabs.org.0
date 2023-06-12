Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39E72C2AC
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 13:14:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=W8nu84eT;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ikUWVJff;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qfpwp1Wnrz30GJ
	for <lists+openbmc@lfdr.de>; Mon, 12 Jun 2023 21:14:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=W8nu84eT;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ikUWVJff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 544 seconds by postgrey-1.37 at boromir; Mon, 12 Jun 2023 21:13:42 AEST
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfpw65Xm9z2yLY
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2023 21:13:42 +1000 (AEST)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D44581EC00F8;
	Mon, 12 Jun 2023 13:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1686567867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=T5nu9ZiswE8RQGkFS+4IJ1ouiCYUZY13HPLb8yI2yYA=;
	b=W8nu84eTQvRnF4UeMz24J1cC/kFA7UM8HvnIScr0+6ShSg/m9dBxHr/AR2+sIojoCny6Fx
	+MucpbBbReK/MKa7gk+pV7AahSZ3LiEPafYMxq6uVzDcQrjpg20xayNjtwcJprHZj3pOav
	g11YP2oAJPTUU3rG4HuXXhYWtHMbyeM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1686567866; bh=T5nu9ZiswE8RQGkFS+4IJ1ouiCYUZY13HPLb8yI2yYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikUWVJffQiCr88x+Hnv0MZdtPiDa8ZUbowg/PIC/eVozysKk3SHxztfxvdVn9oHbo
	 2c6G7xZxO8Jr+66yEpo1w6U0tcMUbSst+7SXc+0y045AwbO5m2qPhPDrWpsVyGhoTX
	 V0KlSjUZcpRUPRwFB7secNmlWkXMzhRC1c9o3gPb1ARdBClu5ktMwkVtnNMEZjKaxh
	 0yQ8PRcwWwiyEDrkd6dii6zh5LjqxmAXbC8sIxCGuLWgqUbNHZowElNQuUzuXZeyNZ
	 yObK5b0MkZPXrWyvWbW1VTNOw1f+UO3/pDCI72sT9TtsoZgY5NR+eYxvCy5r3kymNA
	 3scktC3xgYzodIKWcWD2W3Z3QoAejgSVj4KHHfymnD9ZhPwec5aRnwJTUmUD/bRbFY
	 xaieyDoSqieP/ro+HlpZN3AV0D08AlzX2KEVPNLMO0Drp6fohmaWJnRsMOkwBk6ea9
	 gn9bAlKn2fOLWcCbt4hvWgr+XqZBO0g1PGCs+Weu183bt+qpeHdBckjpVjL8bplXKJ
	 SpNY2ML/EPJaxvVUfGBlV67nuOLcT5t9pQTTYdbr0xuTwSpgkxpvv3oG2AECE9fhsf
	 AbDXWErEprnRwmGJ/+B3AnRB/b0d0zMal7acrgICjYc5T93VN+YvEDON0825Ajr9Zt
	 ymxQOB6ieMSpIIE8nWHqyi50=
Received: from zn.tnic (p200300eA971dc508329c23FFFEa6A903.dip0.t-ipconnect.de [IPv6:2003:ea:971d:c508:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4567740E01E6;
	Mon, 12 Jun 2023 11:04:05 +0000 (UTC)
Date: Mon, 12 Jun 2023 13:04:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Marvin Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v18 1/3] ARM: dts: nuvoton: Add node for NPCM memory
 controller
Message-ID: <20230612110401.GPZIb7oZPdsPGFzSDc@fat_crate.local>
References: <20230111093245.318745-1-milkfafa@gmail.com>
 <20230111093245.318745-2-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230111093245.318745-2-milkfafa@gmail.com>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, james.morse@arm.com, ctcchien@nuvoton.com, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 05:32:43PM +0800, Marvin Lin wrote:
> Add node for memory controller present on Nuvoton NPCM SoCs. The
> memory controller supports single bit error correction and double bit
> error detection.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

I guess this needs an Ack from OF folks if it is going to go through the
EDAC tree ...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
