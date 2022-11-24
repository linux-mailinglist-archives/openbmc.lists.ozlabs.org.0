Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093263710F
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 04:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHk6q1Lm5z3cct
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 14:31:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fOxfeB4E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fOxfeB4E;
	dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHk6G46Plz3bsK
	for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 14:30:45 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id 125so410911vsi.9
        for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 19:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LwRmCRmi3ZvryaL+N9uJcgI/0W3kQm4cItEnoQ4LDrM=;
        b=fOxfeB4ETJvm6TfqH7ytBBCiCu2nHKDm3LqQSsXgcUKYifhoAvLPO0TD5AsfYDqX0N
         3WR0AsxvALUQ9sfH5K3yWb2cEKWA7cwl/rBBDub0gdWzAf7Qc0I40Qh+DGLGIu8MY1J5
         NMHpic69PCqfS0yrlw9VB2N3pCl9EJlgEk1JBq841Cjh/M4r1UJfKyGYVPOdz4mOPYH8
         2/rq7Io/ANn2Hj9Z6oDn9H0ZaN1uP+2ZY4rCbx2GeR/j2FSsG3AEwT686TEQXicNVCe5
         UMeZv6kei9qDHlLWX8M32eKLOv4uwmA+1iyChMlVjYglrl0jBHRfatr5JzN2T6wLbtaW
         yStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwRmCRmi3ZvryaL+N9uJcgI/0W3kQm4cItEnoQ4LDrM=;
        b=JNUr55wDegGP7OtOrVNIn3JTJzh2vn9/lKpaSBWpe9u2v3egBlnBxQi7pvr2mTEq4G
         /r8H4nSDe8tCbF8x5XpGcK0D0upraAkDJGeR4rvmXS2VoBfWf+AMC435SUL1gIg8mJ2C
         Kyv/V+4Suu9EEviYuCsZIJVlglM5ZcPiiJ52bb7diL4vOgRKVaScKt+ZGBM3oKesfCvz
         3e6Zh1hElYI1GKgzpWt8f9K74FEFtwIW6NRTmlxtbwoYzQpGTMs8qXvluzOuEg7vwt/b
         Jmlwt5iqsLBS/AxCx/D0g9bhmR1FLt591Y2v48OWyJEBq0fIg/24HudUAYqHgwbaYaT0
         rD4g==
X-Gm-Message-State: ANoB5pnfmkXk5KDRwuB6poAB34mDlKFVl572tozcCUYpdynU+jFImoo4
	DqSx4U94JMmoH+2u7IfMRNqUyFnHwgqikzQqQz8=
X-Google-Smtp-Source: AA0mqf43DGtDw64RH4d7Xu35K5Ub4Cq6LWt/uNj9Wm2mJNNpKKflKWy33nc8qP3bQDtWGgAXpUgeoto4vGisYt4K9zM=
X-Received: by 2002:a05:6102:1e:b0:3ac:3e44:e649 with SMTP id
 j30-20020a056102001e00b003ac3e44e649mr7818557vsp.63.1669260642313; Wed, 23
 Nov 2022 19:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20221122085724.3245078-1-milkfafa@gmail.com> <20221122085724.3245078-8-milkfafa@gmail.com>
 <78cded0f-c75d-819f-0aff-7e4f3b264f64@collabora.com>
In-Reply-To: <78cded0f-c75d-819f-0aff-7e4f3b264f64@collabora.com>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 24 Nov 2022 11:30:31 +0800
Message-ID: <CADnNmFqKt_gVO8zonD3DYvM4PazKjKOgE2j_X8jZjSn9Pc9HzA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrzej,

Thanks for the review.

> > +#define GPLLST                               0x48
> > +#define  GPLLST_PLLOTDIV1            GENMASK(2, 0)
> > +#define  GPLLST_PLLOTDIV2            GENMASK(5, 3)
> > +#define  GPLLST_GPLLFBDV109          GENMASK(7, 6)
> > +
>
> There's a bunch of register definitions. Given you're adding a dedicated
> directory for nuvoton maybe it makes sense to factor these definitions
> out to a local header file?

Agreed. I'll move these definitions out to a local header file in the
next patch.

> > +     for (i = 0; i < video->num_buffers; i++) {
> > +             head = &video->list[i];
> > +             list_for_each_safe(pos, nx, head) {
> > +                     tmp = list_entry(pos, struct rect_list, list);
>
> If we ever get here isn't pos guaranteed to be non-NULL?
> And so consequently is tmp.
>
> > +                     if (tmp) {
>
> Then this condition is always true?

Indeed the condition is always true, will remove the condition check.

> > +     video->rect = kcalloc(*num_buffers, sizeof(*video->rect), GFP_KERNEL);
>
> In practice "small allocations never fail", but what if kcalloc fails some day?
>
> > +
> > +     if (video->list) {
> > +             npcm_video_free_diff_table(video);
> > +             kfree(video->list);
> > +             video->list = NULL;
> > +     }
> > +
> > +     video->list = kzalloc(sizeof(*video->list) * *num_buffers, GFP_KERNEL);
>
> Or kzalloc?

Will add error handling.

> In this function there are 3 similar error recovery paths. Can nice "goto"s
> be introduced to handle them?

Will do it for sure.

Regards,
Marvin
