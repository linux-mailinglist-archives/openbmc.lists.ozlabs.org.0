Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A1A4123C
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZn0gvQz3vmf
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740335696;
	cv=none; b=V2cV4TNy3BvqZzUdqene/HYw4vfEN41BJmKGoPBd4uplJ3orINx4IhCuMVOWiD5whbXepMR8iZvfgSJkD8PmJQtHTAXm/h6oyVoDH/AYI3TGjY3Z65jn2Gq9QirmPM+EfmCO58MoPwsfswjEGS0jv1rtR45i/nxUhruYo7mn7nLBSzn/XS5s8jlY+lhldpAkw+jal+pssbrDHtjPH+FFpWnAitaqa1SqHwJ9+nX6J7JOdXVEvxKvJGUd+TBualUHSF3dOuwHB3hKWSWKg6Bh11W+rQcTASyA//1WPru9AFG/PyTD9tnD4yMkTtu7mJTAHX5/YMsC8dghRRBCVIPYow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740335696; c=relaxed/relaxed;
	bh=U0C+iu1WeNs+zRFQEZ4WEKG2Hv7tO/tPX0DsKYx3e/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZlU7iiGHfq6F6042ZwLl1SxNR+hJwZB3J0kqe4N97La/X7Gv//0JJjR22zOmUrydiq3YCYWRgdC+KXsEAyHGrmgayKHL8JbObt4Lf/XykDpUYln7LJ1a2akocXq1y5gYGUlK8Nro5O9JRf+bWpKJxl/auGpe0UIJyzs5kXLWM57JBmKrTjroJMLWJ3K+cU0uBAt8txW1G8Kk1BO9X1FSWDgRunZBgLkCjs8rVvo5O0Q5DaJN3yqS4KS97Vl+JzKRg7cYUDimwMY6LE6dMOjgp9v/StrygSzJt6+nlLezl8iqoo4crOWroGoOUMmhJOSC6slSDp5j1/E5h9+iURd3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BFghei21; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BFghei21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1CG63LNRz2yjb
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 05:34:53 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-546267ed92fso4361692e87.2
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 10:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740335687; x=1740940487; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0C+iu1WeNs+zRFQEZ4WEKG2Hv7tO/tPX0DsKYx3e/U=;
        b=BFghei21kx7Y88yDJ5RtG4MzZmByqQmzGP/tE6jg5CVNtyM+YQfVJ8dM3ZmwRtlVoR
         8SX0UYSMMLY+qivZ4C8SHv10Vn0nye2MhZEJe6eiRe1+I4Jei2Y0zkbEsN51crH/O77f
         z091K5AXYrS8jU3yDxwxCBj79jLU/u4EPpTfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740335687; x=1740940487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0C+iu1WeNs+zRFQEZ4WEKG2Hv7tO/tPX0DsKYx3e/U=;
        b=oCNJ6jTKKplU8+eE3VU/pZ2hM9au1L1nOLpoNN8YhdSB0wdgWFt8y2ItrLvpKw/oCL
         /bY2O3EjC8WhWCoz9A0/Sx4g3QLg4edxr6nhvvSE/qRR03hgugzfmkLymzElpMm9G+qM
         DhLSfbIcuRT9ayplPvQgXKZjj9YxpXJkw0wk48m3jyGqpRxd2Au0nWMJACLuCj6E9/Cy
         cBWI8N4kHUH1mqUFtlr2fvmIAy2fOGHcSdvuWGwj784+bphdyLudqQ1w6NHgiXx6QQjM
         0BpNUzefN4vuAc68fr7gWRk/Acr+cLhhF9llX74yaywYvZhJUIqrHha1ChVEA9rqS4zZ
         NJQA==
X-Forwarded-Encrypted: i=1; AJvYcCUX0Ud0HXfJKDauVosLztzgumYTEqYgOB+Ce2sHijhFCqTbkxY2dHS/5D86KruANChtKDX2IQv4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzOedaMJefPVFB4sCfwQk+SLKa2EOAGpXuQq99+UJwHZ5Lhm7Jo
	0O6GqYy6bI3mQhrf4G6o3LPSG/oo8cH23Z5YfjRojrxiZbYCXFl3uJ+nktIzUc35oXC2fXQdulk
	=
