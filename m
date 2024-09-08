Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699259706C0
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 12:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1mw51h76z3cGS
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2024 20:50:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725792641;
	cv=none; b=bCZKM/MKwYbXlx5DW7py4mzLEsCaRVWxjMLmRmMc3FmNBUSC5ocQuc/Dn59dXi5U7MxXAvJkhJchiVgDTfIDJ5kl2LPTYWAlyQKiPr+ial1OyJfCfbhLy3CMH/2byWmiQErsOnPuAZV9WdhUZJ+8D4G5H/0e4q4SD+OqJSlCpE2fvvWKitGJQ6LoV+uhUivHXIhLCHE/dhKXcKCsOV19J8rQDxn9UfcvjQh3wObFMvwoqW5RVAmI/GbaNfna7FKW8nLi9rzw/WMpGibPsy+fIsWm5SmoQ3ubWTVDLhJp7uAEcGLWSmSlLliCoFV8cCYMZzWS6znCOyRV8cwCz7P5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725792641; c=relaxed/relaxed;
	bh=X8UC9BcNKMNBnj+FF0WoUDB/hfX7jIiecCwc+cDfBDY=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=cUqcOdqWjuBvPwVrZQjcc31WpLlpfJE257pbiPnke7e52dPqtk+EcIZr8eIH0vsENIllLhVVzURNYJ0pRuoqho6/iwc+OKNDM8/+FStHFU9kPY9aTFjXEPcN7m/3zHVW/UEOTll3wnJV0FGcG5k7V85df501DdiIU3ittt8n1zbkSiCxjoFb1cyBXtsrBLGQpJym9Uw8s5ApKu2rp82a3GCpXyjEVpYyPeJOVGE7NCSK6/TJL2dRcrYRlq27f53uYkuCJyut2+p3hCv8vNg0ahSxhypQhlRQaVjuD/l3AbO8rhMDbrpPO+yQr7/j6uSXkQUqvdh3mL9v1Gz76KKD/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tp9erilO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tp9erilO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1mw10Qcjz2xf2
	for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2024 20:50:40 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c3ca32974fso3859650a12.3
        for <openbmc@lists.ozlabs.org>; Sun, 08 Sep 2024 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725792638; x=1726397438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8UC9BcNKMNBnj+FF0WoUDB/hfX7jIiecCwc+cDfBDY=;
        b=Tp9erilOWIPSBGcz7rF7MUpQGjr++ybFZ3N1s0Uj4RaLK0d2hS9v7CEzDSR1TIY/60
         9s0YcuM/LM3FrFi7BuUBuk+iM0C/UlIhMbz0QOHwTnqsizOh9EXgGSckafBIlRLK5jEv
         HMii5at4FX07NN3seAmEG8CRCEHu80gKxPWZYb3NPX8b8EpUHTL8wa6k/zk9ptKFCRaN
         xI5ufP2M49o7Gf9jzWCGEGf3Nf3uvGArqpi7o/JZ1mHjW3GsO4/RtWY7aiuxltPjfe3g
         KxEuDJ5PpEAMsslxppEyqBiVRpg+SWidbtRnKYulgug4Wv9vX8yJ7lXXRl41gz85FPoc
         GFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725792638; x=1726397438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8UC9BcNKMNBnj+FF0WoUDB/hfX7jIiecCwc+cDfBDY=;
        b=N+gTg0rIYIdFinSqDBFjIMJVpUMm13r7Ew2OYyNSM/mr62o1w8436fOR+AmnQqPGrN
         sLzeHGU21eA5DGT++c1cU53jjwehuU1d6Oo7k3zH+JiY9NbBTgUUqHD4wJhALGXv5gRy
         t3MD5YHt06K27GcCsn3I47CjbKxtsiuHLqw+AlEUQHSjkRkcs3GzfoZDC5z972ob4vsb
         M8RSTX3abNwW2ikVWc+ACePhvrXoIhIn9dNAr6AZQh9wFY6JUTD/DjrAIzF+heog3cuK
         UO8flV2C3I9X3pExOY36o8ifvYbhp+2LSyyQJo8FN2rGPON5CV6ZTma+oyivrZZqevgU
         lWDg==
X-Forwarded-Encrypted: i=1; AJvYcCWaNrbaohRvoNuDR8q6/42u/EN+87MyV+68o355NKgKz4JhOJVg+rNwm6nOzBx3YrO88oTZXXyI@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy++kZUO6QWhpcvegsMhsnZP7on0fPn1Od6/UuwgeTbhwPqJy1P
	uTGzdwq5Yd4pQPpThb5Uswz+kcXjWaWXMsveWg53ZHNCT/VC5T/kFVP/IxJkXxy0SrnCZ88JNeO
	eJFAenFnJQ9PX7FDxk+xxXHfvniN6FJq3IqQ=
X-Google-Smtp-Source: AGHT+IHjNDzrG+Hu8Kq74TDaYMI626cC24Kdi6p4FMuvK+r3YMdG+pdfZ2q+Ju+rX5OhSWYBrVs/4g1tic81Vld1G6U=
X-Received: by 2002:a05:6402:5309:b0:5c2:4404:a193 with SMTP id
 4fb4d7f45d1cf-5c3dc7c5012mr4781758a12.34.1725792637172; Sun, 08 Sep 2024
 03:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-8-kfting@nuvoton.com>
In-Reply-To: <20240830034640.7049-8-kfting@nuvoton.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:50:26 +0300
Message-ID: <CAHb3i=txqvDpNXSRkke3SXZKCUAnapODGczO+GCJkQOKpgcTCA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] i2c: npcm: Enable slave in eob interrupt
To: Tyrone Ting <warp5tw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, Charles Boyer <Charles.Boyer@fii-usa.com>, andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, JJLIU0@nuvoton.com, wsa@kernel.org, tali.perry@nuvoton.com, Vivekanand Veeracholan <vveerach@google.com>, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

On Fri, Aug 30, 2024 at 6:49=E2=80=AFAM Tyrone Ting <warp5tw@gmail.com> wro=
te:
>
> From: Charles Boyer <Charles.Boyer@fii-usa.com>
>
> Nuvoton slave enable was in user space API call master_xfer, so it is
> subject to delays from the OS scheduler. If the BMC is not enabled for
> slave mode in time for master to send response, then it will NAK the
> address match. Then the PLDM request timeout occurs.
>
> If the slave enable is moved to the EOB interrupt service routine, then
> the BMC can be ready in slave mode by the time it needs to receive a
> response.
>
> Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
> Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index cac4ea0b69b8..5bdc1b5895ac 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1781,6 +1781,12 @@ static int npcm_i2c_int_master_handler(struct npcm=
_i2c *bus)
>             (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
>                        ioread8(bus->reg + NPCM_I2CCST3)))) {
>                 npcm_i2c_irq_handle_eob(bus);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +               /* reenable slave if it was enabled */
> +               if (bus->slave)
> +                       iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR=
_SAEN,
> +                                bus->reg + NPCM_I2CADDR1);
> +#endif
>                 return 0;
>         }
>
> --
> 2.34.1
>
