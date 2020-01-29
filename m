Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5614D43D
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 01:00:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487L8308ghzDqTW
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 11:00:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::349;
 helo=mail-ot1-x349.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=X1Mv11aW; dkim-atps=neutral
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487L7M6WxQzDqNn
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 10:59:27 +1100 (AEDT)
Received: by mail-ot1-x349.google.com with SMTP id w17so715225otp.13
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 15:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:message-id:date:subject:from:to;
 bh=0s8TTuXBLmkMADlBi6Aj1xLh+XcNTNYfWmZuX+2Ij44=;
 b=X1Mv11aWytu+iT3M/BzNAtENImumBAU3ohecE0AOrAgqOnsx01W7FpAEAPWseikXCL
 oQkagc0eVUDQVjYPNhcLZRCzh3+lARop/dPfdphy+fr3kY/BPZYjqbGYAa29PSbLnQda
 1wE8y0VNS9IxItrhuDKRKf8IQn6U1RzprOTtPmSM9IveM3cCMOxLR2MFnLzrn997e6P+
 2H7/AMjDsGBxWEJZWNdKAOYHgIoPcZYQKRhdl8dQ5E49Do9FEBQ+dqWJabR3BSTvMILa
 R3MOpj7fNvvrXHxHEhyioVrQiDSN9UjysJlT/e3xLW81E0idwxbqBDIrT5bSvD51uNVd
 eXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
 :subject:from:to;
 bh=0s8TTuXBLmkMADlBi6Aj1xLh+XcNTNYfWmZuX+2Ij44=;
 b=BzLNf6LrRf75Aym/nzLBj73fOzTpfKqwwS1oPFL582/wTpxQgz+UZyrELuPFAheWcn
 VICF2jFyjBS0J4Re7AifBrhhJWfCWCvB2LvZW2Nl1QZ6/LfkE/QziEaZBQq4tzU3F3CZ
 SQBGBbQZ2dTA3c1+TYZpXR9WRfuLqtQbss6gqbLVp9CLAKvmNhrE7Ju3hWglO/L4KO1j
 0ZJKC9ztDqkSxB+A7hjVgcEzNksf3/quWfR20lAiLOWOZ/wCsICoosWWqmymS4XGV+9H
 Hi1EtDW+IsxY4X1MhkmI1ZaWFFXpIzYbk+w9LYpbgHSpU8pkLZQecu38KGVABNkBszhw
 trjg==
X-Gm-Message-State: APjAAAVKM1bjNJot/mqLs2i1ftrpD0blXtbcrQY5Te8vqJ4PsgsV/huY
 qkwronGRdWGevCBeTJTWyUKPaclcuU0rVur5b1s2FXaYm9d9Pa2OvdSMtx6xXFG+IUDpkmcQ7bi
 J5eqGm6KYuMJ8Ae/RzHPD0MbbakbENLqex0NxDtNNRs0dk9Bm74wWKL8NRR4Tpa0QPc3hbS869Z
 jTSg==
X-Google-Smtp-Source: APXvYqz/N38xW4TIIXVqpp1X+hyqw32UuKejdrF3HbPCVDpYbsYVype+Bmttx+06o4wolZ5GiYgK7aFBUqdTYqb7R8XN
MIME-Version: 1.0
X-Received: by 2002:aca:190a:: with SMTP id l10mr1132167oii.56.1580342362949; 
 Wed, 29 Jan 2020 15:59:22 -0800 (PST)
Message-ID: <0000000000002b849a059d50210d@google.com>
Date: Wed, 29 Jan 2020 23:59:22 +0000
Subject: Invitation: BMC Aggregator Presentation Layer @ Thu Feb 6, 2020 10am
 - 11am (PST) (openbmc@lists.ozlabs.org)
From: rhanley@google.com
To: openbmc@lists.ozlabs.org, neladk@microsoft.com
Content-Type: multipart/mixed; boundary="0000000000002b846b059d50210c"
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

--0000000000002b846b059d50210c
Content-Type: multipart/alternative; boundary="0000000000002b8466059d50210a"

