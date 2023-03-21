Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF56C36E9
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 17:27:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgxpF4kSDz3chs
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 03:27:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P/dWgqKh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=dhruvaraj@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P/dWgqKh;
	dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgxnf6drDz30Kr
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 03:26:46 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id hf2so14379829qtb.3
        for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679416002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N8RD46XtZCulfQqh0hRJXIgq9/Aoiju+h9YRnOvgnRE=;
        b=P/dWgqKhvVWSEWu4wBA/UTG9lImwsbWeYiRKv0oOxcDUE0nXXM/dOmEOt2kODf6zNh
         /bQ6n3/PWGqB/D00El6L7bW8eZ62cQRd3Fz9lqCZEkpKxKgLPib+BRcaFWH+8xaf9w66
         CiI81xu41swJVqflq4feg0hyA4Lcip9eePtSDoKO3Swwt18yPH/WpiYbwHSJiw3u9C5F
         uxAx47h20fxEGEV4EQRKElLXfWjjvwVYcprrXpuhLcxF03YidYOId0Je9rcBjl5qq8Ac
         UunYVwXE/VeADq7Di6I7Te1ebnu4oeXobpU1wy5dzYOK+f9xxSnfRmSIIyHkaO4Q47r9
         NemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679416002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8RD46XtZCulfQqh0hRJXIgq9/Aoiju+h9YRnOvgnRE=;
        b=uqqQTnJQqUcIi8uZVPZoQy8nYdumwQLPOCkyHKyyAElsor1wsdBTKdLrnuE0EVw57W
         sJwL0tQe7VIzlWfaDwq3SZGTJ9Du/PzsWm9KB03DJ07fuq9Nx27jJy16bnIDqBa40djM
         ZlKaJXIRIlf3OprwxhmSNkr9MBGnUsrWwqxdgTM4fDedCfdh9LLMshK38ZV3hZFYZRjD
         eZuGWE8Vay2HziQDpzdR9p3AFym1RbI3SaN4lBPnznkNuKXR+uSja0ANHQcZGzRyIUA8
         XnsiT/geLasuXkLZfSJc3Ge3ogiSCixS0f4QTEnw9H0s+cRDYJyJbOQU1IdWsuIo/CYo
         1PRw==
X-Gm-Message-State: AO0yUKUGLnEytbnZj0TU0z56Cv/t3HhwNCj5teoniMbFgoab0xkBdhPf
	Dxc/07NHJD0zoWhdV1lNQVbqJjlkNv0eb967oY8=
X-Google-Smtp-Source: AK7set8JMJjBFv3ftP9V4mHLX5vjG1IcuJfMHpM3o9EjI1Bafj0l7cyvyq3e6VCz47Fx3XNK2HdfV4SlJNgGVYeTo4w=
X-Received: by 2002:a05:622a:18aa:b0:3db:a6c5:cdc6 with SMTP id
 v42-20020a05622a18aa00b003dba6c5cdc6mr184276qtc.10.1679416002376; Tue, 21 Mar
 2023 09:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com> <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
In-Reply-To: <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Tue, 21 Mar 2023 21:56:30 +0530
Message-ID: <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
Subject: Re: [RFC] BMC RAS Feature
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Content-Type: multipart/alternative; boundary="0000000000004076e205f76b82c8"
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
Cc: Michael Shen <gpgpgp@google.com>, openbmc@lists.ozlabs.org, ed@tanous.net, bradleyb@fuzziesquirrel.com, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004076e205f76b82c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh <supreeth.venkatesh@amd.co=
m>
wrote:

