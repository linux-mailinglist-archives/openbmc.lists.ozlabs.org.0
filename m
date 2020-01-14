Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7813B574
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 23:48:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47y5Gk6WQwzDqS5
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 09:48:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=82828750e8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=PLN2Jl01; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=NyYTpdUg; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47y5G20PgCzDqGL
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 09:48:07 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EMh3St027384; Tue, 14 Jan 2020 14:48:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=k8+/sD/Owu9scRauVyVkVyxQrm8b5Kt/zneWY1zXTDY=;
 b=PLN2Jl017jy/zK01zzZYwhCX3a5bRVa15GIHo1mXL14d+2W7cQWVm0Ws9JYp2MEHfF9Y
 n7Hz18tJ9MRol7LsUp8tPSOKrstfBAe2naDS9E75iG8XguJfbgcdMk05kv65T/uJRmf6
 lsqkS5gFlxdkzSeJG5dlE1SrbNSjvwt4JNc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xhaj2bxg0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Jan 2020 14:48:02 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Jan 2020 14:48:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap9tdUpZcX4azcANtdELYcLLCVGibyOT9tfuQcAJSlL7pMtxwH8GcCuaXECRaMk0C2uigETknZRkv06ibXNfzPN/IlAF0itelex687vE+SQpR0x74XpPIm33m3P17aV44cUsbLrT9fypz/5UmtMYtiORCltAM8TNhy3QWc3jziE+XKS49mnDFdJdThVuaTgBv5OS6ghJLaKSxDDHBYOuZ4449TqDoj2SEWjTCeY/rCxpt9X1oGJMyDgtz7mUHnTDMY0Y3k/NnThPQq0HQrf81/Ghu6ERJp0zq/dg/Ynw5gI4ER7t7RTnDui08sicvyTS9pOFJC4CsS9XMro5VRYKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8+/sD/Owu9scRauVyVkVyxQrm8b5Kt/zneWY1zXTDY=;
 b=UBawe3XhzHplHJZnYNN0RQkbEY7Eh7gwvJPwgwDUV0uXKU2nzCPvru71h5MEQIrIFF6Lv53NUfl6xsXcmA5YD72lHbSYzS2nNzQIsdJMwaj8toNUGr8NKa4yU/gX6FsJYSgfKlBoBEnxXJz7ZcyGBpjfca8RvLOQH3A1g9kTTgbNUDyYx0hNfB/79Hnx+s7u1H2zprvSalABizCemgbI0/fEazjbwWI+K3CabYWGv3c8YV5jieVPuXt2djF9sG2eHgVMu4yGS1cwpSs8a/5pVP7pQHI61EekyH0jQeS+iMIwtgfPo+RJOYu2yUKt+i6YyWz3+JvS8sMUN6qvlgZ/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8+/sD/Owu9scRauVyVkVyxQrm8b5Kt/zneWY1zXTDY=;
 b=NyYTpdUg8DNiUCN93W4XmK6FuTAvLFew6I4jtUMuzj2F9ZiW8AT1aB/18O1cgxPPDwnNCyPnd48F5zm9HaqD75oHIvymr03g+gIl/rkhXGiRW7HqP10beBfVaqQ6xu5M/hJpYxK/HPKNBu8jBcOE6m87zPLpdgXWQStH0AZXj3Q=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1486.namprd15.prod.outlook.com (10.173.228.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Tue, 14 Jan 2020 22:48:00 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.015; Tue, 14 Jan 2020
 22:48:00 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "anoo@linux.ibm.com" <anoo@linux.ibm.com>, Patrick Williams
 <patrickw3@fb.com>
Subject: Simple Bios upgrade
Thread-Topic: Simple Bios upgrade
Thread-Index: AQHVyyyruP8+vJEYgkKITQfMhp8owQ==
Date: Tue, 14 Jan 2020 22:47:59 +0000
Message-ID: <3C65625D-8764-4A99-9CA8-22ACDB5E770C@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:92b4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97ef04a3-f49f-41e6-072f-08d79943ce6b
x-ms-traffictypediagnostic: MWHPR15MB1486:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB1486336A8AB90AFAE1FA3AB0DD340@MWHPR15MB1486.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(366004)(39860400002)(396003)(199004)(189003)(8676002)(6486002)(66476007)(81156014)(76116006)(110136005)(4326008)(6636002)(478600001)(66946007)(36756003)(316002)(81166006)(3480700007)(64756008)(66446008)(2906002)(8936002)(66556008)(7116003)(86362001)(5660300002)(71200400001)(9326002)(966005)(33656002)(6506007)(2616005)(6512007)(186003)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1486;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rvo8rg+iqClHCr7CtvItOAvLMV/39O2lHkVRGPkdk5e3aYeIj12GHR/MNfJhbA2ju3cID+Tm/wF1kNTZM6k3ZSObJfG5qv6rWqLNnjx906+d7mQ69bwAi0/m26mDcUo/KbXWgkjrY43m26CVZHA4tR94K4nDjdSn4az7Zf/lyXExUeX7SG5nBpzQ5UfEP8EQoDWXXJt+B/kxBHTuxdu3cTEmiALECKFnD8QL4qTwf6mYg8UU5UqfiEoCUEMmQwgGrQyfur9cRQxGjNskbrU6HqYtK0pHoRtTLalhG5NXPA9Gi4rQ9VSb2LSIU1JcY53qggjTJ0/Df0CdWL4Gn248jn8Rn/bHtQUKMRkWAQ5zWaBQSGbZwCRy4gWWnvappP5VKVES04MQPv3n4K0ciuZczN/6sTdbtp5HUt/GwBkVTV5DZss3329RHtvb8XL07/aqQs9bXZf9Gb/vApuQBK+N8Swz6JC8eVup9xA9YBCciK4=
Content-Type: multipart/alternative;
 boundary="_000_3C65625D87644A999CA822ACDB5E770Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ef04a3-f49f-41e6-072f-08d79943ce6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 22:47:59.8475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a90I62CPdRJHZEOZJHclmJg0amKBGrT1tZwAAy3LieVEulAP7MFDEBa0FB4u7fKxGIPcmeL4Zi+oZvvAIbGTSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1486
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_06:2020-01-14,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1011
 mlxlogscore=439 priorityscore=1501 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001140175
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

--_000_3C65625D87644A999CA822ACDB5E770Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5vbywNCkkgaGF2ZSBhZGRlZCBhIHNpbXBsZSBCaW9zIHVwZ3JhZGUgdG8gQk1DIHVwZGF0
ZXIsIGl0IHNpbXBseSB0YWtlcyBpbWFnZSBzYW1lIGxpa2UgQk1DIGFuZCBhbHNvIGV4cGVjdCBh
IHN5c3RlbSB1bml0IGZpbGUgZm9yIHVwZ3JhZGluZyBpbWFnZS4gQ3VycmVudGx5LCBpdCBkb2Vz
buKAmXQgZG8gYW55IHZlcnNpb24gbWFuYWdlbWVudCBvciBpbWFnZSB2ZXJpZmljYXRpb24gYnV0
IEkgd2lsbCBhZGQgdGhvc2UgZmVhdHVyZSBhcyB3ZWxsIGluIGZ1dHVyZS4gVXNlIGNhbiBjYWxs
IHRoZWlyIHBsYXRmb3JtIHNwZWNpZmljIHNjcmlwdHMgaW4gc3lzdGVtIHVuaXQgZmlsZS4gUGxl
YXNlIGhhdmUgYSBsb29rIGluIGJlbG93IGdlcnJpdCBwYXRjaC4NCg0KDQpodHRwczovL2dlcnJp
dC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1ibWMtY29kZS1tZ210Lysv
Mjg0NTcNCg0KDQoNCklmIGl0IGlzIGNvbmZsaWN0aW5nIHdpdGggb3BlbnBvd2VyLXBub3ItY29k
ZS1tZ210IHRoZW4gSSBjYW4gZGVmaW5lIGEgbmV3IFZlcnNpb25QdXJwb3NlIGFzIEJpb3MgaW5z
dGVhZCBvZiB1c2luZyBIb3N0LiBQbGVhc2UgcHJvdmlkZSB5b3VyIG9waW5pb24uDQoNCg0KDQpS
ZWdhcmRzDQoNCi1WaWpheQ0KDQo=

--_000_3C65625D87644A999CA822ACDB5E770Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <1F054DCAAA163942BA1C117E05CD8310@namprd15.prod.outlook.com>
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
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLWNv
bXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93
dGV4dDt9DQpwLnAxLCBsaS5wMSwgZGl2LnAxDQoJe21zby1zdHlsZS1uYW1lOnAxOw0KCW1hcmdp
bjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZTo4LjVwdDsNCglmb250
LWZhbWlseTpNZW5sbzsNCgljb2xvcjpibGFjazt9DQpzcGFuLnMxDQoJe21zby1zdHlsZS1uYW1l
OnMxO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtz
aXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2
LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFk
Pg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxk
aXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQW5vbyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBoYXZlIGFk
ZGVkIGEgc2ltcGxlIEJpb3MgdXBncmFkZSB0byBCTUMgdXBkYXRlciwgaXQgc2ltcGx5IHRha2Vz
IGltYWdlIHNhbWUgbGlrZSBCTUMgYW5kIGFsc28gZXhwZWN0IGEgc3lzdGVtIHVuaXQgZmlsZSBm
b3IgdXBncmFkaW5nIGltYWdlLiBDdXJyZW50bHksIGl0IGRvZXNu4oCZdCBkbyBhbnkgdmVyc2lv
biBtYW5hZ2VtZW50IG9yIGltYWdlIHZlcmlmaWNhdGlvbg0KIGJ1dCBJIHdpbGwgYWRkIHRob3Nl
IGZlYXR1cmUgYXMgd2VsbCBpbiBmdXR1cmUuIFVzZSBjYW4gY2FsbCB0aGVpciBwbGF0Zm9ybSBz
cGVjaWZpYyBzY3JpcHRzIGluIHN5c3RlbSB1bml0IGZpbGUuIFBsZWFzZSBoYXZlIGEgbG9vayBp
biBiZWxvdyBnZXJyaXQgcGF0Y2guPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9InMxIj48YSBocmVmPSJodHRw
czovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1ibWMtY29k
ZS1tZ210LyYjNDM7LzI4NDU3Ij5odHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mv
b3BlbmJtYy9waG9zcGhvci1ibWMtY29kZS1tZ210LyYjNDM7LzI4NDU3PC9hPjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9InMxIj48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJzMSI+SWYgaXQgaXMg
Y29uZmxpY3Rpbmcgd2l0aCBvcGVucG93ZXItcG5vci1jb2RlLW1nbXQgdGhlbiBJIGNhbiBkZWZp
bmUgYSBuZXcgVmVyc2lvblB1cnBvc2UgYXMgQmlvcyBpbnN0ZWFkIG9mIHVzaW5nIEhvc3QuIFBs
ZWFzZSBwcm92aWRlIHlvdXIgb3Bpbmlvbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0icDEiPjxzcGFuIGNsYXNzPSJzMSI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9InAxIj48c3BhbiBjbGFzcz0iczEiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJzMSI+LVZpamF5PC9zcGFuPjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_3C65625D87644A999CA822ACDB5E770Cfbcom_--