--0000000000002b8466059d50210a
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiBC
TUMgQWdncmVnYXRvciBQcmVzZW50YXRpb24gTGF5ZXINClNvcnJ5IGZvciB0aGUgZGVsYXkgaW4g
cHV0dGluZyB0b2dldGhlciB0aGlzIGZvbGxvdyB1cCBtZWV0aW5nLg0KDQpXZSBtYWRlIHNvbWUg
cHJvZ3Jlc3MgaW4gaGFzaGluZyBvdXQgc29tZSBvZiB0aGUgcmVxdWlyZW1lbnRzIG9mIGEgQk1D
ICANCmFnZ3JlZ2F0b3IgaW4gb3VyIGxhc3QgbWVldGluZy4NCg0KSG93ZXZlciwgb25lIG9mIHRo
ZSBpc3N1ZXMgdGhhdCBuZWVkcyBtb3JlIGRpc2N1c3Npb24gaXMgd2hhdCBmZWF0dXJlcyBhcmUg
IA0KbmVlZGVkIGluIGEgcHJlc2VudGF0aW9uIGxheWVyIGZvciB0aGlzIGFnZ3JlZ2F0b3IuDQoN
CkkgdGhpbmsgdGhpcyBkaXNjdXNzaW9uIGlzIG9uZSBvZiB0aGUgYmlnZ2VzdCBibG9ja2VycyBi
ZWZvcmUgd2UgY2FuICANCnRyYWRpbmcgYW55IGRlc2lnbnMsIGFuZCBJIGxvb2sgZm9yd2FyZCB0
byBoZWFyaW5nIGFib3V0IGFueSB1c2UgY2FzZXMgdGhhdCAgDQpwZW9wbGUgYXJlIGNvbnNpZGVy
aW5nLg0KDQooUC5TLiBJIHdpbGwgYmUgY3JlYXRpbmcgYSBzZWNvbmQgbWVldGluZyB0aGF0IGlz
IG1vcmUgYW1lbmFibGUgdG8gQXNpYW4gIA0KdGltZXpvbmVzKQ0KV2hlbjogVGh1IEZlYiA2LCAy
MDIwIDEwYW0g4oCTIDExYW0gUGFjaWZpYyBUaW1lIC0gTG9zIEFuZ2VsZXMNCldoZXJlOiBTVkwt
TUFUMy00LVNhdHVybiAoNSkgW0dWQ10NCg0KSm9pbmluZyBpbmZvOiBKb2luIEhhbmdvdXRzIE1l
ZXQNCmh0dHBzOi8vbWVldC5nb29nbGUuY29tL2Z6aC1rdXZpLXdxbw0KDQpKb2luIGJ5IHBob25l
DQorMSA0MDYtNjg2LTM4MjYgKFBJTjogMjE0MDkyKQ0KDQpNb3JlIHBob25lIG51bWJlcnM6IGh0
dHBzOi8vdGVsLm1lZXQvZnpoLWt1dmktd3FvP3Bpbj0zOTk5NjE4MjU5MzcxJmhzPTANCg0KQ2Fs
ZW5kYXI6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KV2hvOg0KICAgICAqIHJoYW5sZXlAZ29v
Z2xlLmNvbSAtIG9yZ2FuaXplcg0KICAgICAqIG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KICAg
ICAqIG5lbGFka0BtaWNyb3NvZnQuY29tDQoNCkV2ZW50IGRldGFpbHM6ICANCmh0dHBzOi8vd3d3
Lmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU1tdHJOelJoWW1zeWJ6
ZGxNRzFoYm1Sd1pXSndZMlkyTm5NZ2IzQmxibUp0WTBCc2FYTjBjeTV2ZW14aFluTXViM0puJnRv
az1NVGdqY21oaGJteGxlVUJuYjI5bmJHVXVZMjl0WXpJNFlXWTJNek0xWldVd01qY3dOMkZsWW1F
d01HRXdOMlZpWW1Wak56Sm1OVGhtWlRSa09BJmN0ej1BbWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9
ZW4mZXM9MA0KDQpJbnZpdGF0aW9uIGZyb20gR29vZ2xlIENhbGVuZGFyOiBodHRwczovL3d3dy5n
b29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGNvdXJ0ZXN5IGVt
YWlsIGF0IHRoZSBhY2NvdW50ICANCm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyBiZWNhdXNlIHlv
dSBhcmUgYW4gYXR0ZW5kZWUgb2YgdGhpcyBldmVudC4NCg0KVG8gc3RvcCByZWNlaXZpbmcgZnV0
dXJlIHVwZGF0ZXMgZm9yIHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4gIA0KQWx0ZXJu
YXRpdmVseSB5b3UgY2FuIHNpZ24gdXAgZm9yIGEgR29vZ2xlIGFjY291bnQgYXQgIA0KaHR0cHM6
Ly93d3cuZ29vZ2xlLmNvbS9jYWxlbmRhci8gYW5kIGNvbnRyb2wgeW91ciBub3RpZmljYXRpb24g
c2V0dGluZ3MgZm9yICANCnlvdXIgZW50aXJlIGNhbGVuZGFyLg0KDQpGb3J3YXJkaW5nIHRoaXMg
aW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0
byAgDQp0aGUgb3JnYW5pemVyIGFuZCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgb3IgaW52
aXRlIG90aGVycyByZWdhcmRsZXNzICANCm9mIHRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywg
b3IgdG8gbW9kaWZ5IHlvdXIgUlNWUC4gTGVhcm4gbW9yZSBhdCAgDQpodHRwczovL3N1cHBvcnQu
Z29vZ2xlLmNvbS9jYWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--0000000000002b8466059d50210a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Pe=
rson"><meta itemprop=3D"description" content=3D"Invitation from rhanley@goo=
gle.com"/></span><span itemprop=3D"object" itemscope itemtype=3D"http://sch=
ema.org/Event"><div style=3D""><table cellspacing=3D"0" cellpadding=3D"8" b=
order=3D"0" summary=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;b=
order:1px Solid #ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><=
tr><td><meta itemprop=3D"eventStatus" content=3D"http://schema.org/EventSch=
eduled"/><h4 style=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial,Sans=
-serif;font-size:13px;line-height:1.4;border:1px Solid #fff;background:#fff=
;color:#090;font-weight:normal"><strong>You have been invited to the follow=
ing event.</strong></h4><div style=3D"padding:2px"><span itemprop=3D"publis=
her" itemscope itemtype=3D"http://schema.org/Organization"><meta itemprop=
=3D"name" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/goo=
gleCalendar" content=3D"2kk74abk2o7e0mandpebpcf66s"/><h3 style=3D"padding:0=
 0 6px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:b=
