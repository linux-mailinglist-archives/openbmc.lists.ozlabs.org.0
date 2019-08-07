Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4984EAC
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 16:26:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Yhd3yZPzDqnW
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 00:26:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g9+IhkQo"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Ygl4bsRzDqf9
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 00:25:23 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id b7so54806226otl.11
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcuIzS3MP/PFqol0AfYPqIKc2Pb8DzaJVi72yf9wTlw=;
 b=g9+IhkQox4Tf033rBhcJHeIWQOh+Cx8WV4LM03y5R+q2XISOZSGgTh7GeJvUdMMjuJ
 9W98RzEQJ93Zn1SG4CQRMMi0ctLNtN/zISNP2LbfeDGfAVfhyju/u53Nh7/WkUixeeBF
 2NN4FUPmPaYVu4+9rHruHsFBBfwKNgRXw1KfRdm8F/Oix4PVRBrRc+4AibB1uxH7rh3W
 vg7HCiAUTelso7fQK6ujZdvjNpJle3JHeLhcss6g0XqrvFzjDHnsF1fyARiUaE7Y16qe
 wVmEgZpchvZVgVPIXrnJSV/6chdSzleCQS0vGtknO1axhf8dpYSrvC0Tf3mdxv8hhLoS
 hr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcuIzS3MP/PFqol0AfYPqIKc2Pb8DzaJVi72yf9wTlw=;
 b=TDHFTagb1+bWVTz5s3Dj9pUMExpVndHgR/RlQEGk4maAK6X54MAiAMIJ9yy1vc4h47
 cfD7oD95Lf1XKpvahGDx9zHY8zAqHOhEFyo/8jev82lvxeedi69tQWgnIww+2LXfZaXP
 g7qhuOauGcvblarhOFjESok20kR0ukGXGXr5RuIxWleePKDQEK1/ElNpI+ym9yjscDpS
 PNel9688nr+JPlAnUcHLSf2oC8ZeHnUYetFnznxIZwTknV0sVXNf+ewhxp4LL770iX/6
 u3fsbLYO5Ft4Lb75GlIWaE3NLSMC87ZHytiZgCMhqboRRLCB5g7JiIb6vKL7Dygqbduq
 tIlw==
X-Gm-Message-State: APjAAAWe9nBW4FDqG1384QJUbsWES7oTNzumeL7scRv+4ul5ga1XZaR6
 vJ2CWJghlXLUzG+/FQnU7peJ5YTQ4e/AJVkZXkJqjkpuolA=
X-Google-Smtp-Source: APXvYqxXvD3mWYDWtyWeG48hTloC9gWrzAyMyEs5pPQ/XZJiZxxNVodRLnEvuLkwPr+vXVr0hcXs/qAYQ91mZI6e6Ps=
X-Received: by 2002:a02:ce35:: with SMTP id v21mr10185620jar.108.1565187919159; 
 Wed, 07 Aug 2019 07:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR21MB1191FD5198A9311CFA234CC5C8D50@BYAPR21MB1191.namprd21.prod.outlook.com>
 <6654073d-b4ff-474a-c85f-3cdd24a02584@linux.vnet.ibm.com>
In-Reply-To: <6654073d-b4ff-474a-c85f-3cdd24a02584@linux.vnet.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Wed, 7 Aug 2019 07:25:06 -0700
Message-ID: <CAGMNF6XwDVhM-aocnfhouoBQXLJe-uU7_Uan9==x_aa04AhTQw@mail.gmail.com>
Subject: Re: Platform telemetry and health monitoring - PST AM
To: vishwa <vishwa@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000ef2935058f87b5c3"
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
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ef2935058f87b5c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Vishwa!

On Wed, Aug 7, 2019, 00:42 vishwa <vishwa@linux.vnet.ibm.com> wrote:

