Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E731A2325CF
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 22:05:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH4Kc1Rx5zDqcX
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 06:05:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=er0wz2Ax; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH4Jl4rsZzDqd0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 06:04:54 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id c14so13210268ybj.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 13:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYUHZdLWWPflghDltrTWGlDUOOes6uNoOAyomklEqfY=;
 b=er0wz2Axupdibv57+xd9g7M0ZeUD72k/yPFIv5Br7CIXQVEyN3KSYaa5DeS+o0year
 z+2aeMJ3DPR2CCUSRbWXracIOQyLvhztyNwkq4gJCnt+K5ELeaCYEAYSyBAH82kNGQ7z
 TuJpysgVPOnFn8XPxmzVq+FCUqWAOwMwgDWG0LA1kcdS2tJUVJEdkc2ZYvswqSRPTMi1
 7i6uLw7HARhxvtpEWDrDzOL7OIEwilYXh6aWfdMto7irrPE2kgZgSiWCZuIvPj8reyJ+
 4nqthBcsIdcKZZppJaZSESYFYucStuUae3Ygfj/NuwRKUTHKwAkwxfcFtocCBEXJ/ZJf
 2uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYUHZdLWWPflghDltrTWGlDUOOes6uNoOAyomklEqfY=;
 b=b4Y4YjQ3Ki6lZ6YE3/ofVNX5lfDTGO55Yim9NAFPz4Z8BbOOvMM61F6IrrFmaTtDUV
 Vh8R+MBiEbEn8DgfRSb1hTCY2kRP/vN9yMKbFf7wIq3v5AI/IXbh0GpCS+dqVEnjdsNq
 +42wSNAf241b/slM3B/O2YfkSLRNLiETBf0R4Gd39+l4rpFuNMt4EiMXRH5jJaSwpk5a
 my16N7v/uwHI3sB0+eU6oj32hEhSYDP37ye7PlON5QTBrNPIYk1VGc4/yrkiU6vwy3YG
 NCngQN1yE6B/AFgyQpzqCg6mpV4LzG1K1NXdBPMAOROmeSB1jV8nXckYgPxfOXqtyXQV
 hULA==
X-Gm-Message-State: AOAM531RsrDwzsWQMKFdhzp4muUU1HcPBBfBzrMkHTL0uz2tvNa2Z0nm
 x6Z9034YgE9UGuW9CmXS3hnGFd0u8WcqP9mVWqP02nZGGrc=
X-Google-Smtp-Source: ABdhPJwwdeRo01Rt7FHi7rNJQ5jHdbA2kYOR2a5atl3ASoqVTpVdLHhyCe/Qm2CkdQhfzs3lLPi2x4LrWZzudscFQ1s=
X-Received: by 2002:a05:6902:6c8:: with SMTP id m8mr150517ybt.85.1596053090401; 
 Wed, 29 Jul 2020 13:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
In-Reply-To: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 29 Jul 2020 13:04:13 -0700
Message-ID: <CADfYTpG3HBX2FPMwa4oQ8p_C6bv4Vno-LiJyRzf6dnRhBx15XA@mail.gmail.com>
Subject: Re: using third party library
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="0000000000007f58ae05ab9a1187"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007f58ae05ab9a1187
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would the recipe belong in OpenEmbedded
<https://layers.openembedded.org/layerindex/branch/master/recipes/>?

On Wed, Jul 29, 2020 at 12:52 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi,
>
> I want to use following library from open source which is under MIT
> license, please let me know if there is any restriction to use this in ou=
r
> openbmc package.
>
> https://github.com/ArashPartow/exprtk/
>
>
>
> Also I need to write simple recipe to include this so please let me know
> what is the best location to put this recipe as well. As I am thinking of
> using this for virtual sensors then I can put under Sensors or if there i=
s
> better place to put this then please advise.
>
>
>
> Regards
>
> -Vijay
>


--=20

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--0000000000007f58ae05ab9a1187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would the recipe belong in <a href=3D"https://layers.opene=
mbedded.org/layerindex/branch/master/recipes/">OpenEmbedded</a>?</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul=
 29, 2020 at 12:52 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com=
">vijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_4904997773745724801WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I want to use followi=
ng library from open source which is under MIT license, please let me know =
if there is any restriction to use this in our openbmc package.<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/ArashPartow/exprtk/" t=
arget=3D"_blank">https://github.com/ArashPartow/exprtk/</a><u></u><u></u></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Also I need to write =
simple recipe to include this so please let me know what is the best locati=
on to put this recipe as well. As I am thinking of using this for virtual s=
ensors then I can put under Sensors
 or if there is better place to put this then please advise.<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">-Vijay<u></u><u></u><=
/span></p>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><table style=3D"border:none;border-collaps=
e:collapse"><colgroup><col width=3D"73"><col width=3D"7"><col width=3D"111"=
><col width=3D"7"><col width=3D"122"><col width=3D"7"><col width=3D"71"></c=
olgroup><tbody><tr style=3D"height:15pt"><td style=3D"border-top:1.5pt soli=
d rgb(213,15,37);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,10=
2,102);background-color:transparent;font-weight:700;vertical-align:baseline=
;white-space:pre-wrap">Nancy Yuen</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(255,0,0)=
;background-color:transparent;font-weight:700;vertical-align:baseline;white=
-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.5pt sol=
id rgb(51,105,232);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,=
102,102);background-color:transparent;font-weight:700;vertical-align:baseli=
ne;white-space:pre-wrap">Google Platforms=C2=A0</span></p></td><td style=3D=
"border-top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hid=
den"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(61,133,198);background-color:transparent;font-weight:700;vertical-ali=
gn:baseline;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"bor=
der-top:1.5pt solid rgb(0,153,57);vertical-align:middle;overflow:hidden"><p=
 dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif=
;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertic=
al-align:baseline;white-space:pre-wrap"><a href=3D"mailto:yuenn@google.com"=
 target=3D"_blank">yuenn@google.com</a></span></p></td><td style=3D"border-=
top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p =
dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
153,57);background-color:transparent;font-weight:700;vertical-align:baselin=
e;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(238,178,17);vertical-align:middle;overflow:hidden"><p dir=3D"=
ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:r=
gb(102,102,102);background-color:transparent;font-weight:700;vertical-align=
:baseline;white-space:pre-wrap">Google LLC</span></p></td></tr></tbody></ta=
ble></div></span></div></div>

--0000000000007f58ae05ab9a1187--
