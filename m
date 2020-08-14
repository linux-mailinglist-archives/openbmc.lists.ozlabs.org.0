Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99270245A0F
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 01:38:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVDBQ6Xb6zDqPF
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 09:38:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=ur.starklee@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I4YgcNiA; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSbMt5rlYzDqkD
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 17:55:36 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id f19so1854225qtp.2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:thread-topic:thread-index:date:message-id
 :references:accept-language:content-language:mime-version;
 bh=obpzDXOeFykaeMfQVU0YcvkrnRJqoP2Ax34kwEwP7p8=;
 b=I4YgcNiAmrnfXd88cm/u5JRdDUidC0lhU7uLfEzmvWByFdaTG6mhkYPujZseQwOARs
 iSvAjVROIS/EMwbJ1OX4G3fDYmGWG0KkJwRfdig6V31DSQ7joeoTr3hbXM2ZlBhec0Nl
 ctd+loGVi2i0RWB9h+uZhFgtBvioioS5KgulluB6dRszkz5/X8yjpJB1KeGGwO7345Q2
 hYukZqibfPGnfIhrHlxvw8LqgFU93l/OzzAKyRfIZDYISty4qyhbeSlODTh3W4Km4r2G
 ZP07NxUdCqS2ls1lPtXY9LldpDcz2jyu58FXa79eo5AgzxMJ6s2dWIlPGrtD/BV111wH
 2WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:references:accept-language:content-language:mime-version;
 bh=obpzDXOeFykaeMfQVU0YcvkrnRJqoP2Ax34kwEwP7p8=;
 b=JR8GwoPxIcl1oazO8EYNHorOJkqSW1OLJkhRmjThYfq47EiGRvC8x6Ze0mttT0zPlz
 kNxadqNA4akzO446tB8LU2ddnwu1kJTRsEGkmjJ9chZDEGorbECrXWdNZma6tPgw7Xnl
 XfUnLUZdfS2paLqHP/BaEy1aHMSMSY3s5n9lzUb/2rWjj7hgZLo4I4YPnBbJIG+5+D9P
 c4wCD7snJGaF+HVLJ4MIr3/77rEC703y6IWWlksXSDgRzPAg+bcGldAlFxU5+EH8B3BM
 TpSxKsV+B9NIFDCas8faQTFQx7s0IdpUGQYGjwvB9errk/NCjNOsKl5e0XvMwybaskSV
 NZig==
X-Gm-Message-State: AOAM532j7Lo12BskkM67oiLFJbCMggqDx3QaWj8fSe30twC+XK5siZRW
 p/PHiyctOD3HQ0cmsRBbFr+xbQZlbJk=
X-Google-Smtp-Source: ABdhPJzv5Wx5rhuO6rsdQOFP6prTHH4fyoQMUbp3m7Vn8F5xApOlpf1HtR9Ym1H7XZXuyx86EETvTg==
X-Received: by 2002:ac8:6919:: with SMTP id e25mr942118qtr.339.1597391733036; 
 Fri, 14 Aug 2020 00:55:33 -0700 (PDT)
Received: from BN8PR20MB2689.namprd20.prod.outlook.com
 ([2603:1036:303:3036::5])
 by smtp.gmail.com with ESMTPSA id 20sm8186375qkh.110.2020.08.14.00.55.32
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 00:55:32 -0700 (PDT)
From: =?gb2312?B?wO4g0MfQxw==?= <ur.starklee@gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: FW: Question about WEBUI
Thread-Topic: Question about WEBUI
Thread-Index: ATA3QTcyyxU+an8S0NljA+q+OecZGg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 14 Aug 2020 07:55:30 +0000
Message-ID: <BN8PR20MB26899FF9D6F4B5CF855FFAAFA7400@BN8PR20MB2689.namprd20.prod.outlook.com>
References: <BN8PR20MB268915B2FF96FA1E49AD0613A7400@BN8PR20MB2689.namprd20.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
 boundary="_000_BN8PR20MB26899FF9D6F4B5CF855FFAAFA7400BN8PR20MB2689namp_"
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 09:37:30 +1000
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

