Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE51C5FAC3B
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 08:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmlkg5Fd0z3c38
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 17:10:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q3qMJjd7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=tali.perry1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q3qMJjd7;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmljK5CMvz3bk8
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 17:09:09 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a26so29116611ejc.4
        for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2022 23:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+9XNPifPhFMInlVJCwLX4AaVIIMRwa+RQbkGTlKlhM=;
        b=Q3qMJjd7UgAEdf0Kg6Ll7geYQmJHPmTLWNNj643z/+bllr9PhTCyJIELDlBvE6xank
         KHeqMCApaX7rtEE2B6HEeAhjn7OGOH8Bx3WYNDkxVUWpxm3+jgYfCbHX2sas4PLYZPrP
         k1xWSJZDtGF1uf7rXinOupmPJBJGDRyME2uydH36hJH4sQ/vQr6gdJzZ7Y1jA5+CtKvY
         6jdG1F+0qgNTOfnbGR2jh0w0yXvwOKpKiuLHNrKrqbUg6bG340dqoAMIpDyVmrbMvATq
         hYH665wWe8sE6Nl+9qPx8N9o9w3u+1MXgTVCo2iPa0XQ112BzAGhdpkBENZC/MvYTv2n
         YwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+9XNPifPhFMInlVJCwLX4AaVIIMRwa+RQbkGTlKlhM=;
        b=BWuhK5O7s3PdvhL/e86EcwZRFZFXSTG2LBx0enAgArr643h2fWytpIOqe3F4iFd21t
         w2IJ/c4y842ZtCD4XTkQoe462BJGrTcOymftuIBXBbOtiUCFXR75XRG6THugXS+IKMoJ
         4EzIrYniX9LzfOcC2ElPZgqG8+eySH8auavfaTp50pD6t1GzLvnRCvAOUIsgW02taOTL
         HMeYs0jU27wuz2NLpuF8tV55KZ0B7JRNM2w3iUSu9CvDPJjrcR96bCtXEXGFWy7bFIHe
         Qezn3Qp7lEErx0CqtP7NJC66Ejs7SVEElPHPFxQBjuPyP/ICecFp/4564b5H/dx9kkxz
         81jw==
X-Gm-Message-State: ACrzQf1LMoulOeBTkCapR1VK7rmZZ10AYcqqrdbffBXprqjdN1ZVzu+/
	dfTS+qNyW40eakniCCAuOSrHZUHL0fHEtzCs51M=
X-Google-Smtp-Source: AMsMyM61TmlrbQ7ijBCqkJmNRbO2NMDrIkg20Na2jKpNofM4d4cA31RPB6PBDIjWucVwwnLIgc+8wbv+BixIlr7YWZE=
X-Received: by 2002:a17:907:7fa1:b0:782:7c58:5341 with SMTP id
 qk33-20020a1709077fa100b007827c585341mr17609058ejc.368.1665468546180; Mon, 10
 Oct 2022 23:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 11 Oct 2022 09:08:55 +0300
Message-ID: <CAHb3i=tzG0myrwHVvHCDNVf=yf8Ze2FhhX=7zdrhcaZAzqx9QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: npcm7xx: Group bank 0/1 registers together for readability
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

Thanks Jonathan!

On Sat, Oct 8, 2022 at 3:59 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> The unlabelled registers NPCM_I2CCTL4 to NPCM_I2CSCLHT overlap with the
> bank 1 registers below, and they are accessed after selecting bank 0, so
> they clearly belong to bank 0.
>
> Move them together with the other bank 0 registers, and move the
> unrelated definition of npcm_i2caddr down to keep the banked registers
> in one piece.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index 0c365b57d9572..9a7a2d0bf5765 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -106,7 +106,7 @@ enum i2c_addr {
>  #define NPCM_I2CCST3                   0x19
>  #define I2C_VER                                0x1F
>
> -/*BANK0 regs*/
> +/* BANK 0 regs */
>  #define NPCM_I2CADDR3                  0x10
>  #define NPCM_I2CADDR7                  0x11
>  #define NPCM_I2CADDR4                  0x12
> @@ -115,6 +115,20 @@ enum i2c_addr {
>  #define NPCM_I2CADDR9                  0x15
>  #define NPCM_I2CADDR6                  0x16
>  #define NPCM_I2CADDR10                 0x17
> +#define NPCM_I2CCTL4                   0x1A
> +#define NPCM_I2CCTL5                   0x1B
> +#define NPCM_I2CSCLLT                  0x1C /* SCL Low Time */
> +#define NPCM_I2CFIF_CTL                        0x1D /* FIFO Control */
> +#define NPCM_I2CSCLHT                  0x1E /* SCL High Time */
> +
> +/* BANK 1 regs */
> +#define NPCM_I2CFIF_CTS                        0x10 /* Both FIFOs Contro=
l and Status */
> +#define NPCM_I2CTXF_CTL                        0x12 /* Tx-FIFO Control *=
/
> +#define NPCM_I2CT_OUT                  0x14 /* Bus T.O. */
> +#define NPCM_I2CPEC                    0x16 /* PEC Data */
> +#define NPCM_I2CTXF_STS                        0x1A /* Tx-FIFO Status */
> +#define NPCM_I2CRXF_STS                        0x1C /* Rx-FIFO Status */
> +#define NPCM_I2CRXF_CTL                        0x1E /* Rx-FIFO Control *=
/
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  /*
> @@ -131,21 +145,6 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D =
{
>  };
>  #endif
>
> -#define NPCM_I2CCTL4                   0x1A
> -#define NPCM_I2CCTL5                   0x1B
> -#define NPCM_I2CSCLLT                  0x1C /* SCL Low Time */
> -#define NPCM_I2CFIF_CTL                        0x1D /* FIFO Control */
> -#define NPCM_I2CSCLHT                  0x1E /* SCL High Time */
> -
> -/* BANK 1 regs */
> -#define NPCM_I2CFIF_CTS                        0x10 /* Both FIFOs Contro=
l and Status */
> -#define NPCM_I2CTXF_CTL                        0x12 /* Tx-FIFO Control *=
/
> -#define NPCM_I2CT_OUT                  0x14 /* Bus T.O. */
> -#define NPCM_I2CPEC                    0x16 /* PEC Data */
> -#define NPCM_I2CTXF_STS                        0x1A /* Tx-FIFO Status */
> -#define NPCM_I2CRXF_STS                        0x1C /* Rx-FIFO Status */
> -#define NPCM_I2CRXF_CTL                        0x1E /* Rx-FIFO Control *=
/
> -
>  /* NPCM_I2CST reg fields */
>  #define NPCM_I2CST_XMIT                        BIT(0)
>  #define NPCM_I2CST_MASTER              BIT(1)
> --
> 2.35.1
>