old;color:#222"><span itemprop=3D"name">BMC Aggregator Presentation Layer</=
span></h3><table style=3D"display:inline-table" cellpadding=3D"0" cellspaci=
ng=3D"0" border=3D"0" summary=3D"Event details"><tr><td style=3D"padding:0 =
1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-spa=
ce:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:normal">Wh=
en</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-se=
rif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1p=
x"><time itemprop=3D"startDate" datetime=3D"20200206T180000Z"></time><time =
itemprop=3D"endDate" datetime=3D"20200206T190000Z"></time>Thu Feb 6, 2020 1=
0am =E2=80=93 11am <span style=3D"color:#888">Pacific Time - Los Angeles</s=
pan></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial=
,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" valign=
=3D"top"><div><i style=3D"font-style:normal">Where</i></div></td><td style=
=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#=
222" valign=3D"top"><div style=3D"text-indent:-1px"><span itemprop=3D"locat=
ion" itemscope itemtype=3D"http://schema.org/Place"><span itemprop=3D"name"=
 class=3D"notranslate">SVL-MAT3-4-Saturn (5) [GVC]</span><span dir=3D"ltr">=
 (<a href=3D"https://www.google.com/maps/search/SVL-MAT3-4-Saturn+%285%29+%=
5BGVC%5D?hl=3Den" style=3D"color:#20c;white-space:nowrap" target=3D"_blank"=
 itemprop=3D"map">map</a>)</span></span></div></td></tr><tr><td style=3D"pa=
