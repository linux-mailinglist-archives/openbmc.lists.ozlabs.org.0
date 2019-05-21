Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1025638
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 18:55:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457hjC2YXrzDqHH
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 02:55:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xhi91yGv"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457hgl2T5lzDqNX
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 02:54:26 +1000 (AEST)
Received: by mail-it1-x12e.google.com with SMTP id i63so5798685ita.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RJtLAFWfkDeou2TtGcvoWdP/0xLUr8oqPKpPzQ5vDM=;
 b=Xhi91yGv0qSPpkimpKNV4wPZz1sIxkfckeTrvCcMAkH4F9CH69oKUzx5GM1RvfB9yf
 rFS8tOSlHGYDUt39AS5HzKdRDrx33YQpDcJHzDCMyVTEU+Fpuhu8E8tQfs5ljZFHIK58
 agAFCIGsmXmASKXuv9w13helqNuVdbbJb210NYvxvdCP29HAGbhiEPBkv2uO7PR7Clr8
 v3Ap5xmDdghtfkIM4BEYSIH9ZqxrV0wo/s58TJVEpVT344QoS2K9wjFP24VJQHJfqhwl
 MMnhVybMv+wNrrCZMABN6fEAtOZMKEKAFhAbFFdrlnWfzGRb2Ub85XX+ndb3KFczlaR2
 CKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RJtLAFWfkDeou2TtGcvoWdP/0xLUr8oqPKpPzQ5vDM=;
 b=Q48lbw37VjseczGzInR/9WT5TdIs7FhT9zmKhpWNu0Nvp0wSfz4ykS0E8icd91JSYF
 GxVvyNE5ZOMR0osvVw1QgrEKLKaRbnB/eJ4CVFWK7nsZhx/ICgEjRNiHQKVBBX3gaOmG
 4cgi4O8Egyb7H2PlmP4Pza1opqYYguVARDLZRbeukxC3epIpTwNcSDwt0LhMMjNsTygS
 8xMVryxUrlJ117CpaF5NoR7WO41y+sofcpGrFSUSW3TFgrcNn0Cv5NEXJxL8RcS4ADzd
 y/XcrFfaIKKBrWby/2dW53Ca788Feg4/CFFmVpjUyBOKKN9O/0IgZlZTHsmBcx2Y7s+H
 7kyg==
X-Gm-Message-State: APjAAAWIAy4F+MawGSn84J2oJ8AxUVgCnnoi2DrnNUHu/1UBlz8dwgt9
 Wm7xuk8/cmeNvx6TItw43ovIxhHHEwHUtBB5myTkXg==
X-Google-Smtp-Source: APXvYqwx9k4kDw/rG/9inMT8XneR5gT6feimncdbwgYSgSojdug5Ipp4RdSZAOkIKBaAA3gJcaayCDIfojWkzny3b/A=
X-Received: by 2002:a24:27c6:: with SMTP id g189mr4589113ita.114.1558457661584; 
 Tue, 21 May 2019 09:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
In-Reply-To: <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 21 May 2019 09:53:55 -0700
Message-ID: <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
Subject: Re: Platform telemetry and health monitoring
To: vishwa <vishwa@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000051cdb0058968b368"
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

--00000000000051cdb0058968b368
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I put my preferred time slots but seems like vishwa@'s timeslot has no
overlapping with mine.. Problem finding common time between PST/IST.

On Tue, May 21, 2019 at 2:21 AM vishwa <vishwa@linux.vnet.ibm.com> wrote:

> Neeraj,
>
> Please find my entry here.
>
> !! Vishwa !!
> On 5/21/19 1:54 AM, Neeraj Ladkani wrote:
>
> Hi All,
>
>
>
> As we discussed having a focused workstream for =E2=80=9C*Platform teleme=
try and
> health monitoring*=E2=80=9D in one of email thread, Please let me know if=
 you
> would like to join this work stream. It would be great to have
> participation from Silicon partners/ mainboard design and mfg partners/
> Memory/ NICs/ Firmware and other components.
>
>
>
> Name
>
> Preferred Timings
>
> Agenda / Contribution Areas
>
>  Vishwanatha Subbanna ( Vishwa )
>
>  6:00 PM - 7:00 PM IST ( +5:30 )
>
> Firmware --> BMC health, HW link monitoring from BMC, OCC sensors
>
>  Kun Yi
>
>  8AM-4PM PST
>
>  BMC health monitoring
>
>
>
>
>
>
>
>
>
> Once we have enough quorum, we will put together bi-weekly call to
> brainstorm various ideas and proposals.
>
>
>
> Thanks
>
> Neeraj
>
>
>
>

--=20
Regards,
Kun

--00000000000051cdb0058968b368
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I put my preferred time slots but seems l=
ike vishwa@&#39;s timeslot has no overlapping with mine.. Problem finding c=
ommon time between PST/IST.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, May 21, 2019 at 2:21 AM vishwa &lt;<a hr=
ef=3D"mailto:vishwa@linux.vnet.ibm.com">vishwa@linux.vnet.ibm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Neeraj,</p>
    <p>Please find my entry here.</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class=3D"gmail-m_3307945314820574524moz-cite-prefix">On 5/21/19 1:=
54 AM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div class=3D"gmail-m_3307945314820574524WordSection1">
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
        <table class=3D"gmail-m_3307945314820574524MsoTableGrid" style=3D"b=
order-collapse:collapse;border:none" cellspacing=3D"0" cellpadding=3D"0" bo=
rder=3D"1">
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
><u></u>=C2=A0<u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0<u></u></span></p>
              </td>
              <td style=3D"width:155.85pt;border-top:none;border-left:none;=
border-bottom:1pt solid windowtext;border-right:1pt solid windowtext;paddin=
g:0in 5.4pt" width=3D"208" valign=3D"top">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(47,84,150)"=
><u></u>=C2=A0<u></u></span></p>
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
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv></div>

--00000000000051cdb0058968b368--
