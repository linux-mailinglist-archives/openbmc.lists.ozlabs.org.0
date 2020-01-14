Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28B13B20F
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 19:26:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xzRl4T8ZzDqS6
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 05:26:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=82828750e8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=ns4RGOiq; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=VlVmmS6H; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xzQg25rQzDqQY
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 05:25:10 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EILsox014787; Tue, 14 Jan 2020 10:25:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XYCr0x+vnyR9Oudpj6n6W8gZHAgXdmE/lf0x5QNIVPE=;
 b=ns4RGOiqevn9d45gFJLAnzsXYeicMN9hwaR5amat9Wj2/nvlAZbDTi9BTQe6dOGDzk9c
 cNO/yurKiHliEgFVlEfgZpnMb3JI6AlJyn3bjtDcEZ+08B9UjrwuROsj5kuwhIaNLC/u
 9UtzHDZ443CXPz3cbDJWexUqrpJzVqr0pk4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xhd7r1v71-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Jan 2020 10:25:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Jan 2020 10:25:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi1cModLA41ez0TAtb6bLYNea5usO/jIaam/cixjlwzF+Msfmiu2M6dam3IgxiK5JyA5PjhStLQmehXUNqhfxDCHnOYPsk2TldKw1a3jlyKUnnZsjVR8IOrhdop/q5Wo63Z6ptv44vJOR4Brb0BVQqVvKIXGVL17AIddGUj35PCi2eXR30K7PI+ZNBVAsGdx4k6t4x3ipc8KZiIxMQzAcTbNHB+ebGR8bI3CFDKulryEt5bOFBcatd2xGT482jpfDgWNHJOva4L5h7lb0QYhxVqmdW6hm+ePvJ3vmx7+7WD3QBXJqEHul0qVg8hUwVNocSP3TnmVN+jbH+cl69zDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYCr0x+vnyR9Oudpj6n6W8gZHAgXdmE/lf0x5QNIVPE=;
 b=KJ3ZMISEJTNkzMiW/0XdunhjjgjB5v38Qs+7y1hrzEDm+iRSoZlP2Nbsy4Mis9wcBjXDaDaro7BVD1UzwGsyCty51HpRrst7w5CFIQu1egiblkfvBfzgai9jiYH9gkoLaBf6Qqr0UGUDJmiHLMT/5k7rzJbzwFxKzsi67xNE7UMgjqmtHCvKo/cl8LA8mfCB7KExxosVbtF0IOCHlm3rZH6SKsZZt8aHg92z4sOYZzROg95Wiq4QkcG3hhiXwjvZHaGo2zbRhdJYZnVk8cntCcEKASnofFNjiEDY0u6mZYeC39A5dgRfE2CeQGSPc1gYutgl/6aYdLZUCR+Ol30U4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYCr0x+vnyR9Oudpj6n6W8gZHAgXdmE/lf0x5QNIVPE=;
 b=VlVmmS6HlitODvDmKt62wzf5GYTDrMDLqDePFpjU9lYh0VI+6U9BnHRIDyChLuNwHtsTCuA14qXgDg4FsjTpZTwubqU9tW9OnC6QcqbJCpPLdhXSjdDliimHP5vGhKlUvqx+0//8UGLnUcOwqXck+zwLaabHRa/9mcpk6YFNmcw=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1710.namprd15.prod.outlook.com (10.174.96.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 18:25:03 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.015; Tue, 14 Jan 2020
 18:25:03 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Konstantin Klubnichkin
 <kitsok@yandex-team.ru>
Subject: Re: multiple device trees
Thread-Topic: multiple device trees
Thread-Index: AQHVyn3sj9xfMyLLtEu5mfuFS/jGgafp+O+AgAADnAD///g7AA==
Date: Tue, 14 Jan 2020 18:25:03 +0000
Message-ID: <A4E0BA51-C36B-4C30-BC32-CE6BBF3C1CF5@fb.com>
References: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
 <1298611578998395@vla5-c30c59847b9e.qloud-c.yandex.net>
 <FFFFBB27-4370-4E94-8D91-3BEB699CA3DA@fuzziesquirrel.com>
