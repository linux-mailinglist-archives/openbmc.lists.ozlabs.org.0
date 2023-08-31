Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E878978E414
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 02:58:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FuhZWp/5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbjSr6GNfz30MY
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 10:58:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FuhZWp/5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbjSD68y3z2xpw
	for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2023 10:57:30 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6beff322a97so306211a34.3
        for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 17:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693443446; x=1694048246; darn=lists.ozlabs.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOBLmyBEWfLZu2AwbrtrgxPDMT5XTep3u8cerjyFGFc=;
        b=FuhZWp/5hkOsM3aGEXyFRxyU4FzFIF9tclZ6uzYuDQO8TNEkQd5BiawN6alM+u05Eh
         cYPGWpnOCBbPxsEM1YgWlrtz1cFgflcxJTMAQtc50kOpz5mhN3tGmqDotUjYLC6NrUvp
         EwvtUAysADju9hBGRAxmk4/cFDnoIxPjF9/JeQtP2NhRBVS1SNnAlzDTrtsVUM1RJmnO
         fgrWk+TtnSKqL6oZ6tApEeJpCTR5o/DkVixpb1Snq5s7bBW68yLN0mtrQSaK5cO8Hg00
         kp1zh9712X6+WW4TZr7X6Pln90AvIOQLZaH3ckda5LxH0UrMp9l600dPtV5bcSbxmzbg
         TUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693443446; x=1694048246;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOBLmyBEWfLZu2AwbrtrgxPDMT5XTep3u8cerjyFGFc=;
        b=E3AblT71Vulr9j1FIk2VhICuezpjKHt4CfFsScAZgbURTUXO9iiIM99OYiFNAAEiBG
         e3RbxQ8XFuDWRp8nZ1XqETkAzLApNTEPcDJKq86+W1DLTv5O1cRivhsZj+VV6S7L4uXm
         w7r3/S816/wEDEB3HTy4JANBndfddnT7+NoEZMLfMECk+eoiWj5N61vIsXEll8WVuwx1
         BAGW4sUOeKkOguSDGbH1cIR/wX5z6iNrB1blRT5nS3IshjDR6grJLAhmrxsREFS4R+Ap
         tt1kU0h0g7DvJocoRjCSq4o683FDxHMQkk0iYqUb/sBihiPg0l5A1HcrSYeKwB7MpVct
         QNcg==
X-Gm-Message-State: AOJu0YzBQqVRCbFIYS0Jfx1tEe3tQJ57PdK5nSW0fwzvaSbQ2UwbALJU
	E8VIVAvE9HPQfosn4t941mk=
X-Google-Smtp-Source: AGHT+IFy5xiJJgMeT53ol50Eh26mGYAtbgWZjSQJMz7CxpuLcavt79BepQJUJ3j7jpN+eFs+DVGzMg==
X-Received: by 2002:a05:6870:c22a:b0:1c0:b03d:cf97 with SMTP id z42-20020a056870c22a00b001c0b03dcf97mr4283565oae.44.1693443445770;
        Wed, 30 Aug 2023 17:57:25 -0700 (PDT)
Received: from smtpclient.apple ([2401:e180:8d21:a13a:50b3:b7cd:b457:f29b])
        by smtp.gmail.com with ESMTPSA id u62-20020a17090a51c400b0026801e06ac1sm212952pjh.30.2023.08.30.17.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 17:57:25 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-AA94D94A-3F0E-4830-9055-EE3F8F30C4AA
Content-Transfer-Encoding: 7bit
From: Mining Lin <mimi05633@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Thu, 31 Aug 2023 08:57:13 +0800
Message-Id: <8B7AFA6F-1AFE-4B98-8FB7-0D9BA3DA79ED@gmail.com>
References: <2023082914221048e46085@mail.local>
In-Reply-To: <2023082914221048e46085@mail.local>
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


--Apple-Mail-AA94D94A-3F0E-4830-9055-EE3F8F30C4AA
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Alexandre,

Thanks for your comments.
I will store the part number to global parameter in probe and use it to chec=
k before setting time.

Thanks.
Best regard,
Mia

Sent from my iPhone

