Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E4B11DB58
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 01:56:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ysgq1yBQzDr9L
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 11:56:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
X-Greylist: delayed 17575 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Dec 2019 11:56:16 AEDT
Received: from mail-lj1-x236.google.com (unknown [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ysg421cvzDr9C
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 11:56:13 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id j6so743676lja.2
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 16:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bA+vn4ouOgQVO/m+F+EI3AMpOF1HK/QmVzNBt62iUt8=;
 b=O0S4iRZAqYzDDACbB6QFzeJzxoZLUdI2hXfEk1v5yIW2l3fbYbLjt0wBrpyUZqh+vJ
 BuLEhD33Gtps4TAvK+uHpJyq55VxtQkjvEmCHRbo5HXCGDYAduccRLV5zLzsX2SArRKD
 yvX09NYpjbrbMdzm4XLi6wyrwUXrnN/L0lKSJfd27vZCpnFnkUSrASJT9ttJagHXbIu4
 gZM2CxYJG5NEES62WUYMoLyKjNurilcD094YLLI2lkGIdZwWW1XcZ6JtWUNyv5DH8x0s
 hV24JAGeGqmWtbu4qXnmILP+cTPFl3y5FK5lnWjjlsJQWCJhE+aL/1ZKbNOr9uARpnbp
 fx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bA+vn4ouOgQVO/m+F+EI3AMpOF1HK/QmVzNBt62iUt8=;
 b=p1bfkXDijkIv/oUIuZwq/9evbqufc4aKvF/kTTXY3BQD6feltBc6AZHXN9U8k/JbPm
 9Ri/onBiQAT9r6XrhTl6eQy2mO54ynWwJ4v3M0sEeBnjHor9ACNwX58Kwk1Mqn5//BMt
 UoAE+Tdzp3/WNaduqMPf94clWkKngmRbJ8JoaNvkXEXv/6kZA4fRwxyC8AA5u/nOilZQ
 hkyOrOOhuE5ngx1SWFV2JlQh5Os3BkFRF+QzQBH/9ZtH1YcwZljhwFVsRCFqbzpT/YFU
 4uHxg+XenmEutLubo1y85+zis9odelPp/LNoPeBp9NvsHVLtbGAEPGBsZifgMGFZ00AI
 69Fw==
X-Gm-Message-State: APjAAAX4skzSM2xtDUkK20/U8sSaWLHCpa5VFvUNqTOnok2pSlHHlm5n
 YAGdyJdsouUCGSeoMrMmzFZKo+UtZt8GR7aFutNDOw==
X-Google-Smtp-Source: APXvYqyfDzUc72xwSsV9djUlp7sHUXIim837qbdxMdY0Bh6REG8gXwIziDdMr7b4mZmdYf4yRH2OhBly/PwIjmpGvx4=
X-Received: by 2002:a2e:9b55:: with SMTP id o21mr7799717ljj.147.1576198560537; 
 Thu, 12 Dec 2019 16:56:00 -0800 (PST)
MIME-Version: 1.0
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
In-Reply-To: <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 12 Dec 2019 16:55:48 -0800
Message-ID: <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
Subject: Re: Redfish Dump Service Proposal
To: Devender Rao <devenrao@in.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000004c590f05998b533c"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004c590f05998b533c
Content-Type: text/plain; charset="UTF-8"

Hi Ratan,

I think this service is a really good idea.  A couple of thoughts:

1) I don't think the semantics around the Download action are consistent.
Generally actions are reserved for stateful changes, and only have post
methods.  I think this could be simplified by putting an @odata.id in the
Dump resource that points to the raw dump file.  Then clients can do a
normal HTTP get on that URL.

2) I'm wondering what is the best way to communicate what MIME type the raw
dump supports.  In theory that could be a part of the RawDump resource.
However, a case could be made that it should be put into the Dump resource.

3) Perhaps the dump service should be embedded into other resources,
instead of being a top level service.  I'm imagining something like how the
LogService is setup.  That way there are a lot fewer dumpTypes for any
particular instance of the service.
   a) This could be taken to the extreme, and the DumpService could be
integrated with the existing LogServices.  This would mean adding in a new
log type, and having a new action.

4) It might be a good idea to have some event support in the cases where a
dump is created because of a machine crash.

Regards,
Richard

On Wed, Dec 11, 2019 at 11:08 PM Devender Rao <devenrao@in.ibm.com> wrote:

> Over all the schema looks good. Few observations for clarity, also how
> about we have multiple collection say HostDumpCollection, BMCDumpCollection
>  and also a new service DumpLocations similar to "CertificateLocations"
>
> Page 17: Dump Creation flow
> 1. The time line diagram should show that "Request to create dump" return
> immediatley. The redfish client will be notififed asynchronously when the
> dump is collected through DumpCollected event. Request for dump with
> resource id should be in the same time line when it gets notified of Dump
> collection completed.
>
> Page 19: For clarity
> "List Dumps" should be shown as part of DumpColletion rather than under
> "Operations on dump"
> "Get Dump details" should be shown under dump service
> "Delete Dumps" should be shown under DumpService
>
>
> ----- Original message -----
> From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
> Sent by: "openbmc" <openbmc-bounces+devenrao=in.ibm.com@lists.ozlabs.org>
> To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Cc:
> Subject: [EXTERNAL] Redfish Dump Service Proposal
> Date: Thu, Dec 12, 2019 5:09 AM
>
> Hi All,
>
> Please find the redfish dump service proposal for the DMTF attached.
>
> Kindly review and provide your inputs.
>
> Ratan
>
>
>
>
>
>
>
>

