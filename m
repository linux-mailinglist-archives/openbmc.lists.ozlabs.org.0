Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5096B177
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 08:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzC6s6tr5z3dXc
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 16:21:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=61.220.76.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725421347;
	cv=none; b=hzlMENsgI+eeJAOJFfFIwNuCdgH6KwyhjiLDxrENoz3WiU7FY2INCGQKA7JwD5CcRFs6OdwzFZBlRHgteZnxQgeHMtcRH8TQibaeFyalIVwXdpfq+DmVXSIJ/sitkJcVpAoDufMbvsNGX55N+6BAGjL8hARy0Y4R6pbTRH5925sKzTXM28M5xVtTIFBYly7SNCCOC4Cv0Sgto2+XI3uZR48uGS0kRX1pOJNhgp/gmmRO1YUf84C2DrxnKoWF5sAe8WiraQAL9xQo5fVFZonO4YfKwROUHfX0KoY0ksrWFCJrVupK8UJ+fgpNBSjo7cIv7TJKlGaZM6o8ERMuA1EOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725421347; c=relaxed/relaxed;
	bh=8k61Xr5AeEsjNn+6pNirkk8WtuGEpsuET7iyvWC7TFw=;
	h=DKIM-Signature:From:To:Subject:Date:Message-ID:Content-Type:
	 MIME-Version; b=YwhvvUOtleADNAzV+WWIVDHCddquMQnp8SS+rT+F0Nrt/sydhHgOctAl4g+kSf37dfG827U6XugI3ryRyB7MGfg+gfxDTLh9aUcq9D/Ksf6Bp0aGpIdHHUk0Qz5AvJgNsWeSbLAkV1qsozsU591LzM1EWt6ClJdacqv83HCF5JKcDqMzAdWW2N/U2ocuPw16RGujBET2dThSH1HaytunVb2FXKts2Ys0f8Qxtg9YxIv5QwElcvICs20C16h1KHMq8W1I09zZ/4GVicC8ONiIFfelk2c6YqVtWwi69BoTj0QLKc6jEPpv1h3dgmMOUjzbYnurudiU4Ncy72p7sTq5eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; dkim=pass (2048-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=SEx04 header.b=IF5rmQKU; dkim-atps=neutral; spf=pass (client-ip=61.220.76.156; helo=mail.inventec.com; envelope-from=chiang.brian@inventec.com; receiver=lists.ozlabs.org) smtp.mailfrom=inventec.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=SEx04 header.b=IF5rmQKU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventec.com (client-ip=61.220.76.156; helo=mail.inventec.com; envelope-from=chiang.brian@inventec.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 905 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 13:42:26 AEST
Received: from mail.inventec.com (mail.inventec.com [61.220.76.156])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wz7bk265Rz2xfR
	for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2024 13:42:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=SEx04; d=inventec.com;
    h=from:to:subject:date:message-id:content-type:mime-version;
    bh=8k61Xr5AeEsjNn+6pNirkk8WtuGEpsuET7iyvWC7TFw=;
    b=IF5rmQKUr+d3xsH1jAxv4giXv3wurIKq+Xu3gUFSFDzwwbqSqz3WsOX98F4g66
      +YPt8SpbENwJFGdXgTcgHpLzl+zONXpSUUO7In34W1aPSrKYa+NjwBvvoGbl27
      jPySoucMCBLCwJPvDuWBHgkf7A3r4iMeTNhbPJL+NW+FmngrmeWVn/NFlWkWJb
      iqfhMBY5UadutSVTsmt9/liUXjiQSBBN0FeXRkRmys3IumWRRzl/p5TNG/4SN6
      MqxvRSaapzTHHShK3vWhUw5Y+dNsGGTEO4VWlSieeIE6BUC9S7yhMK3YRMB8Dh
      xEZt8dqlQZBtSGwKRrKveoVTRu2HJaEg==
Received: from IEC1-EX2016-03.iec.inventec (10.15.2.59) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 4 Sep 2024 11:27:09 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 11:27:09 +0800
Received: from IEC1-EX2016-01.iec.inventec (IEC1-EX2016-01.iec.inventec [10.15.2.58])
	by IEC1-MSE-FE2.inventec.com with ESMTP id 4843R4KT059328
	for <openbmc@lists.ozlabs.org>; Wed, 4 Sep 2024 11:27:04 +0800 (GMT-8)
	(envelope-from Chiang.Brian@inventec.com)
Received: from IEC1-EX2016-02.iec.inventec (10.1.254.221) by
 IEC1-EX2016-01.iec.inventec (10.15.2.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 4 Sep 2024 11:27:04 +0800
Received: from IEC1-EX2016-02.iec.inventec ([fe80::5433:d118:ed4a:f767]) by
 IEC1-EX2016-02.iec.inventec ([fe80::5433:d118:ed4a:f767%3]) with mapi id
 15.01.2507.037; Wed, 4 Sep 2024 11:27:04 +0800
From: =?ks_c_5601-1987?B?Q2hpYW5nLkJyaWFuIMuw57b2xiBUQU8=?=
	<Chiang.Brian@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: No CI executed in gerrit
Thread-Topic: No CI executed in gerrit
Thread-Index: AQHa/ninCrP4HzD3/E2u5ZqmbzjU0w==
Date: Wed, 4 Sep 2024 03:27:04 +0000
Message-ID: <1d0f4c32d611462a9352875d0c054647@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
	boundary="_000_1d0f4c32d611462a9352875d0c054647inventeccom_"
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 4843R4KT059328
X-TM-SNTS-SMTP: 5BFFF564C0454ACEA9067F94343232986AE48C4C915C4BF02B7406F1BF11BE692000:8
X-Mailman-Approved-At: Wed, 04 Sep 2024 16:21:02 +1000
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

--_000_1d0f4c32d611462a9352875d0c054647inventeccom_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGVsbG8sIHRoaXMgaXMgQ2hpYW5nIEJyaWFuIGZyb20gSW52ZW50ZWMuIFJlY2VudGx5LCBJoa92
ZSBhZGRlZCBpbnRvIENMQSBhbmQgcHVzaGVkIHNvbWUgY29tbWl0cyB0byBvcGVuYm1jIGdlcnJp
dDsgaG93ZXZlciwgaXQgc3RpbGwgc2F5cyBVc2VyIG5vdCBhcHByb3ZlZCwgc2VlIGFkbWluLCBu
byBDSSBzb21laG93LiAgSSB3b3VsZCBsaWtlIHRvIGFzayB3aGV0aGVyIGlzIHRoZXJlIHNvbWV0
aGluZyBJIG1pc3MNCk9yIGlzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvIHdpdGg/IFRoYW5rIGZv
ciBoZWxwaW5nLg0KDQpIZXJlIGlzIHRoZSBDTEEgbGlzdDogSW52ZW50ZWMgLSBHb29nbGUgRHJp
dmU8aHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2RyaXZlL2ZvbGRlcnMvMTlSSk5zRTlubk5WOHBN
blYtNlE2M21iaERNWEtUVW8xPiBhbmQgdGhlIGNvbW1pdHMNCmVudGl0eS1tYW5hZ2VyOiBTdHJp
cCBzcGFjZSBvZiBOVk1lIFNTRHMgUE4gYW5kIFNOICg3NDIxMCkgoaQgR2Vycml0IENvZGUgUmV2
aWV3IChvcGVuYm1jLm9yZyk8aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy5vcmcvYy9vcGVuYm1jL2Vu
dGl0eS1tYW5hZ2VyLysvNzQyMTA+DQpkYnVzLXNlbnNvcjogc3VwcG9ydCB0aGUgcHN1IHNlbnNv
ciBwZWFrIHJlYWRpbmcgKDc0MjI1KSChpCBHZXJyaXQgQ29kZSBSZXZpZXcgKG9wZW5ibWMub3Jn
KTxodHRwczovL2dlcnJpdC5vcGVuYm1jLm9yZy9jL29wZW5ibWMvZGJ1cy1zZW5zb3JzLysvNzQy
MjU+DQoNCkJlc3QgUmVnYXJkcywNCg0KQnJpYW4gQ2hpYW5nDQoNCvD0IFdpbmRvd3Mg7tzp6Mvs
PGh0dHBzOi8vZ28ubWljcm9zb2Z0LmNvbS9md2xpbmsvP0xpbmtJZD01NTA5ODY+7u7h6g0KDQo=

--_000_1d0f4c32d611462a9352875d0c054647inventeccom_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:Roboto;
	panose-1:2 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello, this is Chiang Brian fro=
m Inventec. Recently, I=A1=AFve added into CLA and pushed some commits to o=
penbmc gerrit; however, it still says
</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:Roboto;co=
lor:#E8EAED;background:#2F3034">User not approved, see admin, no CI</span><=
span lang=3D"EN-US"> somehow. &nbsp;I would like to ask whether is there so=
mething I miss</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Or is there anything I can do w=
ith? Thank for helping.
<br>
<br>
Here is the CLA list: <a href=3D"https://drive.google.com/drive/folders/19R=
JNsE9nnNV8pMnV-6Q63mbhDMXKTUo1">
Inventec - Google Drive</a> and the commits<br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/entity-manager/&#43;/74210"=
>entity-manager: Strip space of NVMe SSDs PN and SN (74210) =A1=A4 Gerrit C=
ode Review (openbmc.org)</a><br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/dbus-sensors/&#43;/74225">d=
bus-sensor: support the psu sensor peak reading (74225) =A1=A4 Gerrit Code =
Review (openbmc.org)</a><br>
<br>
Best Regards,<br>
<br>
Brian Chiang<br>
<br>
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=E3=E6=E1=AC=D9=A5=
=F4=F7&quot;,serif">=F0=F4</span><span lang=3D"EN-US"> Windows
</span><span style=3D"font-family:&quot;=E3=E6=E1=AC=D9=A5=F4=F7&quot;,seri=
f">=EE=DC</span><span lang=3D"EN-US"><a href=3D"https://go.microsoft.com/fw=
link/?LinkId=3D550986"><span lang=3D"EN-US" style=3D"font-family:&quot;=E3=
=E6=E1=AC=D9=A5=F4=F7&quot;,serif"><span lang=3D"EN-US">=E9=E8=CB=EC</span>=
</span></a></span><span style=3D"font-family:&quot;=E3=E6=E1=AC=D9=A5=F4=F7=
&quot;,serif">=EE=EE=E1=EA</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;=E3=
=E6=E1=AC=D9=A5=F4=F7&quot;,serif"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_1d0f4c32d611462a9352875d0c054647inventeccom_--
