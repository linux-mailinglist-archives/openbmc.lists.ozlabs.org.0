Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA47B745B
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 00:55:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jxK5C/JA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Y7W6hwFz3dk2
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 09:55:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jxK5C/JA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Y6p3fhwz3c4t;
	Wed,  4 Oct 2023 09:54:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 451B6CE1872;
	Tue,  3 Oct 2023 22:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8A9C433C7;
	Tue,  3 Oct 2023 22:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696373677;
	bh=9Oft35Q1R1+kG+ADxClgAanF3/fHDbeRHG97EroNmi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxK5C/JATXAL5TIu1lyaXWewPzHW/nqlXuV5LlsnA6sfucQfzBrO+HsjJ7aNIK47T
	 rlMHv4I27UWPwP8KFeArZ65rAnDybVL5oesYmfAvSWZRYZ4D+3f+oB+n0ArGOK1BpY
	 G8I8x27mo15usD5zuQhYcfkxhln4cqshu121eEiGe3C7VB5YvM+/B44bxqlGLahB4G
	 IL29143bJIMsHDeAifGLJZ7zkSnIcHcUiPI4DHgABcNAbTr55ZQmBtbmQaOnCBPP/t
	 CnfBdCdEMwmiszQTDeW5lSYSvV9GL8DYi4zNZkMx9wQjchjE/04um3CQSabMop+xZW
	 EOcExskCuiQNA==
Date: Wed, 4 Oct 2023 00:54:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Subject: Re: [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave
 read
Message-ID: <20231003225431.owtpcds7rrijj7yf@zenone.zhora.eu>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
 <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
 <CA+J-oUsgZuFmKor_thfehf2T8Y9T4NHcDp713YHyZC=fQvvZgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+J-oUsgZuFmKor_thfehf2T8Y9T4NHcDp713YHyZC=fQvvZgA@mail.gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>, brendan.higgins@linux.dev, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, joel@jms.id.au, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jian,

On Thu, Sep 28, 2023 at 11:04:23AM -0400, Jian Zhang wrote:
> > From: "Andi Shyti"<andi.shyti@kernel.org>
> > Date:  Thu, Sep 28, 2023, 22:51
> > Subject:  [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
> > To: "Jian Zhang"<zhangjian.3032@bytedance.com>
> > Cc: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>, <andrew@aj.id.au>, <zhangjian3032@gmail.com>, <yulei.sh@bytedance.com>, <xiexinnan@bytedance.com>, "Tommy Huang"<tommy_huang@aspeedtech.com>, "Wolfram Sang"<wsa@kernel.org>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@vger.kernel.org>, "moderated list:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlabs.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-aspeed@lists.ozlabs.org>, "open list"<linux-kernel@vger.kernel.org>
> > Hi Jian,
> >
> > On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > > When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> > > as a slave, a situation arises where the master sends a START signal
> > > without the accompanying STOP signal. This action results in a
> > > persistent I2C bus timeout. The core issue stems from the fact that
> > > the i2c controller remains in a slave read state without a timeout
> > > mechanism. As a consequence, the bus perpetually experiences timeouts.
> > >
> > > In this case, the i2c bus will be reset, but the slave_state reset is
> > > missing.

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

I checked the flow in the driver and makes sense to me. I'd also
love a last minute comment from Brendan or Benjamin or Joel.

> > > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
> > > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> >
> > Why I'm failing to find your v1 patch? And where is the
> > changelog?
> Sorry, something was missing,
> v2:
> * remove the i2c slave reset and only move the `bus->slave_state =
> ASPEED_I2C_SLAVE_INACTIVE` to the aspeed_i2c_init
> 
> [0]: https://lore.kernel.org/linux-arm-kernel/20230810072155.3726352-1-zhangjian.3032@bytedance.com/T/

Thanks! I should really check my filters here.

Andi

> Jian
> >
> > Andi
