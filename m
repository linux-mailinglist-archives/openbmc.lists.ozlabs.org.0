Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B19ED97F
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 23:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7qln4p8Kz3dF9
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2024 09:19:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733941718;
	cv=none; b=YCrKRYf6A7qRiqnSr268MUq4vvZ1qS54zz8KDcEY/bvL+fjJiWaDzNw8rz7h4zwx+e+TaHMg8cMv+6K9CqTM5Y+JcLXUP22mWUBbiKuL7F1lMp8pDGa9UA6Jjr3uhqnKeiuKHekCf8hgWdHUACgk7PBXgpkqCMhByyHc1K7fSdj4IDbwuct/LNgCgX5oMLBBn8T1ygPnKNMRQdBgPcIHjZrHMJGmvwYFdp6nMdUp+IE0JxtNR4UD47JDwD2ssNOLH6m1sWOVXQVStra9PDGnXMq4TH6IAP6gQeG9cCvVOU93y0U+Kr3vrAeGo3Qkv84YwMjtChE+Dk6VX8JBnwGxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733941718; c=relaxed/relaxed;
	bh=TRgXzBp/8SzVeGFwTnfnshREU/FVQ4LltbF7+UBlGUc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbIS7ZgKm6FHw7zxUtlltuz1E/w4Md6AkXQb2TLusrCfVJkONOCx0QL1FIzWppvU8nNqkQghix1HUhLj55OyZX1IH43iBq4XcK6OSvG6JYUGavnoMWVsg+/d+kE5ceVayqUm/d5YqOteyqiI9OHiObD8dRKuX0ZPJogOl2SS+4rDCg5CqvyYS1wAausNts42VBvMzNJjkjAAmzFgDjlZmulpvDD53osRQ+doEiz8WKmJDJnJlwtzctCDB5FKVufVUyWI5bY4yG5oXJAK9DhqGlwI+7OlZeq/qSFwwTahmJ9uCteDZ3t5GkIei+Z3m67ZVp8Pv2DvJovIc0Gt3yJ4hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r6DSssme; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r6DSssme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7kd10crPz2yhR
	for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2024 05:28:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 990D25C675F;
	Wed, 11 Dec 2024 18:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8326BC4CED2;
	Wed, 11 Dec 2024 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733941713;
	bh=JU4/hbf8LqaPk3w9vxQmPNCv7yc8PUm7ADZHQhjLaoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r6DSssmeU18QTcKa3b/Dic7+wNzV8rV/DC3hk6bCBVkkm8BivtQMtxTpw8A7I7DGF
	 6gcMKml4Qqi3Cnaokzt0Ho2AhsoCm3BYlgtA1Y8Ok+YUpsU2Nr60X+wSPA/kILu+zM
	 Y6l2D5+WTimIA09EkRkDknpoI2hW6ruxJ09+9/WHyUKAmCJuIZmfSIt06vbWG/5WM9
	 SAEUSyBrS6ozSe9cp4d6lXrAJ4EJPs5KhjOIpJrh64AD4JYhyK75fC4gBXdwb+wY+K
	 1MFK5FjnAlGttHu/20yM4xPhSYEjylRk1YN2tANQPJcXMxalxlBlwReYNFRk+OKd/v
	 8C1CDXi4SequA==
Date: Wed, 11 Dec 2024 18:28:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Hsian Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <20241211182817.12d63645@jic23-huawei>
In-Reply-To: <CA+4VgcLDQrTcTFjr7MYGtMYpqhzm0gym=zzkt33JGRHFkCXGVg@mail.gmail.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
	<20241203091540.3695650-3-j2anfernee@gmail.com>
	<20241208172236.18441e64@jic23-huawei>
	<CA+4Vgc+veFb6hCP4A7mPH_uiUCnmbsa=guWySRekYj660osQyg@mail.gmail.com>
	<CA+4VgcLDQrTcTFjr7MYGtMYpqhzm0gym=zzkt33JGRHFkCXGVg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 12 Dec 2024 09:19:42 +1100
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 10 Dec 2024 13:47:25 +0800
Yu-Hsian Yang <j2anfernee@gmail.com> wrote:

> Dear Jonathan Cameron,
> 
> Sorry the above mail is not finished and just sent it.
> I would explain why we can't use bulk read sequential bytes in our chips.
Ah! I replied to previous. Let me see what you added.


> > > > +
> > > > +     guard(mutex)(&chip->access_lock);
> > > > +     err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value);
> > > > +     if (err < 0)
> > > > +             return err;
> > > > +     data[0] = (u8)value;
> > > > +
> > > > +     err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
> > > > +     if (err < 0)
> > > > +             return err;  
> > >
> > > Here I think you can use a bulk read as the registers are next to each other.
> > >  
> >  
> Generally, registers with 8 bits support Byte format, and registers
> with more than 8 bits support Word format.
> If transmission a Word command to a register that supports Byte
> format, the second byte will get 0xFF.
> Here, if we use regmap_bulk_read(), we would get first byte correct
> and second byte is wrong 0xff.
> 
> I use i2ctransfer command to demo it.
> root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r1
> 0xff
> root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x14 r1
> 0x0f
> 
> root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r2
> 0xff 0xff
> And if we read four bytes, you can see the first and third byte as we wanted.
> root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r4
> 0xff 0xff 0x0f 0xff
> 
> so we can't use bulk read directly since it would get a second byte 0xff.
> The safe method is to  use read byte twice.
That command does not do the same thing as regmap_bulk_read() will here.
It will issue a series of byte reads.

Jonathan


