Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CC605829
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 09:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtJm76WsCz3dtX
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 18:15:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtJll1Y7pz2xGJ;
	Thu, 20 Oct 2022 18:15:27 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 29K6p5ZF071387;
	Thu, 20 Oct 2022 14:51:05 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 20 Oct
 2022 15:13:31 +0800
Content-Type: multipart/alternative;
	boundary="------------dq5xC4Ws5wwbKFxMgQzbqj02"
Message-ID: <f91799bc-2b61-f3bd-93c8-43f99decdfa0@aspeedtech.com>
Date: Thu, 20 Oct 2022 15:13:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v9 1/4] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To: "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "mchehab@kernel.org"
	<mchehab@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au"
	<andrew@aj.id.au>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>,
        "ezequiel@vanguardiasur.com.ar"
	<ezequiel@vanguardiasur.com.ar>,
        "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>,
        "stanimir.varbanov@linaro.org"
	<stanimir.varbanov@linaro.org>,
        "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>,
        "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>,
        "ribalda@chromium.org" <ribalda@chromium.org>
References: <20220921025112.13150-1-jammy_huang@aspeedtech.com>
 <20220921025112.13150-2-jammy_huang@aspeedtech.com>
 <d34e9d22-231c-a843-ecc9-71480d68f918@aspeedtech.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <d34e9d22-231c-a843-ecc9-71480d68f918@aspeedtech.com>
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29K6p5ZF071387
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------dq5xC4Ws5wwbKFxMgQzbqj02
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thanks for your review.

On 2022/09/23 下午 12:56, Sakari Ailus wrote:
> Hi Jammy,
>
> Thanks for the update.
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
>> Signed-off-by: Jammy Huang<jammy_huang@aspeedtech.com>
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
>> +        `https://github.com/AspeedTech-BMC/aspeed_codec/  <https://github.com/AspeedTech-BMC/aspeed_codec/>`__
>
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

I will add following information to aspeed_codec's github, and provide 
recommended

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
> -- 
> Kind regards,
>
> Sakari Ailus
>
-- 
Best Regards
Jammy

--------------dq5xC4Ws5wwbKFxMgQzbqj02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Sakari,</p>
    <p>Thanks for your review.<br>
    </p>
    <div class="moz-cite-prefix">On 2022/09/23 下午 12:56, Sakari Ailus
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d34e9d22-231c-a843-ecc9-71480d68f918@aspeedtech.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi Jammy,

Thanks for the update.</pre>
      <div class="moz-cite-prefix">On Wed, Sep 21, 2022 at 10:51:09AM
        +0800, Jammy Huang wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20220921025112.13150-2-jammy_huang@aspeedtech.com">
        <pre class="moz-quote-pre" wrap="">This introduces support for the Aspeed JPEG format, where the new frame
can refer to previous frame to reduce the amount of compressed data.
The concept is similar to I/P frame of video compression. It will
compare the new frame with previous one to decide which macroblock's
data is changed, and only the changed macroblocks will be compressed.

This Aspeed JPEG format is used by the video engine on Aspeed platforms,
which is generally adapted for remote KVM.

Signed-off-by: Jammy Huang <a class="moz-txt-link-rfc2396E" href="mailto:jammy_huang@aspeedtech.com" moz-do-not-send="true">&lt;jammy_huang@aspeedtech.com&gt;</a>
---
 .../userspace-api/media/v4l/pixfmt-reserved.rst | 17 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
 include/uapi/linux/videodev2.h                  |  1 +
 3 files changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 0ff68cd8cf62..f62bc76d606f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -258,6 +258,23 @@ please make a proposal on the linux-media mailing list.
         and it is used by various multimedia hardware blocks like GPU, display
         controllers, ISP and video accelerators.
         It contains four planes for progressive video.
+    * .. _V4L2-PIX-FMT-AJPG:
+
+      - ``V4L2_PIX_FMT_AJPG``
+      - 'AJPG'
+      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
+        which is generally adapted for remote KVM.
+        On each frame compression, I will compare the new frame with previous
+        one to decide which macroblock's data is changed, and only the changed
+        macroblocks will be compressed.
+
+        The implementation is based on AST2600 A3 datasheet, revision 0.9, which
+        is not publicly available. Or you can reference Video stream data format
+        – ASPEED mode compression of SDK_User_Guide which available on
+        AspeedTech-BMC/openbmc/releases.
+
+        Decoder's implementation can be found here,
+        `<a class="moz-txt-link-freetext" href="https://github.com/AspeedTech-BMC/aspeed_codec/" moz-do-not-send="true">https://github.com/AspeedTech-BMC/aspeed_codec/</a> <a class="moz-txt-link-rfc2396E" href="https://github.com/AspeedTech-BMC/aspeed_codec/" moz-do-not-send="true">&lt;https://github.com/AspeedTech-BMC/aspeed_codec/&gt;</a>`__</pre>
      </blockquote>
      <br>
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">This is better than the previous versions.

Can you still run

$ scripts/checkpatch.pl --strict --max-line-length=80

?</pre>
    </blockquote>
    <p>I will correct the length to meet the rule.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:d34e9d22-231c-a843-ecc9-71480d68f918@aspeedtech.com">
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">

On the decoder --- which values is the user supposed to use for mode_420,
selector and advance_selector parameters? I think this needs to be
documented.</pre>
    </blockquote>
    <p>I will add following information to aspeed_codec's github, and
      provide recommended</p>
    <p>values.<br>
    </p>
    <p>"The following parameters should be provided by the encoded
      stream to let decoder</p>
    <p> know how to work, because Aspeed codec does not include the
      information needed</p>
    <p> for decoding in the header. Users can adjust the three
      parameters, mode420, selector,</p>
    <p> and advance_selector, to achieve the desired quality level while
      at the same time</p>
    <p>reduce the storage size."</p>
    <blockquote type="cite"
      cite="mid:d34e9d22-231c-a843-ecc9-71480d68f918@aspeedtech.com">
      <blockquote type="cite"
        cite="mid:20220921025112.13150-2-jammy_huang@aspeedtech.com">
        <pre class="moz-quote-pre" wrap=""> .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a1a1b51ac599..c72bc3410bee 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1497,6 +1497,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
+		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		default:
 			if (fmt-&gt;description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 86cae23cc446..870a7e5ef8ca 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
 #define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
 #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
+#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
 
 /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
</pre>
      </blockquote>
      <pre class="moz-signature" cols="72">-- 
Kind regards,

Sakari Ailus

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Best Regards
Jammy</pre>
  </body>
</html>

--------------dq5xC4Ws5wwbKFxMgQzbqj02--
