Return-Path: <openbmc+bounces-498-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE384B2EF10
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 09:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6vXd5zK0z30T8;
	Thu, 21 Aug 2025 17:07:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755760065;
	cv=none; b=C2hqKAhfTe9N/gCPxSvT8x5ONuVKYbJ5ozhgGGKwHijzQSXTvLc8HYMpStgRjf+JBPvDt7neTd54vV8Gsdz9bHqLk2OtB4peApTK+oK8RrpIQ8DOO3ei+D9lx1qBHWE+8bfQky/JcPrliYxpi1oDe7ZMvoe82tdWtOtA6FsXJIbzckKxz44ZK+ys+CN+IjMtKBwK9I76fSOMhrwqdK9ckqnBnP2DvHY/4iDE4tufRENgfih5DQOFOj0WivAuKaDkq2hGBBGOE6y+BLZXUEyLi99IGh11xIfV4Nr6RIUvgjQplgR1y8cSyTl5QAr/VpO7kwas1TNb0mM3F/V8AJe2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755760065; c=relaxed/relaxed;
	bh=D87bHEtCvUNMq2TloZ7wA58wLj+DOHTv60VkK2wLcoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVJ4INj+ugGbJfP2x+M4jvqX04D7NWGR1SauzbJc6uxv+3vdRrCveM5F7b2OTdS8kKp8tUu/ZzNTEqhesdbnhyPIzSm1R5BUAKYAfeVB+oLyHOtqSYjYcubz5eYaYmKncU+yLuRCkm2s095+Zai+EJqFCR7rB9/zSbYkExuQAq/XqILLQH5KuQXo4BUznPJQhE0QPTsnaii16cKGWmdUklIsGgVH9wx77EiE22bmeiR2X1ZOtL10aMIoYpoS6y7380GJg4Jxbkypp2thx2i9dPUVkg3E2WYvVXnXDQR5oedDq4VIt04dygj7mrNQbB3z2vElap3Wzd+vMJNPA+LPxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fai54K8D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fai54K8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6vXc6VL8z2xPy
	for <openbmc@lists.ozlabs.org>; Thu, 21 Aug 2025 17:07:44 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-71e6f84b77eso6069087b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 21 Aug 2025 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755760062; x=1756364862; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D87bHEtCvUNMq2TloZ7wA58wLj+DOHTv60VkK2wLcoc=;
        b=fai54K8DxD3qUhtIX6X1WM07ubX/wyYbOR4XPaf50/E49vChhjo2gp1mBk4H/ONjyT
         tz/NnvZWeBsDQVZ2TLP7dkS2Qi0dcdYyXQzWzPNMkmROTqn+S+Jsln33EaG2qC+HPvRk
         LvaCe1g5/QMw7DPlPXMP6nA6pV8rhxxsBHSF3kNtbNyk8YN0W8p6vzIg7NItYV/pW5Mt
         Ew/7IUcHCPNW+m1bGPSm9kOsOknnPe8GQ6LI4D6/3ozfKNHjUhBlvkOAp0mxHDB/sDjb
         7TKbpsgQ5lnoBPToB13/9uI3hkwlIbK1oHOuesG1rPmnxxpdZCYYTUtvKGe7GWyCaeN/
         J8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760062; x=1756364862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D87bHEtCvUNMq2TloZ7wA58wLj+DOHTv60VkK2wLcoc=;
        b=sYgukTq5AQuURh6NyYliJuYQHmhpizAphwZbZa078Y62QfFHfjRnqQsq1CAmk8KUjW
         o/n4o/d6k3JnpyN2dR/ZlFLwOGZjWtVFINQRNeuJIypa+4kHlAjCskRhQBc9iZFng+oi
         YhE2jT97P50fIwIro/Ek/AZ0k/pPR0Dm/rlvSu3q2pPqmpCoaTrxHKHl34Em4QIrPQT4
         4hZpF+ybbOs5Z2cH0pZO2SV/Rvzz/+jysTVpQJDAyHNO+m0RQ3dEYtdzcZizlSkBFnnC
         O6Ppq5UfqjxlBLHtyRQGi1mv5jUD1gUJmsjPgm50Rc6ZW4VgEgJ2wGIHvQfxU5ruRqY+
         YoRA==
X-Forwarded-Encrypted: i=1; AJvYcCUFn0XDOJLd+RXWCT1wAi+6hxlf04RmZVfmSJZa/WyXPMgflccT688/LScG9hh4mTrCBbEzGrZV@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMCTDhdyuKfilABgih/so6ci7W5yMXZO6zoeipTomGaOR+yefx
	ReAxavV2LbVEbIHmRcjv9cC/4PD4OGE4kb2wj3KY+Ao58vpSZHglp+Rh3E1uyn2/PNC2dtO8Z//
	/lEX5aKPxWues4n4egaHQL/3rYMSoYBQ=
X-Gm-Gg: ASbGncugmFaxG4d4Z/GECxNb/H6eECGfQHOaGh5KPMt7hiHPQMHAeBrCXP/55nDWm2G
	F7gNveXIgdMV77QGGgWs5q2I3vviutz/watMVHSSbNBGRLo2olX9yk+KWZUJF9fSAxjGbz1fMMR
	t+6znrNWhBE46Zh1PdDfwJ4c/DFoQA62SZ6UB4B6YoNS0RRNmKEPgmxnyhnjfAyMoU4tY6ggfXf
	g/sx1KvFUo/0aCm0lhk4Y9pth+8Hk8NTYAUtb4a+efXYG5SVQhL
