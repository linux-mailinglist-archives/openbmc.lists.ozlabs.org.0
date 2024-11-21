Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA119D49D6
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 10:22:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvCRV0Y0Zz3c5Y
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 20:21:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732180914;
	cv=none; b=DiYnnC8zJjCP2GJYzppoTkHyDbMLKRDawqxHn8dkBoGr7wdveF2k+3F8cAr/ZuMQ4naud2RP+lCLyiIr9qFZQmqrqxftD2nnPJSuxR4HZqZ7v7soHiZSlqwqVijlixjo+X6eW2QXOTwyLofLo5+1HTC8kkcP1T5XI/wX/8Uws3FaKchXeJyAV07/O2SM4T6VtlRquOFGeCiv7YgMX0/BlAGJIDn6R0kpgbl1OVirX8oOwiXeQMrBMyOakGbsDQvrs+2JChA0uM3zeLieb3RJRzzyFg9TXgWFHVDnSdWir+6kZupCc3aiskGnlu8uj78ax4JH4Yyy9J+f15Wakp2Zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732180914; c=relaxed/relaxed;
	bh=40p5hZwagywve/vODZdE9tqwRuvNJx0T8/82/xlk0co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXRg8fk39ZbSl4NmV2tb+LqVlYBlWK9rUj/WSyes+dBrh/umfTmTFyWnVkuavDQkrFA4nqAgZZgaPQ3IuR/fxWCKNfzyaMFz7S1+nL/OfdVc/zBp4mTyvfFjyksvTuVLvvW9lLuOgiYZvuVy1odeCBur+nNHiq464zTgkBXnMkMVMdCIuStdP7B9sZMPejhMRA+cYvUMq+vgor3SKFrRH2d2neEp4OvQwX1w8APbt/meN82Fm60ysgK8X/7KOCR8THbb83kjpycSOubUaVUU90+ZV0FC4RqFh44dNCn6URLDUegxRU/vDLI6uclHuaLsJ4HgDrSeiCah7o/5u8abIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mgSxXiRF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mgSxXiRF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvCRN16Nsz2xn3
	for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2024 20:21:50 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa3a79d4d59so98404966b.3
        for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2024 01:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732180902; x=1732785702; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40p5hZwagywve/vODZdE9tqwRuvNJx0T8/82/xlk0co=;
        b=mgSxXiRFXPyfp+Z3MGDhL2Zg0xX7qbQZzKVcVma1AZhHItDD5TU9dXzriavzda6jfK
         NtTXVTyEjufRpLvwdTqOheE7C88ZESshEsFeunyETv0/ZjdyS+4WHxzbzkOrmYaIoE8K
         KNJtKoajyffzGF+3ZY4VZ9Uegqm52YICeJ/SxvtBDQApeZdCGyiD1P9qpgyDOsjuocrx
         YUazSF1VkT6rAmbm3A/Y/1iiAdAINOXNJ10dxfQyot9aqna3OkWy7gjK7LH1ilJPE0Z6
         MqA7y80WyhHW/ELMR/Z3JHmOwH50Cq91ciGeFvpRlY99jTtWKzj5JPvQjH3DFbj3g15j
         f/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732180902; x=1732785702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40p5hZwagywve/vODZdE9tqwRuvNJx0T8/82/xlk0co=;
        b=TuAGNpnuVrLxLEtSIKI3dtRwcWHNGdCqEUDRYW3eMZMcs8H6HT5x3yYzew+9rgeix8
         TM/RoqPvpNFWRMwZbwbPShHNM+ucVS6W+q46MMIE5je5PNFmm8X+E0uY5V5y/zLc2gje
         U96PUwP+6fMKrAmQx1RNyjMd7fHTmMfuMCFllzN0Z4fGzizmSu0ssUsy0XjLP8un/led
         3gwiSZaghWL2JOfobMz7g26X1NPe2gz5HRyT1DOY3lMT4OKkaKfO8OocOAfb695L4igE
         ns4poQsFuqFB89MlGEARzpQNlF6p+aWBaV7QNEH3xZ4bigQYbMXY+JJFfiFQT9M603Ts
         zOqg==
X-Forwarded-Encrypted: i=1; AJvYcCX3B0ptLgWd0MvaW/lwbW3BjjaRjKeeNNOXuIYAgtTZb2cJ6Be6S1Im61I5/giAXdK0nuQqZtvV@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkwrPVNopkW1chtdAxu/ghvmbvzjQNgSyZPWJ11Upr6Xlts8en
	jQDgdZW4N28f8b0IWGwtymfmhUnQou6QrrZV635KEtaKnQnxK9xg29HraKP3lDlYpfrDe8Nj5dj
	CH3MnW2eiS3so9IjWB0B+9D2IOg==
X-Gm-Gg: ASbGnctIrIQgKq4q3Tnl7Iq+j5wWQyq9rJlDiviDzd9VFFmKSynjSjcM6tsGztTRO73
	QhVU2ChvAYtQRsjL3w6b3Q5sCSAeVqoPiE0F3/aRtsGwmTBJRGOMj0uk6NR9aREw=
X-Google-Smtp-Source: AGHT+IEhhFYGbTWv93AYlUkb+CCJ06skd59FfhS7MPLQWq2oHkHNO7ox+gkDwJLv2wvHkCT66jGcvxU3sqR96ik8vJ8=
X-Received: by 2002:a17:907:da7:b0:a9e:8574:e154 with SMTP id
 a640c23a62f3a-aa4dd749ec1mr588963266b.59.1732180901738; Thu, 21 Nov 2024
 01:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
 <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com> <cexpymszobfl7676acibp474eq3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo>
In-Reply-To: <cexpymszobfl7676acibp474eq3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 21 Nov 2024 17:21:30 +0800
Message-ID: <CACD3sJZ3B93-bb9e=cmyd3awS2JteE1xRsf_-zokttg=Ykef9g@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your reply.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> Sorry for the late reply!
>
> ...
>
> > > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_ad=
apter *adap, struct i2c_msg *msgs,
> > > >       }
> > > >
> > > >       npcm_i2c_init_params(bus);
> > > > -     bus->dest_addr =3D slave_addr;
> > >
> > > We can now get rid of slave_addr. It's just used in
> > > npcm_i2c_master_start_xmit(). Right?
> >
> > Yes, slave_addr is just used as the link
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L2182
> > suggests with this patch.
>
> What I mean is that slave_addr now is completely unused. We
> declare it, we initialize it to msg0->addr and it stays like
> this.
>
> What I'm suggesting is to remove it completely.
>

Sorry that I might not describe it clearly in previous discussion
thread. slave_addr is passed to npcm_i2c_master_start_xmit() as
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L2182
suggests. If slave_addr is removed, may I use "(bus->dest_addr &=3D
~I2C_M_RD)" to replace the slave_addr parameter to
npcm_i2c_master_start_xmit()?

> Andi

Thank you.

Regards,
Tyrone
