Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F970E31
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 02:34:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45szyF36yHzDqVW
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 10:34:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="p0541Pby"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jBPndC30"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45szxS003YzDqVP;
 Tue, 23 Jul 2019 10:34:02 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N0ElE2016652; Mon, 22 Jul 2019 17:33:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=4Tszt1wueN+u4x7Vd41pROxqw2h3Ubjgu5PvqSIcAb0=;
 b=p0541Pby89M8yVdZREy2dpsoG8mN9vm8Eyx/OkKuiRkCGexEultPSsVU7Y3tyxFWW4RP
 hao8LX7YhKp/OlKaZGc0ZnW12wM5HVYW7XksgVNUdOngLD2cSRe4NEBH1t3ai6ZGf/Rh
 NM/KQE1w68DoRPMN0KHUWPckKTXK0K2OwkY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2twg6a9sdv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 22 Jul 2019 17:33:49 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 22 Jul 2019 17:33:41 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 22 Jul 2019 17:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfGB9EurNZJIBvWAlTkxLF6gzvo3DaokbqnBbTTqq75noVQPpcG+YPsNvxOjy5AHcffLeLGPdKEmtOqYp2smWAc1f4NboaYFfPV3MgHP0wDmzFQBa5jNf49nP5N9fMO+PUbP+Ih6LwfEjAuNZJ2nJPSIC92PxdK/Lbk4cGHfppKz0HtY59QWQfFsaMY3rbTAXmz6gHMBPbKM5lzfCV+W8ZzyOQitj/Csu1fPO4KXWjLXzyTlnbayPcADx5RImqFdJ90sLCCWNPytkA2+zrHJvoMtYqIGnf1DvxXT2IMxhKTD82BpX7U8lPsKxzPC2ibz8BnRcLR8keIZXtP6yIZjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tszt1wueN+u4x7Vd41pROxqw2h3Ubjgu5PvqSIcAb0=;
 b=iaS5ZOzL+Ns4MQMpqVOXmEyVOjtjFo+WLH4gSUvGH2p2rYET4woR/aHQIw4y2SojF5bwHYSMSRshQCCLYWp8EkyLPeijwZOCTOqkia6Kvmm9QeCYWv75gXpm50d2PJfhsg8O5kreyUxPomlqAFvnPh/HXjo6laznFl8JGu9mKyPRO96TzjiutX32PaclPapZSIal0Q/zx8f+kOMyAzTGP2kcIza7fbFBs66d7+e4PSohEMaWiY2ij8LpoyWBmheMFUU4Ul+FtjwDC1ipu8dN06oym5lqRUdpqnVcHBJs+K5IGnVS1+6J3tVOt4yUwGmUXpA8wUdOk5qSKg9JoAxQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tszt1wueN+u4x7Vd41pROxqw2h3Ubjgu5PvqSIcAb0=;
 b=jBPndC30afjdvhMHi37Ls9Kt3U+mMzS5qRHa/M2AJ17iyP2vJW+YRRY6ZKJ7wO6O14DVXQuju/1UE6qZRcyMqQ/cqWV48HaGHPeV5RyEItYI3OEZAX78JwZ6o0N+1sgbtZSppUHx+eRSxdh69VGoFdg+RrHbVm2mU9Jy6gPQw3g=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1447.namprd15.prod.outlook.com (10.172.155.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 23 Jul 2019 00:33:40 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 00:33:40 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: tiogapass: Add VR devices
Thread-Topic: [PATCH 1/2] ARM: dts: aspeed: tiogapass: Add VR devices
Thread-Index: AQHVQMVnpxBga6eEj0K8KvUFIYW0cKbXVMQA//+Q44A=
Date: Tue, 23 Jul 2019 00:33:40 +0000
Message-ID: <69DFAF50-E181-4C7A-910A-C45E6E151F8E@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <802c5419-08ec-4a0e-8a50-ad4a1bbf7f3a@www.fastmail.com>
In-Reply-To: <802c5419-08ec-4a0e-8a50-ad4a1bbf7f3a@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:693e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ea710e-27c5-4f8d-9bf6-08d70f0568b5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1447; 
x-ms-traffictypediagnostic: CY4PR15MB1447:
x-microsoft-antispam-prvs: <CY4PR15MB14472FE1516475D228CEC036DDC70@CY4PR15MB1447.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(136003)(376002)(366004)(189003)(199004)(476003)(2201001)(6486002)(316002)(110136005)(81166006)(6506007)(5660300002)(186003)(46003)(86362001)(7736002)(81156014)(2906002)(54906003)(446003)(11346002)(8936002)(25786009)(71190400001)(2616005)(71200400001)(36756003)(8676002)(256004)(6436002)(14454004)(99286004)(305945005)(229853002)(102836004)(53936002)(2501003)(66556008)(6116002)(486006)(66946007)(6512007)(66446008)(66476007)(478600001)(7416002)(33656002)(64756008)(76116006)(76176011)(4326008)(6246003)(68736007)(91956017)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1447;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: enj2984x9Rqw3JFvh3qO+/iVdfR7XIwqUS0AywnFi0oFIm7Wqqs+wNGXn21C1PDAVmNLrShwXjM7yKn2uuglI7fu2lDEdOQaxyzKvWgRGmEG5dwL3hnpxPD/JLCcuGeZP03pU7cSJfdaNds08Wd4fZJyoNj/FVIUBl9lKlcEBMVDdLBfeGuyOSKTGhd0N1F2I0F8iVNtTa2yO89XOsuJ9c4mHdRRZn1Lj8/7QZK4g8lrDmCE4jyx3Ym8U++tXd0nbLphBDfmASTo/DvquutmLaWEDLzJWHG0R/eKJuuVJiVEOxZACTzcplhuK9xzHXMEXFN8+zYC0gvG0Mrdjy466EilfQYWU/7hsI0FMzwP7YHSWndAQNzMnxoAYhqF0IhDlDfky0kE5ZI6gLcu2cf1EmVrA3uLhMJEQZ8+UsiOGA8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <515ADAC7575AC24CABAC6D61534CEFDB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ea710e-27c5-4f8d-9bf6-08d70f0568b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 00:33:40.1030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1447
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230000
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvMjIvMTksIDU6MTIgUE0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5p
ZC5hdT4gd3JvdGU6DQoNCiAgICBIaSBWaWpheSwNCiAgICANCiAgICBBIGZldyBuaXRwaWNrcy4N
CiAgICANCiAgICBPbiBUdWUsIDIzIEp1bCAyMDE5LCBhdCAwNToxMCwgVmlqYXkgS2hlbWthIHdy
b3RlOg0KICAgID4gQWRkZXMNCiAgICANCiAgICBUeXBvOiBBZGRzDQpBY2sNCiAgICANCiAgICA+
IFZvbHRhZ2UNCiAgICANCiAgICBVbm5lY2Vzc2FyeSBjYXBpdGFsaXNhdGlvbi4NCkFjaw0KICAg
IA0KICAgID4gcmVndWxhdG9ycyBJbmZpbmVvbiBweGUxNjEwIGRldmljZXMgdG8gRmFjZWJvb2sN
CiAgICA+IHRpb2dhcGFzcyBwbGF0Zm9ybS4NCiAgICA+IA0KICAgID4gU2lnbmVkLW9mZi1ieTog
VmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQogICAgPiAtLS0NCiAgICA+ICAuLi4v
ZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0cyAgICAgfCAzNiArKysrKysrKysr
KysrKysrKysrDQogICAgPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCiAgICA+
IA0KICAgID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJv
b2stdGlvZ2FwYXNzLmR0cyANCiAgICA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1m
YWNlYm9vay10aW9nYXBhc3MuZHRzDQogICAgPiBpbmRleCBjNDUyMWVkYTc4N2MuLmI3NzgzODMz
YTU4YyAxMDA2NDQNCiAgICA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFj
ZWJvb2stdGlvZ2FwYXNzLmR0cw0KICAgID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWJtYy1mYWNlYm9vay10aW9nYXBhc3MuZHRzDQogICAgPiBAQCAtMTQ0LDYgKzE0NCw0MiBAQA0K
ICAgID4gICZpMmM1IHsNCiAgICA+ICAJc3RhdHVzID0gIm9rYXkiOw0KICAgID4gIAkvLyBDUFUg
Vm9sdGFnZSByZWd1bGF0b3JzDQogICAgPiArCXZyQDQ4IHsNCiAgICANCiAgICBUaGUgcmVjb21t
ZW5kZWQgZ2VuZXJpYyBuYW1lIGlzICdyZWd1bGF0b3InLCBzbyBlLmcuIHJlZ3VsYXRvckA0OA0K
QWNrOiBTdWJtaXR0ZWQgdjIgZm9yIHRoaXMgcGF0Y2guDQogICAgDQogICAgPiArCQljb21wYXRp
YmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NDg+Ow0KICAgID4g
Kwl9Ow0KICAgID4gKwl2ckA0YSB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4
ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NGE+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2ckA1
MCB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJ
cmVnID0gPDB4NTA+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2ckA1MiB7DQogICAgPiArCQljb21w
YXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NTI+Ow0KICAg
ID4gKwl9Ow0KICAgID4gKwl2ckA1OCB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9u
LHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NTg+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2
ckA1YSB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4g
KwkJcmVnID0gPDB4NWE+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2ckA2OCB7DQogICAgPiArCQlj
b21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4Njg+Ow0K
ICAgID4gKwl9Ow0KICAgID4gKwl2ckA3MCB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmlu
ZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NzA+Ow0KICAgID4gKwl9Ow0KICAgID4g
Kwl2ckA3MiB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAg
ID4gKwkJcmVnID0gPDB4NzI+Ow0KICAgID4gKwl9Ow0KICAgID4gIH07DQogICAgPiAgDQogICAg
PiAgJmkyYzYgew0KICAgID4gLS0gDQogICAgPiAyLjE3LjENCiAgICA+IA0KICAgID4NCiAgICAN
Cg0K
