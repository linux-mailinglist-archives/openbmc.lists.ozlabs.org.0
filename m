Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0D11DDE8
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 06:46:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z06M2zWczDrDY
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 16:46:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=ojayanth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dvC51zPU"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z05g1gw6zDr9w
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 16:46:14 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id 66so4904737otd.9
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 21:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Js3DwTpFlIPCtidti2BEdOyeySIqqlLNAxLDnzzUjc=;
 b=dvC51zPUByDr8j0KcjIXwdSUUiHAa8wE7lRq89+RspLa6TNTc46HzObmHqO9WXqmlk
 xwvowiAv86cuF5QR+mzqpQTIew0Hz7u+xJC7GI4pyo/D+QNwRczJ7RkkOlmPokjZ4AuA
 TYYJe/bvdYDG1K+FS1/Sc3YGpt2Seiv5susrRxj8xnDt2ik1Cgqnjs7aLx1FL1WKl6/D
 2Gjui4DISk5WusAIt5dxTj9R2z0qAUVf1yNeFbFMKCI0r7Ev2zhumHWx+Ijao8nNdjfy
 /eATE+XiYSOAYC+jrpuJblZl0MartyGXiYMLIKgqT31cNSsl3cvndrSQwnXNBQqIpj/k
 OtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Js3DwTpFlIPCtidti2BEdOyeySIqqlLNAxLDnzzUjc=;
 b=A6lqRFmED6hFTWtaMXBQlKwXpAjxOQepYL8WmVu4oYZnf/Q71Bj8pBvfDwOYGxORe0
 6IlYK3+ME1rz7VyDPqv8jZIGp0jwttvwQ4kqBORjPrxngvZgRXpdkf3aD0WXreybmnMR
 bZMS6Kpua0K/CyF8Lteuhwi2IUfKts8WuiFvC6BFcoplfQYThUtpjldUgk4aaSZpem9K
 Gccp0PJaEhsGdsfw0yTZBii1gYoZ9SkRcjzztnF7uJrLgRp/etCVr5hH9Wf1r9CsRFEj
 /Pbp3FpDIUeGaIPrqArfvJ3bX4BUkCiYxOA3HDn3jRxDW4u9XSiVHOs9CWk67ESfIzNe
 ou7g==
X-Gm-Message-State: APjAAAW8UI3piUrFph51vlJlKhDzpnZVtR23AvUDybK6qBlFQToWL/0R
 U/JCTDtTtNLgKUkrslVHjhHW0HI/pkXxIDeI/v8=
X-Google-Smtp-Source: APXvYqxNZJKUPkxOWPQus48Dz/WjizOKvTt7hv/uqFQcYeuFiGm59IIwyFPSKgHOOi4MfCqiDk8Xnwy55Qq99nLoQgo=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr12997607otb.85.1576215972543; 
 Thu, 12 Dec 2019 21:46:12 -0800 (PST)
MIME-Version: 1.0
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
In-Reply-To: <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Fri, 13 Dec 2019 11:16:01 +0530
Message-ID: <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
Subject: Re: Redfish Dump Service Proposal
To: Richard Hanley <rhanley@google.com>
Content-Type: multipart/alternative; boundary="00000000000022077705998f61f5"
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000022077705998f61f5
Content-Type: text/plain; charset="UTF-8"

Dump is an additional debug data associated  to an error event.
From the phosphor-debug-collector  perspective,  BMC Dump collects
additional debug information, which canot be contained in the error log.
Please find my comments inline.

On Fri, Dec 13, 2019 at 6:27 AM Richard Hanley <rhanley@google.com> wrote:

> Hi Ratan,
>
> I think this service is a really good idea.  A couple of thoughts:
>
> 1) I don't think the semantics around the Download action are consistent.
> Generally actions are reserved for stateful changes, and only have post
> methods.  I think this could be simplified by putting an @odata.id in the
> Dump resource that points to the raw dump file.  Then clients can do a
> normal HTTP get on that URL.
>
> 2) I'm wondering what is the best way to communicate what MIME type the
> raw dump supports.  In theory that could be a part of the RawDump
> resource.  However, a case could be made that it should be put into the
> Dump resource.
>
> 3) Perhaps the dump service should be embedded into other resources,
> instead of being a top level service.  I'm imagining something like how the
> LogService is setup.  That way there are a lot fewer dumpTypes for any
> particular instance of the service.
>    a) This could be taken to the extreme, and the DumpService could be
> integrated with the existing LogServices.  This would mean adding in a new
> log type, and having a new action.
>


> +Agree with this suggestion to embedding dump under log service as new
> EventType.  Also need an association  for each system generated dump with
> an error event.
>

