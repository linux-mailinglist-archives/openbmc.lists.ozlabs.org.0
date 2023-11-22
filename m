Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C57F4E47
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 18:24:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jry1DxbP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb7QQ6VG8z3dBj
	for <lists+openbmc@lfdr.de>; Thu, 23 Nov 2023 04:24:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jry1DxbP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb7Pr5q1wz30K6
	for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2023 04:23:43 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-db406b5ceddso30214276.0
        for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 09:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700673820; x=1701278620; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NynfojDHOku/gIHF0Vtvo3+Mk/LM+8uGwtlY48AR6MM=;
        b=Jry1DxbPH/pTkV9Lf9wg8we0KQ/udy5+dyne0z76MSleLoRWykFU01bUrsocMlo3tJ
         hy491U3mwJp9OwqnMWbNTJKZ8uCcPs2E3MbgPoPmMVxhNnPhatBdnggf3OVVuAC7IOJm
         K77cm/m/ETTj9t/nOW1ZAneAxUM1kJbUaB1CUEnM/l470tyZzSfdCIO8Y6wEHZEqEiVS
         DBANjTWt2gUJEs+lhmwZPZDg0MHo1d36+r4HrXuPoWD4B93GVeysl7zV70szvlq3UQv/
         c7RXchsTYVqtOaNyIVcLYkn5+JJ+ISE3Tzx4ms+quVUKHY4q+yU80Rgp90dDzXOCQ/tK
         nRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673820; x=1701278620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NynfojDHOku/gIHF0Vtvo3+Mk/LM+8uGwtlY48AR6MM=;
        b=CXU5A+mZNXyTF4brm0+beqk62rY6umJQfPOPiM5oT5973/BGFMSRDuxNYFvdcHkUYu
         JkeZ8aKGNXWg28n6/vX/yAmx+t7JK3YQlfK353jJoGDi5THW5jskJB8KgLVkSfLLdt+B
         OqMZNyaf+apqwmRYU+MflI8Sy+XbfxIr3/a7HMFKDkcGgLfE9gZDH190PBfwsQQCgfMo
         Bmu7Nd7Mhwp0KvL68Pp6PoesHPCTQkV1Fu0J5ycRl7EnFg4fReWxUm/w7njAVu38MdFe
         cVM9xMfT9pKAIR8aeA6jyVx2TXhn1y1HVsZO6FPxal1G/tj9YgsSeB6ccuOPmP8AUxNZ
         skag==
X-Gm-Message-State: AOJu0YzOlLSWcRivPRMAwFyvPwSoUpjAaaL6HvL83cEFYSu8KIquOMm7
	eGGq5068CShoFGJ8NSchlHaMiEDrpimOGiqgn8E=
X-Google-Smtp-Source: AGHT+IHOpI5xPVk6Sar76TK2xFochhgo10/ziA9WnAM3iYe0K/JG8b7nGUI7tLK1eOpbXeUs9Wl63rjUYOi5f2szQMQ=
X-Received: by 2002:a5b:1cb:0:b0:d91:fdb:afd4 with SMTP id f11-20020a5b01cb000000b00d910fdbafd4mr2751108ybp.16.1700673819823;
 Wed, 22 Nov 2023 09:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
In-Reply-To: <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 22 Nov 2023 19:23:28 +0200
Message-ID: <CAP6Zq1gzAhp9BZNX1MOozUfQc82Vi_S==on5_nOfVfpvtgnN2g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alexandre.torgue@foss.st.com, tali.perry1@gmail.com, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com, benjaminfair@google.com, openbmc@lists.ozlabs.org, joabreu@synopsys.com, joel@jms.id.au, devicetree@vger.kernel.org, j.neuschaefer@gmx.net, robh+dt@kernel.org, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Russell,

Thanks for your comments.

On Tue, 21 Nov 2023 at 17:45, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Nov 21, 2023 at 05:17:33PM +0200, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.
> >
> > And modify MAINTAINERS to add a new F: entry for this driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> A few comments on this...
>
> > +#define IND_AC_BA_REG                0x1FE
> > +#define SR_MII_CTRL          0x3E0000
> > +
> > +#define PCS_SR_MII_CTRL_REG  0x0
> > +#define PCS_SPEED_SELECT6    BIT(6)
> > +#define PCS_AN_ENABLE                BIT(12)
> > +#define PCS_SPEED_SELECT13   BIT(13)
> > +#define PCS_RST                      BIT(15)
>
> include/uapi/linux/mii.h:
>
> #define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
> #define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
> #define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
> #define BMCR_RESET              0x8000  /* Reset to default state      */
>
> Look familiar? Maybe use the standard definitions for a standardised
> register?
>
> > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > +                      struct plat_stmmacenet_data *plat_dat)
> > +{
> > +     u16 val;
> > +
> > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +     val |= PCS_RST;
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +
> > +     while (val & PCS_RST)
> > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
>
> What if the PCS never clears its reset bit? Maybe use
> read_poll_timeout() ?
>
> > +
> > +     val &= ~(PCS_AN_ENABLE);
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +}
>
> Also, maybe it's time to require new stmmac platform support to start
> making use of the phylink PCS support rather than continuing to code its
> own?
>
> I notice, however, that you always disable inband signalling - please
> explain why. Also, what protocol does the PCS use when communicating
> with the PHY?
With disable inband signalling you mean disable auto negotiation? if
yes it is because the PCS sgmii is connected to the external phy AN
and is not working between the PCS and external phy.
accessing the PCS registers is indirect. The top 13 bits (bits 21-9)
of the offset have to be written to Indirect Access Base register
bits 12:0 before indirectly accessing the target register with the
offset of the bottom 9 bits (8:0) of the offset
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks,

Tomer
