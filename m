Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 177402718A6
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 01:48:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvkmc3CSwzDqjQ
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 09:48:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.47.43;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=obHkHPNT; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08olkn2043.outbound.protection.outlook.com [40.92.47.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvkll3CM7zDqhD
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 09:48:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjNnBTkBzd554RUV9NKjnDdhMouaB5pFLqqkGnKBzyfJNNfCgubyv0GtNA5asGLepKfuKmFDYIQvak1p4uDHUh1GdRPQqG7PrSAaw3l8OORubMZ6HUnUUxvcQG9u1TIkUfN/Y9sbnEuBTEqdyNdFTN4gVSxr2xnbB+Yfql0DDrR3A+lfbnBEByP/Nkd7MK7OvCvtmPfVfOeyqWbhnTBoXB8hlibttTpLYt16Sc9V5vcJuezZs+6CUJgX0HoeETckv3pRlBZEx0u3NjASUGLW+iv9hVeoxlmuXW4PYAoWowQJh/wrF9vD++iv2nVWHbLoKkuKDGYGoXElYr2VyNomzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k41RQFn1w/HaLuGSJ/yV0h44BxntwXNvFNxmPJTHEDU=;
 b=D+H++8/1RDHBRBtv8eFmU4uh3i7AoiyOeUwz7mvpZHU4hoiWE5no3+8C6/L7vT7ShSz46LkIk5xZAzZhqgfRBFtBucGStB9aMLZWn16KTBSNTN2+6fW87LWfPT8fTKverCdnqqhJPM/9uYsmnOBd2RdUxRPeCAcYaIs4+e3yeXk9If6M44sWwNTTkY5TUY1GoHYuXS1RzUOADHBF7mrTrAMWNDxWbon45bg6ZYVJaJIbM7QwOEkuFdrBOKb4OUyFNow7bpC1G04CtsLi37qi1dy6TqDvEBPvN5mnrWvybQA6g+G0HKPhiTXAt2MTfW+sA9F4W4XU7bKjdVd1IQYVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k41RQFn1w/HaLuGSJ/yV0h44BxntwXNvFNxmPJTHEDU=;
 b=obHkHPNTPbXDBUlnCKpkTGBVefKUACgJzzVPnknWCbQ18/YHttDEHVDkYfZ9uPthhGfjK7WGuHtpiUJ19jcPM/wsWLFs00JUggrtJnUf1NQrhvjNxFsp4+opyj2Aaw9YfZuVccvMs/qH0rqLHcRDQNkTCyZn/Zecf3X5FFCIAGax1KaDNFDC2TffSAjkGlUWhehjEDQTGkylPkH3nSVW/oC7pXrg1K6EMCDpwwQFhy1z0hW7TlI4sgYO14OI3753NxnoSj9r9RrkGblm1G3B0ou9dDT8iafDAcCVvp0Rrj/Dno7+FM23OCnibYNT/2Y8OpNX+2Pujn8T8wED12kAlA==
Received: from BN8NAM04FT027.eop-NAM04.prod.protection.outlook.com
 (2a01:111:e400:7e85::47) by
 BN8NAM04HT230.eop-NAM04.prod.protection.outlook.com (2a01:111:e400:7e85::375)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Sun, 20 Sep
 2020 23:47:53 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e85::53) by BN8NAM04FT027.mail.protection.outlook.com
 (2a01:111:e400:7e85::396) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend
 Transport; Sun, 20 Sep 2020 23:47:53 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3391.024; Sun, 20 Sep 2020
 23:47:53 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Security Advisory - CVE-2019-6260
Thread-Topic: OpenBMC Security Advisory - CVE-2019-6260
Thread-Index: AQHWj6ZTNl2tx3WOCkCa1TJvpl8NWA==
Date: Sun, 20 Sep 2020 23:47:53 +0000
Message-ID: <BYAPR14MB234222A907DAA5A640E1DABACF3D0@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A4D71F214AE389250732F0E95439E720E4AD96F4A2D185A0E6C63287832EBF13;
 UpperCasedChecksum:8DDBE5AC423E541BBCB2F6853F76D2262173268A05FEF6017E0C0E5D4A14FF29;
 SizeAsReceived:6674; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [JacH5RTQFK2fB6V8cga8hcn54CxbbtYH]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 8f787cd5-df56-4f1c-78d2-08d85dbf9767
x-ms-traffictypediagnostic: BN8NAM04HT230:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o2eJ+AndpU64LNqEoWJWHV3eafV18FxyocmWraYPaxAwOZSvIwcAGBRN4ODcKyZKfA7/jWes1Gox+VqteUnos1n31Kw4dUwpEBNARfcZ2SzNNnrSvj4KAVwj7Dvx6LhnTCw+SxteMk8FIe/YyBcbAKq8RIE3lyhX/flrtlkbBRCi1XcSO5beE3889ba0+eaW/xb7UFi6DW56GPO6AI0qCtF6UlsUr+JzZtiWh6vq958LabqunLzFTXIy1Th2rpAX
x-ms-exchange-antispam-messagedata: h0lKiRpUmMWziFbL8SMVFiHOCq1UcW2wAmfSW4E3kgQre/bwsHfuddjL+M+nmES/f0RjZgy7C9GkqH7JXfrNAmV9hNh4gWZor3+WaBsgbFC90dd0cQAWDkLKox+pIl7q+EfoGBm18o3tPS9wYxkoSg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB234222A907DAA5A640E1DABACF3D0BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT027.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f787cd5-df56-4f1c-78d2-08d85dbf9767
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2020 23:47:53.2273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM04HT230
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

--_000_BYAPR14MB234222A907DAA5A640E1DABACF3D0BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Team,

This link here described the =91pantsdown=92 vulnerability found in OpenBMC=
,
https://github.com/openbmc/openbmc/issues/3475

So what are the commits for fixing it?


Thanks.

Kun


--_000_BYAPR14MB234222A907DAA5A640E1DABACF3D0BYAPR14MB2342namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
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
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Team,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This link here described the =91pantsdown=92 vulnera=
bility found in OpenBMC,</p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/issues=
/3475">https://github.com/openbmc/openbmc/issues/3475</a></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So what are the commits for fixing it?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR14MB234222A907DAA5A640E1DABACF3D0BYAPR14MB2342namp_--
