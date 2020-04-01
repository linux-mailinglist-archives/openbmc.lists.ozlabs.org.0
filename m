Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B15119A35F
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 03:53:42 +0200 (CEST)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sTkW6jDyzDqx0
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 12:53:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=3538a206a=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 73 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Apr 2020 12:52:41 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 48sTjP5v0CzDqv8
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 12:52:39 +1100 (AEDT)
IronPort-SDR: RSy0rfgqFHkZYQk7JCjE4oDSaqLaFheEJqhtq0y3DPXR+dZp9YiIhKWyf9SHOsJ+ZngxaryDSw
 q/FwrNv/kddg==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 01 Apr 2020 09:51:21 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 1 Apr 2020
 09:51:20 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Wed, 1 Apr 2020 09:51:20 +0800
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Question of Lost Dbus
Thread-Topic: Question of Lost Dbus
Thread-Index: AQHWBybAQdbbZR2aQUC0ULTFHgv2tqhid34AgAD/o8A=
Date: Wed, 1 Apr 2020 01:51:19 +0000
Message-ID: <a45827f8a03e49e196819d316496fbf7@quantatw.com>
References: <5d8c24246ba2413a99eff60aca2a9f71@quantatw.com>
 <9A81C050-75DA-4D2A-9476-0FB940C87193@fb.com>
In-Reply-To: <9A81C050-75DA-4D2A-9476-0FB940C87193@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 8FE6BB3F749EA1B6F0CA8571EE3227F2BC8E8B986F2F28AB36ACA922F783FEE92000:8
Content-Type: multipart/alternative;
 boundary="_000_a45827f8a03e49e196819d316496fbf7quantatwcom_"
MIME-Version: 1.0
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

