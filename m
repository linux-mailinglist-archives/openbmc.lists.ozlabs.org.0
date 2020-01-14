Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00C139E0C
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 01:22:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xWPS74PmzDqKw
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 11:22:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c49;
 helo=mail-yw1-xc49.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OlrmO8CB; dkim-atps=neutral
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xWNs61vrzDqJV
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 11:22:04 +1100 (AEDT)
Received: by mail-yw1-xc49.google.com with SMTP id o1so14128953ywl.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 16:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:message-id:date:subject:from:to:cc;
 bh=nyWEl40Bb1EY+jUX7AImg0/UJ+/6dxmwYzDYF+l8kBw=;
 b=OlrmO8CBErfENMCdaeVVmNNNjZaBcajZampZ5olYq/C02Mm5HZQPBMY6yhcpMAHOSy
 tYkFMbNZuuUpdZbTGS0eiVt5zHtLUIlBt4oyw2DbtSsqMfDM04iqUQDrpFfT5Tpa+pb+
 mEi5oBuacrDLNUthoiDR9RtfVj0AqU7FhuEQTxuRrEWC83NjqMlNy3DFN6EvNMbKE3xm
 YK/biVil9b6+EAeu/oSvzmhKJJa8XWCNj5ugTvagIJGYaVsK+S4UxjWgZqkh5boc2eAL
 0wvmorygRv8X6kCHH0s1I6ufSVUzq1N5niDMsgpU2qkCVFp91RCXK0j+16fMXwxrRJx1
 7x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
 :subject:from:to:cc;
 bh=nyWEl40Bb1EY+jUX7AImg0/UJ+/6dxmwYzDYF+l8kBw=;
 b=OgtlI6YnFIuHpXpq8nYuN6L8MWu06R0eufL+veFLq9qAEI3wv+6BA+SajDonYuVsRW
 JlYfU+id0uxnP9/KcuZJjwIn45B3ky4AbgQfHOcH3THCCx3bADa17iq0TGNEX6sQLu6X
 NAAtCUQI4iuR9GBPR9sVLSPhCVjKlJQ6+rZ9PpsPo8ofL0Mv2O+oLDNbxl50tCeQO2Om
 RzdNLoc7mhinL/04fPCDX5jXq7OSt8aoIrOkSrvBvhv3rV13ExttSF0Pf+hE9Qfxqnw1
 ihudZpy/Uz0Eawqk7flybkFwapfK99qCYsn2a7j2cIj2Jnby3RqVQ4xYnjGJcLpL5M2z
 T36Q==
X-Gm-Message-State: APjAAAWFFmPO+w5yUZYNr30gg2Uma8srxPxX9sfgzcQff6aqJsTJYNHb
 MxX0YoWQ8fzI1rm6b3cGhqtRcxG7+8qP5iqsRbBbqqE86LCi2VSdOucnwDzChQfygXeeh3HYm+v
 rMQu6OTelnHs3PwZrrdiQWFI01yEiOuOtpA0lYwylh5KECqGcwK3EN8RhIO5yN3CUJfRRmZRd8m
 NgEg==
X-Google-Smtp-Source: APXvYqzUBSSwB7nE2ojtnyNZw73soLwJVTAhDc2i3uCu13+9kT5T0SF2wKHpXW1vzbxSk269u0XiIKgnkNroE9iAdfjO
MIME-Version: 1.0
X-Received: by 2002:a0d:d8cb:: with SMTP id
 a194mr15541836ywe.472.1578961320401; 
 Mon, 13 Jan 2020 16:22:00 -0800 (PST)
Message-ID: <0000000000009e25a8059c0e94c4@google.com>
Date: Tue, 14 Jan 2020 00:22:00 +0000
Subject: Invitation: BMC/Redfish Aggregator Use Case and Requirements @ Thu
 Jan 16, 2020 10am - 11am (PST) (openbmc@lists.ozlabs.org)
