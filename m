Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CB6D653C
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 16:25:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrVRN2ZFbz3cRW
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 00:25:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U5R6tLp/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=satishroyal4u@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U5R6tLp/;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrVQr5L77z2ynD
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 00:25:07 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id i9so33033346wrp.3
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680618303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57D2wawgDyMKdkgtE5Gz0zTv+tEffUawlS7gjXTcmhQ=;
        b=U5R6tLp/FNKjxs80dp2qeeFIwETg4dnHdzIKLYdX6UBTyeq+pTu+WxiTSaXWM9g8Bj
         Q2kIlSc5CfBBYWsuiPj2kxEorIINxw15HYuv7sEdQ9iYWNL2uN2Lt2P7zd3QHpFuMWps
         az8A6517nP6ifuccW0u52LrDqM12pcbU4cy2HTZKyICuntb+fTjriS/HW84/zxpn3R5y
         3bv/Y2+hOl53veuLYt+sb1FNk9j/+00kaOqfng4sc230L3B8Nymlo1DT7Oy0pIB6Tnf8
         9usu8USu8Ne3O15JPkeGNFpRqyozrNfd/F3g2k+kY3hMafOan+dqXW6U+J2k3ZcSniJj
         7ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57D2wawgDyMKdkgtE5Gz0zTv+tEffUawlS7gjXTcmhQ=;
        b=tU7lM/CDFzQecLGU3j2vJlv/LW/bjAy5M4jxgNe+O8zjQDHuB5VLyJ9fQq+1muLBuV
         KSGKLYtzzfVNOu/NJ+u3iUDBLBUze1k/yvHYFFrxDqNFWXO7UjFPvcdKa4m19r1jQR6X
         ZQmp2k0d3Lomjg4IkuhVDCBkj4ZWkjblU6U/Bu+skIGtNEQNXeIV2AzFSdgSxMwsNjob
         FJo+PPHKoBiU4MtYqYwdaVO00QAjosAjt1+jBQEgHEgY+m5woG9vzgzn11cuQqYCXjEM
         P6GqGZh+JhiPGG+vhmtRXSbMenIU7BcODP57ULeAvPIjdBPBhR5k54Ex1aExqxMuf5Hn
         A1iQ==
X-Gm-Message-State: AAQBX9fisSyg1j/mtauJGpMzQ7biLkvPuOJ9cZQVnykX9tuHOCY96k7s
	g4x9vVkBOJ3OtL9omshhYP0kKxI1/d5MpS7kmcQRDkW9RmQ=
X-Google-Smtp-Source: AKy350aknZrNGyAApvDTtqOwte2PcZkibY+RmkYSklcEd462kPP46Oww4oD714ix1bGkhdsCkHUoSdKcYwKVkk1lhhg=
X-Received: by 2002:a5d:4603:0:b0:2e4:c9ac:c49e with SMTP id
 t3-20020a5d4603000000b002e4c9acc49emr541284wrq.9.1680618302541; Tue, 04 Apr
 2023 07:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
 <20230328224413.GB18848@packtop> <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
 <CAGugOWv=XF9UHLcgcr-W5_3DE5+w3EaP4i0eHe-nbSFVgJqsHg@mail.gmail.com> <ZCq82_K1gRdlM7Tg@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZCq82_K1gRdlM7Tg@heinlein.vulture-banana.ts.net>
From: Satish Yaduvanshi <satishroyal4u@gmail.com>
Date: Tue, 4 Apr 2023 19:54:51 +0530
Message-ID: <CAGugOWtUdXVUN3p1oGSe=DS_g04YfxUoe98vfxOL6xYxM9=pjw@mail.gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000ed131005f8837024"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ed131005f8837024
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have gone through some documentation over  internet. Firmware can be
containerized to get the more benefits.  so is there any plans to
containerize the OpenBMC firmware?

On Mon, Apr 3, 2023 at 5:17=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz>=
 wrote:

> On Fri, Mar 31, 2023 at 10:55:47PM +0530, Satish Yaduvanshi wrote:
> > For containerizing firmware, I do believe architecture matters. could
> > anyone of you  explain the OpenBMC firmware architecture briefly
>
> Have you read through any of the design information in the docs
> repository or watched any of the background videos on the YouTube
> channel?  Was there any specific questions you had?
>
> --
> Patrick Williams
>


--=20

Satish  Kumar G

--000000000000ed131005f8837024
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have gone through some documentation over=C2=A0 internet. =
Firmware can be containerized to get the more benefits.=C2=A0 so is there a=
ny plans to containerize the OpenBMC firmware?</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 3, 2023 at 5:17=
=E2=80=AFPM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patri=
ck@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, Mar 31, 2023 at 10:55:47PM +0530, Satish Yaduvanshi wro=
te:<br>
&gt; For containerizing firmware, I do believe architecture matters. could<=
br>
&gt; anyone of you=C2=A0 explain the OpenBMC firmware architecture briefly<=
br>
<br>
Have you read through any of the design information in the docs<br>
repository or watched any of the background videos on the YouTube<br>
channel?=C2=A0 Was there any specific questions you had?<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div><span style=3D"font-=
family:&quot;arial black&quot;,sans-serif;font-size:12.8px">Satish =C2=A0Ku=
mar G</span><br></div><div><font face=3D"arial black, sans-serif"><br></fon=
t></div><div><font face=3D"arial black, sans-serif"><br></font></div></div>=
</div></div></div></div></div></div></div></div>

--000000000000ed131005f8837024--
