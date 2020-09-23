Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B055A275066
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 07:44:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx6Ys471zzDqVd
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 15:44:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=65350707bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=UWg4pKHN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=SakqCe0h; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx6Xz6PWtzDqV6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 15:43:25 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08N5dU1F029584; Tue, 22 Sep 2020 22:42:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=GchHq+ADfQBCcYZ6q6XcayVuN9HHRnEQD+Z3wx0cwYs=;
 b=UWg4pKHNOC9eNB2X/B+ej0lpKys7DuWq71IJQQQiEHlkesajrZpEvU87ve6GrlHR51d5
 3NDkl0oCs3lAA5AzbygS5jmH4dgWcqruzydeFTKasuXASc58yi/RHhxoZeRkhdaq0Gpt
 papJB5lKPMCsBqLgId+IfJDBpE30tbaOeTY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp3ss4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 22:42:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 22:42:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgbzV87mvzAs/dnd1AFtOiCI3cK8uo/ubnx1jlVrGqGzVDfCQm+tLdXBFifnLXbo3cRxRcifMi4q72eN1nxcraB4ZkePxZlKAaCuqZ60qAnv4KYRXUM/+TJ4BFVzyCYEvY+2XcaGku+VWob53WrNvmg8dT+6/JufvrMEaJzLP10e8ob+bnaTHJk8LUQwqE1O9KHU2AIKxtOUw9vjUXVHqqbr711QIc4JadQ0kJs0GpkqXTqdf5GqYn6GN+zQJ954x1RXJo3YbKbHMryufk3X4JCGkOaZF1qONMRK8P9ZrMzMook/FtuGluMP9xVxZVaJo9qA9OC67LTZWr5AaQA2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GchHq+ADfQBCcYZ6q6XcayVuN9HHRnEQD+Z3wx0cwYs=;
 b=ZnBJ8ncSMNzGr9KHL67TOvQYRig+pAqvNmOk7amul1Uc7wdoQhanI5B+SEjXCfatINV48FBeApMNgEEtW7RwNZX4EDjp9dd2Hde0BBFnWC0luaeCLxJg30/wk8Ag6khkLKUi1uRvm6PD+Si1fAHNaSOQKo76+hxH1ssOgA7lWJjgqulkROOgQVQHuSfU+kCef4ZBdUnW5gf21LIjbVaK7WSg8ofixqJjI+8f2GBmmJsyNMPh3n5hNnDRRXnC3zlocUWpuwWHeSdGHJWiK0AbYOocH8Sc4z74QLNVAZcaP9A1A3CEzFvkVH4w+27if1sep5bO8SziqYkxwXupeKatIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GchHq+ADfQBCcYZ6q6XcayVuN9HHRnEQD+Z3wx0cwYs=;
 b=SakqCe0hAL8N3uYTOi4DkPPtML7ICUmITtBngEKws0ykGjQISn2biF3+Adwfju7VmQLA1NbdDnZxZGPIMMuuaemBO5DPGF5BavzgHRZ6ieOOlCOkEYfCiOWQfTwIorc2ERipDRPW+6yos8O4iz1w8aoGayiiugYhUieQVl1L9Co=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BY5PR15MB3572.namprd15.prod.outlook.com (2603:10b6:a03:1b2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 23 Sep
 2020 05:42:13 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 05:42:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwABMecIAAAvawUAAA92WAD//4x0gIAAfaIAgAAdjoA=
Date: Wed, 23 Sep 2020 05:42:12 +0000
Message-ID: <39F6BFAB-47F6-4138-B038-D7DBA6EA6BE4@fb.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
 <CACWQX83XmOJ7a7O_R8pLec-NdrYiP18VVoyAEWacS6wM5Xfd3g@mail.gmail.com>
 <2F15FFE5-4A4A-4652-B3BF-6B8CD5B17CCF@fb.com>
 <CACWQX81uOYUbgzSKaLGgTP6-NT+h7CLykdcDDe19+CJvdw2nxw@mail.gmail.com>
In-Reply-To: <CACWQX81uOYUbgzSKaLGgTP6-NT+h7CLykdcDDe19+CJvdw2nxw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:7daf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21bfb081-a5b4-4bc6-d541-08d85f836bc3
x-ms-traffictypediagnostic: BY5PR15MB3572:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3572E1CA32D02E9E1857143DDD380@BY5PR15MB3572.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KOebMHxp/zCdLH2fX4zooOR8/xa7zodtkjX0kDt78w6JjrPd6VXvmPATGE19uAEll9vEQupqGTFKm9yChxuycSQ1NuYff76qA1sjIiFh305eiXUecXgSt5JG1y87JRvKpuZBSrAf3L1f2/VSgZpYRDCvdLzb8E0b0wPIxN+GiPfcON6G20Gg6rlT1QZc4yAQXY23fJKdPeJSL+N4RFjsROp11nmjqJu6QpOTVLY7+ANwBgvTBHlCqeAyoySJ/5U5rZj6B2wXFnn9dw7LYKYb5jKy6AHjvnyQSXRl/tDp7j8sULJ+tG0ZGfhClvUWMiU1AD5/K4qqCaolHPy4CzSNJJ6Nqc2LBN6MldDtQgdciMhpnf7DVsiG0OTG1OynY4Xb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(5660300002)(4326008)(36756003)(6486002)(91956017)(76116006)(66946007)(8676002)(86362001)(66476007)(66556008)(64756008)(66446008)(2906002)(83380400001)(6916009)(33656002)(316002)(478600001)(8936002)(71200400001)(54906003)(186003)(6506007)(53546011)(2616005)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HZ7qU9Snyt2ZEzmey2DMFsl3tdbaziKnMH5eWKuJo/tVKCH5YHHFPGzavlJ0oX1D/lSzdRrcoJ/0VTnnXZumjgIMltasOo/eSIj03MI7j0vyY8T4G2MD5MSq0Kgh6LBGVnKRLqwutA6HAqDIknl8IM9qDSTBmE6ZudrmS2GFKqCqGLm6W+rwcgOAr/P6wZTdKpik/+QTID1bpxRsGOhuMVptSiD2oSGCAxMVXn7SSjdmQczUmKfijSW3TDSkshj52+UifonAkyujpKm/ONXN7zJ/4TGs4iBaLpdpsBDHUndndjJrAqwQiv4MPQyluoV0rbZQR/HkC44UWv6h6f8mMp+FSP5GngrpmXTAUOxwLup06FRIdLqZJF12TWBzEvYbizG6b2kbajNHVgJ6kxPTGBJkcQKNOPnATii7Gk4HrpI5WF57xYQE2HKPzFy9kC2Bv9D/Ht44HXwxxzqhCS2xvyxAUiLp61Xe+NhzwD+oWnnM23lP/S6NeVDg5t4eEQC6Fk5pRoN3tVB1Sn8nHS7dhWVUfvMp5a/zhamGpncPnKH8yoU/FJDHJqgzJTq18CzVlECthIE4B1+WAq0K8Ucxeg0Vc4MViO6lo7upRdSDg95fiCv2nTdXhxZhkynPqboKYmzmyX8skphasflin106PDlbC6hXaWrWrbUuVDdWa9MTZWRQC39660runZwYP+Ip
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0134A21766B304AAF6861FF2C6713AE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bfb081-a5b4-4bc6-d541-08d85f836bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 05:42:12.3797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTRs4kW5YHvRmpu3KvjyUlD1UZblq/5FKQ/3jfwUu+OmhSMfiThVIL87TpZvMzmvY/ljfLiBYEdcw2ZoxxrJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3572
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_03:2020-09-21,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230045
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kumar Thangavel <thangavel.k@hcl.com>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjIvMjAsIDE6NTggUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIFR1ZSwgU2VwIDIyLCAyMDIwIGF0IDE6MjYgUE0gVmlqYXkgS2hlbWth
IDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4g
T24gOS8yMi8yMCwgMToyMCBQTSwgIkVkIFRhbm91cyIgPGVkQHRhbm91cy5uZXQ+IHdyb3RlOg0K
ICAgID4NCiAgICA+ICAgICBPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCAxMjo1NyBQTSBWaWpheSBL
aGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPiAgICAgPg0KICAgID4gICAg
ID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBPbiA5LzIxLzIwLCA5OjQ1IEFNLCAiS3VtYXIg
VGhhbmdhdmVsIiA8dGhhbmdhdmVsLmtAaGNsLmNvbT4gd3JvdGU6DQogICAgPiAgICAgPg0KICAg
ID4gICAgID4gICAgIENsYXNzaWZpY2F0aW9uOiBIQ0wgSW50ZXJuYWwNCiAgICA+ICAgICA+DQog
ICAgPiAgICAgPiAgICAgSGkgQWxsLA0KICAgID4gICAgID4NCiAgICA+ICAgICA+ICAgICAgICAg
ICAgICAgICBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMgYW5kIHN1Z2dlc3Rpb25zLg0KICAgID4g
ICAgID4NCiAgICA+ICAgICA+ICAgICAgICAgICAgICAgICBBcyBzdWdnZXN0ZWQsIHdlIGFyZSBw
bGFubmluZyB0byBpbXBsZW1lbnQgYSBuZXcgcHJvY2Vzcy9zZXJ2aWNlIGxpa2UgIHh5ei5vcGVu
Ym1jX3Byb2plY3QuSVBNQi5GcnVEZXZpY2UgaW4gZW50aXR5IG1hbmFnZXIgbW9kdWxlIHRvIHN1
cHBvcnQgSG9zdCBGUlUgdGhyb3VnaCBpcG1iIHJhdGhlciB0aGFuIHVzaW5nIGRidXMtc2Vuc29y
cy9pcG1ic2Vuc29ycyBmaWxlLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+ICAgICAgICAgICAg
ICAgICBGb2xsb3dpbmcgYXJlIHRoZSBhZHZhbnRhZ2VzLCBpZiBob3N0IEZSVSBoYW5kbGluZyBp
biBlbnRpdHkgbWFuYWdlciByZXBvLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+ICAgICAgICAg
ICAgICAgICAxLiBBbGwgdGhlIEZSVSBpbmZvcm1hdGlvbiBpcyBoYW5kbGluZyBpbiB0aGUgc2Ft
ZSByZXBvLg0KICAgID4gICAgID4gICAgICAgICAgICAgICAgIDIuIEVudGl0eSBtYW5hZ2VyIFBy
b2JlIGNhbiB3b3JrLg0KICAgID4gICAgID4gICAgICAgICAgICAgICAgIDMuIEFsbCB0aGUgRlJV
IEZ1bmN0aW9ucyBhcmUgaW4gdGhlIHNhbWUgcmVwby4gV2UgY2FuIHRyeSB0byByZXVzZSBtb3N0
IG9mIHRoZSBmdW5jdGlvbnMuDQogICAgPiAgICAgPiAgICAgICAgICAgICAgICAgNC4gQWRkaW5n
IEZydSBvYmplY3QgdG8gZGJ1cyBoYW5kbGluZyBhcmUgZG9uZS4NCiAgICA+ICAgICA+ICAgICAg
ICAgICAgICAgICA1LiBBbGwgRlJVIHZhbGlkYXRpb25zIGFyZSBkb25lIGhlcmUgbGlrZSBGb3Jt
YXQgZnJ1LCB1cGRhdGUgZnJ1IHByb3BlcnR5LCB2YWxpZGF0ZSBoZWFkZXIsIEZydSBBcmVhTGVu
IGFuZCBjaGVja3N1bS4gV2UgY2FuIHRyeSB0byByZXVzZSB0aG9zZSB2YWxpZGF0aW9ucy4NCiAg
ICA+ICAgICA+DQogICAgPiAgICAgPiBXaGF0IHdpbGwgaGFwcGVuIGlmIHVzZXIgaXMgbm90IHVz
aW5nIGZydS1kZXZpY2UgZnJvbSBlbnRpdHkgbWFuYWdlciwgcmF0aGVyIGNob29zZSB0byB1c2Ug
cGhvc3Bob3ItaXBtaS1mcnUuIEhlcmUgeW91IGFyZSByZXN0cmljdGluZyB1c2VyIHRvIHVzZSBm
cnUtZGV2aWNlIG9ubHkuDQogICAgPg0KICAgID4gICAgIHBob3NwaG9yLWlwbWktZnJ1IGlzIG5v
dCBjb21wYXRpYmxlIHdpdGggSVBNQiBGcnVzLCBhcyB0aGUNCiAgICA+ICAgICBzcGVjaWZpY2F0
aW9uIHJlcXVpcmVzIHRoZW0gdG8gYmUgZHluYW1pY2FsbHkgc2Nhbm5lZCBiYXNlZCBvbiB0aGUN
CiAgICA+ICAgICBTRFIuICBJIGd1ZXNzIHlvdSBjb3VsZCBoYXJkY29kZSB0aGVtLCBidXQgeW91
J2Qgc3RpbGwgaGF2ZSB0byBoYXZlDQogICAgPiAgICAgc29tZSBhdXhpbGlhcnkgImRvZXMgbXkg
ZGV2aWNlIGV4aXN0IiBzY2FubmluZyB0aGF0IHN0YXJ0cyB0byBsb29rIGENCiAgICA+ICAgICBs
b3QgbGlrZSBlbnRpdHkgbWFuYWdlci9mcnUgZGV2aWNlLiAgSXMgdGhlIHVzZSBjYXNlIHlvdSBw
cmVzZW50IGENCiAgICA+ICAgICByZWFsIG9uZSwgb3IgaHlwb3RoZXRpY2FsPw0KICAgID4NCiAg
ICA+ICAgICA+DQogICAgPiAgICAgPiAgICAgICAgICAgICAgICAgRm9yIHNjYW5uaW5nIHRoZSAv
ZGV2L2lwbWktKiBub2Rlcywgd2UgYXJlIHRoaW5raW5nIHRvIHVzZSBpcG1iLWNoYW5uZWxzLmpz
b24gY29maWcgZW50cmllcyBpbiBlbnRpdHkgbWFuYWdlciByZXBvIHNpbmNlIHRoaXMgY29uZmln
IGZpbGUgaGFzIHZhbGlkIHNsYXZlIHBhdGggYW5kIGJ1cyBhZGRyZXNzLg0KICAgID4NCiAgICA+
ICAgICBQbGVhc2UgZG9uJ3QuICBFbnRpdHktbWFuYWdlciBpcyBkeW5hbWljLCBhbmQgdGhlIGNv
bmZpZyBzaG91bGQgYmUNCiAgICA+ICAgICBiYXNlZCBvbiBhIGRldGVjdGVkIGVudGl0eS4gIE1p
eGluZyB0aGUgZHluYW1pYyBhbmQgc3RhdGljIHVzZSBjYXNlcw0KICAgID4gICAgIGluIHRoaXMg
d2F5IHdvdWxkIG1lYW4gdGhhdCB3ZSBnZXQgdG8gcmV3cml0ZSBhbGwgb2YgdGhpcyB3aGVuIHdl
IGhhdmUNCiAgICA+ICAgICB0byBzdXBwb3J0IElQTUIgYWRkLWluLWNhcmRzLCB3aGljaCBhcmUg
OTklIHRoZSBzYW1lLCBidXQgbmVlZCB0byBiZQ0KICAgID4gICAgIGRldGVjdGVkIGluc3RlYWQg
b2YgaGFyZGNvZGVkLg0KICAgID4gICAgIElmIHlvdSB3YW50IHRoaXMgdG8gYmUgcmVsYXRpdmVs
eSBzdGF0aWMsIGF0dGFjaCBhbiBleHBvc2VzIHJlY29yZCB0bw0KICAgID4gICAgIHlvdXIgYmFz
ZWJvYXJkIGNvbmZpZyB0aGF0IGhhcyB0aGUgaW5mb3JtYXRpb24geW91IG5lZWQgKGlmIHlvdXIg
SVBNQg0KICAgID4gICAgIGRldmljZXMgYXJlIG9uIHRoZSBiYXNlYm9hcmQpLg0KICAgID4NCiAg
ICA+IFJhdGhlciB0aGFuIGhhdmluZyBoYXJkY29kZWQgY29uZmlnLCBjYW4gd2UgY2FuIHNjYW4g
YWxsIGF2YWlsYWJsZSBpcG1iDQogICAgPiBkZXZpY2VzIHVuZGVyIC9kZXYvaXBtYi0qIGFuZCBz
ZW5kIHByb3BlciBpcG1iIGNvbW1hbmQgdG8gZ2V0IGZydQ0KICAgID4gZGF0YS4NCg0KICAgIFdo
ZW4gYW4gSVBNQiBjYXJkIGlzIGluc3RhbGxlZCwgd2hvIGlzIGluIGNoYXJnZSBvZiBjcmVhdGlu
ZyB0aGUNCiAgICAvZGV2L2lwbWItKiBub2RlPw0KDQpJdCBzaG91bGQgYmUga2VybmVsIGRyaXZl
ci4NCg0KICAgID4NCiAgICA+ICAgICA+DQogICAgPiAgICAgPiAgICAgICAgICAgICAgICAgUGxl
YXNlIHNoYXJlIHlvdXIgY29tbWVudHMgaWYgYW55Lg0KICAgID4gICAgID4NCiAgICA+ICAgICA+
ICAgICBUaGFua3MsDQogICAgPiAgICAgPiAgICAgS3VtYXIuDQogICAgPiAgICAgPg0KICAgID4g
ICAgID4NCiAgICA+DQoNCg==