From: rhanley@google.com
To: openbmc@lists.ozlabs.org, vishwa@linux.vnet.ibm.com, neladk@microsoft.com
Content-Type: multipart/mixed; boundary="0000000000009e258a059c0e94c3"
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

--0000000000009e258a059c0e94c3
Content-Type: multipart/alternative; boundary="0000000000009e2587059c0e94c1"

--0000000000009e2587059c0e94c1
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiBC
TUMvUmVkZmlzaCBBZ2dyZWdhdG9yIFVzZSBDYXNlIGFuZCBSZXF1aXJlbWVudHMNClRoZXJlIGhh
cyBiZWVuIHNvbWUgZW1haWwgZGlzY3Vzc2lvbiBvbiB0aGUgbWFpbGluZyBsaXN0IGFib3V0IHdv
cmtpbmcgb24gYSAgDQpSZWRmaXNoIGFnZ3JlZ2F0b3IuICBJJ2QgbGlrZSB0byB0YWtlIHNvbWUg
dGltZSB0byBoYXZlIGEgbGl2ZSBkaXNjdXNzaW9uICANCmFib3V0IHZhcmlvdXMgdXNlIGNhc2Vz
IGFuZCByZXF1aXJlbWVudHMuDQoNClNvbWUgYWdlbmRhIGl0ZW1zIHRvIGNvbnNpZGVyOg0KDQox
KSBMYXllciAyLzMgZGlzY292ZXJ5IGFuZCBuZWdvdGlhdGlvbg0KDQoyKSBDYWNoaW5nLCBwcm94
eSwgYW5kIGNvbnNpc3RlbmN5IHJlcXVpcmVtZW50cw0KDQozKSBUYXJnZXQgaGFyZHdhcmUsIHBl
cmZvcm1hbmNlIHJlcXVpcmVtZW50cywgYW5kIHNjYWxlIG9mIGFnZ3JlZ2F0aW9uDQoNCjQpIFRv
b2xpbmcgYW5kIGluZnJhc3RydWN0dXJlIGltcHJvdmVtZW50cyBuZWVkZWQgdG8gc3VwcG9ydCBh
biBhZ2dyZWdhdG9yDQoNCjUpIEFtb3VudCBvZiBjb25maWd1cmF0aW9uIGFuZCBrbm93bGVkZ2Ug
YW4gYWdncmVnYXRvciBuZWVkcyB0byBrbm93IGEgIA0KcHJpb3JpLg0KDQo2KSBEYXRhIHByZXNl
bnRhdGlvbiBmcm9tIEluYmFuZD8NCg0KNykgU2VjdXJpdHkNCldoZW46IFRodSBKYW4gMTYsIDIw
MjAgMTBhbSDigJMgMTFhbSBQYWNpZmljIFRpbWUgLSBMb3MgQW5nZWxlcw0KV2hlcmU6IFNWTC1N
QVQzLTQtU2VhIERyaXZlICg3KSBbR1ZDXQ0KDQpKb2luaW5nIGluZm86IEpvaW4gSGFuZ291dHMg
TWVldA0KaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vYnFoLWFqZWMtYnF5DQoNCkpvaW4gYnkgcGhv
bmUNCisxIDcwNy03MDItMjczOCAoUElOOiAyOTMzMDIpDQoNCk1vcmUgcGhvbmUgbnVtYmVyczog
aHR0cHM6Ly90ZWwubWVldC9icWgtYWplYy1icXk/cGluPTkwMDE5NzY0MDMxOTEmaHM9MA0KDQpD
YWxlbmRhcjogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpXaG86DQogICAgICogcmhhbmxleUBn
b29nbGUuY29tIC0gb3JnYW5pemVyDQogICAgICogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQog
ICAgICogdmlzaHdhQGxpbnV4LnZuZXQuaWJtLmNvbQ0KICAgICAqIG5lbGFka0BtaWNyb3NvZnQu
Y29tDQogICAgICogTmFuY3kgWXVlbiAtIG9wdGlvbmFsDQoNCkV2ZW50IGRldGFpbHM6ICANCmh0
dHBzOi8vd3d3Lmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU5UVnVa
MkZ0YVc5amFXcHdObVExY1c0Mk5IVTFOR1ZtYUhBZ2IzQmxibUp0WTBCc2FYTjBjeTV2ZW14aFlu
TXViM0puJnRvaz1NVGdqY21oaGJteGxlVUJuYjI5bmJHVXVZMjl0WXpsbU5XVXlZalExT1RFNFpE
TXhZMlpsTW1VeVpERm1abVV4T0dSak1EVTJNV016T1RJM053JmN0ej1BbWVyaWNhJTJGTG9zX0Fu
Z2VsZXMmaGw9ZW4mZXM9MA0KDQpJbnZpdGF0aW9uIGZyb20gR29vZ2xlIENhbGVuZGFyOiBodHRw
czovL3d3dy5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGNv
dXJ0ZXN5IGVtYWlsIGF0IHRoZSBhY2NvdW50ICANCm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyBi
ZWNhdXNlIHlvdSBhcmUgYW4gYXR0ZW5kZWUgb2YgdGhpcyBldmVudC4NCg0KVG8gc3RvcCByZWNl
aXZpbmcgZnV0dXJlIHVwZGF0ZXMgZm9yIHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4g
IA0KQWx0ZXJuYXRpdmVseSB5b3UgY2FuIHNpZ24gdXAgZm9yIGEgR29vZ2xlIGFjY291bnQgYXQg
IA0KaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9jYWxlbmRhci8gYW5kIGNvbnRyb2wgeW91ciBub3Rp
ZmljYXRpb24gc2V0dGluZ3MgZm9yICANCnlvdXIgZW50aXJlIGNhbGVuZGFyLg0KDQpGb3J3YXJk
aW5nIHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSBy
ZXNwb25zZSB0byAgDQp0aGUgb3JnYW5pemVyIGFuZCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlz
dCwgb3IgaW52aXRlIG90aGVycyByZWdhcmRsZXNzICANCm9mIHRoZWlyIG93biBpbnZpdGF0aW9u
IHN0YXR1cywgb3IgdG8gbW9kaWZ5IHlvdXIgUlNWUC4gTGVhcm4gbW9yZSBhdCAgDQpodHRwczov
L3N1cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--0000000000009e2587059c0e94c1
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
gleCalendar" content=3D"55ngamiocijp6d5qn64u54efhp"/><h3 style=3D"padding:0=
 0 6px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:b=
