Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95614E623
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 00:40:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487xg613XhzDqcn
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 10:40:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c4a;
 helo=mail-yw1-xc4a.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=lvQjWBu7; dkim-atps=neutral
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487xfV4kS6zDqSN
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 10:40:01 +1100 (AEDT)
Received: by mail-yw1-xc4a.google.com with SMTP id r75so4715613ywg.19
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 15:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:message-id:date:subject:from:to;
 bh=acITM3jf3rk7YNDnwyLqcO/Ei/mtWm8VSzzO5apP6dY=;
 b=lvQjWBu7yk6HxKE2lRnXgRvHvtWBVVYSrDojus+mY8x1KfOwH/i+2XjRrYfDTOx3vH
 KAssieCdk3n5mtCEPEjLZdJz4chEbCsOvpKPcxHPgorSxXklUPwozJPlh7DMIa5p8qSi
 C/LZI+TzVWgfavTTHgMorxADEkVH/BpMBiFJadr8euQsFLH5U0NcOoX8NyjDFwDkngB9
 XkzTCLub6d3RJikjCoSBb7bxRvRvL1NutOHWK/TkHtpHkBwCFqijaj20f05I64OpV2Jn
 Xhkmvs3A+ggZ5WZjcBJhGPF2ba4GBFCJ4LFxGc8RwjvVO6qUHs9qDDTsH+6aJ6wUVey7
 nL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
 :subject:from:to;
 bh=acITM3jf3rk7YNDnwyLqcO/Ei/mtWm8VSzzO5apP6dY=;
 b=p4A3ZtA6DepkEK1srgf7vrEhX5uOtzOvnWMvGZ14FftTsH8hosgRvvnjhkkA0z5X3v
 L0bVBElX1U8xsPI1i/x2yVKmrAQ/R7KO6dbPEPFLrYFtYGIXrwryQ0qbIl5RGZdA6tQz
 RWbHPFyGgjxn2xx1l37xWd3xpWWV6Fdjuy14G4DZCJUngx49OMsm9oYjlFWbg3uoS259
 lu4Vq8jRJSC83UCbY28N9VmBXOLHxk/uml7sPPwLXW2hcHwGb8DMO6GvSpbdP21qJOup
 prUqIUpxTaZ+vRPaP/0/N9XCzMh0GrhzxB+BLeq+Q8WmEWG24d+7iQlg7qrZnLiDDnZg
 rDIw==
X-Gm-Message-State: APjAAAVcmcB+w94bRajd4hJNRnMNp5GEEy3llMWszAvGOxxLwskB7A74
 XBNQpmKYLQdEaIg0VRQQvaVMoyXL4OalhlnEbNVCqDRlcvEHCQwKZmsNhj/406jCCT/z7TAUwns
 oJ6fUnTE9iG26wcMfwkDla/l0zKx2Ho8PyPPRwcpdoELUn1E0WEIpOLJ7YcxX6hdv7TmwUFrFSX
 /OQg==
X-Google-Smtp-Source: APXvYqwIQDM6Po8KhcYnhkmN4vPFow2rfVKYVPsZI4t553SeNU6/tU/52jDpQ1gni2K+YNhbzMKnid5ahifKkwGsrieF
MIME-Version: 1.0
X-Received: by 2002:a81:7b0b:: with SMTP id w11mr5434083ywc.10.1580427597522; 
 Thu, 30 Jan 2020 15:39:57 -0800 (PST)
Message-ID: <0000000000008b9ec1059d63f99b@google.com>
Date: Thu, 30 Jan 2020 23:39:57 +0000
Subject: Invitation: BMC Aggregator Review @ Tue Feb 4, 2020 9:30pm - 10pm
 (PST) (openbmc@lists.ozlabs.org)
From: rhanley@google.com
To: openbmc@lists.ozlabs.org, vishwa@linux.vnet.ibm.com
Content-Type: multipart/mixed; boundary="0000000000008b9ea8059d63f99a"
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

--0000000000008b9ea8059d63f99a
Content-Type: multipart/alternative; boundary="0000000000008b9ea5059d63f998"

