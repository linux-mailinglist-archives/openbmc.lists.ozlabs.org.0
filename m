Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863497712E
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 21:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Rs21Q3tz3cH0
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 05:12:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726168338;
	cv=none; b=knYBE6UvXPPcDiw22djcJ+J8I2dFI4ySb5NyqnU2QHgryeH5I/prh9Ttj8l7yGfMwQSd3AV/5zwfK2WxWLQTOlSXEt1QwBiX3Y+wKa1KcmFulkDaddxF+ahVRQ5ExqeI3qTRxNlwq0xCDVY1OW8+eaS5roUnPpWjk+sZUxziRDNkuJeDPM6/bf+YQ8kWw2aNqiHtX7r7qOC9HiKF4wq9TA2Zs2GOFKYYGSlYFcJMTllQDvziYQ2ZA3MMvctvP7vPrC4hmboeuv+vhlFxlnrWJoOPh9ODEbuks0wnBx9n7t29wLiIg92XO/6P/srMML9k79WIHCeTm0sNfzd7f9SS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726168338; c=relaxed/relaxed;
	bh=8NMJSqTKRUoPdKRSlr4boJM9fnxyrG/NqcM0uOw1EuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1tQmf4o+bc1hdnY1LxqaypJxaCqtFgtssEawhgCZCHse0DliTN3g9EakTb9IpGInQjfJo/QYHQvZZ4eHHR+OPgKdSJRFNuzKWiU3ck/0TA09mtOLr5OLWTP8E4QyOFQ7a4CBIrRXqmU4dSBS+LIl2ANvIq8g3DfM6s/Ry9v0Mo7ZOx3Hq6cjQ3l3HvZCEefKblxGJvclgmtk2eJHE1VokLYBWwM4RGzopZuCwytK5/1CJFmO9va26Co3Cg1glIiNZp0iyCpnGAzB4GUu0sMSraxt9YJDN9/Yu//QE+VW70HLqq9zx75LxigvzGE4UDJiXFJg2+gBEr0GfyZuAmsAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPnNaEzV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPnNaEzV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Rrx2zkzz2yGh
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 05:12:16 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6b8f13f28fbso10400977b3.1
        for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726168334; x=1726773134; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8NMJSqTKRUoPdKRSlr4boJM9fnxyrG/NqcM0uOw1EuI=;
        b=gPnNaEzVph3ZYz/q8R4UqTtFMnwGy+f/iyQ6mcwyqcRPt9F8UM9JKDR/6Iajg3WghK
         53gizpPg71zx4wx9VVO8mLwmEh7ZS/YjEiV4TZJhaDS2PPFbIu8Ww/bo+A7XlUKVvsPC
         FGx1JzpRtloGIVBhrdozixBthCpMXOuN35Hq0O1KURzCe+0vHvcmr9cGuKxY00slM1HO
         nsrtCjWTJNbFqebwdZDhpES2/AD3we2HHsLB65OMrqUiIt2mXLoXevvu5FkRRMF9S/Py
         tX5XKZWX+4IcaBwqJEv8eYFYMPMsIrq0614tabqUHdtwfknjk+PBpetkvuj3dEzK7PYS
         TBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726168334; x=1726773134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NMJSqTKRUoPdKRSlr4boJM9fnxyrG/NqcM0uOw1EuI=;
        b=LwePeygVJpOaCOeVeOzy4+uZLXSxtmUGADTClBKwL9tJGk7RqtYF9gvGWva7yBzajB
         e6LWLhcLcH96NpuE8pLzZuGUdS9HgoU7mAVmFoZ0h6+UoJ1TxUpjiSmrU7a3tL18cJyA
         YeqHYSW0zc1NSxBD7KGffi8StDd39pg1sX/2SyC9wXQLRo3dt196AOdX462VgyrJJyVC
         uGnWavrCPQu84Y4B/qfIbFltCK18RIWEMFyYLBl3Xx0Txz6OG8uI1fhhUFIz4QShZrqT
         R6b3wsEzFwCnLj9SKRtLDWuNxCJ4zopr6w7GXVmPC9rIYVbDBV0QqQu2NnZuFFKY+rfz
         /gkA==
