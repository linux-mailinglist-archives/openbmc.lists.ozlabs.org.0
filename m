Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0B525A40
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 05:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzvYD55g3z3c7Y
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 13:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ltQxQzZS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ltQxQzZS; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzvTW45cvz3c9m
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 13:37:03 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id a21so8486539edb.1
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 20:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8MnlBk8cgMOEhzWAwnQza7z75E9MdlnvkJjhpY7dhU=;
 b=ltQxQzZS6b/6dti8+4P9/MUmY2Itd3ucdkl2OmdmSN7UWwFvx8aTgFQPNvYJv0OHw/
 3hBFCptG0vx5o2PSVNIZARsx90tBn7pe5RPEBvZ+WlFMUfGvlZgZJHe/lZbO0hXjH/ID
 hxvBvpdksg06KQOv6buc4fOCsnrX41t79G46+wVc+p9ZNFevyk608/sUvcVyGaNrEO13
 DpGpr6IRXqliheXIu06pg8ebquzN43cUnjQn68T7qh6Out0yksT63acWQMD6AI3PcV9S
 E6ZO8rgaeOMm9a6Yqc85s1/he6NUz+kIKcxK7LpjEmRxAzCjuKsQQoJ62YhFy/aapD2L
 RY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8MnlBk8cgMOEhzWAwnQza7z75E9MdlnvkJjhpY7dhU=;
 b=wj5TpW0nu4de7LyLaoe6rdmMrpwV3+nK2ujL0JlhAIrR7k3e7xD92rsIve+ndUnVLw
 WIQq69UmTdYzvEV/iRsnaPzQZ7jZmDPdv/wdFgzzcFNayU4B7iJvWevUUV1PpD1IRg4l
 1QsNBRcRMqLmVTbHVXhhq0JgfEvqkVVd0wu9hxsXogBqD/hAnuhyYLo1KdpbHNUsP7ZB
 M4Cq09a/+FiFuKhmDO1bLjXOOwru3J34NUKQUyjEORcO3AVpWq9vttf9vlsXkGimJSzW
 37bXlrpPmKzzMCory82wbfq3ncTE2RgrGIfjcVJGqHygmCpTAbvdjxkJbhOf/JH3VSDt
 4Pmw==
X-Gm-Message-State: AOAM5329+eLZz6uYiE/DSXvS8cOKzYxCFCxx9RfFR9GYtHvnd66gcEmH
 VVpd4tu603dkS7Fem+NFqG5tppK5ac/SDgZcQxY=
X-Google-Smtp-Source: ABdhPJzaowB9yrAtcpfhV585cIpq7vpiINToOUOzgClB+xTIByIMmUBY1GrsNLe5G2JG5Y6kNMLwmALvH5ozZN7NDQ4=
X-Received: by 2002:a05:6402:50d1:b0:428:1473:d173 with SMTP id
 h17-20020a05640250d100b004281473d173mr37678964edb.37.1652413018395; Thu, 12
 May 2022 20:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220512072722.25005-1-kflin@nuvoton.com>
 <20220512072722.25005-5-kflin@nuvoton.com>
 <81383d8cc351bdd1556ef674afe7f787f8a768ff.camel@ndufresne.ca>
In-Reply-To: <81383d8cc351bdd1556ef674afe7f787f8a768ff.camel@ndufresne.ca>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Fri, 13 May 2022 11:36:49 +0800
Message-ID: <CADnNmFoxp1P2k3b6+YXRkzQ_pHsSyejLb=MqqHN6kJJ-wU80fw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] media: Add HEXTILE compressed format
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000fbd85405dedc62f2"
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
Cc: CS20 KWLiu <kwliu@nuvoton.com>, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 Marvin Lin <kflin@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000fbd85405dedc62f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for your comment.
I have sent v2 patch to add Hextile document and locate with vendor formats=
.

Nicolas Dufresne <nicolas@ndufresne.ca> =E6=96=BC 2022=E5=B9=B45=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Hello Marvin,
>
> Le jeudi 12 mai 2022 =C3=A0 15:27 +0800, Marvin Lin a =C3=A9crit :
> > Add HEXTILE compressed format. This format is defined in Remote
> > Framebuffer Protocol (RFC 6143) and is used by VNC features.
> >
> > Signed-off-by: Marvin Lin <kflin@nuvoton.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >  include/uapi/linux/videodev2.h       | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 96e307fe3aab..9365519d65bb 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
> *fmt)
> >               case V4L2_PIX_FMT_SE401:        descr =3D "GSPCA SE401";
> break;
> >               case V4L2_PIX_FMT_S5C_UYVY_JPG: descr =3D "S5C73MX
> interleaved UYVY/JPEG"; break;
> >               case V4L2_PIX_FMT_MT21C:        descr =3D "Mediatek
> Compressed Format"; break;
> > +             case V4L2_PIX_FMT_HEXTILE:      descr =3D "Hextile
> Compressed Format"; break;
> >               default:
> >                       if (fmt->description[0])
> >                               return;
> > diff --git a/include/uapi/linux/videodev2.h
> b/include/uapi/linux/videodev2.h
> > index 3768a0a80830..e0e69f71d700 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -710,6 +710,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast
> Walsh Hadamard Transform (vicodec) */
> >  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H'=
)
> /* Stateless FWHT (vicodec) */
> >  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H26=
4
> parsed slices */
> > +#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /*
> Hextile */
>
> New formats also need to be documented in one of
> Documentation/userspace-api/media/v4l/pixfmt*.rst file. Consider that
> formats,
> specially vendor formats disappears over time, so documentation should be
> written as if you are to read that in 10+ years.
>
> I'm also wondering if that should be better located with the "vendor"
> formats.
> Specially that this does not look like a open standard like the other in
> this
> section. A quick search of that format simply gives no results for me. It
> seems
> pretty clear that this is unique to this HW vendor and unlikely to grow
> withing
> other HW or even ever get a software implementation.
> >
> >  /*  Vendor-specific formats   */
> >  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1
> YUV */
>
>

