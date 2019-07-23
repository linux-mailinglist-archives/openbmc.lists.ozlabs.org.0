Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB77262D
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:26:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tj2d6Z6czDq6K
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:26:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="jf43wDw5"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OqAnmBQZ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tSXH1ZHhzDqMh
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 05:02:21 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NIvovk010789; Tue, 23 Jul 2019 12:02:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=2DyKeiKP7/QMceXgJ+3iHHj5vVJMNo94ejZgoMn0o1s=;
 b=jf43wDw5ovl7+A6cYCd9xhl4/LkZB+nbseKX4n5qgIdqkhGK9tW4gvxjisi2rEkdnilq
 R2fWcibtO0I2Dn6xj9MG+0Y4hJjEsCxOhmE/KPHOwjdet5cRSIM0Ry5XztlZhRl1Sp/l
 icQeaYGVGiT4PoitOIc1GBKneqlRtIjs1p8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2tx61grk0a-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 12:02:16 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 12:02:10 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 12:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ2WPfq/AZH1mPd+n4Oy1TyQYpkSIS12+fdVr39KeOmBcVNMOWBrC0AjRiH29c0HhcNd34NIHzUE0wunsFnIVtEIgNja13JIG0F6baJeQRZxGgYcjEWeNfoKuTxbuG7U998QP+CYJ07PPYQlKpgMe0cECQycVzTFWoL1G22EnX8eeaM5k92OnDVu2oj2/8GuXQZ7+U/jahedR7C3GDHZr0epcX8qfw3BbSx13XJlCsYGrqhufOLOmxxE2nz/pWmfucxlHolzbLbVfLplajeVZPweyNY8ZMQ7hvXzQloDkkEeHCgZyGelc6gg6utcTpwSNpVlPsvo8a3WHDE9qIga5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DyKeiKP7/QMceXgJ+3iHHj5vVJMNo94ejZgoMn0o1s=;
 b=MUJvazq+eXfILI6ej09AQd8GK9x/AxjU676K7sNvtjB9tYzkuo6fFV1zdwy9m8QqgV70dVXEyuLPgH5wO5c2GpWy3O5a/Jo1jjlW3wfVVv2jLo5I8vzrtUm4zgkjTPaHMD2uNWN79rsrGsptgKniYjzbQ+QbvzyiuY0aMafy5+8exmNL9mIPHW+Qapg0INQSCt3NMCVqCfaGZKbmOXLsOFK6DXwa/TBYmIVgR4F7bGy1aOLwVASHV7DEPtnmZGflVX5cRSfSx3Pm0vNiuc2PVUyjP+Ocv3kHYs+ghMlHtHfFw0fdhlrdiH+e8rwlQW6koTt/QKEkqMOcvwbYS42y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DyKeiKP7/QMceXgJ+3iHHj5vVJMNo94ejZgoMn0o1s=;
 b=OqAnmBQZN0Pi1lnPglrxT9ybk4lUb0M8LxgkHwPdJ9Hr8jVCla5JxVn7GMFZNmRD6A2CESEAIG0vmcK0maNQz4gWkIZTdfJdoxW87kWEK9il9BeLpt6G0c/scDKvJvhDa7a0gXbJH0tDskZbjRgnhq8Q6InaVrttMZaLwEMkGDo=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1448.namprd15.prod.outlook.com (10.172.162.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 23 Jul 2019 19:02:08 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 19:02:08 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: =?utf-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: Re: Could phosphor-hwmon support peci-sensors
Thread-Topic: Could phosphor-hwmon support peci-sensors
Thread-Index: AdVAcrEeJhGDbsKEQ6GlW/GsUn/vgwA28CyA
Date: Tue, 23 Jul 2019 19:02:08 +0000
Message-ID: <E57C23C2-1CA3-4716-A414-617627FD2787@fb.com>
References: <7297d188594b4d83a1f32f87b54db2dc@quantatw.com>
In-Reply-To: <7297d188594b4d83a1f32f87b54db2dc@quantatw.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.201.64.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40658ff2-efd3-4aa7-3532-08d70fa042dd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1448; 
x-ms-traffictypediagnostic: CY4PR15MB1448:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CY4PR15MB14482C17996E778E6EA1D3BCDDC70@CY4PR15MB1448.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(43544003)(53754006)(13464003)(199004)(189003)(64756008)(86362001)(81156014)(81166006)(7736002)(4326008)(478600001)(5660300002)(2616005)(486006)(91956017)(6486002)(25786009)(8936002)(99286004)(6512007)(6436002)(110136005)(102836004)(446003)(256004)(8676002)(71190400001)(966005)(316002)(6306002)(71200400001)(14444005)(11346002)(53936002)(2906002)(26005)(6246003)(229853002)(186003)(53546011)(14454004)(68736007)(66946007)(66446008)(66556008)(76116006)(66476007)(33656002)(476003)(66066001)(76176011)(6116002)(2501003)(36756003)(3846002)(6506007)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1448;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lMp5ITpEC4LpBr2yoyaV/UBl8PHXeEYzB630Qk/B7frSMBo6cU+C4Pi0n+qEzUCQZixnf7TfOj8cUIMKC51bjmpOR4Pzm8WO5penKYZ+SA25FeRSqJkHwh3AluNd9h+lsvBufsPu9fJA8wAKjPQhwdATXQ26btcG+lOK6jwFvkSlWmhQRDF90DwYfvvYj50+Xtr9mTwXU7hU5+6qQQBoblsKrsYz2z5oNCxqkKdBJR1FAU/72MmjKP8G76uTd+z7plOFS17m4hqnNp5xAimn0eeoDoW+QvvKAdFN73SEyKFJONmDgbWFuwH5YS/DLC8SL0Q1huWDRg8QZBmq/yIiII0+rSQT0SYxPIzfpopzLS5UEiC5BSSolrvg1Eky8xqOyi2Z7hZVVfrpSG3FpAHQXRr4V5/rxrtbJO9sDPgG/zg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89D1BCCE3599E448BE0EE6CA87C78B25@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 40658ff2-efd3-4aa7-3532-08d70fa042dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 19:02:08.5802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1448
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=795 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230192
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

DQoNCu+7v09uIDcvMjIvMTksIDI6NTAgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBEdWtlIER1
ICjmnZznpaXlmIkpIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnIG9uIGJlaGFsZiBvZiBEdWtlLkR1QHF1YW50YXR3LmNvbT4gd3JvdGU6DQoNCiAg
ICBIaSBKYW1lcywNCiAgICAgICBJIGhhdmUgc29tZSBwcm9ibGVtcyB3aXRoIGNwdXNlbnNvciBp
biBwYWNrYWdlIGRidXMtc2Vuc29ycy4gV2hlbiBJIHNldCB0ZW1wZXJhdHVyZXMgb2YgY3JpdGlj
YWwgYW5kIHdhcm5pbmcgaGlnaCBmb3IgRElNTSBpcyB3b3JrLCBidXQgQ29yZSBpcyBub3QuIENv
dWxkIEkgc2V0IHRlbXBlcmF0dXJlcyBvZiBjcml0aWNhbCBhbmQgd2FybmluZyBoaWdoIGZvciBD
b3JlIGJ5IGpzb24gZmlsZSBpbiBlbnRpdHktbWFuYWdlciA/IA0KDQpEdWtlLA0KSSBkb24ndCB0
aGluayB5b3UgY2FuIGNvbmZpZ3VyZSB0aHJlc2hvbGQgZm9yICJDb3JlIiwgaXQgaGFzIGJlZW4g
cmVhZCBieSBjcHUgZGlyZWN0bHkgYW5kIHNldCBieSBjcHVzZW5zb3JzLg0KDQogICAgKFRoZXJl
IGlzIG15IGpvc24gZmlsZSBmb3IgY3B1IGluIHBhY2thZ2UgZW50aXR5LW1hbmFnZXIpDQogICAg
DQogICAgICAgICAgICAgICAgIlRocmVzaG9sZHMiOiBbDQogICAgICAgICAgICAgICAgICAgIHsN
CiAgICAgICAgICAgICAgICAgICAgICAgICJEaXJlY3Rpb24iOiAiZ3JlYXRlciB0aGFuIiwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICJMYWJlbCI6ICJDb3JlIiwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICJOYW1lIjogInVwcGVyIGNyaXRpY2FsIiwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICJTZXZlcml0eSI6IDEsDQogICAgICAgICAgICAgICAgICAgICAgICAiVmFsdWUiOiA3NQ0KICAg
ICAgICAgICAgICAgICAgICB9LA0KICAgICAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAiRGlyZWN0aW9uIjogImdyZWF0ZXIgdGhhbiIsDQogICAgICAgICAgICAgICAg
ICAgICAgICAiTGFiZWwiOiAiQ29yZSIsDQogICAgICAgICAgICAgICAgICAgICAgICAiTmFtZSI6
ICJ1cHBlciBub24gY3JpdGljYWwiLA0KICAgICAgICAgICAgICAgICAgICAgICAgIlNldmVyaXR5
IjogMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJWYWx1ZSI6IDcwDQogICAgICAgICAgICAg
ICAgICAgIH0sDQogICAgICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICJEaXJlY3Rpb24iOiAiZ3JlYXRlciB0aGFuIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICJM
YWJlbCI6ICJESU1NIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICJOYW1lIjogInVwcGVyIGNy
aXRpY2FsIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICJTZXZlcml0eSI6IDEsDQogICAgICAg
ICAgICAgICAgICAgICAgICAiVmFsdWUiOiA4NQ0KICAgICAgICAgICAgICAgICAgICB9LA0KICAg
ICAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgICAgICAiRGlyZWN0aW9uIjog
ImdyZWF0ZXIgdGhhbiIsDQogICAgICAgICAgICAgICAgICAgICAgICAiTGFiZWwiOiAiRElNTSIs
DQogICAgICAgICAgICAgICAgICAgICAgICAiTmFtZSI6ICJ1cHBlciBub24gY3JpdGljYWwiLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgIlNldmVyaXR5IjogMCwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICJWYWx1ZSI6IDgwDQogICAgICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAg
ICBdLA0KICAgIA0KICAgIFRoYW5rcy4NCiAgICBEdWtlLCBEdQ0KICAgIA0KICAgID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCiAgICA+IEZyb206IG9wZW5ibWMNCiAgICA+IFttYWlsdG86
b3BlbmJtYy1ib3VuY2VzK3dpbGwubGlhbmc9cXVhbnRhdHcuY29tQGxpc3RzLm96bGFicy5vcmdd
IE9uDQogICAgPiBCZWhhbGYgT2YgVmlqYXkgS2hlbWthDQogICAgPiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMTAsIDIwMTkgNDoyMCBBTQ0KICAgID4gVG86IEphbWVzIEZlaXN0IDxqYW1lcy5mZWlz
dEBsaW51eC5pbnRlbC5jb20+OyBCcmFkIEJpc2hvcA0KICAgID4gPGJyYWRsZXliQGZ1enppZXNx
dWlycmVsLmNvbT47IER1a2UgRHUgKOadnOelpeWYiSkNCiAgICA+IDxEdWtlLkR1QHF1YW50YXR3
LmNvbT4NCiAgICA+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IEphZSBIeXVuIFlvbyA8
amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCiAgICA+IFN1YmplY3Q6IFJlOiBDb3VsZCBw
aG9zcGhvci1od21vbiBzdXBwb3J0IHBlY2ktc2Vuc29ycw0KICAgID4gDQogICAgPiANCiAgICA+
IA0KICAgID4gT24gNy84LzE5LCAxMToyOSBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEphbWVz
IEZlaXN0Ig0KICAgID4gPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMu
b3psYWJzLm9yZyBvbiBiZWhhbGYgb2YNCiAgICA+IGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6DQogICAgPiANCiAgICA+ICAgICBPbiA3LzgvMTkgMTA6NTIgQU0sIEJyYWQgQmlz
aG9wIHdyb3RlOg0KICAgID4gICAgID4gT24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTI6MzM6MjFQ
TSArMDAwMCwgRHVrZSBEdSAo5p2c56Wl5ZiJKSB3cm90ZToNCiAgICA+ICAgICA+PiBIaSBBbGws
DQogICAgPiAgICAgPj4gIEkgaGF2ZSBzb21lIHByb2JsZW1zIHdpdGggcGhvc3Bob3ItaHdtb24u
DQogICAgPiAgICAgPj4gQ291bGQgcGFja2FnZSBwaG9zcGhvci1od21vbiBzdXBwb3J0cyBwZWNp
IHNlbnNvcnMgc3VjaCBhcyBjcHUNCiAgICA+IGFuZA0KICAgID4gICAgID4+IGRpbW0gdGVtcGF0
dXJlcyA/DQogICAgPiAgICAgPj4gSWYgeWVzLCBjb3VsZCB5b3UgZ2l2ZSBtZSBzb21lIGhpbnRz
IHRoYXQgaG93IGRvIEkgd3JpdGUgY29uZmlndXJhdGlvbg0KICAgID4gICAgID4+IGZvciBwZWNp
IHNlbnNvcnMsIHBsZWFzZSA6KS4NCiAgICA+ICAgICA+Pg0KICAgID4gICAgID4+IFRoYW5rcy4N
CiAgICA+ICAgICA+PiBEdWtlLCBEdQ0KICAgID4gICAgID4NCiAgICA+ICAgICA+IHBob3NwaG9y
LWh3bW9uIHNob3VsZCB3b3JrIHdpdGggYW55dGhpbmcgdGhhdCBpbXBsZW1lbnRzIHRoZQ0KICAg
ID4gaHdtb24gQUJJLg0KICAgID4gICAgID4gU28gSSB0aGluayB0byBtYWtlIFBFQ0kgc2Vuc29y
cyB3b3JrIHdpdGggcGhvc3Bob3ItaHdtb24sIHlvdSBuZWVkDQogICAgPiBod21vbg0KICAgID4g
ICAgID4gZHJpdmVycyBmb3IgUEVDSSBzZW5zb3JzLiAgSSBkb24ndCBrbm93IGlmIGFueW9uZSBp
cyB3b3JraW5nIG9uIHRoYXQuDQogICAgPiAgICAgPg0KICAgID4gICAgID4gSSBzdXNwZWN0IHRo
ZSBvdGhlciBzZW5zb3IgYXBwbGljYXRpb24gLSBkYnVzLXNlbnNvcnMgc3VwcG9ydHMgUEVDSSBq
dXN0DQogICAgPiAgICAgPiBmaW5lLiAgQnV0IEkgZG9uJ3Qga25vdyBob3cgaXQgd29ya3MsIGlm
IGl0IGNhbiBiZSB1c2VkIHdpdGhvdXQgZW50aXR5DQogICAgPiAgICAgPiBtYW5hZ2VyLCAgYW5k
L29yIGlmIGl0IGNhbiBiZSBydW4gaW4gcGFyYWxsZWwgd2l0aCBwaG9zcGhvci1od21vbi4NCiAg
ICA+IA0KICAgID4gICAgICsgSmFlLCBDUFUgU2Vuc29yIEF1dGhvcg0KICAgID4gDQogICAgPiAN
CiAgICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RidXMtc2Vuc29ycy9ibG9iL21hc3Rl
ci9zcmMvQ1BVU2Vuc29yTWFpbi4NCiAgICA+IGNwcA0KICAgID4gDQogICAgPiAgICAgQ1BVIHNl
bnNvciBjdXJyZW50bHkgc3VwcG9ydHMgUEVDSSBzZW5zb3JzDQogICAgPiANCiAgICA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RidXMtc2Vuc29ycy9ibG9iL21hc3Rlci9zcmMvQ1BVU2Vu
c29yLmNwcA0KICAgID4gDQogICAgPiANCiAgICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L2VudGl0eS1tYW5hZ2VyL2Jsb2IvZjg2MWRhODllZDAzZjllYzU1NmM1ZQ0KICAgID4gZDZhYzgx
OTk4OGMwYzFmNDk4L2NvbmZpZ3VyYXRpb25zL1dGVCUyMEJhc2Vib2FyZC5qc29uI0wyMTgxDQog
ICAgPiANCiAgICA+ICAgICBJdCBkb2VzIHJlcXVpcmUgZW50aXR5LW1hbmFnZXIgY3VycmVudGx5
LCBidXQgaXQgY291bGQgYmUgcnVuIGluDQogICAgPiAgICAgcGFyYWxsZWwgd2l0aCBwaG9zcGhv
ci1od21vbi4NCiAgICA+IA0KICAgID4gVGhlcmUgaXMgcGVjaSBkcml2ZXIgYWxvbmcgd2l0aCBo
d21vbiBwZWNpIGRyaXZlciBhdmFpbGFibGUgaW4gb3BlbmJtYyBsaW51eA0KICAgID4ga2VybmVs
IDUuMyB3aGljaCB3aWxsIHRha2UgY2FyZSBvZiBod21vbiBpbnRlcmZhY2UuIEFuZCB0aGVyZSBh
cmUgYWxzbw0KICAgID4gcGVjaS1kaW1tIGFuZCBwZWNpLWNwdSBkcml2ZXIgdG8gcmVhZCBjcHUg
YW5kIGRpbW0gc2Vuc29ycy4gT25jZSB0aGVzZQ0KICAgID4gZHJpdmVycyBlbmFibGVkLCBpdCBz
b3VsZCB3b3JrIHdpdGggcGhvc3Bob3ItaHdtb24gd2l0aG91dCBlbnRpdHkgbWFuYWdlcg0KICAg
ID4gYW5kIGRidXMtc2Vuc29ycy4NCiAgICA+IA0KICAgID4gUmVnYXJkcw0KICAgID4gLVZpamF5
DQogICAgPiANCiAgICA+ICAgICAtSmFtZXMNCiAgICA+IA0KICAgIA0KICAgIA0KDQo=
