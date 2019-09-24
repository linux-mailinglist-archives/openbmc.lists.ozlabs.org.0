Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22872BBFC3
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 03:36:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ckL66xSpzDqQX
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 11:36:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=1631556a7=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 46ckKP49PVzDqMK
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 11:35:32 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 24 Sep 2019 09:35:29 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 24 Sep
 2019 09:35:27 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 24 Sep 2019 09:35:27 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Questions of openbmc-test-automation
Thread-Topic: Questions of openbmc-test-automation
Thread-Index: AdVx0P1eBqQZB68LR7SxY3B/v1ijav//3DMAgAFvkH0=
Date: Tue, 24 Sep 2019 01:35:27 +0000
Message-ID: <287d14323764462898a05d4a1ea070ed@quantatw.com>
References: <a1b7c13a259b4e259796bbcf07834ae7@quantatw.com>,
 <CAAMkS12M-LP=v4gNdxgRShKUF7QZKTVFSa=Vg=qebzq7AXm3rg@mail.gmail.com>
In-Reply-To: <CAAMkS12M-LP=v4gNdxgRShKUF7QZKTVFSa=Vg=qebzq7AXm3rg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-24930.003
x-tm-as-result: No-10--29.561500-5.000000
x-tmase-matchedrid: IP81vszaHEVYme75ecrqQG62joBEJFSC4YS6FyG8vyiP6oIIK7rfEoEU
 1kn9F/MZGfESeH6pl4aZSS1O01vi21HXxCnNdK1OrjfpFWYyp3xiizTSCHqobPtwSMjECwMmwpU
 1WSBl38he8fEpBZ2EVP5RW979ljm0Am6tWpwE9JgXBgNLMwN54G2zfkQOTqlfgb/IM5JgEpucxB
 01DrjF9+HCwRwMNQUWSBus0nBjLRI1COoJfG1uvI+aHJx/zVvVZ3t6VkL+fFQdcrW3OX07R3UVR
 7WQKpLPTpSjnFijHy4rmRTnbxDqJ0cTtNe19v9gB1l4+PceggmEQsXohJMLoYG4DnC8WxnC9FQh
 3flUIh6VLkhtDy7dOgQaiiWKsizDbIBu7UhxFGuhiD+p5i7ui9Nm9i2vjxu+Wx8LczCIsNL2b09
 s2KGDsCPx0viUmdeue7ijHq7g9obdvjhsrZkjcCe5LrMlxEslXhjhSsB0wC8lW7sHru1WuJ1U1l
 ojafr/+B/ReiWBz7to5YsPsbyLXd3qVkYGwCw/8biIPNOLUN0BoKkUGULAojEsSv7gLW1vweku3
 30t3mvLvfc3C6SWwkWw8G9zeWcKaPIhfrWr/H5k1QMds9nkrQTE1eL2/6SCj2hRzH1UwuCuInfm
 /2MsNvXwAAhVlH7NX2MPnHofQv+krM0hGGV5w/IwHPvvs1HqYfZJ3HAsXDHGUvzUKIwjHr+V/kK
 Z1ePbftwZ3X11IV0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--29.561500-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-24930.003
x-tm-snts-smtp: 71CF066B94A7B26749C2DAEE0339D049AEFAC7E5E9A2215DC16ACDDF08DDADFC2000:B
Content-Type: multipart/alternative;
 boundary="_000_287d14323764462898a05d4a1ea070edquantatwcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_287d14323764462898a05d4a1ea070edquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgIFJhaHVsLA0KDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXNwb25kcy4NCg0KQWNjb3JkaW5n
