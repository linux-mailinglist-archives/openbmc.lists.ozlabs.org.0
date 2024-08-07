Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82C949D9A
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 04:09:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YIL0IZnG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdtsP0MYsz3cSn
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:09:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YIL0IZnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdtrm6N5qz2xPd;
	Wed,  7 Aug 2024 12:08:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722996533;
	bh=nDl2m8ByNTDL/Jr5G7cbij8hr6lhLY2gB+yNYJiRltw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YIL0IZnGxDfFr3ZM+58Tsk19y7Rj68uU3RXsrtsbRCQa3ua0v5fiopzLvYjfGtn2w
	 aFcnR7rxVQWcV0NiXZitMUTrNbhGn5rjoLiNop0XnWh2Oz2bHaomJBLeFjE+ndnq98
	 op6C9BzJY/t4grLQ2FgAP/l9tRSQ2TUi5erxdycWREBhnu4+pb73l6/85Ii2GmxAQ5
	 jlPxQvXnrWOq9+bwIrI95FdIyzpLle8yCGuXkKOhVZj2v6PFPBo67JfNAFFKrvfaSh
	 1R+9tx2CwSKRBRQj7/geJxUxQeRemmcDmZsRyqhDFePlHGNGQ0+nk5vzzBXENp/Pfo
	 xUkvAiIRayJ2w==
Received: from [192.168.68.112] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9F099654E9;
	Wed,  7 Aug 2024 10:08:49 +0800 (AWST)
Message-ID: <5218da67149847bb803081b9f59ed031ffd7b43c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/5] Update the device tree for Ampere's BMC platform
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@os.amperecomputing.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>, Open Source Submission
 <patches@amperecomputing.com>
Date: Wed, 07 Aug 2024 11:38:48 +0930
In-Reply-To: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
References: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-08-06 at 07:18 +0000, Chanh Nguyen wrote:
> Updates the device tree to support some features on Ampere's
> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
>=20
> Changes in v2:
>  - Add eeprom nodes to the riser cards and update commit message   [Chanh=
]
>  - Remove the "Add I2C Fan controllers"                            [Andre=
w]
>   =20
> Chanh Nguyen (5):
>   ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
>   ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
>   ARM: dts: aspeed: mtmitchell: Add Riser cards
>   ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
>   ARM: dts: aspeed: mtmitchell: Add LEDs
>=20
>  .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
>  .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 154 ++++++++++++++++++
>  2 files changed, 170 insertions(+)
>=20

I've applied these to be merged via the BMC tree.

Thanks,

Andrew
