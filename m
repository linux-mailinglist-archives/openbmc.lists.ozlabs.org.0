Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A335B2A00F
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 22:47:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459dj622c1zDqVn
	for <lists+openbmc@lfdr.de>; Sat, 25 May 2019 06:47:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e34; helo=mail-vs1-xe34.google.com;
 envelope-from=srinuklge@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kKBaG0AP"; 
 dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459dhb2Z3xzDqGg
 for <openbmc@lists.ozlabs.org>; Sat, 25 May 2019 06:46:52 +1000 (AEST)
Received: by mail-vs1-xe34.google.com with SMTP id w124so6726481vsb.11
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4TafJFb0/iM40H13FuxTtAv3cnnDD1tkW6EfBQo8lE=;
 b=kKBaG0APmxpmRsM4CWzJ+6O5/BH4WGmau3DFtgVLtncODbccP/jbmyoX9qDQw2785u
 V5s77i/Wr4KwZzTBgZ4WenwJAo+lUGkCSVCfMiMMFbC8IJNR7BWQY1Pogd7CikNzh5wU
 +6Wsv4tcD3Firs78JLgII/YLvyMYlta552yyj/1ph6J60F0nMOBv8klBRJw3c+zzvSe6
 ZlIpZwb3Ilpo83JE97OAQprbmJSBcFa9uKqd2AjwlBkQY+MAtaR47wwsgm157GTHkSoT
 Rv6oAaKWNgS+KkCkw5ZLsYNctjHPlIwbMQz01bR6HzOKHukAlfaP3hDq0KQvoPg/zOHE
 3DZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4TafJFb0/iM40H13FuxTtAv3cnnDD1tkW6EfBQo8lE=;
 b=NouLHZhHTEwn5DKPxllDm8Ks04aoXZuPm4VvOH2Um2Tr9m8JxX1JA6MxBvCvxKBEUQ
 gCiQMNZnWFuX1MZJ+BNTCQyVl3u74iJpGlB/gTkNIQu86SR838po7dbJaHHKIDGfBtGv
 rzbooIROcLfF8GgEqgR93qw4mDRiquhnt1vIdc9SBTOyZG0HN0VeeurUeOVlX7bh7lyT
 y16lRgKkvkPxHnqf9k2SZ2PNp2TjTHLGS8EALEF0PVCUQWUsndbQKhCh5ipcjvEYzQSQ
 GKl9RhfG3Pm9FOKB4fwd47SC8BWjUHfqBFNsaY5aEBvWl/jhkf5/l6uFHb+3VYOBDKrP
 a7zg==
X-Gm-Message-State: APjAAAXVxo+m2+DiP8sxz5+GoMxoHsX4oG0ahr5PLBKAvOsQg9YDuiqV
 FPOhlvwWJW2mhK+RyyWfuoPflMNbFNnS3OaPMtk=
X-Google-Smtp-Source: APXvYqxhs/vdl4+gIF4Xd7zPleSCsQV1tMdM0lK/D3YrUfYxsfyusvIlBjgHHn74t9p/ZKzxUL+EwCm+jrXyi/8hVZM=
X-Received: by 2002:a67:be18:: with SMTP id x24mr47312054vsq.66.1558730808215; 
 Fri, 24 May 2019 13:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
In-Reply-To: <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
From: srinivas k <srinuklge@gmail.com>
Date: Fri, 24 May 2019 13:46:37 -0700
Message-ID: <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
Subject: Re: Platform telemetry and health monitoring
To: Kun Yi <kunyi@google.com>
Content-Type: multipart/alternative; boundary="0000000000001fcaff0589a84c88"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001fcaff0589a84c88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 9:55 AM Kun Yi <kunyi@google.com> wrote:

> I put my preferred time slots but seems like vishwa@'s timeslot has no
> overlapping with mine.. Problem finding common time between PST/IST.
>
> On Tue, May 21, 2019 at 2:21 AM vishwa <vishwa@linux.vnet.ibm.com> wrote:
>
>> Neeraj,
>>
>> Please find my entry here.
>>
>> !! Vishwa !!
>> On 5/21/19 1:54 AM, Neeraj Ladkani wrote:
>>
>> Hi All,
>>
>>
>>
>> As we discussed having a focused workstream for =E2=80=9C*Platform telem=
etry and
>> health monitoring*=E2=80=9D in one of email thread, Please let me know i=
f you
>> would like to join this work stream. It would be great to have
>> participation from Silicon partners/ mainboard design and mfg partners/
>> Memory/ NICs/ Firmware and other components.
>>
>>
>>
>> Name
>>
>> Preferred Timings
>>
>> Agenda / Contribution Areas
>>
>>  Vishwanatha Subbanna ( Vishwa )
>>
>>  6:00 PM - 7:00 PM IST ( +5:30 )
>>
>> Firmware --> BMC health, HW link monitoring from BMC, OCC sensors
>>
>>  Kun Yi
>>
>>  8AM-4PM PST
>>
>>  BMC health monitoring
>>
>>  Srini K
>>
>>  7PM PST ~ 10PM PST
>>
>>  BMC Health ,Sensors, Anything which group collectively assigns to me .
>>
>>
>>
>> Once we have enough quorum, we will put together bi-weekly call to
>> brainstorm various ideas and proposals.
>>
>>
>>
>> Thanks
>>
>> Neeraj
>>
>>
>>
>>
>
> --
> Regards,
> Kun
>

