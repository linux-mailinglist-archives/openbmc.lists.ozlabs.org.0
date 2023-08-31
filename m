Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6D78ED80
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 14:44:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f/+XA9Zr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc17M4Bnzz30fm
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 22:43:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f/+XA9Zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc1645xSsz3c1H
	for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2023 22:42:52 +1000 (AEST)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48faba23f51so313805e0c.1
        for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2023 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693485767; x=1694090567; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1xOciFEJ8HjM2SzGUTsUdShfH1iAQ0wqaSrJGRWK40=;
        b=f/+XA9ZrWEA4vZWkRKbKvu8YoyBFEGDYUTpFXO61ME7NSsRqk8mgaDYZrS6JpLYFD5
         NlIfDOk+lk4IgFN5MKdSSJ+E0d9LkQ4E007X4wlbvAFS7GeJltPmbpWa9/J205um4C2B
         8T9p7033QCTnKMgCP2ea/Mr/eR3F/gNNjlMhFrdQJk94J7xqZfKdpkWX+UNOHlxSG6Sr
         mECuLBIsHtlJF9KXQYPDPgiQ+qPJyk8BYfEGXGYwwYHT88qBrfbKRaPSxSF+gmQDiY36
         DAOXAhpo8bq1fhEf9EzTMT8gFa48EitsRzFDrgNBXQu8DB3fGr5HphgRVQ0dhyjMJRGS
         /LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693485767; x=1694090567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1xOciFEJ8HjM2SzGUTsUdShfH1iAQ0wqaSrJGRWK40=;
        b=bHKNeIS2+D7wXeMkWc5d+u8eF4sSRG8QGUwvfblI8mdXSXWhpZRWICX0pSubytBJlJ
         awfn0yPdphvxld7zw6QkU03YrT6EmISiqB1QQHa8aQT1VVc9TN79+dn3D/QvzMpEnj8M
         rra5puaPyxhLu4rwCPaSNucDOTtqML2NGXOMmU5C095MLYNTz4SGt0Soo5bY4w2Lh4gv
         BmN0hRiB7/IKCsP69fXI9m9BT/mGdwt4XP42z4tYesWBIsMICWijzag4wPc9UNeyuDaU
         Yx6bqK/8fazKI7917Q8hlELDyMW6uGFM9ZPJvjt/n63OyjBJKgSn1DDijNnKt5BsciAk
         a8ZA==
X-Gm-Message-State: AOJu0Ywi/ofLb8J5558kh2mocbWGZU+RWfLqxA1qcdsfqMA1SNhGBlPK
	f6SQhwF9lWUasHOdreada6KkJeCtLKv7CWOdAI4=
X-Google-Smtp-Source: AGHT+IG+ZUnkpRdPLlTVk21k4SpEvZwMjipenH8jcSc0l7Lhd+kc0DKaqOWOz4BxF4hDJ9YB1nhCciRqrK+QcApXhIw=
X-Received: by 2002:a1f:ac54:0:b0:490:a0fb:e08f with SMTP id
 v81-20020a1fac54000000b00490a0fbe08fmr4010195vke.1.1693485767538; Thu, 31 Aug
 2023 05:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230828091859.3889817-1-milkfafa@gmail.com> <20230828091859.3889817-8-milkfafa@gmail.com>
 <0c91f68d-d172-bd14-9115-b6977ad2d01f@xs4all.nl>
In-Reply-To: <0c91f68d-d172-bd14-9115-b6977ad2d01f@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 31 Aug 2023 20:42:38 +0800
Message-ID: <CADnNmFqVbRWs5Uf_tJdrM0AopF_CmSHYwBK8-+1go_K6Hefkcw@mail.gmail.com>
Subject: Re: [PATCH v14 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
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

Thanks for the review.

> > +     snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", DEVICE_NAME);
>
> You can drop this last line, it is already filled in by the V4L2 core for
> platform devices.

> > +static const char * const npcm_ctrl_capture_mode_menu[] = {
> > +     "COMPLETE mode",
> > +     "DIFF mode",
>
> Hmm, I would drop the 'mode' bit, since it is already obvious that
> these are the modes.

OK. Will drop them in the next version.

> > +static const struct v4l2_ctrl_config npcm_ctrl_rect_count = {
> > +     .ops = &npcm_video_ctrl_ops,
> > +     .id = V4L2_CID_NPCM_RECT_COUNT,
> > +     .name = "NPCM Compressed Hextile Rectangle Count",
> > +     .type = V4L2_CTRL_TYPE_INTEGER,
> > +     .flags = V4L2_CTRL_FLAG_VOLATILE,
> > +     .min = 0,
> > +     .max = (MAX_WIDTH / RECT_W) * (MAX_HEIGHT / RECT_H),
> > +     .step = 1,
> > +     .def = 0,
> > +};
>
> Just to confirm: you decided against using an integer array control?
>
> There is a real danger that if userspace isn't reading this control
> quickly enough (i.e. before the next frame arrives at the driver), then
> the control's value is that of that next frame instead of the current
> frame.
>
> It doesn't feel robust to me.

Actually the driver will store the frames and counts for each buffer
index till userspace dequeues them.

Ex. assume that driver has captured 3 frames:
- 1st capture (buffer index = 0):
     video->list[0] => store the list of HEXTILE rects for the 1st frame
     video->rect[0] => store the rect count of video->list[0]
- 2nd capture (buffer index = 1):
     video->list[1] => store the list of HEXTILE rects for the 2nd frame
     video->rect[1] => store the rect count of video->list[1]
- 3rd capture (buffer index = 2):
     video->list[2] => store the list of HEXTILE rects for the 3rd frame
     video->rect[2] => store the rect count of video->list[2]

When userspace dequeues the 1st buffer (video->list[0]), it needs to
know the count of HEXTILE rectangles in the buffer,
so after dequeuing the buffer it will call this control to get the
rect count (video->rect[0]). And when a buffer is dequeued,
npcm_video_buf_finish() will be called, in which the buffer index (in
this example, buffer index = 0) will be stored to video->vb_index.
Then when userspace calls this control, npcm_video_get_volatile_ctrl()
will return the rect count of vb_index = 0.
In this way, I think userspace is always reading the correct control's
value even if userspace is slow.
Does it make sense to you or is there anything I missed?

Regards,
Marvin
