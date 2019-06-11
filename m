Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6766F3C695
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 10:53:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NP0t51YHzDqZN
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 18:53:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="UbQxLS5C"; 
 dkim-atps=neutral
X-Greylist: delayed 70 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Jun 2019 18:52:22 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NNzp2xXRzDqVC
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 18:52:22 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7D89A41940
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1560243137; x=
 1562057538; bh=L71r+KwyehXb4ybWIP29pZNggUyFlR15kYYP6kMN9iY=; b=U
 bQxLS5Cv5Gmqx94SWhWfSj7rb+AnX4vzkQggXNAL/qeub3USgtBKTsDDgSZ5lFaN
 vQknvIDz1uOkaqiY7HJlmrIx/or7JGu2TMKkOSjAHeLIVToJVPdzJ6AU6iSr4sw+
 f59GtYHrTrcVL8/g/SJVw/hFWhWhDnIZkUwkPKSd3I=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6S-6pVJS1uA for <openbmc@lists.ozlabs.org>;
 Tue, 11 Jun 2019 11:52:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DC945418A4
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 11:52:17 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 11
 Jun 2019 11:52:17 +0300
Subject: Re: Platform telemetry and health monitoring
To: <openbmc@lists.ozlabs.org>
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
 <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <bec7e8de-5135-f680-c36f-ffc5e5de57d5@yadro.com>
Date: Tue, 11 Jun 2019 11:52:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5KVwVmSuNdqJKFApcgW8FOwu6cBtlCIVG"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--5KVwVmSuNdqJKFApcgW8FOwu6cBtlCIVG
Content-Type: multipart/mixed; boundary="aNKgnMBiJiHZb7UOVLC8HC0fxRjollIr3";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <bec7e8de-5135-f680-c36f-ffc5e5de57d5@yadro.com>
Subject: Re: Platform telemetry and health monitoring
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
 <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
In-Reply-To: <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>

--aNKgnMBiJiHZb7UOVLC8HC0fxRjollIr3
Content-Type: multipart/alternative;
 boundary="------------8409B5B05686AF38FE2E5FC3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8409B5B05686AF38FE2E5FC3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Will there be any meeting minutes?

With best regards,
Alexander Amelkin,
Leading BMC Software Engineer, YADRO
https://yadro.com

04.06.2019 22:35, Kun Yi wrote:
> FYI: Srinivas, Neeraj, and I are finalizing a time slot for the kick of=
f meeting. We are thinking about a bi-weekly discussion.
>
> Also, I'm drafting a version of BMC metrics collection daemon. The firs=
t draft is up on=C2=A0https://gerrit.openbmc-project.xyz/c/openbmc/docs/+=
/22257, which we probably will go over during the meeting.
>
> On Fri, May 24, 2019 at 1:46 PM srinivas k <srinuklge@gmail.com <mailto=
:srinuklge@gmail.com>> wrote:
>
>
>
>
>     On Tue, May 21, 2019 at 9:55 AM Kun Yi <kunyi@google.com <mailto:ku=
nyi@google.com>> wrote:
>
>         I put my preferred time slots but seems like vishwa@'s timeslot=
 has no overlapping with mine.. Problem finding common time between PST/I=
ST.
>
>         On Tue, May 21, 2019 at 2:21 AM vishwa <vishwa@linux.vnet.ibm.c=
om <mailto:vishwa@linux.vnet.ibm.com>> wrote:
>
>             Neeraj,
>
>             Please find my entry here.
>
>             !! Vishwa !!
>
>             On 5/21/19 1:54 AM, Neeraj Ladkani wrote:
>>
>>             Hi All,
>>
>>             =C2=A0
>>
>>             As we discussed having a focused workstream for =E2=80=9C/=
Platform telemetry and health monitoring/=E2=80=9D in one of email thread=
, Please let me know if you would like to join this work stream. It would=
 be great to have participation from Silicon partners/ mainboard design a=
nd mfg partners/ Memory/ NICs/ Firmware and other components.
>>
>>             =C2=A0
>>
>>             Name
>>
>>             =09
>>
>>             Preferred Timings
>>
>>             =09
>>
>>             Agenda / Contribution Areas
>>
>>             =C2=A0Vishwanatha Subbanna ( Vishwa )
>>
>>             =09
>>
>>             =C2=A06:00 PM - 7:00 PM IST ( +5:30 )
>>
>>             =09
>>
>>             Firmware --> BMC health, HW link monitoring from BMC, OCC =
sensors
>>
>>             =C2=A0Kun Yi
>>
>>             =09
>>
>>             =C2=A08AM-4PM PST
>>
>>             =09
>>
>>             =C2=A0BMC health monitoring
>>
>>             =C2=A0Srini K
>>
>>             =09
>>
>>             =C2=A07PM PST ~ 10PM PST
>>
>>             =09
>>
>>             =C2=A0BMC Health ,Sensors, Anything which group collective=
ly assigns to me .
>>
>>             =C2=A0
>>
>>             Once we have enough quorum, we will put together bi-weekly=
 call to brainstorm various ideas and proposals.
