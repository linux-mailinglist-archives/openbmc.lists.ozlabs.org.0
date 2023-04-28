Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9A6F128E
	for <lists+openbmc@lfdr.de>; Fri, 28 Apr 2023 09:41:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q74Kp0N9Fz3ch6
	for <lists+openbmc@lfdr.de>; Fri, 28 Apr 2023 17:41:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=o9mc1/g7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=o9mc1/g7;
	dkim-atps=neutral
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q74KD65b2z3c3W
	for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2023 17:40:46 +1000 (AEST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-772002b8694so3289931241.3
        for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2023 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682667643; x=1685259643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MnQ5of6M5/y7NIEMwyCrgsAXsP/6p2NWEIphTReCHEM=;
        b=o9mc1/g7mBWHjnVTA6rJ/gtnlcn3yIosoBwhs0YVtkhqkH6vQncrIO/B+LDPDJ/9tp
         IZtNSYL9F12hLX0U9o2p+Ie3FyfFskFqHfKAOZIKj5DJadgOBY5/WKqZI8VgF6Xflf/R
         lFCwaABW1YUvgH8Luh01/5Y2z2EEgiD7sGkPuMyhFvXFQzdYlFIsPfQkkEIN+gjDySQc
         idmVofYdKf/o1oZl83ANxLD47SjSFldOLV/3Go1xLtKNEPaQyisDWtIqP1RvC8K8nvD1
         a1p0K1OtJg3temYIZW+kaWpgmt/V+9LLb7UgVMuJ1hcre0Si01amy6z9Cfdq+Y6DtbhY
         bLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682667643; x=1685259643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnQ5of6M5/y7NIEMwyCrgsAXsP/6p2NWEIphTReCHEM=;
        b=k7JW4nwev+qYKYRMpfoxtOcQjOwh+4PH6ulvpaS3LynhPRZqdRLgn0gdrlLqyIAeOX
         mx0IsF/daltkv6rq/iL513Glal5VPFvOJ8tj1wOLaFTN2rUxCRSEqUfx/hGV+UlEJI5t
         FAw+Y5XCHIhL/8Ff8Iy5OuS2CLgQ27U2hmSNv8CLrxiJbY9eeCPDo/rFdRYVsxIFcgu4
         L/eO8FnkKMLQlWhzG7OrSx+6JrEOsnpiDRhfeuJ2Ea23n47905XjAVSMdln4iP6b2sRx
         pHBAlYcuaIrfd7btfJsqPItAV0wgIs+nLQFwxoojkv+RwVebp3Y3Y6Lhyb89hAffgn+T
         Lapw==
X-Gm-Message-State: AC+VfDyZoSld7IhbqEq1Seh12umPAprlk0jLnYMSfYeD5SUlIgpylAIs
	W6XNhpBzbSA7qcLnCkutmtl/+ZPMiVGSKzWFACM=
X-Google-Smtp-Source: ACHHUZ73o2NFQLqN/VJRmpmG5rttPIfs6eFu1Z7n2MTiFytaKZNNxdtR5y2DVukspV/gGCNoBDGiBrAO9+GsIrdOxb4=
X-Received: by 2002:a05:6102:2455:b0:430:3aec:efb5 with SMTP id
 g21-20020a056102245500b004303aecefb5mr2036514vss.3.1682667643018; Fri, 28 Apr
 2023 00:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230207091902.2512905-1-milkfafa@gmail.com> <20230207091902.2512905-8-milkfafa@gmail.com>
 <d91457ea-44c3-b96b-ce60-3e5ce9a80f7b@xs4all.nl>
In-Reply-To: <d91457ea-44c3-b96b-ce60-3e5ce9a80f7b@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Fri, 28 Apr 2023 15:40:31 +0800
Message-ID: <CADnNmFoJc_9irFx8CbmnXZ+qW_XNRJ5-SbBLLiAXYS8PHb0LPA@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] media: nuvoton: Add driver for NPCM video capture
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

Sorry for the late response.

> > +static void npcm_video_get_resolution(struct npcm_video *video)
>
> I think 'ncpm_video_detect_resolution' might be a better name.

OK, will change to 'ncpm_video_detect_resolution'.


