Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4AC7F4EBE
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 18:51:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PfS7pJZI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb82827cXz3cW1
	for <lists+openbmc@lfdr.de>; Thu, 23 Nov 2023 04:51:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PfS7pJZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb81Y68YBz2xHK
	for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2023 04:51:11 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5c8c26cf056so161167b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700675469; x=1701280269; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TxnpKs2F+HZNYkXf/Y5BgrPY0hki8e46Z6NdLZXo0Do=;
        b=PfS7pJZI9+cRG7WI11AiTWxIA0XdjAsSZPL1xVpz7vpiYkWRFTSAwXAAlTDpXXRwKA
         XwQLNZ2W86Cu2KK4Z4jSljj5b5UVYKaocACX46EZVUiUsLCFEEaPukW7Uq+XJnieuRns
         VPVsvsfMzBnCQtkITJWh8L1D9r+Obz2Id0sU7I6/xcym+Xl9s6ADJizGaXY1MOK39mq9
         pxpZprnICBdqrSNInJVK295mlohNaV9pIlsNDmK8N8MyP9372m2+6+eLZl0NRFNeSK6B
         Smq2mRagiTvaG0GNyYuG0BzuXj25AIhvGZaw+ZKVwS/BGEI6tg6EISJUNdAfGHa3vPzV
         J2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700675469; x=1701280269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxnpKs2F+HZNYkXf/Y5BgrPY0hki8e46Z6NdLZXo0Do=;
        b=P0VON1Zck+OSFammYIt7xZhoO9220zQ35NqMrDXlJfpC3YIr8Gu/DUwCJWKE2CA8dK
         XITH1NBqLwpemWSuKLw4pwKynHSuZFrUt6La38KJi5nc8vqwlwIEXlvAUip60owNoYJ3
         /DZyfJg3N0PvAbdk1S06u4d9dWX6rppObsD+P2uUVkZO3fWKzs7OzJndDKUdL+9KsG7B
         Jb0fpGtwUvDUcPfypcAX36Bel6WoU1hfbtOYPti1k38w8kUguYYqqbdGTLdMwk3SAcMy
         rUXLnTtXNvqoI0gudzhgn8dBsEXXaPQiLp6GiWWwFda6/rNwEqjNGXr84PV+RzE7wvO5
         QwUw==
X-Gm-Message-State: AOJu0YzM2RLZs9U8HnLLMvaE+mngv1oPXpydLsUDD6VJiSD18cfNhoQs
	FCAr8PHYc/S7PxH+4SgBWF324dtN93RcKZ+XETs=
X-Google-Smtp-Source: AGHT+IFVH/BFWt02BJRt89HCYBEkZm6l8N7OMZmIj2n4mUUQxZeU4z4Xe9RaA6X/2NVtoKOkfpeHPoOXYUDC9+dm0Xc=
X-Received: by 2002:a81:9404:0:b0:58c:b8b4:2785 with SMTP id
 l4-20020a819404000000b0058cb8b42785mr3671430ywg.45.1700675468737; Wed, 22 Nov
 2023 09:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
In-Reply-To: <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 22 Nov 2023 19:50:57 +0200
Message-ID: <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
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

Thanks for your comments

On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
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
> > +
> > +     val &= ~(PCS_AN_ENABLE);
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +}
>
> Is this a licensed PCS implementation? Or home grown? If its been
> licensed from somebody, it maybe should live in driver/net/pcs, so
> others can reuse it when they license the same core.
we are using DWC PCS, I don't see support for DWC PCS and I am not
sure it is supposed to be supported at /drivers/net/pcs
I do see a patch set to support DWC PCS but I don't think it answers my needs
https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/
>
>        Andrew

Thanks,

Tomer