In-Reply-To: <FFFFBB27-4370-4E94-8D91-3BEB699CA3DA@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:92b4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d092465-ff0e-41bf-562d-08d7991f12ae
x-ms-traffictypediagnostic: MWHPR15MB1710:
x-microsoft-antispam-prvs: <MWHPR15MB171017C7B1B4B6BDC0F45820DD340@MWHPR15MB1710.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(199004)(189003)(186003)(7116003)(478600001)(2616005)(110136005)(316002)(86362001)(71200400001)(6486002)(66446008)(33656002)(5660300002)(66476007)(81166006)(8936002)(6512007)(36756003)(64756008)(66556008)(76116006)(4744005)(2906002)(66946007)(81156014)(8676002)(3480700007)(53546011)(6506007)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1710;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SPniv9f0nZ6LlLm7HTz569ACYB0AwXm0dw8vxIO5i35nK4p4Pj8syJKjzXWrMr2G5axlEhZi1WzyRTcUtqybT1UdJiG2Zp1gbDNFZBC7OnDkz+ZVShKOVSHfYfxhKmvXOOSIs/mQT7liuWOouhnLGv5Fb9fgy396C4FS86A2YBmxk4eLeGvtHHHgvxvFaSviH3MtfpFQI2SD7xm6+Ve533kxE3gsc+ZPwwWIcGrfF9x4T3i2KTCtsn2fE0SHdUkTkkD+Y9S0QT90IvzchUkIrveeRCVSXdpbqEp9zL1G2CHrsVpcCDt3pJzCfYWGrITSYeMRQla9fHEUFGKikT5UsbpJNejJuj1gAAhMjCm1w90CjHX9bnKh7bfpglwTPDoQdzqFwx5HXlCtIGuHl1eCDjDPEioHPAz4a3m0nMLZODY4etz6Z2FY571mFvxnslPI
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A9ACD310014C844B95AD1DC9219146A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d092465-ff0e-41bf-562d-08d7991f12ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 18:25:03.0176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rETVpMLUTTGMi6qeLIlcOvIYvgPUdIOYsJPxtvvJr/pPFcRija9nIZ7+Av0Mq6uxHB9kviz5GlZ/lURcQg78MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1710
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_06:2020-01-14,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=1
 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001140145
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

DQoNCu+7v09uIDEvMTQvMjAsIDI6NTMgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCcmFkIEJp
c2hvcCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgYnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCg0KICAg
IA0KICAgIA0KICAgID4gT24gSmFuIDE0LCAyMDIwLCBhdCA1OjM5IEFNLCBLb25zdGFudGluIEts
dWJuaWNoa2luIDxraXRzb2tAeWFuZGV4LXRlYW0ucnU+IHdyb3RlOg0KICAgID4gDQogICAgPiAg
DQogICAgPiBIZWxsbywgQnJhZCENCiAgICA+ICANCiAgICA+IEknbSBkb2luZyB0aGlzIHVzaW5n
IG92ZXJsYXkgRFRTLg0KICAgID4gSSBoYXZlIGEgc3RhcnR1cCBzY3JpcHQgdGhhdCBkZXRlY3Rz
IGJvYXJkIHR5cGUgYnkgR1BJTyBwaW5zIGFuZCBsb2FkcyBjb3JyZXNwb25kaW5nIG92ZXJsYXku
DQogICAgDQogICAgVGhhbmtzIGZvciB0aGUgcmVwbHkgS29uc3RhbnRpbi4gIERvZXMgdGhhdCBt
ZWFuIHlvdSBoYXZlIHRoZSBvdmVybGF5IHBhdGNoIGFwcGxpZWQgdG8geW91ciBrZXJuZWwgdHJl
ZT8NCiAgICANCiAgICBBbiBhbHRlcm5hdGl2ZSBkZXNpZ24gdGhhdCBJIGFtIGNvbnNpZGVyaW5n
IGlzIGhhdmluZyB0d28gY29tcGxldGUgZGV2aWNlIHRyZWVzIGluIGEgZml0IGltYWdlLCBhbmQg
dS1ib290IHJlYWRzIHRoZSBncGlvcyB0byBwaWNrIHRoZSBjb3JyZWN0IGR0YiBmb3IgbGludXgu
ICBEaWQgeW91IGNvbnNpZGVyIGEgZGVzaWduIGxpa2UgdGhhdCBhbmQgaWYgc28sIHdhcyB0aGVy
ZSBhbnl0aGluZyBzcGVjaWZpYyB0aGF0IHNlbnQgeW91IGluIHRoZSBkaXJlY3Rpb24gb2Ygb3Zl
cmxheXM/DQoNClRoaXMgc291bmRzIGxpa2UgYSBncmVhdCBkZXNpZ24sIEkgd2FzIGFsc28gdGhp
bmtpbmcgaW4gdGhpcyBzYW1lIGRpcmVjdGlvbi4gSXQgd2lsbCBhdm9pZCBrZXJuZWwgY2hhbmdl
cyBmb3Igb3ZlcmxheXMuDQogICAgDQogICAgdGh4IC0gYnJhZA0KDQo=
