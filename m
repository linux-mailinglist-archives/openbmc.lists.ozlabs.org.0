Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E41490A2
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 23:02:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484CmK4jlNzDqfv
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 09:02:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=82929cf7d0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=rjEamxcj; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=W9TLeJ1r; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484ClQ1qzzzDqMx
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 09:01:20 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 00OLrVV5002077;
 Fri, 24 Jan 2020 14:01:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=uww3lFzqi/Ci/RK01imcgrzDSdtQl8b9z9JJvDJZhsE=;
 b=rjEamxcjbc1MbL8gPm8R7por2biinv0ubLLU9rYeTuoBSei1/xmobHv90nrMz8g1V5xg
 3duK/yVwb4pvFqivzs/Ovn4+xmp04OVrRbKith2BJ1Yy06dFvRsbELAgGx1fJOpD8xiW
 msZUYsXx0iojm7R1rs8R+7unUwf+luREIpQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 2xr61ngv4j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Jan 2020 14:01:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 24 Jan 2020 14:01:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6x7Gd2Hq5oiWaKaAYvkql94IiMzYapDbd3nzLnBlthkUkvtTYnquCfS9ntzIRS62W1Xxp84lGv0k7TYeB+PlTfB9bau0YBBaelrVjp6x5YRbKh7yE1+XqIVROOCuCuNGbGgES16Em4pZ27rjpVemk5ls0hsomilsJN+MGcmLjslyOuOZ+EhiHNd8LhlXmqCStbNDC5BJ8m9kI+qX77J6LRMVNWetxJm4yb9xA+W/39aXjzORE26xUgDdDAn3u4ifjSiZkvekZ8BI4v90P9yn7AbNbM4VkGKOdo28RHwUHcZfKp/y9LXyDFCrm3US46iyGWzhH/f0lAzRrHb2OIF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uww3lFzqi/Ci/RK01imcgrzDSdtQl8b9z9JJvDJZhsE=;
 b=e74oBhfJtXIKrN+tYxNDh1xJfL/ACywHqhcD4URSUrZP11/TCHvzP6Rj0IzoG8V9fI63UF0BlhezkHCsMZS0rK8nw6tkwOch+vrGEklUx0MfQ6IXtyFbvFxDMKVL2+EI63MZlmj2zzi0W+NIizA3vkqEcvnt1oc2FWuvj3c9/CbT/0ZFXrEnJFUO53vn9OCOGjivgm09SMZltZhEvcGdyuYaPXjETvNCsMm5pT/nWESLUCwC9MshFPuS1TZXh6K/FmgKBcslDdcm/IYXjy1hbT2hgUBQQTSdnPG84Ad6eyHhJf5Qen/wfuOPu2e9n8/kshCvfbauSuowpy10zfk0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uww3lFzqi/Ci/RK01imcgrzDSdtQl8b9z9JJvDJZhsE=;
 b=W9TLeJ1r6dXJtjxl0ALA4VaC1OclxwNFreEMVz0/XAqhj0BFTOvPAGWdlK4I/Xpd/+LuX2K5jgJMe3pue6qdfDybQLwqmAOY9VxuRu/r7fuuBD5V+qDoqahEExLFE1t6vdEQEp3fKF1aHtWHRrgyf4ns6dG0E8P5v5AzshrCPyE=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1613.namprd15.prod.outlook.com (10.175.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Fri, 24 Jan 2020 22:01:14 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.028; Fri, 24 Jan 2020
 22:01:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDaf49/wAgACl3ACAAK69gIAABOgA//+HZoA=
Date: Fri, 24 Jan 2020 22:01:14 +0000
Message-ID: <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
In-Reply-To: <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:8efa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35703b5f-6c6a-4ab1-a4af-08d7a118ee36
x-ms-traffictypediagnostic: MWHPR15MB1613:
x-microsoft-antispam-prvs: <MWHPR15MB1613313CF0033C15AF9BF3BADD0E0@MWHPR15MB1613.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(6512007)(8936002)(86362001)(2906002)(5660300002)(71200400001)(6486002)(53546011)(6506007)(7116003)(478600001)(110136005)(33656002)(2616005)(316002)(966005)(8676002)(64756008)(3480700007)(66946007)(186003)(66446008)(81166006)(81156014)(76116006)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1613;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pdf8sYkX7EfM8YVLBWtfsMhNuU0VhrcWPMsrpCPnefb9nYXWGPWJrbqItfqWQXuAJj/1Rjml3w4LUJ96nixOwVIwss1pCvhgshBYl+0j1nbFeHVy/Y1z3aqadwl8AEcBCn6aggam5X2a2lXZL6E27xySmp1aNsBipjv8eL3kE7wBPBC+6Z0DC3a8mdeKj2NhfSQ41cHqFfEdx+IVOBlKLK/CyqNGqTXYwf2/uREK6HTXx4T3aJJO/em8H0QMP89I2SWEbV40tm1k7btauoWZkGjXtamZ7pQ7Tu4m0odBBJCzepNFLJR0psrrWwpW7fUzHp4Ne5fxNJxfbDf2s87DqIq6rYD/lGh+WqstE7zoTwm5UqBg9i4PW5mRNRzl9M4FUc3uesRD1+FjcgobYLcsVTjeyOP5zjlAfUPPWc8wuDyiK+bqy6/dOmb2ztpCtzEDTorueyv4FffAQFiy3q1uVdYB77kqdp4hAjjQ63CuBf8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA654F12C3EA6D4F94EB34B292F80B4A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35703b5f-6c6a-4ab1-a4af-08d7a118ee36
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 22:01:14.2570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AlpWQL7uYmCdmFTwRhgCkRZc5KKJS88kITnh20PCkKFi6JmKLq5yWxTrvYrSbEILezOAUKInhZ4rwI3m8dGfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1613
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_07:2020-01-24,
 2020-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=721 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001240177
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

DQoNCu+7v09uIDEvMjQvMjAsIDE6MTMgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCaWxscywg
SmFzb24gTSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgamFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
DQogICAgDQogICAgDQogICAgT24gMS8yNC8yMDIwIDEyOjU1IFBNLCBCaWxscywgSmFzb24gTSB3
cm90ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBPbiAxLzI0LzIwMjAgMTA6MjkgQU0sIFZpamF5
IEtoZW1rYSB3cm90ZToNCiAgICA+Pg0KICAgID4+DQogICAgPj4gT24gMS8yMy8yMCwgNDozNiBQ
TSwgIkJpbGxzLCBKYXNvbiBNIiA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IA0KICAg
ID4+IHdyb3RlOg0KICAgID4+DQogICAgPj4gICAgICBPbiAxLzIzLzIwMjAgNDoxMyBQTSwgVmlq
YXkgS2hlbWthIHdyb3RlOg0KICAgID4+ICAgICAgPiBIaSBKYXNvbiwNCiAgICA+PiAgICAgID4N
CiAgICA+PiAgICAgID4gV2UgaGF2ZSBhIHJlcXVpcmVtZW50IG9mIHBvd2VyIGJ1dHRvbiBvdmVy
cmlkZS4gSSBkb27igJl0IHNlZSANCiAgICA+PiB4ODYtcG93ZXINCiAgICA+PiAgICAgID4gY29u
dHJvbCBkb2VzbuKAmXQgc3VwcG9ydCB0aGlzIGN1cnJlbnRseS4gRG8geW91IG5lZWQgdGhpcyAN
CiAgICA+PiBmZWF0dXJlcyBvciBkbw0KICAgID4+ICAgICAgPiB5b3UgaGF2ZSBhbnkgbG9jYWwg
cGF0Y2ggZm9yIHRoaXMuDQogICAgPj4gICAgICBIaSBWaWpheSwNCiAgICA+PiAgICAgIHBvd2Vy
IGJ1dHRvbiBvdmVycmlkZSBpcyB1c2VkIGZvciB0aGUgIkZvcmNlIE9mZiIgYWN0aW9ucyBpbiAN
CiAgICA+PiBwb3dlciBjb250cm9sOg0KICAgID4+ICAgICAgDQogICAgPj4gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMveDg2LXBvd2VyLWNvbnRyb2wvYmxvYi9tYXN0ZXIvcG93ZXItY29udHJv
bC14ODYvc3JjL3Bvd2VyX2NvbnRyb2wuY3BwI0w1MC4gDQogICAgPj4NCiAgICA+Pg0KICAgID4+
IFRoaXMgd2lsbCBub3Qgd29yayBpZiBjdXJyZW50IHN0YXR1cyBpcyBvZmYuIFRoaXMgc2hvdWxk
IGp1c3Qgc2VuZCANCiAgICA+PiBwdWxzZSBpbiBhbnkgc3RhdHVzIG9uL29mZi4NCiAgICA+IENv
cnJlY3QuICBGb3JjZSBPZmYgaXMgbm90IGRvbmUgaWYgdGhlIGN1cnJlbnQgc3RhdHVzIGlzIG9m
Zi4NCiAgICBEbyB5b3UgaGF2ZSBtb3JlIGRldGFpbHMgb24gdGhlIHBvd2VyIGJ1dHRvbiBvdmVy
cmlkZSBiZWhhdmlvciB0aGF0IHlvdSANCiAgICBuZWVkPw0KDQpZZXMsIFRoaXMgaXMgcmVxdWly
ZWQgdG8gYnJpbmcgTUUgYmFjayB0byBvcGVyYXRpb24gbW9kZSBmcm9tIHJlY292ZXJ5LiBIb3cg
YXJlIHlvdSBoYW5kbGluZyBNRSBmb3IgQmlvcyB1cGdyYWRlLg0KDQogICAgPj4gICAgICA+DQog
ICAgPj4gICAgICA+IFJlZ2FyZHMNCiAgICA+PiAgICAgID4NCiAgICA+PiAgICAgID4gLVZpamF5
DQogICAgPj4gICAgICA+DQogICAgPj4NCiAgICANCg0K