>
> On 3/21/23 05:40, Patrick Williams wrote:
> > On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrote:
> >
> >> #### Alternatives Considered
> >>
> >> In-band mechanisms using System Management Mode (SMM) exists.
> >>
> >> However, out of band method to gather RAS data is processor specific.
> >>
> > How does this compare with existing implementations in
> > phosphor-debug-collector.
> Thanks for your feedback. See below.
> > I believe there was some attempt to extend
> > P-D-C previously to handle Intel's crashdump behavior.
> Intel's crashdump interface uses com.intel.crashdump.
> We have implemented com.amd.crashdump based on that reference. However,
> can this be made generic?
>
> PoC below:
>
> busctl tree com.amd.crashdump
>
> =E2=94=94=E2=94=80/com
>    =E2=94=94=E2=94=80/com/amd
>      =E2=94=94=E2=94=80/com/amd/crashdump
>        =E2=94=9C=E2=94=80/com/amd/crashdump/0
>        =E2=94=9C=E2=94=80/com/amd/crashdump/1
>        =E2=94=9C=E2=94=80/com/amd/crashdump/2
>        =E2=94=9C=E2=94=80/com/amd/crashdump/3
>        =E2=94=9C=E2=94=80/com/amd/crashdump/4
>        =E2=94=9C=E2=94=80/com/amd/crashdump/5
>        =E2=94=9C=E2=94=80/com/amd/crashdump/6
>        =E2=94=9C=E2=94=80/com/amd/crashdump/7
>        =E2=94=9C=E2=94=80/com/amd/crashdump/8
>        =E2=94=94=E2=94=80/com/amd/crashdump/9
>
> > The repository
> > currently handles IBM's processors, I think, or maybe that is covered b=
y
> > openpower-debug-collector.
> >
> > In any case, I think you should look at the existing D-Bus interfaces
> > (and associated Redfish implementation) of these repositories and
> > determine if you can use those approaches (or document why now).
> I could not find an existing D-Bus interface for RAS in
> xyz/openbmc_project/.
> It would be helpful if you could point me to it.
>

There is an interface for the dumps generated from the host, which can be
used for these kinds of dumps
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/op=
enbmc_project/Dump/Entry/System.interface.yaml

The fault log also provides similar dumps
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/op=
enbmc_project/Dump/Entry/FaultLog.interface.yaml


The tree for the dump manager looks like this
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/dump
      |-/xyz/openbmc_project/dump/bmc
      | `-/xyz/openbmc_project/dump/bmc/entry
      |   |-/xyz/openbmc_project/dump/bmc/entry/1
      |   |-/xyz/openbmc_project/dump/bmc/entry/2
      |   |-/xyz/openbmc_project/dump/bmc/entry/3
      |   `-/xyz/openbmc_project/dump/bmc/entry/4
      |-/xyz/openbmc_project/dump/faultlog
      |-/xyz/openbmc_project/dump/hardware
      |-/xyz/openbmc_project/dump/hostboot
      |-/xyz/openbmc_project/dump/internal
      | `-/xyz/openbmc_project/dump/internal/manager
      |-/xyz/openbmc_project/dump/resource
      |-/xyz/openbmc_project/dump/sbe
      `-/xyz/openbmc_project/dump/system

There are references to com.intel.crashdump in bmcweb code, but the
> interface itself does not exist in yaml/com/intel/
> we can add com.amd.crashdump as a start or even come up with a new
> generic Dbus interface.
> As far as Redfish implementation is concerned, we are following the
> specification.
> redfish/v1/Systems/system/LogServices/Crashdump schema is being used.
>
> {
>
> "@odata.id": "/redfish/v1/Systems/system/LogServices/Crashdump/Entries",
> "@odata.type": "#LogEntryCollection.LogEntryCollection",
> "Description": "Collection of Crashdump Entries",
> "Members":
>   [
> {"@odata.id":
> "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0",
> "@odata.type": "#LogEntry.v1_7_0.LogEntry",
> "AdditionalDataURI":
>
> "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0/ras-error0.cp=
er",
> "Created": "1970-1-1T0:4:12Z",
> "DiagnosticDataType": "OEM",
> "EntryType": "Oem",
> "Id": "0",
> "Name": "CPU Crashdump",
> "OEMDiagnosticDataType": "APMLCrashdump"
> },
> {"@odata.id":
> "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1",
> "@odata.type": "#LogEntry.v1_7_0.LogEntry",
> "AdditionalDataURI":
>
> "/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1/ras-error1.cp=
er",
> "Created": "1970-1-1T0:4:12Z",
> "DiagnosticDataType": "OEM",
> "EntryType": "Oem",
> "Id": "1",
> "Name": "CPU Crashdump",
> "OEMDiagnosticDataType": "APMLCrashdump"
> },
> ],
> "Members@odata.count": 2,
> "Name": "Open BMC Crashdump Entries"}
> >
>