--_000_a45827f8a03e49e196819d316496fbf7quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgVmlqYXksDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNvbW1lbnRzLiBDaGFubmVsIGNvbmZpZyBo
YXMgYWxyZWFkeSBkZWZpbmVkIGluIG91ciBzeXN0ZW0sDQoNCmFjdHVhbGx5IG1vc3Qgb2YgaXBt
aSBjb21tYW5kcyBjYW4gd29yayBub3JtYWxseS4gVGhlIGNvbmZpZyBpbiBvdXIgc3lzdGVtIGxp
a2UgYmVsb3c6DQoNCg0KDQoiMCIgOiB7DQoibmFtZSIgOiAiSVBNQiIsDQoiaXNfdmFsaWQiIDog
dHJ1ZSwNCiJhY3RpdmVfc2Vzc2lvbnMiIDogMCwNCiJjaGFubmVsX2luZm8iIDogew0KIm1lZGl1
bV90eXBlIiA6ICJpcG1iIiwNCiJwcm90b2NvbF90eXBlIiA6ICJpcG1iLTEuMCIsDQoic2Vzc2lv
bl9zdXBwb3J0ZWQiIDogInNlc3Npb24tbGVzcyIsDQoiaXNfaXBtaSIgOiB0cnVlDQp9DQp9LA0K
IjEiIDogew0KIm5hbWUiIDogImV0aDAiLA0KImlzX3ZhbGlkIiA6IHRydWUsDQoiYWN0aXZlX3Nl
c3Npb25zIiA6IDAsDQoiY2hhbm5lbF9pbmZvIiA6IHsNCiJtZWRpdW1fdHlwZSIgOiAibGFuLTgw
Mi4zIiwNCiJwcm90b2NvbF90eXBlIiA6ICJpcG1iLTEuMCIsDQoic2Vzc2lvbl9zdXBwb3J0ZWQi
IDogIm11bHRpLXNlc3Npb24iLA0KImlzX2lwbWkiIDogdHJ1ZQ0KfQ0KfSwNCiIyIiA6IHsNCiJu
YW1lIiA6ICJldGgxIiwNCiJpc192YWxpZCIgOiB0cnVlLA0KImFjdGl2ZV9zZXNzaW9ucyIgOiAw
LA0KImNoYW5uZWxfaW5mbyIgOiB7DQoibWVkaXVtX3R5cGUiIDogImxhbi04MDIuMyIsDQoicHJv
dG9jb2xfdHlwZSIgOiAiaXBtYi0xLjAiLA0KInNlc3Npb25fc3VwcG9ydGVkIiA6ICJtdWx0aS1z
ZXNzaW9uIiwNCiJpc19pcG1pIiA6IHRydWUNCn0NCg0KDQpCdXQgc29tZSBsYW4gY29uZmlndXJh
dGlvbiBjb21tYW5kcyBsaWtlIKGnSVB2NiBTdGF0aWMgQWRkcmVzc2Vzoaggd2lsbCB1c2UgZm9s
bG93aW5nIERCdXM6DQoNCnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5JUC5DcmVhdGUNCg0K
DQoNClNpbmNlIG91ciBzeXN0ZW0gZG9lc26hpnQgaGF2ZSB0aGF0IERidXMsIHRoZSBzZXR0aW5n
IHdpbGwgZmFpbC4NCg0KoadDaGFzc2lzIGNhcGFiaWxpdGllc6GoIGFuZCBBQ1BJIGNvbW1hbmQg
YWxzbyBoYXZlIHRoZSBzYW1lIHByb2JsZW0uDQoNCg0KDQpTbyBJIHdhbnQgdG8ga25vdyB0aGF0
IGFyZSB0aGVyZSBzb21lIHNldHRpbmdzIG9yIHBhY2thZ2VzIEkgbG9zdC4NCg0KVGhhbmsgeW91
Lg0KDQoNCg0KU2luY2VyZWx5LA0KDQpTcGVuY2VyIEt1DQoNCkZyb206IFZpamF5IEtoZW1rYSA8
dmlqYXlraGVta2FAZmIuY29tPg0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxLCAyMDIwIDEyOjU4
IEFNDQpUbzogU3BlbmNlciBLdSAopWqlQLfsKSA8U3BlbmNlci5LdUBxdWFudGF0dy5jb20+OyBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBRdWVzdGlvbiBvZiBMb3N0IERi
dXMNCg0KDQoNClNwZW5jZXIsDQoNCllvdSBtaWdodCBuZWVkIHRvIGRlZmluZSB5b3VyIGNoYW5u
ZWwgY29uZmlnIGZpbGUgaW4gcGhvc3Bob3ItaXBtaS1jb25maWcgYW5kIGFkZCBjaGFubmVsIGZv
ciBuZXR3b3JrLg0KDQoNCg0KUmVnYXJkcw0KDQotVmlqYXkNCg0KDQoNCkZyb206IG9wZW5ibWMg
PG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZzxtYWls
dG86b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPj4g
b24gYmVoYWxmIG9mICJTcGVuY2VyIEt1ICilaqVAt+wpIiA8U3BlbmNlci5LdUBxdWFudGF0dy5j
b208bWFpbHRvOlNwZW5jZXIuS3VAcXVhbnRhdHcuY29tPj4NCkRhdGU6IE1vbmRheSwgTWFyY2gg
MzAsIDIwMjAgYXQgMTE6NDUgUE0NClRvOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0
bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+IiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1h
aWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+Pg0KU3ViamVjdDogUXVlc3Rpb24gb2YgTG9z
dCBEYnVzDQoNCg0KDQpIaSBFdmVyeW9uZSwNCg0KSSBoYXZlIHNvbWUgcHJvYmxlbSBhYm91dCB0
aGF0IHdoZW4gaSB1c2luZyBzb21lIGlwbWkgY29tbWFuZHMsIGl0IHdpbGwgcmV0dXJuICJVbnNw
ZWNpZmllZCBlcnJvciIsDQoNCmFuZCBhZnRlciBJIHRyYWNpbmcgY29kZSBpbiBwaG9zaHBvci1p
cG1pLWhvc3QgcGFja2FnZSwgSSBmaW5kIHRoYXQgdGhlcmUgYXJlIHNvbWUgRHVicyBkb2Vzbid0
IGNyZWF0ZSBpbiBvdXIgb3BlbmJtYyBzeXN0ZW0uDQoNCk1vc3Qgb2YgdGhlbSBhcmUgbmV0d29y
ayByZWxhdGlvbmFsIERidXMsIGFuZCBoZXJlIGlzIHRoZSBEYnVzIGxpc3Qgd2hpY2ggZG8gbm90
IGNyZWF0ZSBpbiBvdXIgc3lzdGVtOg0KDQoNCg0KTmV0d290azoNCg0KeHl6Lm9wZW5ibWNfcHJv
amVjdC5OZXR3b3JrLlN5c3RlbUNvbmZpZ3VyYXRpb24NCg0KeHl6Lm9wZW5ibWNfcHJvamVjdC5O
ZXR3b3JrLkV0aGVybmV0SW50ZXJmYWNlDQoNCnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5J
UA0KDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuSVAuQ3JlYXRlDQoNCnh5ei5vcGVuYm1j
X3Byb2plY3QuTmV0d29yay5NQUNBZGRyZXNzDQoNCnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29y
ay5OZWlnaGJvcg0KDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuTmVpZ2hib3IuQ3JlYXRl
U3RhdGljDQoNCnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5WTEFODQoNCnh5ei5vcGVuYm1j
X3Byb2plY3QuTmV0d29yay5WTEFOLkNyZWF0ZQ0KDQoNCg0KQUNQSToNCg0KeHl6Lm9wZW5ibWNf
cHJvamVjdC5Db250cm9sLlBvd2VyLkFDUElQb3dlclN0YXRlDQoNCg0KDQpDaGFzc2lzIENhcGFi
aWxpdGllczoNCg0KeHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkNoYXNzaXNDYXBhYmlsaXRp
ZXMNCg0KDQoNCg0KDQpBbmQgaGVyZSBhcmUgb25seSB0d28gbmV0d29yayByZWxhdGlvbmFsIERi
dXMgaW4gb3VyIHN5c3RlbToNCg0KU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcms6
DQoNCqJ8oncveHl6DQoNCiAgonyidy94eXovb3BlbmJtY19wcm9qZWN0DQoNCiAgICCifKJ3L3h5
ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yaw0KDQogICAgICCidaJ3L3h5ei9vcGVuYm1jX3Byb2pl
Y3QvbmV0d29yay9jb25maWcNCg0KICAgICAgonggonyidy94eXovb3BlbmJtY19wcm9qZWN0L25l
dHdvcmsvY29uZmlnL2RoY3ANCg0KICAgICAgonWidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdv
cmsvZXRoMA0KDQogICAgICCieCCidaJ3L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgw
L2lwdjQNCg0KICAgICAgonggonggonyidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRo
MC9pcHY0LzhlMWJmYTJmDQoNCiAgICAgIKJ4IKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3
b3JrL2V0aDAvaXB2Ng0KDQogICAgICCieCAgIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3
b3JrL2V0aDAvaXB2Ni9iYzQxZWVmNg0KDQogICAgICCidaJ3L3h5ei9vcGVuYm1jX3Byb2plY3Qv
bmV0d29yay9ldGgxDQoNCiAgICAgIKJ4IKJ1oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3Jr
L2V0aDEvaXB2NA0KDQogICAgICCieCCieCCifKJ3L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29y
ay9ldGgxL2lwdjQvMWM0YTE4N2YNCg0KICAgICAgonggonyidy94eXovb3BlbmJtY19wcm9qZWN0
L25ldHdvcmsvZXRoMS9pcHY2DQoNCiAgICAgIKJ4ICAgonyidy94eXovb3BlbmJtY19wcm9qZWN0
L25ldHdvcmsvZXRoMS9pcHY2LzczYTJhNWQwDQoNCiAgICAgIKJ1oncveHl6L29wZW5ibWNfcHJv
amVjdC9uZXR3b3JrL3NpdDANCg0KICAgICAgonyidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdv
cmsvdXNiMA0KDQogICAgICAgIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL3VzYjAv
aXB2NA0KDQogICAgICAgICAgonyidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvdXNiMC9p
cHY0L2NhY2EwZDFkDQoNCg0KDQpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5T
Tk1QOg0KDQqifKJ3L3h5eg0KDQogIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdA0KDQogICAgonyi
dy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsNCg0KICAgICAgonyidy94eXovb3BlbmJtY19w
cm9qZWN0L25ldHdvcmsvc25tcA0KDQogICAgICAgIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9u
ZXR3b3JrL3NubXAvbWFuYWdlcg0KDQoNCg0KQXJlIHRoZXJlIHNvbWUgcGFja2FnZXMgaSBsb3Np
bmcgdG8gYWRkIGludG8gb3VyIHN5c3RlbT8NCg0KRmVlbCBmcmVlIHRvIGdpdmUgeW91ciBjb21t
ZW50cywgdGhhbmsgeW91Lg0KDQoNCg0KU2luY2VyZWx5LA0KDQpTcGVuY2VyIEt1DQoNCg0K

