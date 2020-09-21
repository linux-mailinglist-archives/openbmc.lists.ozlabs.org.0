Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2C2734DC
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 23:26:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwHYX08Q1zDqxL
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 07:26:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-oo1-xc29.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=epCbJEZv; dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwHX43wW4zDqw2
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 07:24:51 +1000 (AEST)
Received: by mail-oo1-xc29.google.com with SMTP id t3so3617083ook.8
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 14:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vPuItieGAYWuapdpS93Nu/ZCR5BSxtO0cJkgF/CL3to=;
 b=epCbJEZvKuACy1kMUYREXsMqW0INZOyOMydnu3NNZbPnhGeqzBlAXsYoLMht/Mi93G
 risEJ7au9/Etujt+Uh/v96dJv/bAMOr0M/IoLQnEchsDPXS6yS+JmJ3urqR53sTW8v/Y
 b4EkMVT3xhfhXwl0SNlPYlxx8jEXUxbkHRblVFHgPCbibgw9ooyCIcoUJG1s3s2W6erK
 Rq8MtO3yfZ3ujKeChUw1xKkGj+X06fHqAGcCQ7FixwnEQkX0sURZwIGsju/HCTUaHXjt
 q/j7tjntN89yiGPknXLYL2ikj1wG9W3esOEa4Q8yZngiwabmG1wrEawSHjP3hVleudkQ
 QiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vPuItieGAYWuapdpS93Nu/ZCR5BSxtO0cJkgF/CL3to=;
 b=Y4zRPLWdGlCxvq6bWGXyZhnwZAafSmH6VQJ7nC3GPwPX4rAcI9P3fYv6VM3XBFLPR5
 w9dzZ7Cvg8n4krjvNn2X0cb8gKUoi32ZAin7xD5uGlR0Pm56FLT3NWQ4Tr5PJ4l/TlsB
 VdQ7wkZhEjjlxecTJeApy17pZHm8LVIHOFD9CHAS5PkFOyDufV2j2gV0Im+leEUih+G+
 O6GKn5i6clM6okU/jsYSOnApRxeA0Y7tdoBbAPMyfEHPofz+dqTAblFUGS7G942guU9p
 mubggMEf7NN1h1G6ud4hvVH/nCcNhDCYUAHUD19iFrbmKVtsQrsK/dbzZpZlctyTAjk3
 bi7A==
X-Gm-Message-State: AOAM5313CclK5jEfSS5cmq6wzBwb72A7mV3Zy/i0+c7ivNUmpOFtaIec
 cNK/WniCNpNPCR7XQZmrYu80ZjLYzbyML7BjgqZrL6QVhf+Uyg==
X-Google-Smtp-Source: ABdhPJzixNdzJRAeaOlixamz2JUHTgwdJ+UdB2kx3YxImDPHdpzmh0FoBwDlFKLieWnCsmve5qDE8qv3zz8jPklPPag=
X-Received: by 2002:a4a:a787:: with SMTP id l7mr871507oom.63.1600723487712;
 Mon, 21 Sep 2020 14:24:47 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Mon, 21 Sep 2020 14:24:36 -0700
Message-ID: <CAMXw96PQr-aY_9Q_VQ_=ts=STUKa=MzJTh4OzJLzSKpBoH4wXQ@mail.gmail.com>
Subject: Question about Diagnostic Data support in LogService / LogEntry
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000deb9a405afd97a97"
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

--000000000000deb9a405afd97a97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

In the 2020.3 schema, a new action CollectDiagnosticData has been added
to LogService. On page 7 in the proposal doc
<https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_P=
roposal_05-2020-WIP_0.pdf>
the
highlighted parts in the json example seem contradictory.
<https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_P=
roposal_05-2020-WIP_0.pdf>

