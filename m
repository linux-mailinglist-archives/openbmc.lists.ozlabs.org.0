Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30083A64A50
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 11:39:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGWgb65Zyz3btY
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 21:39:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742207977;
	cv=none; b=dSd0iGAlCH4foGpyiEc/qR2UNqMhYzyLSC6UGfsNDMQD9Gx3NAEm+SkGr5N/2bfWedUzOk6s0vv0tK2PVbdS9pWjQT9WkHxt7Ms2KvVfFCraLJ9yc2RAEQ4as+O0lXnERml3tqQruPS3YI+W7dR8g/Csz3iRRN/uCNSo9O8RhzRAro6HOLF2hk7Qhy7o+ABv3Ra/9nYewbnLcVE9Xzu5bZkYIvsuGyz5SjsHXfLsZfeucrn2Y3C+a8hRppdYLpM2SA5fqRK8fvjeCcBDeboYqphcoT6e2Iq8W9ZCuekTYrllXk+Ko10PBbJCAmXk1A8bhL0TN12Pl61xg9V1KqNj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742207977; c=relaxed/relaxed;
	bh=IoGBlbe9Czmc/JKLBj0F16RNsymqq1dJ1tqyI1v1Ytg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qu06VGW+72BkbS7sLh3QNFzXYzrjCMaE+BrUxoFgyNx9eHYBHv+hmNXkUcU63eDv8mXcEjtx3iNSOVi+Lo+adeqPCh9sS86aL3BJRFcxa86nKhZ7WsVBfCB3TfDffFjnapGkwPj2slwgujVdLhlWQBEneSgAr3ynx6PVmkRKTeY3628Wxo2+78GIuM4CMbI7kDjTQjLtzkilD00CRqnTriITOpGMkywN+wQDUqP3qRsMtOF0oAd5274jbu5NI707/UKJ9OBYvOa6Hoo79BwuuqH+lq0D7u7AXcWA1K+NIdRPJ9/+5BYr3DXLMEWblPVIEASq/dc4dEWDKyQI2ePJEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WN4ZAwvs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WN4ZAwvs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGWgW2h35z2yFP
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 21:39:34 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e5dc299dee9so3872349276.3
        for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 03:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742207972; x=1742812772; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IoGBlbe9Czmc/JKLBj0F16RNsymqq1dJ1tqyI1v1Ytg=;
        b=WN4ZAwvs5T8cGYhGrnYzetMqlxANJpjpCGennv3u93w06f3bB3fdNODkvV1B8UJyKZ
         7AE3nP5/31wNyms0LupfRyneJS6PmUY2h1V/j/n2LPnIfXDM3HHCO6FJds07neCcgQAi
         EoHqcheMB1lnp9fGoIivb1+49OawzopTAozWK3YlLW2Q4J/8gS2t4+VeHqk1AHRXF5Nr
         FakIRqmLaZB5z4sj4y4ioKMGA4PnppXFOO86D33K1G/HMYfWWvViaDGl385IvHqzBXA7
         nKF6PkY15GO65FB5ImsFhfRImFK/2yxNeW5dRtpGc1rfZ1VNW2nliisdv7hJbhcw9abN
         36AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207972; x=1742812772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoGBlbe9Czmc/JKLBj0F16RNsymqq1dJ1tqyI1v1Ytg=;
        b=kBzSU2kwFBSKiLP1++a4qLDSyOBUjiaIGrvwfJdktB59SoipzLtMQgyhTqGDM22jLQ
         cu9QE0tZCKf4DWr4ec+4SQSl8w0vP1yqd/rg3DPv17zmWWwosFL8aMCy2aSZlktopKzs
         QYcBHedt5SKZi/fY70gRrSzuSMy6z1iTJFT/pIOAte8n5D9NYxWf8X0YY3zn4fvMPfCW
         HWXxRRFUoQ7K7mt4hRG5E2RUjRSWOLZHoADlhNmGYqZMOKTrtNyBWk/MdPkF+FoKYWNh
         LesQ14t0Bvi0vpYiZFdBGwO8CouiRO+b4gcbK1yp1v8o8FEOow5M0Y6SeP6Gg5MbBBDm
         OEOg==
X-Forwarded-Encrypted: i=1; AJvYcCWLVhZZYaevAdwvzVxWcpwqfPwUE77OUqqNweu5NHazgFNo5cwWpqDuq4VLM00D96AT6pGsla9S@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgQLHo4jH2NKr5FJy4C75GUziX+8xMxHQyq6J33OurpvR2KuTY
	McSlBGVNj7d0GJPfYPg9A9ZQJLo7XoUJvLxty6fUv8ehUQA6nUNIlWfdX6YArsLek50BKNB0T79
	0/Fwv8xaYYt6bfpTW3hcAlYMqm0w=
X-Gm-Gg: ASbGncsJFM/m1I9N7LfhYTwUgDid+0pl05LdyfWsbx5evWhsIvSj0xp0U6vXpv/3xzt
	u84eNpX+hEfIr4HwdzeCGkvp5OvuVKSIanfSg3cuOOcFLMzNv7AOnJeK5fVlQBhmwXOG9Vxbp8a
	f43JbwF29i2OPQG6T/vvJFw4KHnRU=
