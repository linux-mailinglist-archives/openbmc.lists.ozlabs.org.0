Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FBD4A8C60
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 20:21:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqT701Ff0z3bcF
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 06:21:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=WebqDxYH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=30339f3f52=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=WebqDxYH; dkim-atps=neutral
X-Greylist: delayed 3537 seconds by postgrey-1.36 at boromir;
 Fri, 04 Feb 2022 06:21:05 AEDT
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqT6T0k4Wz2xsY
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 06:20:57 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213I6Vk0020519;
 Thu, 3 Feb 2022 10:22:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=6TeZVnSAfUOID1B+mM8BY345x5mhyRiNd/TEPApFuNY=;
 b=WebqDxYHraDhA2xkYOJuBClnnYXHjbsdPEnUXl1x8BE2AJX7fAo2fe73yTcub80lq7Qh
 v1XAb9mUZsVWVm3+fz1vH9TMV3pit3kwAg5rkPjK2TCt8zFZF+bVSfZFDnEULQt5ukgJ
 2N9uFQvbqp5s5k82XkHdY4OfTMRio8Y/Tyo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3e08t14b9b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Feb 2022 10:22:02 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Feb 2022 10:22:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW8ge7En1VNQePeTjErPwdOz/uGVeBCampDxdr1HuowwjOqnPSisue/wrhxnsnFLzlDAxWELQP34ln5CGvq/CGePTeXcOlcfovIfRabLN4ZZwlPckbVz/qCfgX/bZ3SuG8HWa5fUqVHrfZCVx0+n8DVleZ7PawN4ymB9A1O3NSnXxzzT/XMgOmeGV1WWSsjJusQqbaUti4kazyHLa5UyDQm/E4ItWxl4eUUbjaW6Z4sBQQy2LX9QueOAOiDScb2uFadeczOk65WqS+gQE7OzRKjzNop8rGTea2cx3sdUnjkO3rkZlbwZ+LtLg3RwcBw1pfDHVBElfxIgfYg+GRL3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TeZVnSAfUOID1B+mM8BY345x5mhyRiNd/TEPApFuNY=;
 b=iEzdWR4EOtnpC1f8TGrn78pL6dvZgxq2bhMLp9DBHPXs7WvlXbRqbHW7QP+TO1pml2R+RdEQ00M+a2BtKsm1oXIcFxKRzuRgLs1ekYX3SGkbHd25rouC28C+Kwj+sf2ZmCxLv7sDIWJLyfY58MbPQYPYC6FfRdV/5n2IXHf9j5n95cYKFXAYc/nm+B1AUod+/SNusnL0DXSPKoIWiX/v0LqoUBXfQUXbDOMf+LoDSEATUVFxZd45iGeBOrI5298NtaWWa3NCY1W3ZhwqBsvMIWZeetcMY+BwVHrVwi1bspvwQqihmjC5xa76i6NVSucfnTKqQmGbfb8T0AltYXR8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR15MB4620.namprd15.prod.outlook.com (2603:10b6:303:10d::7)
 by MN2PR15MB3613.namprd15.prod.outlook.com (2603:10b6:208:182::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 18:22:01 +0000
Received: from MW4PR15MB4620.namprd15.prod.outlook.com
 ([fe80::119a:1e30:7120:23d0]) by MW4PR15MB4620.namprd15.prod.outlook.com
 ([fe80::119a:1e30:7120:23d0%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 18:22:01 +0000
From: Sai Dasari <sdasari@fb.com>
To: Arun Gandu <gandu.arun@tcs.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: IPMI and PLDM
Thread-Topic: IPMI and PLDM
Thread-Index: AQHYGPV4RZN3a5P79EeTkPGTx13z+6yCI4Gy
Date: Thu, 3 Feb 2022 18:22:00 +0000
Message-ID: <MW4PR15MB4620757BE77EF1078CA8BA0ACE289@MW4PR15MB4620.namprd15.prod.outlook.com>
References: <BMXPR01MB471055B9F70BD99ABD6775A38E289@BMXPR01MB4710.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB471055B9F70BD99ABD6775A38E289@BMXPR01MB4710.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c9e6ca8-ae65-4837-354d-08d9e7421247
x-ms-traffictypediagnostic: MN2PR15MB3613:EE_
x-microsoft-antispam-prvs: <MN2PR15MB3613C15B4F2976FC12CE852FCE289@MN2PR15MB3613.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /OhAMNtPIEnJB36RiKLFbe3NjBR76h0uYR7dOYbF0iuYiXLxu26/ativ0Y25tpTRgo+nQgzyCT73z1ZdcTHcBUEvTIMe6Qe08w+cOYzD0+fWIs54/Gixiclni09bSJIkEJXKhPNijwsHCNZbUXnZ7h5ithcq0y2ytIDdAtoZPx4ku/Ym2Nv7XNgk/5WIcXhbGrm7ixCEjuKRkGi3qL4lSYF1ipre0tsvxPlCeBMaO5mOxEWVkgVYR0G5fEKBiMQ6EDRYoHTVXEd0TuCpBZBl6lhTT8Iy7yQHLMz5XNhERPfj5RZU40iiarzvdVvncu4mstVXjBLiKQ6GG8aWp7urTkM2fgXm5MshJ2Pypp51aapKq8hEYkrlf8i7tOKiMolQtNaDl8QOz925KMyqiurlkQi30nmgKb/BA/eaDI17OZDs7cpYOSEQZSBxNpAYfHxuGJJ2/GXwUIaVRulq3TvB7YR3A28QYbPNxFR+jxZet3XGX1WaJBoTjoi/at6qvWdTgm6i+4P7LXZTFIMRHVw0t5eGKehAgigB+WVKeqkPhzOILmLE/iPwmU3PRuJtks0twun7mhDuDs83NcIicU+/NxhAa4lvtcgrhHyDlgxXmRDwcVH19JPmjlwNlEJDWAgKvunVec8PC4mm7d0ufQH6pHk/s4lAg5NrwBfwq0VD4rysM9twCMbnsNO79MVdBxszYMitNX8+34V/P1jBR7mN1youKu+owKfhmoY5epM4ikUDf080gwCm7JjLPEK9k06rwZzqvT70k5neKnyJYD8e60HMr+o5N2+L2ih7grz7OCQ1bzPqU58F5Tp5rr7rubPyDcoh7PKlD8qzednrJSjpWXRTHoK8PeeBW+ehjYxvZcKCqoqPXahYJ6j1Mcvfb4/N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR15MB4620.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(5660300002)(2906002)(3480700007)(55016003)(4744005)(33656002)(110136005)(86362001)(8676002)(66476007)(66556008)(9326002)(76116006)(66946007)(52536014)(38070700005)(38100700002)(122000001)(7116003)(64756008)(91956017)(66446008)(8936002)(6506007)(7696005)(45080400002)(71200400001)(186003)(166002)(9686003)(53546011)(966005)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wd3oh/F9RUiC7JDuPuJRrZdb4tG1Ln0+FAShd9FcwS8YtlVmwZmf4vEM2UUE?=
 =?us-ascii?Q?W/aGc5F9PUeaKU/SS8lHjnN0FO30+Z1xTOfnYX6glXhatP4mOFXItJ1psMGF?=
 =?us-ascii?Q?IF55HyGBxEmvBr3DfAAmtounnSion2+/nhao2MBi6YbCO2SWCz5iP10XfJc1?=
 =?us-ascii?Q?e51cnnhfSq2sonrme2V1bIgcPijUkKp8gMR5pSMULgQE+KegaJUf91h87n4F?=
 =?us-ascii?Q?V4RUsqj5+UVQ2xmYMLLqP1H+CA6TlMICQvWChKiECbfLMtSqE2O2Nwun/90k?=
 =?us-ascii?Q?J9F16svznBVQ22+NkZG12DMEi8pNEw0OmwX+JtsW2lU74c7mIoTqqLHQg1QR?=
 =?us-ascii?Q?y1NlkGlwdSV3ulFNWD4H61QofiwuWoI2aHl9GbMisUZIIS4oZ9rQZetQuXx8?=
 =?us-ascii?Q?efgo+RyzubKmwaR65lete3r6ha/ODdJPnZU1mFq2yKC0tfptSUPs/jmVEEtm?=
 =?us-ascii?Q?U6tRUHaTYkHj4kaXJ+t+iXJC/fen7g01Vca+4pwKTw/IdDGaLzseizEsTA6O?=
 =?us-ascii?Q?+fMTjItW0goL8v5jsGGlYyGXgzl624vrEs14s2hHPYjdoNEJ8kDLab4jGMUu?=
 =?us-ascii?Q?yHOslDFfBa/70J49e+R6wvwJLG7HzuAz6BsuJf4cpT31jNexoYSMH+NXKfeF?=
 =?us-ascii?Q?SZnUD83OkmrqTufwo8YeHZB4XFuuRW8LoVQ4KGw1wfLEy9PRINrWmKHi8TVw?=
 =?us-ascii?Q?pa9ogkDY1GMNt6moyrpYis8a0xAFz3LTLXQO/kYj4KQbN8AeWB/ygAzgF71U?=
 =?us-ascii?Q?3j78h4vyZsRyui1Znlk0ZRIf2mICnPo4LHypLnsNJw5Q3zgVahbUcta803M1?=
 =?us-ascii?Q?AAGPq92/FQlcRgLRtLgsr1roTlYQWvHcNfeTXt+3Mkj085a73VSmyx+zIVjv?=
 =?us-ascii?Q?JuzwD7hR36clURMEq2aGhFQa3gcoU1trXX4+UTkbQqMNWTTv/XsU549w/afr?=
 =?us-ascii?Q?6kCDI8VWP9+SqHFwBd0S5JQCXGrcokcqCysWiTdhyKyP9s3y9acWrtxj7k4F?=
 =?us-ascii?Q?dSZ2j/ZzSrExUjDxh7IwlJgkpryGS2lYN4AjO8/56Os03ElRyWptG7olycjU?=
 =?us-ascii?Q?SOU5QejU/4Y1pSNy29CkOJDjjOyuD8iqUC0v484ulBxvajG3sYAdS2zwM3WE?=
 =?us-ascii?Q?CWH0xkfRLo7R0e4qX3uQM/LgJqPmayGjMhBkdgQYkhUiuPMKSWDkuwBbhk2w?=
 =?us-ascii?Q?0OnJmiC+pQMM6x5AobMMStnzzc6Na4lBDJCYBOJ8swEeRpmU5smyBNxjFykf?=
 =?us-ascii?Q?Jduo5ip2CpLeClCdtFzhoK08Kt8YQ/+J4aC1lAXnVYlDvCQxRJU+9xcO5SP6?=
 =?us-ascii?Q?9iFOapeRW0v4fVPkAJiqM7hXJhAFDZvqnKqRuCpYRi/OvXOuzNvdCdslCUDJ?=
 =?us-ascii?Q?2lNHDV04Wu6VVlvD8e9t26tGsrxaYNXGVmTDgFkxXLK0YbrYsv0inRaAstNx?=
 =?us-ascii?Q?wJ8+2vXA8JiXgUB8JNNvJY9SNDP/LgrO8V1spNzJmzHRVyz+4nKOelmsA8ab?=
 =?us-ascii?Q?1yNz9JZW83ft1HBhF6wjj1QZzmlO7LE5hoESY5HLMAGJzPSdinGrUP6zYWP2?=
 =?us-ascii?Q?86W4FxwncPE7twRSqU6PHyDBaaGCkW52xO+SGUpc0WLz77odfiirtf7e/xwf?=
 =?us-ascii?Q?Jw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR15MB4620757BE77EF1078CA8BA0ACE289MW4PR15MB4620namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR15MB4620.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9e6ca8-ae65-4837-354d-08d9e7421247
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 18:22:00.9212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMN9kN+TU+buPUpCjfYFe1Uaud7IvXNFTBh0et3Tpqi/Sphp8lQYoQ24TDNmA1RV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3613
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: B3u1oWylD5piDNyADxCOHhSGRFP2CZQc
X-Proofpoint-ORIG-GUID: B3u1oWylD5piDNyADxCOHhSGRFP2CZQc
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=fb_outbound_notspam policy=fb_outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030111
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

--_000_MW4PR15MB4620757BE77EF1078CA8BA0ACE289MW4PR15MB4620namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Arun,

Please check out slides/video sessions around IPMI and PLDM and see if thos=
e helps for your learning @ https://github.com/openbmc/openbmc/wiki/Present=
ations#openbmc-learning-series2020

Best Regards,
Sai.

From: openbmc <openbmc-bounces+sdasari=3Dfb.com@lists.ozlabs.org> on behalf=
 of Arun Gandu <gandu.arun@tcs.com>
Date: Thursday, February 3, 2022 at 4:05 AM
To: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: IPMI and PLDM
Hi team,
Could you help me in learning and working on IPMI and PLDM. It will be very=
 helpful if you share any files of that.

Regards,
Arun Teja

Get Outlook for Android<https://aka.ms/ghei36>

--_000_MW4PR15MB4620757BE77EF1078CA8BA0ACE289MW4PR15MB4620namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Arun,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please check out sl=
ides/video sessions around IPMI and PLDM and see if those helps for your le=
arning @
<a href=3D"https://github.com/openbmc/openbmc/wiki/Presentations#openbmc-le=
arning-series2020">
https://github.com/openbmc/openbmc/wiki/Presentations#openbmc-learning-seri=
es2020</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best Regards,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Sai.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">openbmc &lt;openbmc=
-bounces+sdasari=3Dfb.com@lists.ozlabs.org&gt; on behalf of Arun Gandu &lt;=
gandu.arun@tcs.com&gt;<br>
<b>Date: </b>Thursday, February 3, 2022 at 4:05 AM<br>
<b>To: </b>openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject: </b>IPMI and PLDM<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
11.0pt;color:#212121">Hi team,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
11.0pt;color:#212121">Could you help me in learning and working on IPMI and=
 PLDM. It will be very helpful if you share any files of that.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
11.0pt;color:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
11.0pt;color:#212121">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
11.0pt;color:#212121">Arun Teja<o:p></o:p></span></p>
<div id=3D"ms-outlook-mobile-signature">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Get <a href=3D"http=
s://aka.ms/ghei36">
Outlook for Android</a><o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_MW4PR15MB4620757BE77EF1078CA8BA0ACE289MW4PR15MB4620namp_--