{
    "@odata.id": "/redfish/v1/Systems/system/LogServices/DiagnosticLog
/Entries",
    "@odata.type": "#LogEntryCollection.LogEntryCollection",
    "Description": "Collection of System Event Log Entries",
    "Members": [{
        "@odata.id": "/redfish/v1/Systems/system/LogServices/EventLog
/Entries/111",
        "@odata.type": "#LogEntry.v1_4_0.LogEntry",
        "Created": "2020-01-01T14:44:00Z",
        =E2=80=9CEntryType=E2=80=9D: =E2=80=9CEvent=E2=80=9D,
        "DiagnosticDataType": "PreOS",
        "Id": "111",
        "Message": "User initiated dump",
        =E2=80=9CMessageId=E2=80=9D: =E2=80=9CDiagnostics.1.0.UserInitiated=
DiagnosticDump=E2=80=9D,
        "Name": "System Event Log Entry",
        =E2=80=9CAdditionalDataUri": "/redfish/v1/Systems/system/LogService=
s/
EventLog/attachement/111",
        =E2=80=9CAddionalDataSizeBytes": 1048576
    }],
    "Members@odata.count": 1,
    "Name": "System Event Log Entries"
}

I have a few questions about the expected behavior:

   1. Should the Diagnostic entries be under the same URL? (i.e. should the
   highlighted parts all be EventLog?)
   2. How is the Entry associated with the AdditionalDataURI when creating
   the entries collection?
   3. How should the web service keep track of the association?


Thanks,
Zhenfei

--000000000000deb9a405afd97a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>In the 2020.3 schema, a new action=
=C2=A0CollectDiagnosticData has been added to=C2=A0LogService. On page 7 in=
 the <a href=3D"https://www.dmtf.org/sites/default/files/Redfish_Diagnostic=
_Data_Logging_Proposal_05-2020-WIP_0.pdf">proposal doc</a>=C2=A0the highlig=
hted parts in the json example seem contradictory.<a href=3D"https://www.dm=
tf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020=
-WIP_0.pdf"></a></div><div><br></div><div>{<br>=C2=A0 =C2=A0 &quot;@<a href=
=3D"http://odata.id">odata.id</a>&quot;: &quot;/redfish/v1/Systems/system/L=
ogServices/<span style=3D"background-color:rgb(255,255,0)">DiagnosticLog</s=
pan>/Entries&quot;,<br>=C2=A0 =C2=A0 &quot;@odata.type&quot;: &quot;#LogEnt=
ryCollection.LogEntryCollection&quot;,<br>=C2=A0 =C2=A0 &quot;Description&q=
uot;: &quot;Collection of System Event Log Entries&quot;,<br>=C2=A0 =C2=A0 =
&quot;Members&quot;: [{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;@<a href=3D"ht=
tp://odata.id">odata.id</a>&quot;: &quot;/redfish/v1/Systems/system/LogServ=
ices/<span style=3D"background-color:rgb(255,255,0)">EventLog</span>/Entrie=
s/111&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;@odata.type&quot;: &quot;=
#LogEntry.v1_4_0.LogEntry&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Creat=
ed&quot;: &quot;2020-01-01T14:44:00Z&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=E2=80=9CEntryType=E2=80=9D: =E2=80=9CEvent=E2=80=9D,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;DiagnosticDataType&quot;: &quot;PreOS&quot;,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Id&quot;: &quot;111&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;Message&quot;: &quot;User initiated dump&quot;,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =E2=80=9CMessageId=E2=80=9D: =E2=80=9CDiagnostics.1.0.Use=
rInitiatedDiagnosticDump=E2=80=9D,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Nam=
e&quot;: &quot;System Event Log Entry&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =E2=80=9CAdditionalDataUri&quot;: &quot;/redfish/v1/Systems/system/LogServ=
ices/<span style=3D"background-color:rgb(255,255,0)">EventLog</span>/attach=
ement/111&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=9CAddionalDataSizeBy=
tes&quot;: 1048576<br>=C2=A0 =C2=A0 }],<br>=C2=A0 =C2=A0 &quot;Members@odat=
a.count&quot;: 1,<br>=C2=A0 =C2=A0 &quot;Name&quot;: &quot;System Event Log=
 Entries&quot;<br>}<br></div><div><br></div><div>I have a few questions abo=
ut the expected behavior:</div><div><ol><li>Should the Diagnostic entries b=
e under the same URL? (i.e. should the highlighted parts all be EventLog?)<=
/li><li>How is the Entry associated with the AdditionalDataURI when creatin=
g the entries collection?=C2=A0</li><li>How should the web service keep tra=
ck of the association?</li></ol></div><div><br></div><div>Thanks,</div><div=
>Zhenfei</div></div>

--000000000000deb9a405afd97a97--
