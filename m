Return-Path: <openbmc+bounces-1103-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0DD00557
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 23:36:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmjYk0PKJz2yFq;
	Thu, 08 Jan 2026 09:36:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767825370;
	cv=none; b=LMi9Zgg+tD3PYAZKREkj/I88lG+dW7bAkqlh8vQAkFT580h7hKTuTlo2zT92MS7QHdPX+m3k5iC5Dr7tFRPV3VZ1CfNHO08LLddL79PnBKsKwO3mMZLm3H/VSu+3ouPa1kDSFPomAckgyVOi5rK7GaNyJ7pcDM/Jensrtwan7u8Wl7COlhXmvZsJrp26XsdgyCLCC5eORevulljVtQWPCUEEic81jdgjj0r80QN+coPOVb8eFxL84aXLtCOb9T+fd7QRjL4HMnNcYnbgMEP317Q97tOKybIUqhxP/nSKSk4KyF+WLUbLvlhraTLTxJEXiQrGwpoJ695kJ8x2Gk//Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767825370; c=relaxed/relaxed;
	bh=7r35HIC+moYO1s2DZmpMN2iy+NReIDrpTuqpMvr/fz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIyji57PWmYvye4IXIFZWOzbnvxlHmnIYxOvdzXUYwnvY3UZKvPR7jA7kEIljwCvMkP0EosflHA+PsbmpEkzOoa1N/GkvBc4X8KQlsNPGD01Cw6YRjR135Y+AH2ghBCpMT8xT6vyKW74oKNDDaVZw34BwswRAgttwbDnmD28rwCVmgQa/px+W3Sb6uPVP6AvR66tFBfeXb+HroOCYtNPqulPLMIz4XiFnAvUOHCqmb9mDbyvrq5oQm2Egcpz6YFx4krG+D9HVfLl43r2cWSTl8gMm02NXCrqBZywwHEiOMQYfD9Q77fEz3ODGZ+NFBvQx0AgWJZgJ9W2kPIFDzjkfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nLouPh/t; dkim-atps=neutral; spf=pass (client-ip=209.85.167.49; helo=mail-lf1-f49.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nLouPh/t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.49; helo=mail-lf1-f49.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmjYg72Syz2yF1
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 09:36:07 +1100 (AEDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59a10df8027so2837282e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767825304; x=1768430104; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7r35HIC+moYO1s2DZmpMN2iy+NReIDrpTuqpMvr/fz8=;
        b=nLouPh/tNZAkxvKp9af0GNvRdUpDdi02XYDSbZ58zUc99ts41v1CGNKt4MfTepzL6z
         cYGYIv2Ld8NXTIQ1SCecWNDc0pkxlk/KvW5SCkDJJta0S/hUdK2Ixt8dCcUvYP7WQ9EX
         P5EtBcWtlQ8AxTUtF33fetmxasUFegCgkfHnlbn25K/7XIDgn4e7w/Moa+5O5/kplp7P
         dBamV5tQpP5+B6c8V6djFEbBV0XPQlb9MPOuYR0YliU/0GhTrKRj6IslgYprRpyxiJMB
         xEkkegcQCCCtWFUh0Uz4dYCg7utRcLgYnx+RyuqGvQsQfANMroGII26dXA8cMN9GnKim
         oEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767825304; x=1768430104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r35HIC+moYO1s2DZmpMN2iy+NReIDrpTuqpMvr/fz8=;
        b=swTj6c0w7uIhDAXFAatP05zqdRoPbnyOk23qh2nodogZv4au0HlNs68NxbBptMdZ8x
         TQiJst3PHA65zTXqu977tKeK0n0m9fho1IjHa8YzC3oi4/mQXK34ktN/0qNz/+a+cxQM
         BHAyFv3HFPJb8129RiMZ9fJJa0BVeNosCcN6hiLKNvyW9pWJ0KlfH6XBeHKYZpNRuDqA
         RZ7CUcGmeUnjR8aKjJC1Pzjdq9K5OR9NyUEkq1ECFCb7woYWwKj9lt6AchCdB/RyyQFE
         tlhqMTl95bwotRYqs/x+glX0RAmayDTpY4p2eCeGKZVVbWSbQDwocnCSUfG59uYoyJNa
         OR6Q==
X-Gm-Message-State: AOJu0Yw2FsnlCZsAZz5eOlK1LTKokHN9S4Rxsb2Ffjayki4gpix10I5D
	30iqwexCGQXhiwHuDYin/aUWeXf5g2ZB/R2vgqU7fXyWQbFjS4NPYLizpwS2lo2J6n73brf418l
	lSk3Sgfw95rrT2ds4URAjwk2BAecy/js=
X-Gm-Gg: AY/fxX5iYJ3aG/BDe5y0Xz5dGk02MpV4z0KIJIChlnbNBOPvx6lCO1rvhjXyiKCFeLB
	u7dSYLBTWF5qU6VbWFPrU7BeE3bhJQkiSPyXKlqwLWnktA/M2huGrZaOFXhMic4c4CIjA1+5Z3O
	kIOMBG3UPVITsfbNqJaCJHQQJdSHNhx0gMqvY/ydNvP/tSm4U/JgL2bdk3lIZlOwUfdmAoDB4no
	Gfu224TqgqhwgtyTPL/RRfCCmfOWdTxgIgqTF5lFfNymu1T1l7Tli7IymfsmqZRvfrMbc70
X-Google-Smtp-Source: AGHT+IGBzlsHoURzg3sa+Z//Do9q6x4CxGBqOxwUHzJgyz0ZlIp5WvWyuJEwfi55vrsATPUd9iOl1QMq+DIzvS/6r2M=
X-Received: by 2002:ac2:4c4f:0:b0:59b:6df3:d49b with SMTP id
 2adb3069b0e04-59b6f044f57mr1124011e87.29.1767825304003; Wed, 07 Jan 2026
 14:35:04 -0800 (PST)
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
 <CALVHhecuwENv9w4QEmjLShLiq9=PMv6HyiWwAxOS-85MfrBftg@mail.gmail.com>
 <CAKmsAd=NX+3iKQn9dJ-BW5qDFx-MWnNPFkx3ZqsnSD+Cwh_uGQ@mail.gmail.com> <CALVHhed2dTFAMoo8gOWw1YnxeWd3bfjtiJ6r42K3st6UTJx8CA@mail.gmail.com>
In-Reply-To: <CALVHhed2dTFAMoo8gOWw1YnxeWd3bfjtiJ6r42K3st6UTJx8CA@mail.gmail.com>
From: Soo-yeon Kang <ksypassion@gmail.com>
Date: Thu, 8 Jan 2026 07:34:52 +0900
X-Gm-Features: AQt7F2oFksYnFGuVKEg7Lgu7_HC26AXA8e-uQGdTK2QSLXoWRaVHNDCQ4MiUeKw
Message-ID: <CAKmsAdnBgmuVMeVSQiYMkzjmLws5_Ymw-4jPXMGa+2FepQ_r8Q@mail.gmail.com>
Subject: Re: OpenBMC Individual CLA Resubmission - ksypassion
To: Mike Dolan <manager@lfprojects.org>
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <andrewg@us.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000452abc0647d3e78f"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000452abc0647d3e78f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the detailed explanation. I completely understand the concern
about potential legal issues if the company later decides not to approve
the CCLA.

You're right - it makes sense to establish the proper legal foundation
first through the Corporate CLA before I begin contributing.

I will work with XSLab to complete the Corporate CLA approval process
and will reach out once it has been submitted to manager@lfprojects.org.

I appreciate your guidance and patience.

Best regards,
Soo-yeon



2026=EB=85=84 1=EC=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 7:20, Mi=
ke Dolan <manager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Hi Soo-yeon, what would happen if you contributed, and then the company
> decided they didn't want to approve the CCLA and therefore wouldn't stand
> behind your individual contributions? That's the issue OpenBMC would have=
,
> so my inclination is to say work through the company CCLA approval and
> begin contributing once that is in place. That's how this should be done =
in
> my opinion.
>
> Mike
>
> On Wed, Jan 7, 2026 at 5:09=E2=80=AFPM Soo-yeon Kang <ksypassion@gmail.co=
m> wrote:
>
>> Hi,
>>
>> Thank you for the guidance. I have discussed this with my company
>> (AccessLab),
>> and they have approved the following approach:
>>
>> 1. Start with an Individual CLA to begin contributing immediately
>> 2. Transition to a Corporate CLA once the company completes their
>> internal approval process for the CCLA
>>
>> My company is supportive of contributing to OpenBMC, but the Corporate
>> CLA
>> requires legal review and executive approval, which will take several
>> weeks.
>>
>> Would it be acceptable to proceed with an Individual CLA in the interim,
>> with the understanding that we will submit a Corporate CLA shortly?
>> This would allow me to start contributing while the company processes
>> the CCLA paperwork.
>>
>> If the OpenBMC policy strictly requires CCLA first, I understand and
>> will wait for the company CCLA to be processed before contributing.
>>
>> Please let me know which approach is acceptable.
>>
>> Thank you.
>>
>> Best regards,
>> Soo-yeon
>>
>>
>>
>> 2026=EB=85=84 1=EC=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 3:38,=
 Mike Dolan <manager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>>> Hi Soo-yeon, the OpenBMC community requires contributors employed at a
>>> company to have the company CCLA on file. I would recommend you get the
>>> company CCLA approval first.
>>>
>>> Mike
>>>
>>> On Tue, Jan 6, 2026 at 10:06=E2=80=AFPM Soo-yeon Kang <ksypassion@gmail=
.com>
>>> wrote:
>>>
>>>> Hello,
>>>>
>>>> I am currently contributing as an individual to get started with
>>>> OpenBMC
>>>> development. However, I work at XSLab (https://xslab.co.kr) as an
>>>> embedded
>>>> software developer, and we are planning to have our company sign a
>>>> Corporate CLA in the future.
>>>>
>>>> For now, could you please process my Individual CLA so I can begin
>>>> contributing immediately? We will follow up with a Corporate CLA later
>>>> once the company completes the necessary approvals.
>>>>
>>>> Is this approach acceptable?
>>>>
>>>> Thank you.
>>>> Best Regards
>>>>
>>>> 2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan <m=
anager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>>>
>>>>> Hi Soo-yeon, which company are you contributing on behalf of?
>>>>>
>>>>> Mike
>>>>>
>>>>> On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang <ksypassion@gmai=
l.com>
>>>>> wrote:
>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> I am resubmitting my Individual Contributor License Agreement for
>>>>>> OpenBMC.
>>>>>>
>>>>>> I originally submitted my CLA on December 7, 2022, but it appears it
>>>>>> was not processed in the system.
>>>>>> I am currently unable to contribute to OpenBMC repositories due to
>>>>>> "User not approved" status.
>>>>>>
>>>>>> I am attaching a newly signed CLA document with this email.
>>>>>> (Attached file: OpenBMC_ICLA_ksypassion.pdf)
>>>>>> Please process this resubmission and confirm once it has been
>>>>>> registered.
>>>>>>
>>>>>> Details:
>>>>>>
>>>>>> - Full Name: Soo-yeon Kang
>>>>>> - Email: ksypassion@gmail.com
>>>>>> - GitHub Username: ksypassion
>>>>>> - Gerrit Username: ksypassion
>>>>>>
>>>>>>
>>>>>> Please let me know once my CLA has been processed.
>>>>>>
>>>>>> Thank you.
>>>>>>
>>>>>>
>>>>>> --
>>>>>>
>>>>>>
>>>>>> Soo-yeon  Kang
>>>>>>
>>>>>> Mobile: +82 10 - 4067 - 8539
>>>>>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>>>>>
>>>>>>
>>>>
>>>> --
>>>>
>>>>
>>>> Soo-yeon  Kang
>>>>
>>>> Mobile: +82 10 - 4067 - 8539
>>>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>>>
>>>>

--000000000000452abc0647d3e78f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto"><div style=3D"font-size:=
inherit" dir=3D"auto">Hi,<br style=3D"font-size:inherit"><br style=3D"font-=
size:inherit">Thank you for the detailed explanation. I completely understa=
nd the concern <br style=3D"font-size:inherit">about potential legal issues=
 if the company later decides not to approve <br style=3D"font-size:inherit=
">the CCLA.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">=
You&#39;re right - it makes sense to establish the proper legal foundation =
<br style=3D"font-size:inherit">first through the Corporate CLA before I be=
gin contributing.<br style=3D"font-size:inherit"><br style=3D"font-size:inh=
erit">I will work with XSLab to complete the Corporate CLA approval process=
 <br style=3D"font-size:inherit">and will reach out once it has been submit=
ted to <a href=3D"mailto:manager@lfprojects.org">manager@lfprojects.org</a>=
.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">I apprecia=
te your guidance and patience.<br style=3D"font-size:inherit"><br style=3D"=
font-size:inherit">Best regards,<br style=3D"font-size:inherit">Soo-yeon<br=
 style=3D"font-size:inherit"></div><br></div></div><div><br></div><div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">2026=EB=85=84 1=EC=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=
=84 7:20, Mike Dolan &lt;<a href=3D"mailto:manager@lfprojects.org">manager@=
lfprojects.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)"><div dir=3D"ltr">Hi Soo-yeon, what would happen if you contribu=
ted, and then the company decided they didn&#39;t want to approve the CCLA =
and therefore wouldn&#39;t stand behind your individual contributions? That=
&#39;s the issue OpenBMC would have, so my inclination is to say work throu=
gh the company CCLA approval and begin contributing once that is in place. =
That&#39;s how this should be done in my opinion.</div><div dir=3D"ltr"><di=
v><br></div><div>Mike</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Jan 7, 2026 at 5:09=E2=80=AFPM Soo-yeon =
Kang &lt;<a href=3D"mailto:ksypassion@gmail.com" target=3D"_blank">ksypassi=
on@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><div style=3D"fo=
nt-size:inherit">Hi,<br style=3D"font-size:inherit"><br style=3D"font-size:=
inherit">Thank you for the guidance. I have discussed this with my company =
(AccessLab), <br style=3D"font-size:inherit">and they have approved the fol=
lowing approach:<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">1. Start with an Individual CLA to begin contributing immediately<br s=
tyle=3D"font-size:inherit">2. Transition to a Corporate CLA once the compan=
y completes their <br style=3D"font-size:inherit">   internal approval proc=
ess for the CCLA<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">My company is supportive of contributing to OpenBMC, but the Corporate=
 CLA <br style=3D"font-size:inherit">requires legal review and executive ap=
proval, which will take several weeks.<br style=3D"font-size:inherit"><br s=
tyle=3D"font-size:inherit">Would it be acceptable to proceed with an Indivi=
dual CLA in the interim, <br style=3D"font-size:inherit">with the understan=
ding that we will submit a Corporate CLA shortly? <br style=3D"font-size:in=
herit">This would allow me to start contributing while the company processe=
s <br style=3D"font-size:inherit">the CCLA paperwork.<br style=3D"font-size=
:inherit"><br style=3D"font-size:inherit">If the OpenBMC policy strictly re=
quires CCLA first, I understand and <br style=3D"font-size:inherit">will wa=
it for the company CCLA to be processed before contributing.<br style=3D"fo=
nt-size:inherit"><br style=3D"font-size:inherit">Please let me know which a=
pproach is acceptable.<br style=3D"font-size:inherit"><br style=3D"font-siz=
e:inherit">Thank you.<br style=3D"font-size:inherit"><br style=3D"font-size=
:inherit">Best regards,<br style=3D"font-size:inherit">Soo-yeon<br style=3D=
"font-size:inherit"></div><br></div><div><br></div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2026=EB=85=84 1=EC=9B=94 =
8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 3:38, Mike Dolan &lt;<a href=3D"m=
ailto:manager@lfprojects.org" target=3D"_blank">manager@lfprojects.org</a>&=
gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div di=
r=3D"ltr">Hi Soo-yeon, the OpenBMC community requires contributors employed=
 at a company to have the company CCLA on file. I would recommend you get t=
he company CCLA approval first.=C2=A0</div><div dir=3D"ltr"><div><br></div>=
<div>Mike</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 6, 2026 at 10:06=E2=80=AFPM Soo-yeon Kang &lt;<=
a href=3D"mailto:ksypassion@gmail.com" target=3D"_blank">ksypassion@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr">Hello,<br><br>=
I am currently contributing as an individual to get started with OpenBMC <b=
r>development. However, I work at XSLab (<a href=3D"https://xslab.co.kr" ta=
rget=3D"_blank">https://xslab.co.kr</a>) as an embedded <br>software develo=
per, and we are planning to have our company sign a <br>Corporate CLA in th=
e future.<br><br>For now, could you please process my Individual CLA so I c=
an begin <br>contributing immediately? We will follow up with a Corporate C=
LA later <br>once the company completes the necessary approvals.<br><br>Is =
this approach acceptable?<br><br>Thank you.<div>Best Regards</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2026=EB=
=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan &lt;<a href=3D=
"mailto:manager@lfprojects.org" target=3D"_blank">manager@lfprojects.org</a=
>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div =
dir=3D"ltr">Hi=C2=A0Soo-yeon, which company are you contributing on behalf =
of?<div><br></div><div>Mike</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo=
-yeon Kang &lt;<a href=3D"mailto:ksypassion@gmail.com" target=3D"_blank">ks=
ypassion@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr=
"><div>Hello,</div><div><br>I am resubmitting my Individual Contributor Lic=
ense Agreement for OpenBMC.<br><br>I originally submitted my CLA on Decembe=
r 7, 2022, but it appears it was not processed in the system.</div><div>I a=
m currently unable to contribute to OpenBMC repositories due to &quot;User =
not approved&quot; status.<br><br>I am attaching a newly signed CLA documen=
t with this email.</div><div>(Attached file:=C2=A0OpenBMC_ICLA_ksypassion.p=
df)<br>Please process this resubmission and confirm once it has been regist=
ered.</div><div><br>Details:<br></div><blockquote style=3D"margin:0px 0px 0=
px 40px;border:medium;padding:0px"><div>- Full Name: Soo-yeon Kang</div><di=
v>- Email: <a href=3D"mailto:ksypassion@gmail.com" target=3D"_blank">ksypas=
sion@gmail.com</a></div><div>- GitHub Username: ksypassion</div><div>- Gerr=
it Username: ksypassion</div></blockquote><div><br>Please let me know once =
my CLA has been processed.</div><div><br>Thank you.<br><br></div><div><br><=
/div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><b=
r style=3D"color:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><br sty=
le=3D"color:rgb(51,51,51);font-family:Roboto"><table style=3D"border-collap=
se:collapse;border-spacing:0px;font-family:Roboto;color:rgb(51,51,51)"><tbo=
dy style=3D"font-family:Roboto"><tr style=3D"font-family:Roboto"><td colspa=
n=3D"2" style=3D"padding:0px 0px 2px;border-width:0px 0px 1px;border-bottom=
-style:solid;outline:currentcolor;font-family:Roboto;border-bottom-color:rg=
b(0,182,217)"><span style=3D"border-bottom-width:3px;border-bottom-style:so=
lid;padding:0px 0px 2px;font-family:Roboto;border-bottom-color:rgb(0,182,21=
7)"><span style=3D"font-family:arial;font-weight:bold">Soo-yeon =C2=A0Kang<=
/span>=C2=A0=C2=A0</span></td></tr><tr style=3D"font-family:Roboto"><td val=
ign=3D"top" style=3D"padding:7px 16px 0px 0px;border:0px;outline:currentcol=
or;font-family:Roboto"></td><td valign=3D"top" style=3D"padding:7px 0px 0px=
;border:0px;outline:currentcolor;font-family:Roboto"><div style=3D"margin:0=
px;padding:2px 0px 0px;border:0px;outline:currentcolor;font-family:Roboto">=
<div style=3D"margin:0px;padding:0px;border:0px;outline:currentcolor;font-f=
amily:Roboto"><span style=3D"font-family:arial;color:rgb(0,182,217)">Mobile=
:</span>=C2=A0<span style=3D"font-family:arial">+82 10 - 4067 - 8539</span>=
</div><div style=3D"margin:0px;padding:0px;border:0px;outline:currentcolor;=
font-family:Roboto"><span style=3D"font-family:arial;color:rgb(0,182,217)">=
E-mail:</span>=C2=A0<a href=3D"mailto:ksypassion@gmail.com" style=3D"outlin=
e:currentcolor;text-decoration:none;border:medium;font-family:arial;color:r=
gb(0,0,0)" target=3D"_blank">ksypassion@gmail.co</a>m</div></div></td></tr>=
</tbody></table><div style=3D"margin:0px;padding:0px;border-width:1px 0px 0=
px;border-top-style:solid;outline:currentcolor;font-family:arial;font-size:=
small;border-top-color:rgb(208,208,208);color:rgb(51,51,51)"><br></div></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div></div>
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
pan style=3D"border-bottom-width:3px;border-bottom-style:solid;padding:0px =
0px 2px;font-family:Roboto;border-bottom-color:rgb(0,182,217)"><span style=
=3D"font-family:arial;font-weight:bold">Soo-yeon =C2=A0Kang</span>=C2=A0=C2=
=A0</span></td></tr><tr style=3D"font-family:Roboto"><td valign=3D"top" sty=
le=3D"padding:7px 16px 0px 0px;border:0px;outline:currentcolor;font-family:=
Roboto"></td><td valign=3D"top" style=3D"padding:7px 0px 0px;border:0px;out=
line:currentcolor;font-family:Roboto"><div style=3D"margin:0px;padding:2px =
0px 0px;border:0px;outline:currentcolor;font-family:Roboto"><div style=3D"m=
argin:0px;padding:0px;border:0px;outline:currentcolor;font-family:Roboto"><=
span style=3D"font-family:arial;color:rgb(0,182,217)">Mobile:</span>=C2=A0<=
span style=3D"font-family:arial">+82 10 - 4067 - 8539</span></div><div styl=
e=3D"margin:0px;padding:0px;border:0px;outline:currentcolor;font-family:Rob=
oto"><span style=3D"font-family:arial;color:rgb(0,182,217)">E-mail:</span>=
=C2=A0<a href=3D"mailto:ksypassion@gmail.com" style=3D"outline:currentcolor=
;text-decoration:none;border:medium;font-family:arial;color:rgb(0,0,0)" tar=
get=3D"_blank">ksypassion@gmail.co</a>m</div></div></td></tr></tbody></tabl=
e><div style=3D"margin:0px;padding:0px;border-width:1px 0px 0px;border-top-=
style:solid;outline:currentcolor;font-family:arial;font-size:small;border-t=
op-color:rgb(208,208,208);color:rgb(51,51,51)"><br></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>
</blockquote></div></div>

--000000000000452abc0647d3e78f--