--0000000000001fcaff0589a84c88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, May 21, 2019 at 9:55 AM Kun Yi &lt;<a href=3D"mailto:kunyi@g=
oogle.com" target=3D"_blank">kunyi@google.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"l=
tr">I put my preferred time slots but seems like vishwa@&#39;s timeslot has=
 no overlapping with mine.. Problem finding common time between PST/IST.</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, May 21, 2019 at 2:21 AM vishwa &lt;<a href=3D"mailto:vishwa@linux.vnet=
.ibm.com" target=3D"_blank">vishwa@linux.vnet.ibm.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Neeraj,</p>
    <p>Please find my entry here.</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class=3D"gmail-m_7951242083280990057gmail-m_43099196090947732gmail=
-m_3307945314820574524moz-cite-prefix">On 5/21/19 1:54 AM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div class=3D"gmail-m_7951242083280990057gmail-m_43099196090947732gma=
il-m_3307945314820574524WordSection1">
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)">Hi All,=
 <u></u><u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"><u></u>=
=C2=A0<u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)">As we d=
iscussed
            having a focused workstream for =E2=80=9C<i>Platform telemetry =
and
              health monitoring</i>=E2=80=9D in one of email thread, Please=
 let
            me know if you would like to join this work stream. It would
            be great to have participation from Silicon partners/
            mainboard design and mfg partners/ Memory/ NICs/ Firmware
            and other components.
            <u></u><u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"><u></u>=
=C2=A0<u></u></span></p>
        <table class=3D"gmail-m_7951242083280990057gmail-m_4309919609094773=
2gmail-m_3307945314820574524MsoTableGrid" style=3D"border-collapse:collapse=
;border:none" cellspacing=3D"0" cellpadding=3D"0" border=3D"1">
          <tbody>
            <tr>
              <td style=3D"width:155.8pt;border:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
>Name<u></u><u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:1pt solid windowtext;b=
order-right:1pt solid windowtext;border-bottom:1pt solid windowtext;border-=
left:none;padding:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
>Preferred
                    Timings<u></u><u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:1pt solid windowtext;b=
order-right:1pt solid windowtext;border-bottom:1pt solid windowtext;border-=
left:none;padding:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
>Agenda
                    / Contribution Areas<u></u><u></u></span></p>
              </td>
            </tr>
            <tr>
              <td style=3D"width:155.8pt;border-right:1pt solid windowtext;=
border-bottom:1pt solid windowtext;border-left:1pt solid windowtext;border-=
top:none;padding:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0Vishwanatha
                      Subbanna ( Vishwa )<br>
                    <u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A06:00
                      PM - 7:00 PM IST ( +5:30 )<br>
                    <u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>Firmware
                      --&gt; BMC health, HW link monitoring from BMC,
                      OCC sensors<br>
                    <u></u></span></p>
              </td>
            </tr>
            <tr>
              <td style=3D"width:155.8pt;border-right:1pt solid windowtext;=
border-bottom:1pt solid windowtext;border-left:1pt solid windowtext;border-=
top:none;padding:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0Kun Yi<u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A08AM-4PM PST<u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0BMC health monitoring<u></u></span></p>
              </td>
            </tr>
            <tr>
              <td style=3D"width:155.8pt;border-right:1pt solid windowtext;=
border-bottom:1pt solid windowtext;border-left:1pt solid windowtext;border-=
top:none;padding:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0Srini K<u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A07PM PST ~ 10PM PST<u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0BMC Health ,Sensors, Anything which group collectively assign=
s to me .<u></u></span></p>
              </td>
            </tr>
          </tbody>
        </table>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"><u></u>=
=C2=A0<u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)">Once we=
 have
            enough quorum, we will put together bi-weekly call to
            brainstorm various ideas and proposals.
            <u></u><u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"><u></u>=
=C2=A0<u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)">Thanks =
<u></u><u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)">Neeraj<=
u></u><u></u></span></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
      </div>
    </blockquote>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_7951242083280990057gmail-m_43099196090947732gmail_signatu=
re"><div dir=3D"ltr">Regards,<div>Kun</div></div></div></div>
</blockquote></div></div>
</div>

--0000000000001fcaff0589a84c88--