--=20
--------------
Dhruvaraj S

--0000000000004076e205f76b82c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 Mar 2023 at 20:38, Supreet=
h Venkatesh &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com">supreeth.venk=
atesh@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
On 3/21/23 05:40, Patrick Williams wrote:<br>
&gt; On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrote:<br=
>
&gt;<br>
&gt;&gt; #### Alternatives Considered<br>
&gt;&gt;<br>
&gt;&gt; In-band mechanisms using System Management Mode (SMM) exists.<br>
&gt;&gt;<br>
&gt;&gt; However, out of band method to gather RAS data is processor specif=
ic.<br>
&gt;&gt;<br>
&gt; How does this compare with existing implementations in<br>
&gt; phosphor-debug-collector.<br>
Thanks for your feedback. See below.<br>
&gt; I believe there was some attempt to extend<br>
&gt; P-D-C previously to handle Intel&#39;s crashdump behavior.<br>
Intel&#39;s crashdump interface uses com.intel.crashdump.<br>
We have implemented com.amd.crashdump based on that reference. However, <br=
>
can this be made generic?<br>
<br>
PoC below:<br>
<br>
busctl tree com.amd.crashdump<br>
<br>
=E2=94=94=E2=94=80/com<br>
=C2=A0=C2=A0 =E2=94=94=E2=94=80/com/amd<br>
=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/com/amd/crashdump<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/0=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/1=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/2=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/3=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/4=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/5=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/6=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/7=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80/com/amd/crashdump/8=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80/com/amd/crashdump/9=
<br>
<br>
&gt; The repository<br>
&gt; currently handles IBM&#39;s processors, I think, or maybe that is cove=
red by<br>
&gt; openpower-debug-collector.<br>
&gt;<br>
&gt; In any case, I think you should look at the existing D-Bus interfaces<=
br>
&gt; (and associated Redfish implementation) of these repositories and<br>
&gt; determine if you can use those approaches (or document why now).<br>
I could not find an existing D-Bus interface for RAS in <br>
xyz/openbmc_project/.<br>
It would be helpful if you could point me to it.<br></blockquote><div><br><=
/div><div>There is an interface for the dumps generated from the host, whic=
h can be used for these kinds of dumps</div><div><a href=3D"https://github.=
com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/D=
ump/Entry/System.interface.yaml">https://github.com/openbmc/phosphor-dbus-i=
nterfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.=
yaml</a><br></div><div><br></div><div>The fault log also provides similar d=
umps</div><div><a href=3D"https://github.com/openbmc/phosphor-dbus-interfac=
es/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml"=
>https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/o=
penbmc_project/Dump/Entry/FaultLog.interface.yaml</a><br></div><div><br></d=
iv><div><br></div><div>The tree for the dump manager looks like this</div>`=
-/xyz<br>=C2=A0 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_proj=
ect/dump<br>=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/dump/bmc<br>=C2=A0 =
=C2=A0 =C2=A0 | `-/xyz/openbmc_project/dump/bmc/entry<br>=C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 |-/xyz/openbmc_project/dump/bmc/entry/1<br>=C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 |-/xyz/openbmc_project/dump/bmc/entry/2<br>=C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 |-/xyz/openbmc_project/dump/bmc/entry/3<br>=C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 `-/xyz/openbmc_project/dump/bmc/entry/4<br>=C2=A0 =C2=A0 =C2=
=A0 |-/xyz/openbmc_project/dump/faultlog<br>=C2=A0 =C2=A0 =C2=A0 |-/xyz/ope=
nbmc_project/dump/hardware<br>=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/d=
ump/hostboot<br>=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/dump/internal<b=
r>=C2=A0 =C2=A0 =C2=A0 | `-/xyz/openbmc_project/dump/internal/manager<br>=
=C2=A0 =C2=A0 =C2=A0 |-/xyz/openbmc_project/dump/resource<br>=C2=A0 =C2=A0 =
=C2=A0 |-/xyz/openbmc_project/dump/sbe<br><div>=C2=A0 =C2=A0 =C2=A0 `-/xyz/=
openbmc_project/dump/system=C2=A0</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
There are references to com.intel.crashdump in bmcweb code, but the <br>
interface itself does not exist in yaml/com/intel/<br>
we can add com.amd.crashdump as a start or even come up with a new <br>
generic Dbus interface.<br>
As far as Redfish implementation is concerned, we are following the <br>
specification.<br>
redfish/v1/Systems/system/LogServices/Crashdump schema is being used.<br>
<br>
{<br>
<br>
&quot;@<a href=3D"http://odata.id" rel=3D"noreferrer" target=3D"_blank">oda=
ta.id</a>&quot;: &quot;/redfish/v1/Systems/system/LogServices/Crashdump/Ent=
ries&quot;,<br>
&quot;@odata.type&quot;: &quot;#LogEntryCollection.LogEntryCollection&quot;=
,<br>
&quot;Description&quot;: &quot;Collection of Crashdump Entries&quot;,<br>
&quot;Members&quot;:<br>
=C2=A0=C2=A0[<br>
{&quot;@<a href=3D"http://odata.id" rel=3D"noreferrer" target=3D"_blank">od=
ata.id</a>&quot;: &quot;/redfish/v1/Systems/system/LogServices/Crashdump/En=
tries/0&quot;,<br>
&quot;@odata.type&quot;: &quot;#LogEntry.v1_7_0.LogEntry&quot;,<br>
&quot;AdditionalDataURI&quot;: <br>
&quot;/redfish/v1/Systems/system/LogServices/Crashdump/Entries/0/ras-error0=
.cper&quot;,<br>
&quot;Created&quot;: &quot;1970-1-1T0:4:12Z&quot;,<br>
&quot;DiagnosticDataType&quot;: &quot;OEM&quot;,<br>
&quot;EntryType&quot;: &quot;Oem&quot;,<br>
&quot;Id&quot;: &quot;0&quot;,<br>
&quot;Name&quot;: &quot;CPU Crashdump&quot;,<br>
&quot;OEMDiagnosticDataType&quot;: &quot;APMLCrashdump&quot;<br>
},<br>
{&quot;@<a href=3D"http://odata.id" rel=3D"noreferrer" target=3D"_blank">od=
ata.id</a>&quot;: &quot;/redfish/v1/Systems/system/LogServices/Crashdump/En=
tries/1&quot;,<br>
&quot;@odata.type&quot;: &quot;#LogEntry.v1_7_0.LogEntry&quot;,<br>
&quot;AdditionalDataURI&quot;: <br>
&quot;/redfish/v1/Systems/system/LogServices/Crashdump/Entries/1/ras-error1=
.cper&quot;,<br>
&quot;Created&quot;: &quot;1970-1-1T0:4:12Z&quot;,<br>
&quot;DiagnosticDataType&quot;: &quot;OEM&quot;,<br>
&quot;EntryType&quot;: &quot;Oem&quot;,<br>
&quot;Id&quot;: &quot;1&quot;,<br>
&quot;Name&quot;: &quot;CPU Crashdump&quot;,<br>
&quot;OEMDiagnosticDataType&quot;: &quot;APMLCrashdump&quot;<br>
},<br>
],<br>
&quot;Members@odata.count&quot;: 2,<br>
&quot;Name&quot;: &quot;Open BMC Crashdump Entries&quot;}<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">--=
------------<br>Dhruvaraj S</div></div>

--0000000000004076e205f76b82c8--
