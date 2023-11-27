Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05D7FAE26
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 00:00:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GcF5S01D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfLfT1hFkz3cGJ
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 10:00:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GcF5S01D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfLdm2SGZz3bYc;
	Tue, 28 Nov 2023 10:00:12 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-131-38.adl-adc-lon-bras33.tpg.internode.on.net [118.210.131.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC2FB200EF;
	Tue, 28 Nov 2023 07:00:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701126006;
	bh=jeaVBZ61hYUULmiG4P1ndu1Q2m319cZm4MzoynyxVlQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GcF5S01D0K9OrzUP0huZxWEqVkzKv+ALVQNJLjU286ml3+TWPtHI2Zc8t6o8wULQk
	 KqmZkOUx0cGc5393b6urtjElVwWj3lGCg4obKPoov+MkKuHgNZZMKJV/ofccGs7cFX
	 RFwEHtRS1QEG1fEyjt7aZe/h33NCJjvIcqSNRTRoHy2/N4rEquFYON9Y1iqm0rzJEv
	 C5nfRoagxZnIgxEWBCdb1IL9THFhXkg6oGh70riVnXa5jPtyduaH/9GenlWyUlxYKi
	 kIKcmX/4E5/YnNDHVydkF6JAVm+AICdzgHsd4IY2w2/68iom6sRDaqwziTv7BzQsrw
	 JBe2POQtO3KnA==
Message-ID: <d0773df55a6fe8a5c9b1a3d7c8dd2e1343643272.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Cosmo Chou
 <chou.cosmo@gmail.com>
Date: Tue, 28 Nov 2023 09:30:01 +1030
In-Reply-To: <854762fb-1767-4208-a7fc-10580730c1f3@os.amperecomputing.com>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
	 <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
	 <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
	 <854762fb-1767-4208-a7fc-10580730c1f3@os.amperecomputing.com>
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
Cc: jae.hyun.yoo@linux.intel.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, cosmo.chou@quantatw.com, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-11-27 at 15:08 +0700, Quan Nguyen wrote:
>=20
> On 27/11/2023 14:04, Cosmo Chou wrote:
> > Andrew Jeffery <andrew@codeconstruct.com.au> wrote on Mon, 2023-11-27
> > at 11:23 AM:
> > >=20
> > > On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
> > > > commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts earl=
y
> > > > in interrupt handler") moved most interrupt acknowledgments to the
> > > > start of the interrupt handler to avoid race conditions. However,
> > > > slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSE=
D
> > > > is handled.
> > > >=20
> > > > Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fi=
x
> > > > the problem that the next byte is not sent correctly.
> > >=20
> > > What does this mean in practice? Can you provide more details? It
> > > sounds like you've seen concrete problems and it would be nice to
> > > capture what it was that occurred.
> > >=20
> > > Andrew
> >=20
> > For a normal slave transaction, a master attempts to read out N bytes
> > from BMC: (BMC addr: 0x20)
> > [S] [21] [A] [1st_B] [1_ack] [2nd_B] [2_ack] ... [Nth_B] [N] [P]
> >=20
> > T1: when [21] [A]: Both INTR_SLAVE_MATCH and INTR_RX_DONE rise,
> > INTR_RX_DONE is not cleared until BMC is ready to send the 1st_B:
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-as=
peed.c#L294
> > That is, BMC stretches the SCL until ready to send the 1st_B.
> >=20
> > T2: when [1_ack]: INTR_TX_ACK rises, but it's cleared at the start of
> > the ISR, so that BMC does not stretch the SCL, the master continues
> > to read 2nd_B before BMC is ready to send the 2nd_B.
> >=20
> > To fix this, do not clear INTR_TX_ACK until BMC is ready to send data:
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-as=
peed.c#L302
> >=20
>=20
> This looks like the same issue, but we chose to ack them late. Same with=
=20
> INTR_RX_DONE.
>=20
> https://lore.kernel.org/all/20210616031046.2317-3-quan@os.amperecomputing=
.com/

From a brief inspection I prefer the descriptions in your series Quan.
Looks like we dropped the ball a bit there though on the review - can
you resend your series based on 6.7-rc1 or so and Cc Cosmo?

Cheers,

Andrew
