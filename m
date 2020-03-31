Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141C198C7C
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 08:45:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s0FF5JRSzDqwH
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 17:45:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=3521f8a2e=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Tue, 31 Mar 2020 17:43:47 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 48s0Cl52gyzDrLv
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 17:43:45 +1100 (AEDT)
IronPort-SDR: V0PL4b+MZeHtDiUOD2Lxzw1+koVTupovCOnJEkYp+guU3MTba2HZLOkf/gK4qJCqvZhMJVyXJz
 kEkMo2bz6NFQ==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 31 Mar 2020 14:42:31 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 31 Mar
 2020 14:42:29 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Tue, 31 Mar 2020 14:42:29 +0800
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question of Lost Dbus
Thread-Topic: Question of Lost Dbus
Thread-Index: AQHWBybAQdbbZR2aQUC0ULTFHgv2tg==
Date: Tue, 31 Mar 2020 06:42:29 +0000
Message-ID: <5d8c24246ba2413a99eff60aca2a9f71@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 9570A5ACC34BA4E630F0296F2EB59C5FD586C64AB8B69F88D89F5446EF5584F22000:8
Content-Type: multipart/alternative;
 boundary="_000_5d8c24246ba2413a99eff60aca2a9f71quantatwcom_"
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

--_000_5d8c24246ba2413a99eff60aca2a9f71quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgRXZlcnlvbmUsDQoNCkkgaGF2ZSBzb21lIHByb2JsZW0gYWJvdXQgdGhhdCB3aGVuIGkgdXNp
bmcgc29tZSBpcG1pIGNvbW1hbmRzLCBpdCB3aWxsIHJldHVybiAiVW5zcGVjaWZpZWQgZXJyb3Ii
LA0KDQphbmQgYWZ0ZXIgSSB0cmFjaW5nIGNvZGUgaW4gcGhvc2hwb3ItaXBtaS1ob3N0IHBhY2th
Z2UsIEkgZmluZCB0aGF0IHRoZXJlIGFyZSBzb21lIER1YnMgZG9lc24ndCBjcmVhdGUgaW4gb3Vy
IG9wZW5ibWMgc3lzdGVtLg0KDQpNb3N0IG9mIHRoZW0gYXJlIG5ldHdvcmsgcmVsYXRpb25hbCBE
YnVzLCBhbmQgaGVyZSBpcyB0aGUgRGJ1cyBsaXN0IHdoaWNoIGRvIG5vdCBjcmVhdGUgaW4gb3Vy
IHN5c3RlbToNCg0KDQpOZXR3b3RrOg0KDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuU3lz
dGVtQ29uZmlndXJhdGlvbg0KeHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLkV0aGVybmV0SW50
ZXJmYWNlDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuSVANCnh5ei5vcGVuYm1jX3Byb2pl
Y3QuTmV0d29yay5JUC5DcmVhdGUNCnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5NQUNBZGRy
ZXNzDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuTmVpZ2hib3INCnh5ei5vcGVuYm1jX3By
b2plY3QuTmV0d29yay5OZWlnaGJvci5DcmVhdGVTdGF0aWMNCnh5ei5vcGVuYm1jX3Byb2plY3Qu
TmV0d29yay5WTEFODQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuVkxBTi5DcmVhdGUNCg0K
DQpBQ1BJOg0KDQp4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuUG93ZXIuQUNQSVBvd2VyU3Rh
dGUNCg0KDQpDaGFzc2lzIENhcGFiaWxpdGllczoNCg0KeHl6Lm9wZW5ibWNfcHJvamVjdC5Db250
cm9sLkNoYXNzaXNDYXBhYmlsaXRpZXMNCg0KDQoNCkFuZCBoZXJlIGFyZSBvbmx5IHR3byBuZXR3
b3JrIHJlbGF0aW9uYWwgRGJ1cyBpbiBvdXIgc3lzdGVtOg0KDQpTZXJ2aWNlIHh5ei5vcGVuYm1j
X3Byb2plY3QuTmV0d29yazoNCqJ8oncveHl6DQogIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdA0K
ICAgIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrDQogICAgICCidaJ3L3h5ei9vcGVu
Ym1jX3Byb2plY3QvbmV0d29yay9jb25maWcNCiAgICAgIKJ4IKJ8oncveHl6L29wZW5ibWNfcHJv
amVjdC9uZXR3b3JrL2NvbmZpZy9kaGNwDQogICAgICCidaJ3L3h5ei9vcGVuYm1jX3Byb2plY3Qv
bmV0d29yay9ldGgwDQogICAgICCieCCidaJ3L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9l
dGgwL2lwdjQNCiAgICAgIKJ4IKJ4IKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0
aDAvaXB2NC84ZTFiZmEyZg0KICAgICAgonggonyidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdv
cmsvZXRoMC9pcHY2DQogICAgICCieCAgIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3Jr
L2V0aDAvaXB2Ni9iYzQxZWVmNg0KICAgICAgonWidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdv
cmsvZXRoMQ0KICAgICAgonggonWidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMS9p
cHY0DQogICAgICCieCCieCCifKJ3L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgxL2lw
djQvMWM0YTE4N2YNCiAgICAgIKJ4IKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0
aDEvaXB2Ng0KICAgICAgonggICCifKJ3L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgx
L2lwdjYvNzNhMmE1ZDANCiAgICAgIKJ1oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL3Np
dDANCiAgICAgIKJ8oncveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL3VzYjANCiAgICAgICAg
onyidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvdXNiMC9pcHY0DQogICAgICAgICAgonyi
dy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvdXNiMC9pcHY0L2NhY2EwZDFkDQoNClNlcnZp
Y2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLlNOTVA6DQqifKJ3L3h5eg0KICCifKJ3L3h5
ei9vcGVuYm1jX3Byb2plY3QNCiAgICCifKJ3L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yaw0K
ICAgICAgonyidy94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvc25tcA0KICAgICAgICCifKJ3
L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9zbm1wL21hbmFnZXINCg0KDQpBcmUgdGhlcmUg
c29tZSBwYWNrYWdlcyBpIGxvc2luZyB0byBhZGQgaW50byBvdXIgc3lzdGVtPw0KDQpGZWVsIGZy
ZWUgdG8gZ2l2ZSB5b3VyIGNvbW1lbnRzLCB0aGFuayB5b3UuDQoNCg0KU2luY2VyZWx5LA0KDQpT
cGVuY2VyIEt1DQoNCg==

