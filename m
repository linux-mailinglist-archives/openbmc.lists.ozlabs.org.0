Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379514E624
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 00:41:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487xhH3xK0zDqTs
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 10:41:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=calendar-server.bounces.google.com
 (client-ip=2607:f8b0:4864:20::149; helo=mail-il1-x149.google.com;
 envelope-from=3wmkzxgckb_ekatgexrzhhzex.vhfhixgufveblml.hsetul.hkz@calendar-server.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=l4ZL9YHl; dkim-atps=neutral
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com
 [IPv6:2607:f8b0:4864:20::149])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487xfs0ZrJzDqc8
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 10:40:13 +1100 (AEDT)
Received: by mail-il1-x149.google.com with SMTP id d3so3929924ilg.20
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 15:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
 :from:to; bh=h8nP49Q41LaTruDuqfpN2CeA7N1zcOX/71K7Cb5MUz8=;
 b=l4ZL9YHl6Ab6c1zjHEgayzdyJwH+jeyw36QozkWg2XSlFU0nrlP4GzPVWInJ9OjEoz
 z70a3C96hmCGX+0XDtbiK28WrORWyVT+KslffRxQtcsN3q3WHd3e+0iU0WTIc+Vzvhdj
 3OLI6dsYbMxVgNx4U8kxtEgBHBXxRgHOVUuPvyriEykN0Zfu9VwO3TpQ0ve2O0qMNsWZ
 lUQwJhDbs5cBG93FqolUv5Qv1ZdfEOFW7+d6nM5IkO1a+A+Jsf4rz56mTRPAzLc/a0oQ
 OJ2gU4z9/SIQa+6m6FJo/uQocRcHr576mrtUP3a9GKF+Ynk81hbmd2PEcRJPpMY4Tm6h
 8pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
 :message-id:date:subject:from:to;
 bh=h8nP49Q41LaTruDuqfpN2CeA7N1zcOX/71K7Cb5MUz8=;
 b=hd0pszkZTZOXuc54ZnuNiyNQj3mOTGcbn6sdkJ95EFZQWz513xB0En/qaH2BhgM333
 S7BpXkIcfYClW7G0yPJi/M4+tUaDp2dHK4ZBw94MGjng6nbhA3g3DTljc0an2Yj/2LUf
 ixVU9AQZ3OI5NDPRutYuICAg2gaPQrJ/ZzjAM8akRhbKJsp+j1r70lfZ0mtlIwAM1S2o
 qv3MXW4cdwpNFhFVX++IcwYm5m3ugpBq9BDhH3SNueTYeSUE3esQ/g82fyKfDjfXKKhm
 Bek9dL6moW2qg5QdFSUdF8mA17VnYaURUGLQc9eeujmMy8AhjwnOVHEkOrpx+uOPIzdK
 6Mkg==
X-Gm-Message-State: APjAAAWuYf/aXZUbT2yBM4+RQsDOxXXO4e3f5Tsj0lqZfkAGi65TDkGi
 HWib3GP3Upid6VObUD9Am2VgO+3WC/AK4lToccwxFMEJBargY3VbaKINIGio+yRbUDK9RBJz2ez
 zu0DfKV72f+rD8ap+3PBd6BkNIa0ptanJasG/SHW0rHEqx0WTdMN/CWOycRNzbLNrpyFDziFjcU
 Yu/Q==
X-Google-Smtp-Source: APXvYqx28rM5tKrQCgofMgphjgPUdIlDevlW6oCqzBqPTwMs/Zcs8phB0MV1B5JaldpF4M7cUOuhZbDX7TcxJvLvxS08
MIME-Version: 1.0
X-Received: by 2002:a6b:6b0e:: with SMTP id g14mr6284720ioc.71.1580427610384; 
 Thu, 30 Jan 2020 15:40:10 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <0000000000004fd25e059d63fa81@google.com>
