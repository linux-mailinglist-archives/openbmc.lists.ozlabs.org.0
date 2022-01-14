Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A446548E69C
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 09:34:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZvjS2bS0z30H3
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 19:34:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Vm1/T/dB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xs4all.nl (client-ip=195.121.94.167; helo=ewsoutbound.kpnmail.nl;
 envelope-from=hverkuil-cisco@xs4all.nl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256
 header.s=xs4all01 header.b=Vm1/T/dB; dkim-atps=neutral
X-Greylist: delayed 1235 seconds by postgrey-1.36 at boromir;
 Fri, 14 Jan 2022 19:33:54 AEDT
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZvhy0S4Nz2yPP
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 19:33:52 +1100 (AEDT)
X-KPN-MessageId: 82f03557-7511-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 82f03557-7511-11ec-9a2e-005056abbe64;
 Fri, 14 Jan 2022 09:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=zuml5cb46ityR8xHyuGQOnCJFEzHf/fVcI6uqZxrEzM=;
 b=Vm1/T/dBf1sPj4g6flqPJ6wMCEQKWb0NGEX/JNEmBIV5EbGt2xf9UOx1U2DP6JFV4WxNuJjmWqEBx
 sNhfvRLyNoRvcXdyBsactU7UjDENlIVnYAlGB3bMWRjcWizc5fxuIxTVrZKQ7t3GykJy5oj1tIOkds
 SAfx6lZvQFfBJbJcawioxz5b20Yi4f4vWa4w8Qi/yTD240rnvbErdcAPfyH7OKOmze69j3UMaiKikk
 +sV48suiT/5Gc5Um5ZZ4f75YltdKHLvdMYECsU27sQg1jobcDb28Q2GfYjjdWL0AJqbOtU4kLmI3kM
 irDZOaZdjGa2nQdEwBvTz8KpU9J4ORA==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|DrdHS/CriUx8uE+kxG18PLhtCM1oJKFMrj1aOy9kvNYQ8+y3N9cmsRAqi8b9Ehc
 3PoMjIdumdoSK61BXN6GlTw==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 98daabcd-7511-11ec-94d2-005056abf0db;
 Fri, 14 Jan 2022 09:11:39 +0100 (CET)
Message-ID: <703ff71e-c76a-9df1-c644-04efed0199ca@xs4all.nl>
Date: Fri, 14 Jan 2022 09:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v8 1/4] media: v4l: Add definition for the Aspeed JPEG
 format
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, eajames@linux.ibm.com, mchehab@kernel.org,
 joel@jms.id.au, andrew@aj.id.au, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211224012738.1551-1-jammy_huang@aspeedtech.com>
 <20211224012738.1551-2-jammy_huang@aspeedtech.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211224012738.1551-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/12/2021 02:27, Jammy Huang wrote:
> This introduces support for the Aspeed JPEG format, where the new frame
> can refer to previous frame to reduce the amount of compressed data. The
> concept is similar to I/P frame of video compression. It will compare the
> new frame with previous one to decide which macroblock's data is
> changed, and only the changed macroblocks will be compressed.
> 
> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
> which is generally adapted for remote KVM.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
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
>  .../media/uapi/v4l/pixfmt-reserved.rst          | 17 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>  include/uapi/linux/videodev2.h                  |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst

This is the wrong file! It should be:

Documentation/userspace-api/media/v4l/pixfmt-reserved.rst

Regards,

	Hans

> index b2cd155e691b..1d0dc8d86ed7 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> @@ -264,6 +264,23 @@ please make a proposal on the linux-media mailing list.
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
> +        The implementation is based on AST2600 A3 datasheet, revision 0.9, which
> +        is not publicly available. Or you can reference Video stream data format
> +        – ASPEED mode compression of SDK_User_Guide which available on
> +        AspeedTech-BMC/openbmc/releases.
> +
> +        Decoder's implementation can be found here,
> +        `https://github.com/AspeedTech-BMC/aspeed_codec/ <https://github.com/AspeedTech-BMC/aspeed_codec/>`__
>  
>  .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 24db33f803c0..00dde01d2f97 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1378,6 +1378,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>  		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
> +		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>  		default:
>  			if (fmt->description[0])
>  				return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3210b3c82a4a..994eb6155ea9 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -726,6 +726,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
> +#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
>  
>  /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */

