Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD81444B2
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 19:58:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482Hr90TY3zDqS2
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 05:58:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8289fa29e8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=XMBD3E5z; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=epTbXbfi; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482HqD2KkMzDqLx
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 05:57:58 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LItj8H019916; Tue, 21 Jan 2020 10:57:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=CkQtBLb6ewpH4YvUykZFJNF47uwHLP5YPGArJu/P6iI=;
 b=XMBD3E5zUG1Wa1YOJZhPd2T7XwMFlEoE5Ux+SUEc4RnlxUuld1Zvv4f8V8VMapMhC+Yl
 v/EobC7xUMMewxq+38bDQU+7syf+/ehuuJSdgtSdy+rP4sMS7dUqXTurPDM8ibOkG2eu
 yBzKl0pOR+suFjH5ayL4eDCnDCsEcX+EPZw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2xnwtvjh46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jan 2020 10:57:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 21 Jan 2020 10:57:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTbrNwhsoOv3FAW4mV6KQ2a40nv1RgaQsIedh/v30NYtNvnYkFUkOlynrd4d2oUYix13M1BrxnTVFhcrk7cf7wEsgZxd/8aT7SBvHimlcu0IOcndybfSXon4QaXNkA2+5w+WGLpMsqY5GPOsPZwHlD0itT369/bDBO042KwfmxxmIeOt0GgZSCFw5sYhODA091FI8bpCC/wrjVclYWzf2u2G3jYTVWFk5Wfxoy+1gBzandKjlFziqPYpBPwdAuvzHervmU60kFhOVHTz11d3ba5kyGMcxOvPzZArwlIJvcsnWRBFLz2g/lOqHZtXNUy2Rkvhv/jgSsxHJkB5ti3q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkQtBLb6ewpH4YvUykZFJNF47uwHLP5YPGArJu/P6iI=;
 b=iwcIw7axT9BrWWqDdThDRVc73/+RsYlKhNtpO4uGIETkH0NLvT/cjW/HkXwDlGvyhGeuVCAzYkFpcsR9tocRdLPDzRjDa3D6b5BX9dGw5llMHa5q2Q1Eu7ZNgFF7XDjrvbJWjeuL1CpkLsdnX62cyMXqwQQxUJu1u+CCy0wRFcDu56a19dNrLKDTcipKPKH4Zxsoq35xvvbBkMZNIwqvbGYULkxEKpvntDpk+5IqjZ/Dm0By1pZBtjkaNMcOSKmV6Vt+ofTLUPq5v8XphWvtFymv9KXP4RwcD7ehXSwYbkPeTHe8JrdZIzpAlVQk78Ixhhd5Vtt8aaMFXSHJgm3WFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkQtBLb6ewpH4YvUykZFJNF47uwHLP5YPGArJu/P6iI=;
 b=epTbXbfiGbmIMOQbMIbC3ZdRvC6PN0uC3ywxEIUhbjtWhQ10jRazYFc5mM+NONiyc50nfz7vG4dF4Nv9Np4bo2Kg1Yfdf94IzXD5WvqUibdMnYZ10Uprw8kcbLLK7ZZx9kaFWP0DluMZl8/ptdDiwccyVYtXaaji38k/6hA5fRs=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1807.namprd15.prod.outlook.com (10.174.255.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Tue, 21 Jan 2020 18:56:54 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 18:56:54 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Neeraj Ladkani <neladk@microsoft.com>, "Lawniczak, Maciej"
 <maciej.lawniczak@intel.com>, CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Bios upgrade from BMC
Thread-Topic: Bios upgrade from BMC
Thread-Index: AQHVzWj+/fCWvtojz0ygzOBgRdR4d6fyxkbggABfJ9CAAASioIABiWJggABEt4A=
Date: Tue, 21 Jan 2020 18:56:53 +0000
Message-ID: <417F2EE5-BCC2-4C9B-8CA6-684DEB65036C@fb.com>
References: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
 <HK0PR03MB4068EAA62EDF7CE6C1866306AE320@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <HK0PR03MB512308F0575110E4A0FEC5C2DF320@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <DM5PR1101MB233234E1A586D2870AF10EF286320@DM5PR1101MB2332.namprd11.prod.outlook.com>
 <CH2PR21MB1510B787B3B07F41ABD6DDDAC80D0@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB1510B787B3B07F41ABD6DDDAC80D0@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-21T06:53:35.1977203Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=56e7adb4-ff28-4ad8-8482-f83948658e18;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2620:10d:c090:200::2:8d24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c646923-32fe-4afd-decb-08d79ea3ae94
x-ms-traffictypediagnostic: MWHPR15MB1807:
x-microsoft-antispam-prvs: <MWHPR15MB1807A05E385D7D8D0298F983DD0D0@MWHPR15MB1807.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(316002)(33656002)(110136005)(2616005)(81156014)(2906002)(8676002)(8936002)(6506007)(53546011)(36756003)(3480700007)(81166006)(478600001)(45080400002)(966005)(66476007)(186003)(64756008)(76116006)(66556008)(6512007)(66446008)(6486002)(66574012)(71200400001)(86362001)(5660300002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1807;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLuXj7PJ/7KVj8hGeyBjlNRUkwdRpnbCl/u1SWO5YqdJE7ojIG2qFk3YbygSrcdTv/OduxzbvYqt9R3raSuxGaa95UxMLFjfI+5lMiQxmOs44ZmT54LFf36T9tuYT0xguIsolMJWp7mxmLEJlWWMEIu5DPZ/N/hUesuMHvL7CABpaNpSk3eR6br6f8MdN9SBEu6INeb+TqZN4024ibZtLsk184RT5LNs4k2bBnJ1Rq7X5I0J0IrZ0bJFNRNO0JLRvVh+UUkQrQzK/N1ZLiqulojt9ayssYb7mp6B7ULBIdJiA41Ttd2spCOtIuyqhYH2Fko6w+C0ewlFsEg3i47iLt0BPhLNDFhKXc/zfdqtv1QCXgXN8UoW6PZixqvfxJENJU/WbBavfqdNA/TDg32Sj0hfmzZ8HisXbdWQCmPx85UMdF0Ak+cNTAPb6k8aI+uj38rQsMkCWOW1M5hpDgbqBAwjbCAeq4vKcvGPQjf3m7FzFdCyCFvJDW2SgrGUrvEXkIv1nA+ROh3i42WWPDjBvw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B53CF508AFADA4408757D26F7828CF90@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c646923-32fe-4afd-decb-08d79ea3ae94
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 18:56:54.0295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /o1QCLg5h16mvnDHKl0n44MG0MdXTDUqdXrCGrsk4htBzNXlJX8EwbZcana54c+vKk4bbzaiq+aO7UpTZ8cMeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1807
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.634
 definitions=2020-01-21_06:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210141
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

DQrvu79PbiAxLzIwLzIwLCAxMDo1NCBQTSwgIk5lZXJhaiBMYWRrYW5pIiA8bmVsYWRrQG1pY3Jv
c29mdC5jb20+IHdyb3RlOg0KDQogICAgVmlqYXksIA0KICAgIA0KICAgIC0gSG93IGFyZSB5b3Ug
YWJsZSB0byBkZXRlcm1pbmUgZmxhc2ggcmFuZ2VzIHVzZWQgYnkgVUVGSSBpbiBjYXNlIHdlIG1h
eSBub3Qgd2FudCB0byB1cGRhdGUgTUUgYnV0IG9ubHkgVUVGSSByZWdpb25zPyAgDQpJIGFtIG5v
dCBkZWZpbmluZyBhbnkgcmFuZ2UgaW4gZmxhc2guIEN1cnJlbnRseSBpdCBpcyBqdXN0IGdvaW5n
IHRvIHVzZSBmbGFzaGNwIGNvbW1hbmQgdG8gZmxhc2ggaW1hZ2UuIEkgY2FuIGFjY2VwdCB0aGlz
IGZpbmFsIHN0YWdlIG9mIGZsYXNoaW5nIGFzIHN5c3RlbSB1bml0IGZpbGUgb3IgY29tbWFuZCB0
aHJvdWdoIGNvbmZpZyBvcHRpb24uDQoNCiAgICAtIEhvdyBpcyB0aGlzIGludGVyZmFjZWQgZnJv
bSByZWRmaXNoL0lQTUkgPyANCkl0IHdpbGwgaW50ZXJmYWNlIHNhbWUgYXMgQk1DIHVwZ3JhZGUu
IENvbnNpZGVyaW5nIHJlZGZpc2gvSVBNSSBvbmx5LCBJIGFtIGNvbnNpZGVyaW5nIHRoaXMgdGhp
cyBhcyBhIHBhcnQgb2Ygc2FtZSBpbWFnZSB1cGRhdGVyLg0KICAgIA0KICAgIElzIHRoZXJlIGFu
eSBkZXNpZ24gZG9jdW1lbnQgZm9yIHRoaXMgZmVhdHVyZSB0aGF0IHdlIGNhbiByZXZpZXc/IA0K
Tm8sIFRoZXJlIGlzIG5vIGRlc2lnbiBkb2N1bWVudCBqdXN0IGJlbG93IHN0ZXBzIGFuZCB3YW50
ZWQgdG8gY2hlY2sgaWYgaXQgaXMgYSBjb21tb24gc2VxdWVuY2UgZXZlcnlvbmUgdXNlIG9yIHdl
IG5lZWQgc29tZSBmbGV4aWJpbGl0eS4NCiAgICANCiAgICBOZWVyYWoNCiAgICANCiAgICANCiAg
ICBGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdC5jb21AbGlz
dHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIExhd25pY3phaywgTWFjaWVqDQogICAgU2VudDog
U3VuZGF5LCBKYW51YXJ5IDE5LCAyMDIwIDExOjM1IFBNDQogICAgVG86IENTMjAgQ1RDY2hpZW4g
PENUQ0NISUVOQG51dm90b24uY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBWaWpheSBL
aGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCiAgICBTdWJqZWN0OiBbRVhURVJOQUxdIFJFOiBC
aW9zIHVwZ3JhZGUgZnJvbSBCTUMNCiAgICANCiAgICBIaSBNZWRhZCwNCiAgICANCiAgICBUbyBz
ZXQgdXAgTUUgaW4gUmVjb3ZlcnkgbW9kZSB1c2UgSVBNSSBjb21tYW5kIOKAnEZvcmNlIE1FIFJl
Y292ZXJ54oCdIOKAkyBERmggKGJ5dGU0PTAxaCkNCiAgICBUbyBzZXQgdXAgTUUgaW4gT3BlcmF0
aW9uYWwgYWdhaW4gdXNlIElQTUkg4oCcQ29sZCBSZXNldOKAnSBjb21tYW5k4oCdIOKAkyAwMmgN
CiAgICANCiAgICBGb3IgbW9yZSBkZXRhaWxzIGNoZWNrOiBodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tXy0zRnVybC0zRGh0dHBzLTI1M0EtMjUyRi0yNTJGd3d3LmludGVsLmNvbS0y
NTJGY29udGVudC0yNTJGZGFtLTI1MkZ3d3ctMjUyRnB1YmxpYy0yNTJGdXMtMjUyRmVuLTI1MkZk
b2N1bWVudHMtMjUyRnRlY2huaWNhbC0yRHNwZWNpZmljYXRpb25zLTI1MkZpbnRlbC0yRHBvd2Vy
LTJEbm9kZS0yRG1hbmFnZXItMkR2My0yRHNwZWMucGRmLTI2ZGF0YS0zRDAyLTI1N0MwMS0yNTdD
bmVsYWRrLTI1NDBtaWNyb3NvZnQuY29tLTI1N0NhZGMxNWNmMDE0OGU0MzIxMTBiNTA4ZDc5ZDdi
NmEzOC0yNTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDctMjU3QzEtMjU3QzAtMjU3
QzYzNzE1MTAyNjI4OTEyNjk0NS0yNnNkYXRhLTNEMlRMSHdDc1hNSzJ2Zy0yNTJGZkJNcktJUHlO
b1BVRzUyUmpZcTMzcHJwOXhwc2MtMjUzRC0yNnJlc2VydmVkLTNEMCZkPUR3SUdhUSZjPTVWRDBS
VHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFV
N1VTbDVnJm09NVBiM0o4Unl1MXdQXzNqQ3pWbHhBYnV0cVVkMG1uaUpqUkM1amxjbDBtZyZzPWU0
VFFoRUY3UDlQM3BqRDFxYzhjWjRHNF9ncWkteUFpR2VlOXBUSFV1TnMmZT0gDQogICAgDQogICAg
UmVnYXJkcywNCiAgICBNYWNpZWoNCiAgICBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQogICAgSGkgVmlqYXksDQogICAgDQogICAgSSB0cnkgdG8gdXBncmFkZSBCSU9T
IGZyb20gQk1DLCBidXQgSSBkbyBub3Qga25vdyBob3cgdG8gc2V0IHRoZSBtb2RlIG9mICBNRS9O
TS4NCiAgICBDYW4geW91IHNoYXJlIHRoZSBwcm9jZXNzIGhvdyB5b3Ugc2V0IE1FL05NIHRvIHJl
Y292ZXJ5IG1vZGUgYW5kIG9wZXJhdGlvbiBtb2RlPw0KICAgIA0KICAgIFRoYW5rcy4NCiAgICAN
CiAgICBCLlIuDQogICAgTWVkYWQNCiAgICANCiAgICBGcm9tOiBWaWpheSBLaGVta2EgPG1haWx0
bzp2aWpheWtoZW1rYUBmYi5jb20+DQogICAgVG86IE9wZW5CTUMgTWFpbGxpc3QgPG1haWx0bzpv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQogICAgU3ViamVjdDogQmlvcyB1cGdyYWRlIGZyb20g
Qk1DDQogICAgDQogICAgSGksDQogICAgSSBhbSB3cml0aW5nIGFuIGFwcGxpY2F0aW9uIGZvciBC
aW9zIHVwZ3JhZGUuIEN1cnJlbnRseSBJIGhhdmUgY3JlYXRlZCBhIGhvb2sgdG8gb3VyIGJtYyB1
cGRhdGVyIHdoaWNoIGV4cGVjdHMgYSBzeXN0ZW1kIHVuaXQgZmlsZSB0byBiZSBydW4gYXQgdGhl
IHRpbWUgb2YgYWN0aXZhdGluZyB1cGRhdGUuIEJ1dCBJIGFtIHRoaW5raW5nIG9mIGFkZGluZyBz
b21lIG9mIHRoaXMgdW5pdCBmaWxlIGZ1bmN0aW9uYWxpdHkgaW4gdXBkYXRlciBpdHNlbGYgYW5k
IHdhbnRlZCB0byBydW4gYnkgeW91IGFsbCBpZiBpdCBpcyBjb21tb24gcHJvY2VkdXJlIHVzZWQg
YnkgZXZlcnkgcGxhdGZvcm0uIEJlbG93IGFyZSB0aGUgcHJvY2VzcyB3ZSB1c2UgaW4gb3VyIHBs
YXRmb3JtIGFzIGEgcGFydCBvZiBiaW9zIHVwZ3JhZGUuDQogICAgDQogICAgMS4gUG93ZXIgb2Zm
IGhvc3Qgc2VydmVyLg0KICAgIDIuIFNldCBNRS9OTSAoTWFuYWdlbWVudCBlbmdpbmUgb3IgTm9k
ZSBtYW5hZ2VyIGluIHg4NikgdG8gcmVjb3ZlcnkgbW9kZQ0KICAgIDMuIEZsaXAgR1BJTyB0byBh
Y2Nlc3MgU1BJIGZsYXNoIHVzZWQgYnkgaG9zdC4NCiAgICA0LiBCaW5kIHNwaSBkcml2ZXIgdG8g
YWNjZXNzIGZsYXNoDQogICAgNS4gRmxhc2hjcCBpbWFnZSB0byBkZXZpY2UuDQogICAgNi4gVW5i
aW5kIHNwaSBkcml2ZXINCiAgICA3LiBGbGlwIEdQSU8gYmFjayBmb3IgaG9zdCB0byBhY2Nlc3Mg
U1BJIGZsYXNoDQogICAgOC4gU2V0IE1FL05NIHRvIG9wZXJhdGlvbmFsIG1vZGUNCiAgICA5LiBQ
b3dlciBvbiBzZXJ2ZXIuDQogICAgDQogICAgSSBjYW4gaGF2ZSBzb21lIGZsZXhpYmlsaXR5IGlu
IHRoaXMgc2VxdWVuY2UgYmFzZWQgb24gZWFjaCBwbGF0Zm9ybSBjb25maWd1cmF0aW9uLiBMb29r
aW5nIGZvcndhcmQgdG8geW91ciBzdWdnZXN0aW9ucy4NCiAgICANCiAgICBSZWdhcmRzDQogICAg
LVZpamF5DQogICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KICAg
IFRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5k
aWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBu
b3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3Bv
bnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNl
IGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxl
dGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVy
IGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQg
aXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZv
cm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3Jt
YXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBv
ZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBi
eSBOdXZvdG9uLiANCiAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAgICBJbnRlbCBUZWNobm9sb2d5IFBvbGFu
ZCBzcC4geiBvLm8uDQogICAgdWwuIFPFgm93YWNraWVnbyAxNzMgfCA4MC0yOTggR2RhxYRzayB8
IFPEhWQgUmVqb25vd3kgR2RhxYRzayBQw7PFgm5vYyB8IFZJSSBXeWR6aWHFgiBHb3Nwb2RhcmN6
eSBLcmFqb3dlZ28gUmVqZXN0cnUgU8SFZG93ZWdvIC0gS1JTIDEwMTg4MiB8IE5JUCA5NTctMDct
NTItMzE2IHwgS2FwaXRhxYIgemFrxYJhZG93eSAyMDAuMDAwIFBMTi4NCiAgICBUYSB3aWFkb21v
xZvEhyB3cmF6IHogemHFgsSFY3puaWthbWkgamVzdCBwcnplem5hY3pvbmEgZGxhIG9rcmXFm2xv
bmVnbyBhZHJlc2F0YSBpIG1vxbxlIHphd2llcmHEhyBpbmZvcm1hY2plIHBvdWZuZS4gVyByYXpp
ZSBwcnp5cGFka293ZWdvIG90cnp5bWFuaWEgdGVqIHdpYWRvbW/Fm2NpLCBwcm9zaW15IG8gcG93
aWFkb21pZW5pZSBuYWRhd2N5IG9yYXogdHJ3YcWCZSBqZWogdXN1bmnEmWNpZTsgamFraWVrb2x3
aWVrIHByemVnbMSFZGFuaWUgbHViIHJvenBvd3N6ZWNobmlhbmllIGplc3QgemFicm9uaW9uZS4N
CiAgICBUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVu
dGlhbCBtYXRlcmlhbCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQo
cykuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0
IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzOyBhbnkgcmV2aWV3IG9yIGRpc3RyaWJ1
dGlvbiBieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4NCiAgICANCiAgICANCg0K
