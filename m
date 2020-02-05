Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF4153923
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 20:32:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CWsY11ktzDqSv
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 06:32:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::24a;
 helo=mail-oi1-x24a.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KR7W6Nby; dkim-atps=neutral
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CWrg6VYMzDqSj
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 06:31:13 +1100 (AEDT)
Received: by mail-oi1-x24a.google.com with SMTP id s8so1545125oie.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 11:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:message-id:date:subject:from:to;
 bh=KQHfYXLRtntXi40ZT69NoXM3pCEMGjY/IMl7VY5IpLI=;
 b=KR7W6NbyiOwfJV34Z23jE7g9cUzgDxlmWhH4FppdY2UZ0gr1tDb2j45BMU5mzlSUUZ
 t3Hk5rAF37E7OQlimyvQT4oFOnh8EK4z+kK5OzODgYPLaQTNUHUi6hS3Qh8Q7fLOC865
 ABINQfPkAUegkPmaI+qljGij+VD06+FzpfVhQYjAY4Fd2Kc0RQ4h7gKHix2JJn2DhFC2
 /U0Cj2lWAQB5f+0a/nJlsUIeDv9LpFFUJlWSyBCUmkYhS3lS1GXb9FltQ3S2ZhH66nyc
 xRa7xe46yz9YOoAMX+sa1LQFoizHjsleejWlgTRggJer9mUH9h1nROXiER405XITYpRR
 BefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
 :subject:from:to;
 bh=KQHfYXLRtntXi40ZT69NoXM3pCEMGjY/IMl7VY5IpLI=;
 b=gSSgD+XD376AFxzFK4HSEVbDUWbLrLW+GkwHgontrBt5QLAt0tRH29dk9ABKqgdxy1
 fwaCGuLYWLK1WIEafwQyfXJzJwOcOkTtbgntCADvE9yjhFZFamc80DbqaX6MVbBwkamx
 e4ldTFPpmBg/oZtgiI1YG9oIy3JI4qj4lGsHwygxclylJCY0GkcMdgLBI06nddJLwJDt
 0eLl3TRcTHzU86l9tIFBJenoOKIEkijqq7bFsW7XySksIgmqJH3BYKbx4kZmrieJfa2T
 HtvryMjgFncwogPCCg2ASPHueJEMqjj/z2LSRcNucT6eI/eLRRe8UfdnfjaAnL+7Gn+k
 02tg==
X-Gm-Message-State: APjAAAWdSSaACHgIEyYNwgJ7GutKRnK4XKslHDJiVertHtBspeewpBCM
 kt4cxN+whYHXwjAk+UPWyu+yXS5wiiEOGwRR1CLBUXcHvu6NkVYmwBtx3Pd+qf0Mjdjaz9efhfY
 kjUdtyUP1YnfWJ0wGDA1f9gNODPCqcJknbM4KJWMvkb/JwZiUwCV3Tat9HUCXCM5FjIbXWjSE6i
 4xOQ==
X-Google-Smtp-Source: APXvYqxT/ETN0mVZbEtVrtKi2X84aeFy4F5DoA3HaHDh7I0jxOt2SRJD35Gxe0ZZhNdt0MYgHzN9FVf6VHhQcTHKoI9k
MIME-Version: 1.0
X-Received: by 2002:a9d:6b91:: with SMTP id b17mr25890202otq.235.1580931068261; 
 Wed, 05 Feb 2020 11:31:08 -0800 (PST)
Message-ID: <000000000000bd5f8c059dd93291@google.com>
Date: Wed, 05 Feb 2020 19:31:08 +0000
Subject: BMC Aggregator Presentation Layer
From: rhanley@google.com
To: openbmc@lists.ozlabs.org, luke_chen@aspeedtech.com, joshua_giles@dell.com, 
 piotr.matuszczak@intel.com, buddy.huang@quantatw.com, 
 jason_yx_chang@wiwynn.com, alan_mimms@jabil.com, neladk@microsoft.com, 
 rhanley@google.com, vijaykhemka@fb.com, dong.wei@arm.com, dhruvaraj@gmail.com, 
 fran.hsu@quantatw.com
Content-Type: multipart/alternative; boundary="000000000000bd5f68059dd9328e"
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
Reply-To: rhanley@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bd5f68059dd9328e
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

