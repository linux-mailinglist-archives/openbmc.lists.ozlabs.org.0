Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B4455B98
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 13:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvzl36QCtz3bX0
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 23:34:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hvzkm5wd5z2xrl;
 Thu, 18 Nov 2021 23:34:24 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="320389998"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="320389998"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 04:33:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="455312743"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 04:33:18 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 34F2C20282;
 Thu, 18 Nov 2021 14:33:16 +0200 (EET)
Date: Thu, 18 Nov 2021 14:33:16 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 05/10] media: v4l: Add definition for the Aspeed JPEG
 format
Message-ID: <YZZIDNCLJXwrqY4W@paasikivi.fi.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-6-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118074030.685-6-jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On Thu, Nov 18, 2021 at 03:40:26PM +0800, Jammy Huang wrote:
> This introduces support for the Aspeed JPEG format, where the new frame
> can refer to previous frame to reduce the amount of compressed data. The
> concept is similar to I/P frame of video compression. I will compare the
> new frame with previous one to decide which macroblock's data is
> changed, and only the changed macroblocks will be compressed.
> 
> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
> which is generally adapted for remote KVM.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v5:
>   - no update
> v4:
>   - new
> ---
>  Documentation/media/uapi/v4l/pixfmt-reserved.rst | 12 ++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
>  include/uapi/linux/videodev2.h                   |  1 +
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> index b2cd155e691b..23c05063133d 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> @@ -264,6 +264,18 @@ please make a proposal on the linux-media mailing list.
>  	of tiles, resulting in 32-aligned resolutions for the luminance plane
>  	and 16-aligned resolutions for the chrominance plane (with 2x2
>  	subsampling).
> +    * .. _V4L2-PIX-FMT-AJPG:
> +
> +      - ``V4L2_PIX_FMT_AJPG``
> +      - 'AJPG'
> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
> +        which is generally adapted for remote KVM.
> +        On each frame compression, I will compare the new frame with previous
> +        one to decide which macroblock's data is changed, and only the changed
> +        macroblocks will be compressed.
> +
> +        You could reference to chapter 36, Video Engine, of AST2600's datasheet
> +        for more information.

Is this datasheet publicly available? Do you have a URL?

-- 
Regards,

Sakari Ailus
