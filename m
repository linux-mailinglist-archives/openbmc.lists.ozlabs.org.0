Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AA85F3AD
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 09:58:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUl8Y3d8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgRrX45mdz3d2d
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 19:58:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUl8Y3d8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgRqs6kBqz3bWn;
	Thu, 22 Feb 2024 19:58:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EA8E61771;
	Thu, 22 Feb 2024 08:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E9DC433C7;
	Thu, 22 Feb 2024 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708592278;
	bh=th7l9GDlitBQrVNcZgGUJYqJa0Nwh+9KQ0v3uwoZ/rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUl8Y3d8UX/Rj84fOlyp+s0kCjjZ3xD4t+Uxpb5sH5slYu7KIzraPk+76C0R1qGhv
	 W8/jQRxpmx2XRb1jyY2dNBoT+YB9ue5JdbCLJPQS5QPd0O9mevjqCjKBPWq4Q4ql5t
	 POjLZRefaF26ZQIo4U7W6g+QrceUaur4c1cdgmBtHYKeaiF6jEkYh6skGVzVTqJThe
	 hhPsOLDtWaF9K48vjEXDoLbMiTtsRiVXYWPydAgXuUIB1pMbNVKK5hEjaTJ51LMU1T
	 7Zn8+Pb1i5bneZMBEAJQvOCu8PEyn6iZ1+tc3AAkpz0WXgUA1/eHTGuyXr7nT096xK
	 bh9ZLjdi5WdLQ==
Date: Thu, 22 Feb 2024 09:57:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Message-ID: <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
 <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Thu, Feb 22, 2024 at 01:10:39AM +0000, Tommy Huang wrote:
> > On Fri, Feb 16, 2024 at 08:04:55PM +0800, Tommy Huang wrote:
> > > When the i2c error condition occurred and master state was not idle,
> > > the master irq function will goto complete state without any other
> > > interrupt handling. It would cause dummy irq expected print. Under
> > > this condition, assign the irq_status into irq_handle.
> > 
> > I'm sorry, but I don't understand much from your log here.
> > 
> > Do you mean that irq_handled in aspeed_i2c_master_irq() is left with some
> > states that is not supposed to have and then you end up printing here:
> > 
> > 	dev_err(bus->dev,
> > 		"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
> > 		irq_received, irq_handled);
> > 
> > Can you please explain better?
> > 
> 
> Yes. If the platform met any irq error condition and the i2c wasn't stated under ASPEED_I2C_MASTER_INACTIVE.
> Then the code flow would goto the end of aspeed_i2c_master_irq.
> 
> 	ret = aspeed_i2c_is_irq_error(irq_status);
> 	if (ret) {
> 		...
> 		irq_handled |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
> 		if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
> 			bus->cmd_err = ret;
> 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> 			goto out_complete;
> 		}
> 	}
> 
> Some master interrupt states were not handled under this situation.
> The fake irq not equaled message would be filled into whole of demsg.
> It's most like below example.
> 
> ...
> aspeed-i2c-bus 1e78a780. i2c-bus: irq handled != irq. expected 0x00000030, but was 0x00000020
> aspeed-i2c-bus 1e78a780. i2c-bus: irq handled != irq. expected 0x00000030, but was 0x00000020
> aspeed-i2c-bus 1e78a780. i2c-bus: irq handled != irq. expected 0x00000030, but was 0x00000020
> ...
> 
> I thought the bus->cmd_err has been filled error reason and it would be returned to upper layer.
> So, I didn't think the print should be existed.

thanks! Can you please write a commit that explains better the
fix you are doing?

> > If that's the case, wouldn't it make more sense to check for
> > bus->master_state != ASPEED_I2C_MASTER_INACTIVE) earlier?
> 
> Did you suggest to add "bus->master_state != ASPEED_I2C_MASTER_INACTIVE" judgement before print the irq not equal print?

no, not really, but nevermind, on a second look, what I'm
suggesting doesn't make much sense.

If you want, please reword the commit message as reply to this
e-mail and I will take care of it.

> > And, still, If that's the case, I believe you might need the Fixes tag. It's true that
> > you are not really failing, but you are not reporting a failure by mistake.

Please, also consider adding the Fixes tag if you see it
necessary; I think you should, but it's borderline.

Andi
