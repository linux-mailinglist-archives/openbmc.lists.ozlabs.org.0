Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F261ECCF
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 09:24:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5PQc64Xjz3bms
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 19:24:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=890f=3h=xs4all.nl=hverkuil@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5PQG3Y36z303P
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 19:23:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F34FA60F13;
	Mon,  7 Nov 2022 08:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D10AC433D6;
	Mon,  7 Nov 2022 08:23:43 +0000 (UTC)
Message-ID: <daab81c3-4592-5ef0-5a0e-5f89fe58a3e7@xs4all.nl>
Date: Mon, 7 Nov 2022 09:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v6 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
To: Kun-Fa Lin <milkfafa@gmail.com>
References: <20221104033810.1324686-1-milkfafa@gmail.com>
 <20221104033810.1324686-6-milkfafa@gmail.com>
 <357a3098-918b-895b-7305-0f1a63aacdb0@xs4all.nl>
 <CADnNmFp4r-3+pvHa+_HOxcXAkORadMzgg6fFKbLcgs66a_90gw@mail.gmail.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CADnNmFp4r-3+pvHa+_HOxcXAkORadMzgg6fFKbLcgs66a_90gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 07/11/2022 08:20, Kun-Fa Lin wrote:
> Hi Hans,
> 
> Thanks for the review.
> 
>>
>> These functions are not usually present when capturing from video. You don't
>> have a choice w.r.t. resolution and fps, since that's determined by the
>> incoming video. I would drop support for this.
> 
> Just to confirm, do you mean `npcm_video_enum_framesizes` and
> `npcm_video_enum_frameintervals` functions?

Right.

> 
> 
>>> +     switch (ctrl->id) {
>>> +     case V4L2_CID_DETECT_MD_MODE:
>>> +             if (ctrl->val == V4L2_DETECT_MD_MODE_GLOBAL)
>>> +                     video->ctrl_cmd = VCD_CMD_OPERATION_CAPTURE;
>>> +             else
>>> +                     video->ctrl_cmd = VCD_CMD_OPERATION_COMPARE;
>>> +     break;
>>
>> Incorrect indentation for the 'break'.
> 
> Will correct it.
> 
> 
>>> +     v4l2_ctrl_new_std_menu(&video->ctrl_handler, &npcm_video_ctrl_ops,
>>> +                            V4L2_CID_DETECT_MD_MODE,
>>> +                            V4L2_DETECT_MD_MODE_REGION_GRID, 0,
>>> +                            V4L2_DETECT_MD_MODE_GLOBAL);
>>
>> Why is this driver using a control designed for motion detection devices?
>> That seems odd, and it looks like you are abusing this control to do something
>> else.
> 
> The Video Capture/Differentiation (VCD) engine supports two modes:
> - COMPLETE (capture the next "complete frame" into memory)
> - DIFF (compare the incoming frame with the frame stored in memory,
> and updates the "diff frame" in memory)
> 
> The purpose here is to provide a way for application to switch the
> COMPLETE/DIFF mode. Since I couldn't find an appropriate ioctl that is
> designed for this purpose, so I used VIDIOC_S_CTRL with control values
> of V4L2_DETECT_MD_MODE_GLOBAL (for COMPLETE) and
> V4L2_DETECT_MD_MODE_REGION_GRID (for DIFF). It would be appreciated if
> you could point me in the right direction.

This is very much a driver-specific control. So you have to make your
own.

This series is a good example on how to add a custom control:

https://lore.kernel.org/linux-media/20221028023554.928-1-jammy_huang@aspeedtech.com/

Driver-specific controls are fine, as long as they are properly documented.

> 
> 
>> When you post v7, please also include the output of v4l2-compliance to the
>> cover letter!
>> Make sure you compile v4l2-compliance from the v4l-utils git repo, do not
>> use a version from a distro, that will be too old.
> 
> OK, I'll try to compile v4l2-compliance and include the output.
> 
> Regards,
> Marvin

Regards,

	Hans
