Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361480B655
	for <lists+openbmc@lfdr.de>; Sat,  9 Dec 2023 21:45:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O/4uchdK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sng513QkNz3cMH
	for <lists+openbmc@lfdr.de>; Sun, 10 Dec 2023 07:45:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O/4uchdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sng4P5Qmgz3bTt;
	Sun, 10 Dec 2023 07:45:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 869B3CE01BA;
	Sat,  9 Dec 2023 20:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D95C433C8;
	Sat,  9 Dec 2023 20:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702154702;
	bh=+7qwKc+g6O9nPYHObVhq00UWcOt2oMbcUuD1ls3YUTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/4uchdKtwypNWRTa301WpvfdXEMmFakt5eog88JUDkRhczMX02e3rBBWNEwlx6jg
	 PxtES+X9BVhyAsugIobcqBW8v+Y+EUd1b46dg2QTmBNxvZcHYXf5CrmyWPsJUbK+J6
	 inuDB4VU2hVdI8Zvgc+Rh9hR0GrAcXt0Jq2mxUubAy7rzs0aWFKylmRRpgmQliSB14
	 yZNL8vhb+wq9yb7WJeyTEJVfFYEZ0bF0Kup+mBXqrErjRnHSe3d9IblX19xyWi2r/k
	 XnxKG81bLPX5jty4mlhRlHrV28YTlmPt/PHuy8Y26qhk5OKchvN6Lpk6cWZH6TZDTi
	 BUZNlNoGDhOxw==
Date: Sat, 9 Dec 2023 21:44:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
Message-ID: <20231209204455.jxize3muvx7hhpos@zenone.zhora.eu>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208033142.1673232-3-quan@os.amperecomputing.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Quan,

[...]

> -	/* Ack all interrupts except for Rx done */
> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> -	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +
> +	/*
> +	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would indicate HW to
> +	 * start receiving or sending new data, and this may cause a race condition
> +	 * as the irq handler has not yet handled these irqs but is being acked.
> +	 * Let's ack them late at the end of the irq handler when those are truly processed.
> +	 */
> +	irq_ack_last = ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK;
> +	writel(irq_received & ~irq_ack_last, bus->base + ASPEED_I2C_INTR_STS_REG);

I like Andrews suggestion of having irq_ack_last as a define that
is already negated, instead of negating it in the writel, which
makes it a bit difficult to read.

Besides, ack_last, as a name is not very meaningful, I'd rather
call it irq_ack_rx_tx (or something similar).

But I'm not going to block it for this, up to you if you want to
send a new version.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
