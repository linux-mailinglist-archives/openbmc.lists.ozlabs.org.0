Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8A29E2D5
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:40:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM8nK4KfCzDqWq
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 13:40:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=85713010a6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=pW8e62Up; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=ASMbQUWO; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM8mH2BVtzDqRm
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 13:39:40 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T2YcH5015283; Wed, 28 Oct 2020 19:39:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=KGVn4xdB4oRbNa+2qUoNAUL/fiGe2raXHcqbTDwCBhE=;
 b=pW8e62Up3tOGQR5f0a7NlokbCeSNvuxtvZg2dtojdlRU9xq6jhwmXdkeRgPHqsHKRXBH
 5HQggLb5B6bCB1FtTh9ZNozl4ha+tlKK9DX+LgZoW9VL/qNN84nL9VTjSb3vyBT69lIo
 nJE9E+g/IyAMEhlJSDrb1+ZnTdftqrBIRvs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34eseprfdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Oct 2020 19:39:36 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 19:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfWUMJnfYuq0N28fcjxIz+iNULrUDB8raYcVNBapUC5xe0FX87lwPAecwdp6HhxuIP9p50KhnqLOFE8m0q54gWVtmRxEuM0DQIc4tlCqofnsYVkCCUdvoIoUH2N3bPaCv7n2KFOKp9oGhpHZYsoPa8yY1mWwlfSPPiydEGOsEQAzr3q4lRmGHUzDoJSn+ZWPIAosbUWxMf/cBqKPoH/7oR+FRZDJw5g8aoTxpMyLRIkWo02Zhwmp18KPXY4EPX6pwR5qHR0zw3YVQulrvTvKjjaew6J0zBeKi7ehYkcgF73dOMKfTAltRUh//mXD6KSC4QQiQuU+mpYK+mtsAsyb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGVn4xdB4oRbNa+2qUoNAUL/fiGe2raXHcqbTDwCBhE=;
 b=fbX7a9wM39uroQv1bGEf678o5d1jhi2CIvfwW1PNZQU4S4JkbcMSzLxzR0Zv6ZmO7DU+bRs3v1ePNN1n0vUrhLDsadAJaXibEd3Ed02pO5Bf/owZFxiD7J37vEtF4a0NQMjHyL9e8XhYC4HWMl8JQje8JfCP8GS2CZfbrr0meUjpgOB3EJ3G6yqHfOYsg7vLJsIkvj6/+SJ1LyqF9FK+9RMyJusbdEop2x/JWixb/nl4PFMxPEX+Z6wx0bH+wKjgrF9LVbXGoZ7Flcu4/38FZXJt7bUNkvA38SuiavEllGNpbvON85ty3YsBf5Qlm6yOzoPLIQw4exCMY1myyns9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGVn4xdB4oRbNa+2qUoNAUL/fiGe2raXHcqbTDwCBhE=;
 b=ASMbQUWOPhlsolEE+HE9jgfTBGvo/hRhyaqrFaNC5D26Y6J4KW6Ggaa35M8IuaKTv4Zsf9gdx/7sb1B63S3UXyB3yu7Dzz0ScF5zc1p5sYlAeud8FT02+7EiysKP4CNHcoxRZ+1Clk0vMOEugTgsarl4UZ/DaBp2LEYuEVoamWU=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2616.namprd15.prod.outlook.com (2603:10b6:a03:14d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Thu, 29 Oct
 2020 02:39:34 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Thu, 29 Oct 2020
 02:39:34 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: New fru bus interfaces
Thread-Topic: New fru bus interfaces
Thread-Index: AQHWrXLPkL8m5PCTZE2olcApxYVT16mtl8WA//+vsACAACHEgA==
Date: Thu, 29 Oct 2020 02:39:34 +0000
Message-ID: <147F30AB-4CCD-41C9-8EB4-16CF0D02671D@fb.com>
References: <4D8141F3-33DC-48F5-99BA-9099044E6A60@fb.com>
 <CACWQX825kGcNJ9PfsuDZk1Bghdv9SRuZiu7FF2Fz+yiDqp_9xw@mail.gmail.com>
 <5D347AC9-E410-4F94-BC56-4F69C6DB2DCF@fb.com>
In-Reply-To: <5D347AC9-E410-4F94-BC56-4F69C6DB2DCF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::4:43d4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 079c6fd4-fbdd-4148-754d-08d87bb3deef
x-ms-traffictypediagnostic: BYAPR15MB2616:
x-microsoft-antispam-prvs: <BYAPR15MB2616F0100CC917910C3E2387DD140@BYAPR15MB2616.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M+Jwc2s+Bl0oUfF7iO/D+059Uy1MOSNBNNgBctFS31J08+o3cJ3673xVt/d00+CvJpJ+ugMI/9Ndu1UzlTWUeqfNdNUq7nYv+ZGXIhhWC1zDpjtFxUIFWTZPIB57KZCsvOxMsE1cAJ9OfI5nMl1e4jFC4W4Kv/j8pqzQ0NTKFEL29GLHkPNCCvw9TPY2u+YwWEVmu7OPY1Lz3OhNl3WOywVeY+R0VKC6ka9dJDaMXRuwX1ansCnkbG0KhfocZPNuhmjzeCQXVBCYvJPSuEvt+Hz0o+yXIOXno5W74UqrJ+QT7M/wh8+Ab1Aq8OMXd6agjEmtCQ2q3YOFoWJuYU6rXK7RxLmKyElIsbK2Z1TLh1v8PWCrQfs0dauXF3Fojqk5GtBSoP1BZSq3v1rq34lCng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39860400002)(136003)(66556008)(6486002)(186003)(8936002)(8676002)(4326008)(6512007)(478600001)(966005)(5660300002)(36756003)(2616005)(64756008)(66446008)(66946007)(76116006)(66476007)(71200400001)(4744005)(3480700007)(316002)(86362001)(33656002)(6506007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WIBjui7rw4ZwGjD39bKfbXbrJAHejcXPAxvYwZx1VbTWQDBJicv8Mmoc6EcYZPjVig0P0bZHVAFvmpQVhD1BFh+vumdxQnt8jYl52KzxsitCu4JrXToFKTHSmyfVg3tX6ZPoXp0HMnu8dAw+Da2PNJ8tg5m2DE4LZ/7SRvZ1lY/o+gZRZJ/5D437vUFvaeHbn6lK2Em+NDy8fYKxyhyzOBXeUZWA2ieDxkAcaosTdjqUDZcBumXJnkrVfxFq94d0k4bKJqTCJdxWamzOkbqNPuHSUSBhqGqrKvDOZMt/WfIYgHoVUd3irrYZn6qzdxAfrNPRBahKEATj3knrjRGSwfHEreWJT20+eb2mohf6mw9U0aVUrVDxS9tYnc/DjXqTSaaGZUum46xcDmgb79CFlOe3QG8F0wppyY7tOhteVk/ljXDHsr3TwbuQasWZLhGXFDfI2uRgHd2I6TE93Oi/WjX7o0gSvQslGzJq+LybjuhF/nDx5KG35RA7bV+SeSf2r/ueTojUCdGj4Lm+jwUHIX/IKM59zBgspoemuo6EdQhPNCOV/cOjgoDsl4ZofDrB5vjWzAH9NV4xHO2SvGjbf/P0IekARQURo1nYjWXk3sdWe+1r8WWf5GUCs/7Mu8c2MNnKXFSg0gBDMUUTPQCqiRTUP7cM01AQGH+hasLgbMfaC65rh0W6XQNlqQmKJK+J
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5473230AE457FF4E84D452B3BD9EEA44@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079c6fd4-fbdd-4148-754d-08d87bb3deef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 02:39:34.0953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXkL/p9lhwewcp2UI2PNfN/cQNS1NFi5YAf8aR1yWUgcdhxX2oxMuHPjE2i1WZ2dwLF/FXtjNeCBXIcAuOuQwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2616
X-OriginatorOrg: fb.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=865 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290015
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEwLzI4LzIwLCA1OjQwIFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgVmlqYXkg
S2hlbWthIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiB2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KDQoNCg0KICAgICAg
ICBJcyB0aGF0IHJlbGF0ZWQgdG8gdGhpcyBjb21taXQ/DQoNCiAgICAgICAgaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvY29tbWl0L2Q3YjY2NTk5NDRjMzUyNzYyMmQ0
NTQ1MjY1MDlhMGE4Njk3YWRhMGYNCg0KICAgIExldCBtZSBjaGVjayB3aXRoIGNvZGUuDQoNCkkg
YW0gYXNzdW1pbmcgYmVsb3cgY29tbWl0IGlzIGNyZWF0aW5nIHRoaXMsIEkgc3RpbGwgbmVlZCB0
byB0ZXN0IA0KYnV0IEkgYW0gYXNzdW1pbmcgdGhlcmUgc2hvdWxkIGJlIGEgcmVhc29uIGZvciBh
ZGRpbmcgdGhpcyB3aGljaCANCkkgYW0gbm90IHVuZGVyc3RhbmRpbmcuDQpodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdlci9jb21taXQvOGE5ODM5MjFkNGEwOTlkODlhNWZk
OGVhNGQ3MDQyMDllZDFkY2RhNQ0KDQoNCg0KDQo=
