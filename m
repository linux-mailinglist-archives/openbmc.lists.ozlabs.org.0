Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF742E669
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 04:17:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVqfQ1VbCz301g
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 13:17:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVqf12nbLz2xb2;
 Fri, 15 Oct 2021 13:16:52 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 19F1sJ3k031168;
 Fri, 15 Oct 2021 09:54:19 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 15 Oct
 2021 10:16:01 +0800
Message-ID: <c367c670-5e57-4bf2-06ab-06c4af0853c7@aspeedtech.com>
Date: Fri, 15 Oct 2021 10:16:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/6] media: aspeed: add dprintk for more detailed log
 control
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
 <20211014034819.2283-3-jammy_huang@aspeedtech.com>
 <5b8f81aa-9d08-dc42-8bd5-e9e7560f37f6@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <5b8f81aa-9d08-dc42-8bd5-e9e7560f37f6@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19F1sJ3k031168
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
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thanks for your help.

I will try to come out another patch which uses either 
v4l2_info/v4l2_err/v4l2_warn/v4l2_dbg
or other 'native' Linux kernel solution.

On 2021/10/14 下午 02:28, Paul Menzel wrote:
> [Cc: +Steven, +Ingo for tracing questions]
>
> Dear Jammy,
>
>
> Am 14.10.21 um 05:48 schrieb Jammy Huang:
>> Add dprintk to categorize the log into NOTICE/INFO/TRACE/IRQ/REG.
>> The on/off is controlled by module_param, debug.
> Currently dev_dbg is dynamic debug, which can be controlled using the
> Linux kernel command line or debugfs already?
>
>   From your patch:
>
>> +MODULE_PARM_DESC(debug, "set debugging level (0=reg,2=irq,4=trace,8=info(|-able)).");
> What does (|-able) mean? Maybe give some examples in the commit message
> as documentation?
I will modify the description to make this more clear.
>
> Lastly, instead of parameter name `debug`, I’d use `log_level`, which
> would be more accurate.
Your consideration is understood, but please refer to the following 2 
cases:

1. "include/media/v4l2-common.h"

  70 #define v4l2_dbg(level, debug, dev, fmt, 
arg...)                        \
  71         do 
{                                                            \
  72                 if (debug >= 
(level))                                   \
  73                         v4l2_printk(KERN_DEBUG, dev, fmt , ## 
arg);     \
  74         } while (0)

2. "drivers/media/platform/vivid/vivid-core.c"

135 unsigned vivid_debug;
136 module_param(vivid_debug, uint, 0644);
137 MODULE_PARM_DESC(vivid_debug, " activates debug info");

> Why is more granularity needed/useful, and not just debug and non-debug,
> where the existing Linux kernel levels `pr_info`, `pr_warn`, … are used?
> Looking at the amount of log messages, the granularity does not look needed.

As you said, there isn't large amount of log messages currently. But 
during the development
of the aspeed-jpeg support, the amount of log increased. That is why I 
want to add this log
control. Besides, the log of reg-access, 
aspeed_video_read/aspeed_video_write/
aspeed_video_update,is too noisy.