old;color:#222"><span itemprop=3D"name">BMC/Redfish Aggregator Use Case and=
 Requirements</span></h3><table style=3D"display:inline-table" cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" summary=3D"Event details"><tr><td sty=
le=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-=
style:normal">When</i></div></td><td style=3D"padding-bottom:10px;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D=
"text-indent:-1px"><time itemprop=3D"startDate" datetime=3D"20200116T180000=
Z"></time><time itemprop=3D"endDate" datetime=3D"20200116T190000Z"></time>T=
hu Jan 16, 2020 10am =E2=80=93 11am <span style=3D"color:#888">Pacific Time=
 - Los Angeles</span></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;=
font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;w=
idth:90px" valign=3D"top"><div><i style=3D"font-style:normal">Where</i></di=
v></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-s=
ize:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px"><span i=
temprop=3D"location" itemscope itemtype=3D"http://schema.org/Place"><span i=
temprop=3D"name" class=3D"notranslate">SVL-MAT3-4-Sea Drive (7) [GVC]</span=
><span dir=3D"ltr"> (<a href=3D"https://www.google.com/maps/search/SVL-MAT3=
-4-Sea+Drive+%287%29+%5BGVC%5D?hl=3Den" style=3D"color:#20c;white-space:now=
rap" target=3D"_blank" itemprop=3D"map">map</a>)</span></span></div></td></=
tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-=
size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i =
style=3D"font-style:normal">Joining info</i></div></td><td style=3D"padding=
-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=
=3D"top"><div style=3D"text-indent:-1px"><span itemprop=3D"potentialaction"=
 itemscope itemtype=3D"http://schema.org/JoinAction"><span itemprop=3D"name=
" content=3D"meet.google.com/bqh-ajec-bqy"><span itemprop=3D"target" itemsc=
ope itemtype=3D"http://schema.org/EntryPoint"><span itemprop=3D"url" conten=
t=3D"https://meet.google.com/bqh-ajec-bqy"><span itemprop=3D"httpMethod" co=
ntent=3D"GET"><a href=3D"https://meet.google.com/bqh-ajec-bqy" style=3D"col=
or:#20c;white-space:nowrap" target=3D"_blank">meet.google.com/bqh-ajec-bqy<=
/a></span></span></span></span></span></div></td></tr><tr><td style=3D"padd=
ing:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;whi=
te-space:nowrap;width:90px"></td><td><div style=3D"text-indent:-1px"><table=
 cellspacing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-bottom:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div =
style=3D"text-indent:-1px"><span style=3D"color:#888">Join by phone <a href=
=3D"tel:+1 707-702-2738" style=3D"color:#20c;white-space:nowrap" target=3D"=
_blank"><span itemprop=3D"phoneNumber">+1 707-702-2738</span></a><span item=
prop=3D"rtcPhoneNumberPassCodeLabel">&nbsp; PIN</span><span itemprop=3D"pas=
sCode"> 293302#</span>&nbsp; <a href=3D"https://tel.meet/bqh-ajec-bqy?pin=
=3D9001976403191&amp;hs=3D0" style=3D"color:#20c;white-space:nowrap" target=
=3D"_blank">More phone numbers</a></span></div></td></tr></table></div></td=
></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;fo=
nt-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div>=
<i style=3D"font-style:normal">Calendar</i></div></td><td style=3D"padding-=
bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=
=3D"top"><div style=3D"text-indent:-1px">openbmc@lists.ozlabs.org</div></td=
></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;fo=
nt-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div>=
<i style=3D"font-style:normal">Who</i></div></td><td style=3D"padding-botto=
m:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"to=
p"><table cellspacing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-righ=
t:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><=
div style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monos=
pace">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-family=
:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px=
"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemsc=
ope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"=
notranslate">rhanley@google.com</span><meta itemprop=3D"email" content=3D"r=
hanley@google.com"/></span><span itemprop=3D"organizer" itemscope itemtype=
=3D"http://schema.org/Person"><meta itemprop=3D"name" content=3D"rhanley@go=
ogle.com"/><meta itemprop=3D"email" content=3D"rhanley@google.com"/></span>=
<span style=3D"font-size:11px;color:#888"> - organizer</span></div></div></=
div></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-se=
rif;font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><=
span style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td>=
<td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px=
;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 =
0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.or=
g/Person"><span itemprop=3D"name" class=3D"notranslate">openbmc@lists.ozlab=
s.org</span><meta itemprop=3D"email" content=3D"openbmc@lists.ozlabs.org"/>=
</span></div></div></div></td></tr><tr><td style=3D"padding-right:10px;font=
-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=
=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#x=
2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,Sa=
ns-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><d=
iv style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemt=
ype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransla=
te">vishwa@linux.vnet.ibm.com</span><meta itemprop=3D"email" content=3D"vis=
hwa@linux.vnet.ibm.com"/></span></div></div></div></td></tr><tr><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family:C=
ourier New,monospace">&#x2022;</span></div></td><td style=3D"padding-right:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"=
text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"=
attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D=
"name" class=3D"notranslate">neladk@microsoft.com</span><meta itemprop=3D"e=
mail" content=3D"neladk@microsoft.com"/></span></div></div></div></td></tr>=
<tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:=
13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span style=3D"=
font-family:Courier New,monospace">&#x2022;</span></div></td><td style=3D"p=
adding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><=
div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span=
 itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><spa=
n itemprop=3D"name" class=3D"notranslate">Nancy Yuen</span><meta itemprop=
=3D"email" content=3D"yuenn@google.com"/></span><span style=3D"font-size:11=
px;color:#888"> - optional</span></div></div></div></td></tr></table></td><=
/tr></table><div style=3D"float:right;font-weight:bold;font-size:13px"> <a =
href=3D"https://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DNTVuZ=
2FtaW9jaWpwNmQ1cW42NHU1NGVmaHAgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DM=
TgjcmhhbmxleUBnb29nbGUuY29tYzlmNWUyYjQ1OTE4ZDMxY2ZlMmUyZDFmZmUxOGRjMDU2MWMz=
OTI3Nw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"col=
or:#20c;white-space:nowrap" itemprop=3D"url">more details &raquo;</a><br></=
div><div style=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-siz=
e:13px;color:#222;white-space:pre-wrap!important;white-space:-moz-pre-wrap!=
important;white-space:-pre-wrap!important;white-space:-o-pre-wrap!important=
;white-space:pre;word-wrap:break-word"><span>There has been some email disc=
ussion on the mailing list about working on a Redfish aggregator.  I&#39;d =
like to take some time to have a live discussion about various use cases an=
d requirements.<p>Some agenda items to consider:</p><p>1) Layer 2/3 discove=
ry and negotiation</p><p>2) Caching, proxy, and consistency requirements</p=
><p>3) Target hardware, performance requirements, and scale of aggregation<=
/p><p>4) Tooling and infrastructure improvements needed to support an aggre=
gator</p><p>5) Amount of configuration and knowledge an aggregator needs to=
 know a priori.</p><p>6) Data presentation from Inband?</p><p>7) Security <=
