Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1877CC40
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 14:03:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kHJJ+YQz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ8zR4m15z3cHR
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 22:02:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kHJJ+YQz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ8ys6HFrz3c60
	for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 22:02:28 +1000 (AEST)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-44957b59218so2922851137.0
        for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692100945; x=1692705745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T7VZKftEzDye9TscT4naX9QKoF2fRXcn75T62khYWWQ=;
        b=kHJJ+YQzAjdBTWqM+jTaA28DDuduIOmeVIXpjNAxaIzEhEwvkEd46GjFTqAtrQ/5g6
         EB1vOL2dIeeXoRkOFq8w+Q1Y48BEyCdfsvTG0tKeVS3TPj32zDyikBiLccjWfDKaoH52
         Pv6te7bjbzUzKMMFaeXsD42CVKKjiDVbwRphDPjH8NWOFb8qslNtI2FH+SjFa7EoXAig
         zPgR7OXFYCeSa1vtUPiS3iYru2GL8kK1nEaUqthS+snQ5tpIDtrLHNjgfxSvtQxFMwOF
         ki2VqLZp4f89v4tELG1ksdhDepZGox+b7w+BIA/SNTc08lMTuNlHLkRzzC79vdXWd44j
         gAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692100945; x=1692705745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7VZKftEzDye9TscT4naX9QKoF2fRXcn75T62khYWWQ=;
        b=iQxSIlkl1DDZ/uiFAtp7p8ONU9uWhgN5+x/LFLdVHtPoyil3L+1QCpe3GwUDIhdXrd
         oHxGxhtVh/WKeK/BmWfbcyteu3M5Hx71RDui03d+FGIx37R1hESUI8nww5VH10qZoTBf
         jD5mDtFYnE1/aK6jr9MzCFpjvN2j5dsNYXdVEnXwaax9JCiQQO/WOm1BEPpZKlezA4vp
         +17MrDtPsxR55jnK0djYFN1WS3MWYDcgLTSxFxAgXDMxmNeA0jXrG/9aIiis0ODXgU+E
         1IUGqMBPMW5EQK7HP3l843m3FMy2uLhlK9xtxqygWo5PjrfS/bhGtwdn3lNCqkJlm2qv
         ukYw==
X-Gm-Message-State: AOJu0YxEMMW5ACjHSSREAl71ltV2hPHg+AgYSt2dQZIdXCqezvD4zLvR
	66DX5jAdv7TTQ2ghpTRMXdEROxtyKIuOITWUY1Y=
X-Google-Smtp-Source: AGHT+IHlWJSL+v1L2lw9VEENTbd7+FniMTJi4YOpjY9+FnmdrwanOpKWjo5sk5MiM49brs0DzL3buQvWYYu/r6wP7K0=
X-Received: by 2002:a05:6102:418d:b0:445:4a0c:3afb with SMTP id
 cd13-20020a056102418d00b004454a0c3afbmr1843814vsb.8.1692100944625; Tue, 15
 Aug 2023 05:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064412.2145181-1-milkfafa@gmail.com> <20230704064412.2145181-8-milkfafa@gmail.com>
 <d28bd991-5a28-6f0d-a8d6-64169ff7a698@xs4all.nl>
In-Reply-To: <d28bd991-5a28-6f0d-a8d6-64169ff7a698@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 15 Aug 2023 20:02:13 +0800
Message-ID: <CADnNmFoxgFZi3c9wGoERW4rrPBvMiGyBvUZ7YFu=MpVHbS97pg@mail.gmail.com>
Subject: Re: [PATCH v13 7/7] media: nuvoton: Add driver for NPCM video capture
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

> > can compress the frame data into HEXTITLE format. This driver implements
>
> HEXTITLE -> HEXTILE

> > +       data into HEXTITLE format.
>
> Ditto.

> > +     video->active_timings = video->detected_timings;
>
> Why not let npcm_video_set_resolution() set active_timings?
> And also update pix_fmt? That will also simplify npcm_video_set_dv_timings().

> > +     .type = V4L2_CTRL_TYPE_INTEGER,
>
> This must be of TYPE_MENU. It selects between two
> modes, so that is typically a MENU control. That way you can list
> the possible modes and get a human-readable name for each setting.

These problems will be addressed in v14.


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
> I'm wondering if this shouldn't be an INTEGER array control.
> Either dynamic or just fixed to size VIDEO_MAX_FRAME. That way
> you can set the rectangle count for each buffer index. You wouldn't
> need this to be volatile either in that case.
>
> I don't really like the way it is set up now since if userspace is
> slow in processing a frame the control might have been updated already
> for the next frame and you get the wrong value for the buffer you are
> processing.

When userspace app dequeues a buffer, it needs to know the count of
HEXTILE rectangles in the buffer,
so app will call this control to get the rect count after dequeueing the buffer.

And when a buffer is dequeued, npcm_video_buf_finish() will be called,
in which the buffer index (vb->index) will be stored.
Then when userspace app calls this control,
npcm_video_get_volatile_ctrl() will return the rect count of the
desired buffer index.
In this way, I think the buffer index is always correct even if
userspace is slow.


> > +     if (*num_buffers > VIDEO_MAX_FRAME)
> > +             *num_buffers = VIDEO_MAX_FRAME;
>
> You can drop this test, it's done automatically by the vb2 core.

> > +     for (i = 0; i < *num_buffers; i++)
> > +             INIT_LIST_HEAD(&video->list[i]);
>
> This is incomplete: if VIDIOC_CREATE_BUFS is called additional buffers can be added.
> In that case this function is called with *num_planes already set and *num_buffers
> being the additional buffers you want to add. So in the 'if (*num_planes)' code
> above you need to take care of that.
>
> However, isn't it much easier to just have a fixed 'video->list[VIDEO_MAX_FRAME]' array
> rather than dynamically allocating it? It would simplify the code, and all you need to
> do here is call INIT_LIST_HEAD for all (VIDEO_MAX_FRAME) array elements.

> > +     video->num_buffers = *num_buffers;
>
> You can drop the num_buffers field: just use the num_buffers field of vb2_queue.
>
> This code is incomplete anyway since it doesn't deal with VIDIOC_CREATE_BUFS.
> Much easier to just rely on the vb2_queue information.

Will modify as you suggested. Thanks.

Regards,
Marvin
