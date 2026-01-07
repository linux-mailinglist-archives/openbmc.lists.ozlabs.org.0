Return-Path: <openbmc+bounces-1104-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A8D00596
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 23:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmjnG2yNfz2y8c;
	Thu, 08 Jan 2026 09:46:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767824511;
	cv=none; b=T3r9oEdz1UFw/KM9BIOPCNUAFJvd91zMKJ6TttfspaSccP09tP2mhgdNvky3HkYdzEbPTzYsK3Fo3wJrwdBm7qrRkwhxGCYmw2V8m9AxoHIalFQCwYbNYzhQy56UhVQ8M3owJ9oyuY6XaNUUp0wYAtETa/syhqS6fNtbROm1tRDhMCAInElFvBRRYewQJwqEK7H8cUxzJPkZhyOV2o1LvMi87e7Nkf8BEqlS9phFbyt22+PdaVaHn2TTRYMNKl7euVPLTfs5ubw5aLFeXpZBzKGrSQekf6wh3KKXo7MHjBYtAPoq15lGHI0q4F4axmxnMdy7wOCifo1GflJ5p7G6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767824511; c=relaxed/relaxed;
	bh=cfOh0iPNcFVQdTiU8tOtCSYtVSrE3flARUJwk2S2vn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJLBkenwdrnasNK1l4tRwNAAfIEaczAGVx9aDdb0liq68drPCvytNj6YiuwGCAaQr5DiK7GGorM9DmM1MxpJWVG7IXatGUXBMm4livbzuOLzai7Wzppofxehuj1YzsQszWQicwCqK/lzyADRZsVja8ssKxTBo7SkSzygr0XenChJ4nHVpH13zr1Ei5mwnV+fE2tsbZTMbhAYazoZjiaPuUNP4GyyLPtevT3WKRvIkVepLXqRj4ycz5LxzanrPkikTPQr/B2eYZo1SMmwe21CW+nDBwlzOyEY5CmF3fIXPiic4CZmhB6osfCKqZJjKQ4gmaLArG7hRtbmdQ7VVMJbpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lfprojects.org; dkim=pass (2048-bit key; unprotected) header.d=lfprojects-org.20230601.gappssmtp.com header.i=@lfprojects-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sTwDbPul; dkim-atps=neutral; spf=softfail (client-ip=74.125.224.41; helo=mail-yx1-f41.google.com; envelope-from=manager@lfprojects.org; receiver=lists.ozlabs.org) smtp.mailfrom=lfprojects.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lfprojects.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lfprojects-org.20230601.gappssmtp.com header.i=@lfprojects-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sTwDbPul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=lfprojects.org (client-ip=74.125.224.41; helo=mail-yx1-f41.google.com; envelope-from=manager@lfprojects.org; receiver=lists.ozlabs.org)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmjF85Y1zz2y7c
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 09:21:47 +1100 (AEDT)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64669a2ecb5so1700696d50.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 14:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lfprojects-org.20230601.gappssmtp.com; s=20230601; t=1767824445; x=1768429245; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cfOh0iPNcFVQdTiU8tOtCSYtVSrE3flARUJwk2S2vn4=;
        b=sTwDbPuleWl3oKwZ7QfgH19zHthXCu+z3BMfDts1Qzxy98ndBBB4xCiYRVGZmqrT1n
         JDjiaI4jXQlWnVf6Dr/xDax3C2I0Vym/qXdK0RyZM9qulP2WKT7/7x5UA83PukxL+KHI
         oEfHQRwj8AP5XAhKIrvTE/xRyJJHOZ+6ql2KhmCKd6cH8afbEKVgShVU9lveRB9dYxvG
         gZsBujWHT2N19/L/6P49aYmrsIsmS75gS5eNMSN5hg54s5O59nq8UtfiJIyO9lq2rDJ9
         WFFINWRPWbuphj3kJhzOotp4RhOsX8N1i36AFr582aD9oNhl4zaeN91d8D8jDsmI91M8
         V1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767824445; x=1768429245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfOh0iPNcFVQdTiU8tOtCSYtVSrE3flARUJwk2S2vn4=;
        b=QKMloFLYK/ieA0LYgHYbXzgcanpxzAqWDEeI2UB7adOxPnkl87YpLMPDKJN1eE4hv2
         wc33yi2F0cFk37CbC0pUDAA1Su6Jp0dCT0Sm1lNl1ngGqa5gY2qgWJYfSyMWcavHGlRs
         mbdrIM/D7NW+8IS4fnf7GK9P7oOim8g3Z9DBai+pT/WIPE5P5tuPwIErQEmXwDpTkYOp
         hPTR09lHiq/PezJmiitlxbZu+/qYVlaAzl89sS09X8oV2ZI7yNnil3ZShQ0Pz0BxW/Ep
         me4tqK15ixtBsYrPscCega+iH9fg6mj3O9AfZnCwsFdEDbbmw5UR9rgSwvlq1RVcmNUI
         GguQ==
