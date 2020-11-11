Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478812AF780
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 18:45:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWXDx4kKGzDqv1
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 04:45:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=858434c4e7=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=W90gNkmo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=hF67/yzV; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWXCw1f0GzDqL4
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 04:44:03 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABHew2c008273
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 09:43:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=FSk0IC9bumg1OPtp2r3uf36kVqlsJJdoiFCcCIBlSAI=;
 b=W90gNkmoQGCWGH4ewcq9yoPTRKZBT4k7f+kNuE/W7BQqnjG1gC9m0920yqgjMOd/6UiD
 h5quFn9VaJydYmSOvI4XzjsFNsGBKhSYi9b1S1E7GXLyaG2PqL2CAcVlTYRJBYjcAp2D
 EHOF9jYw+uM6Esst89h7RnGr7gU++RNkk3I= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34qwve7jbw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 09:43:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 11 Nov 2020 09:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpfDeTRXmazz8Wb8VgIST0rsll/eIeCTCCSHi+dlFB0A1Oor2GlFQR96LTEPAWo3DRN+Qua/GeD4kZiSFskY67X1kJ8HdJQEly7WZVaIvTDBoyzTe1ggRgR2RO7LrJ/C2UNxJO7aOYs23Y4uawAhLamnQ66iewu7ZIIPvoYO6GhNNbQkhqig0769s/SdDdyoWmS0x96NYCrbUGuynU6mkLNYBiGn2ozbFl3ps0zadG0zn7ghVyTjqGkr9LvjQrv+bTKYp4by2D0nxx2Kju3b8fAQYXG9oq+sJiqJ+xtEPko6bQ+9EXkHVqcHcL34IolwD/amrElsR+x5u433RhVNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSk0IC9bumg1OPtp2r3uf36kVqlsJJdoiFCcCIBlSAI=;
 b=CLHLAiYH+oCOVYhjmBTZgTuzx4Wg/8WLsWizPpv7VKznuVQ8qHoiGf+TQPenVmmUPxGlpvFV3JLUXNWYz5vGofIbiOLV7RYVSqXRswPrqUa0cjTg6yQ4PJKRiGnYGrNZ0T661L4eB13ZNI3TeoNhxFYy9Pb0CLCxjm/kKYCJHWuzftvuq8JHSdtWY0KnTXbBKMPuJp18Os8qvfysJ6uV24NTCkn6KDbmRjYCdlklCuXqSeDtPv5ZMiucZZscxmgRxN42n3OTNUS2gTQqM5/edVXz/8XnN8yYRvSckPyeEnPD3oBDCM1IM/oKZNqQc0/XLZ9VR+uGa8vxNQxrFg6AYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSk0IC9bumg1OPtp2r3uf36kVqlsJJdoiFCcCIBlSAI=;
 b=hF67/yzVOBZYhfEzQ7ToYN7wfFWW29B55ifisVHKczpN+pNR0x/5VeKnW0ZF1Px2XPCokAuhrcu8aqjFcImThuC6//cPzPXbx8yBqxR820TuDjllEtxeC2UP9wKpxF8K8pLq4sbXY7Deno2lQwPs5BdZ/GluZ3VgPEWjGh6+4JM=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2630.namprd15.prod.outlook.com (2603:10b6:a03:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Wed, 11 Nov
 2020 17:43:56 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 17:43:55 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wCACrH/AIAL89oAgAr+gQCAAbUvgP//01+AgAn/b3U=
Date: Wed, 11 Nov 2020 17:43:55 +0000
Message-ID: <BYAPR15MB32237A83663873C353273D82CEE80@BYAPR15MB3223.namprd15.prod.outlook.com>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <D4F1F4FA-E1E2-425C-B685-D0BAE3D5E596@fb.com>
 <A6D2354C-DD02-4BCB-AAE2-2F6B16784DBD@fb.com>
 <A5439E11-28B2-4476-9A9E-D8A8CA525A32@fb.com>
 <179181C3-A497-4D36-8A73-F22DA7FF4D8B@fb.com>
 <9EDCD78E-A095-48AA-93BC-BF73AD8BD533@fb.com>
 <B765ACF5-8DD7-4995-8D62-8634F5A80243@fb.com>
 <091D0CE7-1D69-448E-8C82-C2EBA1DABF27@fb.com>
 <69F5B6C0-60A7-4D5D-A841-AB4CE7E9AD2D@fb.com>
 <FF528567-512C-4401-BD64-85551288618E@fb.com>
 <896dd847-1155-9a51-37ed-6d52852387c5@linux.intel.com>,
 <C44A5FA8-CD4E-4D4B-A71A-2C924099F5C0@fb.com>
In-Reply-To: <C44A5FA8-CD4E-4D4B-A71A-2C924099F5C0@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:640:106:7a12:462:982c:b4eb:d6ff]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e1a2c71-8f8f-4667-cc00-08d886695cd3
x-ms-traffictypediagnostic: BYAPR15MB2630:
x-microsoft-antispam-prvs: <BYAPR15MB26301338F7EAAEE6F3F2AF2CCEE80@BYAPR15MB2630.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s1m4B5oXMbwL8vkLWep5cwayhbFex33PDsY4xe5KL0VLZS+xE8lYee4vqshKsEMJjpwG0/2MZHSX4cjguT+iXCuXAMyFvlTSnGWlJkKREvDdJEGqdUtetZOYrzOQaybrVKFynsebUiHGCiNd0wY9roJygMwbyGyj5ro265hsEPYcgHsXjzMa/PkbGExHcM3+jWyGKsyvbpra/1hOMQ2KPZbw4RY3lsiCu/+oieZ9LL6PhxWBGhWZQxjGnTpAyT7ahWZHwR7oMoUmd8t+BpP+33cLFSKzyGLEfv2sxID9WJbZUKhOHKilm0SonXLp1Qy9kcMI6+71GObnK97nkglSoYyst8ZOoByQS3wo49XbwqBtbY70J6prA8HQLqd1z1p+HCU6e8GmOrZkOH9AQWjynA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(2906002)(966005)(83380400001)(7696005)(478600001)(8936002)(66476007)(66446008)(76116006)(52536014)(33656002)(66616009)(3480700007)(64756008)(66556008)(9686003)(55016002)(5660300002)(8676002)(7116003)(316002)(6506007)(6916009)(71200400001)(86362001)(99936003)(186003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: nzjP4odY85hPpkL1UTCC3jCET5XmoB7cjroWf4yE7j+kXrvf1U/rtjrG5ewpuOKUVrLjQUIoSEaQ4EWsp7ButjnmHfah+9jhLkjFWNMteBQiOHaHrtlWe9dz4yGsvw9hVOPSX3qmDKUiHMycfxmb7L/hjimtCw02Qul9VKA/QYNmfbXnzubmDBRKJ9hxC+W1ctf3pcLiXflEF1by1nTgCfH+UXtWvfJJdfex3463OX3xMFnwCrQqUpQdXN4yqfPfkX6z9LLK5FsKvSbbiC3dzhd0uD4vaTiwjQoDJtsWS6evyozPmYv1qK7nLEXV2SeIUK+YGMfjuBL0ctGS1dA1vVGa0FGHQ7G/+26oALk6bt46Mrjhi0TMH0t+Q/qbd08VlfNQCklya8hZpglKx1ig21OHCDY2Onvz8OAwVD72PSHOKj3zua3Crp5/q21WL+5JuqTbOXnk2IzWl2eZvGc5MqmMO8s6MWgwEzrzyRpwLpW8vc4EyOuKk3mX4A3g2GvvN2wZ1Kn04FtbX1IOwol6SG3N1r303lXIpqjl8JAKlELlSj9q3/Yfp6m7QTYCXlNrL+R040wxfCikzSLm6Q0w9+skcrupHuR1YPsy0WIhZv+mpJaT1WGhanwu0wodrQNt947bu25fonHpeh80fAxKm/o5bcIp9EBZ//6M3ZiBWcpKxIfJFyYFoHbFv6tndyOATpdk2YxxsTjZkCyxiPPTsw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1a2c71-8f8f-4667-cc00-08d886695cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 17:43:55.8288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SlYceIwJROmbOjqR5ICGTKMeEsSlIndmTzAQbtdg7KYhjNFWFFt4g04uZvAEEXTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2630
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_09:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110106
X-FB-Internal: deliver
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

--_004_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_
Content-Type: multipart/alternative;
	boundary="_000_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_"

--_000_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Quick reminder about this week=92s learning session (rescheduled from last =
week) about DMTF=92s =93Security Protocol and Data Model=94 aka =93SPDM=94 =
by  Vikram Bodireddy on Thursday@10AM (IST).

NOTE: There will be NO learning sessions for next couple of weeks with last=
 session in this series is planned for 12/3. I will be sending a reminder a=
nd calendar event a day before this event.

Following are the session details and also attached meeting invite.

Topic: SPDM
Time: Nov 12, 2020 10:00 AM India

Join Zoom Meeting
https://us02web.zoom.us/j/9396880476?pwd=3Da2gyYkVpRjhBZEthQUQzcEF2QjRXUT09

Meeting ID: 939 688 0476
Passcode: openbmc
One tap mobile
+16699009128,,9396880476#,,,,,,0#,,8592515# US (San Jose)
+12532158782,,9396880476#,,,,,,0#,,8592515# US (Tacoma)

Dial by your location
        +1 669 900 9128 US (San Jose)
        +1 253 215 8782 US (Tacoma)
        +1 346 248 7799 US (Houston)
        +1 301 715 8592 US (Washington D.C)
        +1 312 626 6799 US (Chicago)
        +1 646 558 8656 US (New York)
Meeting ID: 939 688 0476
Passcode: 8592515
Find your local number: https://us02web.zoom.us/u/kddfSpAkEj



--_000_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Quick reminder about this week=92s learning session =
(rescheduled from last week) about DMTF=92s =93Security Protocol and Data M=
odel=94 aka =93<b>SPDM</b>=94 by &nbsp;Vikram Bodireddy on Thursday@10AM (<=
b>IST</b>).
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">NOTE: There will be NO learning sessions for next co=
uple of weeks with last session in this series is planned for 12/3. I will =
be sending a reminder and calendar event a day before this event.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Following are the session details and also attached =
meeting invite.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Topic: SPDM<o:p></o:p></p>
<p class=3D"MsoNormal">Time: Nov 12, 2020 10:00 AM India<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Join Zoom Meeting<o:p></o:p></p>
<p class=3D"MsoNormal">https://us02web.zoom.us/j/9396880476?pwd=3Da2gyYkVpR=
jhBZEthQUQzcEF2QjRXUT09<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Meeting ID: 939 688 0476<o:p></o:p></p>
<p class=3D"MsoNormal">Passcode: openbmc<o:p></o:p></p>
<p class=3D"MsoNormal">One tap mobile<o:p></o:p></p>
<p class=3D"MsoNormal">+16699009128,,9396880476#,,,,,,0#,,8592515# US (San =
Jose)<o:p></o:p></p>
<p class=3D"MsoNormal">+12532158782,,9396880476#,,,,,,0#,,8592515# US (Taco=
ma)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Dial by your location<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1 669 90=
0 9128 US (San Jose)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1 253 21=
5 8782 US (Tacoma)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1 346 24=
8 7799 US (Houston)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1 301 71=
5 8592 US (Washington D.C)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1 312 62=
6 6799 US (Chicago)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +1 646 55=
8 8656 US (New York)<o:p></o:p></p>
<p class=3D"MsoNormal">Meeting ID: 939 688 0476<o:p></o:p></p>
<p class=3D"MsoNormal">Passcode: 8592515<o:p></o:p></p>
<p class=3D"MsoNormal">Find your local number: https://us02web.zoom.us/u/kd=
dfSpAkEj<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_--