Date: Thu, 30 Jan 2020 23:40:10 +0000
Subject: Updated invitation: BMC Aggregator Review @ Tue Feb 4, 2020 9:30pm -
 10:30pm (PST) (openbmc@lists.ozlabs.org)
From: rhanley@google.com
To: openbmc@lists.ozlabs.org, vishwa@linux.vnet.ibm.com
Content-Type: multipart/mixed; boundary="0000000000004fd244059d63fa80"
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

--0000000000004fd244059d63fa80
Content-Type: multipart/alternative; boundary="0000000000004fd242059d63fa7e"

--0000000000004fd242059d63fa7e
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjaGFuZ2VkLg0KDQpUaXRsZTogQk1DIEFnZ3JlZ2F0b3IgUmV2
aWV3DQpJIHdhbnRlZCB0byBnaXZlIGEgY2hhbmNlIGZvciBwZW9wbGUgYWNyb3NzIHRoZSBQYWNp
ZmljIHRvIGdpdmUgZmVlZGJhY2sgIA0KZm9yIGEgQk1DIGFnZ3JlZ2F0b3IuDQoNCldlIHdpbGwg
Y292ZXIgdGhlIGRpc2N1c3Npb25zIGZyb20gb3VyIGxhc3QgbWVldGluZywgYXMgd2VsbCBhcyAg
DQpyZXF1aXJlbWVudHMgZm9yIHRoZSBpbnRlcmZhY2UgdGhhdCBpcyBwcmVzZW50ZWQgdG8gdGhl
IG91dHNpZGUgd29ybGQuDQpXaGVuOiBUdWUgRmViIDQsIDIwMjAgOTozMHBtIOKAkyAxMDozMHBt
IFBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzIChjaGFuZ2VkKQ0KV2hlcmU6IFNWTC1NQVQzLTQt
U2FuZGNhc3RsZSAoNCkgW0dWQ10NCg0KSm9pbmluZyBpbmZvOiBKb2luIEhhbmdvdXRzIE1lZXQN
Cmh0dHBzOi8vbWVldC5nb29nbGUuY29tL2lvaS1hcXdlLXdtcw0KDQpKb2luIGJ5IHBob25lDQor
MSA1MTMtNDQzLTQxMzkgKFBJTjogMjgzNDgzKQ0KDQpNb3JlIHBob25lIG51bWJlcnM6IGh0dHBz
Oi8vdGVsLm1lZXQvaW9pLWFxd2Utd21zP3Bpbj01NDg1MTE2MDE2MzY4JmhzPTANCg0KQ2FsZW5k
YXI6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KV2hvOg0KICAgICAqIHJoYW5sZXlAZ29vZ2xl
LmNvbSAtIG9yZ2FuaXplcg0KICAgICAqIG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KICAgICAq
IHZpc2h3YUBsaW51eC52bmV0LmlibS5jb20NCg0KRXZlbnQgZGV0YWlsczogIA0KaHR0cHM6Ly93
d3cuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9TTJzMFlqTjFjbXBx
WTNNNWNHVm1NbVYxYnpsaFlUZzNjM1lnYjNCbGJtSnRZMEJzYVhOMGN5NXZlbXhoWW5NdWIzSm4m
dG9rPU1UZ2pjbWhoYm14bGVVQm5iMjluYkdVdVkyOXRZMkptTTJZNVpUWTBNemhqWlRFd1pqSmhN
RE5sWTJZMFlqVmpOek0yTTJJMU9Ea3dOelV6TmcmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZo
bD1lbiZlcz0wDQoNCkludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vd3d3
Lmdvb2dsZS5jb20vY2FsZW5kYXIvDQoNCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgY291cnRlc3kg
ZW1haWwgYXQgdGhlIGFjY291bnQgIA0Kb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIGJlY2F1c2Ug
eW91IGFyZSBhbiBhdHRlbmRlZSBvZiB0aGlzIGV2ZW50Lg0KDQpUbyBzdG9wIHJlY2VpdmluZyBm
dXR1cmUgdXBkYXRlcyBmb3IgdGhpcyBldmVudCwgZGVjbGluZSB0aGlzIGV2ZW50LiAgDQpBbHRl
cm5hdGl2ZWx5IHlvdSBjYW4gc2lnbiB1cCBmb3IgYSBHb29nbGUgYWNjb3VudCBhdCAgDQpodHRw
czovL3d3dy5nb29nbGUuY29tL2NhbGVuZGFyLyBhbmQgY29udHJvbCB5b3VyIG5vdGlmaWNhdGlv
biBzZXR0aW5ncyBmb3IgIA0KeW91ciBlbnRpcmUgY2FsZW5kYXIuDQoNCkZvcndhcmRpbmcgdGhp
cyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2VuZCBhIHJlc3BvbnNl
IHRvICANCnRoZSBvcmdhbml6ZXIgYW5kIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBvciBp
bnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3MgIA0Kb2YgdGhlaXIgb3duIGludml0YXRpb24gc3RhdHVz
LCBvciB0byBtb2RpZnkgeW91ciBSU1ZQLiBMZWFybiBtb3JlIGF0ICANCmh0dHBzOi8vc3VwcG9y
dC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--0000000000004fd242059d63fa7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Th=
ing/Clock"><meta itemprop=3D"description" content=3D"Time updated"/></span>=
<span itemprop=3D"object" itemscope itemtype=3D"http://schema.org/Event"><d=
iv style=3D""><table cellspacing=3D"0" cellpadding=3D"8" border=3D"0" summa=
ry=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;border:1px Solid #=
ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><tr><td><meta item=
prop=3D"eventStatus" content=3D"http://schema.org/EventRescheduled"/><h4 st=
yle=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial,Sans-serif;font-siz=
e:13px;line-height:1.4;border:1px Solid #fff;background:#fff;color:#090;fon=
t-weight:normal"><strong>This event has been changed.</strong></h4><div sty=
le=3D"padding:2px"><span itemprop=3D"publisher" itemscope itemtype=3D"http:=
//schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calend=
ar"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"3k4b3urjjc=
s9pef2euo9aa87sv"/><h3 style=3D"padding:0 0 6px 0;margin:0;font-family:Aria=
l,Sans-serif;font-size:16px;font-weight:bold;color:#222"><span itemprop=3D"=
name">BMC Aggregator Review</span></h3><table style=3D"display:inline-table=
" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" summary=3D"Event details=
"><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-s=
ize:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i s=
tyle=3D"font-style:normal">When</i></div></td><td style=3D"padding-bottom:1=
0px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top">=
<div style=3D"text-indent:-1px"><strong style=3D"color:#080">Changed: </str=
ong><time itemprop=3D"startDate" datetime=3D"20200205T053000Z"></time><time=
 itemprop=3D"endDate" datetime=3D"20200205T063000Z"></time>Tue Feb 4, 2020 =