X-Gm-Message-State: AOJu0YxdNfix5I+CMp6ybFLySjEH4Ruw8aZQ2kqzpotvmWRgWrsX+zqE
	YdaaTGpivNw6ybeQLhgTfFfB0luX/gv3XqvgEP+x+N9LZCHen0EO5y6szOJJKYo7VU8Qg3c3vfl
	MT5nFDsCtftYhHRU5C86OPCL0EL6wu6Mm77TOERNqtg==
X-Gm-Gg: AY/fxX40EnG4cIMoEeiLouhxtyVOeyJJ2aWxQZ4FTrjsp7T1oJsi8GeuAg1o5qszm49
	9Kr3YZiFbC7FR3gdZR3VWbY7SkfPzv3FoRaZ+sUyQdFp3Fy58FYUIDMCRrlQgjZ4ASTCtQYFIG3
	G30XLoTbcN/hKKTokwlSUVIQplw0sEsW+jFCp8W381sZHB0Ow3C4IgpgtwBijRe3dDtassxa7OW
	5fgKDfdmkBcwq3vfYPYwIjWS2500Hdcb4m7uDH0PBzFlDJJd7rRF/+to00ft9IDU1ecVY1qjAYj
	7ld7oQ==
X-Google-Smtp-Source: AGHT+IEgQmfNs1EHAD9oa/HrUlbsri9tfU1ZZQ0SKhbdXBWojlxx2MDZODGsId6EmgabkzFKC59ITz85MHMj/n5P0S0=
X-Received: by 2002:a05:690e:1206:b0:63f:c019:23b2 with SMTP id
 956f58d0204a3-6470d2dfce6mr6210277d50.28.1767824445497; Wed, 07 Jan 2026
 14:20:45 -0800 (PST)
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
References: <CAKmsAdnDfkOQqaL_KJ5y4QDBYoDifSSdOGZdFdwSzNxScC5zxg@mail.gmail.com>
 <CALVHhed3eE1XjcF21rnKEChoxpAkHoepi5hU3jYj-eSuB+1hiA@mail.gmail.com>
 <CAKmsAdmfX6jZAVBd5XeDqUk-Mq3bFpOM5+WukRfMgNE29SMB0w@mail.gmail.com>
 <CALVHhecuwENv9w4QEmjLShLiq9=PMv6HyiWwAxOS-85MfrBftg@mail.gmail.com> <CAKmsAd=NX+3iKQn9dJ-BW5qDFx-MWnNPFkx3ZqsnSD+Cwh_uGQ@mail.gmail.com>
In-Reply-To: <CAKmsAd=NX+3iKQn9dJ-BW5qDFx-MWnNPFkx3ZqsnSD+Cwh_uGQ@mail.gmail.com>
From: Mike Dolan <manager@lfprojects.org>
Date: Wed, 7 Jan 2026 17:20:34 -0500
X-Gm-Features: AQt7F2qva7xhvoAR0P4KcknUUKtH9BkJziPdJVxK90rJGsGk2BXVLy67RY9Nax0
Message-ID: <CALVHhed2dTFAMoo8gOWw1YnxeWd3bfjtiJ6r42K3st6UTJx8CA@mail.gmail.com>
Subject: Re: OpenBMC Individual CLA Resubmission - ksypassion
To: Soo-yeon Kang <ksypassion@gmail.com>
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <andrewg@us.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000196ee10647d3b474"
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_SOFTFAIL autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000196ee10647d3b474
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Soo-yeon, what would happen if you contributed, and then the company
decided they didn't want to approve the CCLA and therefore wouldn't stand
behind your individual contributions? That's the issue OpenBMC would have,
so my inclination is to say work through the company CCLA approval and
begin contributing once that is in place. That's how this should be done in
my opinion.

Mike

On Wed, Jan 7, 2026 at 5:09=E2=80=AFPM Soo-yeon Kang <ksypassion@gmail.com>=
 wrote:

