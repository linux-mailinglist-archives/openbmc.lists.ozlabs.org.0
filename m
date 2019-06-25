Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E5152002
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 02:37:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XnLr3pDhzDqTk
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 10:37:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::c4a; helo=mail-yw1-xc4a.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SBDoT4J5"; 
 dkim-atps=neutral
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XnLH2CcQzDqSL
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 10:37:25 +1000 (AEST)
Received: by mail-yw1-xc4a.google.com with SMTP id b188so18872713ywb.10
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 17:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:message-id:date:subject:from:to;
 bh=RUXGbMMfzuvtpYuGD7BbGb4HecEYJZ5A/BEk/SRd1TY=;
 b=SBDoT4J5CDBUrjyK0PYmmWug82t8ngyaJnog1zADTFNEt0+zk0oKDPlljr8CpQNuuq
 47rJ4eUlHykEAPkN03qCYWax265m4LcWo7cSXY9h8i3jwex2L19ihTA14ImN+SAhECQD
 21UBBGCHqw+vTzbWJ3uVf7QmIAQrd6NSfbQBJ3DYDXDzcH8kr1gJPhPjzxu/lIRoRgAI
 s8E98lhDgVR0z89U4dXLA7dBfq3W3ysZmNsG0oKUZEI8qUlNmt0lXRHzeQ0MmpgjSsd7
 dWy6ih7oIEalUq91kyou4VRNQtL8meiGcTVgD0vrukAY6qwon+4ZSp1AZWUzNOiOMdHh
 PUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
 :subject:from:to;
 bh=RUXGbMMfzuvtpYuGD7BbGb4HecEYJZ5A/BEk/SRd1TY=;
 b=jbw2LtyTgZQ/dR1Yt8Sgt0o5O4jwAFZ4+yAmRtT6WahlYbjC7nsL8jdxa/BxA4WDqJ
 Hdv2mrggQwChw2QsG2ZNTjBKP/73j1M87r83op4uoNYxIB8/PAiZEaMfu20H9OjaUxP9
 6apKjuY/1Uf2QCNbN24ql7TFJ2C1r5+X9k1U3GI93qVQ7glbwWEgVzhWKLhgoOKS/pD1
 slYxZuvnPwkV5b9pUinx1oaKul+pgGMz1T460fvTkkijZhSTl7edXx8ShL+Gj2sAv/kB
 OxvZcv8L43pW6gSIGWcv0q5VQsxt21lsoQCEydeHYj0AvN0IfJP5vJ9rea8uDEKbbRdG
 DbKw==
X-Gm-Message-State: APjAAAVICExhiaitg8yoVZbq3BdJ5YXV8MVFNOiVqHpwZlO3+42ydnMv
 Rm3nQcV3653jmvniI4aAeVwvaK4RP3YcBDoKDtrCS6k=
X-Google-Smtp-Source: APXvYqxW4xIyH55hHNDYjTSZ/wPPsINK5RwJHy6NJyTknQLLVQdizDqgd0lHxBn6QZZHY32OLrKtRQRjN+a4LltgnCVK
MIME-Version: 1.0
X-Received: by 2002:a25:50cb:: with SMTP id e194mr7725002ybb.435.1561423042244; 
 Mon, 24 Jun 2019 17:37:22 -0700 (PDT)
Message-ID: <000000000000c76c7a058c1b21e5@google.com>
Date: Tue, 25 Jun 2019 00:37:22 +0000
Subject: Platform telemetry and health monitoring 
From: Kun Yi <kunyi@google.com>
To: kunyi@google.com, vishwa@linux.vnet.ibm.com, kishan@cisco.com, 
 skochar@lenovo.com, openbmc@lists.ozlabs.org, srinuklge@gmail.com, 
 ofery@google.com, cwood2@lenovo.com, neladk@microsoft.com
Content-Type: multipart/alternative; boundary="000000000000c76c49058c1b21e2"
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
Reply-To: Kun Yi <kunyi@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c76c49058c1b21e2
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