9:30pm =E2=80=93 10:30pm <span style=3D"color:#888">Pacific Time - Los Ange=
les</span></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family=
:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" =
valign=3D"top"><div><i style=3D"font-style:normal">Where</i></div></td><td =
style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;co=
lor:#222" valign=3D"top"><div style=3D"text-indent:-1px"><span itemprop=3D"=
location" itemscope itemtype=3D"http://schema.org/Place"><span itemprop=3D"=
name" class=3D"notranslate">SVL-MAT3-4-Sandcastle (4) [GVC]</span><span dir=
=3D"ltr"> (<a href=3D"https://www.google.com/maps/search/SVL-MAT3-4-Sandcas=
tle+%284%29+%5BGVC%5D?hl=3Den" style=3D"color:#20c;white-space:nowrap" targ=
et=3D"_blank" itemprop=3D"map">map</a>)</span></span></div></td></tr><tr><t=
d style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px=
;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"=
font-style:normal">Joining info</i></div></td><td style=3D"padding-bottom:1=
0px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top">=
<div style=3D"text-indent:-1px"><span itemprop=3D"potentialaction" itemscop=
e itemtype=3D"http://schema.org/JoinAction"><span itemprop=3D"name" content=
=3D"meet.google.com/ioi-aqwe-wms"><span itemprop=3D"target" itemscope itemt=
ype=3D"http://schema.org/EntryPoint"><span itemprop=3D"url" content=3D"http=
s://meet.google.com/ioi-aqwe-wms"><span itemprop=3D"httpMethod" content=3D"=
GET"><a href=3D"https://meet.google.com/ioi-aqwe-wms" style=3D"color:#20c;w=
hite-space:nowrap" target=3D"_blank">meet.google.com/ioi-aqwe-wms</a></span=
></span></span></span></span></div></td></tr><tr><td style=3D"padding:0 1em=
 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:=
