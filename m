Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E28324904D6
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 10:29:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcmnB5WLKz30Lp
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 20:29:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=rstl=sb=xs4all.nl=hverkuil-cisco@kernel.org;
 receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcmmt2Vlsz2yJV;
 Mon, 17 Jan 2022 20:28:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 030AC61117;
 Mon, 17 Jan 2022 09:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C524C36AE3;
 Mon, 17 Jan 2022 09:28:40 +0000 (UTC)
Message-ID: <d4ccf803-3736-d95d-19a9-f3593465b81e@xs4all.nl>
Date: Mon, 17 Jan 2022 10:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v8 1/4] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
References: <20211224012738.1551-1-jammy_huang@aspeedtech.com>
 <20211224012738.1551-2-jammy_huang@aspeedtech.com>
 <703ff71e-c76a-9df1-c644-04efed0199ca@xs4all.nl>
 <609cfe9e-2fd8-b31a-9d71-b83d61693f84@aspeedtech.com>
 <CACPK8XeJQHLWfVbBjArxV_QMDDnRXfccOeXdsn6aBEG7gd8yvw@mail.gmail.com>
 <98096e97-68cc-18fd-d2b6-3477f57f05bd@aspeedtech.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <98096e97-68cc-18fd-d2b6-3477f57f05bd@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On 1/17/22 08:18, Jammy Huang wrote:
> On 2022/1/17 上午 10:24, Joel Stanley wrote:
>> On Mon, 17 Jan 2022 at 02:00, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>>> Hi Hans,
>>>
>>> On 2022/1/14 下午 04:11, Hans Verkuil wrote:
>>>> On 24/12/2021 02:27, Jammy Huang wrote:
>>>>> This introduces support for the Aspeed JPEG format, where the new frame
>>>>> can refer to previous frame to reduce the amount of compressed data. The
>>>>> concept is similar to I/P frame of video compression. It will compare the
>>>>> new frame with previous one to decide which macroblock's data is
>>>>> changed, and only the changed macroblocks will be compressed.
>>>>>
>>>>> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
>>>>> which is generally adapted for remote KVM.
>>>>>
>>>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>>>> ---
>>>>> v8:
>>>>>     - Add decoder information for aspeed-jpeg
>>>>> v7:
>>>>>     - Add more information for aspeed-jpeg
>>>>> v6:
>>>>>     - Update description for new format, aspeed-jpeg, in Documentation.
>>>>> v5:
>>>>>     - no update
>>>>> v4:
>>>>>     - new
>>>>> ---
>>>>>    .../media/uapi/v4l/pixfmt-reserved.rst          | 17 +++++++++++++++++
>>>>>    drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>>>>>    include/uapi/linux/videodev2.h                  |  1 +
>>>>>    3 files changed, 19 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>> This is the wrong file! It should be:
>>>>
>>>> Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>>> Thanks, I just used git format-patch to generate the cover-letter and
>>> didn't notice this.
>>>
>>> It looks like the file, pixfmt-reserved.rst, has different path in
>>> different Linux kernel,
>>>
>>> * 5.4:           Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>
>>> * 5.10/5.15: Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>>>
>>> 5.4 is the one I based to submit the patches.
>>>
>>> Could you suggest the kernel that I should based to submit these patches??
>> You should always submit based on the latest release.
>>
>> There are sometimes exceptions where you will base your patches on
>> something even newer, but generally you should grab the latest.
>>
>> Be sure to re-test on the latest kernel before submitting.
> OK, thank you.

I recommend waiting until later this week. I hope to have a PR for other outstanding
aspeed patches ready in a few days. It is easiest if you base your v9 on top of that
series, this to avoid merge conflicts.

Regards,

	Hans

>>
>> Cheers,
>>
>> Joel
>>
>>> I will need to change the number of V4L2_CID_USER_ASPEED_BASE per different
>>>
>>> linux kernel as well.
>>>
>>>> Regards,
>>>>
>>>>        Hans
>>>>
>>>>> index b2cd155e691b..1d0dc8d86ed7 100644
>>>>> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>>> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>>>> @@ -264,6 +264,23 @@ please make a proposal on the linux-media mailing list.
>>>>>       of tiles, resulting in 32-aligned resolutions for the luminance plane
>>>>>       and 16-aligned resolutions for the chrominance plane (with 2x2
>>>>>       subsampling).
>>>>> +    * .. _V4L2-PIX-FMT-AJPG:
>>>>> +
>>>>> +      - ``V4L2_PIX_FMT_AJPG``
>>>>> +      - 'AJPG'
>>>>> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
>>>>> +        which is generally adapted for remote KVM.
>>>>> +        On each frame compression, I will compare the new frame with previous
>>>>> +        one to decide which macroblock's data is changed, and only the changed
>>>>> +        macroblocks will be compressed.
>>>>> +
>>>>> +        The implementation is based on AST2600 A3 datasheet, revision 0.9, which
>>>>> +        is not publicly available. Or you can reference Video stream data format
>>>>> +        – ASPEED mode compression of SDK_User_Guide which available on
>>>>> +        AspeedTech-BMC/openbmc/releases.
>>>>> +
>>>>> +        Decoder's implementation can be found here,
>>>>> +        `https://github.com/AspeedTech-BMC/aspeed_codec/ <https://github.com/AspeedTech-BMC/aspeed_codec/>`__
>>>>>
>>>>>    .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> index 24db33f803c0..00dde01d2f97 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> @@ -1378,6 +1378,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>               case V4L2_PIX_FMT_S5C_UYVY_JPG: descr = "S5C73MX interleaved UYVY/JPEG"; break;
>>>>>               case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>>>>>               case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
>>>>> +            case V4L2_PIX_FMT_AJPG:         descr = "Aspeed JPEG"; break;
>>>>>               default:
>>>>>                       if (fmt->description[0])
>>>>>                               return;
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index 3210b3c82a4a..994eb6155ea9 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -726,6 +726,7 @@ struct v4l2_pix_format {
>>>>>    #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
>>>>>    #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
>>>>>    #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
>>>>> +#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
>>>>>
>>>>>    /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>>>>>    #define V4L2_PIX_FMT_IPU3_SBGGR10  v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
>>> -- 
>>> Best Regards
>>> Jammy
>>>