SGksDQoNClVuZm9ydHVuYXRlbHkgSSBjYW4ndCBtYWtlIHRoaXMgbWVldGluZy4NCg0KIEZyb20g
bXkgZW5kLCBteSBpbnRlcm4gR2FicmllbCBqdXN0IGdvdCBzdGFydGVkIGV4cGVyaW1lbnRpbmcg
dXNpbmcgIA0KY29sbGVjdGQgdG8gY29sbGVjdCB2YXJpb3VzIEJNQyBwZXJmb3JtYW5jZSBtZXRy
aWNzLiBPbmNlIHdlIHZhbGlkYXRlIHRoZSAgDQpkYWVtb24gd29ya3MgZ29vZCBlbm91Z2gsIHRo
ZSBuZXh0IHRoaW5nIGZvciBoaW0gdG8gd29yayBvbiBpcyBhIGNvbGxlY3RkICANCkQtQnVzIGlu
dGVyZmFjZSBwbHVnaW4gdG8gZXhwb3NlIHRoZSBtZXRyaWNzLiBXaWxsIGtlZXAgeW91IHBvc3Rl
ZCBvbiB0aGUgIA0KcHJvZ3Jlc3MuDQoNClRoYW5rcywNCkt1bg0KDQpUaXRsZTogUGxhdGZvcm0g
dGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZw0KQmFzZWQgb24gaW50ZXJlc3RzIHNvIGZh
ciwgd2Ugd2lsbCBtZWV0IGJpLXdlZWtseSBNb25kYXkgOSBQTSBQU1QuICBXZSBjYW4gIA0KYWxz
byByb3RhdGUgdGhlIG1lZXRpbmcgdGltZXMgaWYgcmVxdWlyZWQuDQpBZ2VuZGE6DQoNCiAgIDEu
ICBEZWZpbmUgcmVxdWlyZW1lbnRzIGZvciBwbGF0Zm9ybSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBt
b25pdG9yaW5nDQoNCkpvaW4gTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmcNCisxIDMyMy04NDktNDg3
NCAgIFVuaXRlZCBTdGF0ZXMsIExvcyBBbmdlbGVzIChUb2xsKQ0KKDg2NikgNjc5LTk5OTUgICAo
VG9sbC1mcmVlKQ0KQ29uZmVyZW5jZSBJRDogNzM1IDcyOCA0MiMNCkxvY2FsIG51bWJlcnMgfCBS
ZXNldCBQSU4gfCBMZWFybiBtb3JlIGFib3V0IFRlYW1zIHwgTWVldGluZyBvcHRpb25zDQpKb2lu
IHdpdGggYSB2aWRlbyBjb25mZXJlbmNpbmcgZGV2aWNlDQo4MTM4Nzg4OTZAdC5wbGNtLnZjIFZU
QyBDb25mZXJlbmNlIElEOiAwMTc5MjA2ODQNCkFsdGVybmF0ZSBWVEMgZGlhbGluZyBpbnN0cnVj
dGlvbnMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpG
cm9tOiBvcGVuYm1jICZndDsgT24gQmVoYWxmIE9mIE5lZXJhaiBMYWRrYW5pDQpTZW50OiBNb25k
YXksIE1heSAyMCwgMjAxOSAxOjI1IFBNDQpUbzogT3BlbkJNQyBNYWlsbGlzdCAmZ3Q7DQpTdWJq
ZWN0OiBQbGF0Zm9ybSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBtb25pdG9yaW5nDQoNCkhpIEFsbCwN
Cg0KQXMgd2UgZGlzY3Vzc2VkIGhhdmluZyBhIGZvY3VzZWQgd29ya3N0cmVhbSBmb3Ig4oCcUGxh
dGZvcm0gdGVsZW1ldHJ5IGFuZCAgDQpoZWFsdGggbW9uaXRvcmluZ+KAnSBpbiBvbmUgb2YgZW1h
aWwgdGhyZWFkLCBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdvdWxkICANCmxpa2UgdG8gam9p
biB0aGlzIHdvcmsgc3RyZWFtLiBJdCB3b3VsZCBiZSBncmVhdCB0byBoYXZlIHBhcnRpY2lwYXRp
b24gZnJvbSAgDQpTaWxpY29uIHBhcnRuZXJzLyBtYWluYm9hcmQgZGVzaWduIGFuZCBtZmcgcGFy
dG5lcnMvIE1lbW9yeS8gTklDcy8gRmlybXdhcmUgIA0KYW5kIG90aGVyIGNvbXBvbmVudHMuDQoN
Ck5hbWUNClByZWZlcnJlZCBUaW1pbmdzDQpBZ2VuZGEgLyBDb250cmlidXRpb24gQXJlYXMNCg0K
DQoNCg0KDQoNCg0KDQoNCg0KT25jZSB3ZSBoYXZlIGVub3VnaCBxdW9ydW0sIHdlIHdpbGwgcHV0
IHRvZ2V0aGVyIGJpLXdlZWtseSBjYWxsIHRvICANCmJyYWluc3Rvcm0gdmFyaW91cyBpZGVhcyBh
bmQgcHJvcG9zYWxzLg0KDQpUaGFua3MNCk5lZXJhag0KDQoNCldoZW46IE1vbiBKdW4gMjQsIDIw
MTkgOXBtIOKAkyAxMHBtIFBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzDQpXaGVyZTogTWljcm9z
b2Z0IFRlYW1zIE1lZXRpbmcNCldobzoNCiAgICAgKiBOZWVyYWogTGFka2FuaSAtIG9yZ2FuaXpl
cg0KICAgICAqIEt1biBZaSAtIGNyZWF0b3INCiAgICAgKiBDaHJpcyBXb29kDQogICAgICogdmlz
aHdhDQogICAgICogU3Jpa2lzaGVuIFBvbmRpY2hlcnJ5IFNoYW5tdWdhbSAoa2lzaGFuKQ0KICAg
ICAqIFN1bWVldCBLb2NoYXINCiAgICAgKiBzcmluaXZhcyBrDQogICAgICogT2ZlciBZZWhpZWxs
aQ0KICAgICAqIE9wZW5CTUMgTWFpbGxpc3QgLSBvcHRpb25hbA0K
--000000000000c76c49058c1b21e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/EmailMessage"><p itemprop=3D"=
description">Hi,<p>Unfortunately I can&#39;t make this meeting.<p>From my e=
nd, my intern Gabriel just got started experimenting using collectd to coll=
ect various BMC performance metrics. Once we validate the daemon works good=
 enough, the next thing for him to work on is a collectd D-Bus interface pl=