nowrap;width:90px"></td><td><div style=3D"text-indent:-1px"><table cellspac=
ing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-bottom:10px;font-famil=
y:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"=
text-indent:-1px"><span style=3D"color:#888">Join by phone <a href=3D"tel:+=
1 513-443-4139" style=3D"color:#20c;white-space:nowrap" target=3D"_blank"><=
span itemprop=3D"phoneNumber">+1 513-443-4139</span></a><span itemprop=3D"r=
tcPhoneNumberPassCodeLabel">&nbsp; PIN</span><span itemprop=3D"passCode"> 2=
83483#</span>&nbsp; <a href=3D"https://tel.meet/ioi-aqwe-wms?pin=3D54851160=
16368&amp;hs=3D0" style=3D"color:#20c;white-space:nowrap" target=3D"_blank"=
>More phone numbers</a></span></div></td></tr></table></div></td></tr><tr><=
td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13p=
x;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D=
"font-style:normal">Calendar</i></div></td><td style=3D"padding-bottom:10px=
;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><di=
v style=3D"text-indent:-1px">openbmc@lists.ozlabs.org</div></td></tr><tr><t=
d style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px=
;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"=
font-style:normal">Who</i></div></td><td style=3D"padding-bottom:10px;font-=
family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><table ce=
llspacing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-right:10px;font-=
family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D=
"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#x202=
2;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-=
serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div =
style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
>rhanley@google.com</span><meta itemprop=3D"email" content=3D"rhanley@googl=
e.com"/></span><span itemprop=3D"organizer" itemscope itemtype=3D"http://sc=
hema.org/Person"><meta itemprop=3D"name" content=3D"rhanley@google.com"/><m=
eta itemprop=3D"email" content=3D"rhanley@google.com"/></span><span style=
=3D"font-size:11px;color:#888"> - organizer</span></div></div></div></td></=
tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-si=
ze:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span style=
=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0">=
<span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"=
><span itemprop=3D"name" class=3D"notranslate">openbmc@lists.ozlabs.org</sp=
an><meta itemprop=3D"email" content=3D"openbmc@lists.ozlabs.org"/></span></=
div></div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:A=
rial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-in=
dent:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span=
></div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;fo=
nt-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D=
"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">vishwa@=
linux.vnet.ibm.com</span><meta itemprop=3D"email" content=3D"vishwa@linux.v=
net.ibm.com"/></span></div></div></div></td></tr></table></td></tr></table>=
<div style=3D"float:right;font-weight:bold;font-size:13px"> <a href=3D"http=
s://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DM2s0YjN1cmpqY3M5c=
GVmMmV1bzlhYTg3c3Ygb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DMTgjcmhhbmxle=
UBnb29nbGUuY29tY2JmM2Y5ZTY0MzhjZTEwZjJhMDNlY2Y0YjVjNzM2M2I1ODkwNzUzNg&amp;c=
tz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;whit=
e-space:nowrap" itemprop=3D"url">more details &raquo;</a><br></div><div sty=
le=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-size:13px;color=
:#222;white-space:pre-wrap!important;white-space:-moz-pre-wrap!important;wh=
ite-space:-pre-wrap!important;white-space:-o-pre-wrap!important;white-space=
:pre;word-wrap:break-word"><span>I wanted to give a chance for people acros=
s the Pacific to give feedback for a BMC aggregator.  <p>We will cover the =
discussions from our last meeting, as well as requirements for the interfac=
e that is presented to the outside world.</p></span><meta itemprop=3D"descr=
iption" content=3D"I wanted to give a chance for people across the Pacific =
to give feedback for a BMC aggregator. =20

