Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1557F60EC
	for <lists+openbmc@lfdr.de>; Thu, 23 Nov 2023 14:59:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aBr88z9d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbfqP2k33z3dTR
	for <lists+openbmc@lfdr.de>; Fri, 24 Nov 2023 00:59:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aBr88z9d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbfpn2k9Kz3dLG
	for <openbmc@lists.ozlabs.org>; Fri, 24 Nov 2023 00:58:40 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d30d9f4549so535793a34.0
        for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2023 05:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700747917; x=1701352717; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6HDmUWHoV/d+5kwt+BMpRMCcQ4EU+NPmBrVnqKEpBkk=;
        b=aBr88z9dYXKSial3nThQ0H5rlNCpUfab+rWjNKchsXM7H5QMJDGwYrad5VnnQxds+R
         YPYktNUIMl0yY3bTl62jM0kotJHq0g0DHCzeh73OAmZSrgHoLl5NLjLsk+iDwQ325jE1
         +wijwh+5oFBosLW/R40iuMT3a06OnaYZCUhc574qbNdihpNtUNPTCaEJGWy//RgfY31v
         zJ8qJqo/VvrFD7+opiraVGv6FStJg0MegRcPNZe4o+fVE2ZXB7woBonaQayuo4hZjd0m
         E4/5pJCx4u5TJ7KfMNrhmoNgux7Wm8mFTFCaN+GT5f7ZWzYry0Zm3GD4B/mqDKD4xGMs
         U83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700747917; x=1701352717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HDmUWHoV/d+5kwt+BMpRMCcQ4EU+NPmBrVnqKEpBkk=;
        b=ow6uXCuzocq03HAgzpYhdiWBYCN1vi90lEouLGF4DzTuwI1g1OmGnn8Bg4mlu0fBer
         tzNKxsDLwg44ldWMXMxrYmlPykKGLc1/UIF07YxjTP1Og4g1FsG1CA84LJPeopCvBE44
         sGs7GvkVYLW8nfIC5WA7xyyYipYcZuvQGLr5FtNFMVv6fk/9gx51Y7Wi2cQmvUUHsdtn
         GILoH4eHLhQW5GQOCeK0msLbTKppQLzw9oXdPHEwWcCkzZIqUCzTbKi2LR7ommkg+I+T
         mtDhibyXULP8TfgW/JtHZzDpWkHb2fxVbkPaGPEhRXVhNIXYQfsmnpuvPh08DEW/3csS
         XGvg==
X-Gm-Message-State: AOJu0YwULKZ4hecjTIvXXA0rQU5qFRaBe5r0GMX3istsVPKZlFwmfPQw
	6dDlQaLB1shHtdQZnjRhP0FyTaUNZBwU4VrGUGwPOCCaJ7k=
X-Google-Smtp-Source: AGHT+IGZwjwRkgSJ7EnlxLUgRSgKWDT8jC/rPzRQg0Kq3WiN+CVcYva0UFJf/nOdcGZASDUiq8QSYhmkdlzne0lzNs4=
X-Received: by 2002:a25:3409:0:b0:da0:3535:41f4 with SMTP id
 b9-20020a253409000000b00da0353541f4mr5712007yba.7.1700747426043; Thu, 23 Nov
 2023 05:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch> <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
In-Reply-To: <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 23 Nov 2023 15:50:14 +0200
Message-ID: <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
To: Andrew Lunn <andrew@lunn.ch>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, robh+dt@kernel.org, tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com, joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Wed, 22 Nov 2023 at 20:45, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 22, 2023 at 07:50:57PM +0200, Tomer Maimon wrote:
> > Hi Andrew,
> >
> > Thanks for your comments
> >
> > On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > > +                      struct plat_stmmacenet_data *plat_dat)
> > > > +{
> > > > +     u16 val;
> > > > +
> > > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +     val |= PCS_RST;
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +
> > > > +     while (val & PCS_RST)
> > > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +
> > > > +     val &= ~(PCS_AN_ENABLE);
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +}
> > >
> > > Is this a licensed PCS implementation? Or home grown? If its been
> > > licensed from somebody, it maybe should live in driver/net/pcs, so
> > > others can reuse it when they license the same core.
>
> > we are using DWC PCS, I don't see support for DWC PCS and I am not
> > sure it is supposed to be supported at /drivers/net/pcs
>
> I've not followed the naming used by Synopsys. Is DWC PCS the same as
> XPCS? Does Synopsys have multiple PCS implementations?
>
> > I do see a patch set to support DWC PCS but I don't think it answers my needs
> > https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/
>
> I _think_ this patch eventually got turned into
> driver/net/pcs/pcs-xpcs.c
>
> What exactly does it not do for you?
Thanks for pointing me to Synopsys (DWC) PCS in pcs-xpcs.c I need to
check if the driver follows all our SGMII needs
>
>      Andrew

Best regards,

Tomer
