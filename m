Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2E2DC54C
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 18:28:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cx2C14gfBzDqMN
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 04:27:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=96195c5c09=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HS2au+Dg; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=EPz/x8xz; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cx2B1606JzDqK3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2020 04:26:57 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BGHK7Fx005970
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 09:26:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=jAsyCLqIA7Vz8nnZ1rteYtGF+o5VvkRHj4t7IhV/X1M=;
 b=HS2au+DggaHzr0KGvKYR5t3aR5xFeVs7hgysnL5ZIGPhT28SkIVWHVTjMSi7oWOzo1j1
 fXDbPE2K3UKSuJ6YId+YOBNpkkF3xS/JcHKAd8ZY+/204Gol6BVOlM4HVBhF4H7o1II3
 uWJFd7dZYtyRl+axBehGNecAaiUUel8YTbA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 35ewhdqja5-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 09:26:52 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Dec 2020 09:26:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdO+saPG7NO22XJO9PRbHUAEUA/ZXcm/5i32FooGZQI1XE3LEYg2w38qZD+NZ0Yf0+xhtWQ6y39gm9T2mn/LFqBhJCbULNFjJvpF9l46rgzaWUkR/1lzhyQ3LabQhh5+nSWL6Rg2nx06LOFeFpcUNgucbDhR+NaHqvVZlDZNRmVeeilOJNsOV8475evEpwNlrR17s5i28v2WOttLZ4fJE+bpy/JlgwebV20XsF/aP0ySsHEAHVJV4LKoQ4OHOUNOtt5y5ZpgJGcF0140I4Qa3uas1JOxWNZvbj8xY4mgdSbjpl+Ki/ICK0vucz+DbEpf9l5YHzATYh5I7STeXYi43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAsyCLqIA7Vz8nnZ1rteYtGF+o5VvkRHj4t7IhV/X1M=;
 b=gyUmDEUOlAsLM6bmeEaW8E8nWxfhtAYrHSqSYNVRZxzUn37gdkkVPk7roYV22gRp2BKy2xZHYGj/tGgaHDao7rVOUSeDxxHsinTRpeDSxnr5eO10JD1g9/QP7gPvwDNATXwt6jZR7wlCBFt7qMCGX2Sb3awydhtWKXQRs0iN/0jGGUMrkgd2VMXhUGIBqnPmjxkIiq0VEP9fL+OSoz8d9COn9rpIGXor5V2udguuyVTJwongRU8BqNzeqgIAS3JeWV4NLOkjD6sJiqkdW3E8xPweRQ2FGJ3IIZq9eG0g3q9o34p2j1Xh5CFZYChDoVm1RzVhv2CI0jVKPl2XCmqGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAsyCLqIA7Vz8nnZ1rteYtGF+o5VvkRHj4t7IhV/X1M=;
 b=EPz/x8xzalgv5fHhQW16Ubi4fFh6G9WZI/7mcCO390Mt3YfgJ8+3P9ImuvTtMNQsc1MScPEcwjUMk2xghsXgiExr27cIPryuYxtdHO6c6+DRGMmv3ET7ipvwWMOhL6vRRwDLSl/ngK49FZJninhW88++XZyAE8JnO/zvl6y2isE=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2389.namprd15.prod.outlook.com (2603:10b6:a02:86::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 17:26:35 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::fcd1:23a6:cce0:e05e]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::fcd1:23a6:cce0:e05e%7]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 17:26:35 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wCACrH/AIAL89oAgAr+gQCAQoUlOw==
Date: Wed, 16 Dec 2020 17:26:35 +0000
Message-ID: <BYAPR15MB322357EE4977AF2A30E0889FCEC50@BYAPR15MB3223.namprd15.prod.outlook.com>
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
 <69F5B6C0-60A7-4D5D-A841-AB4CE7E9AD2D@fb.com>,
 <FF528567-512C-4401-BD64-85551288618E@fb.com>