We will cover the discussions from our last meeting, as well as requirement=
s for the interface that is presented to the outside world."/></div></div><=
p style=3D"color:#222;font-size:13px;margin:0"><span style=3D"color:#888">G=
oing (openbmc@lists.ozlabs.org)?&nbsp;&nbsp;&nbsp;</span><wbr><strong><span=
 itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpA=
ction"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAtten=
dance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.=
org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/=
HttpRequestMethod/GET"/><a href=3D"https://www.google.com/calendar/event?ac=
tion=3DRESPOND&amp;eid=3DM2s0YjN1cmpqY3M5cGVmMmV1bzlhYTg3c3Ygb3BlbmJtY0BsaX=
N0cy5vemxhYnMub3Jn&amp;rst=3D1&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tY2JmM2=
Y5ZTY0MzhjZTEwZjJhMDNlY2Y0YjVjNzM2M2I1ODkwNzUzNg&amp;ctz=3DAmerica%2FLos_An=
geles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemp=
rop=3D"url">Yes</a></span></span><span style=3D"margin:0 0.4em;font-weight:=
normal"> - </span><span itemprop=3D"potentialaction" itemscope itemtype=3D"=
http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http=
://schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope i=
temtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" h=
ref=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.goo=
gle.com/calendar/event?action=3DRESPOND&amp;eid=3DM2s0YjN1cmpqY3M5cGVmMmV1b=
zlhYTg3c3Ygb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;rst=3D3&amp;tok=3DMTgjcmhhb=
mxleUBnb29nbGUuY29tY2JmM2Y5ZTY0MzhjZTEwZjJhMDNlY2Y0YjVjNzM2M2I1ODkwNzUzNg&a=
mp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;=
white-space:nowrap" itemprop=3D"url">Maybe</a></span></span><span style=3D"=
margin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"potentialact=
ion" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"=
attendance" content=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=
=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><li=
nk itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><a=
 href=3D"https://www.google.com/calendar/event?action=3DRESPOND&amp;eid=3DM=
2s0YjN1cmpqY3M5cGVmMmV1bzlhYTg3c3Ygb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;rst=
=3D2&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tY2JmM2Y5ZTY0MzhjZTEwZjJhMDNlY2Y0=
YjVjNzM2M2I1ODkwNzUzNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=
=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">No</a></span=
></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a href=3D"https://www.google=
.com/calendar/event?action=3DVIEW&amp;eid=3DM2s0YjN1cmpqY3M5cGVmMmV1bzlhYTg=
3c3Ygb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29=
tY2JmM2Y5ZTY0MzhjZTEwZjJhMDNlY2Y0YjVjNzM2M2I1ODkwNzUzNg&amp;ctz=3DAmerica%2=
FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap=
" itemprop=3D"url">more options &raquo;</a></p></td></tr><tr><td style=3D"b=
ackground-color:#f6f6f6;color:#888;border-top:1px Solid #ccc;font-family:Ar=
ial,Sans-serif;font-size:11px"><p>Invitation from <a href=3D"https://www.go=
ogle.com/calendar/" target=3D"_blank" style=3D"">Google Calendar</a></p><p>=
You are receiving this courtesy email at the account openbmc@lists.ozlabs.o=
rg because you are an attendee of this event.</p><p>To stop receiving futur=
e updates for this event, decline this event. Alternatively you can sign up=
 for a Google account at https://www.google.com/calendar/ and control your =