X-Google-Smtp-Source: AGHT+IF5jyyXRN/gi34iilEtBPCFd3CThpTR+ezZb+//RuP3xRErKrGPuD6S1m4+5zDJrqt7/VxRRmKvHwH9+BZTg1E=
X-Received: by 2002:a05:690c:9688:b0:71a:413d:5668 with SMTP id
 00721157ae682-71fc8979d2amr20184217b3.11.1755760061793; Thu, 21 Aug 2025
 00:07:41 -0700 (PDT)
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
References: <aKOKlY97pOtfuaEv@heinlein> <aKThH-wUWmqyCisX@heinlein>
 <SJ0PR15MB446982270CCD58376C6A8BF1FA32A@SJ0PR15MB4469.namprd15.prod.outlook.com>
 <CAK7Wosghi8vvq8Jh3bQA5m44OOAyB9wM7zCxhh2tTYJ0Ps+0vw@mail.gmail.com>
In-Reply-To: <CAK7Wosghi8vvq8Jh3bQA5m44OOAyB9wM7zCxhh2tTYJ0Ps+0vw@mail.gmail.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 21 Aug 2025 12:37:30 +0530
X-Gm-Features: Ac12FXwWMcPKOXUFjRQJ2WIeX_rXqCb6LCP30C6QGcjyQ2ZycnPFNzy_LDh5LUU
Message-ID: <CAK7WosiKDAHu2NhFxvP8fYsrxBDRa2wt3JWnkZRu0G3i4_jr6w@mail.gmail.com>
Subject: Re: TOF elections for 2025H2
To: Marri Devender Rao <devenrao@in.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cb4adc063cdabe52"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000cb4adc063cdabe52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I withdraw my nomination

--------------
Dhruvaraj S


On Thu, 21 Aug 2025 at 12:22=E2=80=AFPM, dhruvaraj S <dhruvaraj@gmail.com> =
wrote:

> I nominate Jinu Joy
>
> --------------
> Dhruvaraj S
>
>
> On Thu, 21 Aug 2025 at 11:03=E2=80=AFAM, Marri Devender Rao <devenrao@in.=
ibm.com>
> wrote:
>
>> I nominate Manoj
>>
>>
>> ------------------------------
>> *From:* Patrick Williams
>> *Sent:* Wednesday, August 20, 2025 02:09
>> *To:* OpenBMC List
>> *Subject:* [EXTERNAL] Re: TOF elections for 2025H2
>>
>> On Mon, Aug 18, 2025 at 04:18:29PM -0400, Patrick Williams wrote:
>> >     https://github.com/openbmc/tof-election/tree/main/2025H1
>>
>> Rohit mentioned that I had the wrong link.  Please use this one for the
>> current eligible developers:
>>
>>     https://github.com/openbmc/tof-election/tree/main/2025H2
>>
>> --
>> Patrick Williams
>>
>

--000000000000cb4adc063cdabe52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I withdraw my nomination=C2=A0<br clear=3D"all"><br clear=
=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature">--------------<br>Dhruvaraj S</div></div></div><div><br></=
div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, 21 Aug 2025 at 12:22=E2=80=AFPM, dhruvaraj=
 S &lt;<a href=3D"mailto:dhruvaraj@gmail.com">dhruvaraj@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)"><div dir=3D"auto">I nominate Jinu Joy<br cl=
ear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">--------------<br>Dhruvaraj S</div></=
div></div><div><br></div><div><br><div class=3D"gmail_quote"></div></div><d=
iv><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 21 Aug 2025 at 11:03=E2=80=AFAM, Marri Devender Rao &lt;<a href=3D"mailto:=
devenrao@in.ibm.com" target=3D"_blank">devenrao@in.ibm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I nominate Manoj</div>
<div id=3D"m_-3706725643616888741m_-2197022042721733526appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">From:</b>=C2=A0=
Patrick Williams<br>
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">Sent:</b>=C2=A0=
Wednesday, August 20, 2025 02:09<br>
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">To:</b>=C2=A0Op=
enBMC List<br>
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">Subject:</b>=C2=
=A0[EXTERNAL] Re: TOF elections for 2025H2 </div></div><div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-size:11pt">On Mon, Aug 18, 2025 at 04:18:29PM -0400, Pat=
rick Williams wrote:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=3D"noopener noreferrer" id=3D"m_-370672=
5643616888741m_-2197022042721733526OWAc7e9f1dc-d022-9f0a-5f5c-a04f15c458ee"=
 href=3D"https://github.com/openbmc/tof-election/tree/main/2025H1" target=
=3D"_blank">
https://github.com/openbmc/tof-election/tree/main/2025H1</a><br>
<br>
Rohit mentioned that I had the wrong link.=C2=A0 Please use this one for th=
e<br>
current eligible developers:<br>
<br>
=C2=A0=C2=A0=C2=A0 <a rel=3D"noopener noreferrer" id=3D"m_-3706725643616888=
741m_-2197022042721733526OWA137be655-b26e-713c-5ac3-c20e56e5ad70" href=3D"h=
ttps://github.com/openbmc/tof-election/tree/main/2025H2" target=3D"_blank">
https://github.com/openbmc/tof-election/tree/main/2025H2</a><br>
<br>
--<br>
Patrick Williams<br>
</div>
</div>

</blockquote></div></div>
</blockquote></div></div>

--000000000000cb4adc063cdabe52--

