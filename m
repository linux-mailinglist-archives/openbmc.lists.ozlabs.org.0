Return-Path: <openbmc+bounces-127-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8BACF9F8
	for <lists+openbmc@lfdr.de>; Fri,  6 Jun 2025 01:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bD0nP0F3vz2ySQ;
	Fri,  6 Jun 2025 09:21:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749086037;
	cv=none; b=kzB1V/+kGtLK8sDabNEN1oW5c+gipSOiTE7fgf+NBgky4cr4h1JTUbnzjg1wnribeuWim67ea8ql3XNi9u7/g17GKxOWBjYzw9ALBUmhgTlzDrdKtkLpwsD3dC83Bw/X3VUTxp9p1VYhNSpmCfFyMJ4Qc1SGnSxSdKgFrwS94F8TnBZVnY9CyKRhDjPZduevyh7XlWWsNZVgq+Y3qCGBUH81zQRN1TcYPfjcpAbze7mB9n2w1BpJA15dV2R7HYVuF4ZEGuAKmhaM6jlouMpW1bOg1rdUeP9+PmdEP3T4YuM3HR31QoGJnm23m3/hvsVZglTAGpGz6QSh2w1iaGdumw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749086037; c=relaxed/relaxed;
	bh=7WNG4dVm5hStT6EuT/62WPHR/iJXc+PtJEYCaot85js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Se1XJLruARNMFG/yV4D1bQqp7jw2/V7I7G568suz2ZEfaEUZu48QVFZVS4390Gt3RVdkUIPfGj+BAMqYif0rHqxhwawdzRl54GGmzQ1GNXM4aRXD4JweGRUhmjCyydRjuoYpmxfOm1LMIJEzyqMzP2EDcyDR81hdWni3Cvg735A1MBbZgNuVvBZkC0qaUts8yolZkU1Zo9dLSipWulqKg4K9xgya11BjfwoXQlnn+szBsIkSWN3dkPIrhJDgVyl1uSJ9+MrVErR6bVw26yE+TsikM/JSdGebob9zoJ0rqJSAxx/aQeWv8jFC5cBiGK9vUXhho/iv5P+4QHeeZkA4UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K7aCrb+w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K7aCrb+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCRKw102Hz2xRs
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jun 2025 11:13:55 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-530756db3d0so192710e0c.2
        for <openbmc@lists.ozlabs.org>; Wed, 04 Jun 2025 18:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749086031; x=1749690831; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7WNG4dVm5hStT6EuT/62WPHR/iJXc+PtJEYCaot85js=;
        b=K7aCrb+wEAG003OPiULvh7xdalQme8+szYZM3cy6hr0L3ZriIIQc7cDI2c2rFL8JxK
         72wlZFzyXIL84bDfubcohC/RVTKoaQOY4+k0kapwOGLJKNyauRV339/YN0SopgzzLD7z
         4E7o1Uq0BpXb1+zFwmuiGMSfxg46BcimhDNU60s2oWVrGqocmDlnS0iu2LWZ/Klaw8vo
         CVn3TL583PWgBLbixseP2j9RrpqfnyBDRN2SXIVLYAmUXoCejyNTyIqiv7XMIa+qdUOJ
         xVP9MGyLOGwgUoUQfpRjkA9LXafdzSW8oCRcUyDsqfoIidn+x1uJxQtLkWW2CYzzWXet
         tKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086031; x=1749690831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WNG4dVm5hStT6EuT/62WPHR/iJXc+PtJEYCaot85js=;
        b=oAX1MXVmUWZd2pbVzsXh96pswMaQOerAyZSodR+/JUVPo80XvEAcJ6j5NKYA9tSiSJ
         hVm08/IV/bPMwg3zgonFyhF2MxUx106z8rhoIBxVO1FV4bOHRps1BMzgrqrpmDNb++Lv
         VQC0vPUdNeMdGHe62sRelit1TvIKPluPmiBGqjOCia3mXyRszq96/1PucFL5jcHfzhzY
         Pu+dV/yiBvDyhKdISYoxayitm4Ju0JOZfR/QjZPlbabcx3vw+Zq8hfTzqXQm51DSGg+1
         Wo8z2bhkQwR72mLFe+nei34fjzzB6IpMb5MfHJcRiCUSK9k8WvALvJOQVVcvXp8B4SEW
         Ea1w==
