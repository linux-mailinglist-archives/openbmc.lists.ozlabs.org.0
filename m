Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320D42E73D
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 05:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVsHB1sP3z3bhZ
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 14:30:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVsGq73yJz2yM7;
 Fri, 15 Oct 2021 14:30:26 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 19F38CnT038176;
 Fri, 15 Oct 2021 11:08:12 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 15 Oct
 2021 11:29:54 +0800
Message-ID: <e94e8b49-e7cc-c358-3b6b-1af82c70982c@aspeedtech.com>
Date: Fri, 15 Oct 2021 11:29:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/6] media: aspeed: richer debugfs
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
 <20211014034819.2283-7-jammy_huang@aspeedtech.com>
 <f7d3900f-9e1c-1c2b-f14a-a3828852eadc@molgen.mpg.de>
 <53fa3d1a-d75b-2fb1-a315-c6406f33289c@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <53fa3d1a-d75b-2fb1-a315-c6406f33289c@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19F38CnT038176
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thanks for you help. I will have an updated patch later accordingly.

On 2021/10/14 下午 02:57, Paul Menzel wrote:
> Dear Jammy,
>
>
> Am 14.10.21 um 08:54 schrieb Paul Menzel:
>
>> Am 14.10.21 um 05:48 schrieb Jammy Huang:
>> media: aspeed: richer debugfs
> It’d be great if you used a statement by adding a verb in imperative
> mood [1]. Maybe:
>
>> Extend debug message
> or
>
>> Add more debug log messages
>>> updated as below:
>>>
>>> Caputre:
>> Capture
>>
>>>     Mode                : Direct fetch
>>>     VGA bpp mode        : 32
>>>     Signal              : Unlock
>>>     Width               : 1920
>>>     Height              : 1080
>>>     FRC                 : 30
>>>
>>> Compression:
>>>     Format              : JPEG
>>>     Subsampling         : 444
>>>     Quality             : 0
>>>     HQ Mode             : N/A
>>>     HQ Quality          : 0
>>>     Mode                : N/A
>>>
>>> Performance:
>>>     Frame#              : 0
>>>     Frame Duration(ms)  :
>>>       Now               : 0
>>>       Min               : 0
>>>       Max               : 0
>>>     FPS                 : 0
>> Do you have output with non-zero values? ;-)
>>
>> On what device did you test this?
>>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>> ---
>>>    drivers/media/platform/aspeed-video.c | 41 +++++++++++++++++++++++++--
>>>    1 file changed, 38 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/aspeed-video.c
>>> b/drivers/media/platform/aspeed-video.c
>>> index e1031fd09ac6..f2e5c49ee906 100644
>>> --- a/drivers/media/platform/aspeed-video.c
>>> +++ b/drivers/media/platform/aspeed-video.c
>>> @@ -464,6 +464,9 @@ static const struct v4l2_dv_timings_cap
>>> aspeed_video_timings_cap = {
>>>        },
>>>    };
>>> +static const char * const compress_mode_str[] = {"DCT Only",
>>> +    "DCT VQ mix 2-color", "DCT VQ mix 4-color"};
>>> +
>>>    static unsigned int debug;
>>>    static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
>>> @@ -1077,8 +1080,6 @@ static void aspeed_video_set_resolution(struct
>>> aspeed_video *video)
>>>    static void aspeed_video_update_regs(struct aspeed_video *video)
>>>    {
>>> -    static const char * const compress_mode_str[] = {"DCT Only",
>>> -        "DCT VQ mix 2-color", "DCT VQ mix 4-color"};
>>>        u32 comp_ctrl =    FIELD_PREP(VE_COMP_CTRL_DCT_LUM,
>>> video->jpeg_quality) |
>>>            FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
>>>            FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
>>> @@ -1795,9 +1796,29 @@ static const struct vb2_ops
>>> aspeed_video_vb2_ops = {
>>>    static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>>>    {
>>>        struct aspeed_video *v = s->private;
>>> +    u32 val08;
>> Why does `08` refer to?
>>
>>>        seq_puts(s, "\n");
>>> +    val08 = aspeed_video_read(v, VE_CTRL);
>>> +    seq_puts(s, "Caputre:\n");
>>> +    if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
>>> +        seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
>>> +        seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
>>> +               FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
>>> +    } else {
>>> +        seq_printf(s, "  %-20s:\tSync\n", "Mode");
>>> +        seq_printf(s, "  %-20s:\t%s\n", "Video source",
>>> +               FIELD_GET(VE_CTRL_SOURCE, val08) ?
>>> +               "external" : "internal");
>>> +        seq_printf(s, "  %-20s:\t%s\n", "DE source",
>>> +               FIELD_GET(VE_CTRL_INT_DE, val08) ?
>>> +               "internal" : "external");
>>> +        seq_printf(s, "  %-20s:\t%s\n", "Cursor overlay",
>>> +               FIELD_GET(VE_CTRL_AUTO_OR_CURSOR, val08) ?
>>> +               "Without" : "With");
>>> +    }
>>> +
>>>        seq_printf(s, "  %-20s:\t%s\n", "Signal",
>>>               v->v4l2_input_status ? "Unlock" : "Lock");
>>>        seq_printf(s, "  %-20s:\t%d\n", "Width", v->pix_fmt.width);
>>> @@ -1806,6 +1827,21 @@ static int aspeed_video_debugfs_show(struct
>>> seq_file *s, void *data)
>>>        seq_puts(s, "\n");
>>> +    seq_puts(s, "Compression:\n");
>>> +    seq_printf(s, "  %-20s:\t%s\n", "Format",
>>> +           v->partial_jpeg ? "Aspeed" : "JPEG");
>>> +    seq_printf(s, "  %-20s:\t%s\n", "Subsampling",
>>> +           v->yuv420 ? "420" : "444");
>>> +    seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
>>> +    seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
>>> +           v->partial_jpeg ? (v->hq_mode ? "on" : "off") : "N/A");
>>> +    seq_printf(s, "  %-20s:\t%d\n", "HQ Quality", v->jpeg_hq_quality);
>>> +    seq_printf(s, "  %-20s:\t%s\n", "Mode",
>>> +           v->partial_jpeg ? compress_mode_str[v->compression_mode]
>>> +                   : "N/A");
>>> +
>>> +    seq_puts(s, "\n");
>>> +
>>>        seq_puts(s, "Performance:\n");
>>>        seq_printf(s, "  %-20s:\t%d\n", "Frame#", v->sequence);
>>>        seq_printf(s, "  %-20s:\n", "Frame Duration(ms)");
>> Remove the colon, and add a space before (?
>>
>>> @@ -1814,7 +1850,6 @@ static int aspeed_video_debugfs_show(struct
>>> seq_file *s, void *data)
>>>        seq_printf(s, "    %-18s:\t%d\n", "Max", v->perf.duration_max);
>>>        seq_printf(s, "  %-20s:\t%d\n", "FPS",
>>> 1000/(v->perf.totaltime/v->sequence));
>>> -
>>>        return 0;
>>>    }
>
> Kind regards,
>
> Paul
>
>
> [1]: https://chris.beams.io/posts/git-commit/