X-Gm-Gg: ASbGnctsEuNNkrvMKBCsGiPL/H0j0gsnelDGri0PWa8ABytYK6GB+oR9Rx7532woBU0
	GRdio20xdhO0z4fUAi9Qp8W+vBEGoBvDkEy78vKkjOmSC7AkH44kuYpizKYbIVmDoCbPzkyDbf5
	hVqJ5+BC6KbF5MT2NqVyuTA5AYdDi8RBqA6Gq9D+Fs2IOEW1S2972e8/GSkP5li0t3skdc4R1ub
	3RYHBWv4igfRjYiw0W74bSFuF/OVIZQCPXLG1syJnSqn08SdoJoHYVW3+cnOWlRjYdRwhoScwrW
	czZVNn99dzSt3DMG1ye4vbaPDZeAgEGkXZVsq6wFwp9enjSZTDQqw5VUofvu6LjzYlqt
X-Google-Smtp-Source: AGHT+IGwPfi6/BRkG/yFY7nb0UgWeJwt/qHFF+tBBBg9eKm6qK+7R898CbbP8NMNywpgneqg5YXQbw==
X-Received: by 2002:a05:6512:31d3:b0:545:2550:7d67 with SMTP id 2adb3069b0e04-54838f4e57amr4194662e87.36.1740335686673;
        Sun, 23 Feb 2025 10:34:46 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f6efbf5sm2692079e87.18.2025.02.23.10.34.43
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 10:34:44 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30795988ebeso37195861fa.3
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 10:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFllrQ2YrjOVch/T1ez0YYk1ZcdLBPqvCamEhEf0/AQ01SGso792R5Vv317oR7OsmrDd5bbkSA@lists.ozlabs.org
X-Received: by 2002:a2e:b614:0:b0:308:f84b:6b34 with SMTP id
 38308e7fff4ca-30a5990b2ebmr35382051fa.20.1740335683340; Sun, 23 Feb 2025
 10:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org> <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
 <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
In-Reply-To: <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 19:34:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
X-Gm-Features: AWEUYZkxdyzd_jgZvmXlXPTuqCYemf2QEgvVhq5WasLvpB-Xk2V4c6RpmAx6ZOg
Message-ID: <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
To: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <milkfafa@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 21 Feb 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 21/02/2025 10:04, Hans Verkuil wrote:
> > Hi Ricardo,
> >
> > On 21/01/2025 22:14, Ricardo Ribalda wrote:
> >> When we obtain a reference to of a platform_device, we need to release
> >> it via put_device.
> >>
> >> Found by cocci:
> >> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >
> > This driver uses this construct:
> >
> >                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> >
> > to automatically call put_device. So this patch would 'put' the device twice.
> >
> > Does cocci understand constructs like this? If I hadn't looked closely at the
> > code first, I would just have merged it.
>
> Oh wait, now that I am reading the following patches I see that it was those later
> patches that add the __free code.
>
> This is far too confusing. Please post a v2 that just combines the 'fix references'
> and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
> approach.

I believe this is discouraged.

cleanup.h macros does not exist in old kernel versions, so makes it
impossible to backport the fix to them.

This is an example of other series following this policy:
https://lore.kernel.org/lkml/173608125422.1253657.3732758016133408588.stgit@devnote2/

They also mention the same here:
https://hackerbikepacker.com/kernel-auto-cleanup-1 .... I am pretty
sure that I read the policy in a more official location... but I
cannot find it right now :)


>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/platform/nuvoton/npcm-video.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> >> index 024cd8ee1709..7b4c23dbe709 100644
> >> --- a/drivers/media/platform/nuvoton/npcm-video.c
> >> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> >> @@ -1673,6 +1673,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
> >>
> >>              regs = devm_platform_ioremap_resource(ece_pdev, 0);
> >>              if (IS_ERR(regs)) {
> >> +                    put_device(&ece_pdev->dev);
> >>                      dev_err(dev, "Failed to parse ECE reg in DTS\n");
> >>                      return PTR_ERR(regs);
> >>              }
> >> @@ -1680,11 +1681,13 @@ static int npcm_video_ece_init(struct npcm_video *video)
> >>              video->ece.regmap = devm_regmap_init_mmio(dev, regs,
> >>                                                        &npcm_video_ece_regmap_cfg);
> >>              if (IS_ERR(video->ece.regmap)) {
> >> +                    put_device(&ece_pdev->dev);
> >>                      dev_err(dev, "Failed to initialize ECE regmap\n");
> >>                      return PTR_ERR(video->ece.regmap);
> >>              }
> >>
> >>              video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
> >> +            put_device(&ece_pdev->dev);
> >>              if (IS_ERR(video->ece.reset)) {
> >>                      dev_err(dev, "Failed to get ECE reset control in DTS\n");
> >>                      return PTR_ERR(video->ece.reset);
> >>
> >
> >
>


-- 
Ricardo Ribalda