--_004_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_
Content-Type: text/calendar; name="obmc-SPDM.ics"
Content-Description: obmc-SPDM.ics
Content-Disposition: attachment; filename="obmc-SPDM.ics"; size=1543;
	creation-date="Wed, 11 Nov 2020 17:41:04 GMT";
	modification-date="Wed, 11 Nov 2020 17:41:04 GMT"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFzaWEvS29sa2F0YQ0KVFpVUkw6aHR0cDovL3R6
dXJsLm9yZy96b25laW5mby1vdXRsb29rL0FzaWEvS29sa2F0YQ0KWC1MSUMtTE9DQVRJT046QXNp
YS9Lb2xrYXRhDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOiswNTMwDQpUWk9GRlNFVFRP
OiswNTMwDQpUWk5BTUU6SVNUDQpEVFNUQVJUOjE5NzAwMTAxVDAwMDAwMA0KRU5EOlNUQU5EQVJE
DQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCkRUU1RBTVA6MjAyMDExMTFUMTczNzA4Wg0K
RFRTVEFSVDtUWklEPUFzaWEvS29sa2F0YToyMDIwMTExMlQxMDAwMDANCkRURU5EO1RaSUQ9QXNp
YS9Lb2xrYXRhOjIwMjAxMTEyVDExMDAwMA0KU1VNTUFSWTpTUERNDQpVSUQ6MjAyMDExMTFUMTcz
NzA4Wi05Mzk2ODgwNDc2QGZlODA6MDowOjA6NGM2OmJjZmY6ZmVjOTo2OTZmZW5zMw0KVFpJRDpB
c2lhL0tvbGthdGENCkRFU0NSSVBUSU9OOlNhaSBEYXNhcmkgaXMgaW52aXRpbmcgeW91IHRvIGEg
c2NoZWR1bGVkIFpvb20gbWVldGluZy5cblxuSm8NCiBpbiBab29tIE1lZXRpbmdcbmh0dHBzOi8v
dXMwMndlYi56b29tLnVzL2ovOTM5Njg4MDQ3Nj9wd2Q9YTJneVlrVnBSamhCWkUNCiB0aFFVUXpj
RUYyUWpSWFVUMDlcblxuTWVldGluZyBJRDogOTM5IDY4OCAwNDc2XG5QYXNzY29kZTogb3BlbmJt
Y1xuT25lIHQNCiBhcCBtb2JpbGVcbisxNjY5OTAwOTEyOFwsXCw5Mzk2ODgwNDc2I1wsXCxcLFws
XCxcLDAjXCxcLDg1OTI1MTUjIFVTIChTYW4NCiAgSm9zZSlcbisxMjUzMjE1ODc4MlwsXCw5Mzk2
ODgwNDc2I1wsXCxcLFwsXCxcLDAjXCxcLDg1OTI1MTUjIFVTIChUYWNvbWENCiApXG5cbkRpYWwg
YnkgeW91ciBsb2NhdGlvblxuICAgICAgICArMSA2NjkgOTAwIDkxMjggVVMgKFNhbiBKb3NlKVxu
ICAgICANCiAgICArMSAyNTMgMjE1IDg3ODIgVVMgKFRhY29tYSlcbiAgICAgICAgKzEgMzQ2IDI0
OCA3Nzk5IFVTIChIb3VzdG9uKVxuICANCiAgICAgICArMSAzMDEgNzE1IDg1OTIgVVMgKFdhc2hp
bmd0b24gRC5DKVxuICAgICAgICArMSAzMTIgNjI2IDY3OTkgVVMgKEMNCiBoaWNhZ28pXG4gICAg
ICAgICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspXG5NZWV0aW5nIElEOiA5MzkgNjg4IDA0
NzYNCiBcblBhc3Njb2RlOiA4NTkyNTE1XG5GaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBodHRwczov
L3VzMDJ3ZWIuem9vbS51cy91L2sNCiBkZGZTcEFrRWpcblxuDQpMT0NBVElPTjpodHRwczovL3Vz
MDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGDQog
MlFqUlhVVDA5DQpCRUdJTjpWQUxBUk0NClRSSUdHRVI6LVBUMTBNDQpBQ1RJT046RElTUExBWQ0K
REVTQ1JJUFRJT046UmVtaW5kZXINCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5E
QVINCg==

--_004_BYAPR15MB32237A83663873C353273D82CEE80BYAPR15MB3223namp_--
