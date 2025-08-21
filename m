Return-Path: <openbmc+bounces-499-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93EDB3014C
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 19:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c79f54hHBz30T9;
	Fri, 22 Aug 2025 03:43:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755798205;
	cv=none; b=iW/f7LaQ9BrSHuhVWqXYVW7x08eXJSHB0fHfGkM59JaUnBMQP9BVaKmGs8AqV4OadauIf+LO79qg09032HadXsuYJFLA7GT5UxxEC33iesvGTXhERPOHdqDdS6CIKQFa4NPngcyHahVvyBLrmUe50xR5ZSwO99/MIgk23frPqY4ImvYmRdO4FUoTHcci9lFcAKVFJ1Pmq7NtIcV2P+D4nFnxiIA7daMUpALV7nJeEXZNtsaJo/n1P0XW8kGZWB/nMZntwCx03GC8BeiafrhXdNgPvOdkFt+j0nRK/kxPR7aFOYvc3J/WGu0XiGiIdw7EIC5IBz+ITBpFov2Rgm8Reg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755798205; c=relaxed/relaxed;
	bh=e/f/mf3iwwzWhl4NcwgFelDcs3a2TdGpSO7rxikdGqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ST+iaLTjItb8XnsWiVAYTXWwod8mTu0Qd3kZrh61zPMIcDRUPGHx7YuNkxl7wmXkPHjHzI3iJdrDX/GoDjSw6Of6Q+u9T1QtMQaZ4u3UvZokTmHTTG3atL4Q7byCP3RUJiS6/7gmPoB1vL4fGVCSOSmJZwEt9ZzEI7ly34ZiLdlcakLCrmgkmU9aJsPXgifn4f8JBqciy+cRKw6cvO61gIZxOESHgtYWVIg3hXfLGmo357fLwf9BY4c+jZjfvX9p9n9jLrGDb1iwNfJ5PkdujE689vSLaODvWzyPityEsvrAqc3osqiOo1TTdJJeYfNNZV45JoGgt7xCiP7JihAdCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hw1nFtvS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=rushtotom@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hw1nFtvS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=rushtotom@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c79f35YWjz2xc8
	for <openbmc@lists.ozlabs.org>; Fri, 22 Aug 2025 03:43:22 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71d60150590so10747917b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Aug 2025 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755798199; x=1756402999; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/f/mf3iwwzWhl4NcwgFelDcs3a2TdGpSO7rxikdGqM=;
        b=Hw1nFtvSxPaf257qQzn8P3tpB54cKonO6iTsNCrKgCr7lBm06uVnzoKZ+tV9moO+4P
         M41S7quovhV/G5KG5dREQrfLgI6Se1zrBawX865zoxD4bt1wHyyu4yKLSJ9oKCLx8TP5
         7I2MfFvfJE+nl6NCu/+SkG4ngw9hlNwcduzBW3RUDgFsfTfgTcIewE4mQFH3vVrM0M1i
         CBon8SuuobY+LY0k9Hd4oyvpISdhCWDU7ekH2A6YnYNcL4ehR6DIoCk+bRdFMPTNouuZ
         LmS9cp8z5M0EKf9YocgP7ve62HI2fJDmiT7zeeoOijwIb7nT1ywE1Xu5SbPajH7NhAj8
         nGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755798199; x=1756402999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/f/mf3iwwzWhl4NcwgFelDcs3a2TdGpSO7rxikdGqM=;
        b=kpCpWEr8O507Wi65jWop71uDeBNgxDe7vK6qQLdM8qckrJYVKOlZ9/5WJupPy5numN
         v6AGgEWBdqTJjb6fi3Jr1lLufffbdLR/Ro5YVwoXxYpOR+Z9d0uqROxPd8mS0B6RsZuQ
         gXd1WLqa1cojv0Y9UK2vZKeqZiJv3wD6dvMdWGDMxJe6QK+rh6jOZYrnBFmiF9LnMl59
         VrZ1Z1UQHs3jpGrtgSy1v5oj0+tFjrUS801ZopYvl7CbJumNlaWUjG2ci2PHTcB61kI3
         jlOSptEZUWGRBfC2HqFqLalVM8GVcB28lOqQzqrz2Pu0UrFEcskpmFivuZwQ/+7yq5Ck
         ePbg==
X-Forwarded-Encrypted: i=1; AJvYcCUk3JG131/R7bfFhQmuJyWDdE8/Pp206IRILG3evdHrQFelvkDh6RlRC9h7lNm4SfYqb8iLkhGs@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzR/pliutn/CL7zKUrZ3I7ryTwaet/aJOtJBynf5YwEHW684kg4
	zYulGCnEhcbX4xS4/FKk+GDG0DLqjdUaxEk3Kylg2cdChwFXwPNNsSxG9rB3J+nDNcajmE3jGa3
	oGlSf/d34WJ7oJ0AgOosARVwiplV+hoM=
X-Gm-Gg: ASbGnct7GD84/qX98AWUlJc2isU5M4AYirdzWio4Oav8e2KfEctIR2thGjQ0QL9EBlQ
	+neXsDenFnx731Ug2jHGOVNf9o0YilMzfTX2BZ8HFY+eWOZ711hmod53NMEg0zS2pyD8H62ZiJO
	Whdq9a3CW/cDPl2OeGqbLfavibGAP7agvo7GuiCOqCPxISJzIAYlHxuCpvNfvoaXO9enyiVw2yX
	aD6KNmpcBgJofDL
