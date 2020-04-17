Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC421AE5BC
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 21:23:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493mGY5CLczDqSZ
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 05:23:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=13769785df=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HXsVve/O; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=I/xU2eXF; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493mCy74QFzDrhh
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 05:21:18 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HITMt1032158; Fri, 17 Apr 2020 11:42:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Zgw6caXpo6jr2/dwOCkiE3mTNmbZC+YYMm/9La0lfDo=;
 b=HXsVve/OpYA+okPRA4OtejoKxkSMetkphqgLqKlV0hbCTGV15kA21MRphbF3TE1i++b/
 IKzP13qmu6Qgmgp9YchV7/GCcipbHhuzZUkdgdczkIlkuFpDUlwaUKH1xSlgEw17FhVB
 PrmYFBvuuRrH505LUEIPgfVyHLtbU8Gy3jM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30ffg60xg4-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Apr 2020 11:42:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 17 Apr 2020 11:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvHZwwfJZt1espnYq1Pwt52nTzLzqH6H61yfGB6Oqa+b1c49EEnS7nHcsAxm+hrni7kPT+qOwiWvFqw7FUkeDhaeW05ySTyqBuJ7vus1ur1GYR4QXKddImxZFbNffVGBfhCD1gm0nu+8NGsXk3VCocyzaclZJpXmneLBLQ2UdsPKivY6oqCTWPOgroWi+Fo0+ykNIUQDKV9IhV/99SQE1ZHKiEkiKN1c7nWwRij1jCJkPt88G0wPym1e+tKTzOodeqKd+o23+FXMQ7a+rAJj/Gdmsf7TJYmz2gyow4ZUM4c1xAsSPfDjOswgOAopk4tmE/Pnu0HzvMDPP7Toih7xOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zgw6caXpo6jr2/dwOCkiE3mTNmbZC+YYMm/9La0lfDo=;
 b=EdlxttNvd+RM0Ax3nfbMe+TcpqzaRKtSaruxsjMjhbdSPtvvxj1BBsJWVj231YJXT+riqlZ7YwcCkzthYbSP3fuq0BHm3ZQSiHGUs80kBsUPRjlTHDircQv/yMFIROh0m1Zd1KzmAhsdjhv7mAkG2wcqSM5CFF3PvYUEaWOfe529RK5Ox/QBfJZkkj+uUYngKv5G4wEevuBgJooedZjROR4VaD3UGz5DVirCQAsZbHkuc+QOOuD2xs92twNLoakmZtXlN5n5McQ7mwiM1nH6Kmju4Sz1jZCqBtqCc4f3f7vg1H98chsiustyNzVdlkR8SUePEu07ZMQ6yX68k2rS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zgw6caXpo6jr2/dwOCkiE3mTNmbZC+YYMm/9La0lfDo=;
 b=I/xU2eXF7gw3VLKC5Iyo2cBXBuWBboIRA2AUjXJBf/9qjXUPWn1C0zX6OEQ8Z+ftpIEF5+UA8SVA8StoUMJprXELaTYx27EJ1urYx3g9PNvlruJbprMY3ND5L64DMxT3OIY8PmZB7VTwCLW+wSmOqkg4SQ4fAIRHncPp2wAx05s=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3127.namprd15.prod.outlook.com (2603:10b6:a03:b0::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Fri, 17 Apr
 2020 18:41:56 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 18:41:56 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4QgABf84CAAOO4gIAAerOAgADA2ACAAHcQAP//k1uA
Date: Fri, 17 Apr 2020 18:41:56 +0000
Message-ID: <24C73C51-BD4F-489B-A8CE-9DF805F9AAF0@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
 <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
 <B555CC60-3770-454E-813B-5F00783E97C7@fb.com>
 <CADKL2t6zJU_rQ+di7FNjjSHq=xo5ig=-u_GBrR51C6DaLQJ0-w@mail.gmail.com>
In-Reply-To: <CADKL2t6zJU_rQ+di7FNjjSHq=xo5ig=-u_GBrR51C6DaLQJ0-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6798]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c942653-0ff1-43a5-6e1e-08d7e2ff01b4
x-ms-traffictypediagnostic: BYAPR15MB3127:
x-microsoft-antispam-prvs: <BYAPR15MB3127C6927ADD901A91D11FB7DDD90@BYAPR15MB3127.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(39860400002)(396003)(346002)(136003)(2906002)(81156014)(2616005)(478600001)(4326008)(36756003)(3480700007)(5660300002)(8676002)(6916009)(86362001)(6506007)(91956017)(33656002)(53546011)(6486002)(7116003)(71200400001)(66946007)(66476007)(66556008)(316002)(64756008)(6512007)(8936002)(66446008)(54906003)(76116006)(186003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w5uJI2Aes+/+/QB8Gi28PPp52JGLPkqSH80gF7Z8Olqid1KH+GYeF02DJMzjYwBv3x24BiBfYsP0Ot+GrEiltOnNWiSkrhmuy7+p7CeRXWk6gqLtUyjBiPq2IVXN9O19Fre9hs/RBL5sXYjKLTefqmtURnEemZynkoG2VZVDvnxe0zzKIq5vGCHPxEXcvO1QXEZdc3OBVafWj07KxCdAFmXBCav4EuJVgtOT7wHarofyUigukr+MHE0zX6E4Tz5YTSZT1eL9bq3Lzp2fDVQqOD5ogX6g4We0DoUg2JS+CFNaRD25Bby1KMyQifPpDmkN9es0tiLyG3BKYWJ3aiQIBlVSM30oDB6OCOugbNV5xC1/mf6cKk8kHM7rtNZILepdIQ/5VoNowflvztOnnkdNKZGR0Jj/uHni3X25Gw7iOC+CZI95SNNcoTJsckvjw32m
x-ms-exchange-antispam-messagedata: AJU3Zs6TQP+EEQ3Ze3jGmbPPqe519scD0NltsNvBMpZjfHs8XTDpxjcyUODM3qJ284/g9DenVrfwjeQZvfDVYZW+sgNG4valHzjcxlR/OzszaL1uN81y4lCv9IaqaFpNTSlKJyTxKR8zx+/O1uOzYrvkPWB4c4S4nymXaKRNuyXNAF7sVjos4ZTWfLBCekc7
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3DEEA2E09268C4AB779A29046E8CA00@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c942653-0ff1-43a5-6e1e-08d7e2ff01b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 18:41:56.5946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iRfimig7uznDhi3KzSrIy88BBSa4HtWZJL7ZYBK7VAKyxMEB6E4Lv471vBhC1Gpvj1o3xQHHeSemrjWeMOR+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3127
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_08:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=797
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170142
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMTcvMjAsIDExOjExIEFNLCAiQmVuamFtaW4gRmFpciIgPGJlbmphbWluZmFp
ckBnb29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIEZyaSwgMTcgQXByIDIwMjAgYXQgMTE6MDUs
IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPg0K
ICAgID4NCiAgICA+IE9uIDQvMTYvMjAsIDQ6MzUgUE0sICJCZW5qYW1pbiBGYWlyIiA8YmVuamFt
aW5mYWlyQGdvb2dsZS5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+ICAgICBPbiBUaHUsIDE2IEFw
ciAyMDIwIGF0IDE2OjE1LCBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6
DQogICAgPiAgICAgPg0KICAgID4gICAgID4gQ3VycmVudGx5LCBkYnVzLXNlbnNvcnMgc3VwcG9y
dCByZWFkaW5nIE5WTUUgc2Vuc29ycyB2aWEgbWN0cCBvbmx5LiBJdCB1c2VzDQogICAgPiAgICAg
PiBsaWJtY3RwIGFuZCBzb21lIG9mIHNtYnVzIHBhdGNoIGZyb20gSW50ZWwuIEl0IGFsc28gdXNl
cyBzbGF2ZSBtcXVldWUgbWN0cA0KICAgID4gICAgID4ga2VybmVsIGRyaXZlciB3aGljaCBpcyBu
b3QgdXBzdHJlYW0uDQogICAgPiAgICAgPg0KICAgID4gICAgID4gU28gY3VycmVudGx5IGl0IGlz
IG5vdCBtYXR1cmVkIGFuZCBmdWxseSB1cHN0cmVhbWVkLg0KICAgID4gICAgID4NCiAgICA+ICAg
ICA+IEphbWVzLCBob3cgY2FuIHdlIHVzZSB0aGlzIHdpdGhvdXQgbWN0cC4gSSBkb24ndCBzZWUg
YW55IG5vbiBtY3RwIHN1cHBvcnQgbGlrZQ0KICAgID4gICAgID4gU2VuZGluZyBkaXJlY3Qgc21i
dXMgY29tbWFuZCwgcGxlYXNlIGFkdmlzZSBpZiBJIG1pc3NlZCBpdC4NCiAgICA+DQogICAgPiAg
ICAgSWYgeW91IHdhbnQgdG8gdXNlIE5WTUUtTUkgd2l0aG91dCBNQ1RQLCB0aGlzIHVzZSBjYXNl
IGlzIHN1cHBvcnRlZCBieQ0KICAgID4gICAgIHBob3NwaG9yLW52bWUuIEl0IG1ha2VzIGRpcmVj
dCBTTUJ1cyBjYWxscy4NCiAgICA+DQogICAgPiBCZW4sIHRoYW5rcyBJIHNlZSB0aGF0IGJ1dCBp
dCBuZWVkcyBjZXJ0YWluIEdQSU9zIGxpa2UgUHdyR2QsIHByZXNlbmNlIGFuZCBJIGFtIHRyeWlu
ZyB0byBmaW5kIGlmDQogICAgPiBPdXIgcGxhdGZvcm0gc3VwcG9ydCBhbnkgc3VjaCBHUElPcy4N
CiAgICANCiAgICBJZiB5b3VyIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSB0aGVzZSBHUElPcywgd2Ug
c2hvdWxkIGJlIGFibGUgdG8gbWFrZQ0KICAgIHBob3NwaG9yLW52bWUgbW9yZSBmbGV4aWJsZSBh
bmQgbm90IHJlcXVpcmUgdGhlbS4gSXQgd2FzIGRlc2lnbmVkIGZvcg0KICAgIG9uZSBzeXN0ZW0g
YXQgZmlyc3Qgd2l0aCB0aGUgZXhwZWN0YXRpb24gdGhhdCBpdCBjb3VsZCBiZWNvbWUgbW9yZQ0K
ICAgIGdlbmVyYWwgb3ZlciB0aW1lLg0KDQpDb29sLCBUaGF0IHdpbGwgYmUgZ3JlYXQuIEkgYWxz
byBkb24ndCBzZWUgcmVjaXBlIGZpbGUgZm9yIHRoaXMuIEFuZCBob3cgZWFzeS9oYXJkIHRvIGlu
dGVncmF0ZSB0aGlzDQp3aXRoIGVudGl0eSBtYW5hZ2VyIGFzIHdlIHVzZSBlbnRpdHkgbWFuYWdl
ciB0byBsaXN0IGFsbCBzZW5zb3JzLiANCiAgICANCiAgICA+DQogICAgPiAgICAgPg0KICAgID4g
ICAgID4gUmVnYXJkcw0KICAgID4gICAgID4gLVZpamF5DQogICAgPiAgICAgPg0KICAgID4gICAg
ID4NCiAgICA+DQogICAgPg0KICAgIA0KDQo=