IHRvIG91ciByZXF1ZXN0LCBjYW4gSSBhZGQgYSBuZXcgSVBNSSB0ZXN0IHN1aXRlIGFuZCBhIG5l
dyBJUE1JIG9ubHkga2V5d29yZD8NCg0KDQpCUnMsDQpXaWxsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KsUil86rMOiBSYWh1bCBNYWhlc2h3YXJpIDxyYWh1bG1haGVzaHdhcmkw
MUBnbWFpbC5jb20+DQqxSKXzpOm0wTogMjAxOaZ+OaTrMjOk6SCkVaTIIDA3OjI5DQqmrKXzqsw6
IFdpbGwgTGlhbmcgKLHnpcO5YikNCrDGpbs6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KpUSm
rjogUmU6IFF1ZXN0aW9ucyBvZiBvcGVuYm1jLXRlc3QtYXV0b21hdGlvbg0KDQpIaSBXaWxsDQpB
dCBwcmVzZW50LCB3ZSBkb24ndCBoYXZlIHdheXMgdG8gYXZvaWQgUmVkZmlzaCBkZXBlbmRlbmN5
IGluIElQTUkgc3VpdGUuIFdlIGNhbiBjb2RlIGxpa2UgdGhlIHdheSB5b3UgcG9pbnRlZCwgYnV0
IGl0IGlzIHBvc3NpYmxlIG9ubHkgZm9yIHNvbWUgSVBNSSBjb21tYW5kcyhsaWtlIHBvd2VyIG9u
IGFuZCBvZmYpLiBGb3IgYWxsIG90aGVyIElQTUkgY29tbWFuZHMgbGlrZSBldmVudCBsb2dzLCBG
UlUsIFNEUiwgRENNSSBjb21tYW5kcyB3ZSBuZWVkIHRvIGRlcGVuZCBvbiBSZWRmaXNoIHRvIHZl
cmlmeSB0aGUgb3V0cHV0Lg0KDQpUaGFua3MNClJhaHVsDQoNCg0KDQpPbiBNb24sIDIzIFNlcCAy
MDE5LCAxMToxMyBXaWxsIExpYW5nICix56XDuWIpLCA8V2lsbC5MaWFuZ0BxdWFudGF0dy5jb208
bWFpbHRvOldpbGwuTGlhbmdAcXVhbnRhdHcuY29tPj4gd3JvdGU6DQpIaSwNCg0KSSB1c2UgdGhl
ICJvcGVuYm1jLXRlc3QtYXV0b21hdGlvbiIgcGFja2FnZSB0byB0ZXN0IG91ciBwcm9qZWN0Lg0K
QW5kIEkganVzdCB3YW50IHRvIGltcGxlbWVudCB0aGUgSVBNSSB0ZXN0IGNhc2UgYmVjYXVzZSBv
dXIgcGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydCBSRURGSVNIIChJUE1JIG9ubHkpLg0KQnV0IEkg
Zm91bmQgdGhhdCBpbiB0aGUgSVBNSSB0ZXN0IGNhc2UsIGl0IHVzZSB0aGUgUkVGSVNIIGNvbW1h
bmQgYXMgd2VsbCAoZWcgUmVkZmlzaCBwb3dlciBvblswXSkuDQoNClswXSBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi9ibG9iLzJhNTIwZWUzN2M3MmVh
ODQ3Y2EyZDZjNzczNDkzYTZkZDc1MmM4MjcvaXBtaS90ZXN0X2lwbWlfc2RyLnJvYm90I0w1OQ0K
DQpNeSBxdWVzdGlvbnMgYXJlIGZvbGxvd2luZzoNCjEuIEFyZSB0aGVyZSBvdGhlciB3YXlzIHRv
IGF2b2lkIHVzaW5nIHRoZSBSZWRmaXNoIGNvbW1hbmRzPw0KMi4gSXMgaXQgcG9zc2libGUgdG8g
YWRkIHBhcmFtZXRlcihleDpQUk9UT0NPTCkgb24gdGhlIGNvbW1hbmQgbGluZSB0byBzZWxlY3Qg
dGhlIHByb3RvY29sIHRvIHVzZT8NCkZvciBleGFtcGxlOg0KLSBhZGQgdGhlIG5ldyBrZXl3b3Jk
IG1heWJlIGxpa2UgIlBvd2VyIE9uIi4NCi0gYW5kIHRoZSBuZXcga2V5d29yZCAicG93ZXIgb24i
IGNhbiB1c2UgdGhlIG5ldyBwYXJhbWV0ZXIgdG8gY2hvb3NlIHdoYXQgcHJvdG9jb2wgYmUgdXNl
ZChkZWZhdWx0IHByb3RvY29sIGlzIFJFREZJU0ggaWYgbm90IHNldCkuDQotIHRoZSBuZXcga2V5
d29yZCBsaWtlIGJlbG93Og0KUG93ZXIgT24NCiAgICBbRG9jdW1lbnRhdGlvbl0gIHNlbGVjdCB0
aGUgZXhlY3V0ZSBwcm90b2NvbC4NCiAgICBbQXJndW1lbnRzXSAgJHtzdGFja19tb2RlfT0ke3N0
YWNrX21vZGV9ICAke3F1aWV0fT0ke3F1aWV0fQ0KDQogICAgUnVuIEtleXdvcmQgSWYgICcke1BS
T1RPQ09MfScgPT0gJ1JlZGZpc2gnDQogICAgLi4uICAgUmVkZmlzaCBQb3dlciBPbiAgICBzdGFj
a19tb2RlPXNraXAgICAgcXVpZXQ9MA0KICAgIC4uLiAgIEVMU0UgICAgSVBNSSBQb3dlciBPbiAg
ICBzdGFja19tb2RlPXNraXAgICAgcXVpZXQ9MA0KDQpCUnMNCldpbGwNCg==

