Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140DECC77
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 01:34:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474g6q6nx3zF7LC
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 11:34:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=620993b780=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bR1HaJco"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dfb7Vutc"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474g6604xCzF7Gr
 for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2019 11:33:45 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA20PcX8027805; Fri, 1 Nov 2019 17:33:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ZK1Sztc5kWmgrM0agtTWTWYzR+v7HOH/p8F1q3B6ljI=;
 b=bR1HaJconQGH88xp0obxUp73rHu01lAmoQ8GYmB/gycjiE1LAPaRnB5MZsM3z2enLac+
 MpHt2thpMQ7xAIK6oAG8Y5isX1ujF+9YrsCje45b3GyWynHQ+7Hb1GWWtZshHjzpoqzZ
 bgYb25KAY0clVBRWP2U6eGfFNOwtrQR/6TM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w08jjpbsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 01 Nov 2019 17:33:39 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 1 Nov 2019 17:33:37 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 1 Nov 2019 17:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH6wvBACUcqSZoIX8Xhoaqt3IcEtymtp/s8YSOiVxntEuaodG9nsRLh6B3G8x+1Cg53AOs1T8AfzT0mAGp41dqiRocSQDROfFzg7hsY/KfRXYhUOrqOkDCFC9uoojDSR6trTMop3VCs5wXEx9sf348Dc3gI8KQpddTuLlthbvKEtGxmOQh3KY6fn7eZLJ72gkVv1onATLMT2DUmjKER9Uq8izakXVsMjxIoCd2WuFn/Pu1qu7aa7Wbik7DkHsB1v3YWeALVKIfu4m6ZFrFNANEA0iar7QqO3BxVM/PBTycaU1KLPkBePj3ZiIDkCw+qSEh/1lq2Ittc7oeJuAj9XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZK1Sztc5kWmgrM0agtTWTWYzR+v7HOH/p8F1q3B6ljI=;
 b=C3+Y3qTJOLgPlOVLGdt/4xXMDJNr3lUiV5K38/bWSaGU5aCR9p4LgaBdcAqw5K6GRouMElrj4Zp6ePg2PRzr0MquIpwbgsNGzN/mNfov9HLysIzKO/o7SzPgdyjoamKRFWCl0DincsTLp1zeODBmVa3n+60+UGvYBdziLXcDVgHNZAv8Y7fIcwsnQohGAvpnsB26WbspYfk6HZ7nGbaYLAw2tNl3FhfpmmchMJkbuw5rVDcir0l9W01BmphtQ6vjH2U+p3F60bKLt7UhfV7woYLQeIyrO+08Tsb3Ft8NFd6SwEhmNYzzFlhdJldfNZ32+bc2DDcLPSsECB61X/ZtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZK1Sztc5kWmgrM0agtTWTWYzR+v7HOH/p8F1q3B6ljI=;
 b=dfb7VutcaaBY76Rt+uCXpYQFoEBfK4GPpqxtcOql3AQqWfBsmu5KhvNIUfJSJDGq/tfsfE3ylWo3/qqqm1bLlDRQi+DpumGXEBU0hFL8hTk1jUIY919NWRSkao5krKqee9d6cpb0bAYiwFOo+ZyzmfhXBGU7Cv0Rfz7I0RaWimE=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3586.namprd15.prod.outlook.com (52.133.254.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 00:33:36 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 00:33:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVkRUpEDaqjstP4kSB8KQL9Y7+Lg==
Date: Sat, 2 Nov 2019 00:33:36 +0000
Message-ID: <D2637F4F-E67C-424E-86FF-D20E0415CB43@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:ce4d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a146c12-9df2-4c28-ba43-08d75f2c4c87
x-ms-traffictypediagnostic: BY5PR15MB3586:
x-microsoft-antispam-prvs: <BY5PR15MB3586E29867C040237B82243CDD7D0@BY5PR15MB3586.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(136003)(376002)(199004)(189003)(86362001)(110136005)(2906002)(305945005)(8936002)(81166006)(81156014)(46003)(6506007)(2616005)(486006)(476003)(99286004)(186003)(7736002)(8676002)(6486002)(6436002)(14454004)(6116002)(25786009)(71190400001)(6512007)(5660300002)(91956017)(76116006)(36756003)(478600001)(4744005)(316002)(66476007)(71200400001)(4326008)(102836004)(66556008)(256004)(2501003)(64756008)(66446008)(33656002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3586;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKW2YOY8fye3DVxt4OG6hgIjC1Nb1BdYG1246z7zGToJrbDEn185JaT0Ifif7IfebjBVf4n0v5dtdkBqXTLX9FgoBQ1yB8HJKVAQnfS/OWXcU9yNscLVct63x7bjk7kh4wnHECl9kBfzpYYaRkyOUCoelun6I40yAqLCz0+S8ap4Xle9742neRQLWBL9cnbrFEM8okpfD6goLtWkBP+9L8UnvU1sbLbSv1OTaX9joS+k7zupdjGXqcoWLNdRdJqJm1xEyoOHNespGgjKIVLV5H9EOnINh0psaTF8PNnCljKDNKzRqlpGyvN36GcMs43hkl04Ispf3j2MyIaowPB0YGVmTd5NXTMJ1gs5YZpKchr0wALbQRuhnSTIqJBkJoh2R/DUlIcIb+M4mt7QnP56R2PjBDH0MqgT7sxqR0nSF5WbnuSnB5/Uql+DAQex/0c1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5417A91588C5384D82F1C9BAED9B99E7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a146c12-9df2-4c28-ba43-08d75f2c4c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 00:33:36.1918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NopTGIXyDWyL/ykdhwzPfYf53DdMCFobheiiq3aoq/AmUzuxZicvqPVXx4B29QXWMz0bU9dvMDQkf+76SoqZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3586
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-01_10:2019-11-01,2019-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=484 spamscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1911020000
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

SGkgSmFzb24vSmFtZXMsDQpJIHNlZSBzb21lIGxpbWl0YXRpb24gaW4gY3VycmVudCB4ODYtcG93
ZXItY29udHJvbCBhcyB3ZSBkb27igJl0IGhhdmUgTk1JX09VVCwgTk1JX0JVVFRPTiBhbmQgSURf
QlVUVE9OIHVzYWdlLiBBbmQgSSBhbSBub3Qgc3VyZSB3aHkgdGhlc2UgYXJlIGJlaW5nIHVzZWQu
IFNvIGlmIEkgZG9u4oCZdCBkZWZpbmUgdGhlc2UgaW4gRFRTIHRoZW4gdGhpcyBwcm9ncmFtIGZh
aWxzLiBTbyBQbGVhc2UgaG93IHRvIGRpc2FibGUgdGhlc2UuIFRoZXNlIHNob3VsZCBiZSBvcHRp
b25hbC4gSSBoYXZlIGZvbGxvd2luZyBvcHRpb25zIHRvIGRpc2FibGUgdGhlc2UuDQoNCjEuIE5v
IHJldHVybmluZyAtMSBpZiB3ZSBkb24ndCBmaW5kIGxpbmUgbmFtZSwgc2ltcGx5IG1vdmUgb24u
IEkgaGF2ZSB0byBzZWUgaW1wYWN0IG9uIHJlc3Qgb2YgY29kZS4NCjIuIE1ha2UgaXQgY29tcGls
ZSB0aW1lIGZsYWcgYW5kIHNob3VsZCBiZSBpbmNsdWRlZCB0aHJvdWdoIGJiYXBwZW5kIGxpa2Ug
LUROTUlfT1VUIGV0Yy4NCjMuIEhhdmUgY29uZmlnIEphc29uIGZpbGUgYW5kIGVuYWJsZSBvciBk
aXNhYmxlIGdwaW8gbGluZSB0byBiZSB1c2VkLg0KDQoNClBsZWFzZSBsZXQgdXMga25vdyB5b3Vy
IHRob3VnaHQgYW5kIGhvdyBzaG91bGQgd2UgYXBwcm9hY2guIEkgYW0gZmluZSB3aXRoIGNoYW5n
aW5nIHRoaXMgY29kZSBhbmQgc3VibWl0IHBhdGNoLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0K
