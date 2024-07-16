Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8E931F41
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:27:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gY+aMh7y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNPdT46cXz3cVB
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:27:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gY+aMh7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNPcy38zlz3cTw
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 13:26:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721100417;
	bh=W0zgjSfQoYtYpM/i9aC0WjfLvNV0B7b6CLHgHZsRRgI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gY+aMh7y5rtTemJFN+SKg8iofS1QPG1/BzB0g+jnOmnvBqO4JyGRTpOQH1qR70gSF
	 eusksGn9xlIjtVnNx0FbLvkzuG0dJtZlT6Os/qT6W732xJ86fXILYrV7wTSl3e0ja1
	 KFsabxxKcNki0PHB+I3gMA3ZfnwuLx93XgTNGGd4YrKL9nzdNJVpwwoT7UuO9cw5Ml
	 7etltIDGx0RFTbsrSjwvRLDSHQrifFIRw8PdDQH+sOCWPs4yVrHLp7Ztljsj7cIA+F
	 b1XZ4VIa6C7+fvYmaBF0BehkOZjtr0NWMXC7ySRwmswNW/ja9MbBfcAYAq3WizT78G
	 9KHz13Qhit1cg==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ECB5965555;
	Tue, 16 Jul 2024 11:26:57 +0800 (AWST)
Message-ID: <45deeafc8db89fb1ece04af50395c3cf88866cd1.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1] i2c: npcm7xx: disable I2C interrupt before
 devm_request_irq
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jul 2024 11:26:57 +0800
In-Reply-To: <20240709105412.1685181-1-tmaimon77@gmail.com>
References: <20240709105412.1685181-1-tmaimon77@gmail.com>
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-09 at 13:54 +0300, Tomer Maimon wrote:
> This patch fix NPCM I2C driver issue that causing a soft lockup issue.
>=20
> Upon investigation, it was found that during an I2C transaction, the BMC
> machine reboots unexpectedly, leaving the I2C module in an unchanged
> state. As a result, the I2C interrupt (IRQ) handler continues to be
> triggered. To address this, NPCM I2C probe function disable the I2C
> interrupt enable bit in the I2C module before invoking devm_request_irq
> function.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 2 ++
>  1 file changed, 2 insertions(+)

What's the state of this patch with respect to upstream? Is this
something specific to the openbmc/linux dev-6.6 tree, or is there an
upstream equivalent? If the latter, can you please link to the relevant
patch?

Andrew