dding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;w=
hite-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:no=
rmal">Joining info</i></div></td><td style=3D"padding-bottom:10px;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D=
"text-indent:-1px"><span itemprop=3D"potentialaction" itemscope itemtype=3D=
"http://schema.org/JoinAction"><span itemprop=3D"name" content=3D"meet.goog=
le.com/fzh-kuvi-wqo"><span itemprop=3D"target" itemscope itemtype=3D"http:/=
/schema.org/EntryPoint"><span itemprop=3D"url" content=3D"https://meet.goog=
le.com/fzh-kuvi-wqo"><span itemprop=3D"httpMethod" content=3D"GET"><a href=
=3D"https://meet.google.com/fzh-kuvi-wqo" style=3D"color:#20c;white-space:n=
owrap" target=3D"_blank">meet.google.com/fzh-kuvi-wqo</a></span></span></sp=
an></span></span></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font=
-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width=
:90px"></td><td><div style=3D"text-indent:-1px"><table cellspacing=3D"0" ce=
llpadding=3D"0"><tr><td style=3D"padding-bottom:10px;font-family:Arial,Sans=
-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:=
-1px"><span style=3D"color:#888">Join by phone <a href=3D"tel:+1 406-686-38=
26" style=3D"color:#20c;white-space:nowrap" target=3D"_blank"><span itempro=
p=3D"phoneNumber">+1 406-686-3826</span></a><span itemprop=3D"rtcPhoneNumbe=
rPassCodeLabel">&nbsp; PIN</span><span itemprop=3D"passCode"> 214092#</span=
>&nbsp; <a href=3D"https://tel.meet/fzh-kuvi-wqo?pin=3D3999618259371&amp;hs=
=3D0" style=3D"color:#20c;white-space:nowrap" target=3D"_blank">More phone =
numbers</a></span></div></td></tr></table></div></td></tr><tr><td style=3D"=
padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888=
;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:=
normal">Calendar</i></div></td><td style=3D"padding-bottom:10px;font-family=
:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"t=
ext-indent:-1px">openbmc@lists.ozlabs.org</div></td></tr><tr><td style=3D"p=
adding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;=
white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:n=
ormal">Who</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222" valign=3D"top"><table cellspacing=3D=
"0" cellpadding=3D"0"><tr><td style=3D"padding-right:10px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-indent=
:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></d=
iv></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-s=
ize:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"mar=
gin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://s=
chema.org/Person"><span itemprop=3D"name" class=3D"notranslate">rhanley@goo=
gle.com</span><meta itemprop=3D"email" content=3D"rhanley@google.com"/></sp=
an><span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org/Per=
son"><meta itemprop=3D"name" content=3D"rhanley@google.com"/><meta itemprop=
=3D"email" content=3D"rhanley@google.com"/></span><span style=3D"font-size:=
11px;color:#888"> - organizer</span></div></div></div></td></tr><tr><td sty=
le=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:=
#222;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family=
:Courier New,monospace">&#x2022;</span></div></td><td style=3D"padding-righ=
t:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=
=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=
=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempro=
p=3D"name" class=3D"notranslate">openbmc@lists.ozlabs.org</span><meta itemp=
rop=3D"email" content=3D"openbmc@lists.ozlabs.org"/></span></div></div></di=
v></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-seri=
f;font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><sp=
an style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><t=
d style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.=
3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/=
Person"><span itemprop=3D"name" class=3D"notranslate">neladk@microsoft.com<=
/span><meta itemprop=3D"email" content=3D"neladk@microsoft.com"/></span></d=
iv></div></div></td></tr></table></td></tr></table><div style=3D"float:righ=
t;font-weight:bold;font-size:13px"> <a href=3D"https://www.google.com/calen=
dar/event?action=3DVIEW&amp;eid=3DMmtrNzRhYmsybzdlMG1hbmRwZWJwY2Y2NnMgb3Blb=
mJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tYzI4YWY2M=
zM1ZWUwMjcwN2FlYmEwMGEwN2ViYmVjNzJmNThmZTRkOA&amp;ctz=3DAmerica%2FLos_Angel=
es&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=
=3D"url">more details &raquo;</a><br></div><div style=3D"padding-bottom:15p=
x;font-family:Arial,Sans-serif;font-size:13px;color:#222;white-space:pre-wr=
ap!important;white-space:-moz-pre-wrap!important;white-space:-pre-wrap!impo=
rtant;white-space:-o-pre-wrap!important;white-space:pre;word-wrap:break-wor=
d"><span>Sorry for the delay in putting together this follow up meeting.<p>=
We made some progress in hashing out some of the requirements of a BMC aggr=
egator in our last meeting. </p><p>However, one of the issues that needs mo=
re discussion is what features are needed in a presentation layer for this =
aggregator.</p><p>I think this discussion is one of the biggest blockers be=
fore we can trading any designs, and I look forward to hearing about any us=
e cases that people are considering.</p><p>(P.S. I will be creating a secon=
d meeting that is more amenable to Asian timezones)</p></span><meta itempro=
p=3D"description" content=3D"Sorry for the delay in putting together this f=
ollow up meeting.