>>
>>             =C2=A0
>>
>>             Thanks
>>
>>             Neeraj
>>
>>             =C2=A0
>>
>
>
>         --=20
>         Regards,
>         Kun
>
>
>
> --=20
> Regards,
> Kun

--------------8409B5B05686AF38FE2E5FC3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Will there be any meeting minutes?</p>
    <pre class=3D"moz-signature" cols=3D"0">With best regards,
Alexander Amelkin,
Leading BMC Software Engineer, YADRO
<a class=3D"moz-txt-link-freetext" href=3D"https://yadro.com">https://yad=
ro.com</a></pre>
    <div class=3D"moz-cite-prefix">04.06.2019 22:35, Kun Yi wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmai=
l.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">FYI: Srinivas, Neeraj, and I are finalizing a time=

        slot for the kick off meeting. We are thinking about a bi-weekly
        discussion.
        <div><br>
        </div>
        <div>Also, I'm drafting a version of BMC metrics collection
          daemon. The first draft is up on=C2=A0<a
            href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/2=
2257"
            moz-do-not-send=3D"true">https://gerrit.openbmc-project.xyz/c=
/openbmc/docs/+/22257</a>,
          which we probably will go over during the meeting.</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 24, 2019 at 1:4=
6
          PM srinivas k &lt;<a href=3D"mailto:srinuklge@gmail.com"
            moz-do-not-send=3D"true">srinuklge@gmail.com</a>&gt; wrote:<b=
r>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=

          <div dir=3D"ltr">
            <div dir=3D"ltr"><br>
            </div>
            <div dir=3D"ltr">
              <div dir=3D"ltr"><br>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 21, 201=
9
                  at 9:55 AM Kun Yi &lt;<a
                    href=3D"mailto:kunyi@google.com" target=3D"_blank"
                    moz-do-not-send=3D"true">kunyi@google.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=

                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  <div dir=3D"ltr">
                    <div dir=3D"ltr">I put my preferred time slots but
                      seems like vishwa@'s timeslot has no overlapping
                      with mine.. Problem finding common time between
                      PST/IST.</div>
                    <br>
                    <div class=3D"gmail_quote">
                      <div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 2=
1,
                        2019 at 2:21 AM vishwa &lt;<a
                          href=3D"mailto:vishwa@linux.vnet.ibm.com"
                          target=3D"_blank" moz-do-not-send=3D"true">vish=
wa@linux.vnet.ibm.com</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
px
                        0px 0px 0.8ex;border-left:1px solid
                        rgb(204,204,204);padding-left:1ex">
                        <div bgcolor=3D"#FFFFFF">
                          <p>Neeraj,</p>
                          <p>Please find my entry here.</p>
                          <p>!! Vishwa !!<br>
                          </p>
                          <div
class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gmail-m_430=
99196090947732gmail-m_3307945314820574524moz-cite-prefix">On
                            5/21/19 1:54 AM, Neeraj Ladkani wrote:<br>
                          </div>
                          <blockquote type=3D"cite">
                            <div
class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gmail-m_430=
99196090947732gmail-m_3307945314820574524WordSection1">
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">Hi All, =
</span></p>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">=C2=A0</=
span></p>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">As we
                                  discussed having a focused workstream
                                  for =E2=80=9C<i>Platform telemetry and =
health
                                    monitoring</i>=E2=80=9D in one of ema=
il
                                  thread, Please let me know if you
                                  would like to join this work stream.
                                  It would be great to have
                                  participation from Silicon partners/
                                  mainboard design and mfg partners/
                                  Memory/ NICs/ Firmware and other
                                  components. </span></p>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">=C2=A0</=
span></p>
                              <table
class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gmail-m_430=
99196090947732gmail-m_3307945314820574524MsoTableGrid"
style=3D"border-collapse:collapse;border:none" cellspacing=3D"0"
                                cellpadding=3D"0" border=3D"1">
                                <tbody>
                                  <tr>
                                    <td style=3D"width:155.8pt;border:1pt=

                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
Name</span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;border-bottom:1pt
                                      solid
                                      windowtext;border-left:none;padding=
:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
Preferred
                                          Timings</span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;border-bottom:1pt
                                      solid
                                      windowtext;border-left:none;padding=
:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
Agenda
                                          / Contribution Areas</span></p>=

                                    </td>
                                  </tr>
                                  <tr>
                                    <td
                                      style=3D"width:155.8pt;border-right=
:1pt
                                      solid windowtext;border-bottom:1pt
                                      solid windowtext;border-left:1pt
                                      solid
                                      windowtext;border-top:none;padding:=
0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A0Vishwanatha
                                          Subbanna ( Vishwa )<br>
                                        </span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
none;border-left:none;border-bottom:1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A06:00
                                          PM - 7:00 PM IST ( +5:30 )<br>
                                        </span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