>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>    drivers/media/platform/aspeed-video.c | 73 ++++++++++++++++++++++-----
>>    1 file changed, 60 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 6259cf17a7cc..7b8129b0ca5f 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -31,6 +31,19 @@
>>    #include <media/v4l2-ioctl.h>
>>    #include <media/videobuf2-dma-contig.h>
>>    
>> +
>> +#define LOG_REG		BIT(4)
>> +#define LOG_DEBUG	BIT(3)
>> +#define LOG_TRACE	BIT(2)
> Could ftrace be used for this? It looks like there are static functions.
> No idea, if there is already a “native” Linux kernel solution for this.
>
>> +#define LOG_INFO	BIT(1)
>> +#define LOG_NOTICE	BIT(0)
>> +
>> +#define dprintk(level, fmt, arg...) do {					\
>> +	if (debug & level)							\
>> +		pr_debug(pr_fmt("[%s]: " fmt), DEVICE_NAME, ##arg);		\
>> +} while (0)
>> +
>> +
>>    #define DEVICE_NAME			"aspeed-video"
>>    
>>    #define ASPEED_VIDEO_JPEG_NUM_QUALITIES	12
>> @@ -390,6 +403,8 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
>>    	},
>>    };
>>    
>> +static unsigned int debug;
>> +
>>    static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
>>    {
>>    	int i;
>> @@ -437,7 +452,7 @@ static void aspeed_video_update(struct aspeed_video *video, u32 reg, u32 clear,
>>    	t &= ~clear;
>>    	t |= bits;
>>    	writel(t, video->base + reg);
>> -	dev_dbg(video->dev, "update %03x[%08x -> %08x]\n", reg, before,
>> +	dprintk(LOG_REG, "update %03x[%08x -> %08x]\n", reg, before,
>>    		readl(video->base + reg));
>>    }
>>    
>> @@ -445,14 +460,14 @@ static u32 aspeed_video_read(struct aspeed_video *video, u32 reg)
>>    {
>>    	u32 t = readl(video->base + reg);
>>    
>> -	dev_dbg(video->dev, "read %03x[%08x]\n", reg, t);
>> +	dprintk(LOG_REG, "read %03x[%08x]\n", reg, t);
>>    	return t;
>>    }
>>    
>>    static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
>>    {
>>    	writel(val, video->base + reg);
>> -	dev_dbg(video->dev, "write %03x[%08x]\n", reg,
>> +	dprintk(LOG_REG, "write %03x[%08x]\n", reg,
>>    		readl(video->base + reg));
>>    }
>>    
>> @@ -474,13 +489,13 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>>    	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
>>    
>>    	if (video->v4l2_input_status) {
>> -		dev_dbg(video->dev, "No signal; don't start frame\n");
>> +		dprintk(LOG_NOTICE, "No signal; don't start frame\n");
>>    		return 0;
>>    	}
>>    
>>    	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
>>    	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
>> -		dev_dbg(video->dev, "Engine busy; don't start frame\n");
>> +		dprintk(LOG_NOTICE, "Engine busy; don't start frame\n");
>>    		return -EBUSY;
>>    	}
>>    
>> @@ -489,7 +504,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>>    				       struct aspeed_video_buffer, link);
>>    	if (!buf) {
>>    		spin_unlock_irqrestore(&video->lock, flags);
>> -		dev_dbg(video->dev, "No buffers; don't start frame\n");
>> +		dprintk(LOG_NOTICE, "No buffers; don't start frame\n");
>>    		return -EPROTO;
>>    	}
>>    
>> @@ -565,7 +580,7 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
>>    
>>    static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>>    {
>> -	dev_dbg(video->dev, "Resolution changed; resetting\n");
>> +	dprintk(LOG_INFO, "Resolution changed; resetting\n");
>>    
>>    	set_bit(VIDEO_RES_CHANGE, &video->flags);
>>    	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>> @@ -590,6 +605,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>    	struct aspeed_video *video = arg;
>>    	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>>    
>> +	dprintk(LOG_DEBUG, "irq sts=%#x %s%s%s%s\n", sts,
>> +		sts & VE_INTERRUPT_MODE_DETECT_WD ? ", unlock" : "",
>> +		sts & VE_INTERRUPT_MODE_DETECT ? ", lock" : "",
>> +		sts & VE_INTERRUPT_CAPTURE_COMPLETE ? ", capture-done" : "",
>> +		sts & VE_INTERRUPT_COMP_COMPLETE ? ", comp-done" : "");
>> +
> Please split adding new log messages out into a separate commit.
>
>>    	/*
>>    	 * Resolution changed or signal was lost; reset the engine and
>>    	 * re-initialize
>> @@ -766,7 +787,7 @@ static void aspeed_video_calc_compressed_size(struct aspeed_video *video,
>>    	aspeed_video_write(video, VE_STREAM_BUF_SIZE,
>>    			   compression_buffer_size_reg);
>>    
>> -	dev_dbg(video->dev, "Max compressed size: %x\n",
>> +	dprintk(LOG_INFO, "Max compressed size: %#x\n",
>>    		video->max_compressed_size);
>>    }
>>    
>> @@ -804,7 +825,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>    						      res_check(video),
>>    						      MODE_DETECT_TIMEOUT);
>>    		if (!rc) {
>> -			dev_dbg(video->dev, "Timed out; first mode detect\n");
>> +			dprintk(LOG_INFO, "Timed out; first mode detect\n");
>>    			clear_bit(VIDEO_RES_DETECT, &video->flags);
>>    			return;
>>    		}
>> @@ -822,7 +843,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>    						      MODE_DETECT_TIMEOUT);
>>    		clear_bit(VIDEO_RES_DETECT, &video->flags);
>>    		if (!rc) {
>> -			dev_dbg(video->dev, "Timed out; second mode detect\n");
>> +			dprintk(LOG_INFO, "Timed out; second mode detect\n");
>>    			return;
>>    		}
>>    
>> @@ -856,7 +877,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>    	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
>>    
>>    	if (invalid_resolution) {
>> -		dev_dbg(video->dev, "Invalid resolution detected\n");
>> +		dprintk(LOG_NOTICE, "Invalid resolution detected\n");
>>    		return;
>>    	}
>>    
>> @@ -873,7 +894,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>    	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>>    			    VE_SEQ_CTRL_AUTO_COMP | VE_SEQ_CTRL_EN_WATCHDOG);
>>    
>> -	dev_dbg(video->dev, "Got resolution: %dx%d\n", det->width,
>> +	dprintk(LOG_INFO, "Got resolution: %dx%d\n", det->width,
>>    		det->height);
>>    }
>>    
>> @@ -907,6 +928,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>    
>>    	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>>    	if (size < DIRECT_FETCH_THRESHOLD) {
>> +		dprintk(LOG_INFO, "Capture: Sync Mode\n");
>>    		aspeed_video_write(video, VE_TGS_0,
>>    				   FIELD_PREP(VE_TGS_FIRST,
>>    					      video->frame_left - 1) |
>> @@ -918,6 +940,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>    					      video->frame_bottom + 1));
>>    		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
>>    	} else {
>> +		dprintk(LOG_INFO, "Capture: Direct Mode\n");
>>    		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>>    	}
>>    
>> @@ -934,6 +957,10 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>    		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
>>    			goto err_mem;
>>    
>> +		dprintk(LOG_INFO, "src buf0 addr(%#x) size(%d)\n",
>> +			video->srcs[0].dma, video->srcs[0].size);
>> +		dprintk(LOG_INFO, "src buf1 addr(%#x) size(%d)\n",
>> +			video->srcs[1].dma, video->srcs[1].size);
>>    		aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
>>    		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
>>    	}
>> @@ -1010,6 +1037,8 @@ static void aspeed_video_start(struct aspeed_video *video)
>>    
>>    static void aspeed_video_stop(struct aspeed_video *video)
>>    {
>> +	dprintk(LOG_TRACE, "%s\n", __func__);
>> +
>>    	set_bit(VIDEO_STOPPED, &video->flags);
>>    	cancel_delayed_work_sync(&video->res_work);
>>    
>> @@ -1198,6 +1227,9 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
>>    
>>    	timings->type = V4L2_DV_BT_656_1120;
>>    
>> +	dprintk(LOG_INFO, "set new timings(%dx%d)\n", timings->bt.width,
>> +		timings->bt.height);
>> +
>>    	return 0;
>>    }
>>    
>> @@ -1362,6 +1394,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>    						  res_work);
>>    	u32 input_status = video->v4l2_input_status;
>>    
>> +	dprintk(LOG_TRACE, "%s+\n", __func__);
>> +
>>    	aspeed_video_on(video);
>>    
>>    	/* Exit early in case no clients remain */
>> @@ -1380,6 +1414,7 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>    			.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>>    		};
>>    
>> +		dprintk(LOG_INFO, "fire source change event\n");
>>    		v4l2_event_queue(&video->vdev, &ev);
>>    	} else if (test_bit(VIDEO_STREAMING, &video->flags)) {
>>    		/* No resolution change so just restart streaming */
>> @@ -1389,6 +1424,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>>    done:
>>    	clear_bit(VIDEO_RES_CHANGE, &video->flags);
>>    	wake_up_interruptible_all(&video->wait);
>> +
>> +	dprintk(LOG_TRACE, "%s-\n", __func__);
>>    }
>>    
>>    static int aspeed_video_open(struct file *file)
>> @@ -1476,6 +1513,7 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
>>    	int rc;
>>    	struct aspeed_video *video = vb2_get_drv_priv(q);
>>    
>> +	dprintk(LOG_TRACE, "%s\n", __func__);
>>    	video->sequence = 0;
>>    	video->perf.duration_max = 0;
>>    	video->perf.duration_min = 0xffffffff;
>> @@ -1495,13 +1533,15 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>>    	int rc;
>>    	struct aspeed_video *video = vb2_get_drv_priv(q);
>>    
>> +	dprintk(LOG_TRACE, "%s+\n", __func__);
>> +
>>    	clear_bit(VIDEO_STREAMING, &video->flags);
>>    
>>    	rc = wait_event_timeout(video->wait,
>>    				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
>>    				STOP_TIMEOUT);
>>    	if (!rc) {
>> -		dev_dbg(video->dev, "Timed out when stopping streaming\n");
>> +		dprintk(LOG_NOTICE, "Timed out when stopping streaming\n");
>>    
>>    		/*
>>    		 * Need to force stop any DMA and try and get HW into a good
>> @@ -1516,6 +1556,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>>    	}
>>    
>>    	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>> +	dprintk(LOG_TRACE, "%s-\n", __func__);
>>    }
>>    
>>    static void aspeed_video_buf_queue(struct vb2_buffer *vb)
>> @@ -1715,6 +1756,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>>    		dev_err(dev, "Unable to request IRQ %d\n", irq);
>>    		return rc;
>>    	}
>> +	dev_info(video->dev, "irq %d\n", irq);
>>    
>>    	video->eclk = devm_clk_get(dev, "eclk");
>>    	if (IS_ERR(video->eclk)) {
>> @@ -1751,6 +1793,8 @@ static int aspeed_video_init(struct aspeed_video *video)
>>    		rc = -ENOMEM;
>>    		goto err_release_reserved_mem;
>>    	}
>> +	dev_info(video->dev, "alloc mem size(%d) at %#x for jpeg header\n",
>> +		 VE_JPEG_HEADER_SIZE, video->jpeg.dma);
>>    
>>    	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
>>    
>> @@ -1856,6 +1900,9 @@ static struct platform_driver aspeed_video_driver = {
>>    
>>    module_platform_driver(aspeed_video_driver);
>>    
>> +module_param(debug, int, 0644);
>> +MODULE_PARM_DESC(debug, "set debugging level (0=reg,2=irq,4=trace,8=info(|-able)).");
>> +
>>    MODULE_DESCRIPTION("ASPEED Video Engine Driver");
>>    MODULE_AUTHOR("Eddie James");
>>    MODULE_LICENSE("GPL v2");
>
> Kind regards,
>
> Paul