notification settings for your entire calendar.</p><p>Forwarding this invit=
ation could allow any recipient to send a response to the organizer and be =
added to the guest list, or invite others regardless of their own invitatio=
n status, or to modify your RSVP. <a href=3D"https://support.google.com/cal=
endar/answer/37135#forwarding">Learn More</a>.</p></td></tr></table></div><=
/span></span>
--0000000000004fd242059d63fa7e
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20200205T053000Z
DTEND:20200205T063000Z
DTSTAMP:20200130T234010Z
ORGANIZER;CN=rhanley@google.com:mailto:rhanley@google.com
UID:3k4b3urjjcs9pef2euo9aa87sv@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=openbmc@lists.ozlabs.org;X-NUM-GUESTS=0:mailto:openbmc@lists.ozlabs
 .org
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE;C
 N=SVL-MAT3-4-Sandcastle (4) [GVC];X-NUM-GUESTS=0:mailto:google.com_726f6f6d
 5f75735f73766c5f6d6174335f345f346833@resource.calendar.google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=rhanley@google.com;X-NUM-GUESTS=0:mailto:rhanley@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=vishwa@linux.vnet.ibm.com;X-NUM-GUESTS=0:mailto:vishwa@linux.vnet.i
 bm.com
X-MICROSOFT-CDO-OWNERAPPTID:1399858652
CREATED:20200130T233956Z
DESCRIPTION:I wanted to give a chance for people across the Pacific to give
  feedback for a BMC aggregator.  \n\nWe will cover the discussions from our
  last meeting\, as well as requirements for the interface that is presented
  to the outside world.\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nPlease do not edit this section of 
 the description.\n\nThis event has a video call.\nJoin: https://meet.google
 .com/ioi-aqwe-wms\n+1 513-443-4139 PIN: 283483#\nView more phone numbers: h
 ttps://tel.meet/ioi-aqwe-wms?pin=5485116016368&hs=7\n\nView your event at h
 ttps://www.google.com/calendar/event?action=VIEW&eid=M2s0YjN1cmpqY3M5cGVmMm
 V1bzlhYTg3c3Ygb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&tok=MTgjcmhhbmxleUBnb29nbGUu
 Y29tY2JmM2Y5ZTY0MzhjZTEwZjJhMDNlY2Y0YjVjNzM2M2I1ODkwNzUzNg&ctz=America%2FLo
 s_Angeles&hl=en&es=0.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200130T234009Z
LOCATION:SVL-MAT3-4-Sandcastle (4) [GVC]
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:BMC Aggregator Review
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000004fd242059d63fa7e--