X-Google-Smtp-Source: AGHT+IFHzEFTukDhsNeiu9GW2ZKvLFYKc3GCsvCmT5ddO7GfptBf8h90pDAIONZFrtcV1XNugvd26s34Fh6p2yl+d8s=
X-Received: by 2002:a05:690c:398:b0:71b:6703:b710 with SMTP id
 00721157ae682-71fdc3e8fa3mr617447b3.33.1755798199459; Thu, 21 Aug 2025
 10:43:19 -0700 (PDT)
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
 <CAK7Wosghi8vvq8Jh3bQA5m44OOAyB9wM7zCxhh2tTYJ0Ps+0vw@mail.gmail.com> <CAK7WosiKDAHu2NhFxvP8fYsrxBDRa2wt3JWnkZRu0G3i4_jr6w@mail.gmail.com>
In-Reply-To: <CAK7WosiKDAHu2NhFxvP8fYsrxBDRa2wt3JWnkZRu0G3i4_jr6w@mail.gmail.com>
From: Tom Joseph <rushtotom@gmail.com>
Date: Thu, 21 Aug 2025 23:13:07 +0530
X-Gm-Features: Ac12FXx5_HU5o7ydrYFADZ7NFAalp0W27-3PVIQkjKb93V39FLlWFdPRTa3DZX4
Message-ID: <CADCscQkAQPuca9P-76LyLibkuK_Y7fo0AdP7A7k_qzJmfObGag@mail.gmail.com>
Subject: Re: TOF elections for 2025H2
To: dhruvaraj S <dhruvaraj@gmail.com>
Cc: Marri Devender Rao <devenrao@in.ibm.com>, Patrick Williams <patrick@stwcx.xyz>, 
	OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f9e4b5063ce39f93"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000f9e4b5063ce39f93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I nominate Deepak Kodihalli

Regards,
Tom

On Thu, Aug 21, 2025 at 12:38=E2=80=AFPM dhruvaraj S <dhruvaraj@gmail.com> =
wrote:

> I withdraw my nomination
>
> --------------
> Dhruvaraj S
>
>
> On Thu, 21 Aug 2025 at 12:22=E2=80=AFPM, dhruvaraj S <dhruvaraj@gmail.com=
> wrote:
>
>> I nominate Jinu Joy
>>
>> --------------
>> Dhruvaraj S
>>
>>
>> On Thu, 21 Aug 2025 at 11:03=E2=80=AFAM, Marri Devender Rao <devenrao@in=
.ibm.com>
>> wrote:
>>
>>> I nominate Manoj
>>>
>>>
>>> ------------------------------
>>> *From:* Patrick Williams
>>> *Sent:* Wednesday, August 20, 2025 02:09
>>> *To:* OpenBMC List
>>> *Subject:* [EXTERNAL] Re: TOF elections for 2025H2
>>>
>>> On Mon, Aug 18, 2025 at 04:18:29PM -0400, Patrick Williams wrote:
>>> >     https://github.com/openbmc/tof-election/tree/main/2025H1
>>>
>>> Rohit mentioned that I had the wrong link.  Please use this one for the
>>> current eligible developers:
>>>
>>>     https://github.com/openbmc/tof-election/tree/main/2025H2
>>>
>>> --
>>> Patrick Williams
>>>
>>

--000000000000f9e4b5063ce39f93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I nominate Deepak Kodihalli</div><div><br></div><div>=
Regards,</div><div>Tom</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 21, 2025 at 12:38=
=E2=80=AFPM dhruvaraj S &lt;<a href=3D"mailto:dhruvaraj@gmail.com">dhruvara=
j@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto">I withdraw my nomination=C2=A0<br clear=3D"all=
"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature">-------=
-------<br>Dhruvaraj S</div></div></div><div><br></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Aug 2025 =
at 12:22=E2=80=AFPM, dhruvaraj S &lt;<a href=3D"mailto:dhruvaraj@gmail.com"=
 target=3D"_blank">dhruvaraj@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">I nominate Jinu Joy=
<br clear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_si=
gnature">--------------<br>Dhruvaraj S</div></div></div><div><br></div><div=
><br><div class=3D"gmail_quote"></div></div><div><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 21 Aug 2025 at 11:03=E2=80=
=AFAM, Marri Devender Rao &lt;<a href=3D"mailto:devenrao@in.ibm.com" target=
=3D"_blank">devenrao@in.ibm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I nominate Manoj</div>
<div id=3D"m_8201534244294044277m_-3706725643616888741m_-219702204272173352=
6appendonsend"></div>
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
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=3D"noopener noreferrer" id=3D"m_8201534=
244294044277m_-3706725643616888741m_-2197022042721733526OWAc7e9f1dc-d022-9f=
0a-5f5c-a04f15c458ee" href=3D"https://github.com/openbmc/tof-election/tree/=
main/2025H1" target=3D"_blank">
https://github.com/openbmc/tof-election/tree/main/2025H1</a><br>
<br>
Rohit mentioned that I had the wrong link.=C2=A0 Please use this one for th=
e<br>
current eligible developers:<br>
<br>
=C2=A0=C2=A0=C2=A0 <a rel=3D"noopener noreferrer" id=3D"m_82015342442940442=
77m_-3706725643616888741m_-2197022042721733526OWA137be655-b26e-713c-5ac3-c2=
0e56e5ad70" href=3D"https://github.com/openbmc/tof-election/tree/main/2025H=
2" target=3D"_blank">
https://github.com/openbmc/tof-election/tree/main/2025H2</a><br>
<br>
--<br>
Patrick Williams<br>
</div>
</div>

</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000f9e4b5063ce39f93--