> I updated the wiki with the minutes from yesterday's discussion.
> !! Vishwa !!
>
> On 8/6/19 5:37 AM, Neeraj Ladkani wrote:
>
> Hello Everyone.
>
>
>
> This is a reminder for tomorrow=E2=80=99s OpenBMC platform telemetry work=
group
> meeting ( Tuesday 08/06 -  9:30 AM PST)
>
>
>
> Neeraj
>
>
>
> -----Original Appointment-----
> *From:* Neeraj Ladkani
> *Sent:* Tuesday, June 4, 2019 12:09 AM
> *To:* Neeraj Ladkani; openbmc@lists.ozlabs.org
> *Cc:* Joe P Mulholland; Luke Chen; Matt Chen/WYHQ/Wiwynn; Dong Wei;
> Jitendra_Kumar4@Dell.com; Reed B Frandsen; Michael Lim; Buddy Huang (=E9=
=BB=83=E5=A4=A9=E9=B4=BB);
> Tom Sand; Asmaa Mnebhi; Paul.Vancil@dell.com; Tanous, Ed; Christopher
> Bostic; James Morse; Vijay Khemka
> *Subject:* Platform telemetry and health monitoring - PST AM
> *When:* Tuesday, August 6, 2019 9:30 AM-10:30 AM (UTC-08:00) Pacific Time
> (US & Canada).
> *Where:* Microsoft Teams Meeting
>
>
>
>
> https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-mon=
itoring-Work-Group
>
>
>
>
>
>
>
>
>
> Join Microsoft Teams Meeting
> <https://teams.microsoft.com/l/meetup-join/19%3ameeting_MDU1NDM2Y2EtOTZkY=
y00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0?context=3D%7b%22Tid%22%3a%227=
2f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%22%3a%221c29c2f7-d386-4c5a-=
a3bc-0ee13b48bc65%22%7d>
>
> +1 323-849-4874 <+1%20323-849-4874,,73572842#>   United States, Los
> Angeles (Toll)
>
> (866) 679-9995 <(866)%20679-9995,,73572842#>   (Toll-free)
>
> Conference ID: 735 728 42#
>
> Local numbers
> <https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69aa517a91c5?=
id=3D73572842>
> | Reset PIN <https://mysettings.lync.com/pstnconferencing> | Learn more
> about Teams <https://go.microsoft.com/fwlink/?linkid=3D857250> | Meeting
> options
> <https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2f7-d386-=
4c5a-a3bc-0ee13b48bc65&tenantId=3D72f988bf-86f1-41af-91ab-2d7cd011db47&thre=
adId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy@thread.v=
2&messageId=3D0&language=3Den-US>
>
> Join with a video conferencing device
>
> 813878896@t.plcm.vc VTC Conference ID: 017920684
>
> Alternate VTC dialing instructions
> <https://dialin.plcm.vc/teams/?key=3D813878896&conf=3D017920684>
>
>
>
>

--000000000000ef2935058f87b5c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Vishwa!</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019, 00:42 vishwa &lt;<a hr=
ef=3D"mailto:vishwa@linux.vnet.ibm.com">vishwa@linux.vnet.ibm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>I updated the wiki with the minutes from yesterday&#39;s discussion.=
<br>
    </p>
    <div>!! Vishwa !!</div>
    <div><br>
    </div>
    <div>On 8/6/19 5:37 AM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
     =20
      <div>
        <p class=3D"MsoNormal"><span style=3D"color:#002060">Hello
            Everyone.
            <u></u><u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#002060"><u></u>=C2=A0<=
u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#002060">This is a
            reminder for tomorrow=E2=80=99s OpenBMC platform telemetry work=
group
            meeting ( Tuesday 08/06 - =C2=A09:30 AM PST)
            <u></u><u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#002060"><u></u>=C2=A0<=
u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#002060">Neeraj<u></u><=
u></u></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#002060"><u></u>=C2=A0<=
u></u></span></p>
        <div>
          <p class=3D"MsoNormal">-----Original Appointment-----<br>
            <b>From:</b> Neeraj Ladkani <br>
            <b>Sent:</b> Tuesday, June 4, 2019 12:09 AM<br>
            <b>To:</b> Neeraj Ladkani; <a href=3D"mailto:openbmc@lists.ozla=
bs.org" target=3D"_blank" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a><b=
r>
            <b>Cc:</b> Joe P Mulholland; Luke Chen; Matt
            Chen/WYHQ/Wiwynn; Dong Wei; <a href=3D"mailto:Jitendra_Kumar4@D=
ell.com" target=3D"_blank" rel=3D"noreferrer">Jitendra_Kumar4@Dell.com</a>;=
 Reed B
            Frandsen; Michael Lim; Buddy Huang (<span style=3D"font-family:=
&quot;Gulim&quot;,sans-serif" lang=3D"KO">=E9=BB=83=E5=A4=A9=E9=B4=BB</span=
>);
            Tom Sand; Asmaa Mnebhi; <a href=3D"mailto:Paul.Vancil@dell.com"=
 target=3D"_blank" rel=3D"noreferrer">Paul.Vancil@dell.com</a>; Tanous, Ed;
            Christopher Bostic; James Morse; Vijay Khemka<br>
            <b>Subject:</b> Platform telemetry and health monitoring -
            PST AM <br>
            <b>When:</b> Tuesday, August 6, 2019 9:30 AM-10:30 AM
            (UTC-08:00) Pacific Time (US &amp; Canada).<br>
            <b>Where:</b> Microsoft Teams Meeting<u></u><u></u></p>
        </div>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbm=