We made some progress in hashing out some of the requirements of a BMC aggr=
egator in our last meeting.=20

However, one of the issues that needs more discussion is what features are =
needed in a presentation layer for this aggregator.

I think this discussion is one of the biggest blockers before we can tradin=
g any designs, and I look forward to hearing about any use cases that peopl=
e are considering.

(P.S. I will be creating a second meeting that is more amenable to Asian ti=
mezones)"/></div></div><p style=3D"color:#222;font-size:13px;margin:0"><spa=
n style=3D"color:#888">Going (openbmc@lists.ozlabs.org)?&nbsp;&nbsp;&nbsp;<=
/span><wbr><strong><span itemprop=3D"potentialaction" itemscope itemtype=3D=
"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"htt=
p://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope it=
emtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" hr=
ef=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.goog=
le.com/calendar/event?action=3DRESPOND&amp;eid=3DMmtrNzRhYmsybzdlMG1hbmRwZW=
JwY2Y2NnMgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;rst=3D1&amp;tok=3DMTgjcmhhbm=
xleUBnb29nbGUuY29tYzI4YWY2MzM1ZWUwMjcwN2FlYmEwMGEwN2ViYmVjNzJmNThmZTRkOA&am=
p;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;w=
hite-space:nowrap" itemprop=3D"url">Yes</a></span></span><span style=3D"mar=
gin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"potentialaction=
" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"att=
endance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><span itemprop=
=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><li=
nk itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><a=
 href=3D"https://www.google.com/calendar/event?action=3DRESPOND&amp;eid=3DM=
mtrNzRhYmsybzdlMG1hbmRwZWJwY2Y2NnMgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;rst=
=3D3&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tYzI4YWY2MzM1ZWUwMjcwN2FlYmEwMGEw=
N2ViYmVjNzJmNThmZTRkOA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=
=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">Maybe</a></s=
pan></span><span style=3D"margin:0 0.4em;font-weight:normal"> - </span><spa=
n itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/Rsvp=
Action"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAtte=
ndance/No"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.=
org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/=
HttpRequestMethod/GET"/><a href=3D"https://www.google.com/calendar/event?ac=
tion=3DRESPOND&amp;eid=3DMmtrNzRhYmsybzdlMG1hbmRwZWJwY2Y2NnMgb3BlbmJtY0BsaX=
N0cy5vemxhYnMub3Jn&amp;rst=3D2&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tYzI4YW=
Y2MzM1ZWUwMjcwN2FlYmEwMGEwN2ViYmVjNzJmNThmZTRkOA&amp;ctz=3DAmerica%2FLos_An=
geles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemp=
rop=3D"url">No</a></span></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a hr=
ef=3D"https://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DMmtrNzR=
hYmsybzdlMG1hbmRwZWJwY2Y2NnMgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DMTg=
jcmhhbmxleUBnb29nbGUuY29tYzI4YWY2MzM1ZWUwMjcwN2FlYmEwMGEwN2ViYmVjNzJmNThmZT=
RkOA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color=
:#20c;white-space:nowrap" itemprop=3D"url">more options &raquo;</a></p></td=
></tr><tr><td style=3D"background-color:#f6f6f6;color:#888;border-top:1px S=
olid #ccc;font-family:Arial,Sans-serif;font-size:11px"><p>Invitation from <=
a href=3D"https://www.google.com/calendar/" target=3D"_blank" style=3D"">Go=
ogle Calendar</a></p><p>You are receiving this courtesy email at the accoun=
t openbmc@lists.ozlabs.org because you are an attendee of this event.</p><p=
>To stop receiving future updates for this event, decline this event. Alter=
natively you can sign up for a Google account at https://www.google.com/cal=
endar/ and control your notification settings for your entire calendar.</p>=
<p>Forwarding this invitation could allow any recipient to send a response =
to the organizer and be added to the guest list, or invite others regardles=
s of their own invitation status, or to modify your RSVP. <a href=3D"https:=
//support.google.com/calendar/answer/37135#forwarding">Learn More</a>.</p><=
/td></tr></table></div></span></span>
--0000000000002b8466059d50210a
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20200206T180000Z
DTEND:20200206T190000Z
DTSTAMP:20200129T235922Z
ORGANIZER;CN=rhanley@google.com:mailto:rhanley@google.com
UID:2kk74abk2o7e0mandpebpcf66s@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=openbmc@lists.ozlabs.org;X-NUM-GUESTS=0:mailto:openbmc@lists.ozlabs
 .org
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=SVL-MAT3-4-Saturn (5) [GVC];X-NUM-GUESTS=0:mailto:google.com_726f6f6d
 5f75735f73766c5f6d6174335f345f346839@resource.calendar.google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=neladk@microsoft.com;X-NUM-GUESTS=0:mailto:neladk@microsoft.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=rhanley@google.com;X-NUM-GUESTS=0:mailto:rhanley@google.com
