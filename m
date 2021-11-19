Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B863456BC1
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 09:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwVTX13Mxz3bXP
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 19:39:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwVTC0jk6z2yP7;
 Fri, 19 Nov 2021 19:39:25 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aeced.dynamic.kabel-deutschland.de
 [95.90.236.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 154ED61E5FE02;
 Fri, 19 Nov 2021 09:39:19 +0100 (CET)
Message-ID: <1cc9afa7-397e-64a0-9f1b-b4d3bd85a8f0@molgen.mpg.de>
Date: Fri, 19 Nov 2021 09:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 05/10] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-6-jammy_huang@aspeedtech.com>
 <YZZIDNCLJXwrqY4W@paasikivi.fi.intel.com>
 <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <0bed6093-0af6-4fc4-716f-6cf8b1302320@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Dear Jammy,


Am 19.11.21 um 03:02 schrieb Jammy Huang:

> On 2021/11/18 下午 08:33, Sakari Ailus wrote:

>> On Thu, Nov 18, 2021 at 03:40:26PM +0800, Jammy Huang wrote:
>>> This introduces support for the Aspeed JPEG format, where the new frame
>>> can refer to previous frame to reduce the amount of compressed data. The
>>> concept is similar to I/P frame of video compression. I will compare the
>>> new frame with previous one to decide which macroblock's data is
>>> changed, and only the changed macroblocks will be compressed.
>>>
>>> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
>>> which is generally adapted for remote KVM.
>>>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>> ---
>>> v5:
>>>    - no update
>>> v4:
>>>    - new
>>> ---
>>>   Documentation/media/uapi/v4l/pixfmt-reserved.rst | 12 ++++++++++++
>>>   drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
>>>   include/uapi/linux/videodev2.h                   |  1 +
>>>   3 files changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst 
>>> b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>> index b2cd155e691b..23c05063133d 100644
>>> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
>>> @@ -264,6 +264,18 @@ please make a proposal on the linux-media 
>>> mailing list.
>>>       of tiles, resulting in 32-aligned resolutions for the luminance 
>>> plane
>>>       and 16-aligned resolutions for the chrominance plane (with 2x2
>>>       subsampling).
>>> +    * .. _V4L2-PIX-FMT-AJPG:
>>> +
>>> +      - ``V4L2_PIX_FMT_AJPG``
>>> +      - 'AJPG'
>>> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
>>> +        which is generally adapted for remote KVM.
>>> +        On each frame compression, I will compare the new frame with previous
>>> +        one to decide which macroblock's data is changed, and only the changed
>>> +        macroblocks will be compressed.
>>> +
>>> +        You could reference to chapter 36, Video Engine, of AST2600's datasheet
>>> +        for more information.
>> Is this datasheet publicly available? Do you have a URL?
> 
> Sorry, this datasheet is not publicly available.
> Hans mentioned this as well in the discussion below:
> 
> https://lkml.org/lkml/2021/11/10/101

If questions come up during review, please also add the answers to the 
commit message of the next iteration. ;-) Maybe:

> The implementation is based on datasheet *Name goes here*, revision
> X, which is not publicly available.

Kind regards,

Paul