SSdtIGdvaW5nIHRvIG1ha2UgYSBjaGFuZ2UgdG8gdGhpcyBtZWV0aW5ncyBhZ2VuZGEgYmFzZWQg
b24gdGhlIGZlZWRiYWNrICANCmZyb20geWVzdGVyZGF5J3MgbWVldGluZy4gSSB0aGluayB3ZSBu
ZWVkIHRvIHN0YXJ0IHRhbGtpbmcgYWJvdXQgdGhlIGRlc2lnbiAgDQpvZiBhbiBhZ2dyZWdhdG9y
IGRhdGEgbW9kZWwuIFRoZSBmZWF0dXJlcyBvZiB0aGF0IGRhdGEgbW9kZWwgc2hvdWxkIGhlYXZp
bHkgIA0KaW5mb3JtIGJvdGggdGhlIHByZXNlbnRhdGlvbiBsYXllciBhbmQgdGhlIHByb2Nlc3Mg
b2YgaW1wb3J0aW5nIGNoaWxkICANCm5vZGVzLCBhbmQgSSBkb24ndCB0aGluayB3ZSB3aWxsIG1h
a2UgbXVjaCBwcm9ncmVzcyB0YWxraW5nIGFib3V0ICANCnByZXNlbnRhdGlvbiBsYXllcnMgdW50
aWwgdGhlcmUgaXMgc29tZXRoaW5nIGNvbmNyZXRlIHdpdGggdGhlIGRhdGEgbW9kZWwuICANCkFz
IGFsd2F5cyB0aG91Z2gsIGlmIHlvdSBoYXZlIHNvbWUgZmVhdHVyZXMgb3IgdXNlIGNhc2VzIHRo
YXQgaGFzbid0IGJlZW4gIA0KY29uc2lkZXJlZCBzbyBmYXIsIGZlZWwgZnJlZSB0byBicmluZyB0
aGVtIHVwLiBUaGFua3MsIFJpY2hhcmQNCg0KVGl0bGU6IEJNQyBBZ2dyZWdhdG9yIFByZXNlbnRh
dGlvbiBMYXllcg0KU29ycnkgZm9yIHRoZSBkZWxheSBpbiBwdXR0aW5nIHRvZ2V0aGVyIHRoaXMg
Zm9sbG93IHVwIG1lZXRpbmcuDQoNCldlIG1hZGUgc29tZSBwcm9ncmVzcyBpbiBoYXNoaW5nIG91
dCBzb21lIG9mIHRoZSByZXF1aXJlbWVudHMgb2YgYSBCTUMgIA0KYWdncmVnYXRvciBpbiBvdXIg
bGFzdCBtZWV0aW5nLg0KDQpIb3dldmVyLCBvbmUgb2YgdGhlIGlzc3VlcyB0aGF0IG5lZWRzIG1v
cmUgZGlzY3Vzc2lvbiBpcyB3aGF0IGZlYXR1cmVzIGFyZSAgDQpuZWVkZWQgaW4gYSBwcmVzZW50
YXRpb24gbGF5ZXIgZm9yIHRoaXMgYWdncmVnYXRvci4NCg0KSSB0aGluayB0aGlzIGRpc2N1c3Np
b24gaXMgb25lIG9mIHRoZSBiaWdnZXN0IGJsb2NrZXJzIGJlZm9yZSB3ZSBjYW4gIA0KdHJhZGlu
ZyBhbnkgZGVzaWducywgYW5kIEkgbG9vayBmb3J3YXJkIHRvIGhlYXJpbmcgYWJvdXQgYW55IHVz
ZSBjYXNlcyB0aGF0ICANCnBlb3BsZSBhcmUgY29uc2lkZXJpbmcuDQoNCihQLlMuIEkgd2lsbCBi
ZSBjcmVhdGluZyBhIHNlY29uZCBtZWV0aW5nIHRoYXQgaXMgbW9yZSBhbWVuYWJsZSB0byBBc2lh
biAgDQp0aW1lem9uZXMpDQpXaGVuOiBUaHUgRmViIDYsIDIwMjAgMTBhbSDigJMgMTFhbSBQYWNp
ZmljIFRpbWUgLSBMb3MgQW5nZWxlcw0KV2hlcmU6IFNWTC1NQVQzLTQtU2F0dXJuICg1KSBbR1ZD
XQ0KDQpKb2luaW5nIGluZm86IEpvaW4gSGFuZ291dHMgTWVldA0KaHR0cHM6Ly9tZWV0Lmdvb2ds
ZS5jb20vZnpoLWt1dmktd3FvDQoNCkpvaW4gYnkgcGhvbmUNCisxIDQwNi02ODYtMzgyNiAoUElO
OiAyMTQwOTIpDQoNCk1vcmUgcGhvbmUgbnVtYmVyczogaHR0cHM6Ly90ZWwubWVldC9memgta3V2
aS13cW8/cGluPTM5OTk2MTgyNTkzNzEmaHM9MA0KDQpXaG86DQogICAgICogcmhhbmxleUBnb29n
bGUuY29tIC0gb3JnYW5pemVyDQogICAgICogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQogICAg
ICogbmVsYWRrQG1pY3Jvc29mdC5jb20NCiAgICAgKiBBbGFuIE1pbW1zDQogICAgICogSmFzb24g
WVggQ2hhbmcvV1lIUS9XaXd5bm4NCiAgICAgKiBMdWtlIENoZW4NCiAgICAgKiBEb25nIFdlaQ0K
ICAgICAqIEJ1ZGR5IEh1YW5nICjpu4PlpKnptLspDQogICAgICogTWF0dXN6Y3phaywgUGlvdHIN
CiAgICAgKiBGcmFuIEhzdSAo5b6Q6KqM6KyZKQ0KICAgICAqIGpvc2h1YV9naWxlc0BkZWxsLmNv
bQ0KICAgICAqIFZpamF5IEtoZW1rYQ0KICAgICAqIGRocnV2YXJhakBnbWFpbC5jb20NCg==
--000000000000bd5f68059dd9328e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/EmailMessage"><p itemprop=3D"=
description">I&#39;m going to make a change to this meetings agenda based o=
n the feedback from yesterday&#39;s meeting. <p>I think we need to start ta=
lking about the design of an aggregator data model. The features of that da=
ta model should heavily inform both the presentation layer and the process =
of importing child nodes, and I don&#39;t think we will make much progress =
talking about presentation layers until there is something concrete with th=
e data model.<p>As always though, if you have some features or use cases th=
at hasn&#39;t been considered so far, feel free to bring them up.  <p>Thank=
s,<br>Richard</p></span><span itemscope itemtype=3D"http://schema.org/Infor=
mAction"><span style=3D"display:none" itemprop=3D"about" itemscope itemtype=
=3D"http://schema.org/EmailMessage"><meta itemprop=3D"description" content=
=3D"rhanley@google.com: I&#39;m going to make a change to this meetings age=
nda based on the feedback from yesterday&#39;s meeting. I think we need to =
start talking about the design of an aggregator data model. The features of=
 that data model should heavily inform both the presentation layer and the =