--0000000000008b9ea5059d63f998
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiBC
TUMgQWdncmVnYXRvciBSZXZpZXcNCkkgd2FudGVkIHRvIGdpdmUgYSBjaGFuY2UgZm9yIHBlb3Bs
ZSBhY3Jvc3MgdGhlIFBhY2lmaWMgdG8gZ2l2ZSBmZWVkYmFjayAgDQpmb3IgYSBCTUMgYWdncmVn
YXRvci4NCg0KV2Ugd2lsbCBjb3ZlciB0aGUgZGlzY3Vzc2lvbnMgZnJvbSBvdXIgbGFzdCBtZWV0
aW5nLCBhcyB3ZWxsIGFzICANCnJlcXVpcmVtZW50cyBmb3IgdGhlIGludGVyZmFjZSB0aGF0IGlz
IHByZXNlbnRlZCB0byB0aGUgb3V0c2lkZSB3b3JsZC4NCldoZW46IFR1ZSBGZWIgNCwgMjAyMCA5
OjMwcG0g4oCTIDEwcG0gUGFjaWZpYyBUaW1lIC0gTG9zIEFuZ2VsZXMNCldoZXJlOiBTVkwtTUFU
My00LVNhbmRjYXN0bGUgKDQpIFtHVkNdDQoNCkpvaW5pbmcgaW5mbzogSm9pbiBIYW5nb3V0cyBN
ZWV0DQpodHRwczovL21lZXQuZ29vZ2xlLmNvbS9pb2ktYXF3ZS13bXMNCg0KSm9pbiBieSBwaG9u
ZQ0KKzEgNTEzLTQ0My00MTM5IChQSU46IDI4MzQ4MykNCg0KTW9yZSBwaG9uZSBudW1iZXJzOiBo
dHRwczovL3RlbC5tZWV0L2lvaS1hcXdlLXdtcz9waW49NTQ4NTExNjAxNjM2OCZocz0wDQoNCkNh
bGVuZGFyOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCldobzoNCiAgICAgKiByaGFubGV5QGdv
b2dsZS5jb20gLSBvcmdhbml6ZXINCiAgICAgKiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCiAg
ICAgKiB2aXNod2FAbGludXgudm5ldC5pYm0uY29tDQoNCkV2ZW50IGRldGFpbHM6ICANCmh0dHBz
Oi8vd3d3Lmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU0yczBZak4x
Y21wcVkzTTVjR1ZtTW1WMWJ6bGhZVGczYzNZZ2IzQmxibUp0WTBCc2FYTjBjeTV2ZW14aFluTXVi
M0puJnRvaz1NVGdqY21oaGJteGxlVUJuYjI5bmJHVXVZMjl0WTJKbU0yWTVaVFkwTXpoalpURXda
akpoTURObFkyWTBZalZqTnpNMk0ySTFPRGt3TnpVek5nJmN0ej1BbWVyaWNhJTJGTG9zX0FuZ2Vs
ZXMmaGw9ZW4mZXM9MA0KDQpJbnZpdGF0aW9uIGZyb20gR29vZ2xlIENhbGVuZGFyOiBodHRwczov
L3d3dy5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGNvdXJ0
ZXN5IGVtYWlsIGF0IHRoZSBhY2NvdW50ICANCm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyBiZWNh
dXNlIHlvdSBhcmUgYW4gYXR0ZW5kZWUgb2YgdGhpcyBldmVudC4NCg0KVG8gc3RvcCByZWNlaXZp
bmcgZnV0dXJlIHVwZGF0ZXMgZm9yIHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4gIA0K
QWx0ZXJuYXRpdmVseSB5b3UgY2FuIHNpZ24gdXAgZm9yIGEgR29vZ2xlIGFjY291bnQgYXQgIA0K
aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9jYWxlbmRhci8gYW5kIGNvbnRyb2wgeW91ciBub3RpZmlj
YXRpb24gc2V0dGluZ3MgZm9yICANCnlvdXIgZW50aXJlIGNhbGVuZGFyLg0KDQpGb3J3YXJkaW5n
IHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNw
b25zZSB0byAgDQp0aGUgb3JnYW5pemVyIGFuZCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwg
b3IgaW52aXRlIG90aGVycyByZWdhcmRsZXNzICANCm9mIHRoZWlyIG93biBpbnZpdGF0aW9uIHN0
YXR1cywgb3IgdG8gbW9kaWZ5IHlvdXIgUlNWUC4gTGVhcm4gbW9yZSBhdCAgDQpodHRwczovL3N1
cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--0000000000008b9ea5059d63f998
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
gleCalendar" content=3D"3k4b3urjjcs9pef2euo9aa87sv"/><h3 style=3D"padding:0=
 0 6px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:b=
