Return-Path: <openbmc+bounces-1187-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF30D21709
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 22:49:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0C86PtQz2xKh;
	Thu, 15 Jan 2026 08:49:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768427396;
	cv=none; b=AdcIVYstKLq8NZoK1IwD/uRFpOGWqpPOg+2oA4bn2P+fMJw7/MX+GhaFQRz0e7ryH5RY3c+P3TDR7sLdzonFU8HaWtZ1oY5wCyD8zpP3eq0Su7bSDeyi6wJfuXC2Q2yqb2N2p4+lrpMeT3YuDvm9NGvdHuxxaou/2cGAQQ8V8KG4QqgL5P0sM20BRqamQAermRl1nHEdge3VbYCHQthlORLhRqboO6muDICdGHb8xPbYSA1oeh8RyPh9Xd3WQ3+3wR+23VboqM6U+CrGGctj94rGCHqQzsPIgjThPDnx8J7cgbvAjMjpslj4B+9x6GKQG1K9/Kxoir4OzVta0bED0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768427396; c=relaxed/relaxed;
	bh=ur5eZpUveHjptlg7+6ZaxI18lqJUYN1BoP80FgqQM8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWni+tXK0zMNZaVuLRyHQ05TuH9xHMdaGdVfrHoYdRdQ2faXbat1eN18QJWHIHZ7KssjAW1HzlqxJxU1sJ4S83+cWatMmDtIw7kD6KTinEekK35S09ospAo2t9y7pOwHY2s4hj4xcJj3ojx8FQBUTOVrf+8Rl7n7zO2UFo9GG9qmmNi40G3C1xu/hrHgcLsLTA70ZFsBOlNBTHNdjjIH+6DTtsjRSavZ1gkMGwp3ATg08nk3a5WFJMEE02TxmrTMmDvdGrR0VWWr07xnGPlesUPt0IP7AHJU3jGlzH4wqWZ7EctMGIwjz3k0d2WM38JsanjEBRaX4W13e/kC71O5Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WtY7XG63; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WtY7XG63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds0C73GT0z2xJ6
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 08:49:55 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-5eea6f90d7fso198461137.3
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768427392; x=1769032192; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ur5eZpUveHjptlg7+6ZaxI18lqJUYN1BoP80FgqQM8o=;
        b=WtY7XG63OxwupMT6MPqqZz7YH3mKNYsufGF3+jIHOplY4iW5yJq7VDI7UOUOmE47Y3
         WADygqXHQlrvp5/1flZE+kOFxeDpGj0OyASJpTaNkSKzuOuCwZ6VJy660yvw41+xTMgc
         XjYebBCFxB+rkGAMtiIpOiVMPvbtai0m5aQJ4m1BCYE9sXnjNsHbmger6fpBLJLzwC5x
         nhYpdcAtRtREoDDtqZTjyTqaOj7u//sItgLox7WjbmHGoT/0BDPycuxNZ9bpgFVKsyTf
         o415eveYO9ZwHUej312I+bhH/pRLFL9QoZq9C8tk5ISvvmK8c0VqzaHXzBib8UeGe2Ka
         HGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427392; x=1769032192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur5eZpUveHjptlg7+6ZaxI18lqJUYN1BoP80FgqQM8o=;
        b=iY3uoSVq1OG6S7tBTdESbTY7VtHXXsW2TUCHKi/06nwwmWcftSmRl8Ikk6T3hGDNUw
         +sA4ndziuTq0Gd+dxkcHVHc2vm2ftJDREJH0XK02a7nLcNgeaPm3C/7VjfodAsN8vdLh
         qMbmT4s2BeRwqQRQLkMIhqhmLbfhxLCo7DhGX9hGn+OS9AfujHyICM1jxfW2OP/+J8W7
         Lt3nHJiHor2n8MAZdms4yHjnabjMZvXoP51DrRmyEV6XH4GM6a+vfwz0Ele4l2FpPlvH
         Oz1LbRLR85gn1jU+FtRuYHY1nQAvmqZ88kNKCc9+cChJZte+6G3b0dXK2D5nRPClyHpS
         fLOA==
