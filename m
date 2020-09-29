Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9D27DCB0
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 01:30:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1FxX6ZgYzDqbk
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 09:30:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=754111bd5d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=TvlKjgWo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Kb0yTc8C; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1FwS22hszDqZC
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 09:29:41 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08TNPsfV025693;
 Tue, 29 Sep 2020 16:29:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=qpCzssp29T+R2dRSOtumg/SCpI14ZAF0KcTnTdXWLbc=;
 b=TvlKjgWo9IDFLYBihAqfFUKNwihzqhO2kBm5z9T6yFe80NHmf8C/PMjMCgWo8Gjh8wjh
 BbzdMZ7j1Adhf3VygCARnNaQ3kBhNcpJ4fEZyYwAq9FhbyfTAH8b0eUpZEXZQGvgWgnN
 53KuiC+VDPJXzBq+4jdDszwK5EVpt8sbbI0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 33t14ygd7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Sep 2020 16:29:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 16:29:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiLZzBzxVIBpFoLX4z2XZebDXXWTr4ezHv9Oa2zuyxbQV99I4VyFG1SlyaagkS7U8sbyuLV6ibYmglC/96UtMDIsniyIY3/BCgAtaq2iJHny3Y6SPEcl+mhPTZImkSSUUwL92BFEFdF6ijeCwDT+6zdnGzkRzIMVOsgB3IcV/jzeEq/Y6QYWcFvALn1sYJG7UpXDne044GCOMEmsYySEF1nUMEPTmQb6U8ijLV6CUsRFJVmiZQb7NtMkube4dUIpu65Dzz6KYy2O/QxoQWRgNfwbQGJb4Ko+Ina6RbUxdG8ncXc7XcnK152rWBk9sRAy191b/xU4fztLD5HDd0l6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpCzssp29T+R2dRSOtumg/SCpI14ZAF0KcTnTdXWLbc=;
 b=GbycXoWOHsTGrOlAKcDeo9S7UKwvV5wDua6EaNuNnpvsPFCZAeoTavEDEiFdO32iyUMtLM9NGObsWdbb81D/1Fgsh5mZghM+UhREQs05p5vSEzgs4NQ1ObnnJtTUOjyarLOnbdpQbs5dEPqxThw4NDTT6Tj4gztw9V3erMCfRuemFTQ4IDUCtwkP+YhnYIY4MBN+0L/4i9CEHD6zlSVx3z79bqhlyqgo0LQ9nCg+Tw4x5l15u9y9CCScJ0+O4QACR4dNhaOYowHM5WNcBhH4FUOxe5b9bH54oBZbG4+xxV17lLudbCLZ8piGLXzXbxaMQGBrKvct3AXwcwoPXhmUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpCzssp29T+R2dRSOtumg/SCpI14ZAF0KcTnTdXWLbc=;
 b=Kb0yTc8C0vMq+uzYQP4LPKC9l5arSc0Gpw1B5FLBJj+QKKN4cIrtfqVjo1F+kHW9nFjt9uUXkV8PlWxJWiWpiZkIrYsD4RJq/91nBmbEsMI11eSgVcwdYYweRtoBDpou2h8hHIIVZB2XCD1PbRihvkpL4FwFRTQfHEJQWZoc/ps=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2582.namprd15.prod.outlook.com (2603:10b6:a03:154::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 23:29:36 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 23:29:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wAgADJeID//+ZlAIABVkSAgAAEgACAAA8pgIAADjwAgAAIgoCAAA2tAP//xMkAAA+IeIABFlS8AAAO9jIA//+ddoA=
Date: Tue, 29 Sep 2020 23:29:36 +0000
Message-ID: <136DA516-590D-48A8-8E53-FFB3B5BCFCDE@fb.com>
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
 <4F207AFD-3CE9-4AA3-B520-34C63041EB55@fb.com>
 <CACWQX831_jv3NXBEjX6mCDgne65ynASgAeNNHUpiOUfME53Swg@mail.gmail.com>
 <3C833FB0-8B23-4F0D-BA4D-60033CA2557F@fb.com>
 <CACWQX83M0zZQvFx+pzM8n2r127KSYgVXWV1ZJOdHYhCyBmXvEg@mail.gmail.com>
In-Reply-To: <CACWQX83M0zZQvFx+pzM8n2r127KSYgVXWV1ZJOdHYhCyBmXvEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:53ec]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b1c9616-37ea-49f7-5c67-08d864cf8793
x-ms-traffictypediagnostic: BYAPR15MB2582:
x-microsoft-antispam-prvs: <BYAPR15MB25827F55798495B28021124EDD320@BYAPR15MB2582.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hk+TSOes4K+EjPQuB4lQnY/O1OTaJ5AhcsLbsZWumXYIJYl7SxGIMwo15NciRidgb9JlIwMsqJ/8r4rAVr0KHGn9UYIaY+VwtjbOwD9UaGj3u6aekN8CBnupReDp4KPMm2akR70EKQURmVSeZJItJs2y4ai2tzfc8Bglk0jInDMlN0roNEYr1sOaDTIUUbjPd+OEOU/5RdaE4sJAVhGxmf1FXSS1ZjM1zw3AhHj+0aW+P4B0pZn9UWbZTMDZUF6EtBCuvqUrR4aRZNDTWHgELCsWjVKD9is4tFrEhmFL+SklMB0fNldBWbJBkoFN/VrD2FUwqD9kYWKKe4iUGQ6WvLqLhnh1l+yfpKayl4CnxULStGou+V4x8lq4TKIKTrBz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(376002)(366004)(396003)(2616005)(4326008)(83380400001)(8676002)(6916009)(6512007)(7116003)(53546011)(6486002)(186003)(6506007)(36756003)(316002)(54906003)(3480700007)(478600001)(8936002)(33656002)(71200400001)(2906002)(66446008)(66476007)(64756008)(86362001)(5660300002)(66556008)(66946007)(91956017)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZMuY9dYKKSiB5heeNF4QLzy9wMRDtOyC59VmT9unSNzKYo5LobwHqfj7rcbduNbHUo0O1NvDSbB538QysM3MNZyBec+gC8uiB+PS1/vOojIIEwmwADkE1uqS29kJeqUXMM2bRc+pq1hTFFClHCy+ZxzLNdqzueQ2P8mFyVyQN1vYxzMrjfBhs+kUtttXvcSxqiqQg18x7vS3UJNcbsV54Y0vghsh9//bUPzhHlNNGGv9eEe0NKypcJvE4Y7cx8Pf+g7KsX4er4Au3p57+Kr4VT1w8mwZOk2s4YZ53rhKUqsOtJCkVlXi4J6BkTW85RCf4sBK7MnYigHowG2db0ghbJTmjuAb0HxxsNHosEvP3JzIsz71hx52Ma9ADKbmU6cA0o6V8Y9nn5VB7rTNKf1so81TgjP91DkJRAzUGvBPloUUlSM/KmJHrtdV/X/q/JCp2D28pNvCHEE9s+TzK1MGNlTe3OK4Z4lHD1eRCgYt4GMr8d7j4e95i8X2i9YK45DFZ6k15aZJGgEChgYqfgJtqK4607mlhNNMScu4PS/AYXve4342YDYkY+o6oVuC2RQfZgQCk5CaRPpNo+BXCwBPa0acqNO2MPJE14u/iEeOf+by4koAjxQRQQME5eGfN1oLbhAABsqHzpDShgeEpBb4rSmWr8lAp5YgDdkct5yAmA1ztPrKHlswfwCDF7q1fM3g
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1282D4BDFD3DF439BBA7B5DCF6B8EEB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1c9616-37ea-49f7-5c67-08d864cf8793
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 23:29:36.6715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDjHeoKGVpEHLbrqohBlo0vbBNyU2IoIHKFFuTbMjB6cYlBL6QEBzuWnR5MPscVUdIhYihMhdko12pBExB4q4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2582
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_14:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009290198
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjkvMjAsIDM6MjIgUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIFR1ZSwgU2VwIDI5LCAyMDIwIGF0IDM6MTQgUE0gVmlqYXkgS2hlbWth
IDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4g
T24gOS8yMy8yMCwgNzoyNCBQTSwgIkVkIFRhbm91cyIgPGVkQHRhbm91cy5uZXQ+IHdyb3RlOg0K
ICAgID4NCiAgICA+ICAgICBPbiBXZWQsIFNlcCAyMywgMjAyMCBhdCA2OjU5IFBNIFZpamF5IEto
ZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+ICAgICA+DQogICAgPiAgICAg
Pg0KICAgID4gICAgID4gICAgID4NCiAgICA+ICAgICA+ICAgICA+IEknbSBub3QgdW5kZXJzdGFu
ZGluZyB3aGF0IHlvdSBtZWFuIGJ5ICJjb21lIHVwIHdpdGggYW4gQVBJIHRvIHN0ZWVyIHRoZQ0K
ICAgID4gICAgID4gICAgID4gUmVkZmlzaC4uLiIgIEkgdGhpbmsgZXZlcnl0aGluZyBpcyBzcGVj
aWZpZWQgaGVyZSBhdCBhIGRidXMgbGV2ZWwuICBUaGUNCiAgICA+ICAgICA+ICAgICA+IGlzc3Vl
IGlzIGZpZ3VyaW5nIG91dCB0aGUgYXBwcm9wcmlhdGUgUmVkZmlzaCBtb2RlbCBvZg0KICAgID4g
ICAgID4gICAgID4gQ2hhc3Npcy9Db21wdXRlclN5c3RlbSBvYmplY3RzIChhbG9uZyB3aXRoIHRo
ZSBpbmNsdWRlZCBSZXNvdXJjZS5SZXNldA0KICAgID4gICAgID4gICAgID4gdHlwZXMpLiAgVG8g
YSBjYXN1YWwgcmVhZGVyLCB3aG8gaGFzbid0IGJlZW4gaW52b2x2ZWQgbXVjaCBpbiBSZWRmaXNo
DQogICAgPiAgICAgPiAgICAgPiBpbXBsZW1lbnRhdGlvbiwgdGhlIGN1cnJlbnQgbWFwcGluZyBv
ZiB0aGVzZSBSZXNldFR5cGVzIHNlZW1zIGZhaXJseQ0KICAgID4gICAgID4gICAgID4gYXJiaXRy
YXJ5Lg0KICAgID4gICAgID4NCiAgICA+ICAgICA+ICAgICBTb21lIG1pZ2h0IGJlIGFyYml0cmFy
eSwgYnV0IG1vc3QgYXJlIGV4cGxpY2l0IGFuZCBjaG9zZW4gb24gcHVycG9zZSwNCiAgICA+ICAg
ICA+ICAgICBlc3BlY2lhbGx5IGluIHRoZSBjYXNlIG9mIHRoZSBTeXN0ZW0gc2NoZW1hLiAgVGhl
IENoYXNzaXMgc2NoZW1hIGlzIGENCiAgICA+ICAgICA+ICAgICBsaXR0bGUgbW9yZSBsYXgsIGFz
IGl0J3MgbW9yZSBvZiBhIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgdGhpbmcgdG9kYXkuDQogICAg
PiAgICAgPiAgICAgSSB0aGluayB5b3UgKFZpamF5KSBhcmUgdGhlIGZpcnN0IHBlcnNvbiB0cnlp
bmcgdG8gbW9kZWwgaXQNCiAgICA+ICAgICA+ICAgICAicHJvcGVybHkiLg0KICAgID4gICAgID4N
CiAgICA+ICAgICA+ICAgICBXaGF0IEkgbWVhbiBpcyB0aGF0IHRoZSBjdXJyZW50IFJlZGZpc2gg
ZGVmaW5pdGlvbiBvZiBDaGFzc2lzIHBvaW50cw0KICAgID4gICAgID4gICAgIHRoZSBQb3dlckN5
Y2xlIGFjdGlvbiB0byBjaGFzc2lzMC4gIFRoYXQgUG93ZXJDeWNsZSBhY3Rpb24gbm93IG5lZWRz
DQogICAgPiAgICAgPiAgICAgdG8gcG9pbnQgYXQgbXVsdGlwbGUgdGhpbmdzLCBjaGFzc2lzMCBp
ZiB3ZSBkb24ndCBzdXBwb3J0IEFDIHJlc2V0LCBvcg0KICAgID4gICAgID4gICAgIGNoYXNzaXNf
c3lzdGVtMCBpZiB3ZSBkby4gIFRoYXQgaXMgdGhlICJzdGVlcmluZyIgSSB3YXMgcmVmZXJyaW5n
IHRvLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+IEhvdyBhYm91dCB3ZSBtYXAgcG93ZXJDeWNs
ZSB0byBjaGFzc2lzMCBhbmQgRm9yY2VSZXN0YXJ0IHRvIGNoYXNzaXNfc3lzdGVtMA0KICAgID4g
ICAgID4NCiAgICA+ICAgICA+DQogICAgPg0KICAgID4gICAgIEkgd291bGQgbm90IGJlIGluIGZh
dm9yIG9mIHRoaXMuICBUZWNobmljYWxseSB5b3UncmUgaW1wbGVtZW50aW5nIGENCiAgICA+ICAg
ICBQb3dlckN5Y2xlIGhlcmUgYXMgeW91J3JlIGN5Y2xpbmcgdGhlIHBvd2VyIHN1cHBsaWVzIG9m
ZiB0aGVuIG9uLiAgQQ0KICAgID4gICAgIEZvcmNlUmVzZXQgd291bGQgYmUgaWYgeW91IGFzc2Vy
dGVkIHNvbWUga2luZCBvZiByZXNldCBwaW4gdG8gdGhlDQogICAgPiAgICAgYm9hcmQsIHdoaWxl
IGtlZXBpbmcgdGhlIHBvd2VyIHN1cHBsaWVzIHVwLCB3aGljaCwgd2hpbGUgdmFsaWQsIGlzIG5v
dA0KICAgID4gICAgIHdoYXQgeW91J3JlIGRvaW5nLg0KICAgID4NCiAgICA+IEkgYW0gYWN0dWFs
bHkgYXNzZXJ0aW5nIGEgcGluIGJ5IHNlbmRpbmcgaTJjIGNvbW1hbmQgdG8gSFNDIChIb3Qgc3dh
cCBjb250cm9sbGVyKQ0KICAgID4gV2hpY2ggcmVtb3ZlcyBwb3dlciBhbmQgcmVzdG9yZXMgYmFj
ay4NCg0KICAgIFRoYXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQuICBS
ZWdhcmRsZXNzIG9mIHRoZQ0KICAgIHBoeXNpY2FsIG1lZGl1bSwgdGhlIGVuZCByZXN1bHQgaXMg
dGhhdCBwb3dlciBpcyByZW1vdmVkLCB0aGVuDQogICAgcmVzdG9yZWQuICBUaGF0J3MgYSBQb3dl
ckN5Y2xlIGFjdGlvbi4NCg0KICAgID4NCiAgICA+ICAgICBBbHNvLCBpdCB3b3VsZCBtZWFuIHRo
YXQgd2UgaGF2ZSBtdWx0aXBsZSBhY3Rpb25zIHRvIG1haW50YWluDQogICAgPiAgICAgZXh0ZXJu
YWxseSwgYW5kIHVzZXJzIHdvdWxkIGhhdmUgbm8gZ3VhcmFudGVlcyBhYm91dCB3aGljaCBvbmVz
IGFyZQ0KICAgID4gICAgIHN1cHBvcnRlZC4gIE1hcHBpbmcgUG93ZXJDeWNsZSB0byB0aGUgYmVz
dCBzdXBwb3J0ZWQgbWVjaGFuaXNtIHdlIGhhdmUNCiAgICA+ICAgICBzZWVtcyBsaWtlIHRoZSBi
ZXN0IHRoaW5nIHRvIGRvIGhlcmUuDQogICAgPg0KICAgID4gVGhlbiBzaG91bGQgd2UgbWFwIHRo
aXMgY2hhc3NpcyBwb3dlcmN5Y2xlIHRvIGNoYXNzaXNfc3lzdGVtMCBpbiB0aGUgY29kZT8NCiAg
ICA+DQoNCiAgICB5ZXMsIGlmIGNoYXNzaXNfc3lzdGVtMCBpcyBzdXBwb3J0ZWQgb24gdGhhdCBw
bGF0Zm9ybS4gIElmIGl0J3Mgbm90LA0KICAgIGl0IHNob3VsZCBmYWxsIGJhY2sgdG8gdGhlIG9s
ZCBjaGFzc2lzMCBub2RlLCBzbyB3ZSBkb24ndCBicmVhaw0KICAgIGFueW9uZS4NCg0KT2ssIExl
dCBtZSBmaWd1cmUgb3V0IHRoaXMsIGhvdyB0byBmaW5kIHN1cHBvcnQuIENhbiBJIHVzZSBjb21w
aWxlIHRpbWUgZW5hYmxlIA0KZm9yIGNoYXNzaXNfc3lzdGVtMCBvciBzaG91bGQgSSBsb29rIGZv
ciBydW50aW1lIGludGVyZmFjZS4NCg0K