--000000000000fbd85405dedc62f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><img class=3D"gmail-ajT" src=3D"https://s=
sl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif"><img class=3D"gmail-aj=
T" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif">Hi =
Nicolas,<br></div><div><br></div><div>Thanks for your comment.</div><div>I =
have sent v2 patch to add Hextile document and locate with vendor formats.<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">N=
icolas Dufresne &lt;<a href=3D"mailto:nicolas@ndufresne.ca">nicolas@ndufres=
ne.ca</a>&gt; =E6=96=BC 2022=E5=B9=B45=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=9B=
=9B =E4=B8=8B=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello Marvin,<br>
<br>
Le jeudi 12 mai 2022 =C3=A0 15:27 +0800, Marvin Lin a =C3=A9crit=C2=A0:<br>
&gt; Add HEXTILE compressed format. This format is defined in Remote<br>
&gt; Framebuffer Protocol (RFC 6143) and is used by VNC features.<br>
&gt; <br>
&gt; Signed-off-by: Marvin Lin &lt;<a href=3D"mailto:kflin@nuvoton.com" tar=
get=3D"_blank">kflin@nuvoton.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +<br>
&gt;=C2=A0 include/uapi/linux/videodev2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<b=
r>
&gt;=C2=A0 2 files changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2=
-core/v4l2-ioctl.c<br>
&gt; index 96e307fe3aab..9365519d65bb 100644<br>
&gt; --- a/drivers/media/v4l2-core/v4l2-ioctl.c<br>
&gt; +++ b/drivers/media/v4l2-core/v4l2-ioctl.c<br>
&gt; @@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc=
 *fmt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case V4L2_PIX_FM=
T_SE401:=C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;GSPCA SE401&quot;; brea=
k;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case V4L2_PIX_FM=
T_S5C_UYVY_JPG: descr =3D &quot;S5C73MX interleaved UYVY/JPEG&quot;; break;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case V4L2_PIX_FM=
T_MT21C:=C2=A0 =C2=A0 =C2=A0 =C2=A0 descr =3D &quot;Mediatek Compressed For=
mat&quot;; break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case V4L2_PIX_FMT_HEX=
TILE:=C2=A0 =C2=A0 =C2=A0 descr =3D &quot;Hextile Compressed Format&quot;; =
break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (fmt-&gt;description[0])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/video=
dev2.h<br>
&gt; index 3768a0a80830..e0e69f71d700 100644<br>
&gt; --- a/include/uapi/linux/videodev2.h<br>
&gt; +++ b/include/uapi/linux/videodev2.h<br>
&gt; @@ -710,6 +710,7 @@ struct v4l2_pix_format {<br>
&gt;=C2=A0 #define V4L2_PIX_FMT_FWHT=C2=A0 =C2=A0 =C2=A0v4l2_fourcc(&#39;F&=
#39;, &#39;W&#39;, &#39;H&#39;, &#39;T&#39;) /* Fast Walsh Hadamard Transfo=
rm (vicodec) */<br>
&gt;=C2=A0 #define V4L2_PIX_FMT_FWHT_STATELESS=C2=A0 =C2=A0 =C2=A0v4l2_four=
cc(&#39;S&#39;, &#39;F&#39;, &#39;W&#39;, &#39;H&#39;) /* Stateless FWHT (v=
icodec) */<br>
&gt;=C2=A0 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc(&#39;S&#39;, &#39;2&=
#39;, &#39;6&#39;, &#39;4&#39;) /* H264 parsed slices */<br>
&gt; +#define V4L2_PIX_FMT_HEXTILE=C2=A0 v4l2_fourcc(&#39;H&#39;, &#39;X&#3=
9;, &#39;T&#39;, &#39;L&#39;) /* Hextile */<br>
<br>
New formats also need to be documented in one of <br>
Documentation/userspace-api/media/v4l/pixfmt*.rst file. Consider that forma=
ts,<br>
specially vendor formats disappears over time, so documentation should be<b=
r>
written as if you are to read that in 10+ years.<br>
<br>
I&#39;m also wondering if that should be better located with the &quot;vend=
or&quot; formats. <br>
Specially that this does not look like a open standard like the other in th=
is<br>
section. A quick search of that format simply gives no results for me. It s=
eems<br>
pretty clear that this is unique to this HW vendor and unlikely to grow wit=
hing<br>
other HW or even ever get a software implementation.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*=C2=A0 Vendor-specific formats=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define V4L2_PIX_FMT_CPIA1=C2=A0 =C2=A0 v4l2_fourcc(&#39;C&#39;,=
 &#39;P&#39;, &#39;I&#39;, &#39;A&#39;) /* cpia1 YUV */<br>
<br>
</blockquote></div></div>

--000000000000fbd85405dedc62f2--