X-Forwarded-Encrypted: i=1; AJvYcCVuD62bYNvGsmNhNzjRaoGN2i1PssV19ar504mPkbMHffv1VYUwvJosxxMjNvX7Y3NIJTszqoRM@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzy/qqUxxlfGrpsaHnFVbKUxB3/t9VkChF2akk0D0AIYdLSkoFy
	lsxmxLnG1MAkqx9DA31NxDW8NlMr/WB0VVRp5sXSKkVJ5BTwoasm7ZN7GiVA4bBucBhf5SrGhVm
	xlPHRz93OprZU65XSZMM1jJcoO7BbLcM=
X-Gm-Gg: AY/fxX5mhf096Cn7C/60FrIpgxlp80oRCn14Z56r+ysq7I8PVwh3gOfgsCF0R0Dwxqp
	3oXNe2KrQHJDInOnhasQdhklK4/IpeWQVDGdHB4+6I3AdMsdrTmJ/IY9Yu57FUjFaHDZQiB2or/
	FVJr7T0Nu4wQ2/AkKElXdmH1y1WkQGN/XWL9XbXg411oYpvS6c1Ci5adL8RV60R7TOcpH9rpLjX
	8jihSKi/lpiPE/ibadP/dH/cKf/pw4Kp3FTEBdndeA/K2O2AF+/WotCOEpJW9eYLrLdnvs=
X-Received: by 2002:a05:6102:c87:b0:5ee:a8c4:18e4 with SMTP id
 ada2fe7eead31-5f183bd6093mr1801199137.33.1768427391652; Wed, 14 Jan 2026
 13:49:51 -0800 (PST)
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
References: <CAKmsAd=v_bNj5fFXq--faKMnXrwnCP00uFpzcNUbcK77p21M7w@mail.gmail.com>
In-Reply-To: <CAKmsAd=v_bNj5fFXq--faKMnXrwnCP00uFpzcNUbcK77p21M7w@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 14 Jan 2026 15:49:35 -0600
X-Gm-Features: AZwV_Qgim18xa4_-T2V323wooAluN9Y2fqiGSjOPaKvjcZPT-k7VWRma2qHDZM4
Message-ID: <CALLMt=oNgFwL7vjQ6tEikGcAV1n8QgnKCtaF7MzS61eEH98=2A@mail.gmail.com>
Subject: Re: OpenBMC Corporate CLA Submission - XSLAB
To: Soo-yeon Kang <ksypassion@gmail.com>
Cc: Mike Dolan <manager@lfprojects.org>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007d9830064860162b"
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000007d9830064860162b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 7:14=E2=80=AFAM Soo-yeon Kang <ksypassion@gmail.com=
> wrote:

>
> The CCLA has been signed by our CEO and includes Schedule A with
> the initial authorized contributor information.
>
> Please confirm receipt and let us know once the CCLA has been processed
> and approved. I look forward to contributing to the OpenBMC project.
>

Hi,



Welcome to the OpenBMC project. I've uploaded your Corporate CLA to the
OpenBMC projects google drive.

Here's a doc for getting up and running:
https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md

Information on communicating within the community can be found at
https://github.com/openbmc/docs?tab=3Dreadme-ov-file#contact


Adding your company to the approved CI list has been put up for review at
https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/86670 with
approved members being located in this gerrit group -
https://gerrit.openbmc.org/admin/groups/6c97a3345dda0d23d8a5b57b5a18f1b29a4=
5d4b1,members


Andrew



>
>

> --
>
>
> Soo-yeon  Kang
>
> Mobile: +82 10 - 4067 - 8539
> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>
>

--0000000000007d9830064860162b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 14,=
 2026 at 7:14=E2=80=AFAM Soo-yeon Kang &lt;<a href=3D"mailto:ksypassion@gma=
il.com">ksypassion@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><br>The CCLA has bee=
n signed by our CEO and includes Schedule A with<br>the initial authorized =
contributor information.<br><br>Please confirm receipt and let us know once=
 the CCLA has been processed<br>and approved. I look forward to contributin=
g to the OpenBMC project.</div></div></div></blockquote><div><br></div><div=
>











<p style=3D"margin:0in;font-family:Calibri;font-size:11pt">Hi,</p>

<p style=3D"margin:0in;font-family:Calibri;font-size:11pt">=C2=A0</p>

