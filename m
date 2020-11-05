Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8012A8453
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 17:59:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRqWX0mxqzDqxl
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 03:59:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=85788f41fa=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=mgg1gG6o; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=F++dGyuw; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRqTk4nztzDqwD
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 03:58:09 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5GhnnI023667; Thu, 5 Nov 2020 08:58:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=rp39vO3uclTpQGMMQQq5zwIA+5PaiGN3/9eUdvZws+U=;
 b=mgg1gG6oy/nhz8FDz1HjQHYd61zACH8CcWbKX6mst/9+9yI+3zfTZ9pCF9cEkXLTwlRm
 HTaccvnGgIrbi/VTuRZJ99Ic7V4XhHyy9fEYPFzuYlNOLUi+rKM835jA9zzU/HC4XIlp
 AYKXLuZXEXa63V56jq1X4AVBfGvEByZ/QAw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34kg7m2vqq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Nov 2020 08:58:05 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 5 Nov 2020 08:58:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVvIEumaXALPu+T5twkFGOr32GsarxtX1rxD1LD56Yn4yFZRGdP8bqV3jMuINmc7oFcQaoWol9EjNIpscLq9LI62MTJUCBbee+TVQSk4TuIHTuaJ+gp/yvgeI7f3dRH6pQgcMhERsSNz+6cedaqdVp5Vhpxq3aB95tJSTgRRwUvHjVFYAAI8+pQth8Iptu5cUkDz58uUuF5Cm2t4Y1gK4TkAnTXW1wMhFTHjVMd0KF1X7sTV8N6sF0+2mC2ceguAlJKa6c4Lvqm040SkG+TZwPyS0WkOv8qAlmLXjGvRO3UKHj59lFzr0fothG+KlTfrY2EewGepvblzNHoE4fA5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIe8cVAjoozlQGPr7gH4tQ1m1JL9SCoKFoRs9wvAYBY=;
 b=XqNGr4wPgyxYN01qWWMH2SThuU9BJ2p3TTpBQEQN3GYfwFCSgCMYbx92j29h+uylFGIkNccOBpKyAt9T4CvFaIVWaR59DaaTbG4zF2Cmx163T2QaA73kSOHCs4ycmjqc1V+NQIyJIHH8ueehdmNuPCLEx1q4jWz5v7xEz3dA9qxKKnm8Zng+nPjil0oqCRiVGo+zJowTrTjk+HFz4bYPdf9bpRjF+9z6Sxa/ivXA0Z0pyFV2mVQKCcovd9Bl0LaOrcKDcznB9PvL3iR2hOZn2TfLhXW4rQxK+U8y4bn0O8+INhGEpe3xbX6lhquIYJ5DYsv0I/9GRd8y3a9yfeYXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIe8cVAjoozlQGPr7gH4tQ1m1JL9SCoKFoRs9wvAYBY=;
 b=F++dGyuwAQYLOjvVK0HCC2EWW+vQjp+vZhwGe628CRUCZtPDkzIHkeuzZH7jiCmIzSrvEakrrwpmqb+xs4FvrqZEqxr+qmt3io91PnfMgR9aVYgQCLdBKJJiVIudyaVP7xmfDPzcCbpJbi5arp5fHkiykj1UHH+q7DMr2lyBAoo=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2982.namprd15.prod.outlook.com (2603:10b6:a03:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Thu, 5 Nov
 2020 16:58:01 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 16:58:01 +0000
From: Sai Dasari <sdasari@fb.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wCACrH/AIAL89oAgAr+gQCAAbUvgP//01+A
Date: Thu, 5 Nov 2020 16:58:01 +0000
Message-ID: <C44A5FA8-CD4E-4D4B-A71A-2C924099F5C0@fb.com>
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
 <896dd847-1155-9a51-37ed-6d52852387c5@linux.intel.com>
In-Reply-To: <896dd847-1155-9a51-37ed-6d52852387c5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.42.20101102
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:5200:3df0:18c7:4c63:3895:a54d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f88a852-471d-4974-7e0f-08d881abf4a0
x-ms-traffictypediagnostic: BYAPR15MB2982:
x-microsoft-antispam-prvs: <BYAPR15MB2982E89A0512705407EEF89ACEEE0@BYAPR15MB2982.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L1LyvsV6irqfxOe/iRD8VTKjVDVFYJNO538X4PFWX7yAhRRyNzfkmMmKzVKylQ42U9gcUgnzfvF55nvEmWOR8UApg3uyoNaYi494zZPXh3Ma55BUqxpGnVOoiDkhhFuJXNFHNmuVA5LXzdau3QRsFrSn3J8aSlJTAWysK5BcvsG3tVeFYBsF04p+1WiYr8s4qrQz9vmT0Dgp9VIBulH5w+USupl18JbPw86g03CgluPpjSstkvARjnYyd15Wc5Fe4n1adQ2T6KZJ9RnL3tit/TKadEC2fQQjDsXS6txtjZ/fU4gQs6zNVFdGnAuAh06CWNPZcSXyuItL6iVNF2O68NnquV4381e+Pdt2p/tmgNq4LZepUILukvK/XZvucJnezNJaX0IhvBGCFPEIsgreDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(136003)(39860400002)(186003)(478600001)(110136005)(7116003)(6506007)(166002)(966005)(53546011)(6486002)(71200400001)(2906002)(83380400001)(3480700007)(33656002)(2616005)(5660300002)(86362001)(66946007)(66446008)(6512007)(8936002)(36756003)(8676002)(316002)(76116006)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: i1lKIGhuOnRWKJFTXOM8E/vo67Ld7R2ZtmT181o0UtgBqfjBSEpSbOi/CCFOyqkPtAflcY/9tC0Kz+4JZZnSxWX/A7nWg+lcLhVj5aHvj0ruESqLqGEwGKHxtMAie/BjZszdnwaWLhkgsxakr2Z5WHCncVMVLPnKKth0HtCH+r/vo0lCLSJUwue4oLBJe/j5Z1q4fNucxmjleBIHGEom+b79nSCZzBMlDbXmwHznZZZ67xV+hM1flF6ffKidptkKcSVJyy+1knKMpEdOfRS7ZthtwHCRBhbkoJt/Q+U7TX/HKTUoPrHn4vjfv552OLgpUwB5DnQUF+W07uUAR/X1j0ngjxlDiPE8bwa+nIeVhLZs+J3NZ0ljof2gkyfjcNSHGGdUzx67awZkv2PWvhQK2Fqzbc/Hw33aqAOn0n15kE/BvHAFTyhpa3DGQbUqMGw9oNo7CV2t99XClCPnfMR7u5U+s90Ia1KpJBkQzVIxzOgIpEajcJqB1U5+ng7Hlom2QlBPBOobQW8heaIuw3pc5KthhxDKyEN+xtBcgwJsBoRPmOCN3ngCoi21hUpn6h23sC0LZG0lu2lx5n9t6Sev7wAdqddTPVswsW/bu5QMtkr2Pspr0i23pp65b4HpMflvQuD28TEzRJk+aO24mBkyzWhZw1Aice39Z+FGkdHAcxQovzJvv/tDm7bZ7mUOybt7mHVyFnnBrC91gz0sYjsSmg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_C44A5FA8CD4E4D4BA71A2C924099F5C0fbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f88a852-471d-4974-7e0f-08d881abf4a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 16:58:01.5225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8KxjT8aWuBNv2mIkgISHPuNolfMpjlqPkb7j++B2F7g7kZqkBAF7QIPFgzTGXEn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2982
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_10:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011050112
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

--_000_C44A5FA8CD4E4D4BA71A2C924099F5C0fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIFJpY2hhcmQgZm9yIGxldHRpbmcgdXMga25vdyEgSSB3aWxsIHdvcmsgd2l0aCBWaWty
YW0gYW5kIHJlc2NoZWR1bGUgdG9kYXnigJlzIHNlc3Npb24gdG8gbGF0ZXIgZGF0ZSB0aGF0IHdv
cmtzLg0KDQotU2FpDQoNCkZyb206ICJUaG9tYWl5YXIsIFJpY2hhcmQgTWFyaWFuIiA8cmljaGFy
ZC5tYXJpYW4udGhvbWFpeWFyQGxpbnV4LmludGVsLmNvbT4NCkRhdGU6IFRodXJzZGF5LCBOb3Zl
bWJlciA1LCAyMDIwIGF0IDM6MzggQU0NClRvOiBTYWkgRGFzYXJpIDxzZGFzYXJpQGZiLmNvbT4s
IE9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBPcGVuQk1D
IExlYXJuaW5nIFNlcmllcw0KDQoNCkFsbCwNCg0KRHVlIHRvIHVuZm9yZXNlZW4gY2lyY3Vtc3Rh
bmNlcywgU1BETSBMZWFybmluZyBzZXJpZXMgYnkgVmlrcmFtIEJvZGlyZWRkeSBoYXMgdG8gYmUg
Y2FuY2VsbGVkIHRvZGF5LiBWaWtyYW0gd2lsbCB3b3JrIHdpdGggU2FpIGFuZCBjb21tdW5pY2F0
ZSB0aGUgc2Vzc2lvbiBkZXRhaWxzLCBsYXRlci4NCg0KUmVnYXJkcywNCg0KUmljaGFyZA0KT24g
MTEvNC8yMDIwIDExOjAzIFBNLCBTYWkgRGFzYXJpIHdyb3RlOg0KUXVpY2sgcmVtaW5kZXIgYWJv
dXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIGFib3V0IERNVEbigJlzIOKAnFNlY3Vy
aXR5IFByb3RvY29sIGFuZCBEYXRhIE1vZGVs4oCdIGFrYSDigJxTUERN4oCdIGJ5ICBWaWtyYW0g
Qm9kaXJlZGR5IG9uIFRodXJzZGF5QDEwQU0gKFBTVCkuIEZvbGxvd2luZyBhcmUgdGhlIHNlc3Np
b24gZGV0YWlscyBhbmQgYWxzbyBhdHRhY2hlZCBtZWV0aW5nIGludml0ZS4NCg0KVG9waWM6IFNQ
RE0NClRpbWU6IE5vdiA1LCAyMDIwIDEwOjAwIEFNIFBhY2lmaWMgVGltZSAoVVMgYW5kIENhbmFk
YSkNCg0KSm9pbiBab29tIE1lZXRpbmcNCmh0dHBzOi8vdXMwMndlYi56b29tLnVzL2ovOTM5Njg4
MDQ3Nj9wd2Q9YTJneVlrVnBSamhCWkV0aFFVUXpjRUYyUWpSWFVUMDk8aHR0cHM6Ly91czAyd2Vi
Lnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJaRXRoUVVRemNFRjJRalJYVVQw
OT4NCg0KTWVldGluZyBJRDogOTM5IDY4OCAwNDc2DQpQYXNzY29kZTogb3BlbmJtYw0KT25lIHRh
cCBtb2JpbGUNCisxNjY5OTAwOTEyOCwsOTM5Njg4MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMg
KFNhbiBKb3NlKQ0KKzEyNTMyMTU4NzgyLCw5Mzk2ODgwNDc2IywsLCwsLDAjLCw4NTkyNTE1IyBV
UyAoVGFjb21hKQ0KDQpEaWFsIGJ5IHlvdXIgbG9jYXRpb24NCiAgICAgICAgKzEgNjY5IDkwMCA5
MTI4IFVTIChTYW4gSm9zZSkNCiAgICAgICAgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpDQog
ICAgICAgICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbikNCiAgICAgICAgKzEgMzAxIDcxNSA4
NTkyIFVTIChHZXJtYW50b3duKQ0KICAgICAgICArMSAzMTIgNjI2IDY3OTkgVVMgKENoaWNhZ28p
DQogICAgICAgICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspDQpNZWV0aW5nIElEOiA5Mzkg
Njg4IDA0NzYNClBhc3Njb2RlOiA4NTkyNTE1DQpGaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBodHRw
czovL3VzMDJ3ZWIuem9vbS51cy91L2tkZGZTcEFrRWo8aHR0cHM6Ly91czAyd2ViLnpvb20udXMv
dS9rZGRmU3BBa0VqPg0KLS0+DQo=

--_000_C44A5FA8CD4E4D4BA71A2C924099F5C0fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <7B0A637A97DA6A4E9C4C7E04238B52E4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsN
Cgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTIwDQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30N
CmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwv
aGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIiBzdHls
ZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rcyBSaWNoYXJkIGZvciBsZXR0aW5nIHVzIGtub3chIEkg
d2lsbCB3b3JrIHdpdGggVmlrcmFtIGFuZCByZXNjaGVkdWxlIHRvZGF54oCZcyBzZXNzaW9uIHRv
IGxhdGVyIGRhdGUgdGhhdCB3b3Jrcy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LVNhaTxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8
ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFk
ZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+JnF1b3Q7VGhvbWFpeWFyLCBS
aWNoYXJkIE1hcmlhbiZxdW90OyAmbHQ7cmljaGFyZC5tYXJpYW4udGhvbWFpeWFyQGxpbnV4Lmlu
dGVsLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+VGh1cnNkYXksIE5vdmVtYmVyIDUsIDIwMjAg
YXQgMzozOCBBTTxicj4NCjxiPlRvOiA8L2I+U2FpIERhc2FyaSAmbHQ7c2Rhc2FyaUBmYi5jb20m
Z3Q7LCBPcGVuYm1jICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3Vi
amVjdDogPC9iPlJlOiBPcGVuQk1DIExlYXJuaW5nIFNlcmllczxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPC9kaXY+DQo8cD5BbGwsIDxvOnA+PC9vOnA+PC9wPg0KPHA+RHVlIHRvIHVuZm9yZXNl
ZW4gY2lyY3Vtc3RhbmNlcywgU1BETSBMZWFybmluZyBzZXJpZXMgYnkgVmlrcmFtIEJvZGlyZWRk
eSBoYXMgdG8gYmUgY2FuY2VsbGVkIHRvZGF5LiBWaWtyYW0gd2lsbCB3b3JrIHdpdGggU2FpIGFu
ZCBjb21tdW5pY2F0ZSB0aGUgc2Vzc2lvbiBkZXRhaWxzLCBsYXRlci4NCjxvOnA+PC9vOnA+PC9w
Pg0KPHA+UmVnYXJkcyw8bzpwPjwvbzpwPjwvcD4NCjxwPlJpY2hhcmQ8bzpwPjwvbzpwPjwvcD4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiAxMS80LzIwMjAgMTE6MDMgUE0sIFNhaSBE
YXNhcmkgd3JvdGU6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJt
YXJnaW4tdG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQiPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+UXVpY2sgcmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIGFi
b3V0IERNVEbigJlzIOKAnFNlY3VyaXR5IFByb3RvY29sIGFuZCBEYXRhIE1vZGVs4oCdIGFrYSDi
gJw8Yj5TUERNPC9iPuKAnSBieSAmbmJzcDtWaWtyYW0gQm9kaXJlZGR5IG9uIFRodXJzZGF5QDEw
QU0gKDxiPlBTVDwvYj4pLiBGb2xsb3dpbmcgYXJlIHRoZSBzZXNzaW9uIGRldGFpbHMgYW5kIGFs
c28gYXR0YWNoZWQgbWVldGluZyBpbnZpdGUuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRvcGlj
OiBTUERNPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaW1lOiBOb3YgNSwg
MjAyMCAxMDowMCBBTSBQYWNpZmljIFRpbWUgKFVTIGFuZCBDYW5hZGEpPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPkpvaW4gWm9vbSBNZWV0aW5nPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48YSBocmVmPSJodHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdk
PWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGMlFqUlhVVDA5Ij5odHRwczovL3VzMDJ3ZWIuem9vbS51
cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGMlFqUlhVVDA5PC9hPjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzY8bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBhc3Njb2RlOiBvcGVuYm1jPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbmUgdGFwIG1vYmlsZTxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+KzE2Njk5MDA5MTI4LCw5Mzk2ODgwNDc2IywsLCwsLDAjLCw4
NTkyNTE1IyBVUyAoU2FuIEpvc2UpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij4rMTI1MzIxNTg3ODIsLDkzOTY4ODA0NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChUYWNvbWEp
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkRpYWwgYnkgeW91ciBsb2NhdGlvbjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICsxIDY2OSA5MDAgOTEyOCBVUyAoU2FuIEpvc2UpPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgKzEgMzQ2IDI0OCA3Nzk5IFVTIChIb3VzdG9uKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsx
IDMwMSA3MTUgODU5MiBVUyAoR2VybWFudG93bik8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSAz
MTIgNjI2IDY3OTkgVVMgKENoaWNhZ28pPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEgNjQ2IDU1
OCA4NjU2IFVTIChOZXcgWW9yayk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+UGFzc2NvZGU6IDg1OTI1MTU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkZpbmQgeW91ciBsb2NhbCBudW1iZXI6IDxhIGhyZWY9Imh0dHBzOi8vdXMwMndlYi56b29t
LnVzL3Uva2RkZlNwQWtFaiI+aHR0cHM6Ly91czAyd2ViLnpvb20udXMvdS9rZGRmU3BBa0VqPC9h
PjxvOnA+PC9vOnA+PC9wPg0KPC9ibG9ja3F1b3RlPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LS0m
Z3Q7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_C44A5FA8CD4E4D4BA71A2C924099F5C0fbcom_--