--_000_BN8PR20MB26899FF9D6F4B5CF855FFAAFA7400BN8PR20MB2689namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQoNCreivP7IyzogwO4g0MfQxyA8dXIuc3RhcmtsZWVAZ21haWwuY29tPg0KyNXG2jogMjAyMMTq
ONTCMTTI1SDQx8bazuUgMTU6NTQNCsrVvP7IyzogwO4g0MfQxyA8dXIuc3RhcmtsZWVAZ21haWwu
Y29tPg0K1vfM4jogUmU6IFF1ZXN0aW9uIGFib3V0IFdFQlVJDQoNCmhpo6wNCiAgICAgICBJIHRy
eSB0byBjdXN0b21pemUgVUkgZGVzaWduIGZvciBPcGVuQm1jIGFuZCBJIGltcG9ydCBwaG9zcGhv
ci13ZWJ1aSBhbmQgYm1jd2ViIHBhY2thZ2UgaW50byBteSBnaXRodWIuIFRoZW4gSSBjaGFuZ2Ug
Qk1DV0VCX0lOU0VDVVJFX0RJU0FCTEVfWFNTX1BSRVZFTlRJT04gYW5kIEJNQ1dFQl9JTlNFQ1VS
RV9ESVNBQkxFX0NTUkZfUFJFVkVOVElPTiB0dXJuZWQgb24uIEJ1dCB3aGVuIEkgdHJ5IHRvIHJl
YnVpbGQgbXkgaW1hZ2UgYW5kIHRoZXJlIGlzIGFuIGVycm9yIGFzIGJlbG93DQpbY2lkOmltYWdl
MDAxLnBuZ0AwMUQ2NzI1My4wOEZGRUI1MF0NCltjaWQ6aW1hZ2UwMDIucG5nQDAxRDY3MjUzLjA4
RkZFQjUwXVtjaWQ6aW1hZ2UwMDMucG5nQDAxRDY3MjUzLjA4RkZFQjUwXSBbY2lkOmltYWdlMDA0
LnBuZ0AwMUQ2NzI1My4wOEZGRUI1MF0gLiBJIGRvbqGvdCBrbm93IHdoeSBhbmQgSSBjYW50IGZp
bmQgYW55IGhlbHBmdWwgbGluayB0byBzb2x2ZSBpdC4gQ2FuIHlvdSBwcm92aWRlIHNvbWUgaGVs
cD8NCg0Kt6K8/sjLOiDA7iDQx9DHIDx1ci5zdGFya2xlZUBnbWFpbC5jb20+DQrI1cbaOiAyMDIw
xOo41MIxMsjVINDHxtrI/SAxNjozOA0KytW8/sjLOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
IiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K1vfM4jogUXVlc3Rpb24gYWJvdXQgV0VCVUkN
Cg0KSGksDQogICAgICAgSSBhbSBzdGFyayBhbmQgYSBuZXdiZWUgZm9yIG9wZW5CTUMgZGV2ZWxv
cG1lbnQuIE91ciBjb21wYW55IGFyZSBwbGFubmluZyB0byBkZXZlbG9wIGEgY3VzdG9taXplZCBz
b2Z0d2FyZSB0byBtYW5hZ2UgQk1DIGZvciBvdXIgdGVtcGxhdGUuIEkgYW0gdHJ5aW5nIHRvIHVz
ZSBvcGVuQk1DIGFzIGZyYW1ld29yayBhbmQgSSBoYXZlIHNldCB1cCBhbGwgcmVxdWlyZWQgZW52
aXJvbm1lbnQuDQpGb3Igbm93IEkgaGF2ZSBzZXQgdXAgYSBzeXN0ZW0gYmFzZWQgb24gVWJhbnR1
IDE2LjAuNCBhbmQgZG93bmxvYWQgYWxsIHBhY2thZ2VzLiBUaGVuIEkgc3VjY2Vzc2Z1bGx5IGJ1
aWxkIGFuIGltYWdlIGJhc2VkIG9uIFJvbXVsdXMgYW5kIHVzZSBxZW11IHRvIHN0YXJ0IGl0LiBB
bmQgSSBjYW4gb3BlbiBsb2NhbGhvc3Q6MjQ0MyB0byBtYW5hZ2UgaXQuIEFsbCB0aGUgc3RlcHMg
aGF2ZSBiZWVuIGRvbmUgYXMgR2l0aHViIHByb2NlZHVyZXMuDQpCdXQgYXMgcmVxdWlyZW1lbnQg
d2Ugd2FudCB0byBjdXN0b21pemUgdGhlIFdlYlVJIGFuZCBJIHRyeSB0byBkbyBhcyBHaXRodWIu
IEkgcHV0IHBob3NwaG9yLXdlYnVpIGluIGJ1aWxkIGRpcmVjdG9yeS4gQW5kIHVzZSBucG0gc3Rh
cnQgaXQuIE15IG5wbSB2ZXJzaW9uIGlzIDYuMTQuNy4gQnV0IHdoZW4gSSB0cnkgdG8gbG9naW4g
aW50byBteSBpbWFnZSB3aXRoIHNwZWNpYWwgSVAgYWRkcmVzcy4gSXQgZmFpbGVkIGFuZCBzaG93
IGNvcnMteG1sIHByb2JsZW0gYW5kIHNlcnZlciB1bnJlYWNoYWJsZS4NCkFmdGVyIHRoYXQgSSBm
aW5kIG9yaWdpbmFsIGNvZGUgaW4gL2hvbWUvYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYWxs
LW9wZW5ibWMtbGludXgvcGhvc3Bob3Itd2VidWkvMS4wK2dpdEFVVE9JTkMrMmUxZWVjODBkZS1y
MS9naXQvLCBhbmQgSSB0cnkgdG8gY2hhbmdlIGl0cyBsb2dvIHBpY3R1cmUuIEJ1dCBpdCBkaWQg
bm90IHdvcmsuIENhbiB5b3UgZ2l2ZSBzb21lIGFkdmljZXMgaG93IHRvIGRvIHRoYXQ/IEkgY2Fu
oa90IGZpbmQgc29tZSB1c2VmdWwgIHR1dG9yaWFscy4NCg0KVGhhbmtzDQo=

