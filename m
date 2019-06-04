Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6535051
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 21:36:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JMbw4pQ3zDqVB
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 05:36:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fOxCeS5e"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JMbD6c2WzDqVB
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 05:35:35 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id s7so10952794iob.11
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2019 12:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySz1/lno9YEJUu6NXeCSm1didOB9h1YLxPA0W7fbKrA=;
 b=fOxCeS5eYxILAP+TmIbMknvl3Kc4toBqJZcEdizR8G0YQOjuY/vO7o4FvfCQbZmV97
 TBi0tbpL97qkRtM3xuIafqhGttQx73CbgDDGk++q/FAC+mfHYfK+g9+6i7LIe4S54R89
 i4Vth3xyFnV3nOsyBnlRjRkGLGSIgjlkN+//lM4pD1kan5PW2Kgql4gdwD7MrdLPoFcf
 U0ooBRY2M41dKWmwr8cPesaeqmlvX5asH+UOGABZ9UJonpkPSO7uVU4QaxaLgaNO3A4r
 wD0bOa4QnM9NeXSSXNDgyQDvp6rUxz5ojEmHz2FyTlviORvHRZRKW2LFqBy5xNAjh+l2
 YCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySz1/lno9YEJUu6NXeCSm1didOB9h1YLxPA0W7fbKrA=;
 b=fiNM3P9nFSJ6n+/yqyf8r4qoX2hxjlQnskFhv+jgMXsBd75wLHhjTG7lU+htVauvsc
 Yc0EC12u9XmjGcdgsJPP9y7p+8LrEN43sNT8EC5guQgWXMyYfOiH31X2pAG7/Bzdlm/g
 U4LNDSQV5v5fRRy3/tSpGws+XBNouIDglpNTig3uc20L9nA+M81WvNa2ijA4N5dZpFn8
 23mJYRc1Nr3SvfmOfpA+w12YJoujsi5ErZahcsaaHVhRo55aBHGe4rVpChbaAiwxseyI
 mTUGYi1xC2HkdqDDINjTKrb/t8CGPLdqKgm7lbTPWFJF8Wuq64twWokgAC6ydspga+aP
 rgEQ==
X-Gm-Message-State: APjAAAUA5ytDFSZMSRJermU9q4h01CD19NDx9feQWAWb64QobrWnnUBU
 qtHSyw7dduI+P4A6yd+RRJ0lV94C8VzsjWB9Ztvsww==
X-Google-Smtp-Source: APXvYqzKHD+orhM1D7L2hmnIm7t2pdrF6Gg2MzggLE4Hi0hkDhz7nY12yTYJbM+wtP/cFvurQTr8xfTufX4LGu6+rfg=
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr544788iok.52.1559676931476;
 Tue, 04 Jun 2019 12:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
In-Reply-To: <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 4 Jun 2019 12:35:05 -0700
Message-ID: <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
Subject: Re: Platform telemetry and health monitoring
To: srinivas k <srinuklge@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000777df1058a849581"
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

--000000000000777df1058a849581
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI: Srinivas, Neeraj, and I are finalizing a time slot for the kick off
meeting. We are thinking about a bi-weekly discussion.

Also, I'm drafting a version of BMC metrics collection daemon. The first
draft is up on https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257,
which we probably will go over during the meeting.

On Fri, May 24, 2019 at 1:46 PM srinivas k <srinuklge@gmail.com> wrote:

>
>
>
> On Tue, May 21, 2019 at 9:55 AM Kun Yi <kunyi@google.com> wrote:
>
>> I put my preferred time slots but seems like vishwa@'s timeslot has no
>> overlapping with mine.. Problem finding common time between PST/IST.
>>
>> On Tue, May 21, 2019 at 2:21 AM vishwa <vishwa@linux.vnet.ibm.com> wrote=
:
>>
>>> Neeraj,
>>>
>>> Please find my entry here.
>>>
>>> !! Vishwa !!
>>> On 5/21/19 1:54 AM, Neeraj Ladkani wrote:
>>>
>>> Hi All,
>>>
>>>
>>>
>>> As we discussed having a focused workstream for =E2=80=9C*Platform tele=
metry
>>> and health monitoring*=E2=80=9D in one of email thread, Please let me k=
now if
>>> you would like to join this work stream. It would be great to have
>>> participation from Silicon partners/ mainboard design and mfg partners/
>>> Memory/ NICs/ Firmware and other components.
>>>
>>>
>>>
>>> Name
>>>
>>> Preferred Timings
>>>
>>> Agenda / Contribution Areas
>>>
>>>  Vishwanatha Subbanna ( Vishwa )
>>>
>>>  6:00 PM - 7:00 PM IST ( +5:30 )
>>>
>>> Firmware --> BMC health, HW link monitoring from BMC, OCC sensors
>>>
>>>  Kun Yi
>>>
>>>  8AM-4PM PST
>>>
>>>  BMC health monitoring
>>>
>>>  Srini K
>>>
>>>  7PM PST ~ 10PM PST
>>>
>>>  BMC Health ,Sensors, Anything which group collectively assigns to me .
>>>
>>>
>>>
>>> Once we have enough quorum, we will put together bi-weekly call to
>>> brainstorm various ideas and proposals.
>>>
>>>
>>>
>>> Thanks
>>>
>>> Neeraj
>>>
>>>
>>>
>>>
>>
>> --
>> Regards,
>> Kun
>>
>

--=20
Regards,
Kun

--000000000000777df1058a849581
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: Srinivas, Neeraj, and I are finalizing a time slot fo=
r the kick off meeting. We are thinking about a bi-weekly discussion.<div><=
br></div><div>Also, I&#39;m drafting a version of BMC metrics collection da=
emon. The first draft is up on=C2=A0<a href=3D"https://gerrit.openbmc-proje=
ct.xyz/c/openbmc/docs/+/22257">https://gerrit.openbmc-project.xyz/c/openbmc=
/docs/+/22257</a>, which we probably will go over during the meeting.</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, May 24, 2019 at 1:46 PM srinivas k &lt;<a href=3D"mailto:srinuklge@=
gmail.com">srinuklge@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><=
div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 21, 2019 at 9:55 AM Kun Yi=
 &lt;<a href=3D"mailto:kunyi@google.com" target=3D"_blank">kunyi@google.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr">I put my preferred time slots but seems l=
ike vishwa@&#39;s timeslot has no overlapping with mine.. Problem finding c=
ommon time between PST/IST.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, May 21, 2019 at 2:21 AM vishwa &lt;<a hr=
ef=3D"mailto:vishwa@linux.vnet.ibm.com" target=3D"_blank">vishwa@linux.vnet=
.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Neeraj,</p>
    <p>Please find my entry here.</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gmai=
l-m_43099196090947732gmail-m_3307945314820574524moz-cite-prefix">On 5/21/19=
 1:54 AM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gm=
ail-m_43099196090947732gmail-m_3307945314820574524WordSection1">
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
        <table class=3D"gmail-m_560056566289008974gmail-m_79512420832809900=
57gmail-m_43099196090947732gmail-m_3307945314820574524MsoTableGrid" style=
=3D"border-collapse:collapse;border:none" cellspacing=3D"0" cellpadding=3D"=
0" border=3D"1">
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
 class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gmail-m_4309=
9196090947732gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div>=
</div></div>
</blockquote></div></div>
</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--000000000000777df1058a849581--