ugin to expose the metrics. Will keep you posted on the progress.<p>Thanks,=
<br>Kun</p></span><span itemscope itemtype=3D"http://schema.org/InformActio=
n"><span style=3D"display:none" itemprop=3D"about" itemscope itemtype=3D"ht=
tp://schema.org/EmailMessage"><meta itemprop=3D"description" content=3D"Kun=
 Yi: Hi, Unfortunately I can&#39;t make this meeting. From my end, my inter=
n Gabriel just got started experimenting using collectd to collect various =
BMC performance metrics. Once we validate the daemon works good enough, the=
 next thing for him to work on is a collectd D-Bus interface plugin to expo=
se the metrics. Will keep you posted on the progress. Thanks, Kun"/></span>=
<span itemprop=3D"object" itemscope itemtype=3D"http://schema.org/Event"><d=
iv style=3D""><table cellspacing=3D"0" cellpadding=3D"8" border=3D"0" summa=
ry=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;border:1px Solid #=
ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><tr><td><meta item=
prop=3D"eventStatus" content=3D"http://schema.org/EventScheduled"/><div sty=
le=3D"padding:2px"><span itemprop=3D"publisher" itemscope itemtype=3D"http:=
//schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calend=
ar"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"_60q30c1g6=
0o30e1i60o4ac1g60rj8gpl88rj2c1h84s34h9g60s30c1g60o30c1g6so4adi66t0jgdhn650k=
8d9g64o30c1g60o30c1g60o30c1g60o32c1g60o30c1g6h0k6c1n84s3gc1i6h0j2h1k74sjcdp=
n6p1jec268or3edpo6co0_20190625T040000Z"/><h3 style=3D"padding:0 0 6px 0;mar=
gin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:bold;color:#2=
22"><span itemprop=3D"name">Platform telemetry and health monitoring </span=
></h3><div style=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-s=
ize:13px;color:#222;white-space:pre-wrap!important;white-space:-moz-pre-wra=
p!important;white-space:-pre-wrap!important;white-space:-o-pre-wrap!importa=
nt;white-space:pre;word-wrap:break-word"><span>Based on interests so far, w=
e will meet bi-weekly Monday 9 PM PST.  We can also rotate the meeting time=
s if required.<br>Agenda:<p>  1.  Define requirements for platform telemetr=
y and health monitoring</p><p>Join Microsoft Teams Meeting<u></u><br>+1 323=
-849-4874<u></u>   United States, Los Angeles (Toll)<br>(866) 679-9995<u></=
u>   (Toll-free)<br>Conference ID: 735 728 42#<br>Local numbers<u></u> | Re=
set PIN<u></u> | Learn more about Teams<u></u> | Meeting options<u></u><br>=
Join with a video conferencing device<br><a href=3D"mailto:813878896@t.plcm=
.vc" target=3D"_blank">813878896@t.plcm.vc</a><u></u> VTC Conference ID: 01=
7920684<br>Alternate VTC dialing instructions<u></u></p><p>________________=
_____________________________<br>From: openbmc <u></u>&gt; On Behalf Of Nee=
raj Ladkani<br>Sent: Monday, May 20, 2019 1:25 PM<br>To: OpenBMC Maillist <=
u></u>&gt;<br>Subject: Platform telemetry and health monitoring</p><p>Hi Al=
l,</p><p>As we discussed having a focused workstream for =E2=80=9CPlatform =
telemetry and health monitoring=E2=80=9D in one of email thread, Please let=
 me know if you would like to join this work stream. It would be great to h=
