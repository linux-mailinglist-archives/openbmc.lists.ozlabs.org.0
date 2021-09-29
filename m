Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A426E41BF33
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 08:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK68M4MrGz2ybM
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 16:36:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK68314vKz2xvf;
 Wed, 29 Sep 2021 16:35:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18T6EPnn024057;
 Wed, 29 Sep 2021 14:14:25 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 29 Sep
 2021 14:35:10 +0800
Message-ID: <8143a6aa-743f-f00e-482f-ea280969e0c6@aspeedtech.com>
Date: Wed, 29 Sep 2021 14:35:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RESEND PATCH] media: aspeed: add debugfs
Content-Language: en-US
To: Zev Weiss <zweiss@equinix.com>
References: <20210929011652.1709-1-jammy_huang@aspeedtech.com>
 <20210929053049.GQ17315@packtop>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20210929053049.GQ17315@packtop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18T6EPnn024057
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On 2021/9/29 下午 01:30, Zev Weiss wrote:
> On Tue, Sep 28, 2021 at 06:16:53PM PDT, Jammy Huang wrote:
>> To show video real-time information as below:
>>
>>     Signal|           Resolution|       FRC
>>           |     Width     Height|
>>       Lock|      1920       1080|         0
>>
>>     Frame#|       Frame Duration|       FPS
>>           |    Now    Min    Max|
>>        496|     26     25     30|        40
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>> drivers/media/platform/aspeed-video.c | 100 ++++++++++++++++++++++++++
>> 1 file changed, 100 insertions(+)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 8b3939b8052d..5b98dc7b7b15 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -21,6 +21,8 @@
>> #include <linux/videodev2.h>
>> #include <linux/wait.h>
>> #include <linux/workqueue.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/ktime.h>
>> #include <media/v4l2-ctrls.h>
>> #include <media/v4l2-dev.h>
>> #include <media/v4l2-device.h>
>> @@ -203,6 +205,14 @@ struct aspeed_video_buffer {
>> 	struct list_head link;
>> };
>>
>> +struct aspeed_video_perf {
>> +	ktime_t last_sample;
>> +	u32 totaltime;
>> +	u32 duration;
>> +	u32 duration_min;
>> +	u32 duration_max;
>> +};
>> +
>> #define to_aspeed_video_buffer(x) \
>> 	container_of((x), struct aspeed_video_buffer, vb)
>>
>> @@ -241,6 +251,8 @@ struct aspeed_video {
>> 	unsigned int frame_left;
>> 	unsigned int frame_right;
>> 	unsigned int frame_top;
>> +
>> +	struct aspeed_video_perf perf;
>> };
>>
>> #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>> @@ -444,6 +456,18 @@ static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
>> 		readl(video->base + reg));
>> }
>>
>> +static void update_perf(struct aspeed_video *v)
>> +{
>> +	v->perf.duration =
>> +		ktime_to_ms(ktime_sub(ktime_get(),  v->perf.last_sample));
>> +	v->perf.totaltime += v->perf.duration;
>> +
>> +	if (!v->perf.duration_max || v->perf.duration > v->perf.duration_max)
>> +		v->perf.duration_max = v->perf.duration;
> How about
>
>    v->perf.duration_max = max(v->perf.duration, v->perf.duration_max);
>
> instead of manually testing & branching?
OK, this will be included in the next patch.
>> +	if (!v->perf.duration_min || v->perf.duration < v->perf.duration_min)
>> +		v->perf.duration_min = v->perf.duration;
> And likewise with min(...) here.
>
> As a minor style thing, I might suggest adding a variable declaration
> like
>
>    struct aspeed_video_perf *p = &v->perf;
>
> and using that in the rest of the function to cut down on the
> verbosity/repetition a bit.  Or actually, since it looks like there
> aren't any other members of struct aspeed_video accessed in this
> function, maybe just make struct aspeed_video_perf be the parameter
> instead?
OK, this will be included in the next patch.
>
>> +}
>> +
>> static int aspeed_video_start_frame(struct aspeed_video *video)
>> {
>> 	dma_addr_t addr;
>> @@ -482,6 +506,8 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>> 	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>> 			    VE_INTERRUPT_COMP_COMPLETE);
>>
>> +	video->perf.last_sample = ktime_get();
>> +
>> 	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>> 			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
>>
>> @@ -600,6 +626,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>> 		u32 frame_size = aspeed_video_read(video,
>> 						   VE_JPEG_COMP_SIZE_READ_BACK);
>>
>> +		update_perf(video);
>> +
>> 		spin_lock(&video->lock);
>> 		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>> 		buf = list_first_entry_or_null(&video->buffers,
>> @@ -760,6 +788,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>> 	det->width = MIN_WIDTH;
>> 	det->height = MIN_HEIGHT;
>> 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>> +	memset(&video->perf, 0, sizeof(video->perf));
>>
>> 	do {
>> 		if (tries) {
>> @@ -1517,6 +1546,71 @@ static const struct vb2_ops aspeed_video_vb2_ops = {
>> 	.buf_queue =  aspeed_video_buf_queue,
>> };
>>
>> +#ifdef CONFIG_DEBUG_FS
>> +static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>> +{
>> +	struct aspeed_video *v = s->private;
>> +
>> +	seq_printf(s, "%10s|%21s|%10s\n",
>> +		   "Signal", "Resolution", "FRC");
>> +	seq_printf(s, "%10s|%10s%11s|%10s\n",
>> +		   "", "Width", "Height", "");
>> +	seq_printf(s, "%10s|%10d%11d|%10d\n",
>> +		   v->v4l2_input_status ? "Unlock" : "Lock",
>> +		   v->pix_fmt.width, v->pix_fmt.height, v->frame_rate);
>> +
>> +	seq_puts(s, "\n");
>> +
>> +	seq_printf(s, "%10s|%21s|%10s\n",
>> +		   "Frame#", "Frame Duration", "FPS");
>> +	seq_printf(s, "%10s|%7s%7s%7s|%10s\n",
>> +		   "", "Now", "Min", "Max", "");
>> +	seq_printf(s, "%10d|%7d%7d%7d|%10d\n",
>> +		   v->sequence, v->perf.duration, v->perf.duration_min,
>> +		   v->perf.duration_max, 1000/(v->perf.totaltime/v->sequence));
>> +
> This looks like a convenient format for eyeballing with 'cat', but also
> like it would be kind of awkward to parse if you wanted to do any sort
> of automated analysis of the performance data it provides.  Would a
> key:value type format like
>
>    width: %d
>    height: %d
>    frame_rate: %d
>    frame_number: %d
>    # etc.
>
> maybe provide a decent compromise?  (Easily parseable, almost as easily
> readable.)

Your concern is reasonable, I will change the style to show information.

This will be included in the next patch.

>
>> +	return 0;
>> +}
>> +
>> +int aspeed_video_proc_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, aspeed_video_debugfs_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations aspeed_video_debugfs_ops = {
>> +	.owner   = THIS_MODULE,
>> +	.open    = aspeed_video_proc_open,
>> +	.read    = seq_read,
>> +	.llseek  = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +static struct dentry *debugfs_entry;
> I don't know how realistic the odds are of a system ever having multiple
> aspeed-video devices, but structurally would this make more sense as
> part of struct aspeed_video instead of being a single global?

Since this is the driver for aspeed-video ip of SoC, it couldn't have 
multiple devices.

>> +
>> +static void aspeed_video_debugfs_remove(struct aspeed_video *video)
>> +{
>> +	debugfs_remove_recursive(debugfs_entry);
>> +	debugfs_entry = NULL;
>> +}
>> +
>> +static int aspeed_video_debugfs_create(struct aspeed_video *video)
>> +{
>> +	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
>> +						   video,
>> +						   &aspeed_video_debugfs_ops);
>> +	if (!debugfs_entry)
>> +		aspeed_video_debugfs_remove(video);
>> +
>> +	return debugfs_entry == NULL ? -EIO : 0;
>> +}
>> +#else
>> +static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
>> +static int aspeed_video_debugfs_create(struct aspeed_video *video)
>> +{
>> +	return 0;
>> +}
>> +#endif /* CONFIG_DEBUG_FS */
>> +
>> static int aspeed_video_setup_video(struct aspeed_video *video)
>> {
>> 	const u64 mask = ~(BIT(V4L2_JPEG_CHROMA_SUBSAMPLING_444) |
>> @@ -1708,6 +1802,10 @@ static int aspeed_video_probe(struct platform_device *pdev)
>> 		return rc;
>> 	}
>>
>> +	rc = aspeed_video_debugfs_create(video);
>> +	if (rc)
>> +		dev_err(video->dev, "debugfs create failed\n");
>> +
>> 	return 0;
>> }
>>
>> @@ -1719,6 +1817,8 @@ static int aspeed_video_remove(struct platform_device *pdev)
>>
>> 	aspeed_video_off(video);
>>
>> +	aspeed_video_debugfs_remove(video);
>> +
>> 	clk_unprepare(video->vclk);
>> 	clk_unprepare(video->eclk);
>>
>> -- 
>> 2.25.1
>>
