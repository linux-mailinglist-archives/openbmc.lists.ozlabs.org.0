Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A536B72D5
	for <lists+openbmc@lfdr.de>; Mon, 13 Mar 2023 10:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsBf1McWz3c9N
	for <lists+openbmc@lfdr.de>; Mon, 13 Mar 2023 20:42:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eymBdvbL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eymBdvbL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZK2W2k3bz3c6t;
	Sun, 12 Mar 2023 23:33:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A49F460F0F;
	Sun, 12 Mar 2023 12:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C379EC433D2;
	Sun, 12 Mar 2023 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678624400;
	bh=wKK18JhLAidYuz7urwViijJ7ZzWu18IoQlSj7/PTI4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eymBdvbLzTtRs6nBQ8S8SsE7NG6OOyokbEEAu2+UYecDgnuFGBPRsp2lyq+aixcOe
	 4QUQPnA5Ml3/EPjJ/78qW1dIZlnKn8l0z64Pzcc007TntpiL0AUTfSEJTPzBuh5JOL
	 OIt2F7U3ccQLmcwVxxkFhWUYVmPuDas4QL8rbd9sN7t708A++tjaPP0z9rm6+bb4gp
	 8pm/U9GRpBatLyhesGz582RrB2Myu1qla1USA6uUjasI5FHMTFwCPdgcfAm1uRVfwl
	 MKumMM1UiIsGwnR9jrt904v3srZFfEGFQPGRp322wd47pnK1zWgv3d2DT2Usj26Y9i
	 es2PWSPYPJtCQ==
Date: Sun, 12 Mar 2023 13:33:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <20230312123316.rn2qm3jnw7iy5yts@intel.intel>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
X-Mailman-Approved-At: Mon, 13 Mar 2023 20:41:51 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof and Ryan,

> >>> +  aspeed,timeout:
> >>> +    type: boolean
> >>> +    description: I2C bus timeout enable for master/slave mode
> >>
> >> Nothing improved here in regards to my last comment.
> > 
> > Yes, as I know your require is about " DT binding to represent hardware setup"
> > So I add more description about aspeed,timeout as blow.
> > 
> > ASPEED SOC chip is server product, i2c bus may have fingerprint connect to another board. And also support hotplug.
> > The following is board-specific design example.
> > Board A                                         Board B
> > -------------------------                       ------------------------
> > |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> > |i2c bus#2(master)-> tmp i2c device |          |                       |
> > |i2c bus#3(master)-> adc i2c device |          |                       |
> > -------------------------                       ------------------------
> > 
> > aspeed,timout properites:
> > For example I2C controller as slave mode, and suddenly disconnected.
> > Slave state machine will keep waiting for master clock in for rx/tx transmit.
> > So it need timeout setting to enable timeout unlock controller state.
> > And in another side. In Master side also need avoid suddenly slave miss(un-plug), Master will timeout and release the SDA/SCL.
> > 
> > Do you mean add those description into ore aspeed,timout properites description?
> 
> You are describing here one particular feature you want to enable in the
> driver which looks non-scalable and more difficult to configure/use.
> What I was looking for is to describe the actual configuration you have
> (e.g. multi-master) which leads to enable or disable such feature in
> your hardware. Especially that bool value does not scale later to actual
> timeout values in time (ms)...
> 
> I don't know I2C that much, but I wonder - why this should be specific
> to Aspeed I2C and no other I2C controllers implement it? IOW, this looks
> quite generic and every I2C controller should have it. Adding it
> specific to Aspeed suggests that either we miss a generic property or
> this should not be in DT at all (because no one else has it...).

this property is missing in the i2c devicetree property and
because this is the second driver needing it, I think it should
be added.

To be clear, this timeout means that the SCL is kept low for some
number of milliseconds in order to force the slave to enter a
wait state. This is done when the master has some particular
needs as Ryan is describing.

It's defined in the i2c specification, while smbus defines it in
a range from 25 to 35 ms.

In any case it's not a boolean value unless the controller has it
defined internally by the firmware.

So... nack! Please, hold a bit, I'm sending a patch. 

Andi