/p></span><meta itemprop=3D"description" content=3D"There has been some ema=
il discussion on the mailing list about working on a Redfish aggregator.  I=
&#39;d like to take some time to have a live discussion about various use c=
ases and requirements.

Some agenda items to consider:

1) Layer 2/3 discovery and negotiation

2) Caching, proxy, and consistency requirements

3) Target hardware, performance requirements, and scale of aggregation

4) Tooling and infrastructure improvements needed to support an aggregator

5) Amount of configuration and knowledge an aggregator needs to know a prio=
ri.

6) Data presentation from Inband?

7) Security "/></div></div><p style=3D"color:#222;font-size:13px;margin:0">=
<span style=3D"color:#888">Going (openbmc@lists.ozlabs.org)?&nbsp;&nbsp;&nb=
sp;</span><wbr><strong><span itemprop=3D"potentialaction" itemscope itemtyp=
e=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D=
"http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscop=
e itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method=
" href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.=
google.com/calendar/event?action=3DRESPOND&amp;eid=3DNTVuZ2FtaW9jaWpwNmQ1cW=
42NHU1NGVmaHAgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;rst=3D1&amp;tok=3DMTgjcm=
hhbmxleUBnb29nbGUuY29tYzlmNWUyYjQ1OTE4ZDMxY2ZlMmUyZDFmZmUxOGRjMDU2MWMzOTI3N=
w&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#2=
0c;white-space:nowrap" itemprop=3D"url">Yes</a></span></span><span style=3D=
"margin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"potentialac=
tion" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D=
"attendance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><span item=
prop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"=
><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"=
/><a href=3D"https://www.google.com/calendar/event?action=3DRESPOND&amp;eid=
=3DNTVuZ2FtaW9jaWpwNmQ1cW42NHU1NGVmaHAgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp=
;rst=3D3&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tYzlmNWUyYjQ1OTE4ZDMxY2ZlMmUy=
ZDFmZmUxOGRjMDU2MWMzOTI3Nw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;=
es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">Maybe</a><=
/span></span><span style=3D"margin:0 0.4em;font-weight:normal"> - </span><s=
pan itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/Rs=
vpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAt=
tendance/No"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schem=
a.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.or=
g/HttpRequestMethod/GET"/><a href=3D"https://www.google.com/calendar/event?=
action=3DRESPOND&amp;eid=3DNTVuZ2FtaW9jaWpwNmQ1cW42NHU1NGVmaHAgb3BlbmJtY0Bs=
aXN0cy5vemxhYnMub3Jn&amp;rst=3D2&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tYzlm=
NWUyYjQ1OTE4ZDMxY2ZlMmUyZDFmZmUxOGRjMDU2MWMzOTI3Nw&amp;ctz=3DAmerica%2FLos_=
Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" ite=
mprop=3D"url">No</a></span></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a =
href=3D"https://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DNTVuZ=
2FtaW9jaWpwNmQ1cW42NHU1NGVmaHAgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DM=
TgjcmhhbmxleUBnb29nbGUuY29tYzlmNWUyYjQ1OTE4ZDMxY2ZlMmUyZDFmZmUxOGRjMDU2MWMz=
OTI3Nw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"col=
or:#20c;white-space:nowrap" itemprop=3D"url">more options &raquo;</a></p></=
td></tr><tr><td style=3D"background-color:#f6f6f6;color:#888;border-top:1px=
 Solid #ccc;font-family:Arial,Sans-serif;font-size:11px"><p>Invitation from=
 <a href=3D"https://www.google.com/calendar/" target=3D"_blank" style=3D"">=
