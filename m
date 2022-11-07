Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C84861EBC2
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 08:21:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5N2B72vYz303P
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 18:21:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V21INu9s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::934; helo=mail-ua1-x934.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V21INu9s;
	dkim-atps=neutral
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5N1f09Gsz301Z
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 18:20:52 +1100 (AEDT)
Received: by mail-ua1-x934.google.com with SMTP id v8so3763897uap.12
        for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2022 23:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LCSC1Xt7ibn8IOvDjJqPliEyiNhSv3szasXlPzJli/I=;
        b=V21INu9spLmVlUlsn2AwTd97U5fwSzKN/ig69ACcD0O4udIelk4GOxznlRKCnLr2G9
         oNApzsJ/WMmuFjJDmIaihCvcdkWz0RcLNazxgns6Dy/v9R0R5EO2aNCY5qYIoSEaw2WQ
         NlTUBE5P/mjNhZSZl8/MuytNtSWTOGNzV0M/OwE6JXwgFrkOkc7E3IkhuFX/z8tajJ//
         v4NvEiwegteNF9aOihus+vTMOulkUYSHrLMLZOKlJby7KLmOggwJgAndnIWB+4uygltQ
         S7A7rvanFY7hWv42zNgKHDuGS1g9K8L1ynKW7XZ9MJZUvu3ER2hy95K2tGaw/IyafoIT
         ENFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCSC1Xt7ibn8IOvDjJqPliEyiNhSv3szasXlPzJli/I=;
        b=5qaTxFu9h2u/kUMDppYSgyv0BlDbarvXemAO+e4eSSDNNCBRMGvAlnYKTbiJ9C0P9X
         ZnZPuS/wf1cUQcOPpaeXOudKLGBf+ZmlO3KvwEY4v3gMIobK2QSsB/SNpxMV+eU3RRH5
         uP4xK+JdCl6vEh2XXkqyoyUNVTAFvQSEEy+up3UDhKxnaaIFazznRJqkPiQwqejtyTgs
         EGAgOAcl4kEUv7ou+lvBt+eyE+4UObpLExUwrx8PAsCeQFBGbdQHe1q67FzZti2UIGWP
         LyXZzGM2mMY0Hc7wxMefHXLZAf4hDoSs3myOgXLk/lDUCvixYD4Fhm4Ix9URVAY86WEu
         grKQ==
X-Gm-Message-State: ACrzQf3mKz605jW/CP1L5gV79Fh/CNswvvSp2Y6C1qD6y+fKFv/6KKUN
	iv+tCfWrla1tsG73zMtZ6m+5zOtGGRdsXjlZ4b4=
X-Google-Smtp-Source: AMsMyM7GfHOoHTGIzy2QFrYqJaeS2plU7RtHustmbzsq9n87vaiRutdb5sBeo92zjeDyjKKkvMt3kYZNmYL+k2oyopM=
X-Received: by 2002:ab0:7702:0:b0:402:956d:377a with SMTP id
 z2-20020ab07702000000b00402956d377amr13928347uaq.19.1667805648195; Sun, 06
 Nov 2022 23:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20221104033810.1324686-1-milkfafa@gmail.com> <20221104033810.1324686-6-milkfafa@gmail.com>
 <357a3098-918b-895b-7305-0f1a63aacdb0@xs4all.nl>
In-Reply-To: <357a3098-918b-895b-7305-0f1a63aacdb0@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 7 Nov 2022 15:20:36 +0800
Message-ID: <CADnNmFp4r-3+pvHa+_HOxcXAkORadMzgg6fFKbLcgs66a_90gw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

Thanks for the review.

>
> These functions are not usually present when capturing from video. You don't
> have a choice w.r.t. resolution and fps, since that's determined by the
> incoming video. I would drop support for this.

Just to confirm, do you mean `npcm_video_enum_framesizes` and
`npcm_video_enum_frameintervals` functions?


> > +     switch (ctrl->id) {
> > +     case V4L2_CID_DETECT_MD_MODE:
> > +             if (ctrl->val == V4L2_DETECT_MD_MODE_GLOBAL)
> > +                     video->ctrl_cmd = VCD_CMD_OPERATION_CAPTURE;
> > +             else
> > +                     video->ctrl_cmd = VCD_CMD_OPERATION_COMPARE;
> > +     break;
>
> Incorrect indentation for the 'break'.

Will correct it.


> > +     v4l2_ctrl_new_std_menu(&video->ctrl_handler, &npcm_video_ctrl_ops,
> > +                            V4L2_CID_DETECT_MD_MODE,
> > +                            V4L2_DETECT_MD_MODE_REGION_GRID, 0,
> > +                            V4L2_DETECT_MD_MODE_GLOBAL);
>
> Why is this driver using a control designed for motion detection devices?
> That seems odd, and it looks like you are abusing this control to do something
> else.

The Video Capture/Differentiation (VCD) engine supports two modes:
- COMPLETE (capture the next "complete frame" into memory)
- DIFF (compare the incoming frame with the frame stored in memory,
and updates the "diff frame" in memory)

The purpose here is to provide a way for application to switch the
COMPLETE/DIFF mode. Since I couldn't find an appropriate ioctl that is
designed for this purpose, so I used VIDIOC_S_CTRL with control values
of V4L2_DETECT_MD_MODE_GLOBAL (for COMPLETE) and
V4L2_DETECT_MD_MODE_REGION_GRID (for DIFF). It would be appreciated if
you could point me in the right direction.


> When you post v7, please also include the output of v4l2-compliance to the
> cover letter!
> Make sure you compile v4l2-compliance from the v4l-utils git repo, do not
> use a version from a distro, that will be too old.

OK, I'll try to compile v4l2-compliance and include the output.

Regards,
Marvin
