Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 789597BFB7B
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:32:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e48RSKaA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Zzw2cXwz3vXZ
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 23:32:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e48RSKaA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Zxy2F2Zz3cVK
	for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 23:31:02 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-457899d5bf6so624335137.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696941058; x=1697545858; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jgq1hohZKa0dNoy7yXEMkucv0MQJifBsOzJHvG5k90=;
        b=e48RSKaAUdo4O4RPIIpncWHAXZ7H0nZPDXojdqNW4KHX+zRPpo4Z/pA+BJnWAqrKfX
         7w6UK1uCqpQMEYKAayNXvG4+DsG/NHKBSvZh5SlrU4v6AGnsDdLdjf9eOv4STeQr1Kf5
         S/6hf1CGkFPPy9zMvaYl/qxSVtvFlZaslkdvVWkMKhEb/afVA5fBa2YcNOjiCFLli2Ka
         kA5N8R0ThVA13DKiXW5VDt96kaVenLZEScf/20Y/TPNSxBI0LmxZjCxp69OloRzSM4Da
         PAUUcIaQcICN8EvlDYuRpnFE1yl18d8NCOg/aXlEdVE6JIuxfBFUW7h2zLGYBBWLMSeu
         dLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696941058; x=1697545858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Jgq1hohZKa0dNoy7yXEMkucv0MQJifBsOzJHvG5k90=;
        b=lpbe0QLqA0hpjqXwg7QZHwxX9U9F5KJe199meEBTJfp9A9wIjvIMcIHEZjpeXFKf9G
         jG+VPp2ZhXwEpVIAVXS7geeOfEo0GzphJ5g1QijwIyXO2FFfBR/3qzqIqPioh2Tahy6O
         BCt+wgUnBiZMdcweqCAfIElQNm66P+gvfqOBlx0+Jb8n3nQ569rchXQadRemt/LHXzjD
         Nz3ZlhSS0g/IcfC8ZBtLjseMtyI23XF9nM38k/7Fh1M5kHNCoW651ugkHZ1w7F8MCZKu
         KTuCjCz+WvZ4BpeVNKDhTWzRaPfV/moOOW5WwVSyus8T5PG5L865fTVFl2CLsJJ/DB25
         X9AA==
X-Gm-Message-State: AOJu0YwxZZp++4f+Uekt5xfBMW9NiTkvJS+FFzVpZPGrAI9NyHQYCc3F
	cNIxq00Bs1Lgv4wzUJKDx2PMfeRurPu4Vc2+PH8=
X-Google-Smtp-Source: AGHT+IHE5HVwDH+3cFb7GWrpi0mBpaa87jqRz7jxzqBJlN7SCzdT5XPSophvYbptrFtqoWGWETS5KuvsreHFbtRbJPI=
X-Received: by 2002:a67:fc43:0:b0:450:f9eb:f412 with SMTP id
 p3-20020a67fc43000000b00450f9ebf412mr17512072vsq.5.1696941057972; Tue, 10 Oct
 2023 05:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231003075512.2081141-1-milkfafa@gmail.com> <1e5bb09f-be36-4fc6-88f3-8f6565b6147f@xs4all.nl>
In-Reply-To: <1e5bb09f-be36-4fc6-88f3-8f6565b6147f@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 10 Oct 2023 20:30:47 +0800
Message-ID: <CADnNmFqqOOo75hmt6FKGFjC2XcQD53SuX3gHEqnifWcCas-m-g@mail.gmail.com>
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix sleeping in atomic context
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, mchehab@kernel.org, kflin@nuvoton.com, dan.carpenter@linaro.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

Thanks for the review.

> > -     list = kzalloc(sizeof(*list), GFP_KERNEL);
> > +     list = kzalloc(sizeof(*list), GFP_ATOMIC);
> >       if (!list)
> >               return NULL;
> >
>
> I'm not really sure this is the right approach.
>
> Looking closer at the code I notice that npcm_video_irq is a threaded
> interrupt handler, so wouldn't it be easier to change the video->lock
> spinlock to a mutex?
>

Agree it's better to use mutex. Will send v2 for this.

Regards,
Marvin