Google Calendar</a></p><p>You are receiving this courtesy email at the acco=
unt openbmc@lists.ozlabs.org because you are an attendee of this event.</p>=
<p>To stop receiving future updates for this event, decline this event. Alt=
ernatively you can sign up for a Google account at https://www.google.com/c=
alendar/ and control your notification settings for your entire calendar.</=
p><p>Forwarding this invitation could allow any recipient to send a respons=
e to the organizer and be added to the guest list, or invite others regardl=
ess of their own invitation status, or to modify your RSVP. <a href=3D"http=
s://support.google.com/calendar/answer/37135#forwarding">Learn More</a>.</p=
></td></tr></table></div></span></span>
--0000000000009e2587059c0e94c1
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20200116T180000Z
DTEND:20200116T190000Z
DTSTAMP:20200114T002200Z
ORGANIZER;CN=rhanley@google.com:mailto:rhanley@google.com
UID:55ngamiocijp6d5qn64u54efhp@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=openbmc@lists.ozlabs.org;X-NUM-GUESTS=0:mailto:openbmc@lists.ozlabs
 .org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=OPT-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Nancy Yuen;X-NUM-GUESTS=0:mailto:yuenn@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=rhanley@google.com;X-NUM-GUESTS=0:mailto:rhanley@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=vishwa@linux.vnet.ibm.com;X-NUM-GUESTS=0:mailto:vishwa@linux.vnet.i
 bm.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=SVL-MAT3-4-Sea Drive (7) [GVC];X-NUM-GUESTS=0:mailto:google.com_726f6
 f6d5f75735f73766c5f6d6174335f345f346a37@resource.calendar.google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=neladk@microsoft.com;X-NUM-GUESTS=0:mailto:neladk@microsoft.com