X-Gm-Message-State: AOJu0YytCCZ1zvvLjFb3u2VlPNq/5jdadC+wHmoxdjNppULOOtyfYq/R
	FEVoZGTejh+kg42b8E1KiBQT+ZqZmvFnXA1di83cjWIn1iiRVzGRRGgeXEP0zVJNVj6xO2EWGLM
	QgYOGpS8pTGM8jkyY/9+sQrpZ3dCiskU=
X-Gm-Gg: ASbGnct9MVCOjsak03XvvKSbFdAVVNba5aL3TiEPpHQCjGx2PPIWrgFyL6HTIcFHrzy
	WMROp47VuZ+aMUGyl1n3i2adfRwV/dadzt+ySNm8ewW+pjPG/SKSoorP+mKdkuW8WYFFzS4KN8L
	I4bkDiiRFDH7Ewql9HQtUbOFFVmDqxBpdw
X-Google-Smtp-Source: AGHT+IHsXS+JINqN92NHVZ6izErbwmyAraMCbm8Wlv7blquGYcvHfo12VpRNJGLWPuhsxakshbVn1LmTJxKoBNXBWBQ=
X-Received: by 2002:a05:6122:8cf:b0:520:60c2:3fd with SMTP id
 71dfb90a1353d-530c730b6dbmr5009513e0c.3.1749086031343; Wed, 04 Jun 2025
 18:13:51 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CA+3C=r9siAo_CvcZDThLczrY09zFaiPK2O79hF++scA81vGHZw@mail.gmail.com>
 <51dd8bf76aa056fbc966e48132cac2607d2326ca.7435492b.35e1.4bc3.89f7.870abe7dd2f2@bytedance.com>
In-Reply-To: <51dd8bf76aa056fbc966e48132cac2607d2326ca.7435492b.35e1.4bc3.89f7.870abe7dd2f2@bytedance.com>
From: Yang Zhang <yang.zhang.wz@gmail.com>
Date: Thu, 5 Jun 2025 09:13:40 +0800
X-Gm-Features: AX0GCFsFIZ6KJyXL-AbLpqZKOcElvetAsiWcIz7xTAfc-P7YSQK-O1y1afLLZY0
Message-ID: <CA+3C=r8TkVeJYJSk8Qzj-DhpfrkFpzjEcMQBxX4NdjuUsG9YRw@mail.gmail.com>
Subject: Re: [External] how to wipe /var /etc during upgrading
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009476fc0636c8d3b9"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000009476fc0636c8d3b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 7:45=E2=80=AFPM Jian Zhang <zhangjian.3032@bytedance=
.com>
wrote:

> Hi Yang;
>
> The simplest way is to execute:
> ~# > /run/initramfs/whitelist && reboot,
>
> For the main logic, please refer to the vars `do_save` and `whitelist`


>
> https://github.com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c56dd2495e=
505e485/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-init.sh#L32=
0
>
> https://github.com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c56dd2495e=
505e485/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-update.sh#L=
183C1-L184C1
>
>
Thanks for your feedback! I will try it.

--=20
best regards
yang

--0000000000009476fc0636c8d3b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jun 3, 2025 at 7:45=E2=80=AFPM Ji=
an Zhang &lt;<a href=3D"mailto:zhangjian.3032@bytedance.com">zhangjian.3032=
@bytedance.com</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yang;<br>
<br>
The simplest way is to execute:<br>
~# &gt; /run/initramfs/whitelist &amp;&amp; reboot,<br>
<br>
For the main logic, please refer to the vars `do_save` and `whitelist`</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://github.com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c=
56dd2495e505e485/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-in=
it.sh#L320" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc=
/openbmc/blob/1da9f898e1ec4d24d2e9229c56dd2495e505e485/meta-phosphor/recipe=
s-phosphor/initrdscripts/files/obmc-init.sh#L320</a><br>
<a href=3D"https://github.com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c=
56dd2495e505e485/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-up=
date.sh#L183C1-L184C1" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c56dd2495e505e485/meta-phos=
phor/recipes-phosphor/initrdscripts/files/obmc-update.sh#L183C1-L184C1</a><=
br>
<br></blockquote></div><div><br></div><div>Thanks for your feedback! I will=
 try it.</div><div><br></div><span class=3D"gmail_signature_prefix">-- </sp=
an><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">best reg=
ards<div>yang</div></div></div></div>

--0000000000009476fc0636c8d3b9--

