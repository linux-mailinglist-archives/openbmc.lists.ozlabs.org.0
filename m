Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89175BEC4A
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f5Xq1vchzDqGJ
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:05:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="aPeg6ccD"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f5X83Z0RzDqBP
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:04:40 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id c3so1537507qtv.10
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ak/CzoOQg1X/wQR+t/4VFV5l8lR05/WvvSzM/DEiV14=;
 b=aPeg6ccDyjzJgYnfQ4BTtzarTtnnsAAjd19pxw6fz2ywbfYw2Q8X9HWLfPjs2L2jHx
 gV4b6FUnOiPvPgyDsEvCEHcWcNur/GBwaO0OHdPzs83F0rIuny5FpxqDGwK/wEjvpE47
 2dhwhQnut2DI+Nip2DDmAjFth+SdwnR5efjrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ak/CzoOQg1X/wQR+t/4VFV5l8lR05/WvvSzM/DEiV14=;
 b=IBxwe12RCrbX0H6oQI4qRfVLEwlh/BmYXNbJGe1uxaJPRm/hgWiw+9/+opuJI5hqEU
 +YrL8o+8V29rnu/PmBdlIaC/LjhlxtfI5MT7+9SefteL65vTbtPfVWYIRcjkQLwEINwQ
 KhMTvWngdfYH+c/Lbq76FYvwa3Q211YcqFutxrLydIqlGnyD/EM8DdexF7BbauMi8RU8
 xL7UnbCwxIx7r53mUoE0KBP5M7Zt1GIK/QrSl1MYiJOo4M7CwmF4qBziRSWj0Kqexybi
 9ndVPi4yaF54XTfRf7gypnvY9vvSZ/5DVcyaAp3beDAc8/j84a6w+/hovEwDWrpCFw5G
 g5XA==
X-Gm-Message-State: APjAAAVwqsAN2633bl3z8fYKyCJlyHMZ3hq/fqA+xyFN0+RWzQ/4pEJu
 lB4OXp/ia0YFJ09PZ+N4eJM18t/zuIR7ciLsSXBG6w==
X-Google-Smtp-Source: APXvYqyivgmX4ULme7rrV3pBtgQmGFKcvPe3ilvBTCYS1Zqy6xbT8oV3DxcxKHFjOu8gTr59+Svdh0nlb4j72m+dIAo=
X-Received: by 2002:ad4:55b2:: with SMTP id f18mr1463850qvx.16.1569481474887; 
 Thu, 26 Sep 2019 00:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-14-clg@kaod.org>
 <233401e3-9b67-42e8-b9aa-bbbef424171a@www.fastmail.com>
 <2d6ac3ae-24d0-8949-19fd-569c6096fbbd@kaod.org>
In-Reply-To: <2d6ac3ae-24d0-8949-19fd-569c6096fbbd@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 07:04:22 +0000
Message-ID: <CACPK8Xe3idCTK9XCg-9_t9xhUjcfqBjNNuusA014X5R4ZrZTig@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 13/13] mtd: spi-nor: aspeed: add support for
 AST2600 training
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Sep 2019 at 06:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 26/09/2019 04:14, Andrew Jeffery wrote:
> >
> >
> > On Wed, 25 Sep 2019, at 22:12, C=C3=A9dric Le Goater wrote:
> >
> > Would prefer some description here, this patch gets complex. At least f=
or me,
> > probably because I'm not familiar with the flash training routine.
>
> Joel, Could you please squeeze in this in the commit log ? I can resend
> just that patch if you prefer, once you have pushed the series. This is
> just an optimization.

Done.

