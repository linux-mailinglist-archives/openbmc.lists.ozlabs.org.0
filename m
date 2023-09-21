Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FC7A94B8
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 15:24:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h8AVvC38;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrx2v1fHTz3cGJ
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 23:24:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h8AVvC38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrx2J462Xz3c1H
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 23:24:23 +1000 (AEST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4526d872941so519432137.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695302660; x=1695907460; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2QMJzQRVdpXl092C0YB+p9u+FvBSdDJvGwaFoHe9mXs=;
        b=h8AVvC38w8ExX28tKQITRHeqyA1QO8XIcK4bto8pRDAnnhfhfBpgpGQr1zk0LpLxZC
         XKy3BE1EUki41RTmYu1+ns8dK70ez+Gk8hctq9AHW1zZgIwIwWrq8pUuWopMMjrEaGYd
         yTVIivVnlGFOt1IqJkXChh2m0/YKzvomtYa4pWsuBRzKgPo2MqmQXUI97PrLQT4VuShI
         svFalbVzf1u/yaORedswd5hvMNn0rY7ElHre9bUSkPAHq1Sg7Zb56RLoX1CULOsSAmhS
         qUgwdUYuY3hRta/WmYyIkIDw5MFuVD+3Hsj8j+OvH9CkWdGqtOLX5LGuabQ3mujKuQ0i
         fIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695302660; x=1695907460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QMJzQRVdpXl092C0YB+p9u+FvBSdDJvGwaFoHe9mXs=;
        b=pWBSoHJ3h1m8oVQPgK8HAHONKigCFSJf8NuPZhGAUuMiRqSlswrGJgFyX8rmmfD2K8
         U1L2hYw3VtjWJfbz80ksbg9RMLTCNohPzpySYhQYpQHpm1PGIkUEygaTKCP2/rWTFuUx
         hs5MmupAyu5BISytrPgb/4r5vwYHxb2KkopVkJQIZ9xD2x6Oz2l9oS5I7JNwJtRDB/ni
         64hoCDsuL5tg2kj9nr9MxbiQBX2HC29g5ripAdpYccCKuw/T5A1jNXx0Vsme8YAT9Tpu
         SyAa4GFLTzhjBGKqBQpfR4OEXcglrPO/YKrAdLNLH3eJFMRHj363J9bnoHoNe6BwfUzY
         8chQ==
X-Gm-Message-State: AOJu0Yyh1eG8jbD+BrQ6LuzqZ8gXxzt9PCDnzzrPYwlZk0KE0a6pzAgx
	EcC5L5ezsT2/pdEY69XJlYTJEOsGcIVwBYnLE98=
X-Google-Smtp-Source: AGHT+IEQIBnn00pB2IJpNVNOufGxL6gAIwGGykOexSbWRjQHbZV1E1O5Pn75njZHId7nUUnh90Ubb2uF3bofkKYX24k=
X-Received: by 2002:a67:e2d7:0:b0:451:64e:4645 with SMTP id
 i23-20020a67e2d7000000b00451064e4645mr5954736vsm.12.1695302660371; Thu, 21
 Sep 2023 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230920022812.601800-1-milkfafa@gmail.com> <20230920022812.601800-8-milkfafa@gmail.com>
 <fb74f6b8-3139-4652-b36a-1de396d0ca23@xs4all.nl>
In-Reply-To: <fb74f6b8-3139-4652-b36a-1de396d0ca23@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 21 Sep 2023 21:24:09 +0800
Message-ID: <CADnNmFp9meVx5MMbCcvjSQaMv12K7j=_kB_ajJi5GoYEWegZcg@mail.gmail.com>
Subject: Re: [PATCH v15 7/7] media: nuvoton: Add driver for NPCM video capture
 and encoding engine
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

Thanks for your review.

> > +static const struct v4l2_ctrl_config npcm_ctrl_rect_count = {
> > +     .id = V4L2_CID_NPCM_RECT_COUNT,
> > +     .name = "NPCM Compressed Hextile Rectangle Count",
>
> This name is too long, it should be max 31 characters. Dropping the "Compressed " part
> might be best, I think that word isn't needed.
>
> > +     .type = V4L2_CTRL_TYPE_INTEGER,
> > +     .min = 0,
> > +     .max = (MAX_WIDTH / RECT_W) * (MAX_HEIGHT / RECT_H),
> > +     .step = 1,
> > +     .def = 0,
> > +};
>
> With this fixed, and the sparse warnings fixed, it should be ready for merging.

OK. Will fix them in the next version.

Regards,
Marvin