--_000_5d8c24246ba2413a99eff60aca2a9f71quantatwcom_
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
<p>Hi Everyone,</p>
<p>I have some problem about that when i using&nbsp;<span style=3D"font-fam=
ily: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quo=
t;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;=
, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;">some ipmi comm=
ands,
 it</span>&nbsp;will&nbsp;return &quot;Unspecified error&quot;,</p>
<p>and after I tracing code in&nbsp;phoshpor-ipmi-host package, I find that=
 there are some Dubs doesn't create in our openbmc system.</p>
<p>Most of them are <span style=3D"font-family: Calibri, Helvetica, sans-se=
rif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, =
NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, Emo=
jiSymbols; font-size: 16px;">
network relational Dbus</span><span>, and&nbsp;here is the Dbus list which =
do not create in our system:</span></p>
<p><span><b><br>
</b></span></p>
<p><span><b>Netwotk:</b></span></p>
<p><span></span></p>
<div>xyz.openbmc_project.Network.SystemConfiguration</div>
<div>xyz.openbmc_project.Network.EthernetInterface</div>
<div>xyz.openbmc_project.Network.IP</div>
<div>xyz.openbmc_project.Network.IP.Create</div>
<div>xyz.openbmc_project.Network.MACAddress</div>
<div>xyz.openbmc_project.Network.Neighbor</div>
<div>xyz.openbmc_project.Network.Neighbor.CreateStatic</div>
<div>xyz.openbmc_project.Network.VLAN</div>
<div>xyz.openbmc_project.Network.VLAN.Create</div>
<br>
<p></p>
<p><span><b>ACPI:</b></span></p>
<p><span><span>xyz.openbmc_project.Control.Power.ACPIPowerState</span><br>
</span></p>
<p><br>
</p>
<p><b>Chassis Capabilities:</b></p>
<p><span>xyz.openbmc_project.Control.ChassisCapabilities</span><br>
</p>
<p><span><br>
</span></p>
<p><span><br>
</span></p>
<p>And here are&nbsp;only two network relational Dbus in our system:</p>
<p></p>
<div><b>Service xyz.openbmc_project.Network:</b></div>
<div>=A2|=A2w/xyz</div>
<div>&nbsp; =A2|=A2w/xyz/openbmc_project</div>
<div>&nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network</div>
<div>&nbsp; &nbsp; &nbsp; =A2u=A2w/xyz/openbmc_project/network/config</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2|=A2w/xyz/openbmc_project/network/config/=
dhcp</div>
<div>&nbsp; &nbsp; &nbsp; =A2u=A2w/xyz/openbmc_project/network/eth0</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2u=A2w/xyz/openbmc_project/network/eth0/ip=
v4</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2x =A2|=A2w/xyz/openbmc_project/network/et=
h0/ipv4/8e1bfa2f</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2|=A2w/xyz/openbmc_project/network/eth0/ip=
v6</div>
<div>&nbsp; &nbsp; &nbsp; =A2x&nbsp; &nbsp;=A2|=A2w/xyz/openbmc_project/net=
work/eth0/ipv6/bc41eef6</div>
<div>&nbsp; &nbsp; &nbsp; =A2u=A2w/xyz/openbmc_project/network/eth1</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2u=A2w/xyz/openbmc_project/network/eth1/ip=
v4</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2x =A2|=A2w/xyz/openbmc_project/network/et=
h1/ipv4/1c4a187f</div>
<div>&nbsp; &nbsp; &nbsp; =A2x =A2|=A2w/xyz/openbmc_project/network/eth1/ip=
v6</div>
<div>&nbsp; &nbsp; &nbsp; =A2x&nbsp; &nbsp;=A2|=A2w/xyz/openbmc_project/net=
work/eth1/ipv6/73a2a5d0</div>
<div>&nbsp; &nbsp; &nbsp; =A2u=A2w/xyz/openbmc_project/network/sit0</div>
<div>&nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/usb0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/usb0/=
ipv4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/networ=
k/usb0/ipv4/caca0d1d</div>
<div><br>
</div>
<div>
<div><b>Service xyz.openbmc_project.Network.SNMP:</b></div>
<div>=A2|=A2w/xyz</div>
<div>&nbsp; =A2|=A2w/xyz/openbmc_project</div>
<div>&nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network</div>
<div>&nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/snmp</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; =A2|=A2w/xyz/openbmc_project/network/snmp/=
manager</div>
</div>
<br>
<p></p>
<p>Are there some packages i losing to add into our system?</p>
<p><span>Feel free to give your comments,&nbsp;</span><span style=3D"font-s=
ize: 12pt;">thank you.</span></p>
<p><span><br>
</span></p>
<p><span>Sincerely,</span></p>
<p><span>Spencer Ku</span></p>
<p><br>
</p>
</div>
</body>
</html>

--_000_5d8c24246ba2413a99eff60aca2a9f71quantatwcom_--
