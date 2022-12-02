Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A664085B
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 15:24:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNwFD5P7Rz30Qv
	for <lists+openbmc@lfdr.de>; Sat,  3 Dec 2022 01:24:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hf1tAjVR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hf1tAjVR;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNwDV23pYz30RJ;
	Sat,  3 Dec 2022 01:24:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669991051; x=1701527051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KNrMk727asvMseqx5cDLpNnJ58d4ScysoenZgXUxKEs=;
  b=hf1tAjVRu1os4lCU459jWBH6SBTUOFEJB1WFQlehWfcoBoFalbpjmgiV
   t7+KIrRL6ctELIxlh7Va15AlOW5Acjx888teFasIA7tKbIjBv18TnVOmu
   X7U18CKyZgXonr7mgGBimNCrDv3Zidhw1hNERhd2VJwK/sv/pD8L7CTNA
   QarIsSTDfD22fgEsPmmNLOju/9EMR4aiNXu/RU05lus7KNaFvYqXp13Pt
   js1pcoRsYEQG08OPI7UGgn5v+4aZeoboUCIpJTZoCwtcIlIo7881IVNXI
   aiOUwy4HwEhOMfFRFk7aecHCe7pg+fyGlRO7a7fonUsdYe0+WB3cVR1Be
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317108402"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="317108402"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 06:23:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="769617099"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="769617099"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 06:23:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with ESMTP id B601020363;
	Fri,  2 Dec 2022 16:23:48 +0200 (EET)
Date: Fri, 2 Dec 2022 14:23:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v11 1/5] media: v4l: Add definition for the Aspeed JPEG
 format
Message-ID: <Y4oKdBApOGk9TUHO@paasikivi.fi.intel.com>
References: <20221028023554.928-1-jammy_huang@aspeedtech.com>
 <20221028023554.928-2-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028023554.928-2-jammy_huang@aspeedtech.com>
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

Apologies for a late reply.

On Fri, Oct 28, 2022 at 10:35:50AM +0800, Jammy Huang wrote:
> This introduces support for the Aspeed JPEG format, where the new frame
> can refer to previous frame to reduce the amount of compressed data.
> The concept is similar to I/P frame of video compression. It will
> compare the new frame with previous one to decide which macroblock's
> data is changed, and only the changed macroblocks will be compressed.
> 
> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
> which is generally adapted for remote KVM.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v11:
>   - no update
> v10:
>   - no update
> v9:
>   - Rebase on new kernel
> v8:
>   - Add decoder information for aspeed-jpeg
> v7:
>   - Add more information for aspeed-jpeg
> v6:
>   - Update description for new format, aspeed-jpeg, in Documentation.
> v5:
>   - no update
> v4:
>   - new
> ---
>  .../userspace-api/media/v4l/pixfmt-reserved.rst | 17 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>  include/uapi/linux/videodev2.h                  |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 0ff68cd8cf62..73cd99828010 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -258,6 +258,23 @@ please make a proposal on the linux-media mailing list.
>          and it is used by various multimedia hardware blocks like GPU, display
>          controllers, ISP and video accelerators.
>          It contains four planes for progressive video.
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
> +        The implementation is based on AST2600 A3 datasheet, revision 0.9, which
> +        is not publicly available. Or you can reference Video stream data format
> +        – ASPEED mode compression of SDK_User_Guide which available on
> +        AspeedTech-BMC/openbmc/releases.

What does this refer to? If it's a URL, please add a reference as below.

Also please run this on the patches:

	$ scripts/checkpatch.pl --strict --max-line-length=80

> +
> +        Decoder's implementation can be found here,
> +        `aspeed_codec <https://github.com/AspeedTech-BMC/aspeed_codec/>`__
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fddba75d9074..8cb4b976064e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1497,6 +1497,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>  		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
>  		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
> +		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>  		default:
>  			if (fmt->description[0])
>  				return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 86cae23cc446..870a7e5ef8ca 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
>  #define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
>  #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
> +#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
>  
>  /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */

-- 
Kind regards,

Sakari Ailus