X-Forwarded-Encrypted: i=1; AJvYcCV/6kaAtt2pIRFWNEeK7KI3RVRHUXxyi/H7dC5R9b16EK/fE59Glnu1rALL88+vMUDSeUZTzQSm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBbRV/X962sY/W0AUJLGZFVT4Cq3Yz8dxu5Qc13w3POuh2rMr9
	lIDlAuEreTDtMiWJknaMDeSy76DYCG/J9Kt8qUir5IpYyS6340OrYxG2bMLaDC86sVjr89in+5D
	4Xnoqh9ykKIhS7Xekgn2UOXOdoBI=
X-Google-Smtp-Source: AGHT+IFBy8scuJ/GQzRK0WT6GhaBlpWir+n42OWFvqw4XJlosh/vu2KEkzFqruhfOcy5stCbRSEDcHJFs8xIaWovjjU=
X-Received: by 2002:a05:690c:4a02:b0:6b5:916d:597 with SMTP id
 00721157ae682-6dbb6b236d4mr41736117b3.22.1726168333942; Thu, 12 Sep 2024
 12:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240815150255.3996258-1-tmaimon77@gmail.com> <20240815150255.3996258-3-tmaimon77@gmail.com>
 <d003cb854f9aea30c7d26b4d2b7f50cf467bf225.camel@pengutronix.de>
In-Reply-To: <d003cb854f9aea30c7d26b4d2b7f50cf467bf225.camel@pengutronix.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 12 Sep 2024 22:12:03 +0300
Message-ID: <CAP6Zq1go+hxzxaF+ACv-Rhm+=oh7ooLKune6jJtKRGfz9onT7A@mail.gmail.com>
Subject: Re: [PATCH RESEND v27 2/3] reset: npcm: register npcm8xx clock
 auxiliary bus device
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Philipp,

Thanks for your review.

Done in Version 28 :-)

Best regards,

Tomer


