Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8014BEF83
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jhp28nzz2ymb
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:26:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rk4wLpnz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36;
 helo=mail-vs1-xe36.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Rk4wLpnz; dkim-atps=neutral
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2jS94f17z3bSv
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 13:15:21 +1100 (AEDT)
Received: by mail-vs1-xe36.google.com with SMTP id g20so19487698vsb.9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 18:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BlI0MZtmyrupgAgtS84tifI22v5MszPHmzBYuMorQ2Q=;
 b=Rk4wLpnzqfp8r0wTeL769g6XltdeX4nvtAxkmAP0nmzzlyzhVkBToHl6P9L3bbm82o
 wPzymBMGB+rEQFwGR8DJwzTDHH1AfiXXQ4G3WVg8xyTg4rDw36f4a9vde+nrbZMLFRkN
 obhvmz22sTRmEZQECLHBOUsWFeHDcv//ZAROlAsniLb64mNcoPrtPspOds/Cpc10zv9R
 tlzoVoiVXTQzJeY37ud3nRWtGSRkVxkLPTrz+1IlnXy1RVuGZmbZw1EdUShCLfetw6XL
 gmoyEgSqsicqdd0DcdTS5Hy6oWEk8F2THhQOIN57Em92cCrNL2y8X9cOknB9YN/SywK5
 9dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BlI0MZtmyrupgAgtS84tifI22v5MszPHmzBYuMorQ2Q=;
 b=Q7B/lO3woY0tabmDfyFlft7L2YMHtCgF+IGTwA97YOL8033+sRrwrSC8Hv91qxbepU
 YFq+3Ru0ItLK4l9MvD4RkX0zk1k7VSlhp8IWCNbEZjPUcbpSF1TTT7/X1iLNl24Puu/J
 +40vUh9hy4whDKI118bfGT0+w+o75lUazcBHr24YNXoXYiOydBlo2nvYYUKBd7m9yfJX
 dUUDDtEaGjEjAZXJp3vG7EFaSRtACj/+iPWKsKFkBe/CiqBfbW9RxnvFb1B8Ec5ZNF31
 domqueV1h5FH/61jkKf9AevoexsUxJ8Jk8gYw/Gfvc45jzLR4//yN+yPUnxoj2diCEXI
 O8Uw==
X-Gm-Message-State: AOAM531Mi3i4KCUlSrGZN1E4fzI7zgf2bbtlyEdqrXl9xHHXVyKJuej6
 AYl816Nx6shk/2i5U/PzPnmp5Y1p53J+di+aDA==
X-Google-Smtp-Source: ABdhPJwP8hGkmey95OH9kMBmiXbTjANOhIk00QyYwbxVhv9uJZHDNcE4hSC4Qy5vlaQyfzrxkO0dro8txp6TgLSZrkQ=
X-Received: by 2002:a05:6102:370f:b0:31b:60dc:4f76 with SMTP id
 s15-20020a056102370f00b0031b60dc4f76mr9690133vst.2.1645496116704; Mon, 21 Feb
 2022 18:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-6-warp5tw@gmail.com>
 <YhN8OGIR9eSCus8E@latitude>
In-Reply-To: <YhN8OGIR9eSCus8E@latitude>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 22 Feb 2022 10:15:04 +0800
Message-ID: <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de,
 sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 yangyicong@hisilicon.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan:

Thank you for your comments and please find my reply next to your comments.

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:49=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Remove unused npcm750-clk node.
>
> You're not actually removing a node, for example in the sense of removing=
 a
> devicetree node from a devicetree.
>
> So, I think "Remove unused variable clk_regmap." would be a better
> description.
>

May I modify the description according to your input and attach
"Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>"
onto this commit in the next version of the patch set?

> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index a51db3f50274..9ccb9958945e 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2233,7 +2233,6 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       struct i2c_adapter *adap;
> >       struct clk *i2c_clk;
> >       static struct regmap *gcr_regmap;
> > -     static struct regmap *clk_regmap;
> >       int irq;
> >       int ret;
> >       struct device_node *np =3D pdev->dev.of_node;
> > @@ -2256,10 +2255,6 @@ static int npcm_i2c_probe_bus(struct platform_de=
vice *pdev)
> >               return PTR_ERR(gcr_regmap);
> >       regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL)=
;
> >
> > -     clk_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,npcm75=
0-clk");
> > -     if (IS_ERR(clk_regmap))
> > -             return PTR_ERR(clk_regmap);
> > -
>
> The change itself looks good to me,
>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> >       bus->reg =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(bus->reg))
> >               return PTR_ERR(bus->reg);
> > --
> > 2.17.1
> >
>
>
> Thanks,
> Jonathan

Best regards,
Tyrone
