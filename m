Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BCC79725D
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 14:36:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aaOEyihv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhJdf6qnFz3c5K
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 22:36:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aaOEyihv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhJd05WzKz2xbC
	for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2023 22:36:03 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68bedc0c268so862052b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2023 05:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694090158; x=1694694958; darn=lists.ozlabs.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92ZzARlgvwbUgPGukrjbEt7NIUtDZ/sbGDiLDmqSYTc=;
        b=aaOEyihvuhO4/dmlMT1QqUjzYiGdfKUD003twbsfL1JR6/rGptOI3bZtrYBrMWi+Bz
         316VNBAFhoPCV7QAZP1jViiWDhsCCVO3EtWNGsQtpORLRYJzgwFeicnhRsrdrNRJxZbc
         AJ9xt5ilCFNAUcDVcsIzR/Q6MwBwi8DaYiY9G0pwamlQY/8RbF+ivFjCUwOsv7wqmI7H
         rIhwXNhT3zI2SiMsOSXpRh2J9az5pLaLV5IhCYEmxnoRq51JdntTQgDsMW8sCfwnFA6L
         Ns1IrOETQ+rgJCztia6YPTKN32ELF0wRKOtDdb596byhLPR9dOMGMge5ZT+8xH9sVPPf
         yoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694090158; x=1694694958;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92ZzARlgvwbUgPGukrjbEt7NIUtDZ/sbGDiLDmqSYTc=;
        b=Tnwelad6bqgk59sFkMCTDYPBKKMXKMyfDPZNoyoAO2NjXTM8O6AmpuGov/vrghxGZl
         2/c9TDsfZjYHZAlikt/F2XIZUmDjUc1qP/Gr6f6VQX/773yO4kBwSmfrA3Kz9UT9Cvyw
         vxszU1m1rU5hqINZo6h1Jwq8vmoWKxCr6HOVPhtun2GjM2V/t68zhvj60ZvnifoqKUXd
         OcrZULusBFL6ryIWmd+kCTK9rY0qPOsu0qQPUKbm2BlwpMNTEj0WQexAM3CSqEk39UW2
         x38eDx2H+pirkuFoCfHfZvrwr1JyCQeZfyRi+ruRfZnXWpDL8Mo7JvyPu49ecvvj53x1
         gH9g==
X-Gm-Message-State: AOJu0Ywjdl9UbaLNqmDHd+dcqPwJGsVLhzckNmUtoEuYZY9+/mNvaghr
	8Yrb4HEePYlzv3xWZnP2utA=
X-Google-Smtp-Source: AGHT+IGAwoAH1VuEf0uLg7JzznbpK7+58KcqeTEwKuzaqoEerqdZGEl+5m4s+IUxsXsAAxGB04D6nQ==
X-Received: by 2002:a05:6a21:7786:b0:153:a897:3be5 with SMTP id bd6-20020a056a21778600b00153a8973be5mr3705184pzc.42.1694090158062;
        Thu, 07 Sep 2023 05:35:58 -0700 (PDT)
Received: from smtpclient.apple (27-52-169-67.adsl.fetnet.net. [27.52.169.67])
        by smtp.gmail.com with ESMTPSA id z8-20020aa791c8000000b006870ed427b2sm12607500pfa.94.2023.09.07.05.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 05:35:57 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-2185EB29-4669-4079-BEF3-A86D4031405D
Content-Transfer-Encoding: 7bit
From: Mining Lin <mimi05633@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Thu, 7 Sep 2023 20:35:44 +0800
Message-Id: <D2AB4837-EC02-49ED-8A2B-27FC02B54763@gmail.com>
References: <20230906140123dd8ffac4@mail.local>
In-Reply-To: <20230906140123dd8ffac4@mail.local>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: iPhone Mail (20G75)
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, mylin1@nuvoton.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, KFLIN@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-2185EB29-4669-4079-BEF3-A86D4031405D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Alexandre,

Thanks for your comments.
The replies are as follow.