In-Reply-To: <FF528567-512C-4401-BD64-85551288618E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [67.160.197.76]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bb4220a-87eb-4ba3-a6bc-08d8a1e7bd31
x-ms-traffictypediagnostic: BYAPR15MB2389:
x-microsoft-antispam-prvs: <BYAPR15MB23895E9B8FC44C7F854999BCCEC50@BYAPR15MB2389.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:480;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G60PSfhSHJi59AckAx/w43lb0wjFBsxK1Pv4bJ5Eg1Q21wUnCFx9Exf32PQS/ASAkvX3n66rRuk78TduVaHrjfax3HBHv7vOhXw9oVz0h+AJhJ0a4whGKl8ckjyk5qVfn2gdupMqYV9fLMi1kACbTDNAZEhlddx+3y7Lf7BlACKsvD4naRsGiwqSgQhy1cDLcss+vX0Fn5lro4gXBkps6htWiSuw2dYduONONSz5q+mUxJ18/lu+V1gt1Qja3N7pbd91gOv2VLSMV2U85bd/3HRu6v7K8Sl28aa7lNfmOf0FZrK4szv5rE/yciUd2ImPBHG20n0jC8Vgsi6L6rXA15ufkUC2NHLg/QEldmzKMmelXfnEcoDElDRKVkeRjijTGBZbcyCWReKbZyJJtsC4cQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(396003)(136003)(366004)(86362001)(83380400001)(186003)(5660300002)(478600001)(8676002)(316002)(9686003)(6916009)(76116006)(55016002)(3480700007)(26005)(99936003)(71200400001)(4744005)(966005)(66616009)(66446008)(6506007)(66946007)(64756008)(7116003)(66476007)(2906002)(7696005)(52536014)(8936002)(33656002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?FNnPLhy5pdrfgERenSlx3yWfPkHCwnU+jzUeKWP7EtymznCkij24DAP5?=
 =?Windows-1252?Q?yHm5J4dhHIKJ72O1g5L+rrxxQJEWPMggVAzUutlrWFntKJ5dX64vW0EB?=
 =?Windows-1252?Q?+3qRx3HKejaZkAK27tCvzpR/YdiOTbRt7sAHEelAFQM8OihamDrif1Q4?=
 =?Windows-1252?Q?9XCUDCKX3mFHhEGI6l0AJiQ9wRyngCWZYfBtb4u82DFVkHP9zqWStjz8?=
 =?Windows-1252?Q?m5OwFpOkM5/vQOeXsE1H9Ndz83iYRFAo4qhcJDRBCD/Yy3J010QOle8/?=
 =?Windows-1252?Q?fgGODhA4HVwFSgCMlCdYNRm7OGHFYSSzLSSxsG97kil5qhIVC+ssdYc3?=
 =?Windows-1252?Q?UFReWyas1mhnFbvMqe0RP+kExsc9CCXzZxtulQ93Xi0HzMl/vC0HK9/x?=
 =?Windows-1252?Q?wj9ADFQq+/GzNrzlffAZtxBQIAp5/HTk9tNmCaOWoPxK5yrBqUVmxSCP?=
 =?Windows-1252?Q?aF9k9A0kDYX/9wyCu+AMnmAl+/TSTGHK6yR7blEeAdmN74KJXVtkK3Cw?=
 =?Windows-1252?Q?TS9y5+E9eDFQ6v9QrGncoh5RKh3+HCOhux6ePAHucevoEfh0QNKXbk4N?=
 =?Windows-1252?Q?me64JpKXrDLmcOX3EUieSHlZW/ez5U+CRjUBSnhGrT35JiXnNhvT71qC?=
 =?Windows-1252?Q?ztMJelYFh718XVp/6uBHMG23zOUbzetMAHka781XZUCt+IS1J+u8bmdD?=
 =?Windows-1252?Q?LSszVb1EXGlqxrFb91/dIF99MteIfi9Owp5/SQabRlurbh3rLGvoybN3?=
 =?Windows-1252?Q?dn4aNuxA13eCe4iHbws+PDkfdnbJ3FPWpOsLkrg2ShMOStViBrdX3KPG?=
 =?Windows-1252?Q?AgooW5lzIMAottqVfvhxnaOmEvVak1X6dqxFlJco5waHY7VQ3iAoQk2N?=
 =?Windows-1252?Q?0R5gLB54FqsN00jVgfdcblfD9L0HbVvmGXToW1opvpS73rTEfqpIMPCw?=
 =?Windows-1252?Q?mTzoRfaKAHM/135mt52NRTsdei2kUFnrGuqvpsmOSFebpk1zu07sGNUB?=
 =?Windows-1252?Q?71aXfV44P2gDd0fTsHftNIi5Cu8VompeXSVx08rrCxbK+HUIwhus4nRn?=
 =?Windows-1252?Q?C9ea3gyW0XVG7rU86qJ/y/9xJop9xhnbqa4CmQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb4220a-87eb-4ba3-a6bc-08d8a1e7bd31
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 17:26:35.5310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mXZHPR1IFsfhX3dVRPIx8N9SLqQ/qcjJK9K8UCHS/Kg7mKNiSzZlA8uWgvg2dnMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2389
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_07:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=970
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160112
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

--_004_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_
Content-Type: multipart/alternative;
	boundary="_000_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_"

--_000_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Quick reminder about the LAST session in this learning series  =93Add-On Ca=
rd Modelling =96 PLDM=94 by  Richard Thomaiyar on Thursday@10AM (PST). Foll=
owing are the session details and also attached meeting invite.

Topic: Add-on card modelling =96 PLDM
Time: Dec 17, 2020 10:00 AM Pacific Time (US and Canada)

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
Find your local number: https://us02web.zoom.us/u/kJ2VhJY0E


--_000_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_
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
span.EmailStyle19
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Quick reminder about the LAST session in this learni=
ng series &nbsp;=93<b>Add-On Card Modelling =96 PLDM</b>=94 by &nbsp;<b>Ric=
hard Thomaiyar</b> on Thursday@10AM (<b>PST</b>). Following are the session=
 details and also attached meeting invite.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Topic: Add-on card modelling =96 PLDM<o:p></o:p></p>
<p class=3D"MsoNormal">Time: Dec 17, 2020 10:00 AM Pacific Time (US and Can=
ada)<o:p></o:p></p>
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
<p class=3D"MsoNormal">Find your local number: https://us02web.zoom.us/u/kJ=
2VhJY0E<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_--

--_004_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_
Content-Type: text/calendar; name="AddOnCard-PLDM.ics"
Content-Description: AddOnCard-PLDM.ics
Content-Disposition: attachment; filename="AddOnCard-PLDM.ics"; size=1795;
	creation-date="Wed, 16 Dec 2020 17:24:40 GMT";
	modification-date="Wed, 16 Dec 2020 17:24:40 GMT"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFtZXJpY2EvTG9zX0FuZ2VsZXMNClRaVVJMOmh0
dHA6Ly90enVybC5vcmcvem9uZWluZm8tb3V0bG9vay9BbWVyaWNhL0xvc19BbmdlbGVzDQpYLUxJ
Qy1MT0NBVElPTjpBbWVyaWNhL0xvc19BbmdlbGVzDQpCRUdJTjpEQVlMSUdIVA0KVFpPRkZTRVRG
Uk9NOi0wODAwDQpUWk9GRlNFVFRPOi0wNzAwDQpUWk5BTUU6UERUDQpEVFNUQVJUOjE5NzAwMzA4
VDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7QllNT05USD0zO0JZREFZPTJTVQ0KRU5EOkRBWUxJ
R0hUDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAw
DQpUWk5BTUU6UFNUDQpEVFNUQVJUOjE5NzAxMTAxVDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7
QllNT05USD0xMTtCWURBWT0xU1UNCkVORDpTVEFOREFSRA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46
VkVWRU5UDQpEVFNUQU1QOjIwMjAxMjE2VDE3MjE0M1oNCkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xv
c19BbmdlbGVzOjIwMjAxMjE3VDEwMDAwMA0KRFRFTkQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVz
OjIwMjAxMjE3VDExMDAwMA0KU1VNTUFSWTpBZGQtb24gY2FyZCBtb2RlbGxpbmcg4oCTIFBMRE0N
ClVJRDoyMDIwMTIxNlQxNzIxNDNaLTkzOTY4ODA0NzZAZmU4MDowOjA6MDoxNGE2OjE3ZmY6ZmVk
YTpiNzQxZW5zNQ0KVFpJRDpBbWVyaWNhL0xvc19BbmdlbGVzDQpERVNDUklQVElPTjpTYWkgRGFz
YXJpIGlzIGludml0aW5nIHlvdSB0byBhIHNjaGVkdWxlZCBab29tIG1lZXRpbmcuXG5cbkpvDQog
aW4gWm9vbSBNZWV0aW5nXG5odHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdk
PWEyZ3lZa1ZwUmpoQlpFDQogdGhRVVF6Y0VGMlFqUlhVVDA5XG5cbk1lZXRpbmcgSUQ6IDkzOSA2
ODggMDQ3NlxuUGFzc2NvZGU6IG9wZW5ibWNcbk9uZSB0DQogYXAgbW9iaWxlXG4rMTY2OTkwMDkx
MjhcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAoU2FuDQogIEpv
c2UpXG4rMTI1MzIxNTg3ODJcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1
IyBVUyAoVGFjb21hDQogKVxuXG5EaWFsIGJ5IHlvdXIgbG9jYXRpb25cbiAgICAgICAgKzEgNjY5
IDkwMCA5MTI4IFVTIChTYW4gSm9zZSlcbiAgICAgDQogICAgKzEgMjUzIDIxNSA4NzgyIFVTIChU
YWNvbWEpXG4gICAgICAgICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbilcbiAgDQogICAgICAg
KzEgMzAxIDcxNSA4NTkyIFVTIChXYXNoaW5ndG9uIEQuQylcbiAgICAgICAgKzEgMzEyIDYyNiA2
Nzk5IFVTIChDDQogaGljYWdvKVxuICAgICAgICArMSA2NDYgNTU4IDg2NTYgVVMgKE5ldyBZb3Jr
KVxuTWVldGluZyBJRDogOTM5IDY4OCAwNDc2DQogXG5QYXNzY29kZTogODU5MjUxNVxuRmluZCB5
b3VyIGxvY2FsIG51bWJlcjogaHR0cHM6Ly91czAyd2ViLnpvb20udXMvdS9rDQogSjJWaEpZMEVc
blxuDQpMT0NBVElPTjpodHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEy
Z3lZa1ZwUmpoQlpFdGhRVVF6Y0VGDQogMlFqUlhVVDA5DQpCRUdJTjpWQUxBUk0NClRSSUdHRVI6
LVBUMTBNDQpBQ1RJT046RElTUExBWQ0KREVTQ1JJUFRJT046UmVtaW5kZXINCkVORDpWQUxBUk0N
CkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_004_BYAPR15MB322357EE4977AF2A30E0889FCEC50BYAPR15MB3223namp_--