--0000000000004fd244059d63fa80
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjAwMjA1VDA1MzAwMFoNCkRURU5EOjIwMjAwMjA1
VDA2MzAwMFoNCkRUU1RBTVA6MjAyMDAxMzBUMjM0MDEwWg0KT1JHQU5JWkVSO0NOPXJoYW5sZXlA
Z29vZ2xlLmNvbTptYWlsdG86cmhhbmxleUBnb29nbGUuY29tDQpVSUQ6M2s0YjN1cmpqY3M5cGVm
MmV1bzlhYTg3c3ZAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1vcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm9wZW5ibWNAbGlzdHMu
b3psYWJzDQogLm9yZw0KQVRURU5ERUU7Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQ
QU5UO1BBUlRTVEFUPUFDQ0VQVEVEO1JTVlA9VFJVRTtDDQogTj1TVkwtTUFUMy00LVNhbmRjYXN0
bGUgKDQpIFtHVkNdO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpnb29nbGUuY29tXzcyNmY2ZjZkDQog
NWY3NTczNWY3Mzc2NmM1ZjZkNjE3NDMzNWYzNDVmMzQ2ODMzQHJlc291cmNlLmNhbGVuZGFyLmdv
b2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPUFDQ0VQVEVEO1JTVlA9VFJVRQ0KIDtDTj1yaGFubGV5QGdvb2dsZS5jb207WC1O
VU0tR1VFU1RTPTA6bWFpbHRvOnJoYW5sZXlAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlO
RElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
DQogVFJVRTtDTj12aXNod2FAbGludXgudm5ldC5pYm0uY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0
bzp2aXNod2FAbGludXgudm5ldC5pDQogYm0uY29tDQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBU
SUQ6MTM5OTg1ODY1Mg0KQ1JFQVRFRDoyMDIwMDEzMFQyMzM5NTZaDQpERVNDUklQVElPTjpJIHdh
bnRlZCB0byBnaXZlIGEgY2hhbmNlIGZvciBwZW9wbGUgYWNyb3NzIHRoZSBQYWNpZmljIHRvIGdp
dmUNCiAgZmVlZGJhY2sgZm9yIGEgQk1DIGFnZ3JlZ2F0b3IuICBcblxuV2Ugd2lsbCBjb3ZlciB0
aGUgZGlzY3Vzc2lvbnMgZnJvbSBvdXINCiAgbGFzdCBtZWV0aW5nXCwgYXMgd2VsbCBhcyByZXF1
aXJlbWVudHMgZm9yIHRoZSBpbnRlcmZhY2UgdGhhdCBpcyBwcmVzZW50ZWQNCiAgdG8gdGhlIG91
dHNpZGUgd29ybGQuXG5cbi06On46fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On4NCiA6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46On46fjo6LVxuUGxlYXNl
IGRvIG5vdCBlZGl0IHRoaXMgc2VjdGlvbiBvZiANCiB0aGUgZGVzY3JpcHRpb24uXG5cblRoaXMg
ZXZlbnQgaGFzIGEgdmlkZW8gY2FsbC5cbkpvaW46IGh0dHBzOi8vbWVldC5nb29nbGUNCiAuY29t
L2lvaS1hcXdlLXdtc1xuKzEgNTEzLTQ0My00MTM5IFBJTjogMjgzNDgzI1xuVmlldyBtb3JlIHBo
b25lIG51bWJlcnM6IGgNCiB0dHBzOi8vdGVsLm1lZXQvaW9pLWFxd2Utd21zP3Bpbj01NDg1MTE2
MDE2MzY4JmhzPTdcblxuVmlldyB5b3VyIGV2ZW50IGF0IGgNCiB0dHBzOi8vd3d3Lmdvb2dsZS5j
b20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU0yczBZak4xY21wcVkzTTVjR1ZtTW0N
CiBWMWJ6bGhZVGczYzNZZ2IzQmxibUp0WTBCc2FYTjBjeTV2ZW14aFluTXViM0puJnRvaz1NVGdq
Y21oaGJteGxlVUJuYjI5bmJHVXUNCiBZMjl0WTJKbU0yWTVaVFkwTXpoalpURXdaakpoTURObFky
WTBZalZqTnpNMk0ySTFPRGt3TnpVek5nJmN0ej1BbWVyaWNhJTJGTG8NCiBzX0FuZ2VsZXMmaGw9
ZW4mZXM9MC5cbi06On46fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjoNCiB+On46fjp+On46fjp+On46fjp+On46fjp+On46On46fjo6LQ0KTEFTVC1NT0RJRklF
RDoyMDIwMDEzMFQyMzQwMDlaDQpMT0NBVElPTjpTVkwtTUFUMy00LVNhbmRjYXN0bGUgKDQpIFtH
VkNdDQpTRVFVRU5DRTowDQpTVEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOkJNQyBBZ2dyZWdhdG9y
IFJldmlldw0KVFJBTlNQOk9QQVFVRQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K
--0000000000004fd244059d63fa80--
