Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E457426B7
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 14:49:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=P3EPMDYm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsJF516Ktz3bVv
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 22:49:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=P3EPMDYm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsJDT2hhBz3040
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 22:49:11 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4717089ae5bso240096e0c.0
        for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688042947; x=1690634947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vibqGgTSkZNI78S50QxrbWxjy/o83ic28jzcG95Wy2Q=;
        b=P3EPMDYmvOSSNO9IpZqusoOBhARr6/ZEj3M9vLeC2NLXktdqWrxRP6VCiBJB2OfVNO
         poEVY6xEQCXTliwFgS7PtM5HIu6UcG9AeFUQT9d3+0PK1E8f5g3lD/9H8L8gZ3jvqgyq
         E3MATdkd4sCHDdQIL8RznP6cNlvtmN34rMtE+aUmE7aDTLDM+xoyod8fJ+HpUMWjmc7C
         LDWLNoZa81W3LdFza0scs6+quKYp5DrvUtWbvDybN9e4w5ER1pqgVhtpQ2KQt0cq84to
         eh+Ot6kJKqTWzN1RoCAGL6YJsKiOw2Cjut2vNti/xl6r2ofFasHqv0v7msfHvoyhYpxE
         JIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688042947; x=1690634947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vibqGgTSkZNI78S50QxrbWxjy/o83ic28jzcG95Wy2Q=;
        b=O8jT9pd+JBMzMRZ2kn+Hpa8jJ321O6llTyqT+xwBBZKonFA+L0Zec1btsENR35Gw/a
         +YSUQ89REoNLCCcMZKu/ME6/zTD1Icdvy0rnY2AYlSc90iaJ+7hqj7R/b19YhG27gGni
         CobN9WX4t6/1J5Y3jqX/yKU55NzwBrrZC7kDjUoqaJspYp0bzy0E7k3FA2KCruaGmyjx
         eNAqhSVKaFRTSO2/ccwwP29RAUgOra/sgxGrWqk9pY6Zubr9SMP3HI5B6NcyFS8YL8Id
         waWudUT9xq0JxuylM8dh5BldUBVW68Dkys7le0AhFOhrhPqDnMg1h2RZF9OvgAk6p/ep
         dqdw==
X-Gm-Message-State: AC+VfDxZ0CqcE3xov65RE8lp0N7RNcZDc0lDdQFB6BpD0eZQ5lfWppqv
	mXaBfNNcLvWKaObmVrJmv5/ki779x1m9TTvqNk6vCSjjWckXzQ==
X-Google-Smtp-Source: ACHHUZ7Imuyy+vaxv6ag//M1MbImCVZ/QGl59+QnilJ6V+R09MX3TvxgWSai1hFKtmimL+klvWeZki159QVoEgIick8=
X-Received: by 2002:a1f:c1c3:0:b0:471:5224:bbdf with SMTP id
 r186-20020a1fc1c3000000b004715224bbdfmr19495635vkf.3.1688042947552; Thu, 29
 Jun 2023 05:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230502084430.234182-1-milkfafa@gmail.com> <20230502084430.234182-8-milkfafa@gmail.com>
 <e43029b5-edbb-9358-a0a6-a104ff2fa154@xs4all.nl>
In-Reply-To: <e43029b5-edbb-9358-a0a6-a104ff2fa154@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 29 Jun 2023 20:48:56 +0800
Message-ID: <CADnNmFpSg+nU+gvc-CUzYRJ6newCrgLesoLda6kHJ6o2a8Su5A@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] media: nuvoton: Add driver for NPCM video capture
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

> Apologies for the delay in reviewing this. As you may have noticed, we
> have too many incoming patches and not enough reviewers, so it takes
> too often way too long before I have time to review drivers like this.

That's OK. I appreciate your time and comments.

> > +     /* Resolution changed */
> > +     if (status & VCD_STAT_VHT_CHG || status & VCD_STAT_HAC_CHG)
> > +             schedule_work(&video->res_work);
>
> I don't think you need to schedule work. If the resolution changed,
> then you can just call vb2_queue_error and queue the SOURCE_CHANGED
> event here. You don't need to detect the resolution, you know it has changed,
> so just inform userspace and that will call QUERY_DV_TIMINGS.

OK. Will modify it as you suggested.

> > +     if (status & VCD_STAT_IFOR || status & VCD_STAT_IFOT) {
> > +             dev_warn(video->dev, "VCD FIFO overrun or over thresholds\n");
> > +             npcm_video_stop(video);
> > +             npcm_video_start(video);
>
> This is dangerous: video_start detects the resolution and can update the
> width/height. So now there can be a mismatch between what userspace expects
> and what the DMA sends.
>
> I would make a new npcm_video_init(video) function that does the initial
> timings detection. Call that on the first open. The npcm_video_start drops
> that code and just uses the last set timings.
>
> Feel free to use an alternative to this, as long as restarting the video
> here doesn't change the width/height/format as a side-effect.

Understood. I've checked that it can just call npcm_video_start_frame (in which
npcm_video_vcd_state_machine_reset will be called to reset VCD state
machine and FIFOs) and
the width/height/format will not be changed.

> > +     if (*num_buffers > MAX_REQ_BUFS)
> > +             *num_buffers = MAX_REQ_BUFS;
>
> Why limit this? Can't you just use rect[VIDEO_MAX_FRAME]?

I just realized VIDEO_MAX_FRAME is a common define in videodev2.h.
Will change to use it.

> > +     /*
> > +      * When a video buffer is dequeued, free associated rect_list and
> > +      * capture next frame.
> > +      */
> > +     head = &video->list[video->vb_index];
> > +     list_for_each_safe(pos, nx, head) {
> > +             tmp = list_entry(pos, struct rect_list, list);
> > +             list_del(&tmp->list);
> > +             kfree(tmp);
> > +     }
> > +
> > +     if (npcm_video_start_frame(video)) {
>
> This is weird. This is not normally done here since you never know when
> userspace will dequeue a buffer.
>
> I would expect to see this called:
>
> 1) In start_streaming (so that works)
> 2) When a buffer is captured and vb2_buffer_done is called: if another
>    empty buffer is available, then use that.
> 3) in buf_queue: if the buffer list was empty, and vb2_start_streaming_called()
>    is true, then you can start capturing again.

Will modify as you suggested. Thanks for the guide.

Regards,
Marvin