process of importing child nodes, and I don&#39;t think we will make much p=
rogress talking about presentation layers until there is something concrete=
 with the data model. As always though, if you have some features or use ca=
ses that hasn&#39;t been considered so far, feel free to bring them up. Tha=
nks, Richard"/></span><span itemprop=3D"object" itemscope itemtype=3D"http:=
//schema.org/Event"><div style=3D""><table cellspacing=3D"0" cellpadding=3D=
"8" border=3D"0" summary=3D"" style=3D"width:100%;font-family:Arial,Sans-se=
rif;border:1px Solid #ccc;border-width:1px 2px 2px 1px;background-color:#ff=
f;"><tr><td><meta itemprop=3D"eventStatus" content=3D"http://schema.org/Eve=
ntScheduled"/><div style=3D"padding:2px"><span itemprop=3D"publisher" items=
cope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"name" co=
ntent=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleCalendar"=
 content=3D"2kk74abk2o7e0mandpebpcf66s"/><h3 style=3D"padding:0 0 6px 0;mar=
gin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:bold;color:#2=
22"><span itemprop=3D"name">BMC Aggregator Presentation Layer</span></h3><t=
able style=3D"display:inline-table" cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" summary=3D"Event details"><tr><td style=3D"padding:0 1em 10px 0;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap" v=
align=3D"top"><div><i style=3D"font-style:normal">When</i></div></td><td st=
yle=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#222" valign=3D"top"><time itemprop=3D"startDate" datetime=3D"20200206T18=
0000Z"></time><time itemprop=3D"endDate" datetime=3D"20200206T190000Z"></ti=
me>Thu Feb 6, 2020 10am =E2=80=93 11am <span style=3D"color:#888">Pacific T=
ime - Los Angeles</span></td></tr><tr><td style=3D"padding:0 1em 10px 0;fon=
t-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap" val=
ign=3D"top"><div><i style=3D"font-style:normal">Where</i></div></td><td sty=
le=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color=
:#222" valign=3D"top"><span itemprop=3D"location" itemscope itemtype=3D"htt=
p://schema.org/Place"><span itemprop=3D"name" class=3D"notranslate">SVL-MAT=
3-4-Saturn (5) [GVC]</span><span dir=3D"ltr"> (<a href=3D"https://www.googl=
e.com/maps/search/SVL-MAT3-4-Saturn+%285%29+%5BGVC%5D?hl=3Den" style=3D"col=
or:#20c;white-space:nowrap" target=3D"_blank" itemprop=3D"map">map</a>)</sp=
an></span></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial=
,Sans-serif;font-size:13px;color:#888;white-space:nowrap" valign=3D"top"><d=
iv><i style=3D"font-style:normal">Joining info</i></div></td><td style=3D"p=
adding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" =
valign=3D"top"><span itemprop=3D"potentialaction" itemscope itemtype=3D"htt=
p://schema.org/JoinAction"><span itemprop=3D"name" content=3D"meet.google.c=
om/fzh-kuvi-wqo"><span itemprop=3D"target" itemscope itemtype=3D"http://sch=
ema.org/EntryPoint"><span itemprop=3D"url" content=3D"https://meet.google.c=
om/fzh-kuvi-wqo"><span itemprop=3D"httpMethod" content=3D"GET"><a href=3D"h=
ttps://meet.google.com/fzh-kuvi-wqo" style=3D"color:#20c;white-space:nowrap=
" target=3D"_blank">meet.google.com/fzh-kuvi-wqo</a></span></span></span></=
span></span></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Ari=
al,Sans-serif;font-size:13px;color:#888;white-space:nowrap"></td><td><table=
 cellspacing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-bottom:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><span=
 style=3D"color:#888">Join by phone <a href=3D"tel:+1 406-686-3826" style=
=3D"color:#20c;white-space:nowrap" target=3D"_blank"><span itemprop=3D"phon=
eNumber">+1 406-686-3826</span></a><span itemprop=3D"rtcPhoneNumberPassCode=
Label">&nbsp; PIN</span><span itemprop=3D"passCode"> 214092#</span>&nbsp; <=
a href=3D"https://tel.meet/fzh-kuvi-wqo?pin=3D3999618259371&amp;hs=3D0" sty=
le=3D"color:#20c;white-space:nowrap" target=3D"_blank">More phone numbers</=
a></span></td></tr></table></td></tr><tr><td style=3D"padding:0 1em 10px 0;=
font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap" =
valign=3D"top"><div><i style=3D"font-style:normal">Who</i></div></td><td st=
yle=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#222" valign=3D"top"><table cellspacing=3D"0" cellpadding=3D"0"><tr><td s=
tyle=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#222"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></=
td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:1=
3px;color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"at=
tendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"n=
ame" class=3D"notranslate">rhanley@google.com</span><meta itemprop=3D"email=
" content=3D"rhanley@google.com"/></span><span itemprop=3D"organizer" items=
cope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=
=3D"rhanley@google.com"/><meta itemprop=3D"email" content=3D"rhanley@google=
.com"/></span><span style=3D"font-size:11px;color:#888"> - organizer</span>=
</div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222"><span style=3D"font-family:Courier N=
ew,monospace">&#x2022;</span></td><td style=3D"padding-right:10px;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=3D"margin:0 =
0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.=
org/Person"><span itemprop=3D"name" class=3D"notranslate">openbmc@lists.ozl=
abs.org</span><meta itemprop=3D"email" content=3D"openbmc@lists.ozlabs.org"=
/></span></div></div></td></tr><tr><td style=3D"padding-right:10px;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D"font-family:=
Courier New,monospace">&#x2022;</span></td><td style=3D"padding-right:10px;=
font-family:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=3D"=
margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http:=
//schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">neladk@m=
icrosoft.com</span><meta itemprop=3D"email" content=3D"neladk@microsoft.com=
"/></span></div></div></td></tr><tr><td style=3D"padding-right:10px;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D"font-family=
:Courier New,monospace">&#x2022;</span></td><td style=3D"padding-right:10px=
;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=3D=
"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Alan Mi=
mms</span><meta itemprop=3D"email" content=3D"alan_mimms@jabil.com"/></span=
></div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:Aria=
l,Sans-serif;font-size:13px;color:#222"><span style=3D"font-family:Courier =
New,monospace">&#x2022;</span></td><td style=3D"padding-right:10px;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=3D"margin:0=
 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema=
.org/Person"><span itemprop=3D"name" class=3D"notranslate">Jason YX Chang/W=
YHQ/Wiwynn</span><meta itemprop=3D"email" content=3D"jason_yx_chang@wiwynn.=
com"/></span></div></div></td></tr><tr><td style=3D"padding-right:10px;font=
-family:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D"font-fam=
ily:Courier New,monospace">&#x2022;</span></td><td style=3D"padding-right:1=
0px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=
=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"h=
ttp://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Luke=
 Chen</span><meta itemprop=3D"email" content=3D"luke_chen@aspeedtech.com"/>=
</span></div></div></td></tr><tr><td style=3D"padding-right:10px;font-famil=
y:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D"font-family:Co=
urier New,monospace">&#x2022;</span></td><td style=3D"padding-right:10px;fo=
nt-family:Arial,Sans-serif;font-size:13px;color:#222"><div><div style=3D"ma=
rgin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://=
schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Dong Wei</=
span><meta itemprop=3D"email" content=3D"dong.wei@arm.com"/></span></div></=
div></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-se=
rif;font-size:13px;color:#222"><span style=3D"font-family:Courier New,monos=
pace">&#x2022;</span></td><td style=3D"padding-right:10px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222"><div><div style=3D"margin:0 0 0.3em =
0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Pers=
on"><span itemprop=3D"name" class=3D"notranslate">Buddy Huang (=E9=BB=83=E5=
=A4=A9=E9=B4=BB)</span><meta itemprop=3D"email" content=3D"buddy.huang@quan=
tatw.com"/></span></div></div></td></tr><tr><td style=3D"padding-right:10px=
;font-family:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D"fon=
t-family:Courier New,monospace">&#x2022;</span></td><td style=3D"padding-ri=
ght:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div><div =
style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
>Matuszczak, Piotr</span><meta itemprop=3D"email" content=3D"piotr.matuszcz=
ak@intel.com"/></span></div></div></td></tr><tr><td style=3D"padding-right:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><span style=3D=
"font-family:Courier New,monospace">&#x2022;</span></td><td style=3D"paddin=
g-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div><=
div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope item=
type=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransl=
ate">Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99)</span><meta itemprop=3D"email" =
content=3D"fran.hsu@quantatw.com"/></span></div></div></td></tr><tr><td sty=
le=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:=
#222"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></td=
><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13p=
x;color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate">joshua_giles@dell.com</span><meta itemprop=3D"emai=
l" content=3D"joshua_giles@dell.com"/></span></div></div></td></tr><tr><td =
style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;col=
or:#222"><span style=3D"font-family:Courier New,monospace">&#x2022;</span><=
/td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:=
13px;color:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"a=
ttendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"=
name" class=3D"notranslate">Vijay Khemka</span><meta itemprop=3D"email" con=
tent=3D"vijaykhemka@fb.com"/></span></div></div></td></tr><tr><td style=3D"=
padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222">=
<span style=3D"font-family:Courier New,monospace">&#x2022;</span></td><td s=
tyle=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#222"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" =
itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" cla=
ss=3D"notranslate">dhruvaraj@gmail.com</span><meta itemprop=3D"email" conte=
nt=3D"dhruvaraj@gmail.com"/></span></div></div></td></tr></table></td></tr>=
</table><div style=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font=
-size:13px;color:#222;white-space:pre-wrap!important;white-space:-moz-pre-w=
rap!important;white-space:-pre-wrap!important;white-space:-o-pre-wrap!impor=
tant;white-space:pre;word-wrap:break-word"><span>Sorry for the delay in put=
ting together this follow up meeting.<p>We made some progress in hashing ou=
t some of the requirements of a BMC aggregator in our last meeting. </p><p>=
However, one of the issues that needs more discussion is what features are =
needed in a presentation layer for this aggregator.</p><p>I think this disc=
ussion is one of the biggest blockers before we can trading any designs, an=
d I look forward to hearing about any use cases that people are considering=
.</p><p>(P.S. I will be creating a second meeting that is more amenable to =
Asian timezones)</p></span><meta itemprop=3D"description" content=3D"Sorry =
for the delay in putting together this follow up meeting.

We made some progress in hashing out some of the requirements of a BMC aggr=
egator in our last meeting.=20

However, one of the issues that needs more discussion is what features are =
needed in a presentation layer for this aggregator.

I think this discussion is one of the biggest blockers before we can tradin=
g any designs, and I look forward to hearing about any use cases that peopl=
e are considering.

(P.S. I will be creating a second meeting that is more amenable to Asian ti=
mezones)"/></div></div></td></tr></table></div></span></span>
--000000000000bd5f68059dd9328e--