--_000_a45827f8a03e49e196819d316496fbf7quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div style=3D"">
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">Hi <a name=
=3D"_MailOriginal" style=3D"font-family: Calibri, sans-serif; font-size: 14=
.6667px;">
<span lang=3D"EN-US">Vijay</span></a>,</span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">Thank you fo=
r the comments. Channel
<span style=3D"">config</span> has already defined in our system,</span><sp=
an lang=3D"EN-US">
</span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">actually mos=
t of <span style=3D"">
ipmi</span> commands can work normally. The <span style=3D"">config</span> =
in our system like below:</span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">&nbsp;</span=
></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D"></p>
<div style=3D"color: rgb(212, 212, 212); background-color: rgb(30, 30, 30);=
 font-family: &quot;Droid Sans Mono&quot;, monospace, monospace, &quot;Droi=
d Sans Fallback&quot;; font-size: 14px; line-height: 19px; white-space: pre=
;">
<div><span style=3D"color: #9cdcfe;">&quot;0&quot;</span> : {</div>
<div><span style=3D"color: #9cdcfe;">&quot;name&quot;</span> : <span style=
=3D"color: #ce9178;">
&quot;IPMB&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;is_valid&quot;</span> : <span st=
yle=3D"color: #569cd6;">
true</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;active_sessions&quot;</span> : <=
span style=3D"color: #b5cea8;">
0</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;channel_info&quot;</span> : {</d=
iv>
<div><span style=3D"color: #9cdcfe;">&quot;medium_type&quot;</span> : <span=
 style=3D"color: #ce9178;">
&quot;ipmb&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;protocol_type&quot;</span> : <sp=
an style=3D"color: #ce9178;">
&quot;ipmb-1.0&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;session_supported&quot;</span> :=
 <span style=3D"color: #ce9178;">
&quot;session-less&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;is_ipmi&quot;</span> : <span sty=
le=3D"color: #569cd6;">
true</span></div>
<div>}</div>
<div>},</div>
<div><span style=3D"color: #9cdcfe;">&quot;1&quot;</span> : {</div>
<div><span style=3D"color: #9cdcfe;">&quot;name&quot;</span> : <span style=
=3D"color: #ce9178;">
&quot;eth0&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;is_valid&quot;</span> : <span st=
yle=3D"color: #569cd6;">
true</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;active_sessions&quot;</span> : <=
span style=3D"color: #b5cea8;">
0</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;channel_info&quot;</span> : {</d=
iv>
<div><span style=3D"color: #9cdcfe;">&quot;medium_type&quot;</span> : <span=
 style=3D"color: #ce9178;">
&quot;lan-802.3&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;protocol_type&quot;</span> : <sp=
an style=3D"color: #ce9178;">
&quot;ipmb-1.0&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;session_supported&quot;</span> :=
 <span style=3D"color: #ce9178;">
&quot;multi-session&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;is_ipmi&quot;</span> : <span sty=
le=3D"color: #569cd6;">
true</span></div>
<div>}</div>
<div>},</div>
<div><span style=3D"color: #9cdcfe;">&quot;2&quot;</span> : {</div>
<div><span style=3D"color: #9cdcfe;">&quot;name&quot;</span> : <span style=
=3D"color: #ce9178;">
&quot;eth1&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;is_valid&quot;</span> : <span st=
yle=3D"color: #569cd6;">
true</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;active_sessions&quot;</span> : <=
span style=3D"color: #b5cea8;">
0</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;channel_info&quot;</span> : {</d=
iv>
<div><span style=3D"color: #9cdcfe;">&quot;medium_type&quot;</span> : <span=
 style=3D"color: #ce9178;">
&quot;lan-802.3&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;protocol_type&quot;</span> : <sp=
an style=3D"color: #ce9178;">
&quot;ipmb-1.0&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;session_supported&quot;</span> :=
 <span style=3D"color: #ce9178;">
&quot;multi-session&quot;</span>,</div>
<div><span style=3D"color: #9cdcfe;">&quot;is_ipmi&quot;</span> : <span sty=
le=3D"color: #569cd6;">
true</span></div>
<div>}</div>
</div>
</span>
<p></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<br>
</p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">But some <sp=
an style=3D"">
lan</span> configuration commands like =A1=A7IPv6 Static Addresses=A1=A8 wi=
ll use following
<span style=3D"">DBus</span>:</span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F4=
97D"><b>xyz.openbmc_project.Network.IP.Create</b></span></span><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D"></span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">&nbsp;</span=
></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">Since our sy=
stem doesn=A1=A6t have that
<span style=3D"">Dbus</span>, the setting will fail.</span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">=A1=A7Chassi=
s capabilities=A1=A8 and ACPI command also have the same problem.</span></p=
>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">&nbsp;</span=
></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">So I want to=
 know that are there some settings or packages I lost.</span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">Thank you.</=
span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">&nbsp;</span=
></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">Sincerely,</=
span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span lang=3D"EN-US" style=3D"font-size:12.0pt; color:#1F497D">Spencer Ku</=
span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<a name=3D"_MailOriginal"><b><span lang=3D"EN-US">From:</span></b><span lan=
g=3D"EN-US"> Vijay
</span></a><span style=3D""><span style=3D""><span lang=3D"EN-US">Khemka</s=
pan></span></span><span style=3D""><span lang=3D"EN-US"> &lt;vijaykhemka@fb=
.com&gt;
<br>
<b>Sent:</b> Wednesday, April 1, 2020 12:58 AM<br>
<b>To:</b> Spencer Ku (</span></span><span style=3D""><span style=3D"font-f=
amily:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=A5j=A5@=B7=EC</span><span =
lang=3D"EN-US">) &lt;Spencer.Ku@quantatw.com&gt;; openbmc@lists.ozlabs.org<=
br>
<b>Subject:</b> Re: Question of Lost Dbus</span></span></p>
</div>
</div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">&nbsp;</span></span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">Spencer,</span></span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">You might need to define your channel=
 config file in phosphor-ipmi-config and add channel for network.</span></s=
pan></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">&nbsp;</span></span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">Regards</span></span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">-Vijay</span></span></p>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">&nbsp;</span></span></p>
<div style=3D"border:none; border-top:solid #B5C4DF 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><b><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:b=
lack">From: </span>
</b></span><span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt;=
 color:black">openbmc &lt;</span></span><a href=3D"mailto:openbmc-bounces&#=
43;vijaykhemka=3Dfb.com@lists.ozlabs.org" style=3D"color: rgb(5, 99, 193); =
text-decoration: underline;"><span style=3D""><span lang=3D"EN-US" style=3D=
"font-size:12.0pt">openbmc-bounces&#43;vijaykhemka=3Dfb.com@lists.ozlabs.or=
g</span></span><span style=3D""></span></a><span style=3D""><span lang=3D"E=
N-US" style=3D"font-size:12.0pt; color:black">&gt;
 on behalf of &quot;Spencer Ku (</span></span><span style=3D""><span style=
=3D"font-size:12.0pt; font-family:&quot;MS Gothic&quot;; color:black">=A5j=
=A5@=B7=EC</span></span><span style=3D""><span lang=3D"EN-US" style=3D"font=
-size:12.0pt; color:black">)&quot; &lt;</span></span><a href=3D"mailto:Spen=
cer.Ku@quantatw.com" style=3D"color: rgb(5, 99, 193); text-decoration: unde=
rline;"><span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt">Sp=
encer.Ku@quantatw.com</span></span><span style=3D""></span></a><span style=
=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:black">&gt;<br>
<b>Date: </b>Monday, March 30, 2020 at 11:45 PM<br>
<b>To: </b>&quot;</span></span><a href=3D"mailto:openbmc@lists.ozlabs.org" =
style=3D"color: rgb(5, 99, 193); text-decoration: underline;"><span style=
=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt">openbmc@lists.ozlabs.=
org</span></span><span style=3D""></span></a><span style=3D""><span lang=3D=
"EN-US" style=3D"font-size:12.0pt; color:black">&quot;
 &lt;</span></span><a href=3D"mailto:openbmc@lists.ozlabs.org" style=3D"col=
or: rgb(5, 99, 193); text-decoration: underline;"><span style=3D""><span la=
ng=3D"EN-US" style=3D"font-size:12.0pt">openbmc@lists.ozlabs.org</span></sp=
an><span style=3D""></span></a><span style=3D""><span lang=3D"EN-US" style=
=3D"font-size:12.0pt; color:black">&gt;<br>
<b>Subject: </b>Question of Lost Dbus</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US">&nbsp;</span></span></p>
</div>
<div id=3D"divtagdefaultwrapper">
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">Hi Everyone,=
</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">I have some =
problem about that when i using&nbsp;some ipmi commands, it&nbsp;will&nbsp;=
return &quot;Unspecified error&quot;,</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">and after I =
tracing code in&nbsp;phoshpor-ipmi-host package, I find that there are some=
 Dubs doesn't create in our openbmc system.</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">Most of them=
 are network relational Dbus, and&nbsp;here is the Dbus list which do not c=
reate in our system:</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span=
></span></p>
<p><span style=3D""><b><span lang=3D"EN-US" style=3D"color:black">Netwotk:<=
/span></b><span lang=3D"EN-US" style=3D"color:black"></span></span></p>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.SystemConfiguration</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.EthernetInterface</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.IP</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.IP.Create</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.MACAddress</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.Neighbor</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.Neighbor.CreateStatic</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.VLAN</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">xyz.openbmc_project.Network.VLAN.Create</span></span></p>
</div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp;</span></span></p>
<p><span style=3D""><b><span lang=3D"EN-US" style=3D"color:black">ACPI:</sp=
an></b><span lang=3D"EN-US" style=3D"color:black"></span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">xyz.openbmc_=
project.Control.Power.ACPIPowerState</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span=
></span></p>
<p><span style=3D""><b><span lang=3D"EN-US" style=3D"color:black">Chassis C=
apabilities:</span></b><span lang=3D"EN-US" style=3D"color:black"></span></=
span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">xyz.openbmc_=
project.Control.ChassisCapabilities</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span=
></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span=
></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">And here are=
&nbsp;only two network relational Dbus in our system:</span></span></p>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><b><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:b=
lack">Service xyz.openbmc_project.Network:</span></b></span><span style=3D"=
"><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:black"></span></spa=
n></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">=A2|=A2w/xyz</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; =A2|=A2w/xyz/openbmc_project</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; </span>
</span><span style=3D""><span style=3D"font-size:12.0pt; font-family:&quot;=
MS Gothic&quot;; color:black">=A2u</span></span><span style=3D""><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:black">=A2w/xyz/openbmc_project=
/network/config</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x =A2|=A2w/xyz/openbmc_project/network/config/dh=
cp</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; </span>
</span><span style=3D""><span style=3D"font-size:12.0pt; font-family:&quot;=
MS Gothic&quot;; color:black">=A2u</span></span><span style=3D""><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:black">=A2w/xyz/openbmc_project=
/network/eth0</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x </span>
</span><span style=3D""><span style=3D"font-size:12.0pt; font-family:&quot;=
MS Gothic&quot;; color:black">=A2u</span></span><span style=3D""><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:black">=A2w/xyz/openbmc_project=
/network/eth0/ipv4</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x =A2x =A2|=A2w/xyz/openbmc_project/network/eth0=
/ipv4/8e1bfa2f</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x =A2|=A2w/xyz/openbmc_project/network/eth0/ipv6=
</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x&nbsp; &nbsp;=A2|=A2w/xyz/openbmc_project/netwo=
rk/eth0/ipv6/bc41eef6</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; </span>
</span><span style=3D""><span style=3D"font-size:12.0pt; font-family:&quot;=
MS Gothic&quot;; color:black">=A2u</span></span><span style=3D""><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:black">=A2w/xyz/openbmc_project=
/network/eth1</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x </span>
</span><span style=3D""><span style=3D"font-size:12.0pt; font-family:&quot;=
MS Gothic&quot;; color:black">=A2u</span></span><span style=3D""><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:black">=A2w/xyz/openbmc_project=
/network/eth1/ipv4</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x =A2x =A2|=A2w/xyz/openbmc_project/network/eth1=
/ipv4/1c4a187f</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x =A2|=A2w/xyz/openbmc_project/network/eth1/ipv6=
</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2x&nbsp; &nbsp;=A2|=A2w/xyz/openbmc_project/netwo=
rk/eth1/ipv6/73a2a5d0</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; </span>
</span><span style=3D""><span style=3D"font-size:12.0pt; font-family:&quot;=
MS Gothic&quot;; color:black">=A2u</span></span><span style=3D""><span lang=
=3D"EN-US" style=3D"font-size:12.0pt; color:black">=A2w/xyz/openbmc_project=
/network/sit0</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/usb0</span></s=
pan></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/usb0/ip=
v4</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/=
usb0/ipv4/caca0d1d</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp;</span></span></p>
</div>
<div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><b><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:b=
lack">Service xyz.openbmc_project.Network.SNMP:</span></b></span><span styl=
e=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:black"></span>=
</span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">=A2|=A2w/xyz</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; =A2|=A2w/xyz/openbmc_project</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network</span></span></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/snmp</span></s=
pan></p>
</div>
<div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp; &nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/snmp/ma=
nager</span></span></p>
</div>
</div>
<p style=3D"margin: 0cm 0cm 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif;">
<span style=3D""><span lang=3D"EN-US" style=3D"font-size:12.0pt; color:blac=
k">&nbsp;</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">Are there so=
me packages i losing to add into our system?</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">Feel free to=
 give your comments,&nbsp;thank you.</span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span=
></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">Sincerely,</=
span></span></p>
<p><span style=3D""><span lang=3D"EN-US" style=3D"color:black">Spencer Ku</=
span></span></p>
<span style=3D""></span>
<p><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span></p>
</div>
</div>
</div>
</body>
</html>

--_000_a45827f8a03e49e196819d316496fbf7quantatwcom_--