> 4) It might be a good idea to have some event support in the cases where a
> dump is created because of a machine crash.
>
> Regards,
> Richard
>
> On Wed, Dec 11, 2019 at 11:08 PM Devender Rao <devenrao@in.ibm.com> wrote:
>
>> Over all the schema looks good. Few observations for clarity, also how
>> about we have multiple collection say HostDumpCollection, BMCDumpCollection
>>  and also a new service DumpLocations similar to "CertificateLocations"
>>
>> Page 17: Dump Creation flow
>> 1. The time line diagram should show that "Request to create dump" return
>> immediatley. The redfish client will be notififed asynchronously when the
>> dump is collected through DumpCollected event. Request for dump with
>> resource id should be in the same time line when it gets notified of Dump
>> collection completed.
>>
>> Page 19: For clarity
>> "List Dumps" should be shown as part of DumpColletion rather than under
>> "Operations on dump"
>> "Get Dump details" should be shown under dump service
>> "Delete Dumps" should be shown under DumpService
>>
>>
>> ----- Original message -----
>> From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
>> Sent by: "openbmc" <openbmc-bounces+devenrao=in.ibm.com@lists.ozlabs.org>
>> To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
>> Cc:
>> Subject: [EXTERNAL] Redfish Dump Service Proposal
>> Date: Thu, Dec 12, 2019 5:09 AM
>>
>> Hi All,
>>
>> Please find the redfish dump service proposal for the DMTF attached.
>>
>> Kindly review and provide your inputs.
>>
>> Ratan
>>
>>
>>
>>
>>
>>
>>
>>

--00000000000022077705998f61f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Dump is an additional debu=
g data associated=C2=A0 to an error event.=C2=A0 <br></div><div>From the ph=
osphor-debug-collector=C2=A0 perspective,=C2=A0 BMC Dump collects additiona=
l debug information, which canot be contained in the error log. Please find=
 my comments inline. <br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Dec 13, 2019 at 6:27 AM Richard Hanley &lt=
;<a href=3D"mailto:rhanley@google.com">rhanley@google.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">H=
i Ratan,<div><br></div><div>I think this service is a really good idea.=C2=
=A0 A couple of thoughts:</div><div><br></div><div>1) I don&#39;t think the=
 semantics around the Download action are consistent.=C2=A0 Generally actio=
ns are reserved for stateful changes, and only have post methods.=C2=A0 I t=
hink this could be simplified by putting an=C2=A0@<a href=3D"http://odata.i=
d" target=3D"_blank">odata.id</a> in the Dump resource that points to the r=
aw dump file.=C2=A0 Then clients can do a normal HTTP get on that URL.</div=
><div><br></div><div>2) I&#39;m wondering what is the best way to communica=
te what MIME type the raw dump supports.=C2=A0 In theory that could be a pa=
rt of the RawDump resource.=C2=A0 However, a case could be made that it sho=
uld be put into the Dump resource.=C2=A0</div><div><br></div><div>3) Perhap=
s the dump service should be embedded into other resources, instead of bein=
g a top level service.=C2=A0 I&#39;m imagining something like how the LogSe=
rvice is setup.=C2=A0 That way there are a lot fewer dumpTypes for any part=
icular instance of the service.=C2=A0=C2=A0</div><div>=C2=A0 =C2=A0a) This =
could be taken to the extreme, and the DumpService could be integrated with=
 the existing LogServices.=C2=A0 This would mean adding in a new log type, =
and having a new action.</div><div></div></div></blockquote><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>+=
Agree with this suggestion to embedding dump under log service as new Event=
Type.=C2=A0 Also need an association=C2=A0 for each system generated dump w=
ith an error event. =C2=A0 <br></div></div></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div> <br></div><div>4) I=
t might be a good idea to have some event support in the cases where a dump=
 is created because of a machine crash.</div><div><br></div><div>Regards,</=
div><div>Richard</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Dec 11, 2019 at 11:08 PM Devender Rao &lt;<a =
href=3D"mailto:devenrao@in.ibm.com" target=3D"_blank">devenrao@in.ibm.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans-serif;font-size:10=
pt"><div dir=3D"ltr">Over all the schema looks good. Few observations for c=
larity, also how about we have multiple collection say HostDumpCollection, =
BMCDumpCollection =C2=A0and also a new service DumpLocations similar to &qu=
ot;CertificateLocations&quot;</div>
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
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce">Hi All,<br><br>Please find the redfish dump service proposal for the DM=
TF attached.<br><br>Kindly review and provide your inputs.<br><br>Ratan</fo=
nt><br><br><br>=C2=A0</div>
<div id=3D"gmail-m_8578528305044193743gmail-m_-4222119677397271989MIMEAttac=
hInfoDiv" style=3D"display:none" title=3D"vnd.openxmlformats-officedocument=
.presentationml.presentation|DumpOffload_DMTF_Proposal.pptx">=C2=A0</div></=
blockquote>
<div dir=3D"ltr">=C2=A0</div></div><br>

</blockquote></div>
</blockquote></div></div>

--00000000000022077705998f61f5--
