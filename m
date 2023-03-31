Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A042D6D269B
	for <lists+openbmc@lfdr.de>; Fri, 31 Mar 2023 19:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp6f43L9xz3fWL
	for <lists+openbmc@lfdr.de>; Sat,  1 Apr 2023 04:26:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IRkPg0IH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=satishroyal4u@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IRkPg0IH;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp6dS3Qlrz3cFt
	for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2023 04:26:03 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id m2so23188639wrh.6
        for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2023 10:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680283557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vk6e3aGzKfkpbfyJj0EpUDLZiHkUDg6z9pUs/cUWAGk=;
        b=IRkPg0IHDix4LHrokCN7eZzl9uvTv5cXh3v/jSgHEefZAnZJ2Sge1RqKNKsAEcD2l/
         lYFTmhXEGLdmcgCVbpw3mbWw/tZ93SQu3ViGGkodaTC2WhTg5vn2nNwB5yRztvylSakG
         x4r2RL3zm6idlyEAZxoRghy+cR3KZhslwGOGDOmrybWG3VFAP8fK8bnZAtfskejMts1B
         mtDUUIVh0smg79F6calj6NEI5s4jWC+e2Ge/CyeXTgnzhoJFb8soVs3lPvtcT0df3aCY
         R1pOorcUBOkeJYpkGqWlFuY2XrpkmfOXGiExE6nlOIGEh2gdDwGUmt5G2Ljd9HLYARPQ
         AWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680283557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vk6e3aGzKfkpbfyJj0EpUDLZiHkUDg6z9pUs/cUWAGk=;
        b=s4iw+P9Zy7+CqYxYrA528Tsn23qCAVndcQC1eWjJZ1YH5EzAI6GE4Kbocmh0VtRBWw
         oIFgt9ehaJqzC6UBJBqxVJhLZNK9NO8f+C4KCbB6MbBjN8lwflgtTfO81CQXdBbNGFeM
         D2gj5QnkDVaGVsHw+hg9j2AFtMPlvtrtqoLAiBWI6RMuGZiwG++AiQ2Ypl0pQ0ofJRu3
         SaWhC2TNDNMels9MCOg0f6sHXywlLXEuFCdhIK/ZQ5JHvNvdBSRkfFkFdcMROIUo18aJ
         3PuVkoFwEYVQ4subUt10M1TLOzz5XkZzGV0k93/fasGdIcuIhyapqiQgISt2GdUvE/iC
         R+rA==
X-Gm-Message-State: AAQBX9dh+j7Uisk8cXUCgb+405dS7BrRHsyWDCOSrK6ReouGcdj2ObXu
	RhpPoIsJYr/9mHmQmikPEjJx3b0x/MC+Mug6lkI=
X-Google-Smtp-Source: AKy350Zh5S9T054ENsCsGw4sBhoo1ruEGa/zAzDzsy1CRHm2sTq8275D5h+xc/ge0N43Hv4UTa6fBq8ux3xlw+UImlg=
X-Received: by 2002:a5d:6b88:0:b0:2ce:aeab:9b4 with SMTP id
 n8-20020a5d6b88000000b002ceaeab09b4mr4684965wrx.9.1680283557305; Fri, 31 Mar
 2023 10:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
 <20230328224413.GB18848@packtop> <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
In-Reply-To: <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
From: Satish Yaduvanshi <satishroyal4u@gmail.com>
Date: Fri, 31 Mar 2023 22:55:47 +0530
Message-ID: <CAGugOWv=XF9UHLcgcr-W5_3DE5+w3EaP4i0eHe-nbSFVgJqsHg@mail.gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="0000000000008e213e05f835809b"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008e213e05f835809b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For containerizing firmware, I do believe architecture matters. could
anyone of you  explain the OpenBMC firmware architecture briefly

On Wed, Mar 29, 2023 at 5:15=E2=80=AFPM Satish Yaduvanshi <satishroyal4u@gm=
ail.com>
wrote:

> Embedding a container in  OpenBMC may bring  many advantages such as
> portability, modularity, security and considerably speed up the applicati=
on
> development time.
>
> On Wed, Mar 29, 2023 at 4:14=E2=80=AFAM Zev Weiss <zweiss@equinix.com> wr=
ote:
>
>> On Tue, Mar 28, 2023 at 09:43:20AM PDT, Satish Yaduvanshi wrote:
>> >Hi,
>> >
>> >I would like to know is there any future plans to containerize the  app=
s
>> >and services of OpenBMC firmware
>> >
>> >Thanks,
>> >Satish Kumar
>>
>> I'm not aware of any efforts in that direction, no.  Is there a
>> particular benefit that would be achieved by doing so?
>>
>>
>> Zev
>>
>
>
> --
>
> Satish  Kumar G
>
>
>

--=20

Satish  Kumar G

--0000000000008e213e05f835809b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-ui-provider gmail-gq gmail-b gmail-c =
gmail-d gmail-e gmail-f gmail-g gmail-h gmail-i gmail-j gmail-k gmail-l gma=
il-m gmail-n gmail-o gmail-p gmail-q gmail-r gmail-s gmail-t gmail-u gmail-=
v gmail-w gmail-x gmail-y gmail-z gmail-ab gmail-ac gmail-ae gmail-af gmail=
-ag gmail-ah gmail-ai gmail-aj gmail-ak" dir=3D"ltr">For containerizing fir=
mware, I do believe architecture matters. could anyone of you=C2=A0 explain=
 the OpenBMC firmware architecture briefly</span><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29, 2023=
 at 5:15=E2=80=AFPM Satish Yaduvanshi &lt;<a href=3D"mailto:satishroyal4u@g=
mail.com">satishroyal4u@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span style=3D"color:rgb(=
44,45,49);font-family:Georgia,Times,&quot;Times New Roman&quot;,serif;font-=
size:17.6px">Embedding a container in=C2=A0 OpenBMC may bring=C2=A0 many ad=
vantages such as portability, modularity, security and considerably speed u=
p the application development time.</span><br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29, 2023 at 4:14=
=E2=80=AFAM Zev Weiss &lt;<a href=3D"mailto:zweiss@equinix.com" target=3D"_=
blank">zweiss@equinix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, Mar 28, 2023 at 09:43:20AM PDT, Satish Yad=
uvanshi wrote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;I would like to know is there any future plans to containerize the=C2=
=A0 apps<br>
&gt;and services of OpenBMC firmware<br>
&gt;<br>
&gt;Thanks,<br>
&gt;Satish Kumar<br>
<br>
I&#39;m not aware of any efforts in that direction, no.=C2=A0 Is there a<br=
>
particular benefit that would be achieved by doing so?<br>
<br>
<br>
Zev<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div><spa=
n style=3D"font-family:&quot;arial black&quot;,sans-serif;font-size:12.8px"=
>Satish =C2=A0Kumar G</span><br></div><div><font face=3D"arial black, sans-=
serif"><br></font></div><div><font face=3D"arial black, sans-serif"><br></f=
ont></div></div></div></div></div></div></div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div><span style=3D"font-=
family:&quot;arial black&quot;,sans-serif;font-size:12.8px">Satish =C2=A0Ku=
mar G</span><br></div><div><font face=3D"arial black, sans-serif"><br></fon=
t></div><div><font face=3D"arial black, sans-serif"><br></font></div></div>=
</div></div></div></div></div></div></div></div>

--0000000000008e213e05f835809b--