X-Google-Smtp-Source: AGHT+IHy+RO89nDi9FmYtvf/yESHna7TilFKwweegOO/mX3S8jWkfc8ZcfeV/QYwVZlEKxwfn3Yq7ZH5aj8lCxwN4uE=
X-Received: by 2002:a05:6902:2191:b0:e61:1c18:3f36 with SMTP id
 3f1490d57ef6-e63f65e5ea6mr14903162276.44.1742207971658; Mon, 17 Mar 2025
 03:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240912191038.981105-1-tmaimon77@gmail.com> <20240912191038.981105-3-tmaimon77@gmail.com>
 <536f5393-478c-4a50-b25f-180e221ef7a3@roeck-us.net>
In-Reply-To: <536f5393-478c-4a50-b25f-180e221ef7a3@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 17 Mar 2025 12:39:20 +0200
X-Gm-Features: AQ5f1Jq_X-0lZX7kkWxOU1PNLphKdtirYmAhXmqFll0JeXRXfeWOSuOpsLz0fxM
Message-ID: <CAP6Zq1ioebnqgJB1B8AqD9UtMZRy5CDT8+_dXF_aBZEjjj_B-A@mail.gmail.com>
Subject: Re: [PATCH v28 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

Yes, of course, it works in real hardware.
The modification was made since the reset and clock share the same
register memory region.

To enable the clock change needs to be done in the device tree as
follows (we are planning to send these change patches soon):

diff -Naur a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
2025-02-26 16:20:39.000000000 +0200
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
2025-03-17 12:29:17.876551537 +0200
@@ -47,19 +47,16 @@
                interrupt-parent = <&gic>;
                ranges;

-               rstc: reset-controller@f0801000 {
+               clk: rstc: reset-controller@f0801000 {
                        compatible = "nuvoton,npcm845-reset";
-                       reg = <0x0 0xf0801000 0x0 0x78>;
-                       #reset-cells = <2>;
+                       reg = <0x0 0xf0801000 0x0 0xC4>;
                        nuvoton,sysgcr = <&gcr>;
-               };
-
-               clk: clock-controller@f0801000 {
-                       compatible = "nuvoton,npcm845-clk";
+                       #reset-cells = <2>;
+                       clocks = <&refclk>;
                        #clock-cells = <1>;
-                       reg = <0x0 0xf0801000 0x0 0x1000>;
                };

+
                apb {
                        #address-cells = <1>;
                        #size-cells = <1>;
diff -Naur a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
2025-02-26 16:20:39.000000000 +0200
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
2025-03-17 12:24:52.293171764 +0200
@@ -19,6 +19,13 @@
        memory@0 {
                reg = <0x0 0x0 0x0 0x40000000>;
        };
+
+       refclk: refclk-25mhz {
+               compatible = "fixed-clock";
+               clock-output-names = "ref";
+               clock-frequency = <25000000>;
+               #clock-cells = <0>;
+       };
 };

 &serial0 {

Is it better to modify the reset driver with your suggestion or change
the device tree?

Thanks,

Tomer


On Sun, 16 Mar 2025 at 17:22, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Thu, Sep 12, 2024 at 10:10:37PM +0300, Tomer Maimon wrote:
> > Add NPCM8xx clock controller auxiliary bus device registration.
> >
> > The NPCM8xx clock controller is registered as an aux device because the
> > reset and the clock controller share the same register region.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > Tested-by: Benjamin Fair <benjaminfair@google.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> Does this work with real hardware ? I tried with the new qemu emulation,
> but that gets stuck in the serial driver initialization. I found that the clock
> device instantiates but does not register as clock provider because it does
> not have a device node. I needed something like the patch below to get beyond
> that point.
>
> Thanks,
> Guenter
>
> ---
> From: Guenter Roeck <linux@roeck-us.net>
> Subject: [PATCH] reset: npcm: Provide device node to clock driver
>
> Without device node, the clock driver can not register itself as clock
> provider. With debugging enabled, this manifests itself with
>
>  of_serial f0000000.serial: error -EPROBE_DEFER: failed to get clock
>  of_serial f0000000.serial: Driver of_serial requests probe deferral
>  platform f0000000.serial: Added to deferred list
> ...
>  Warning: unable to open an initial console.
>
> Look up the device node and attach it to the clock device to solve the
> problem.
>
> Fixes: 22823157d90c ("reset: npcm: register npcm8xx clock auxiliary bus device")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/reset/reset-npcm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> index e5b6127783a7..43bc46755e82 100644
> --- a/drivers/reset/reset-npcm.c
> +++ b/drivers/reset/reset-npcm.c
> @@ -409,6 +409,8 @@ static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_d
>         adev->name = clk_name;
>         adev->dev.parent = rst_data->dev;
>         adev->dev.release = npcm_clock_adev_release;
> +       adev->dev.of_node = of_find_compatible_node(rst_data->dev->parent->of_node,
> +                                                   NULL, "nuvoton,npcm845-clk");
>         adev->id = 555u;
>
>         ret = auxiliary_device_init(adev);
> --
> 2.45.2
>
