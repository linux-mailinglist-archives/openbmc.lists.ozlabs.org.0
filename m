Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7491529504
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FVG64Ndz3byS
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:15:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ndufresne-ca.20210112.gappssmtp.com header.i=@ndufresne-ca.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=MD1s+3cy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ndufresne.ca
 (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=nicolas@ndufresne.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ndufresne-ca.20210112.gappssmtp.com
 header.i=@ndufresne-ca.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=MD1s+3cy; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzXQf4Ctzz2ypZ
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 23:18:18 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id v14so3088579qtc.3
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=cTkGwPerGEuuefQRyIQ0C0XC2b11aBGuK5X4ENeMGuU=;
 b=MD1s+3cy4Ph7S6Istxggt/fum+J6xKJdI4OlN64yZTuxpLiC+LwdAry8NCO5Tj0wNr
 gHZCg+hbSfWU7vbeLZpHI4SLsmpdro7VzSiis/HV4bfFI8l/aeXTUkJNu88JxEO4EcuS
 5ZBQ31mrUTfaM1Z5Sfb4L0jX7gfhmDM4/jTwXpRQvOlsZPV/FntftA21xaU4jArSLA1E
 EhstExel8X8v+Ppc5G/TsHfVUfg92larRjQ/785XagGlAzz3HYcmvhadsy5jZSe/IE6C
 0OTKdivOoTqglL8KcLGZ7i6xuOtEw7AVMxbbreUQ+KYXrtEsojxCEkx64dsCLrEdNX/g
 Cn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=cTkGwPerGEuuefQRyIQ0C0XC2b11aBGuK5X4ENeMGuU=;
 b=ttzJuVCQZdBmqHjmV7a3EjCEQs1lp5pvKWycJqTxr4E9+GYikZeCbK5dQHVX9OQd2I
 IrVKsnLVp88OuT9QgtvwtyhbQ59UgrHE1Wp6NKXTjytl/Oy1Jjztlr4heOJFiBODO+Ku
 jnBasCKsiegpfkd7uPUL0dQMyYL3dCCvG3RzJldwveFa+q3uwYKiXFQZOL7rLr1xTmZs
 DBpdFxgqPtQHUimAPO843c4gIKlI3hOJxMHo+Gn/6rhhFgrcJy0aUaODoVMMDJy2dsLl
 7dBQpc1KjWtv956gMuwIHaP002DO0gdaiI9KepyUkrDHiZCNPwbykzvAT0qBz7cN+ODe
 xywg==
X-Gm-Message-State: AOAM530525/WHZnXsQmwquOqI/a5Pq3MPgDW1YbsbkUq16Qx4aBMw1PQ
 TgBSCgN2BcXyMObmUbJt4g+TXA==
X-Google-Smtp-Source: ABdhPJyVI6QPETI9Ycy3zyEscN13LinUz5LpVyQNYJo6d1+/MZP6zee0O4s9N6TPbRbDvNMccvmbBQ==
X-Received: by 2002:ac8:7f0a:0:b0:2f3:ec89:ee23 with SMTP id
 f10-20020ac87f0a000000b002f3ec89ee23mr9704610qtk.448.1652361494481; 
 Thu, 12 May 2022 06:18:14 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a10a700b0069fc13ce23csm2850213qkk.109.2022.05.12.06.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 06:18:14 -0700 (PDT)
Message-ID: <81383d8cc351bdd1556ef674afe7f787f8a768ff.camel@ndufresne.ca>
Subject: Re: [PATCH v1 4/5] media: Add HEXTILE compressed format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 12 May 2022 09:18:12 -0400
In-Reply-To: <20220512072722.25005-5-kflin@nuvoton.com>
References: <20220512072722.25005-1-kflin@nuvoton.com>
 <20220512072722.25005-5-kflin@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:20 +1000
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Marvin,

Le jeudi 12 mai 2022 =C3=A0 15:27 +0800, Marvin Lin a =C3=A9crit=C2=A0:
> Add HEXTILE compressed format. This format is defined in Remote
> Framebuffer Protocol (RFC 6143) and is used by VNC features.
>=20
> Signed-off-by: Marvin Lin <kflin@nuvoton.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 96e307fe3aab..9365519d65bb 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  		case V4L2_PIX_FMT_SE401:	descr =3D "GSPCA SE401"; break;
>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr =3D "S5C73MX interleaved UYVY/JP=
EG"; break;
>  		case V4L2_PIX_FMT_MT21C:	descr =3D "Mediatek Compressed Format"; break=
;
> +		case V4L2_PIX_FMT_HEXTILE:	descr =3D "Hextile Compressed Format"; brea=
k;
>  		default:
>  			if (fmt->description[0])
>  				return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 3768a0a80830..e0e69f71d700 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -710,6 +710,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Wa=
lsh Hadamard Transform (vicodec) */
>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') =
/* Stateless FWHT (vicodec) */
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 =
parsed slices */
> +#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile=
 */

New formats also need to be documented in one of=20
Documentation/userspace-api/media/v4l/pixfmt*.rst file. Consider that forma=
ts,
specially vendor formats disappears over time, so documentation should be
written as if you are to read that in 10+ years.

I'm also wondering if that should be better located with the "vendor" forma=
ts.=20
Specially that this does not look like a open standard like the other in th=
is
section. A quick search of that format simply gives no results for me. It s=
eems
pretty clear that this is unique to this HW vendor and unlikely to grow wit=
hing
other HW or even ever get a software implementation.
> =20
>  /*  Vendor-specific formats   */
>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 Y=
UV */