ave participation from Silicon partners/ mainboard design and mfg partners/=
 Memory/ NICs/ Firmware and other components.</p><p>Name<br>Preferred Timin=
gs<br>Agenda / Contribution Areas</p><p></p><p></p><p></p><p></p><p><br>Onc=
e we have enough quorum, we will put together bi-weekly call to brainstorm =
various ideas and proposals.</p><p>Thanks<br>Neeraj</p><p></p></span><meta =
itemprop=3D"description" content=3D"Based on interests so far, we will meet=
 bi-weekly Monday 9 PM PST.  We can also rotate the meeting times if requir=
ed.
Agenda:

  1.  Define requirements for platform telemetry and health monitoring

Join Microsoft Teams Meeting
+1 323-849-4874   United States, Los Angeles (Toll)
(866) 679-9995   (Toll-free)
Conference ID: 735 728 42#
Local numbers | Reset PIN | Learn more about Teams | Meeting options
Join with a video conferencing device
813878896@t.plcm.vc VTC Conference ID: 017920684
Alternate VTC dialing instructions

_____________________________________________
From: openbmc &amp;gt; On Behalf Of Neeraj Ladkani
Sent: Monday, May 20, 2019 1:25 PM
To: OpenBMC Maillist &amp;gt;
Subject: Platform telemetry and health monitoring

Hi All,

As we discussed having a focused workstream for =E2=80=9CPlatform telemetry=
 and health monitoring=E2=80=9D in one of email thread, Please let me know =
if you would like to join this work stream. It would be great to have parti=
cipation from Silicon partners/ mainboard design and mfg partners/ Memory/ =
NICs/ Firmware and other components.

Name
Preferred Timings
Agenda / Contribution Areas










Once we have enough quorum, we will put together bi-weekly call to brainsto=
rm various ideas and proposals.

Thanks
Neeraj