<p style=3D"margin:0in;font-family:Calibri;font-size:11pt">Welcome to the
OpenBMC project. I&#39;ve uploaded your Corporate CLA to the OpenBMC projec=
ts
google drive.</p><p style=3D"margin:0in;font-family:Calibri;font-size:11pt"=
>Here&#39;s a doc for
getting up and running: <a href=3D"https://github.com/openbmc/docs/blob/mas=
ter/development/gerrit-setup.md">https://github.com/openbmc/docs/blob/maste=
r/development/gerrit-setup.md</a>=C2=A0</p>

<p style=3D"margin:0in;font-family:Calibri;font-size:11pt">Information on
communicating within the community can be found at <a href=3D"https://githu=
b.com/openbmc/docs?tab=3Dreadme-ov-file#contact">https://github.com/openbmc=
/docs?tab=3Dreadme-ov-file#contact</a></p><p style=3D"margin:0in;font-famil=
y:Calibri;font-size:11pt"><br></p><p style=3D"margin:0in;font-family:Calibr=
i;font-size:11pt">Adding your company to the approved CI list has been put =
up for review at=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbmc/openb=
mc-build-scripts/+/86670">https://gerrit.openbmc.org/c/openbmc/openbmc-buil=
d-scripts/+/86670</a> with approved members being located in this gerrit gr=
oup -=C2=A0<a href=3D"https://gerrit.openbmc.org/admin/groups/6c97a3345dda0=
d23d8a5b57b5a18f1b29a45d4b1,members">https://gerrit.openbmc.org/admin/group=
s/6c97a3345dda0d23d8a5b57b5a18f1b29a45d4b1,members</a></p><p style=3D"margi=
n:0in;font-family:Calibri;font-size:11pt"><br></p>

<p style=3D"margin:0in;font-family:Calibri;font-size:11pt">Andrew</p>





<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div><div>=C2=A0</div></div></div></blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><font c=
olor=3D"#888888"></font></div></div><div><br></div><span class=3D"gmail_sig=
nature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br style=3D"color:rgb(51,51,51=
);font-family:Roboto;font-size:13.2px"><br style=3D"color:rgb(51,51,51);fon=
t-family:Roboto"><table style=3D"border-collapse:collapse;border-spacing:0p=
x;color:rgb(51,51,51);font-family:Roboto"><tbody><tr><td colspan=3D"2" styl=
e=3D"padding:0px 0px 2px;border-width:0px 0px 1px;border-bottom-style:solid=
;border-bottom-color:rgb(0,182,217);outline:none"><span style=3D"border-bot=
tom:3px solid rgb(0,182,217);padding:0px 0px 2px"><span style=3D"font-famil=
y:arial;font-weight:bold">Soo-yeon =C2=A0Kang</span>=C2=A0=C2=A0</span></td=
></tr><tr><td valign=3D"top" style=3D"padding:7px 16px 0px 0px;border:0px;o=
utline:none"></td><td valign=3D"top" style=3D"padding:7px 0px 0px;border:0p=
x;outline:none"><div style=3D"margin:0px;padding:2px 0px 0px;border:0px;out=
line:none"><div style=3D"margin:0px;padding:0px;border:0px;outline:none"><s=
pan style=3D"color:rgb(0,182,217);font-family:arial">Mobile:</span>=C2=A0<s=
pan style=3D"font-family:arial">+82 10 - 4067 - 8539</span></div><div style=
=3D"margin:0px;padding:0px;border:0px;outline:none"><span style=3D"color:rg=
b(0,182,217);font-family:arial">E-mail:</span>=C2=A0<a href=3D"mailto:ksypa=
ssion@gmail.com" style=3D"outline:none;color:rgb(0,0,0);text-decoration:non=
e;border:medium;font-family:arial" target=3D"_blank">ksypassion@gmail.co</a=
>m</div></div></td></tr></tbody></table><div style=3D"margin:0px;padding:0p=
x;border-width:1px 0px 0px;border-top-style:solid;border-top-color:rgb(208,=
208,208);outline:none;color:rgb(51,51,51);font-family:arial;font-size:small=
"><br></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div>
</blockquote></div></div>

--0000000000007d9830064860162b--

