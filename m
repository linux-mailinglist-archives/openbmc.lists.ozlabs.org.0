Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D820DD0F
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 23:09:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wg8f23b1zDqQJ
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 07:09:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4449e0f4bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Kg96+BHV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=XBz/yfCn; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wf8P2bCvzDqRg
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 06:23:45 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TKNe2Z002831
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 13:23:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=2E9B9a7qMIOKrpqNVp4Dt2t2Q+3TMnHt5RXemfMJui0=;
 b=Kg96+BHVDbG4m47XgR3Ed1/H/2hpPQ1OYFjVLCjkFZ/Stdw0WbXJS67MndlILqkSUI/f
 +iZHR4YBMkuvFXdn5eyd4WDwpUcjhI3HJXrmLC9TPviPK+VafWG2tVaaNSIsdny8Ml45
 gizwiCBGSZQzzc5UWieR6K6seJYrb851DZQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 31xp3rec8k-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 13:23:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 29 Jun 2020 13:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdXsUQHMr53qYs1cJYKldLBD2+BRrfbvFMPauEuMtnrtnTChUKI33xiN+2xSrAWasR29iqtBVfM6nSIiGeuUBLDMEdLwXnKrNAL0Wf7Xof59nhOsqs8RLaccFO+/PvXjiK34EI7MqK2+XtxvuXsCCcZYh5cYAUHubesSL5vKjjKrqmkvZT2oB3VAahrSRNt9qnVjUHraMSUthy4r1yyglVv/HnS55IGXc1Rq+Af3+d6nHp1xq/6Aiy5lGwAyCH0112WgaatdTRfC1wXBaavpaz8uzufFUPaFWKqNbL/speOIDnP6nTEG0F3sV0J81Tr1uICJlNSHG0zJ3ZQPyJx8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E9B9a7qMIOKrpqNVp4Dt2t2Q+3TMnHt5RXemfMJui0=;
 b=fDMm/0mh2MMmZyRIzcp1Qm/0ohYIiFbe2tbBPIt8XNcpzNunDlBNRO06bSqj4wWMqcsmallJaVEmnP3UqYlpliKnpip2NCf94fK1JorC0py5q513RfNZfagDE09A55Q9o2YM4YSbwBdnQzBYRaf0LUr5UfYYh6IhhpvofprkjMPeZPoFX/9oG48tgEsVdpSRHXx2noERUjTg1NCnE4krG/QlIz1xnEEpwsYbZRP7M1yvDAXxpMXha8DXSTYrNLiHtLhRs9ox9nB1NGrfHNO0HxWOGWn1tAkgCxWgiqDKQ3C71CGLDgYJnOiSN6GjMEs2f3FcQkmWfJUzCnGmNEa9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E9B9a7qMIOKrpqNVp4Dt2t2Q+3TMnHt5RXemfMJui0=;
 b=XBz/yfCnSGXXYA/PIKud719DltC6V0u11qn02Kz2to8fNeI6ZQedxiwK7KzqeCKcW2rRIGXojTpLKtvuwZgzVcKgbACcrhqVOE3dLcRLgziasINFqxOuYNK3r6lSmgPhz6M1FUcY4n/TZB6ZcGUH87baZ2uuCBNOqEezUQqWOlY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2645.namprd15.prod.outlook.com (2603:10b6:a03:156::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 20:23:26 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 20:23:26 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Phosphor virtual sensor
Thread-Topic: Phosphor virtual sensor
Thread-Index: AQHWTlMkknRRiUDgBU+3FsJUUtOwWQ==
Date: Mon, 29 Jun 2020 20:23:25 +0000
Message-ID: <DF74EA96-65CA-430F-9525-56DF39237550@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3e91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68c64ead-465c-4ce5-5bb9-08d81c6a476c
x-ms-traffictypediagnostic: BYAPR15MB2645:
x-microsoft-antispam-prvs: <BYAPR15MB2645663CDAED64F8F75B7D87DD6E0@BYAPR15MB2645.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YOkPWPGwmKppSECTQ3lmqcc9NJ1/32Xocy1BzQPuOj2IoojftJ0o3P3HYlLeXu0Y/4CJHFVnuyRqR329xDwwGXN9f2OtPPKcxVce7GLtHldGPjFgZhb007kQcXmDkkSnwZNO8MKSh23RrB24AFk3WDWVeNwL7T1U5A2PO9im47+4dcJg6T2aFtwUaj8LLoj7SEN0wp5Y7PzRn/YHLTxct2KgE13VaocJrzHYUCC8raFG4mcJstxUP6913n1WhtjURxWLYsmLbxISiBdjEpSDjYYuQDzasUxpR3D2bJjvfiyv/2q3Jpg0TkSqAl4RZrh8/UwEJ5J5gP1R+1snltJ3oKck/IAkcqJ3OEWjrVVFYCk4acfE6cR5UzvUmhdGjew30mJGcnYg0gGMoQ5yigF6zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(136003)(39860400002)(346002)(376002)(2906002)(9326002)(316002)(36756003)(7116003)(71200400001)(558084003)(86362001)(5660300002)(66946007)(66446008)(64756008)(66556008)(66476007)(8936002)(8676002)(478600001)(6916009)(6486002)(6512007)(6506007)(33656002)(76116006)(166002)(3480700007)(966005)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ulyJpCOAFIB6deBlMws1ZE37ojaFVFJM8XqLbhslEUmoT7CCmDwh1l+nFiv/k+nLrBb1RbaLfoHsoCDR3tlwzJ01tvBjsU65RW1+dMumWH0g8ts5LP6DNJc+lF3+7TDA7ciId4g5lGP10VmPwgH94tmBKrHPVND9OFExCqR6viXnaxhh9AxSV/KjHkk6BT3inub6o8MJiFlPwI+q3devDdaxj5XlMePd4LKzEuls4EEs6MlW83uXa5v9YH4OCAizGoDw3Dl567bK8JRRJEiqW3WLNHxcv5fBbSz55ui9tjAQdSfLbplhzTiU6GuwdwOQYphfFaRu/p1PFHKGCP4raSxRl4GyWhKoxkqixvVtMqOOfpNT8Q+dBAKKs9Db8VD3Ml/CHve7/I1BGn86ORSUMVq1HcJ63kGuLGWZq02/T8fzQ9PR+NYjG4trqBB2B51SnE6g4slsgiUIV6XlM4VIPRr0ioreqQI6SDBL3w0+Qxoq7fnqP7uVSUXQcccoCUbLsHqKgGctIwPVDRURzn0tQg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF74EA9665CA430F952556DF39237550fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c64ead-465c-4ce5-5bb9-08d81c6a476c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 20:23:26.1750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BamX0UJhtOkVMbHncTH9+r2kHZGGvT3+EUg96sGYBGXP0KSR6gYV+3WJFVeWU7A2ZVOIlXgct1XDMZwJlVLd1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2645
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=510
 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 cotscore=-2147483648 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290129
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

--_000_DF74EA9665CA430F952556DF39237550fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCkNhbiB5b3UgcGxlYXNlIGNyZWF0ZSByZXBvIGZvciBQaG9zcGhvci12aXJ0dWFs
LXNlbnNvci4gRm9sbG93aW5nIGlzIHRoZSBkZXNpZ24gZG9jdW1lbnQgdW5kZXIgcmV2aWV3Lg0K
aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9kb2NzLysvMzIz
NDUvDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_DF74EA9665CA430F952556DF39237550fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <975E1B8290C5914A994CDAEAC467CC1C@namprd15.prod.outlook.com>
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
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXpl
OjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3Jk
U2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGlu
IDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9z
dHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0i
Izk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEJyYWQsPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPkNhbiB5b3UgcGxlYXNlIGNyZWF0ZSByZXBvIGZvciBQaG9zcGhvci12aXJ0dWFsLXNlbnNv
ci4gRm9sbG93aW5nIGlzIHRoZSBkZXNpZ24gZG9jdW1lbnQgdW5kZXIgcmV2aWV3LjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxhIGhyZWY9Imh0dHBzOi8vZ2Vy
cml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMvZG9jcy8mIzQzOy8zMjM0NS8iPmh0
dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMvZG9jcy8mIzQzOy8z
MjM0NS88L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Jv
ZHk+DQo8L2h0bWw+DQo=

--_000_DF74EA9665CA430F952556DF39237550fbcom_--
