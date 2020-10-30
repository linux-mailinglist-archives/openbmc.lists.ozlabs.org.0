Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8129F994
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 01:19:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMjcJ45g5zDqdd
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 11:19:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8572db1ff5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=TfxTKgAM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=VP0tYR1t; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMjb34KkxzDqdc
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 11:18:33 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U0EoZl002073
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 17:18:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=N5pW/3xe78OUUbFxKgTg25OB1AyPVax1rx/KBgf/5ek=;
 b=TfxTKgAM6FmnmFdVSu0zI/iMuSaBmXx3w4Q2Uici7higidIGZGya2P4CBrwyNzuc87cX
 4VoraKML0AwiFdrnJUjUaSMsGY+5mam5nuaKsdgW3U5LkXtc1NViW7uTC54wlTQ6kqBA
 94SSFI1SISkZzfHkgNAHb+u9mta+S/Zs6hA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34esepxgs3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 17:18:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 17:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnAB4JnmkHj+LdbJ8Q+uZTm+zD5v3eEPtu9F5O2+cG4Iq6/vHp2hQRZPb70qyFDVsHTUQGkg4/vVVO7OvuIWP/C6uJ8x+D7Hlc24IdKmFgCOTTMy1N6olocvadc8SCslQvVmeELKZub9UDFVU/zpPGp7zigRP0l+cDENII4SkPbPydKOu1aUgv8tzooKAmLukYJpfoZblY7Nk0PV5PC4T8qmPKV9HcPl40EqhKiTAmndfoQY71IczxW25CNKABbzEkLgS3w/ItRp2wxwIM8hLgGuT9HAtQgaQwBmor109e41LkC8KUrpTTBS8xSPXlrQ4ESz1P5vCrjNsWBc8NwEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5pW/3xe78OUUbFxKgTg25OB1AyPVax1rx/KBgf/5ek=;
 b=hFEt/4u7M5erRIGC4C5+fHAqnCQbmySTYfmHKoE7qKJN2qBbSxZyB94t1VSYNA42j1n8z3oYjJUqBO85wh5d75TbC3x4deekZf1Ce5lDzz/Azk+Sck/wpA98D8K64xz2Tze0xwRzOiVAVI3XqexEDXhuz5g7W9TiPIrHQCsXfSVdD8zHLkIG+nI5XaQvTKTL86AfQmkpwUcz2WI3+YT7pnl7Cvv9yRGj/j6fwDzNGdVnIDYBN3io6lzxdDuhN04xkqSGukf9XqGzKqmDZoJMQCBYmDA3R8xoRtKA20sCbkpHyoKMAlgJVPegJJfmohk6hQ7fS7pxfzYFCIjmWEAL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5pW/3xe78OUUbFxKgTg25OB1AyPVax1rx/KBgf/5ek=;
 b=VP0tYR1tafKn8JQdfaH027VcEOttsfHSuIi0H8mKZwqkyyJVwrTxVqorq+DM6+2Ex6wKE/KehXJMkSNUWPIyQEn3wC2KKhbjUNbUOZTcfxgpmaKYtyE+dOuKsgiXjc63qbClU8yuwsk6TGJZGE4uNg5BwKJRJ4eLP2chyiDMld8=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by SJ0PR15MB4170.namprd15.prod.outlook.com (2603:10b6:a03:2c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 00:18:28 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Fri, 30 Oct 2020
 00:18:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Re: bmcweb upgrade blocking
Thread-Topic: bmcweb upgrade blocking
Thread-Index: AQHWri0gxDTH5bErekWSqjF7v/avnKmu0q2A
Date: Fri, 30 Oct 2020 00:18:27 +0000
Message-ID: <BC8657CB-6E3B-4F1F-8301-367C6EDFC658@fb.com>
References: <282BE4C0-9C7F-4CC9-850D-729C95B137A3@fb.com>
In-Reply-To: <282BE4C0-9C7F-4CC9-850D-729C95B137A3@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:92f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d1749e5-8dbd-46ca-7ac4-08d87c695310
x-ms-traffictypediagnostic: SJ0PR15MB4170:
x-microsoft-antispam-prvs: <SJ0PR15MB4170D5275BA517A38CF33B61DD150@SJ0PR15MB4170.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fVtYTLrMCQc608QpiE3W3SSWOWqDwoZ8/ya8GwRYsssaQa49T/U34/57lRcOx9/az9aWhmK7K7Ho278cbEbIOd/TB8SsyHFfcTpz8CUROfdOGpRX0Yx7jEaQ52a4+TgYJFOu8uWWVy0EiKYM8GjJ32YhzfN1O1sjS7n4qhz9HDQuq8kxHDTxP/Do6qfzBM5huOgqeQykXk4H/T0LQxba6KmPrsBjuqO+fHJX8IBQGycAsBe2BPa1zCmf92IVxf9UU6DY59MFivyEJqAecflE+hfwg1vEJ94sTcY/mopLoi6G2d+ddShSjBR4SujPrRak9FpvlUjN6ot4i3HKpz2GZiTc6MeovgvcdQpk59RgIOkD0E1ZgEul0h+TCjwLLi0ImGcHZ72L+mo4qKWcIfrTVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(376002)(136003)(346002)(53546011)(66446008)(33656002)(76116006)(64756008)(66556008)(66476007)(6486002)(66946007)(71200400001)(966005)(3480700007)(83380400001)(166002)(5660300002)(186003)(6506007)(2616005)(4744005)(36756003)(2906002)(6916009)(8676002)(316002)(86362001)(7116003)(8936002)(6512007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bTqCfZOFTVHL+XP8YPqJ2EZR0c/NkceyTdSu0XRFYiN1JzjNYnWcdFZ6pwEMpGWWgrRaEfxsffudQ/MtOkis6S1hh5bPkOCYnnrMOpA7oEAXR4I2G3jJEU0OQKkceqJu0x2ByOIndCxVEJySiqlrBUm0dKJ176CvkBRXRu++iGIus4UJlbrJQDZBt0AOxFP3MXYXk9ymqCLkjkKtZIE8+toRTgmzZrwdwFwPdWPRyfUJJ1PW6IHBse2DRaxPh/Sws4gBL1EGkqbBg31dAED2N03pwGmerOAEKBQGA4aKMFvB6gmO+fD2M2cpCttv/xKPXtgRFpcw7dabNHNjTyamDZhALjLYzm/MbfFaLq6hLC56e3Fdc2AvTa2Wsk/WQff/VNZ/qlGkgMT1Fb1M6ArbEeEbvcNKn8WR9vJmzTeM8GInltzMvwkpaHcAgugAdpQCvDyFRXIUd3/661WMTDf2ndf8UqftlQ0zVABPREzUW/j0g7Dy4pSIl3HVOCn+Fki0Z0Cv9pLwoRp4hJI90GZHv+PHMvXX4BYXqF67eZLPy4HdeFQSiAbC4sxb1ZbT8ZcH012Ih87sf/upQ5y+tMfXzhKRZ3QvDQuNr21jc7WKOipWa6o4zIjUdSs9FX3kjmQL28pFsAaD+4/5KqYFvaWnZrm31NsMr+m9ney2++A+FSHD86H8vRnu4D/dvGY+K37b
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BC8657CB6E3B4F1F8301367C6EDFC658fbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1749e5-8dbd-46ca-7ac4-08d87c695310
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 00:18:27.8685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IV2vRncPcZCkPg7RaLH0agtOcDFirqJo03u0B3F0qxZc+c48xZgfF+HXxTw2wUG6pg6HYoUGYFTMLKE1knxiSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4170
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300000
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

--_000_BC8657CB6E3B4F1F8301367C6EDFC658fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxyaWdodCwgYWZ0ZXIgdmVyaWZ5aW5nIGFsbW9zdCA0MCBjb21taXRzLCBJIGZvdW5kIHRoYXQg
d2hpY2ggb25lIGlzIGJyZWFraW5nIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9j
b21taXQvYjVhNzY5MzJlYWI3ZDQwNDg3ZmZiMzA1Y2Q3NDVlYzE1NTgxM2M0ZQ0KVGhpcyBjb21t
aXQgaW50cm9kdWNlIGJsb2NrZWQgb24gcmVzcG9uc2UgZm9yIHVwZGF0ZSBzZXJ2aWNlLg0KDQpF
ZCwgQ2FuIHlvdSBwbGVhc2UgbG9vayBpbnRvIHRoaXMuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpG
cm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4N
CkRhdGU6IFRodXJzZGF5LCBPY3RvYmVyIDI5LCAyMDIwIGF0IDEyOjU0IFBNDQpUbzogIk9wZW5C
TUMgKG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZykiIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+
DQpTdWJqZWN0OiBibWN3ZWIgdXBncmFkZSBibG9ja2luZw0KDQpUZWFtLA0KSSBhbSBub3Qgc3Vy
ZSBpZiBpdCBpcyBhIGtub3duIGlzc3VlIGJ1dCBJIGFtIHNlZWluZyBibWN3ZWIgdXBncmFkZSBp
cyBibG9ja2luZyBmb3IgZmV3IG1pbnV0ZXMgYW5kIHJldHVybmluZyBlbXB0eSByZXNwb25zZS4g
SSBzZWUgaW1hZ2UgaXMgZ2V0dGluZyBjb3BpZWQgYW5kIGdldHMgYWN0aXZhdGVkIGJ1dCBodHRw
IHJlc3BvbnNlIGlzIG5vdCBjb21pbmcgYmFjay4NCg0KDQpjdXJsIC1rIC1IICJYLUF1dGgtVG9r
ZW46ICR0b2tlbiIgLUggIkNvbnRlbnQtVHlwZTogYXBwbGljYXRpb24vb2N0ZXQtc3RyZWFtIiAt
WCBQT1NUIC1UIHRncC1vY3QxMy5tdGQudGFyIGh0dHBzOi8vJHtibWN9L3JlZGZpc2gvdjEvVXBk
YXRlU2VydmljZQ0KDQpjdXJsOiAoNTIpIEVtcHR5IHJlcGx5IGZyb20gc2VydmVyDQoNClJlZ2Fy
ZHMNCi1WaWpheQ0K

--_000_BC8657CB6E3B4F1F8301367C6EDFC658fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F7C0067DBBE3BC40979B9CAC8C2C0B45@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5wMSwgbGkucDEs
IGRpdi5wMQ0KCXttc28tc3R5bGUtbmFtZTpwMTsNCgltYXJnaW46MGluOw0KCWZvbnQtc2l6ZTo4
LjVwdDsNCglmb250LWZhbWlseTpNZW5sbzsNCgljb2xvcjpibGFjazt9DQpzcGFuLnMxDQoJe21z
by1zdHlsZS1uYW1lOnMxO30NCnNwYW4uRW1haWxTdHlsZTIxDQoJe21zby1zdHlsZS10eXBlOnBl
cnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9y
OndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9u
bHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVp
biAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2Vj
dGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5
IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiIgc3R5bGU9IndvcmQt
d3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+QWxyaWdodCwgYWZ0ZXIg
dmVyaWZ5aW5nIGFsbW9zdCA0MCBjb21taXRzLCBJIGZvdW5kIHRoYXQgd2hpY2ggb25lIGlzIGJy
ZWFraW5nDQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3ZWIvY29tbWl0
L2I1YTc2OTMyZWFiN2Q0MDQ4N2ZmYjMwNWNkNzQ1ZWMxNTU4MTNjNGUiPg0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvYm1jd2ViL2NvbW1pdC9iNWE3NjkzMmVhYjdkNDA0ODdmZmIzMDVjZDc0
NWVjMTU1ODEzYzRlPC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGlzIGNvbW1pdCBpbnRyb2R1Y2Ug
YmxvY2tlZCBvbiByZXNwb25zZSBmb3IgdXBkYXRlIHNlcnZpY2UuPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5FZCwgQ2FuIHlvdSBwbGVhc2UgbG9vayBpbnRvIHRo
aXMuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNC
NUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4g
c3R5bGU9ImNvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVt
a2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiBWaWpheSBLaGVta2Eg
Jmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+VGh1cnNkYXksIE9j
dG9iZXIgMjksIDIwMjAgYXQgMTI6NTQgUE08YnI+DQo8Yj5UbzogPC9iPiZxdW90O09wZW5CTUMg
KG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZykmcXVvdDsgJmx0O29wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+Ym1jd2ViIHVwZ3JhZGUgYmxvY2tpbmc8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+VGVhbSw8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBhbSBub3Qgc3VyZSBpZiBpdCBpcyBhIGtu
b3duIGlzc3VlIGJ1dCBJIGFtIHNlZWluZyBibWN3ZWIgdXBncmFkZSBpcyBibG9ja2luZyBmb3Ig
ZmV3IG1pbnV0ZXMgYW5kIHJldHVybmluZyBlbXB0eSByZXNwb25zZS4gSSBzZWUgaW1hZ2UgaXMg
Z2V0dGluZyBjb3BpZWQgYW5kIGdldHMgYWN0aXZhdGVkIGJ1dCBodHRwIHJlc3BvbnNlIGlzIG5v
dCBjb21pbmcNCiBiYWNrLjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4mbmJzcDs8L3NwYW4+PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJzMSI+Y3VybCAtayAtSCAmcXVvdDtY
LUF1dGgtVG9rZW46ICR0b2tlbiZxdW90OyAtSCAmcXVvdDtDb250ZW50LVR5cGU6IGFwcGxpY2F0
aW9uL29jdGV0LXN0cmVhbSZxdW90OyAtWCBQT1NUIC1UIHRncC1vY3QxMy5tdGQudGFyIGh0dHBz
Oi8vJHtibWN9L3JlZGZpc2gvdjEvVXBkYXRlU2VydmljZTwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9InMxIj5jdXJsOiAoNTIpIEVtcHR5IHJlcGx5IGZy
b20gc2VydmVyPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzwvc3Bhbj48L2I+PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+UmVnYXJkczwvc3Bhbj48L2I+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PC9zcGFuPjwvYj48
bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_BC8657CB6E3B4F1F8301367C6EDFC658fbcom_--
