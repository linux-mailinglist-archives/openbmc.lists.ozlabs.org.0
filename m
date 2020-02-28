Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5F1731CB
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 08:31:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TLnf1XcrzDrFl
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 18:31:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=9327be7d46=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=LHcwiBkL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=XJeQZ6Jl; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TLmr5j5zzDrCp
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 18:30:51 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S7UO4p016750; Thu, 27 Feb 2020 23:30:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=C4ejlmt+Zu+w79pc3h3gqNMV13h9mVcCWZe/tlZy11E=;
 b=LHcwiBkL4SYZ2whEEiQGkkVkxQ2+3++QU5GZWK7PnJoYiU4Mhl0L91hkoUjBVodxg2q+
 p7rUvBwh4OYJQJrL8vY4fnBx5ef/krirGHSgBQvN0C99Eb3rvYyLTzY9p0P52P0xoUgc
 x1A53Ubbd9VHit1f96RFTsibeybUi2v8dKk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2yepv6hs1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Feb 2020 23:30:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 23:30:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmyri+z5Tu8N1s3AYWpOMAslae9aUrEYb44ClnT0nWNciutvDnAuaKMUZjD3V9x/CKBHCldY/ZN/T/nIFNVAgTS2wh/BtbK4BCzIGruspn/t/8JLfdAtM8xKzuu9tHg32pl/lMoL9XU6okgRWu9ff8KU2I7OQKOWIKR/UwH26rqHpOg1sdKq8ixqk4R6z2b9Iym/7+h73ZXr0ZQ9600DFoph2fN7Pc2ga4JbxJ4JepccS5rqC/mnY+DiT4IwsyeVpnJPbrIqkGQdHaTBxz/pX1ps6oTNYI56v2gecOnBPoeSQ1yUktEsYCVsR9RIpmFfZKq2rDFDko87NQWNd1X8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ejlmt+Zu+w79pc3h3gqNMV13h9mVcCWZe/tlZy11E=;
 b=BdhT084eOiIBZ5YUEFBEhw3QaP6+T5dU+o/LIQZEL5HAwIdLD8l+bKFHozcHjc3LmLUWP3ud88kU7TQEHAYor41bpurNIT4NtUnvBzGOQMYNUSPKABTt1KXC3Y+ebedi060iXPrNMDrVotsMUD8eIbgzoHBUbKCAMrIwxU8s4I3E4N+gDive4Uj3p6i7AmeTpKJZTm2evX4a42MM+vzIH6WhO0KRf3ExEV3SVk7CCJr8Ag5suw5oaPH+7edJhMsaojB1VN2g7irSS1sVWUWeKMPtyovyTaR+bhMJsbDw4JnBj64UWUL8Lnfda+lHZM2Zqi6EKgPKfOFnwQFh6y15fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ejlmt+Zu+w79pc3h3gqNMV13h9mVcCWZe/tlZy11E=;
 b=XJeQZ6JlmeG22HmuI37+gyco373vrtdpqHZSa8so/8m0CFa/sukqTxefGFU5vTDeZzIkddHykWp2tIIjk5Xbyub55vLtb4OqlMg8z4PYMEi6RIGFkizk8AkTsebyftcnX4lnQVAohc5Pp8PVWJZdkKVdR/z9t0ru49m+th1MQp4=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3868.namprd15.prod.outlook.com (2603:10b6:303:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Fri, 28 Feb
 2020 07:30:33 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.018; Fri, 28 Feb 2020
 07:30:32 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: obmc-console design for multi host support
Thread-Topic: obmc-console design for multi host support
Thread-Index: AQHV54I/nLHE21W9uEuIi5D/dIqKpKgj/zQAgAmtGoCAAS9LgIAA4TAA
Date: Fri, 28 Feb 2020 07:30:32 +0000
Message-ID: <26B24CEE-C910-4FB1-B316-8E0676E3AD16@fb.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
In-Reply-To: <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:773f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c15cf58-0807-43a1-e37c-08d7bc201859
x-ms-traffictypediagnostic: MW3PR15MB3868:
x-microsoft-antispam-prvs: <MW3PR15MB386892E4C2EF698E48FEDDBFDDE80@MW3PR15MB3868.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(6486002)(66446008)(64756008)(76116006)(81156014)(8936002)(5660300002)(66476007)(6512007)(8676002)(66946007)(36756003)(66556008)(4326008)(81166006)(316002)(966005)(2616005)(478600001)(6506007)(71200400001)(110136005)(2906002)(33656002)(186003)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3868;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7UYCsNzh2CgcwFZ9mjMA3p8gEOrmj4sxM4yHNFZLtUgm9TllBYbqLlqlQY+SAPsYokDI5WamjZIr07IidvxLVxI6ZOOKbKlqp5DS/Ohft0xsz8IbFix5d2N4kBy7wgAVfbUA+uUAqgk13kjqGwC8zrwG6IJp3kj7P278mFKIstKgBO0a7et3DQMt9ZaaHTpGSz6ymwmeUF0TYMZaijaUYzuqAzyuQzPsXNfpkcz+bjPsW2onZTOZ4W0ZhUXzRfDo52GJHmsGY9tf7VKknuPeDvacdH3OjKu+uJiEEQ+MZ9Cx6bkvTQmLG2jw+akEOWnLod3fxe5mKcBT+LJYwBNEy2HUhVYO2GoMZvE0Squ1GM+n9TFUu0GwkJs6AG3TcA3ORVwseRhA/+uvyh7WIpJK4/ggekLwbvLdeOD3y88q+CZ/E25lNgMU4HpuY9Tke9xUdI0QVZtkKYJ2ITJAJmL2YsBYw9PqCpSZ7WT55lt8HVIAObfIxOlNqySAUfhXSqxgz9lC72I9tfRoP/C+vWF4Ow==
x-ms-exchange-antispam-messagedata: 6VEbwGZZ0UcCfNu4jjzHg0yTAvrUifPf+0vNLGQiCdPpWf7i4zwqnRrM7qgElgwisT6DRZReAe9dPbBDC6662KalZTYpWNdTcQhGCaOAdfpiMcfbM96i4seyKWYHOwFNw+9EJ48VnCfKlwpofRzLRp6ZSvMyGE75yGauTx6EkIpZg3rbNvIsqJEmXjagfyXP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB95DBF341E25C4AB8D6852B18E22CC3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c15cf58-0807-43a1-e37c-08d7bc201859
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 07:30:32.8628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ppc6gDamW/izUzHf4P0kod1RMWyhlBoApYZoXaCBegyF55DZ/SQnsOED8qRfPu6Jh5P7OkeDgnwjMm3zXZoYlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3868
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_01:2020-02-26,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002280064
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDIvMjcvMjAsIDI6MDUgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBBbmRyZXcg
SmVmZmVyeSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgYW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCg0KICAgIEhpIEt1bWFy
LA0KICAgIA0KICAgIE9uIFRodSwgMjcgRmViIDIwMjAsIGF0IDAyOjI5LCBLdW1hciBUaGFuZ2F2
ZWwgd3JvdGU6DQogICAgPiBIaSBBbmRyZXcsDQogICAgPiANCiAgICA+ICAgICAgICAgICAgICBD
b3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgaG93IHRvIGFkZCBjb25maWdzIGZvciBtdWx0aXBsZSBo
b3N0ID8NCiAgICANCiAgICBTdXJlLiBTbyB0aGUgcm9vdCBwcm9ibGVtIGlzIG1hcHBpbmcgYSBn
aXZlbiBvYm1jLWNvbnNvbGUtY2xpZW50IHRvDQogICAgdGhlIGNvcnJlY3Qgb2JtYy1jb25zb2xl
LXNlcnZlciBpbnN0YW5jZS4gV2UgZG8gdGhpcyBieSBnaXZpbmcgdGhlDQogICAgdW5peCBkb21h
aW4gc29ja2V0IGNyZWF0ZWQgYnkgdGhlIHNlcnZlciBhIHVuaXF1ZSBuYW1lIGluIHRoZQ0KICAg
IGFic3RyYWN0IHNvY2tldCBuYW1lc3BhY2UuIFRoZSBjbGllbnQgaXMgYXNzb2NpYXRlZCB3aXRo
IGEgdW5pcXVlDQogICAgbmV0d29yayBwb3J0IGFuZCB0aGUgc2VydmVyIGEgdW5pcXVlIHR0eSBk
ZXZpY2UgKGUuZy4gdHR5VlVBUlQwKSwNCiAgICBidXQgbmVpdGhlciB0aGUgcG9ydCBub3IgdGhl
IHR0eSBzaG91bGQgYmUgYXNzb2NpYXRlZCB3aXRoIHRoZSBhYnN0cmFjdA0KICAgIHNvY2tldCdz
IG5hbWUgYXMgdG8gZG8gc28gbWVhbnMgdGhlIHBvcnQgb3IgdHR5IG5hbWUgYmVjb21lcyBhDQog
ICAgbWFwcGluZyB0aGF0J3MgaGFyZCB0byBicmVhayAocG9ydCBYIGFsd2F5cyBpbXBsaWVzIHR0
eSBZKS4gVGhlIHJvdXRlDQogICAgdGhlIHBhdGNoZXMgdGFrZSBpcyB0byBwYWlyIGEgY2xpZW50
IHdpdGggYSBzZXJ2ZXIgdmlhIGEgc29ja2V0LWlkIHZhbHVlDQogICAgcmVhZCBmcm9tIGEgY29u
ZmlndXJhdGlvbiBmaWxlIChvbmUgcGF0Y2ggZW5hYmxlcyB0aGUgY2xpZW50IHRvIHJlYWQgYQ0K
ICAgIGNvbmZpZ3VyYXRpb24gZmlsZSBbMV0pLg0KICAgIA0KICAgIFsxXSBodHRwczovL3VybGRl
ZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJE
cHJvamVjdC54eXpfY19vcGVuYm1jX29ibWMtMkRjb25zb2xlXy0yQl8yOTQ1NyZkPUR3SUJBZyZj
PTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtr
Y3JJYXFVN1VTbDVnJm09NEtzQWd0cGdsTTN1eS16UU5yTGV0RHNBSzB0V1lhNmpySkJyUFBSZXIx
QSZzPVVVZHRpOTZfVGp0S2ZDd3N6VEtvUEZkMW5xcnhmVVk3XzlpU1lkRzgwVGMmZT0gDQogICAg
DQogICAgQWxsIGNvbm5lY3Rpb25zIHRvIHRoZSBjbGllbnQgYSBnaXZlbiBwb3J0IHNob3VsZCBt
YXAgdG8gb25lIGFzc29jaWF0ZWQNCiAgICBzZXJ2ZXIuIEdpdmVuIHRoYXQgdGhlIHBvcnQgaXMg
dW5pcXVlIGZvciB0aGUgY2xpZW50IGFuZCB0aGUgdHR5IGZvciB0aGUNCiAgICBzZXJ2ZXIsIHdl
IGNhbiBkZWZpbmUgd2hpY2ggY29uZmlndXJhdGlvbiB0aGV5IHNob3VsZCB1c2UgaW4gdGVybXMg
b2YNCiAgICB0aGUgcG9ydCBvciB0dHksIHdoaWNoIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgY29u
ZmlndXJhdGlvbiBzdHJ1Y3R1cmU6DQogICAgDQogICAgYGBgDQogICAgJCBscyAtMSAvZXRjL29i
bWMtY29uc29sZQ0KICAgIGNsaWVudC4yMjAwLmNvbmYNCiAgICBzZXJ2ZXIudHR5VlVBUlQwLmNv
bmYNCiAgICBgYGANCldoYXQgYXJlIG90aGVyIGNvbnRlbnRzIG9mIGNsaWVudCBhbmQgc2VydmVy
IGNvbmYgZmlsZSBvdGhlciB0aGFuIHNvY2tldC1pZD8NCiAgICANCiAgICBTbyB0byBtYXAgdGhl
IGNsaWVudCBhc3NvY2lhdGVkIHdpdGggcG9ydCAyMjAwIHRvIHRoZSBzZXJ2ZXIgYXNzb2NpYXRl
ZA0KICAgIHdpdGggdHR5VlVBUlQwIHdlIHNldCB0aGUgc2FtZSBzb2NrZXQtaWQgdmFsdWUgaW4g
Ym90aCBmaWxlczoNCg0KQ2FuIHRoaXMgc29ja2V0LWlkIGJlIGFueSByYW5kb20gd29yZCBhbmQg
Y2FuIHRoaXMgYmUgc2FtZSBhY3Jvc3MgbXVsdGlwbGUNCkhvc3QgKGNsaWVudC9zZXJ2ZXIpIGNv
bmZpZ3VyYXRpb24uIEkgbWVhbiwgZG8gd2UgbmVlZCBkaWZmZXJlbnQgc29ja2V0LWlkIGZvcg0K
Y2xpZW50LjIyMDAgYW5kIGNsaWVudC4yMjAxIG9yIGl0IGNhbiBiZSBzYW1lLg0KICAgIA0KICAg
IGBgYA0KICAgICQgZ3JlcCBzb2NrZXQtaWQgL2V0Yy9vYm1jLWNvbnNvbGUvKi5jb25mDQogICAg
Y2xpZW50LjIyMDAuY29uZjpzb2NrZXQtaWQgPSBob3N0DQogICAgc2VydmVyLnR0eVZVQVJUMC5j
b25mOnNvY2tldC1pZCA9IGhvc3QNCiAgICBgYGANCiAgICANCiAgICBZb3UgY2FuIGFkZCBmdXJ0
aGVyIGluc3RhbmNlcyB0byB0aGUgc3lzdGVtIGJ5IGFkZGluZyBlLmcuDQogICAgY2xpZW50LjIy
MDEuY29uZiBhbmQgc2VydmVyLnR0eVZVQVJUMS5jb25mIGFuZCBzZXQgdGhlIHNhbWUgc29ja2V0
LWlkDQogICAgdmFsdWUgaW4gZWFjaC4gVGhpcyBicmluZ3MgdXMgdG8gdGhlIGlzc3VlIG9mIGdl
dHRpbmcgdGhlIGNsaWVudCBhbmQNCiAgICBzZXJ2ZXIgdXAgYW5kIHJ1bm5pbmcgLSB0aGV5IGFy
ZSBpbnRlZ3JhdGVkIGludG8gdGhlIHJ1bm5pbmcgc3lzdGVtDQogICAgdmlhIHRoZSB0d28gdGVt
cGxhdGUgc3lzdGVtZCBzZXJ2aWNlIHVuaXRzOiBvYm1jLWNvbnNvbGVALnNlcnZpY2UNCiAgICBh
bmQgb2JtYy1jb25zb2xlLXNzaEAuc2VydmljZToNCiAgICANCiAgICBgYGANCiAgICAkIGNhdCAv
bGliL3N5c3RlbWQvc3lzdGVtL29ibWMtY29uc29sZUAuc2VydmljZQ0KICAgIFtVbml0XQ0KICAg
IERlc2NyaXB0aW9uPSVpIENvbnNvbGUgU2VydmVyDQogICAgQ29uZGl0aW9uUGF0aEV4aXN0cz0v
ZXRjL29ibWMtY29uc29sZS9zZXJ2ZXIuJWkuY29uZg0KICAgIA0KICAgIFtTZXJ2aWNlXQ0KICAg
ICMgSW5zdGFuY2UgSUQgaXMgdGhlIFZVQVJUIGJhc2VuYW1lDQogICAgRXhlY1N0YXJ0PS91c3Iv
c2Jpbi9vYm1jLWNvbnNvbGUtc2VydmVyIC0tY29uZmlnIC9ldGMvb2JtYy1jb25zb2xlL3NlcnZl
ci4laS5jb25mICVpDQogICAgU3lzbG9nSWRlbnRpZmllcj0laS1jb25zb2xlLXNlcnZlcg0KICAg
IFJlc3RhcnQ9YWx3YXlzDQogICAgYGBgDQogICAgDQogICAgYGBgDQogICAgJCBjYXQgb2JtYy1j
b25zb2xlLXNzaEAuc2VydmljZQ0KICAgIFtVbml0XQ0KICAgIERlc2NyaXB0aW9uPUNvbnNvbGUg
Q2xpZW50IG9uICVpDQogICAgV2FudHM9ZHJvcGJlYXJrZXkuc2VydmljZQ0KICAgIEFmdGVyPWRy
b3BiZWFya2V5LnNlcnZpY2UNCiAgICANCiAgICBbU2VydmljZV0NCiAgICAjIFVuaXQgZGVmYXVs
dHMgdG8gYSB0ZW1wbGF0ZWQgc2VydmljZQ0KICAgIEVudmlyb25tZW50PSJEUk9QQkVBUl9SU0FL
RVlfRElSPS9ldGMvZHJvcGJlYXIiDQogICAgRW52aXJvbm1lbnRGaWxlPS9ldGMvZGVmYXVsdC9k
cm9wYmVhcg0KICAgIEVudmlyb25tZW50RmlsZT0tL2V0Yy9kZWZhdWx0L29ibWMtY29uc29sZS1j
bGllbnQNCiAgICBFeGVjU3RhcnQ9L3Vzci9zYmluL2Ryb3BiZWFyIC1yICR7RFJPUEJFQVJfUlNB
S0VZX0RJUn0vZHJvcGJlYXJfcnNhX2hvc3Rfa2V5IC1jICIvdXNyL2Jpbi9vYm1jLWNvbnNvbGUt
Y2xpZW50IC1jIC9ldGMvb2JtYy1jb25zb2xlL2NsaWVudC4laS5jb25mIiAtcCAlaSAtRiAkRFJP
UEJFQVJfRVhUUkFfQVJHUw0KICAgIFN5c2xvZ0lkZW50aWZpZXI9Y29uc29sZS1jbGllbnQtJWkN
CiAgICBFeGVjUmVsb2FkPS9iaW4va2lsbCAtSFVQICRNQUlOUElEDQogICAgS2lsbE1vZGU9cHJv
Y2Vzcw0KICAgIGBgYA0KICAgIA0KICAgIFdlIHJlYWxpc2UgdGhlIG9ibWMtY29uc29sZS1zc2hA
LnNlcnZpY2UgdGVtcGxhdGUgYnkgaW5zdGFsbGluZyBhDQogICAgb2JtYy1jb25zb2xlLXNzaEAy
MjAwLnNlcnZpY2Ugc3ltbGluayBhbmQgYWRkaW5nIGl0IHRvIHRoZSBkZWZhdWx0DQogICAgdGFy
Z2V0LiBXZSByZWFsaXNlIHRoZSBvYm1jLWNvbnNvbGVALnNlcnZpY2UgdGVtcGxhdGUgYnkgaW5z
dGFsbGluZw0KICAgIGEgY3VzdG9tIHVkZXYgcnVsZSB0byB0cmlnZ2VyIHRoZSBzdGFydCBvZiB0
aGUgc2VydmVyIG9uIHRoZSBhcHBlYXJhbmNlDQogICAgb2YgdGhlIGFzc29jaWF0ZWQgdHR5IGRl
dmljZSAodGhlIGBFTlZ7U1lTVEVNRF9XQU5UU309YCBhdHRyaWJ1dGVzKToNCiAgICANCiAgICBg
YGANCiAgICAkIGNhdCAvbGliL3VkZXYvcnVsZXMuZC82MS1hc3BlZWQtdnVhcnQucnVsZXMNCiAg
ICBTVUJTWVNURU09PSJ0dHkiLCBBVFRSU3tpb21lbV9iYXNlfT09IjB4MUU3ODcwMDAiLCBFTlZ7
U1lTVEVNRF9XQU5UU309Im9ibWMtY29uc29sZUB0dHlWVUFSVDAiIFNZTUxJTksrPSJ0dHlWVUFS
VDAiLCBUQUcrPSJzeXN0ZW1kIg0KICAgIFNVQlNZU1RFTT09InR0eSIsIEFUVFJTe2lvbWVtX2Jh
c2V9PT0iMHgxRTc4ODAwMCIsIEVOVntTWVNURU1EX1dBTlRTfT0ib2JtYy1jb25zb2xlQHR0eVZV
QVJUMSIgU1lNTElOSys9InR0eVZVQVJUMSIsIFRBRys9InN5c3RlbWQiDQogICAgYGBgDQogICAg
DQogICAgVGhpcyBzZXQgb2YgdWRldiBydWxlcyBjYW4gYmUgdXNlZCBnZW5lcmFsbHksIGFzIGR1
ZSB0byB0aGUNCiAgICBgQ29uZGl0aW9uUGF0aEV4aXN0cz0vZXRjL29ibWMtY29uc29sZS9zZXJ2
ZXIuJWkuY29uZmAgZGlyZWN0aXZlIGluDQogICAgb2JtYy1jb25zb2xlQC5zZXJ2aWNlIHdlIHdv
bid0IGF0dGVtcHQgdG8gcnVuIG9ibWMtY29uc29sZS1zZXJ2ZXINCiAgICB1bmxlc3MgdGhlIGFz
c29jaWF0ZWQgY29uZmlndXJhdGlvbiBmaWxlIGlzIGluc3RhbGxlZC4NCiAgICANCiAgICBZb3Ug
bWF5IHdhbnQgdG8gcmV2aWV3IHRoZSBmb2xsb3dpbmcgcGF0Y2hlcyB0byB1bmRlcnN0YW5kIGhv
dyB0bw0KICAgIGludGVncmF0ZSB0aGUgY29uZmlndXJhdGlvbnMgaW50byB5b3VyIG1hY2hpbmUn
cyBjb25maWd1cmF0aW9uIGluDQogICAgYml0YmFrZToNCiAgICANCiAgICBodHRwczovL3VybGRl
ZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJE
cHJvamVjdC54eXpfcV90b3BpYy0zQS0yNTIyY29uY3VycmVudC0yRGNvbnNvbGVzLTI1MjItMkIt
MjhzdGF0dXMtM0FvcGVuLTI1MjBPUi0yNTIwc3RhdHVzLTNBbWVyZ2VkLTI5JmQ9RHdJQkFnJmM9
NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tj
cklhcVU3VVNsNWcmbT00S3NBZ3RwZ2xNM3V5LXpRTnJMZXREc0FLMHRXWWE2anJKQnJQUFJlcjFB
JnM9TFJwRHZHSC1FZDU1MzE2OHVyTERMdUVwQTVaR1lYODlwRHdzYnZyR0RPVSZlPSANCiAgICAN
CiAgICBZb3UnbGwgbmVlZCBhIC5iYmFwcGVuZCBmaWxlIHdpdGggYSBkb19pbnN0YWxsX2FwcGVu
ZCgpIGluIHlvdXIgbWFjaGluZQ0KICAgIGxheWVyIHRvIGluc3RhbGwgdGhlIHJlc3Qgb2YgeW91
ciBjb25maWd1cmF0aW9uIGZpbGVzLg0KICAgIA0KICAgIE1vcmUgd29yayBuZWVkcyB0byBiZSBk
b25lIHRvIGhhbmRsZSB0aGUgY2FzZSB3aGVyZSB5b3VyIEJNQyBpbWFnZQ0KICAgIGNhdGVycyB0
byBtdWx0aXBsZSBwbGF0Zm9ybSBjb25maWd1cmF0aW9ucywgYnV0IHRoaXMgaXMgYXQgbGVhc3Qg
YSBzdGFydCB0bw0KICAgIGhhbmRsaW5nIG11bHRpcGxlIGNvbnNvbGUgc2VydmVycy4NCiAgICAN
CiAgICBIb3BlIHRoYXQgaGVscHMhDQogICAgDQogICAgQW5kcmV3DQogICAgDQoNCg==
