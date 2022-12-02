Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511BD640886
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 15:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNwRn0qWtz3bfG
	for <lists+openbmc@lfdr.de>; Sat,  3 Dec 2022 01:33:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FeDHOOuO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FeDHOOuO;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNwR63C6sz30Qv;
	Sat,  3 Dec 2022 01:33:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669991602; x=1701527602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n2a/CpHAAbyq8nKYEBLb4Z+TMWPhb76u70lEuNyc05Y=;
  b=FeDHOOuOmn2pd/TzOCTedD5iu4Ie0d3jfqBd9lJSh67hPvuiydxJx0Zz
   aZIoGMf8DRuDSvZEKgio9mHsv2le6lcpOOAT4dJhC+at8J7tszLHD46no
   pQIs1pGWD85ccJ3HVSdq35AMAoUNvMr5OqnEACXmaXO8bWCc6LnbGEckm
   +Opgu10TzOCpTI08Fbk3IzWJPBwufIGTTthHQitfBivDUvV2sIi5RYbrW
   ZAXtsHYPshoHzw9uCfXSrnGZIBF7RIjuurejiPqarBluixZucRwxSP38v
   GvX0K9x+e0WlUDtDvcks51UYCpkwRDPKMoJIXyV2FZLGLw7wrFY3pt66n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314665460"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="314665460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 06:33:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="677614996"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="677614996"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 06:33:14 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id F0A3220363;
	Fri,  2 Dec 2022 16:24:28 +0200 (EET)
Date: Fri, 2 Dec 2022 14:24:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v11 3/5] media: Documentation: aspeed-video: Add user
 documentation for the aspeed-video driver
Message-ID: <Y4oKnBDnvliD8cJb@paasikivi.fi.intel.com>
References: <20221028023554.928-1-jammy_huang@aspeedtech.com>
 <20221028023554.928-4-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028023554.928-4-jammy_huang@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, andrzej.p@collabora.com, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, xavier.roumegue@oss.nxp.com, stanimir.varbanov@linaro.org, joel@jms.id.au, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, ming.qian@nxp.com, laurent.pinchart@ideasonboard.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On Fri, Oct 28, 2022 at 10:35:52AM +0800, Jammy Huang wrote:
> Add user documentation for the aspeed-video driver.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v11:
>   - update the way to change format
> v10:
>   - new
> ---
>  .../media/drivers/aspeed-video.rst            | 61 +++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/aspeed-video.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/aspeed-video.rst b/Documentation/userspace-api/media/drivers/aspeed-video.rst
> new file mode 100644
> index 000000000000..e5656a8d990e
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/aspeed-video.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: <isonum.txt>
> +
> +ASPEED video driver
> +===================
> +
> +ASPEED Video Engine found on AST2400/2500/2600 SoC supports high performance
> +video compressions with a wide range of video quality and compression ratio
> +options. The adopted compressing algorithm is a modified JPEG algorithm.
> +
> +There are 2 types of compressions in this IP.
> +
> +* JPEG JFIF standard mode: for single frame and management compression
> +* ASPEED proprietary mode: for multi-frame and differential compression.
> +  Support 2-pass (high quality) video compression scheme (Patent pending by
> +  ASPEED). Provide visually lossless video compression quality or to reduce
> +  the network average loading under intranet KVM applications.
> +
> +VIDIOC_S_FMT can be used to choose which format you want. V4L2_PIX_FMT_JPEG
> +stands for JPEG JFIF standard mode; V4L2_PIX_FMT_AJPG stands for ASPEED
> +proprietary mode.
> +
> +More details on the ASPEED video hardware operations can be found in
> +*chapter 6.2.16 KVM Video Driver* of SDK_User_Guide which available on
> +AspeedTech-BMC/openbmc/releases.

Same comment on this, what does this refer to?

> +
> +The ASPEED video driver implements the following driver-specific control:
> +
> +``V4L2_CID_ASPEED_HQ_MODE``
> +-------------------------------
> +    Enable/Disable ASPEED's High quality mode. This is a private control
> +    that can be used to enable high quality for aspeed proprietary mode.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 4
> +
> +    * - ``(0)``
> +      - ASPEED HQ mode is disabled.
> +    * - ``(1)``
> +      - ASPEED HQ mode is enabled.
> +
> +``V4L2_CID_ASPEED_HQ_JPEG_QUALITY``
> +-------------------------------
> +    Define the quality of ASPEED's High quality mode. This is a private control
> +    that can be used to decide compression quality if High quality mode enabled
> +    . Higher the value, better the quality and bigger the size.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 4
> +
> +    * - ``(1)``
> +      - minimum
> +    * - ``(12)``
> +      - maximum
> +    * - ``(1)``
> +      - step
> +    * - ``(1)``
> +      - default
> +
> +**Copyright** |copy| 2022 ASPEED Technology Inc.
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 32f82aed47d9..46a494e00b72 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -31,6 +31,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  	:maxdepth: 5
>  	:numbered:
>  
> +	aspeed-video
>  	ccs
>  	cx2341x-uapi
>  	dw100

-- 
Kind regards,

Sakari Ailus