X-MICROSOFT-CDO-OWNERAPPTID:623331368
CREATED:20200129T235922Z
DESCRIPTION:Sorry for the delay in putting together this follow up meeting.
 \n\nWe made some progress in hashing out some of the requirements of a BMC 
 aggregator in our last meeting. \n\nHowever\, one of the issues that needs 
 more discussion is what features are needed in a presentation layer for thi
 s aggregator.\n\nI think this discussion is one of the biggest blockers bef
 ore we can trading any designs\, and I look forward to hearing about any us
 e cases that people are considering.\n\n(P.S. I will be creating a second m
 eeting that is more amenable to Asian timezones)\n\n-::~:~::~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nPlease do
  not edit this section of the description.\n\nThis event has a video call.\
 nJoin: https://meet.google.com/fzh-kuvi-wqo\n+1 406-686-3826 PIN: 214092#\n
 View more phone numbers: https://tel.meet/fzh-kuvi-wqo?pin=3999618259371&hs
 =7\n\nView your event at https://www.google.com/calendar/event?action=VIEW&
 eid=MmtrNzRhYmsybzdlMG1hbmRwZWJwY2Y2NnMgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&to
 k=MTgjcmhhbmxleUBnb29nbGUuY29tYzI4YWY2MzM1ZWUwMjcwN2FlYmEwMGEwN2ViYmVjNzJmN
 ThmZTRkOA&ctz=America%2FLos_Angeles&hl=en&es=1.\n-::~:~::~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200129T235922Z
LOCATION:SVL-MAT3-4-Saturn (5) [GVC]
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:BMC Aggregator Presentation Layer
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000002b8466059d50210a--