> Hi,
>
> Thank you for the guidance. I have discussed this with my company
> (AccessLab),
> and they have approved the following approach:
>
> 1. Start with an Individual CLA to begin contributing immediately
> 2. Transition to a Corporate CLA once the company completes their
> internal approval process for the CCLA
>
> My company is supportive of contributing to OpenBMC, but the Corporate CL=
A
> requires legal review and executive approval, which will take several
> weeks.
>
> Would it be acceptable to proceed with an Individual CLA in the interim,
> with the understanding that we will submit a Corporate CLA shortly?
> This would allow me to start contributing while the company processes
> the CCLA paperwork.
>
> If the OpenBMC policy strictly requires CCLA first, I understand and
> will wait for the company CCLA to be processed before contributing.
>
> Please let me know which approach is acceptable.
>
> Thank you.
>
> Best regards,
> Soo-yeon
>
>
>
> 2026=EB=85=84 1=EC=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 3:38, =
Mike Dolan <manager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>> Hi Soo-yeon, the OpenBMC community requires contributors employed at a
>> company to have the company CCLA on file. I would recommend you get the
>> company CCLA approval first.
>>
>> Mike
>>
>> On Tue, Jan 6, 2026 at 10:06=E2=80=AFPM Soo-yeon Kang <ksypassion@gmail.=
com>
>> wrote:
>>
>>> Hello,
>>>
>>> I am currently contributing as an individual to get started with OpenBM=
C
>>> development. However, I work at XSLab (https://xslab.co.kr) as an
>>> embedded
>>> software developer, and we are planning to have our company sign a
>>> Corporate CLA in the future.
>>>
>>> For now, could you please process my Individual CLA so I can begin
>>> contributing immediately? We will follow up with a Corporate CLA later
>>> once the company completes the necessary approvals.
>>>
>>> Is this approach acceptable?
>>>
>>> Thank you.
>>> Best Regards
>>>
>>> 2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan <ma=
nager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>>
>>>> Hi Soo-yeon, which company are you contributing on behalf of?
>>>>
>>>> Mike
>>>>
>>>> On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang <ksypassion@gmail=
.com>
>>>> wrote:
>>>>
>>>>> Hello,
>>>>>
>>>>> I am resubmitting my Individual Contributor License Agreement for
>>>>> OpenBMC.
>>>>>
>>>>> I originally submitted my CLA on December 7, 2022, but it appears it
>>>>> was not processed in the system.
>>>>> I am currently unable to contribute to OpenBMC repositories due to
>>>>> "User not approved" status.
>>>>>
>>>>> I am attaching a newly signed CLA document with this email.
>>>>> (Attached file: OpenBMC_ICLA_ksypassion.pdf)
>>>>> Please process this resubmission and confirm once it has been
>>>>> registered.
>>>>>
>>>>> Details:
>>>>>
>>>>> - Full Name: Soo-yeon Kang
>>>>> - Email: ksypassion@gmail.com
>>>>> - GitHub Username: ksypassion
>>>>> - Gerrit Username: ksypassion
>>>>>
>>>>>
>>>>> Please let me know once my CLA has been processed.
>>>>>
>>>>> Thank you.
>>>>>
>>>>>
>>>>> --
>>>>>
>>>>>
>>>>> Soo-yeon  Kang
>>>>>
>>>>> Mobile: +82 10 - 4067 - 8539
>>>>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>>>>
>>>>>
>>>
>>> --
>>>
>>>
>>> Soo-yeon  Kang
>>>
>>> Mobile: +82 10 - 4067 - 8539
>>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>>
>>>

--000000000000196ee10647d3b474
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Soo-yeon, what would happen if you contributed, and the=
n the company decided they didn&#39;t want to approve the CCLA and therefor=
e wouldn&#39;t stand behind your individual contributions? That&#39;s the i=
ssue OpenBMC would have, so my inclination is to say work through the compa=
ny CCLA approval and begin contributing once that is in place. That&#39;s h=
ow this should be done in my opinion.<div><br></div><div>Mike</div></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 7, 2026 at 5:09=E2=80=AFPM Soo-yeon Kang &lt;<a=
 href=3D"mailto:ksypassion@gmail.com">ksypassion@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div style=
=3D"font-size:inherit">Hi,<br style=3D"font-size:inherit"><br style=3D"font=
-size:inherit">Thank you for the guidance. I have discussed this with my co=
mpany (AccessLab), <br style=3D"font-size:inherit">and they have approved t=
he following approach:<br style=3D"font-size:inherit"><br style=3D"font-siz=
e:inherit">1. Start with an Individual CLA to begin contributing immediatel=
y<br style=3D"font-size:inherit">2. Transition to a Corporate CLA once the =
company completes their <br style=3D"font-size:inherit">   internal approva=
l process for the CCLA<br style=3D"font-size:inherit"><br style=3D"font-siz=
e:inherit">My company is supportive of contributing to OpenBMC, but the Cor=
porate CLA <br style=3D"font-size:inherit">requires legal review and execut=
ive approval, which will take several weeks.<br style=3D"font-size:inherit"=
><br style=3D"font-size:inherit">Would it be acceptable to proceed with an =
Individual CLA in the interim, <br style=3D"font-size:inherit">with the und=
erstanding that we will submit a Corporate CLA shortly? <br style=3D"font-s=
ize:inherit">This would allow me to start contributing while the company pr=
ocesses <br style=3D"font-size:inherit">the CCLA paperwork.<br style=3D"fon=
t-size:inherit"><br style=3D"font-size:inherit">If the OpenBMC policy stric=
tly requires CCLA first, I understand and <br style=3D"font-size:inherit">w=
ill wait for the company CCLA to be processed before contributing.<br style=
=3D"font-size:inherit"><br style=3D"font-size:inherit">Please let me know w=
hich approach is acceptable.<br style=3D"font-size:inherit"><br style=3D"fo=
nt-size:inherit">Thank you.<br style=3D"font-size:inherit"><br style=3D"fon=
t-size:inherit">Best regards,<br style=3D"font-size:inherit">Soo-yeon<br st=
yle=3D"font-size:inherit"></div><br></div><div><br></div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2026=EB=85=84 1=EC=
=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 3:38, Mike Dolan &lt;<a hr=
ef=3D"mailto:manager@lfprojects.org" target=3D"_blank">manager@lfprojects.o=
rg</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Soo-yeon, the OpenBMC =
community requires contributors employed at a company to have the company C=
CLA on file. I would recommend you get the company CCLA approval first.=C2=
=A0</div><div dir=3D"ltr"><div><br></div><div>Mike</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026=
 at 10:06=E2=80=AFPM Soo-yeon Kang &lt;<a href=3D"mailto:ksypassion@gmail.c=
om" target=3D"_blank">ksypassion@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello,<br><br>I =
am currently contributing as an individual to get started with OpenBMC <br>=
development. However, I work at XSLab (<a href=3D"https://xslab.co.kr" targ=
et=3D"_blank">https://xslab.co.kr</a>) as an embedded <br>software develope=
r, and we are planning to have our company sign a <br>Corporate CLA in the =
future.<br><br>For now, could you please process my Individual CLA so I can=
 begin <br>contributing immediately? We will follow up with a Corporate CLA=
 later <br>once the company completes the necessary approvals.<br><br>Is th=
is approach acceptable?<br><br>Thank you.<div>Best Regards</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2026=EB=85=
=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan &lt;<a href=3D"ma=
ilto:manager@lfprojects.org" target=3D"_blank">manager@lfprojects.org</a>&g=
t;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Hi=C2=A0Soo-yeon, which company a=
re you contributing on behalf of?<div><br></div><div>Mike</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan =
6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang &lt;<a href=3D"mailto:ksypassion@g=
mail.com" target=3D"_blank">ksypassion@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello=
,</div><div><br>I am resubmitting my Individual Contributor License Agreeme=
nt for OpenBMC.<br><br>I originally submitted my CLA on December 7, 2022, b=
ut it appears it was not processed in the system.</div><div>I am currently =
unable to contribute to OpenBMC repositories due to &quot;User not approved=
&quot; status.<br><br>I am attaching a newly signed CLA document with this =
email.</div><div>(Attached file:=C2=A0OpenBMC_ICLA_ksypassion.pdf)<br>Pleas=
e process this resubmission and confirm once it has been registered.</div><=
div><br>Details:<br></div><blockquote style=3D"margin:0px 0px 0px 40px;bord=
er:medium;padding:0px"><div>- Full Name: Soo-yeon Kang</div><div>- Email: <=
a href=3D"mailto:ksypassion@gmail.com" target=3D"_blank">ksypassion@gmail.c=
om</a></div><div>- GitHub Username: ksypassion</div><div>- Gerrit Username:=
 ksypassion</div></blockquote><div><br>Please let me know once my CLA has b=
een processed.</div><div><br>Thank you.<br><br></div><div><br></div><span c=
lass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br style=3D"c=
olor:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><br style=3D"color:=
rgb(51,51,51);font-family:Roboto"><table style=3D"border-collapse:collapse;=
border-spacing:0px;font-family:Roboto;color:rgb(51,51,51)"><tbody style=3D"=
font-family:Roboto"><tr style=3D"font-family:Roboto"><td colspan=3D"2" styl=
e=3D"padding:0px 0px 2px;border-width:0px 0px 1px;border-bottom-style:solid=
;outline:currentcolor;font-family:Roboto;border-bottom-color:rgb(0,182,217)=
"><span style=3D"border-bottom:3px solid rgb(0,182,217);padding:0px 0px 2px=
;font-family:Roboto"><span style=3D"font-family:arial;font-weight:bold">Soo=
-yeon =C2=A0Kang</span>=C2=A0=C2=A0</span></td></tr><tr style=3D"font-famil=
y:Roboto"><td valign=3D"top" style=3D"padding:7px 16px 0px 0px;border:0px;o=
utline:currentcolor;font-family:Roboto"></td><td valign=3D"top" style=3D"pa=
dding:7px 0px 0px;border:0px;outline:currentcolor;font-family:Roboto"><div =
style=3D"margin:0px;padding:2px 0px 0px;border:0px;outline:currentcolor;fon=
t-family:Roboto"><div style=3D"margin:0px;padding:0px;border:0px;outline:cu=
rrentcolor;font-family:Roboto"><span style=3D"font-family:arial;color:rgb(0=
,182,217)">Mobile:</span>=C2=A0<span style=3D"font-family:arial">+82 10 - 4=
067 - 8539</span></div><div style=3D"margin:0px;padding:0px;border:0px;outl=
ine:currentcolor;font-family:Roboto"><span style=3D"font-family:arial;color=
:rgb(0,182,217)">E-mail:</span>=C2=A0<a href=3D"mailto:ksypassion@gmail.com=
" style=3D"outline:currentcolor;text-decoration:none;border:medium;font-fam=
ily:arial;color:rgb(0,0,0)" target=3D"_blank">ksypassion@gmail.co</a>m</div=
></div></td></tr></tbody></table><div style=3D"margin:0px;padding:0px;borde=
r-width:1px 0px 0px;border-top-style:solid;outline:currentcolor;font-family=
:arial;font-size:small;border-top-color:rgb(208,208,208);color:rgb(51,51,51=
)"><br></div></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br style=3D"color=
:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><br style=3D"color:rgb(=
51,51,51);font-family:Roboto"><table style=3D"border-collapse:collapse;bord=
er-spacing:0px;font-family:Roboto;color:rgb(51,51,51)"><tbody style=3D"font=
-family:Roboto"><tr style=3D"font-family:Roboto"><td colspan=3D"2" style=3D=
"padding:0px 0px 2px;border-width:0px 0px 1px;border-bottom-style:solid;out=
line:currentcolor;font-family:Roboto;border-bottom-color:rgb(0,182,217)"><s=
pan style=3D"border-bottom:3px solid rgb(0,182,217);padding:0px 0px 2px;fon=
t-family:Roboto"><span style=3D"font-family:arial;font-weight:bold">Soo-yeo=
n =C2=A0Kang</span>=C2=A0=C2=A0</span></td></tr><tr style=3D"font-family:Ro=
boto"><td valign=3D"top" style=3D"padding:7px 16px 0px 0px;border:0px;outli=
ne:currentcolor;font-family:Roboto"></td><td valign=3D"top" style=3D"paddin=
g:7px 0px 0px;border:0px;outline:currentcolor;font-family:Roboto"><div styl=
e=3D"margin:0px;padding:2px 0px 0px;border:0px;outline:currentcolor;font-fa=
mily:Roboto"><div style=3D"margin:0px;padding:0px;border:0px;outline:curren=
tcolor;font-family:Roboto"><span style=3D"font-family:arial;color:rgb(0,182=
,217)">Mobile:</span>=C2=A0<span style=3D"font-family:arial">+82 10 - 4067 =
- 8539</span></div><div style=3D"margin:0px;padding:0px;border:0px;outline:=
currentcolor;font-family:Roboto"><span style=3D"font-family:arial;color:rgb=
(0,182,217)">E-mail:</span>=C2=A0<a href=3D"mailto:ksypassion@gmail.com" st=
yle=3D"outline:currentcolor;text-decoration:none;border:medium;font-family:=
arial;color:rgb(0,0,0)" target=3D"_blank">ksypassion@gmail.co</a>m</div></d=
iv></td></tr></tbody></table><div style=3D"margin:0px;padding:0px;border-wi=
dth:1px 0px 0px;border-top-style:solid;outline:currentcolor;font-family:ari=
al;font-size:small;border-top-color:rgb(208,208,208);color:rgb(51,51,51)"><=
br></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--000000000000196ee10647d3b474--