old;color:#222"><span itemprop=3D"name">BMC Aggregator Review</span></h3><t=
able style=3D"display:inline-table" cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" summary=3D"Event details"><tr><td style=3D"padding:0 1em 10px 0;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;wi=
dth:90px" valign=3D"top"><div><i style=3D"font-style:normal">When</i></div>=
</td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-siz=
e:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px"><time ite=
mprop=3D"startDate" datetime=3D"20200205T053000Z"></time><time itemprop=3D"=
endDate" datetime=3D"20200205T060000Z"></time>Tue Feb 4, 2020 9:30pm =E2=80=
=93 10pm <span style=3D"color:#888">Pacific Time - Los Angeles</span></div>=
</td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-seri=
f;font-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><=
div><i style=3D"font-style:normal">Where</i></div></td><td style=3D"padding=
-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=
=3D"top"><div style=3D"text-indent:-1px"><span itemprop=3D"location" itemsc=
ope itemtype=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"n=
otranslate">SVL-MAT3-4-Sandcastle (4) [GVC]</span><span dir=3D"ltr"> (<a hr=
ef=3D"https://www.google.com/maps/search/SVL-MAT3-4-Sandcastle+%284%29+%5BG=
VC%5D?hl=3Den" style=3D"color:#20c;white-space:nowrap" target=3D"_blank" it=
emprop=3D"map">map</a>)</span></span></div></td></tr><tr><td style=3D"paddi=
ng:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;whit=
e-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:norma=
l">Joining info</i></div></td><td style=3D"padding-bottom:10px;font-family:=
Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"te=
xt-indent:-1px"><span itemprop=3D"potentialaction" itemscope itemtype=3D"ht=
tp://schema.org/JoinAction"><span itemprop=3D"name" content=3D"meet.google.=
com/ioi-aqwe-wms"><span itemprop=3D"target" itemscope itemtype=3D"http://sc=
hema.org/EntryPoint"><span itemprop=3D"url" content=3D"https://meet.google.=
com/ioi-aqwe-wms"><span itemprop=3D"httpMethod" content=3D"GET"><a href=3D"=
https://meet.google.com/ioi-aqwe-wms" style=3D"color:#20c;white-space:nowra=
p" target=3D"_blank">meet.google.com/ioi-aqwe-wms</a></span></span></span><=
/span></span></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90p=
x"></td><td><div style=3D"text-indent:-1px"><table cellspacing=3D"0" cellpa=
dding=3D"0"><tr><td style=3D"padding-bottom:10px;font-family:Arial,Sans-ser=
if;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px=
"><span style=3D"color:#888">Join by phone <a href=3D"tel:+1 513-443-4139" =
style=3D"color:#20c;white-space:nowrap" target=3D"_blank"><span itemprop=3D=
"phoneNumber">+1 513-443-4139</span></a><span itemprop=3D"rtcPhoneNumberPas=
sCodeLabel">&nbsp; PIN</span><span itemprop=3D"passCode"> 283483#</span>&nb=
sp; <a href=3D"https://tel.meet/ioi-aqwe-wms?pin=3D5485116016368&amp;hs=3D0=
" style=3D"color:#20c;white-space:nowrap" target=3D"_blank">More phone numb=
ers</a></span></div></td></tr></table></div></td></tr><tr><td style=3D"padd=
ing:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;whi=
te-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:norm=
al">Calendar</i></div></td><td style=3D"padding-bottom:10px;font-family:Ari=
al,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-=
indent:-1px">openbmc@lists.ozlabs.org</div></td></tr><tr><td style=3D"paddi=
ng:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;whit=
e-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:norma=
l">Who</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,San=
s-serif;font-size:13px;color:#222" valign=3D"top"><table cellspacing=3D"0" =
cellpadding=3D"0"><tr><td style=3D"padding-right:10px;font-family:Arial,San=
s-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1p=
x"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></div><=
/td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:=
13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:=
0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schem=
a.org/Person"><span itemprop=3D"name" class=3D"notranslate">rhanley@google.=
com</span><meta itemprop=3D"email" content=3D"rhanley@google.com"/></span><=
span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org/Person"=
><meta itemprop=3D"name" content=3D"rhanley@google.com"/><meta itemprop=3D"=
email" content=3D"rhanley@google.com"/></span><span style=3D"font-size:11px=
;color:#888"> - organizer</span></div></div></div></td></tr><tr><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family:C=
ourier New,monospace">&#x2022;</span></div></td><td style=3D"padding-right:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"=
text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"=
attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D=
"name" class=3D"notranslate">openbmc@lists.ozlabs.org</span><meta itemprop=
=3D"email" content=3D"openbmc@lists.ozlabs.org"/></span></div></div></div><=
/td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;f=
ont-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span =
style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><td s=
tyle=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em=
 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Per=
