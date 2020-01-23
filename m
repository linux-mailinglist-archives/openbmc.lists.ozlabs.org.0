Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AB146F83
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 18:22:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483TbW1g8KzDqYq
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 04:21:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483TZH4Wt0zDqY4
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 04:20:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 09:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="228064785"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
 by orsmga003.jf.intel.com with ESMTP; 23 Jan 2020 09:20:49 -0800
Subject: Re: ikvm on AST2500
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>, openbmc@lists.ozlabs.org
References: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <81118db3-4259-254f-9e91-0f26e6d84c0d@linux.intel.com>
Date: Thu, 23 Jan 2020 09:20:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Konstantin,

On 1/23/2020 6:59 AM, Konstantin Klubnichkin wrote:
> Hello all!
> I'm trying to make ikvm alive on AST2500 BMC on a custom motherboard.
> So far I was able to compile in video-engine and set it up in DTS 
> (together with shared memory), obmc-ikvm is also there.
> After BMC is up there is /dev/video0 device.
> So I've done dd if=/dev/video0 of=/tmp/video.jpeg, terminated dd after 
> couple of seconds, uploaded video.jpeg and opened it with image viewer - 
> it's JPEG file with the screen image on it. From this I conclude that 
> kernel driver is working, DTS is configured correctly and hardware is 
> operational.
> But if I ssh to BMC with -L 5900:127.0.0.1:5900, and then run vncviewer 
> 127.0.0.1 I see only black screen. The resolution is correct, but it's 
> just black.
> vncviewer reports:
> ==============================================
> $ vncviewer 127.0.0.1
> Connected to RFB server, using protocol version 3.8
> No authentication needed
> Authentication successful
> Desktop name "OpenBMC IKVM"
> VNC server default format:
> 32 bits per pixel.
> Least significant byte first in each pixel.
> True colour: max red 255 green 255 blue 255, shift red 0 green 8 blue 16
> Using default colormap which is TrueColor. Pixel format:
> 32 bits per pixel.
> Least significant byte first in each pixel.
> True colour: max red 255 green 255 blue 255, shift red 16 green 8 blue 0
> Same machine: preferring raw encoding
> ==============================================
> obmc-ikvm also pretends to work:
> ==============================================
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Got 
> connection from client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 0 other 
> clients
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Client 
> Protocol Version 3.8
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Protocol 
> version sent 3.8, using 3.8
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 
> rfbProcessClientSecurityType: executing handler for type 1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 
> rfbProcessClientSecurityType: returning securityResult for client rfb 
> version >= 3.8
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Pixel 
> format for client 127.0.0.1:
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 32 bpp, 
> depth 24, little endian
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 true 
> colour: max r 255 g 255 b 255, shift r 16 g 8 b 0
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Using 
> compression level 1 for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Using 
> image quality level 6 for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Using JPEG 
> subsampling 0, Q79 for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Enabling 
> X-style cursor updates for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Enabling 
> full-color cursor updates for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Enabling 
> cursor position updates for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Enabling 
> LastRect protocol extension for client 127.0.0.1
> Jan 01 00:02:25 purley-mb obmc-ikvm[257]: 01/01/1970 00:02:25 Using raw 
> encoding for client 127.0.0.1
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 Client 
> 127.0.0.1 gone
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 Statistics 
> events Transmit/ RawEquiv ( saved)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 
> FramebufferUpdate : 1 | 0/ 0 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 raw : 1 | 
> 1920012/ 1920012 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 PointerPos 
> : 1 | 12/ 12 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 RichCursor 
> : 1 | 1684/ 1684 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 TOTALS : 4 
> | 1921708/ 1921708 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 Statistics 
> events Received/ RawEquiv ( saved)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 
> ClientCutText : 1 | 30/ 30 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 
> PointerEvent : 357 | 2142/ 2142 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 
> FramebufferUpdate : 2 | 20/ 20 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 
> SetEncodings : 1 | 56/ 56 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 
> SetPixelFormat : 1 | 20/ 20 ( 0.0%)
> Jan 01 00:04:57 purley-mb obmc-ikvm[257]: 01/01/1970 00:04:57 TOTALS : 
> 362 | 2268/ 2268 ( 0.0%)
> ==============================================
> So I think that somehow ikvm is not able to correctly recode image from 
> jpeg (as it supplied by hardware and driver) into VNC compatible format.
> Could you please give an advice how to fix it?

Please give it a try again using TightVNC viewer. ikvm uses the Tight
encoding so viewer should support the format. Or, you can use bmcweb
instead.

Cheers,

Jae


> Thank you!
> -- 
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