--0000000000002b846b059d50210c
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjAwMjA2VDE4MDAwMFoNCkRURU5EOjIwMjAwMjA2
VDE5MDAwMFoNCkRUU1RBTVA6MjAyMDAxMjlUMjM1OTIyWg0KT1JHQU5JWkVSO0NOPXJoYW5sZXlA
Z29vZ2xlLmNvbTptYWlsdG86cmhhbmxleUBnb29nbGUuY29tDQpVSUQ6MmtrNzRhYmsybzdlMG1h
bmRwZWJwY2Y2NnNAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1vcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm9wZW5ibWNAbGlzdHMu
b3psYWJzDQogLm9yZw0KQVRURU5ERUU7Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQ
QU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSDQogVUU7Q049U1ZMLU1BVDMtNC1TYXR1
cm4gKDUpIFtHVkNdO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpnb29nbGUuY29tXzcyNmY2ZjZkDQog
NWY3NTczNWY3Mzc2NmM1ZjZkNjE3NDMzNWYzNDVmMzQ2ODM5QHJlc291cmNlLmNhbGVuZGFyLmdv
b2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049bmVsYWRrQG1pY3Jvc29mdC5j
b207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm5lbGFka0BtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtD
VVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtS
U1ZQPVRSVUUNCiA7Q049cmhhbmxleUBnb29nbGUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpy
aGFubGV5QGdvb2dsZS5jb20NClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDo2MjMzMzEzNjgN
CkNSRUFURUQ6MjAyMDAxMjlUMjM1OTIyWg0KREVTQ1JJUFRJT046U29ycnkgZm9yIHRoZSBkZWxh
eSBpbiBwdXR0aW5nIHRvZ2V0aGVyIHRoaXMgZm9sbG93IHVwIG1lZXRpbmcuDQogXG5cbldlIG1h
ZGUgc29tZSBwcm9ncmVzcyBpbiBoYXNoaW5nIG91dCBzb21lIG9mIHRoZSByZXF1aXJlbWVudHMg
b2YgYSBCTUMgDQogYWdncmVnYXRvciBpbiBvdXIgbGFzdCBtZWV0aW5nLiBcblxuSG93ZXZlclws
IG9uZSBvZiB0aGUgaXNzdWVzIHRoYXQgbmVlZHMgDQogbW9yZSBkaXNjdXNzaW9uIGlzIHdoYXQg
ZmVhdHVyZXMgYXJlIG5lZWRlZCBpbiBhIHByZXNlbnRhdGlvbiBsYXllciBmb3IgdGhpDQogcyBh
Z2dyZWdhdG9yLlxuXG5JIHRoaW5rIHRoaXMgZGlzY3Vzc2lvbiBpcyBvbmUgb2YgdGhlIGJpZ2dl
c3QgYmxvY2tlcnMgYmVmDQogb3JlIHdlIGNhbiB0cmFkaW5nIGFueSBkZXNpZ25zXCwgYW5kIEkg
bG9vayBmb3J3YXJkIHRvIGhlYXJpbmcgYWJvdXQgYW55IHVzDQogZSBjYXNlcyB0aGF0IHBlb3Bs
ZSBhcmUgY29uc2lkZXJpbmcuXG5cbihQLlMuIEkgd2lsbCBiZSBjcmVhdGluZyBhIHNlY29uZCBt
DQogZWV0aW5nIHRoYXQgaXMgbW9yZSBhbWVuYWJsZSB0byBBc2lhbiB0aW1lem9uZXMpXG5cbi06
On46fjo6fjp+On46fjp+On46fjp+DQogOn46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46On46fjo6LVxuUGxlYXNlIGRvDQogIG5vdCBlZGl0IHRo
aXMgc2VjdGlvbiBvZiB0aGUgZGVzY3JpcHRpb24uXG5cblRoaXMgZXZlbnQgaGFzIGEgdmlkZW8g
Y2FsbC5cDQogbkpvaW46IGh0dHBzOi8vbWVldC5nb29nbGUuY29tL2Z6aC1rdXZpLXdxb1xuKzEg
NDA2LTY4Ni0zODI2IFBJTjogMjE0MDkyI1xuDQogVmlldyBtb3JlIHBob25lIG51bWJlcnM6IGh0
dHBzOi8vdGVsLm1lZXQvZnpoLWt1dmktd3FvP3Bpbj0zOTk5NjE4MjU5MzcxJmhzDQogPTdcblxu
VmlldyB5b3VyIGV2ZW50IGF0IGh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/
YWN0aW9uPVZJRVcmDQogZWlkPU1tdHJOelJoWW1zeWJ6ZGxNRzFoYm1Sd1pXSndZMlkyTm5NZ2Iz
QmxibUp0WTBCc2FYTjBjeTV2ZW14aFluTXViM0puJnRvDQogaz1NVGdqY21oaGJteGxlVUJuYjI5
bmJHVXVZMjl0WXpJNFlXWTJNek0xWldVd01qY3dOMkZsWW1Fd01HRXdOMlZpWW1Wak56Sm1ODQog
VGhtWlRSa09BJmN0ej1BbWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MS5cbi06On46fjo6
fjp+On46fjp+On46fjp+On46DQogfjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoyMDIwMDEyOVQyMzU5MjJa
DQpMT0NBVElPTjpTVkwtTUFUMy00LVNhdHVybiAoNSkgW0dWQ10NClNFUVVFTkNFOjANClNUQVRV
UzpDT05GSVJNRUQNClNVTU1BUlk6Qk1DIEFnZ3JlZ2F0b3IgUHJlc2VudGF0aW9uIExheWVyDQpU
UkFOU1A6T1BBUVVFDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--0000000000002b846b059d50210c--