>
> Thanks,
>
> C.
>
>
> The training consists in finding the appropriate read timing delays for
> the HCLK dividers 2, 3, 4, and 5 and store the results in the Read Timing
> Compensation register. The previous SoC AST2500 and AST2400 were covering
> a broader HCLK range [ 1 - 5 ] because the AHB frequency was lower.
>
> The algo first reads a golden buffer at low speed and then performs reads
> with different clocks and delay cycles settings to find a breaking point.
> This selects the default clock frequency for the CEx control register.
> The current settings are bit optimistic as we pick the first delay giving
> good results. A safer approach would be to determine an interval and
> choose the middle value. We might change the approach depending on the
> results on other systems.
>
> Only CS0 is taken into account for the moment.
>
> >
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>  drivers/mtd/spi-nor/aspeed-smc.c | 68 +++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 68 insertions(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> >> index 48164d819a37..e9bc89755912 100644
> >> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> >> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> >> @@ -142,6 +142,9 @@ static u32 aspeed_smc_segment_end_ast2600(
> >>  static u32 aspeed_smc_segment_reg_ast2600(
> >>      struct aspeed_smc_controller *controller, u32 start, u32 end);
> >>
> >> +static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip
> >> *chip,
> >> +          u32 hdiv, const u8 *golden_buf, u8 *test_buf);
> >> +
> >>  static const struct aspeed_smc_info fmc_2600_info =3D {
> >>      .maxsize =3D 256 * 1024 * 1024,
> >>      .nce =3D 3,
> >> @@ -149,7 +152,11 @@ static const struct aspeed_smc_info fmc_2600_info
> >> =3D {
> >>      .we0 =3D 16,
> >>      .ctl0 =3D 0x10,
> >>      .timing =3D 0x94,
> >> +    .hclk_mask =3D 0xf0fff0ff,
> >> +    .hdiv_max =3D 2,
> >>      .set_4b =3D aspeed_smc_chip_set_4b,
> >> +    .optimize_read =3D aspeed_smc_optimize_read,
> >> +    .calibrate =3D aspeed_smc_calibrate_reads_ast2600,
> >>      .segment_start =3D aspeed_smc_segment_start_ast2600,
> >>      .segment_end =3D aspeed_smc_segment_end_ast2600,
> >>      .segment_reg =3D aspeed_smc_segment_reg_ast2600,
> >> @@ -162,7 +169,11 @@ static const struct aspeed_smc_info spi_2600_info
> >> =3D {
> >>      .we0 =3D 16,
> >>      .ctl0 =3D 0x10,
> >>      .timing =3D 0x94,
> >> +    .hclk_mask =3D 0xf0fff0ff,
> >> +    .hdiv_max =3D 2,
> >>      .set_4b =3D aspeed_smc_chip_set_4b,
> >> +    .optimize_read =3D aspeed_smc_optimize_read,
> >> +    .calibrate =3D aspeed_smc_calibrate_reads_ast2600,
> >>      .segment_start =3D aspeed_smc_segment_start_ast2600,
> >>      .segment_end =3D aspeed_smc_segment_end_ast2600,
> >>      .segment_reg =3D aspeed_smc_segment_reg_ast2600,
> >> @@ -1101,6 +1112,63 @@ static int aspeed_smc_optimize_read(struct
> >> aspeed_smc_chip *chip,
> >>      return 0;
> >>  }
> >>
> >> +#define TIMING_DELAY_DI         BIT(3)
> >> +#define TIMING_DELAY_HCYCLE_MAX     5
> >> +
> >> +static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip
> >> *chip, u32 hdiv,
> >> +                                          const u8 *golden_buf, u8 *t=
est_buf)
> >> +{
> >> +    struct aspeed_smc_controller *controller =3D chip->controller;
> >> +    const struct aspeed_smc_info *info =3D controller->info;
> >> +    int hcycle;
> >> +    u32 shift =3D (hdiv - 2) << 3;
> >> +    u32 mask =3D ~(0xfu << shift);
> >> +    u32 fread_timing_val =3D 0;
> >> +
> >> +    for (hcycle =3D 0; hcycle <=3D TIMING_DELAY_HCYCLE_MAX; hcycle++)=
 {
> >> +            int delay_ns;
> >> +            bool pass =3D false;
> >> +
> >> +            fread_timing_val &=3D mask;
> >> +            fread_timing_val |=3D hcycle << shift;
> >> +
> >> +            /* no DI input delay first  */
> >> +            writel(fread_timing_val, controller->regs + info->timing)=
;
> >> +            pass =3D aspeed_smc_check_reads(chip, golden_buf, test_bu=
f);
> >> +            dev_dbg(chip->nor.dev,
> >> +                    "  * [%08x] %d HCLK delay, DI delay none : %s",
> >> +                    fread_timing_val, hcycle, pass ? "PASS" : "FAIL")=
;
> >> +            if (pass)
> >> +                    return 0;
> >> +
> >> +            /* Add DI input delays  */
> >> +            fread_timing_val &=3D mask;
> >> +            fread_timing_val |=3D (TIMING_DELAY_DI | hcycle) << shift=
;
> >> +
> >> +            for (delay_ns =3D 0; delay_ns < 0x10; delay_ns++) {
> >> +                    fread_timing_val &=3D ~(0xf << (4 + shift));
> >> +                    fread_timing_val |=3D delay_ns << (4 + shift);
> >> +
> >> +                    writel(fread_timing_val, controller->regs + info-=
>timing);
> >> +                    pass =3D aspeed_smc_check_reads(chip, golden_buf,=
 test_buf);
> >> +                    dev_dbg(chip->nor.dev,
> >> +                            "  * [%08x] %d HCLK delay, DI delay %d.%d=
ns : %s",
> >> +                            fread_timing_val, hcycle, (delay_ns + 1)/=
2,
> >> +                            (delay_ns + 1) & 1 ? 5 : 5, pass ? "PASS"=
 : "FAIL");
> >> +                    /*
> >> +                     * TODO: This is optimistic. We should look
> >> +                     * for a working interval and save the middle
> >> +                     * value in the read timing register.
> >> +                     */
> >> +                    if (pass)
> >> +                            return 0;
> >> +            }
> >> +    }
> >> +
> >> +    /* No good setting for this frequency */
> >> +    return -1;
> >> +}
> >> +
> >>  static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
> >>  {
> >>      struct aspeed_smc_controller *controller =3D chip->controller;
> >> --
> >> 2.21.0
> >>
> >>
>