none;border-left:none;border-bottom:1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
Firmware
                                          --&gt; BMC health, HW link
                                          monitoring from BMC, OCC
                                          sensors<br>
                                        </span></p>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td
                                      style=3D"width:155.8pt;border-right=
:1pt
                                      solid windowtext;border-bottom:1pt
                                      solid windowtext;border-left:1pt
                                      solid
                                      windowtext;border-top:none;padding:=
0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A0Kun
                                          Yi</span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
none;border-left:none;border-bottom:1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A08AM-4PM
                                          PST</span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
none;border-left:none;border-bottom:1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A0BMC
                                          health monitoring</span></p>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td
                                      style=3D"width:155.8pt;border-right=
:1pt
                                      solid windowtext;border-bottom:1pt
                                      solid windowtext;border-left:1pt
                                      solid
                                      windowtext;border-top:none;padding:=
0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A0Srini
                                          K</span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
none;border-left:none;border-bottom:1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A07PM
                                          PST ~ 10PM PST</span></p>
                                    </td>
                                    <td
                                      style=3D"width:155.85pt;border-top:=
none;border-left:none;border-bottom:1pt
                                      solid windowtext;border-right:1pt
                                      solid windowtext;padding:0in
                                      5.4pt" width=3D"208" valign=3D"top"=
>
                                      <p class=3D"MsoNormal"><span
                                          style=3D"color:rgb(47,84,150)">=
=C2=A0BMC
                                          Health ,Sensors, Anything
                                          which group collectively
                                          assigns to me .</span></p>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">=C2=A0</=
span></p>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">Once we
                                  have enough quorum, we will put
                                  together bi-weekly call to brainstorm
                                  various ideas and proposals. </span></p=
>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">=C2=A0</=
span></p>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">Thanks <=
/span></p>
                              <p class=3D"MsoNormal"><span
                                  style=3D"color:rgb(47,84,150)">Neeraj</=
span></p>
                              <p class=3D"MsoNormal">=C2=A0</p>
                            </div>
                          </blockquote>
                        </div>
                      </blockquote>
                    </div>
                    <br clear=3D"all">
                    <div><br>
                    </div>
                    -- <br>
                    <div dir=3D"ltr"
class=3D"gmail-m_560056566289008974gmail-m_7951242083280990057gmail-m_430=
99196090947732gmail_signature">
                      <div dir=3D"ltr">Regards,
                        <div>Kun</div>
                      </div>
                    </div>
                  </div>
                </blockquote>
              </div>
            </div>
          </div>
        </blockquote>
      </div>
      <br clear=3D"all">
      <div><br>
      </div>
      -- <br>
      <div dir=3D"ltr" class=3D"gmail_signature">
        <div dir=3D"ltr">Regards,
          <div>Kun</div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------8409B5B05686AF38FE2E5FC3--

--aNKgnMBiJiHZb7UOVLC8HC0fxRjollIr3--

--5KVwVmSuNdqJKFApcgW8FOwu6cBtlCIVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJc/2vBAAoJEOiTWHtbdBeNcdMP/1JAVDYVs7CrWpUEKRC2PWjT
TCo6lVdvkJxGk4Wrfv2OKogtYYProeA1kZMDN98Ah/kIShexyyN1NUgnhrWs3HKu
aStV2E6/mTAWkn5WiU9Wxad4fDLVAYKP7LNKJAOB9yTKpwaIpN5xk/jNbo20vj9C
ELRhXwpxMOHvx+6c4TJfVqnOczKO1bfL1MQyJMYfY0YqKsYUL7UhuOMbnjQdfxf7
dXwTSRJQ/z59RjB86L8a2k+zbQOzXUhcoaItZ3IoCtn2JLgy/jDRTFjf2CKKPT9Q
+MtC/FLbO6CwEmSEl2be/tbFreU0PVGtmcA3AriB5vkUNs6by83/YPcPn3Xr8j58
Yj1T9xvS36oGndVaSCgO6ZBAmhzF/HSRfMC3RjSyoDBgY4RS6uqBk2dRmTNf08i+
pi+zWR/iGAciEITHAvZpTLj3CAm/NC38KVtuEuzhNWTxEgoDsTt0Pp08Z+X092yO
lcFf/TYOXW2jh2u6YOQ8JbLavzqpWht8XXJbPSWJHZqAeqRd0B2ADEwf5QZDle7f
Mwp3LN3vXLQcll6PFqeM4CcNqfbc6mHjS0JU0eluvhgHakcIjLY9L6Xmwgib2zjM
gabfGjyV9AA7ER5d5MJBiyO03mvTA2/nQJmcXbVnwtfFZX7NQeKw/feYL2cv23oP
a5EVs1T4Bd9QXkOk0hdW
=5L0r
-----END PGP SIGNATURE-----

--5KVwVmSuNdqJKFApcgW8FOwu6cBtlCIVG--