son"><span itemprop=3D"name" class=3D"notranslate">vishwa@linux.vnet.ibm.co=
m</span><meta itemprop=3D"email" content=3D"vishwa@linux.vnet.ibm.com"/></s=
pan></div></div></div></td></tr></table></td></tr></table><div style=3D"flo=
at:right;font-weight:bold;font-size:13px"> <a href=3D"https://www.google.co=
m/calendar/event?action=3DVIEW&amp;eid=3DM2s0YjN1cmpqY3M5cGVmMmV1bzlhYTg3c3=
Ygb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn&amp;tok=3DMTgjcmhhbmxleUBnb29nbGUuY29tY2=
JmM2Y5ZTY0MzhjZTEwZjJhMDNlY2Y0YjVjNzM2M2I1ODkwNzUzNg&amp;ctz=3DAmerica%2FLo=
s_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" i=
temprop=3D"url">more details &raquo;</a><br></div><div style=3D"padding-bot=
tom:15px;font-family:Arial,Sans-serif;font-size:13px;color:#222;white-space=
:pre-wrap!important;white-space:-moz-pre-wrap!important;white-space:-pre-wr=
ap!important;white-space:-o-pre-wrap!important;white-space:pre;word-wrap:br=
eak-word"><span>I wanted to give a chance for people across the Pacific to =
give feedback for a BMC aggregator.  <p>We will cover the discussions from =
our last meeting, as well as requirements for the interface that is present=
ed to the outside world.</p></span><meta itemprop=3D"description" content=
=3D"I wanted to give a chance for people across the Pacific to give feedbac=
k for a BMC aggregator. =20

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
--0000000000008b9ea5059d63f998
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20200205T053000Z
DTEND:20200205T060000Z
DTSTAMP:20200130T233957Z
ORGANIZER;CN=rhanley@google.com:mailto:rhanley@google.com
UID:3k4b3urjjcs9pef2euo9aa87sv@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=openbmc@lists.ozlabs.org;X-NUM-GUESTS=0:mailto:openbmc@lists.ozlabs
 .org
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=SVL-MAT3-4-Sandcastle (4) [GVC];X-NUM-GUESTS=0:mailto:google.com_726f
 6f6d5f75735f73766c5f6d6174335f345f346833@resource.calendar.google.com
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
 s_Angeles&hl=en&es=1.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200130T233956Z
LOCATION:SVL-MAT3-4-Sandcastle (4) [GVC]
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:BMC Aggregator Review
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000008b9ea5059d63f998--