Thanks.
Best regard,
Mia

Sent from my iPhone

> On Sep 6, 2023, at 10:01 PM, Alexandre Belloni <alexandre.belloni@bootlin.=
com> wrote:
>=20
> =EF=BB=BFOn 06/09/2023 09:19:29+0800, Mining Lin wrote:
>>>> static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
>>>> {
>>>>   int err, flags;
>>>> @@ -55,7 +59,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *=
client, bool on)
>>>>   flags =3D  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>>>>   if (flags < 0) {
>>>>       dev_dbg(&client->dev,
>>>> -            "Failed to read NCT3018Y_REG_CTRL\n");
>>>> +            "%s: Failed to read ctrl reg.\n", __func__);
>>>=20
>>> If you really insist on this change, what about:
>>>=20
>>> #define pr_fmt(fmt) "%s: " fmt, __func__
>> [Mia] Do you mean to replace dev_dbg with pr_debug? If yes, for consisten=
cy, I'm going to refine all messages via pr_debug. Thank you for your sugges=
tion.
>=20
> No, I mean that instead of adding __func__ to all the messages just
> define pr_fmt, this should achieve what you want.
[Mia] I'd like to confirm that you mean that I just need to define pr_fmt so=
 that dev_dbg can show function name in the log?
I try to define pr_fmt and the function name is shown in the log by pr_*(e.g=
. pr_debug) but not by dev_*(e.g. dev_dbg). And I also add
#define dev_fmt pr_fmt
but build error.

> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--Apple-Mail-2185EB29-4669-4079-BEF3-A86D4031405D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><p class=3D"p1" style=3D"margin: 0px; font-=
stretch: normal; line-height: normal; font-size-adjust: none; font-kerning: a=
uto; font-variant-alternates: normal; font-variant-ligatures: normal; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; font-feature-settings: normal; font-optical-sizing: auto; font-v=
ariation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -=
webkit-text-size-adjust: auto;"><span class=3D"s1">Dear Alexandre,</span></p=
><p class=3D"p2" style=3D"margin: 0px; font-stretch: normal; line-height: no=
rmal; font-size-adjust: none; font-kerning: auto; font-variant-alternates: n=
ormal; font-variant-ligatures: normal; font-variant-numeric: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; font-feature-settin=
gs: normal; font-optical-sizing: auto; font-variation-settings: normal; min-=
height: 24px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit-text-s=
ize-adjust: auto;"><span class=3D"s1"></span><br></p><p class=3D"p1" style=3D=
"margin: 0px; font-stretch: normal; line-height: normal; font-size-adjust: n=
one; font-kerning: auto; font-variant-alternates: normal; font-variant-ligat=
ures: normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; font-feature-settings: normal; font-optical-=
sizing: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D"s1">Thank=
s for your comments.</span></p><p class=3D"p1" style=3D"margin: 0px; font-st=
retch: normal; line-height: normal; font-size-adjust: none; font-kerning: au=
to; font-variant-alternates: normal; font-variant-ligatures: normal; font-va=
riant-numeric: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; font-feature-settings: normal; font-optical-sizing: auto; font-va=
riation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -w=
ebkit-text-size-adjust: auto;"><span class=3D"s1">The replies are as follow.=
</span></p><p class=3D"p2" style=3D"margin: 0px; font-stretch: normal; line-=
height: normal; font-size-adjust: none; font-kerning: auto; font-variant-alt=
ernates: normal; font-variant-ligatures: normal; font-variant-numeric: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; font-feat=
ure-settings: normal; font-optical-sizing: auto; font-variation-settings: no=
rmal; min-height: 24px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -web=
kit-text-size-adjust: auto;"><span class=3D"s1"></span><br></p><p class=3D"p=
1" style=3D"margin: 0px; font-stretch: normal; line-height: normal; font-siz=
e-adjust: none; font-kerning: auto; font-variant-alternates: normal; font-va=
riant-ligatures: normal; font-variant-numeric: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; font-feature-settings: normal; fo=
nt-optical-sizing: auto; font-variation-settings: normal; caret-color: rgb(0=
, 0, 0); color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D=
"s1">Thanks.</span></p><p class=3D"p1" style=3D"margin: 0px; font-stretch: n=
ormal; line-height: normal; font-size-adjust: none; font-kerning: auto; font=
-variant-alternates: normal; font-variant-ligatures: normal; font-variant-nu=
meric: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; font-feature-settings: normal; font-optical-sizing: auto; font-variation-=
settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit-te=
xt-size-adjust: auto;"><span class=3D"s1">Best regard,</span></p><p class=3D=
"p1" style=3D"margin: 0px; font-stretch: normal; line-height: normal; font-s=
ize-adjust: none; font-kerning: auto; font-variant-alternates: normal; font-=
variant-ligatures: normal; font-variant-numeric: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; font-feature-settings: normal; f=
ont-optical-sizing: auto; font-variation-settings: normal; caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D=
"s1">Mia</span></p><br><div dir=3D"ltr">Sent from my iPhone</div><div dir=3D=
"ltr"><br><blockquote type=3D"cite">On Sep 6, 2023, at 10:01 PM, Alexandre B=
elloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><br></blockquote></di=
v><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 06/09/2023 09=
:19:29+0800, Mining Lin wrote:</span><br><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>static int nct3018y_set_ala=
rm_mode(struct i2c_client *client, bool on)</span><br></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>{</span><br></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span> &nbsp;&nbsp;int err, flags;</span><br></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>@@ -55,7 +59,7 @@ static int nct3018y_set_alarm_mode(struc=
t i2c_client *client, bool on)</span><br></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span> &nbsp;&nbsp;flags =3D &nbsp;i2c_smbus_read_byte_data(client, NC=
T3018Y_REG_CTRL);</span><br></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &=
nbsp;&nbsp;if (flags &lt; 0) {</span><br></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dev_dbg(&amp;client-&gt;dev=
,</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Failed to read NCT3018Y_=
REG_CTRL\n");</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"%s: Failed t=
o read ctrl reg.\n", __func__);</span><br></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>If you really insist on this change, what about:</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>#define pr_fmt(fmt) "%s: " fmt, __func__</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><span>[Mia] Do you mean to replac=
e dev_dbg with pr_debug? If yes, for consistency, I'm going to refine all me=
ssages via pr_debug. Thank you for your suggestion.</span><br></blockquote><=
span></span><br><span>No, I mean that instead of adding __func__ to all the m=
essages just</span><br><span>define pr_fmt, this should achieve what you wan=
t.</span></div></blockquote><span style=3D"-webkit-text-size-adjust: auto; c=
aret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">[Mia] I'd like to confirm th=
at you mean that I just need to define pr_fmt so that dev_dbg can show funct=
ion name in the log?</span><br style=3D"-webkit-text-size-adjust: auto; care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style=3D"-webkit-text-siz=
e-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">I try to de=
fine pr_fmt and the function name is shown in the log by pr_*(e.g. pr_debug)=
 but not by dev_*(e.g. dev_dbg). And I also add</span><div><font color=3D"#0=
00000"><span style=3D"caret-color: rgb(0, 0, 0); -webkit-text-size-adjust: a=
uto;">#define dev_fmt pr_fmt</span></font></div><div><font color=3D"#000000"=
><span style=3D"caret-color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;">=
but build error.<br></span></font><div><font color=3D"#000000"><span style=3D=
"caret-color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><br></span></fo=
nt><blockquote type=3D"cite"><div dir=3D"ltr"><span>-- </span><br><span>Alex=
andre Belloni, co-owner and COO, Bootlin</span><br><span>Embedded Linux and K=
ernel engineering</span><br><span>https://bootlin.com</span><br></div></bloc=
kquote></div></div></body></html>=

--Apple-Mail-2185EB29-4669-4079-BEF3-A86D4031405D--