X-MICROSOFT-CDO-OWNERAPPTID:-1954189224
CREATED:20200114T002159Z
DESCRIPTION:There has been some email discussion on the mailing list about 
 working on a Redfish aggregator.  I'd like to take some time to have a live
  discussion about various use cases and requirements.\n\nSome agenda items 
 to consider:\n\n1) Layer 2/3 discovery and negotiation\n\n2) Caching\, prox
 y\, and consistency requirements\n\n3) Target hardware\, performance requir
 ements\, and scale of aggregation\n\n4) Tooling and infrastructure improvem
 ents needed to support an aggregator\n\n5) Amount of configuration and know
 ledge an aggregator needs to know a priori.\n\n6) Data presentation from In
 band?\n\n7) Security \n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nPlease do not edit this section of t
 he description.\n\nThis event has a video call.\nJoin: https://meet.google.
 com/bqh-ajec-bqy\n+1 707-702-2738 PIN: 293302#\nView more phone numbers: ht
 tps://tel.meet/bqh-ajec-bqy?pin=9001976403191&hs=7\n\nView your event at ht
 tps://www.google.com/calendar/event?action=VIEW&eid=NTVuZ2FtaW9jaWpwNmQ1cW4
 2NHU1NGVmaHAgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&tok=MTgjcmhhbmxleUBnb29nbGUuY
 29tYzlmNWUyYjQ1OTE4ZDMxY2ZlMmUyZDFmZmUxOGRjMDU2MWMzOTI3Nw&ctz=America%2FLos
 _Angeles&hl=en&es=1.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200114T002159Z
