Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DFE2A6BCC
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 18:35:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRDLf0RL3zDqcH
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 04:35:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=857714208c=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=BQme39Hp; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=bXms6jWh; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRDJs04pwzDqby
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 04:33:24 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 0A4HTYpI029143
 for <openbmc@lists.ozlabs.org>; Wed, 4 Nov 2020 09:33:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=bzpU+zk+nNG6tmsvtpzS9lUGWj4nf1f91Sgp5vASYMk=;
 b=BQme39HpfOeYpCKD9EIk68LyO1Deuxm/fdHlrlJrxFtPMgTYCVJEiZVm0IGO+rjC/Qs/
 sASy6xmHN0kjQaz5DQYvHYlbM4yB8Tx6bdbT4a59ih3Yn/6mMCVd7pXyiu0FSI1HuJOr
 9pfRxzQyE14ArurVkpItOLxu/C68WrW08Y0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 34k9k3fg9h-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2020 09:33:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 4 Nov 2020 09:33:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHAfqKevjPxrWJXxL5GnK9G/mCNrETt79O/W4XKFRcaUn9r1rKmEhAB3iib+vub7aSPOE4m+DGgQyDd7G972f+WHM1og7V5CK4pMT/db+Vx0fjtdjUuv2QOIsedXUscEB7bGaG5td8iZrliTlm6VTzFVAjv9LgzaOMmtLAmWqNgpJZzyNDflXqvqTJkRQ6tghj1psMqUPV0GHhken9/+XfxIntuJO6piVSDca8VDNMX7D7oJFs6UdeiYQHj7izZ6zF8mHuEYZkFu9DGenYoBifM7apBIkSMrWz1muIro2iShlqZsHdvpnRrqPd09swyi9dLHNVfY7+E5BzP/cYnjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzpU+zk+nNG6tmsvtpzS9lUGWj4nf1f91Sgp5vASYMk=;
 b=P0COYqcK5Z84p+ojZDO70cg/8Tt+dBbZsFNCmc0E3ScfVkekklJC+MfI2OBUc+TvJU7/Eq+iw0kN3IShAocSOivdpK7f1VxVslfs778tRd8uHYiauNY06uheoTXj4upcTX+ax2PTy3qZbBkOP0fyz86aDqQlwMBQzp7nPnG9CCacrYLXrd/U4ZuIwg3chpfU7UHujCfjYdkxxLd9q3R5D6xp+CQaTS7DS5rRTSy0YtaR6YoD99kITULY5HcBryWVCOMOzqPl1eBvrVgblwrnNFeCrr13AC+yBvqRtoqYiq5X6CvHBuIWfOuRrmVOCSKLGXb+b+KTY69XSh1DgF0OWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzpU+zk+nNG6tmsvtpzS9lUGWj4nf1f91Sgp5vASYMk=;
 b=bXms6jWhA9sHO4OO4nsKrAAfm/HRYzkUXJSt6U9RALk8tTI3WxYkhZ5bzgLACZKYmztzXwB1yXz/64mZXcSoGMSiPmMicxsAnxsLCji9kkxHbyop9zarvkYfbTU4mUSric0Z1Fx1JDdH/DAMrpceoH6pfKEEsIUjzI6xLo/eBnw=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2760.namprd15.prod.outlook.com (2603:10b6:a03:159::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 17:33:01 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 17:33:01 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wCACrH/AIAL89oAgAr+gQA=
Date: Wed, 4 Nov 2020 17:33:01 +0000
Message-ID: <FF528567-512C-4401-BD64-85551288618E@fb.com>
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
In-Reply-To: <69F5B6C0-60A7-4D5D-A841-AB4CE7E9AD2D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.42.20101102
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:640:10c:450e:1c42:cb81:dc03:237e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 089d5578-ca4c-4757-c91c-08d880e7add3
x-ms-traffictypediagnostic: BYAPR15MB2760:
x-microsoft-antispam-prvs: <BYAPR15MB27603A77A02E3096B7A353B3CEEF0@BYAPR15MB2760.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aotgnwF+yRDegrcv3wEJdN+qZGZLcBk7KWzPeTmrUXAFj1kS2X/LVsf7UbIiBBJGd+wPYUqxJlr7UXYcI1FV2F6itLfJv+5gL5IZdi2+N4RVfyTqcSIyRe9cXWgTWwFuKiRHzGUtmdRxZABtB2bklxlcj8HRtkUnc6RjI9QW6COAcP3R/0u7Civ6gp8RU5WVar5ht9TvqV+DFQDC3aAl0lDdfyE8J5ugs/rTzzqdX/4aXgb+z8xi+A/vZ54fJZvR49tjrqoHjwOiNCvACxWHJUe2dP583Xo0cOJbyyozZR7CQVnYK+FyaooK/ZhBHojdimtfG512aDdF8iug3yCkrpqFeEOnXVZt8xTVzQgtcl32Y++gCMXXvm+C/dOFk4syvHQnBi5ZKeyB15LmMe1GUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(396003)(366004)(376002)(66946007)(66616009)(4744005)(76116006)(6506007)(33656002)(6486002)(83380400001)(3480700007)(5660300002)(66476007)(71200400001)(186003)(66446008)(64756008)(66556008)(99936003)(86362001)(316002)(2616005)(7116003)(2906002)(966005)(478600001)(6916009)(8676002)(8936002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IS/6yJB89U0cvI+9NqXdaGVTlpIUiO8zd+vMUlxXgGa4Lme1J/iuON4pImGAjAjc7lF+0UPQHE+/kKPW/RfTOuwrFOVKGjm2zABMVjBq1Pub7PDs4oHm7SLxcK8mVKm70TJLBdpA8ImrY2i/97Yn4Jw63Jg/VGxq8kfsmJXEK4jcWnPeOCLuNPo73jm6/fsmTooShyt7oxixBKujyRsIHyFNKwqX1h3U7U/oPAsz10sFxZlm/Bl1gBVUofjS+fgtpvEHdb5H+3kqQR77zqRBb/Jqg7XuYWW6IqzGrYdLzKOYtofIv0llUKicpB90MRT/mLXhwekIXl7B3K6gVvFdrIvek/paaFC5/Ubg8gN4RYXlXlyM1+1MNRKX33bB8mVzalRzBp8AHTncSi94f43DnY+Hxrwy1P9o5LgTs6ZhtcR7u3idCUx3GNb2kWadzavhka071iZnbQUfMbcGiJ7BB+WAj9LK+eP17CIQO/ubUdTijBdQtKnsfO3E64V1gt9g39AXSsYByYqARX2N0JO9MVvDuVxbZIcZKcGe/Uju4hnmv2ZIkniy99F0Ca2+Qerg60qgB9miY46e575WrOgo3Wdm02vi2wOn9yF13ing+C07hCMLWXzJy9a1uxIkvnNjb7VJNeJ5Q4wFnRJ+wIghETgono77ekRL5uOFwvhdMRCWCq4pemDO9kQrggALmiwd41HAI1pCbmyLXABH9duxTA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_FF528567512C4401BD6485551288618Efbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089d5578-ca4c-4757-c91c-08d880e7add3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 17:33:01.3924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+T8ix4TBWw+Cp+nFyssfh75WeWjhlljY14RHxxvYjoy5rZ+YTZspYJAaIEbuHre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2760
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_12:2020-11-04,
 2020-11-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011040128
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

--_004_FF528567512C4401BD6485551288618Efbcom_
Content-Type: multipart/alternative;
	boundary="_000_FF528567512C4401BD6485551288618Efbcom_"

--_000_FF528567512C4401BD6485551288618Efbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UXVpY2sgcmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIGFib3V0
IERNVEbigJlzIOKAnFNlY3VyaXR5IFByb3RvY29sIGFuZCBEYXRhIE1vZGVs4oCdIGFrYSDigJxT
UERN4oCdIGJ5ICBWaWtyYW0gQm9kaXJlZGR5IG9uIFRodXJzZGF5QDEwQU0gKFBTVCkuIEZvbGxv
d2luZyBhcmUgdGhlIHNlc3Npb24gZGV0YWlscyBhbmQgYWxzbyBhdHRhY2hlZCBtZWV0aW5nIGlu
dml0ZS4NCg0KVG9waWM6IFNQRE0NClRpbWU6IE5vdiA1LCAyMDIwIDEwOjAwIEFNIFBhY2lmaWMg
VGltZSAoVVMgYW5kIENhbmFkYSkNCg0KSm9pbiBab29tIE1lZXRpbmcNCmh0dHBzOi8vdXMwMndl
Yi56b29tLnVzL2ovOTM5Njg4MDQ3Nj9wd2Q9YTJneVlrVnBSamhCWkV0aFFVUXpjRUYyUWpSWFVU
MDkNCg0KTWVldGluZyBJRDogOTM5IDY4OCAwNDc2DQpQYXNzY29kZTogb3BlbmJtYw0KT25lIHRh
cCBtb2JpbGUNCisxNjY5OTAwOTEyOCwsOTM5Njg4MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMg
KFNhbiBKb3NlKQ0KKzEyNTMyMTU4NzgyLCw5Mzk2ODgwNDc2IywsLCwsLDAjLCw4NTkyNTE1IyBV
UyAoVGFjb21hKQ0KDQpEaWFsIGJ5IHlvdXIgbG9jYXRpb24NCiAgICAgICAgKzEgNjY5IDkwMCA5
MTI4IFVTIChTYW4gSm9zZSkNCiAgICAgICAgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpDQog
ICAgICAgICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbikNCiAgICAgICAgKzEgMzAxIDcxNSA4
NTkyIFVTIChHZXJtYW50b3duKQ0KICAgICAgICArMSAzMTIgNjI2IDY3OTkgVVMgKENoaWNhZ28p
DQogICAgICAgICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspDQpNZWV0aW5nIElEOiA5Mzkg
Njg4IDA0NzYNClBhc3Njb2RlOiA4NTkyNTE1DQpGaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBodHRw
czovL3VzMDJ3ZWIuem9vbS51cy91L2tkZGZTcEFrRWoNCg==

--_000_FF528567512C4401BD6485551288618Efbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8293FD94FB63DC44BF790B8D065BA8BF@namprd15.prod.outlook.com>
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
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVs
dA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4w
aW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEi
IHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlF1aWNrIHJlbWluZGVyIGFi
b3V0IHRoaXMgd2Vla+KAmXMgbGVhcm5pbmcgc2Vzc2lvbiBhYm91dCBETVRG4oCZcyDigJxTZWN1
cml0eSBQcm90b2NvbCBhbmQgRGF0YSBNb2RlbOKAnSBha2Eg4oCcPGI+U1BETTwvYj7igJ0gYnkg
Jm5ic3A7VmlrcmFtIEJvZGlyZWRkeSBvbiBUaHVyc2RheUAxMEFNICg8Yj5QU1Q8L2I+KS4gRm9s
bG93aW5nIGFyZSB0aGUgc2Vzc2lvbiBkZXRhaWxzIGFuZCBhbHNvIGF0dGFjaGVkIG1lZXRpbmcg
aW52aXRlLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Ub3BpYzogU1BETTxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGltZTogTm92IDUsIDIwMjAgMTA6MDAgQU0gUGFjaWZp
YyBUaW1lIChVUyBhbmQgQ2FuYWRhKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Kb2luIFpvb20g
TWVldGluZzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+aHR0cHM6Ly91czAy
d2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJaRXRoUVVRemNFRjJRalJY
VVQwOTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzY8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBhc3Njb2RlOiBvcGVuYm1jPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbmUgdGFwIG1vYmlsZTxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+KzE2Njk5MDA5MTI4LCw5Mzk2ODgwNDc2IywsLCws
LDAjLCw4NTkyNTE1IyBVUyAoU2FuIEpvc2UpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj4rMTI1MzIxNTg3ODIsLDkzOTY4ODA0NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChU
YWNvbWEpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkRpYWwgYnkgeW91ciBsb2NhdGlvbjxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDY2OSA5MDAgOTEyOCBVUyAoU2FuIEpvc2UpPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgKzEgMzQ2IDI0OCA3Nzk5IFVTIChIb3VzdG9uKTxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7ICsxIDMwMSA3MTUgODU5MiBVUyAoR2VybWFudG93bik8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyArMSAzMTIgNjI2IDY3OTkgVVMgKENoaWNhZ28pPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEg
NjQ2IDU1OCA4NjU2IFVTIChOZXcgWW9yayk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+UGFzc2NvZGU6IDg1OTI1MTU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPkZpbmQgeW91ciBsb2NhbCBudW1iZXI6IGh0dHBzOi8vdXMwMndlYi56b29tLnVz
L3Uva2RkZlNwQWtFajxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_FF528567512C4401BD6485551288618Efbcom_--

--_004_FF528567512C4401BD6485551288618Efbcom_
Content-Type: text/calendar; name="meeting-SPDM.ics"
Content-Description: meeting-SPDM.ics
Content-Disposition: attachment; filename="meeting-SPDM.ics"; size=1765;
	creation-date="Wed, 04 Nov 2020 17:33:01 GMT";
	modification-date="Wed, 04 Nov 2020 17:33:01 GMT"
Content-ID: <AB23EB1CB7DB9E4A841FB5746E94D084@namprd15.prod.outlook.com>
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
VkVWRU5UDQpEVFNUQU1QOjIwMjAxMTA0VDE3Mjk0NloNCkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xv
c19BbmdlbGVzOjIwMjAxMTA1VDEwMDAwMA0KRFRFTkQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVz
OjIwMjAxMTA1VDExMDAwMA0KU1VNTUFSWTpTUERNDQpVSUQ6MjAyMDExMDRUMTcyOTQ2Wi05Mzk2
ODgwNDc2QGZlODA6MDowOjA6NDAxOmYzZmY6ZmU1ODoxMzQzZW5zMw0KVFpJRDpBbWVyaWNhL0xv
c19BbmdlbGVzDQpERVNDUklQVElPTjpTYWkgRGFzYXJpIGlzIGludml0aW5nIHlvdSB0byBhIHNj
aGVkdWxlZCBab29tIG1lZXRpbmcuXG5cbkpvDQogaW4gWm9vbSBNZWV0aW5nXG5odHRwczovL3Vz
MDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpFDQogdGhRVVF6Y0VG
MlFqUlhVVDA5XG5cbk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NlxuUGFzc2NvZGU6IG9wZW5ibWNc
bk9uZSB0DQogYXAgbW9iaWxlXG4rMTY2OTkwMDkxMjhcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFws
XCwwI1wsXCw4NTkyNTE1IyBVUyAoU2FuDQogIEpvc2UpXG4rMTI1MzIxNTg3ODJcLFwsOTM5Njg4
MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAoVGFjb21hDQogKVxuXG5EaWFsIGJ5
IHlvdXIgbG9jYXRpb25cbiAgICAgICAgKzEgNjY5IDkwMCA5MTI4IFVTIChTYW4gSm9zZSlcbiAg
ICAgDQogICAgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpXG4gICAgICAgICsxIDM0NiAyNDgg
Nzc5OSBVUyAoSG91c3RvbilcbiAgDQogICAgICAgKzEgMzAxIDcxNSA4NTkyIFVTIChHZXJtYW50
b3duKVxuICAgICAgICArMSAzMTIgNjI2IDY3OTkgVVMgKENoaWNhDQogZ28pXG4gICAgICAgICsx
IDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspXG5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzZcblBh
DQogc3Njb2RlOiA4NTkyNTE1XG5GaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBodHRwczovL3VzMDJ3
ZWIuem9vbS51cy91L2tkZGZTDQogcEFrRWpcblxuDQpMT0NBVElPTjpodHRwczovL3VzMDJ3ZWIu
em9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGDQogMlFqUlhV
VDA5DQpCRUdJTjpWQUxBUk0NClRSSUdHRVI6LVBUMTBNDQpBQ1RJT046RElTUExBWQ0KREVTQ1JJ
UFRJT046UmVtaW5kZXINCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_004_FF528567512C4401BD6485551288618Efbcom_--