--_000_287d14323764462898a05d4a1ea070edquantatwcom_
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
<p>Hi&nbsp; Rahul,</p>
<p><br>
</p>
<p><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &=
quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &=
quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-s=
ize: 16px;">Thank you for your responds.</span></p>
<p><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &=
quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &=
quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-s=
ize: 16px;"></span></p>
<span>According to our request, can I add a new IPMI test suite and a new I=
PMI only keyword?</span>
<p><br>
</p>
BRs,
<div>Will<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Rahul Mah=
eshwari &lt;rahulmaheshwari01@gmail.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2019=A6~9=A4=EB23=A4=E9 =A4U=A4=C8 07:29<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Will Liang (=B1=E7=A5=C3=B9b)<br>
<b>=B0=C6=A5=BB:</b> openbmc@lists.ozlabs.org<br>
<b>=A5D=A6=AE:</b> Re: Questions of openbmc-test-automation</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">
<div>Hi Will</div>
<div dir=3D"auto">At present, we don't have ways to avoid Redfish dependenc=
y in IPMI suite. We can code like the way you pointed, but it is possible o=
nly for some IPMI commands(like power on and off). For all other IPMI comma=
nds like event logs, FRU, SDR, DCMI
 commands we need to depend on Redfish to verify the output.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks</div>
<div dir=3D"auto">Rahul</div>
<div dir=3D"auto">
<div dir=3D"auto"><br>
</div>
<br>
<br>
<div class=3D"gmail_quote" dir=3D"auto">
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 Sep 2019, 11:13 Will Liang=
 (=B1=E7=A5=C3=B9b), &lt;<a href=3D"mailto:Will.Liang@quantatw.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">Will.Liang@quantatw.com</a>&gt; wr=
ote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
Hi,<br>
<br>
I use the &quot;openbmc-test-automation&quot; package to test our project.<=
br>
And I just want to implement the IPMI test case because our platform does n=
ot support REDFISH (IPMI only).<br>
But I found that in the IPMI test case, it use the REFISH command as well (=
eg Redfish power on[0]).<br>
<br>
[0] <a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/2a52=
0ee37c72ea847ca2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer" target=3D"_blank">
https://github.com/openbmc/openbmc-test-automation/blob/2a520ee37c72ea847ca=
2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59</a><br>
<br>
My questions are following:<br>
1. Are there other ways to avoid using the Redfish commands?<br>
2. Is it possible to add parameter(ex:PROTOCOL) on the command line to sele=
ct the protocol to use?<br>
For example:<br>
- add the new keyword maybe like &quot;Power On&quot;.<br>
- and the new keyword &quot;power on&quot; can use the new parameter to cho=
ose what protocol be used(default protocol is REDFISH if not set).<br>
- the new keyword like below:<br>
Power On<br>
&nbsp; &nbsp; [Documentation]&nbsp; select the execute protocol.<br>
&nbsp; &nbsp; [Arguments]&nbsp; ${stack_mode}=3D${stack_mode}&nbsp; ${quiet=
}=3D${quiet}<br>
<br>
&nbsp; &nbsp; Run Keyword If&nbsp; '${PROTOCOL}' =3D=3D 'Redfish'<br>
&nbsp; &nbsp; ...&nbsp; &nbsp;Redfish Power On&nbsp; &nbsp; stack_mode=3Dsk=
ip&nbsp; &nbsp; quiet=3D0<br>
&nbsp; &nbsp; ...&nbsp; &nbsp;ELSE&nbsp; &nbsp; IPMI Power On&nbsp; &nbsp; =
stack_mode=3Dskip&nbsp; &nbsp; quiet=3D0<br>
<br>
BRs<br>
Will<br>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_287d14323764462898a05d4a1ea070edquantatwcom_--