--0000000000004c590f05998b533c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ratan,<div><br></div><div>I think this service is a rea=
lly good idea.=C2=A0 A couple of thoughts:</div><div><br></div><div>1) I do=
n&#39;t think the semantics around the Download action are consistent.=C2=
=A0 Generally actions are reserved for stateful changes, and only have post=
 methods.=C2=A0 I think this could be simplified by putting an=C2=A0@<a hre=
f=3D"http://odata.id">odata.id</a> in the Dump resource that points to the =
raw dump file.=C2=A0 Then clients can do a normal HTTP get on that URL.</di=
v><div><br></div><div>2) I&#39;m wondering what is the best way to communic=
ate what MIME type the raw dump supports.=C2=A0 In theory that could be a p=
art of the RawDump resource.=C2=A0 However, a case could be made that it sh=
ould be put into the Dump resource.=C2=A0</div><div><br></div><div>3) Perha=
ps the dump service should be embedded into other resources, instead of bei=
ng a top level service.=C2=A0 I&#39;m imagining something like how the LogS=
ervice is setup.=C2=A0 That way there are a lot fewer dumpTypes for any par=
ticular instance of the service.=C2=A0=C2=A0</div><div>=C2=A0 =C2=A0a) This=
 could be taken to the extreme, and the DumpService could be integrated wit=
h the existing LogServices.=C2=A0 This would mean adding in a new log type,=
 and having a new action.</div><div><br></div><div>4) It might be a good id=
ea to have some event support in the cases where a dump is created because =
of a machine crash.</div><div><br></div><div>Regards,</div><div>Richard</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Dec 11, 2019 at 11:08 PM Devender Rao &lt;<a href=3D"mailto:deven=
rao@in.ibm.com">devenrao@in.ibm.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr" style=3D"font-family:Ar=
ial,Helvetica,sans-serif;font-size:10pt"><div dir=3D"ltr">Over all the sche=
ma looks good. Few observations for clarity, also how about we have multipl=
e collection say HostDumpCollection, BMCDumpCollection =C2=A0and also a new=
 service DumpLocations similar to &quot;CertificateLocations&quot;</div>
<div dir=3D"ltr"><br>Page 17: Dump Creation flow</div>
<div dir=3D"ltr">1. The time line diagram should show that &quot;Request to=
 create dump&quot; return immediatley. The redfish client will be notififed=
 asynchronously when the dump is collected through DumpCollected event. Req=
uest for dump with resource id should be in the same time line when it gets=
 notified of Dump collection completed.<br>=C2=A0</div>
<div dir=3D"ltr">Page 19: For clarity</div>
<div dir=3D"ltr">&quot;List Dumps&quot; should be shown as part of DumpColl=
etion rather than under &quot;Operations on dump&quot;<br>&quot;Get Dump de=
tails&quot; should be shown under dump service</div>
<div dir=3D"ltr">&quot;Delete Dumps&quot; should be shown under DumpService=
<br>=C2=A0</div>
<blockquote dir=3D"ltr" style=3D"border-left:2px solid rgb(170,170,170);mar=
gin-left:5px;padding-left:5px;direction:ltr;margin-right:0px">----- Origina=
l message -----<br>From: Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.v=
net.ibm.com" target=3D"_blank">ratagupt@linux.vnet.ibm.com</a>&gt;<br>Sent =
by: &quot;openbmc&quot; &lt;openbmc-bounces+devenrao=3D<a href=3D"mailto:in=
.ibm.com@lists.ozlabs.org" target=3D"_blank">in.ibm.com@lists.ozlabs.org</a=
>&gt;<br>To: &quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_b=
lank">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"mailto:openbmc@list=
s.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>Cc:<br>=
Subject: [EXTERNAL] Redfish Dump Service Proposal<br>Date: Thu, Dec 12, 201=
9 5:09 AM<br>=C2=A0
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2">Hi All,<br><br>Please find the redfish dump service proposal for the DM=
TF attached.<br><br>Kindly review and provide your inputs.<br><br>Ratan</fo=
nt><br><br><br>=C2=A0</div>
<div id=3D"gmail-m_-4222119677397271989MIMEAttachInfoDiv" style=3D"display:=
none" title=3D"vnd.openxmlformats-officedocument.presentationml.presentatio=
n|DumpOffload_DMTF_Proposal.pptx">=C2=A0</div></blockquote>
<div dir=3D"ltr">=C2=A0</div></div><br>

</blockquote></div>

--0000000000004c590f05998b533c--