--_000_BN8PR20MB26899FF9D6F4B5CF855FFAAFA7400BN8PR20MB2689namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Times;
	panose-1:0 0 5 0 0 0 0 2 0 0;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	font-size:10.5pt;
	font-family:DengXian;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><b><span st=
yle=3D"color:black">=B7=A2=BC=FE=C8=CB</span></b><b><span lang=3D"EN-US" st=
yle=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">:
</span></b><span style=3D"color:black">=C0=EE</span><span style=3D"font-fam=
ily:&quot;Calibri&quot;,sans-serif;color:black">
</span><span style=3D"color:black">=D0=C7=D0=C7</span><span lang=3D"EN-US" =
style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"> &lt;ur.st=
arklee@gmail.com&gt;<br>
</span><b><span style=3D"color:black">=C8=D5=C6=DA</span></b><b><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"=
>:
</span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">2020</span><span style=3D"color:black">=C4=EA</span><=
span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;col=
or:black">8</span><span style=3D"color:black">=D4=C2</span><span lang=3D"EN=
-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">14</s=
pan><span style=3D"color:black">=C8=D5</span><span style=3D"font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">
</span><span style=3D"color:black">=D0=C7=C6=DA=CE=E5</span><span lang=3D"E=
N-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"> 15:=
54<br>
</span><b><span style=3D"color:black">=CA=D5=BC=FE=C8=CB</span></b><b><span=
 lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack">:
</span></b><span style=3D"color:black">=C0=EE</span><span style=3D"font-fam=
ily:&quot;Calibri&quot;,sans-serif;color:black">
</span><span style=3D"color:black">=D0=C7=D0=C7</span><span lang=3D"EN-US" =
style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"> &lt;ur.st=
arklee@gmail.com&gt;<br>
</span><b><span style=3D"color:black">=D6=F7=CC=E2</span></b><b><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"=
>:
</span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">Re: Question about WEBUI</span><span lang=3D"EN-US" s=
tyle=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:=CB=CE=CC=
=E5"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">hi<=
/span>=A3=AC<span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"font-family:Times">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 I try to customize UI design for OpenBmc and I import phosphor-webui and b=
mcweb package into my github. Then I change
<span style=3D"color:black">BMCWEB_INSECURE_DISABLE_XSS_PREVENTION and BMCW=
EB_INSECURE_DISABLE_CSRF_PREVENTION turned on. But when I try to rebuild my=
 image and there is an error as below</span></span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"font-size:12.0pt;font-family:=CB=CE=CC=E5"><img width=