LOCATION:SVL-MAT3-4-Sea Drive (7) [GVC]
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:BMC/Redfish Aggregator Use Case and Requirements
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000009e2587059c0e94c1--

--0000000000009e258a059c0e94c3
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjAwMTE2VDE4MDAwMFoNCkRURU5EOjIwMjAwMTE2
VDE5MDAwMFoNCkRUU1RBTVA6MjAyMDAxMTRUMDAyMjAwWg0KT1JHQU5JWkVSO0NOPXJoYW5sZXlA
Z29vZ2xlLmNvbTptYWlsdG86cmhhbmxleUBnb29nbGUuY29tDQpVSUQ6NTVuZ2FtaW9jaWpwNmQ1
cW42NHU1NGVmaHBAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1vcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm9wZW5ibWNAbGlzdHMu
b3psYWJzDQogLm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1PUFQtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1OYW5jeSBZdWVuO1gt
TlVNLUdVRVNUUz0wOm1haWx0bzp5dWVubkBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5E
SVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtSU1ZQPVRSVUUN
CiA7Q049cmhhbmxleUBnb29nbGUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpyaGFubGV5QGdv
b2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049dmlzaHdhQGxpbnV4LnZuZXQu
aWJtLmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86dmlzaHdhQGxpbnV4LnZuZXQuaQ0KIGJtLmNv
bQ0KQVRURU5ERUU7Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPVRSDQogVUU7Q049U1ZMLU1BVDMtNC1TZWEgRHJpdmUgKDcpIFtH
VkNdO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpnb29nbGUuY29tXzcyNmY2DQogZjZkNWY3NTczNWY3
Mzc2NmM1ZjZkNjE3NDMzNWYzNDVmMzQ2YTM3QHJlc291cmNlLmNhbGVuZGFyLmdvb2dsZS5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049bmVsYWRrQG1pY3Jvc29mdC5jb207WC1OVU0t
R1VFU1RTPTA6bWFpbHRvOm5lbGFka0BtaWNyb3NvZnQuY29tDQpYLU1JQ1JPU09GVC1DRE8tT1dO
RVJBUFBUSUQ6LTE5NTQxODkyMjQNCkNSRUFURUQ6MjAyMDAxMTRUMDAyMTU5Wg0KREVTQ1JJUFRJ
T046VGhlcmUgaGFzIGJlZW4gc29tZSBlbWFpbCBkaXNjdXNzaW9uIG9uIHRoZSBtYWlsaW5nIGxp
c3QgYWJvdXQgDQogd29ya2luZyBvbiBhIFJlZGZpc2ggYWdncmVnYXRvci4gIEknZCBsaWtlIHRv
IHRha2Ugc29tZSB0aW1lIHRvIGhhdmUgYSBsaXZlDQogIGRpc2N1c3Npb24gYWJvdXQgdmFyaW91
cyB1c2UgY2FzZXMgYW5kIHJlcXVpcmVtZW50cy5cblxuU29tZSBhZ2VuZGEgaXRlbXMgDQogdG8g
Y29uc2lkZXI6XG5cbjEpIExheWVyIDIvMyBkaXNjb3ZlcnkgYW5kIG5lZ290aWF0aW9uXG5cbjIp
IENhY2hpbmdcLCBwcm94DQogeVwsIGFuZCBjb25zaXN0ZW5jeSByZXF1aXJlbWVudHNcblxuMykg
VGFyZ2V0IGhhcmR3YXJlXCwgcGVyZm9ybWFuY2UgcmVxdWlyDQogZW1lbnRzXCwgYW5kIHNjYWxl
IG9mIGFnZ3JlZ2F0aW9uXG5cbjQpIFRvb2xpbmcgYW5kIGluZnJhc3RydWN0dXJlIGltcHJvdmVt
DQogZW50cyBuZWVkZWQgdG8gc3VwcG9ydCBhbiBhZ2dyZWdhdG9yXG5cbjUpIEFtb3VudCBvZiBj
b25maWd1cmF0aW9uIGFuZCBrbm93DQogbGVkZ2UgYW4gYWdncmVnYXRvciBuZWVkcyB0byBrbm93
IGEgcHJpb3JpLlxuXG42KSBEYXRhIHByZXNlbnRhdGlvbiBmcm9tIEluDQogYmFuZD9cblxuNykg
U2VjdXJpdHkgXG5cbi06On46fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+On46DQogfjp+On46fjp+On46fjp+On46fjp+On46fjp+On46On46fjo6LVxuUGxlYXNlIGRv
IG5vdCBlZGl0IHRoaXMgc2VjdGlvbiBvZiB0DQogaGUgZGVzY3JpcHRpb24uXG5cblRoaXMgZXZl
bnQgaGFzIGEgdmlkZW8gY2FsbC5cbkpvaW46IGh0dHBzOi8vbWVldC5nb29nbGUuDQogY29tL2Jx
aC1hamVjLWJxeVxuKzEgNzA3LTcwMi0yNzM4IFBJTjogMjkzMzAyI1xuVmlldyBtb3JlIHBob25l
IG51bWJlcnM6IGh0DQogdHBzOi8vdGVsLm1lZXQvYnFoLWFqZWMtYnF5P3Bpbj05MDAxOTc2NDAz
MTkxJmhzPTdcblxuVmlldyB5b3VyIGV2ZW50IGF0IGh0DQogdHBzOi8vd3d3Lmdvb2dsZS5jb20v
Y2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU5UVnVaMkZ0YVc5amFXcHdObVExY1c0DQog
Mk5IVTFOR1ZtYUhBZ2IzQmxibUp0WTBCc2FYTjBjeTV2ZW14aFluTXViM0puJnRvaz1NVGdqY21o
aGJteGxlVUJuYjI5bmJHVXVZDQogMjl0WXpsbU5XVXlZalExT1RFNFpETXhZMlpsTW1VeVpERm1a
bVV4T0dSak1EVTJNV016T1RJM053JmN0ej1BbWVyaWNhJTJGTG9zDQogX0FuZ2VsZXMmaGw9ZW4m
ZXM9MS5cbi06On46fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+DQogOn46fjp+On46fjp+On46fjp+On46fjp+On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoy
MDIwMDExNFQwMDIxNTlaDQpMT0NBVElPTjpTVkwtTUFUMy00LVNlYSBEcml2ZSAoNykgW0dWQ10N
ClNFUVVFTkNFOjANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6Qk1DL1JlZGZpc2ggQWdncmVn
YXRvciBVc2UgQ2FzZSBhbmQgUmVxdWlyZW1lbnRzDQpUUkFOU1A6T1BBUVVFDQpFTkQ6VkVWRU5U
DQpFTkQ6VkNBTEVOREFSDQo=
--0000000000009e258a059c0e94c3--