> On Aug 29, 2023, at 10:22 PM, Alexandre Belloni <alexandre.belloni@bootlin=
.com> wrote:
>=20
> =EF=BB=BFOn 29/08/2023 21:35:36+0800, Minying Lin wrote:
>>> Do you really have to check the part number every time you set the time?=

>>> I don't expect it to change once read in probe.
>>>=20
>> [Mia] Due to the 3018Y's topology, we need to set the TWO bit first to
>> obtain the write time capability, but the 3015Y does not have this proble=
m.
>> Therefore, we use part number & TWO bit to determine whether we need to s=
et
>> the TWO bit first before set time.
>>=20
>=20
> Sure but why don't you store the info somewhere instead of reading it
> from the RTC every time?
>=20
>>>=20
>>>> +     if (part_num < 0) {
>>>> +             dev_dbg(&client->dev, "%s: Failed to read part info
>>> reg.\n", __func__);
>>>> +             return part_num;
>>>> +     }
>>>> +
>>>=20
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--Apple-Mail-AA94D94A-3F0E-4830-9055-EE3F8F30C4AA
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><span style=3D"-webkit-text-size-adjust: au=
to; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Dear Alexandre,</span><=
br style=3D"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0);"><span style=3D"-webkit-text-size-adjust: auto; caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);"></span><br style=3D"-webkit-text-size-a=
djust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style=3D=
"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0);">Thanks for your comments.</span><br style=3D"-webkit-text-size-adjust:=
 auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><font color=3D"#0000=
00"><span style=3D"caret-color: rgb(0, 0, 0); -webkit-text-size-adjust: auto=
;">I will store the part number to global parameter in probe and use it to c=
heck before setting time.</span></font><br style=3D"-webkit-text-size-adjust=
: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style=3D"-web=
kit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"=
></span><br style=3D"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0);"><span style=3D"-webkit-text-size-adjust: auto; care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Thanks.</span><br style=3D"-web=
kit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"=
><span style=3D"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); c=
olor: rgb(0, 0, 0);">Best regard,</span><br style=3D"-webkit-text-size-adjus=
t: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style=3D"-we=
bkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
">Mia</span><br><br><div dir=3D"ltr">Sent from my iPhone</div><div dir=3D"lt=
r"><br><blockquote type=3D"cite">On Aug 29, 2023, at 10:22 PM, Alexandre Bel=
loni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><br></blockquote></div>=
<blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 29/08/2023 21:3=
5:36+0800, Minying Lin wrote:</span><br><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>Do you really have to check the part number every time=
 you set the time?</span><br></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>I don't expect it to change once read i=
n probe.</span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><span>[Mia] Due to the 3018Y's topology, we need to set the TWO=
 bit first to</span><br></blockquote><blockquote type=3D"cite"><span>obtain t=
he write time capability, but the 3015Y does not have this problem.</span><b=
r></blockquote><blockquote type=3D"cite"><span>Therefore, we use part number=
 &amp; TWO bit to determine whether we need to set</span><br></blockquote><b=
lockquote type=3D"cite"><span>the TWO bit first before set time.</span><br><=
/blockquote><blockquote type=3D"cite"><span></span><br></blockquote><span></=
span><br><span>Sure but why don't you store the info somewhere instead of re=
ading it</span><br><span>from the RTC every time?</span><br><span></span><br=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;if (part_num &lt; 0) {=
</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dev_dbg(&amp;client-=
&gt;dev, "%s: Failed to read part info</span><br></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>reg.\n=
", __func__);</span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return part_num;</sp=
an><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&n=
bsp;}</span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>--</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Alexandre Belloni=
, co-owner and COO, Bootlin</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Embedded Linux and Kernel engin=
eering</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>https://bootlin.com</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote><span></span><br><span>-- </span><br><span>Alexandre=
 Belloni, co-owner and COO, Bootlin</span><br><span>Embedded Linux and Kerne=
l engineering</span><br><span>https://bootlin.com</span><br></div></blockquo=
te></body></html>=

--Apple-Mail-AA94D94A-3F0E-4830-9055-EE3F8F30C4AA--