"/></div><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" summary=3D=
"Event details"><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,San=
s-serif;font-size:13px;color:#888;white-space:nowrap" valign=3D"top"><div><=
i style=3D"font-style:normal">When</i></div></td><td style=3D"padding-botto=
m:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"to=
p"><time itemprop=3D"startDate" datetime=3D"20190625T040000Z"></time><time =
itemprop=3D"endDate" datetime=3D"20190625T050000Z"></time>Mon Jun 24, 2019 =
9pm =E2=80=93 10pm <span style=3D"color:#888">Pacific Time - Los Angeles</s=
pan></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-=
serif;font-size:13px;color:#888;white-space:nowrap" valign=3D"top"><div><i =
style=3D"font-style:normal">Where</i></div></td><td style=3D"padding-bottom=
:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top=
"><span itemprop=3D"location" itemscope itemtype=3D"http://schema.org/Place=
"><span itemprop=3D"name" class=3D"notranslate">Microsoft Teams Meeting</sp=
an><span dir=3D"ltr"> (<a href=3D"https://www.google.com/maps/search/Micros=
oft+Teams+Meeting?hl=3Den" style=3D"color:#20c;white-space:nowrap" target=
=3D"_blank" itemprop=3D"map">map</a>)</span></span></td></tr><tr><td style=
=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:=
#888;white-space:nowrap" valign=3D"top"><div><i style=3D"font-style:normal"=
>Who</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-=
serif;font-size:13px;color:#222" valign=3D"top"><table cellspacing=3D"0" ce=
llpadding=3D"0"><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-=
serif;font-size:13px;color:#222"><span style=3D"font-family:Courier New,mon=
ospace">&#x2022;</span></td><td style=3D"padding-right:10px;font-family:Ari=
al,Sans-serif;font-size:13px;color:#222"><div><div style=3D"margin:0 0 0.3e=
m 0"><span class=3D"notranslate">Neeraj Ladkani</span><span itemprop=3D"org=
anizer" itemscope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"n=
ame" content=3D"Neeraj Ladkani"/><meta itemprop=3D"email" content=3D"neladk=
@microsoft.com"/></span><span style=3D"font-size:11px;color:#888"> - organi=
zer</span></div></div></td></tr><tr><td style=3D"padding-right:10px;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D"font-family=
:Courier New,monospace">&#x2022;</span></td><td style=3D"padding-right:10px=
;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=3D=
"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Kun Yi<=
/span><meta itemprop=3D"email" content=3D"kunyi@google.com"/></span><span s=
tyle=3D"font-size:11px;color:#888"> - creator</span></div></div></td></tr><=
tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:1=
3px;color:#222"><span style=3D"font-family:Courier New,monospace">&#x2022;<=
/span></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itempr=
op=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemp=
rop=3D"name" class=3D"notranslate">Chris Wood</span><meta itemprop=3D"email=
" content=3D"cwood2@lenovo.com"/></span></div></div></td></tr><tr><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></td><=
td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;=
color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attend=
ee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name"=
 class=3D"notranslate">vishwa</span><meta itemprop=3D"email" content=3D"vis=
hwa@linux.vnet.ibm.com"/></span></div></div></td></tr><tr><td style=3D"padd=
ing-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><spa=
n style=3D"font-family:Courier New,monospace">&#x2022;</span></td><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" item=
scope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate">Srikishen Pondicherry Shanmugam (kishan)</span><meta itemp=
rop=3D"email" content=3D"kishan@cisco.com"/></span></div></div></td></tr><t=
r><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13=
px;color:#222"><span style=3D"font-family:Courier New,monospace">&#x2022;</=
span></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font=
-size:13px;color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itempro=
p=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempr=
op=3D"name" class=3D"notranslate">Sumeet Kochar</span><meta itemprop=3D"ema=
il" content=3D"skochar@lenovo.com"/></span></div></div></td></tr><tr><td st=
yle=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color=
:#222"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></t=
d><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13=
px;color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"att=
endee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"na=
me" class=3D"notranslate">srinivas k</span><meta itemprop=3D"email" content=
=3D"srinuklge@gmail.com"/></span></div></div></td></tr><tr><td style=3D"pad=
ding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><sp=
an style=3D"font-family:Courier New,monospace">&#x2022;</span></td><td styl=
e=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#=
222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" ite=
mscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate">Ofer Yehielli</span><meta itemprop=3D"email" content=3D"of=
ery@google.com"/></span></div></div></td></tr><tr><td style=3D"padding-righ=
t:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><span style=
=3D"font-family:Courier New,monospace">&#x2022;</span></td><td style=3D"pad=
ding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><di=
v><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope i=
temtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notra=
nslate">OpenBMC Maillist</span><meta itemprop=3D"email" content=3D"openbmc@=
lists.ozlabs.org"/></span><span style=3D"font-size:11px;color:#888"> - opti=
onal</span></div></div></td></tr></table></td></tr></table></div></td></tr>=
</table></div></span></span>
--000000000000c76c49058c1b21e2--
