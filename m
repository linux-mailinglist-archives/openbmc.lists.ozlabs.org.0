Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F433605B94
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 11:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtNK775hrz3dsM
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 20:56:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtNJj0K7lz3c46;
	Thu, 20 Oct 2022 20:55:47 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 29K9W5Jd085421;
	Thu, 20 Oct 2022 17:32:05 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 20 Oct
 2022 17:54:32 +0800
Message-ID: <a9dc473c-1556-bd3d-fc1f-5a7e54d21352@aspeedtech.com>
Date: Thu, 20 Oct 2022 17:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v9 1/4] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20220921025112.13150-1-jammy_huang@aspeedtech.com>
 <20220921025112.13150-2-jammy_huang@aspeedtech.com>
 <Yy2tAlGXFJS+a2Lz@paasikivi.fi.intel.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <Yy2tAlGXFJS+a2Lz@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29K9W5Jd085421
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
Cc: ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com, laurent.pinchart@ideasonboard.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, stanimir.varbanov@linaro.org, joel@jms.id.au, ribalda@chromium.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sakari,

Thanks for your review.

On 2022/9/23 下午 08:56, Sakari Ailus wrote:
> Hi Jammy,
>
> Thanks for the update.
>
> On Wed, Sep 21, 2022 at 10:51:09AM +0800, Jammy Huang wrote:
>> This introduces support for the Aspeed JPEG format, where the new frame
>> can refer to previous frame to reduce the amount of compressed data.
>> The concept is similar to I/P frame of video compression. It will
>> compare the new frame with previous one to decide which macroblock's
>> data is changed, and only the changed macroblocks will be compressed.
>>
>> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
>> which is generally adapted for remote KVM.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   .../userspace-api/media/v4l/pixfmt-reserved.rst | 17 +++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>>   include/uapi/linux/videodev2.h                  |  1 +
>>   3 files changed, 19 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> index 0ff68cd8cf62..f62bc76d606f 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> @@ -258,6 +258,23 @@ please make a proposal on the linux-media mailing list.
>>           and it is used by various multimedia hardware blocks like GPU, display
>>           controllers, ISP and video accelerators.
>>           It contains four planes for progressive video.
>> +    * .. _V4L2-PIX-FMT-AJPG:
>> +
>> +      - ``V4L2_PIX_FMT_AJPG``
>> +      - 'AJPG'
>> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
>> +        which is generally adapted for remote KVM.
>> +        On each frame compression, I will compare the new frame with previous
>> +        one to decide which macroblock's data is changed, and only the changed
>> +        macroblocks will be compressed.
>> +
>> +        The implementation is based on AST2600 A3 datasheet, revision 0.9, which
>> +        is not publicly available. Or you can reference Video stream data format
>> +        – ASPEED mode compression of SDK_User_Guide which available on
>> +        AspeedTech-BMC/openbmc/releases.
>> +
>> +        Decoder's implementation can be found here,
>> +        `https://github.com/AspeedTech-BMC/aspeed_codec/ <https://github.com/AspeedTech-BMC/aspeed_codec/>`__
> This is better than the previous versions.
>
> Can you still run
>
> $ scripts/checkpatch.pl --strict --max-line-length=80
>
> ?
I will correct the length to meet the rule.
>
> On the decoder --- which values is the user supposed to use for mode_420,
> selector and advance_selector parameters? I think this needs to be
> documented.

I will update following information to aspeed_codec's github, and 
provide recommended

values.

"The following parameters should be provided by the encoded stream to 
let decoder

know how to work, because Aspeed codec does not include the information 
needed

for decoding in the header. Users can adjust the three parameters, 
mode420, selector,

and advance_selector, to achieve the desired quality level while at the 
same time

reduce the storage size."

>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index a1a1b51ac599..c72bc3410bee 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1497,6 +1497,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>>   		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
>>   		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>> +		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>>   		default:
>>   			if (fmt->description[0])
>>   				return;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 86cae23cc446..870a7e5ef8ca 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
>>   #define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
>>   #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
>> +#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
>>   
>>   /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>>   #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */

-- 
Best Regards
Jammy