--0000000000008b9ea8059d63f99a
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjAwMjA1VDA1MzAwMFoNCkRURU5EOjIwMjAwMjA1
VDA2MDAwMFoNCkRUU1RBTVA6MjAyMDAxMzBUMjMzOTU3Wg0KT1JHQU5JWkVSO0NOPXJoYW5sZXlA
Z29vZ2xlLmNvbTptYWlsdG86cmhhbmxleUBnb29nbGUuY29tDQpVSUQ6M2s0YjN1cmpqY3M5cGVm
MmV1bzlhYTg3c3ZAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1vcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm9wZW5ibWNAbGlzdHMu
b3psYWJzDQogLm9yZw0KQVRURU5ERUU7Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQ
QU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSDQogVUU7Q049U1ZMLU1BVDMtNC1TYW5k
Y2FzdGxlICg0KSBbR1ZDXTtYLU5VTS1HVUVTVFM9MDptYWlsdG86Z29vZ2xlLmNvbV83MjZmDQog
NmY2ZDVmNzU3MzVmNzM3NjZjNWY2ZDYxNzQzMzVmMzQ1ZjM0NjgzM0ByZXNvdXJjZS5jYWxlbmRh
ci5nb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJ
UEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049cmhhbmxleUBnb29nbGUuY29t
O1gtTlVNLUdVRVNUUz0wOm1haWx0bzpyaGFubGV5QGdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQ
RT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtS
U1ZQPQ0KIFRSVUU7Q049dmlzaHdhQGxpbnV4LnZuZXQuaWJtLmNvbTtYLU5VTS1HVUVTVFM9MDpt
YWlsdG86dmlzaHdhQGxpbnV4LnZuZXQuaQ0KIGJtLmNvbQ0KWC1NSUNST1NPRlQtQ0RPLU9XTkVS
QVBQVElEOjEzOTk4NTg2NTINCkNSRUFURUQ6MjAyMDAxMzBUMjMzOTU2Wg0KREVTQ1JJUFRJT046
SSB3YW50ZWQgdG8gZ2l2ZSBhIGNoYW5jZSBmb3IgcGVvcGxlIGFjcm9zcyB0aGUgUGFjaWZpYyB0
byBnaXZlDQogIGZlZWRiYWNrIGZvciBhIEJNQyBhZ2dyZWdhdG9yLiAgXG5cbldlIHdpbGwgY292
ZXIgdGhlIGRpc2N1c3Npb25zIGZyb20gb3VyDQogIGxhc3QgbWVldGluZ1wsIGFzIHdlbGwgYXMg
cmVxdWlyZW1lbnRzIGZvciB0aGUgaW50ZXJmYWNlIHRoYXQgaXMgcHJlc2VudGVkDQogIHRvIHRo
ZSBvdXRzaWRlIHdvcmxkLlxuXG4tOjp+On46On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+DQogOn46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi1cblBs
ZWFzZSBkbyBub3QgZWRpdCB0aGlzIHNlY3Rpb24gb2YgDQogdGhlIGRlc2NyaXB0aW9uLlxuXG5U
aGlzIGV2ZW50IGhhcyBhIHZpZGVvIGNhbGwuXG5Kb2luOiBodHRwczovL21lZXQuZ29vZ2xlDQog
LmNvbS9pb2ktYXF3ZS13bXNcbisxIDUxMy00NDMtNDEzOSBQSU46IDI4MzQ4MyNcblZpZXcgbW9y
ZSBwaG9uZSBudW1iZXJzOiBoDQogdHRwczovL3RlbC5tZWV0L2lvaS1hcXdlLXdtcz9waW49NTQ4
NTExNjAxNjM2OCZocz03XG5cblZpZXcgeW91ciBldmVudCBhdCBoDQogdHRwczovL3d3dy5nb29n
bGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1NMnMwWWpOMWNtcHFZM001Y0dW
bU1tDQogVjFiemxoWVRnM2MzWWdiM0JsYm1KdFkwQnNhWE4wY3k1dmVteGhZbk11YjNKbiZ0b2s9
TVRnamNtaGhibXhsZVVCbmIyOW5iR1V1DQogWTI5dFkySm1NMlk1WlRZME16aGpaVEV3WmpKaE1E
TmxZMlkwWWpWak56TTJNMkkxT0Rrd056VXpOZyZjdHo9QW1lcmljYSUyRkxvDQogc19BbmdlbGVz
JmhsPWVuJmVzPTEuXG4tOjp+On46On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46DQogfjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi0NCkxBU1QtTU9E
SUZJRUQ6MjAyMDAxMzBUMjMzOTU2Wg0KTE9DQVRJT046U1ZMLU1BVDMtNC1TYW5kY2FzdGxlICg0
KSBbR1ZDXQ0KU0VRVUVOQ0U6MA0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWTpCTUMgQWdncmVn
YXRvciBSZXZpZXcNClRSQU5TUDpPUEFRVUUNCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--0000000000008b9ea8059d63f99a--