> > +{
> > +     struct v4l2_bt_timings *act = &video->active_timings;
> > +     struct v4l2_bt_timings *det = &video->detected_timings;
> > +     struct regmap *gfxi;
> > +     unsigned int dispst;
> > +
> > +     video->v4l2_input_status = 0;
> > +     det->width = npcm_video_hres(video);
> > +     det->height = npcm_video_vres(video);
> > +
> > +     if (act->width != det->width || act->height != det->height) {
> > +             dev_dbg(video->dev, "Resolution changed\n");
> > +             npcm_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>
> Why return all buffers? You shouldn't have to do this.
>
> Right now this function is only called at start streaming and when
> query_dv_timings is called. Is it possible for the resolution to change
> while streaming? If so, do you get an interrupt or is there some other
> mechanism to detect this? Normally a resolution change will raise a
> V4L2_EVENT_SOURCE_CHANGE event, and userspace then decides what to do
> (typically stopping streaming and reconfiguring the video pipeline).
>
> What happens if you continue streaming when the resolution changes?
> Particularly when the new resolution is larger than the current
> buffer size.

Yes, it is possible for the resolution to change while streaming.
In our case, userspace application keeps monitoring resolution by
calling query_dv_timings,
and it will stop streaming and reconfiguration if resolution changes.
I've checked that VCD can support resolution change interruptions.
I'll add interrupt support as you suggested.


> > +     if (det->width == 0 || det->height == 0) {
> > +             det->width = MIN_WIDTH;
> > +             det->height = MIN_HEIGHT;
> > +             npcm_video_clear_gmmap(video);
>
> This looks like a potentially dangerous side-effect. I would not expect this
> function to have any side effects: it just detects the new resolution.

Will remove this and modify the flow of ncpm_video_detect_resolution.


> > +static int npcm_video_enum_input(struct file *file, void *fh,
> > +                              struct v4l2_input *inp)
> > +{
> > +     struct npcm_video *video = video_drvdata(file);
> > +
> > +     if (inp->index)
> > +             return -EINVAL;
> > +
>
> You need to call npcm_video_get_resolution(video); here as well,
> to ensure inp->status is valid. Although ideally you know if there is a
> new resolution due to an interrupt or something like that.

Understand. Will add support for resolution change interrupt to ensure
inp->status is valid.


> > +     if (vb2_is_busy(&video->queue)) {
> > +             dev_err(video->dev, "%s device busy\n", __func__);
> > +             return -EBUSY;
> > +     }
> > +
> > +     video->active_timings = timings->bt;
>
> This updates the active_timings even if npcm_video_set_resolution
> fails. Is that what you would expect?

active_timings should be updated only if npcm_video_set_resolution
succeeds, will modify it.


> > +static int npcm_video_sub_event(struct v4l2_fh *fh,
> > +                             const struct v4l2_event_subscription *sub)
> > +{
> > +     switch (sub->type) {
> > +     case V4L2_EVENT_SOURCE_CHANGE:
> > +             return v4l2_src_change_event_subscribe(fh, sub);
> > +     }
>
> This makes no sense unless you can actually detect resolution changes
> and raise this event.
>
> If there is no easy asynchronous way of telling the driver that the resolution
> changed, would it be possible to have a thread that periodically checks the
> current detected resolution?

Will add support for resolution change interrupt and raise the event.


> > +     switch (ctrl->id) {
> > +     case V4L2_CID_NPCM_RECT_COUNT:
> > +             ctrl->val = video->rect[video->vb_index];
>
> Does this change per frame? This is not really a reliable way of passing this
> information to userspace.
>
> I also wonder if the number of rects isn't something that can be deduced from
> the payload size of the buffer.

VCD supports two capture modes:
  - COMPLETE mode: Capture the next complete frame into memory.
  - DIFF mode: Compare the incoming frame with the frame stored in
memory, and update the differentiated rects in memory.

If using COMPLETE mode, rect_count is always 1 (complete frame).
If using DIFF mode, rect_count will be the number of differentiated rects.
In DIFF mode case, rect_count is not deducible so userspace needs to
use V4L2_CID_NPCM_RECT_COUNT control to get the information.


> > +     kfree(video->rect);
> > +     video->rect = NULL;
>
> This line is not needed.
>
> > +
> > +     video->rect = kcalloc(*num_buffers, sizeof(*video->rect), GFP_KERNEL);
>
> Possibly overkill to allocate this. It can be an array of size VIDEO_MAX_FRAME
> as well. Up to you, though.

OK, I will modify it as you suggested.


> > +     vbq->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
>
> Does VB2_READ make sense? It can't really be used with a HEXTILE format
> since that has variable length payloads, and with read() you don't know
> the size of each compressed frame.

VB2_READ should be removed. Thank you so much for the detailed review.

Regards,
Marvin