=3D"723" height=3D"474" style=3D"width:7.5312in;height:4.9375in" id=3D"=CD=
=BC=C6=AC_x0020_1" data-outlook-trace=3D"F:0|T:1" src=3D"cid:image001.png@0=
1D67253.08FFEB50"></span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times"><im=
g width=3D"713" height=3D"401" style=3D"width:7.427in;height:4.177in" id=3D=
"=CD=BC=C6=AC_x0020_2" data-outlook-trace=3D"F:0|T:1" src=3D"cid:image002.p=
ng@01D67253.08FFEB50"><img width=3D"727" height=3D"489" style=3D"width:7.57=
29in;height:5.0937in" id=3D"=CD=BC=C6=AC_x0020_3" data-outlook-trace=3D"F:0=
|T:1" src=3D"cid:image003.png@01D67253.08FFEB50"></span><span lang=3D"EN-US=
">&nbsp;<img width=3D"715" height=3D"436" style=3D"width:7.4479in;height:4.=
5416in" id=3D"=CD=BC=C6=AC_x0020_4" data-outlook-trace=3D"F:0|T:1" src=3D"c=
id:image004.png@01D67253.08FFEB50">.
</span><span lang=3D"EN-US" style=3D"font-family:Times">I don=A1=AFt know w=
hy and I cant find any helpful link to solve it. Can you provide some help?=
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">&nb=
sp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><b><span st=
yle=3D"color:black">=B7=A2=BC=FE=C8=CB</span></b><b><span lang=3D"EN-US" st=
yle=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">:
</span></b><span style=3D"color:black">=C0=EE</span><span style=3D"font-fam=
ily:&quot;Calibri&quot;,sans-serif;color:black">
</span><span style=3D"color:black">=D0=C7=D0=C7</span><span lang=3D"EN-US" =
style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"> &lt;ur.st=
arklee@gmail.com&gt;<br>
</span><b><span style=3D"color:black">=C8=D5=C6=DA</span></b><b><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"=
>:
</span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">2020</span><span style=3D"color:black">=C4=EA</span><=
span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;col=
or:black">8</span><span style=3D"color:black">=D4=C2</span><span lang=3D"EN=
-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">12</s=
pan><span style=3D"color:black">=C8=D5</span><span style=3D"font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">
</span><span style=3D"color:black">=D0=C7=C6=DA=C8=FD</span><span lang=3D"E=
N-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"> 16:=
38<br>
</span><b><span style=3D"color:black">=CA=D5=BC=FE=C8=CB</span></b><b><span=
 lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack">:
</span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">&quot;openbmc@lists.ozlabs.org&quot; &lt;openbmc@list=
s.ozlabs.org&gt;<br>
</span><b><span style=3D"color:black">=D6=F7=CC=E2</span></b><b><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"=
>:
</span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black">Question about WEBUI</span><span lang=3D"EN-US"><o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:=CB=CE=CC=
=E5">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">Hi,=
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am stark and a newbee for openBMC devel=
opment. Our company are planning to develop a customized software to manage=
 BMC for our template. I am trying to use openBMC as framework and I
 have set up all required environment. </span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Times">For now I have set up a system based on Ubantu 16=
.0.4 and download all packages. Then I successfully build an image based on=
 Romulus and use qemu to start it. And I
 can open localhost:2443 to manage it. All the steps have been done as Gith=
ub procedures.
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Times">But as requirement we want to customize the WebUI=
 and I try to do as Github. I put phosphor-webui in build directory. And us=
e npm start it. My npm version is 6.14.7.
 But when I try to login into my image with special IP address. It failed a=
nd show cors-xml problem and server unreachable.
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Times">After that I find original code in /home/bmc/open=
bmc/build/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+2e1eec80=
de-r1/git/, and I try to change its logo
 picture. But it did not work. Can you give some advices how to do that? I =
can=A1=AFt find some useful &nbsp;tutorials.</span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">&nb=
sp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">Tha=
nks</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_BN8PR20MB26899FF9D6F4B5CF855FFAAFA7400BN8PR20MB2689namp_--