On Thu, 12 Sept 2024 at 18:18, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Do, 2024-08-15 at 18:02 +0300, Tomer Maimon wrote:
> > Add NPCM8xx clock controller auxiliary bus device registration.
> >
> > The NPCM8xx clock controller is registered as an aux device because the
> > reset and the clock controller share the same register region.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > Tested-by: Benjamin Fair <benjaminfair@google.com>
> > ---
> >  drivers/reset/Kconfig               |  1 +
> >  drivers/reset/reset-npcm.c          | 74 ++++++++++++++++++++++++++++-
> >  include/soc/nuvoton/clock-npcm8xx.h | 16 +++++++
> >  3 files changed, 90 insertions(+), 1 deletion(-)
> >  create mode 100755 include/soc/nuvoton/clock-npcm8xx.h
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 67bce340a87e..c6bf5275cca2 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -157,6 +157,7 @@ config RESET_MESON_AUDIO_ARB
> >  config RESET_NPCM
> >       bool "NPCM BMC Reset Driver" if COMPILE_TEST
> >       default ARCH_NPCM
> > +     select AUXILIARY_BUS
> >       help
> >         This enables the reset controller driver for Nuvoton NPCM
> >         BMC SoCs.
> > diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> > index 8935ef95a2d1..aa68b947226a 100644
> > --- a/drivers/reset/reset-npcm.c
> > +++ b/drivers/reset/reset-npcm.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  // Copyright (c) 2019 Nuvoton Technology corporation.
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > @@ -10,11 +11,14 @@
> >  #include <linux/property.h>
> >  #include <linux/reboot.h>
> >  #include <linux/reset-controller.h>
> > +#include <linux/slab.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> >  #include <linux/of_address.h>
> >
> > +#include <soc/nuvoton/clock-npcm8xx.h>
> > +
> >  /* NPCM7xx GCR registers */
> >  #define NPCM_MDLR_OFFSET     0x7C
> >  #define NPCM7XX_MDLR_USBD0   BIT(9)
> > @@ -89,6 +93,7 @@ struct npcm_rc_data {
> >       const struct npcm_reset_info *info;
> >       struct regmap *gcr_regmap;
> >       u32 sw_reset_number;
> > +     struct device *dev;
> >       void __iomem *base;
> >       spinlock_t lock;
> >  };
> > @@ -372,6 +377,67 @@ static const struct reset_control_ops npcm_rc_ops = {
> >       .status         = npcm_rc_status,
> >  };
> >
> > +static void npcm_clock_unregister_adev(void *_adev)
> > +{
> > +     struct auxiliary_device *adev = _adev;
> > +
> > +     auxiliary_device_delete(adev);
> > +     auxiliary_device_uninit(adev);
> > +}
> > +
> > +static void npcm_clock_adev_release(struct device *dev)
> > +{
> > +     struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +     struct npcm_clock_adev *rdev = to_npcm_clock_adev(adev);
> > +
> > +     kfree(rdev);
> > +}
> > +
> > +static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_data, char *clk_name)
> > +{
> > +     struct npcm_clock_adev *rdev;
> > +     struct auxiliary_device *adev;
> > +     int ret;
> > +
> > +     rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
> > +     if (!rdev)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     rdev->base = rst_data->base;
> > +
> > +     adev = &rdev->adev;
> > +     adev->name = clk_name;
> > +     adev->dev.parent = rst_data->dev;
> > +     adev->dev.release = npcm_clock_adev_release;
> > +     adev->id = 555u;
> > +
> > +     ret = auxiliary_device_init(adev);
> > +     if (ret) {
> > +             kfree(rdev);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     return adev;
> > +}
> > +
> > +static int npcm8xx_clock_controller_register(struct npcm_rc_data *rst_data, char *clk_name)
> > +{
> > +     struct auxiliary_device *adev;
> > +     int ret;
> > +
> > +     adev = npcm_clock_adev_alloc(rst_data, clk_name);
> > +     if (IS_ERR(adev))
> > +             return PTR_ERR(adev);
> > +
> > +     ret = auxiliary_device_add(adev);
> > +     if (ret) {
> > +             auxiliary_device_uninit(adev);
> > +             return ret;
> > +     }
> > +
> > +     return devm_add_action_or_reset(rst_data->dev, npcm_clock_unregister_adev, adev);
> > +}
> > +
> >  static int npcm_rc_probe(struct platform_device *pdev)
> >  {
> >       struct npcm_rc_data *rc;
> > @@ -392,6 +458,7 @@ static int npcm_rc_probe(struct platform_device *pdev)
> >       rc->rcdev.of_node = pdev->dev.of_node;
> >       rc->rcdev.of_reset_n_cells = 2;
> >       rc->rcdev.of_xlate = npcm_reset_xlate;
> > +     rc->dev = &pdev->dev;
> >
> >       ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
> >       if (ret) {
> > @@ -413,7 +480,12 @@ static int npcm_rc_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > -     return ret;
> > +     switch (rc->info->bmc_id) {
> > +     case BMC_NPCM8XX:
>
> Here ret is ignored, which may be the return value from
> register_restart_handler() above.
>
> > +             return npcm8xx_clock_controller_register(rc, "clk-npcm8xx");
> > +     default:
> > +             return ret;
> > +     }
> >  }
> >
> >  static struct platform_driver npcm_rc_driver = {
> > diff --git a/include/soc/nuvoton/clock-npcm8xx.h b/include/soc/nuvoton/clock-npcm8xx.h
> > new file mode 100755
> > index 000000000000..139130e98c51
> > --- /dev/null
> > +++ b/include/soc/nuvoton/clock-npcm8xx.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __SOC_NPCM8XX_CLOCK_H
> > +#define __SOC_NPCM8XX_CLOCK_H
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/container_of.h>
> > +
> > +struct npcm_clock_adev {
> > +     void __iomem *base;
> > +     struct auxiliary_device adev;
> > +};
> > +
> > +#define to_npcm_clock_adev(_adev) \
> > +     container_of((_adev), struct npcm_clock_adev, adev)
>
> Could you make this an inline function instead?
>
> With those two issues addressed,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> regards
> Philipp