c/wiki/Platform-telemetry-and-health-monitoring-Work-Group" target=3D"_blan=
k" rel=3D"noreferrer">https://github.com/openbmc/openbmc/wiki/Platform-tele=
metry-and-health-monitoring-Work-Group</a><u></u><u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"MsoNormal"><span><a href=3D"https://teams.microsoft.com=
/l/meetup-join/19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQ=
y%40thread.v2/0?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd01=
1db47%22%2c%22Oid%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" targe=
t=3D"_blank" rel=3D"noreferrer"><span>Join Microsoft
                Teams Meeting</span></a> <u></u><u></u></span></p>
        <div>
          <div>
            <p class=3D"MsoNormal"><span><a href=3D"tel:+1%20323-849-4874,,=
73572842#" target=3D"_blank" rel=3D"noreferrer"><span style=3D"font-size:10=
.5pt;color:#6264a7;text-decoration:none">+1
                    323-849-4874</span></a>
              </span><span>=C2=A0 United States, Los
                Angeles (Toll)
              </span><span><u></u><u></u></span></p>
          </div>
          <div style=3D"margin-bottom:3.0pt">
            <p class=3D"MsoNormal"><span><a href=3D"tel:(866)%20679-9995,,7=
3572842#" target=3D"_blank" rel=3D"noreferrer"><span style=3D"font-size:10.=
5pt;color:#6264a7;text-decoration:none">(866)
                    679-9995</span></a>
              </span><span>=C2=A0 (Toll-free)
              </span><span><u></u><u></u></span></p>
          </div>
        </div>
        <div style=3D"margin-top:7.5pt;margin-bottom:15.0pt">
          <p class=3D"MsoNormal"><span>Conference ID:
            </span><span>735 728 42#
            </span><span><u></u><u></u></span></p>
        </div>
        <div style=3D"margin-bottom:.25in">
          <p class=3D"MsoNormal"><span><a href=3D"https://dialin.teams.micr=
osoft.com/8551f4c1-bea3-441a-8738-69aa517a91c5?id=3D73572842" target=3D"_bl=
ank" rel=3D"noreferrer"><span style=3D"font-size:9.0pt;color:#6264a7;text-d=
ecoration:none">Local
                  numbers</span></a> | <a href=3D"https://mysettings.lync.c=
om/pstnconferencing" target=3D"_blank" rel=3D"noreferrer">
                <span style=3D"font-size:9.0pt;color:#6264a7;text-decoratio=
n:none">Reset
                  PIN</span></a> |
              <a href=3D"https://go.microsoft.com/fwlink/?linkid=3D857250" =
target=3D"_blank" rel=3D"noreferrer"><span style=3D"font-size:9.0pt;color:#=
6264a7;text-decoration:none">Learn
                  more about Teams</span></a> |
              <a href=3D"https://teams.microsoft.com/meetingOptions/?organi=
zerId=3D1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-4=
1af-91ab-2d7cd011db47&amp;threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTk=
zMDctMjMxZDYyNzlhNjQy@thread.v2&amp;messageId=3D0&amp;language=3Den-US" tar=
get=3D"_blank" rel=3D"noreferrer">
                <span style=3D"font-size:9.0pt;color:#6264a7;text-decoratio=
n:none">Meeting
                  options</span></a>
              <u></u><u></u></span></p>
        </div>
        <div style=3D"margin-bottom:3.0pt">
          <p class=3D"MsoNormal"><span>Join with a video
              conferencing device
              <u></u><u></u></span></p>
        </div>
        <div style=3D"margin-bottom:3.0pt">
          <p class=3D"MsoNormal"><span><span><a href=3D"mailto:813878896@t.=
plcm.vc" target=3D"_blank" rel=3D"noreferrer">813878896@t.plcm.vc</a></span=
></span><span> VTC Conference ID:
              017920684 <u></u><u></u></span></p>
        </div>
        <div style=3D"margin-bottom:15.0pt">
          <p class=3D"MsoNormal"><span><a href=3D"https://dialin.plcm.vc/te=
ams/?key=3D813878896&amp;conf=3D017920684" target=3D"_blank" rel=3D"norefer=
rer"><span style=3D"color:#6264a7;text-decoration:none">Alternate
                  VTC dialing instructions</span></a>
              <u></u><u></u></span></p>
        </div>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000ef2935058f87b5c3--
