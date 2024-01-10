Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EB82B830
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 00:45:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=l5z728/b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB1Vn4kb0z3cVk
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 10:45:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=l5z728/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ispras.ru (client-ip=83.149.199.84; helo=mail.ispras.ru; envelope-from=pchelkin@ispras.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 329 seconds by postgrey-1.37 at boromir; Wed, 10 Jan 2024 20:29:06 AEDT
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T92YZ0Z5Bz2xX4
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 20:29:06 +1100 (AEDT)
Received: from localhost (unknown [46.242.8.170])
	by mail.ispras.ru (Postfix) with ESMTPSA id 51F7740F1DF6;
	Wed, 10 Jan 2024 09:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 51F7740F1DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1704878610;
	bh=fnpR3T7RIMq+i4kpDaWxriwBNNBqwi1jzsXS3sBDB88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5z728/bshdC1sRpZN1hz4gEfTbYS7CO8lJ873fFixp9AMKe7b72BtugFEPL36z9j
	 A66zPVLlEeEqdi2cfWVXm0QUZFojFg5OkdXVvvG1sajPNfpn+JPYlZzMiNylB3JGiv
	 eAbqv1A1QN15kY159O/C16PKpVk3pacaFS5fsfgc=
Date: Wed, 10 Jan 2024 12:23:30 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference in
 npcm_i2c_reg_slave
Message-ID: <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
References: <20240109145121.8850-1-rand.sec96@gmail.com>
 <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
X-Mailman-Approved-At: Fri, 12 Jan 2024 10:42:46 +1100
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
Cc: voskresenski.stanislav@confident.ru, lvc-project@linuxtesting.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, Rand Deeb <rand.sec96@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/01/10 10:43AM, Tali Perry wrote:
> On Tue, Jan 9, 2024 at 4:52 PM Rand Deeb <rand.sec96@gmail.com> wrote:
> >
> > In the npcm_i2c_reg_slave function, a potential NULL pointer dereference
> > issue occurs when 'client' is NULL. This patch adds a proper NULL check for
> > 'client' at the beginning of the function to prevent undefined behavior.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index c1b679737240..cfabfb50211d 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1243,13 +1243,14 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
> >  static int npcm_i2c_reg_slave(struct i2c_client *client)
> >  {
> >         unsigned long lock_flags;
> > -       struct npcm_i2c *bus = i2c_get_adapdata(client->adapter);
> > -
> > -       bus->slave = client;
> > +       struct npcm_i2c *bus;
> >
> > -       if (!bus->slave)
> > +       if (!client)
> >                 return -EINVAL;
> >
> > +       bus = i2c_get_adapdata(client->adapter);
> > +       bus->slave = client;
> > +
> >         if (client->flags & I2C_CLIENT_TEN)
> >                 return -EAFNOSUPPORT;
> >
> > --
> > 2.34.1
> >
> 
> 
> Thanks for the patch!
> 
> Reviewed-by:tali.perry1@gmail.com

If I'm not missing something, npcm_i2c_reg_slave() is called via a
function pointer ->reg_slave here [1]. And seems `client` can't be NULL
there. Other drivers implementing ->reg_slave function don't check its
argument.

Maybe we should just drop `if (!bus->slave)` check?

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-slave.c#L48
