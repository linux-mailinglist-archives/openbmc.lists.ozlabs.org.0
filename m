Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F912B9747
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 20:35:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zj7s0LDjzDqll
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 04:35:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4166e25665=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="aVb4MPuQ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="QfVK/klv"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zj723mTvzDsRH
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 04:34:37 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8KIYCn2023911; Fri, 20 Sep 2019 11:34:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Px4RqGarikOkHan2NwbrfvH7hiZKe1a21tFkzgVyXOE=;
 b=aVb4MPuQ6+FHMdJFpRaGntYIj73rjWnmVhKYXvtQoBwjkawPubgFZiwmBR1BvhG3ej+p
 qd/OtI6QB8kU9gUpo1LyAMDW4RyN4h2YOFlsCo4Kuy3APABVrv+Tr0VCdWF7RmN+TlKT
 KoOQTNeQ6hC0FiUBdQRK+D2cD4NxbQ5YD1c= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v4y4fsh5j-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 11:34:26 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 20 Sep 2019 11:34:02 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Sep 2019 11:34:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lph/fcUlren/B3Mp4VyeZGtsn7dm9Z+57K+/F5n6veak8rxtyKipjxMkbN1BWw86vQ1Z2HpLcWOy/HrHXQrNsp7Ezrmm+pcwQDwUI1oWsNS9cbprU+iJKU4jwmooEYeLCLlLVudNcnzHWIbFB5ol63DtXssXVRSXSJ6peLxfMQYiSiubeF1dpq6qPBWBtqKSKA5fhQDvucxNRP5dH/bgxhcmpRFiPw23K1fbhf4Ne2qtbv25euefyeRx//OBwCKjCw60jkIRvcd5RCqHBVJubSfp3fV7MSkFEjNEnuok5WCg4/rwJD2S+QlF6R1mUbanGU6m/lyEbvMSruM3vlEQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px4RqGarikOkHan2NwbrfvH7hiZKe1a21tFkzgVyXOE=;
 b=P4r+MzrZs7cHVJosGwcZj2mvw/2AQlFzH0rw6BjvhySyqVdKowj55zLxZx3ZN32e0j1K8yERwJAL1zfzLk662sAvN8FT5LUE3DuzZWbFfN2yFEgoV2fqxIKfbAg/WoqsNV39cECjzPcKGZnHYAvNIi23WKRE3VFXzKOulFrPqrlILmeRWywIvnb2bBQO12SHngo9y+Tbu2odxNQ7k+occwrBumAlBQqEwNt9K8hFTLD1/SUX+Vjv7Sy0BtFovagujZQWJ4K5GX+bUOHBJXqjLkc+y8P/tHAcAO4YdLFzjy1hZE6il910iI1XUjV7mgjecRr96Vkc1ooeMCWPL1H9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px4RqGarikOkHan2NwbrfvH7hiZKe1a21tFkzgVyXOE=;
 b=QfVK/klvrq3lQpptdHWqiTZW/Unkg1y23zxj2YAGUWiAKpDQgnGTzbishZ/ViTb1ZI3p8oNg2AcJkNyftCPFnEF2+Bs8NquQdmRizujbBxMFwsQuj7+VMQdx1nbtUrirfP436SgY+jiPOHCq7CxaVZOdTmGYJZWLZJ9qwmE39S4=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3619.namprd15.prod.outlook.com (52.133.253.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 18:34:01 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 18:34:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Lei YU <mine260309@gmail.com>,
 Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Machine name in Code update
Thread-Topic: Machine name in Code update
Thread-Index: AQHVbxYzp8m43rLBBkaZTQXTNLl9nqcz1foAgADjgQD//7bwAA==
Date: Fri, 20 Sep 2019 18:34:00 +0000
Message-ID: <F3969E3B-B2FB-4257-B053-6FF2FAFD3FC7@fb.com>
References: <90E110C3-D171-4E85-9558-D1A0631C265A@fb.com>
 <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
 <1b08815f-5258-2635-ce2d-9c0e0e51e3e0@linux.ibm.com>
In-Reply-To: <1b08815f-5258-2635-ce2d-9c0e0e51e3e0@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:153b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33c2b958-ea85-41ce-5a1e-08d73df91b5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR15MB3619; 
x-ms-traffictypediagnostic: BY5PR15MB3619:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3619DE4CC756452FBFCE6FE0DD880@BY5PR15MB3619.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(305945005)(6116002)(71190400001)(86362001)(7736002)(486006)(71200400001)(102836004)(2616005)(11346002)(14454004)(53546011)(478600001)(6506007)(966005)(186003)(36756003)(25786009)(76176011)(256004)(14444005)(476003)(99286004)(446003)(4326008)(46003)(6246003)(81156014)(33656002)(81166006)(8676002)(91956017)(76116006)(8936002)(5660300002)(54906003)(66946007)(316002)(110136005)(64756008)(6436002)(6486002)(229853002)(2906002)(66446008)(66556008)(66476007)(15650500001)(6306002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3619;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2CbYdgifTKypxd+gVomx+n9LwMSVpapL6z/LwXlhFDFq9NO9A/zujsVyFdcIAb+bDi0cfsW09g1G2FtI6Vs1l4isH43ZvjuolpHLqD6S0da12FLXmHB9kpdvQ4IxKVows4fQljeoI1E0bZQ8qFUQ2NKZyuv1Qe5NM+q359wOzfdzd4nX3Vq42sZnznc3kYyHTE3Biimcb+QQk7Rj3vEJCtewOqQ/ENxXO9Dx2D1GiuOIr7a722A4YTK7v5r9905NIytDPkKFs6WiuERxaYMOsfrnmtphK2/ShC4/CMqLRFvjFI0opGGCaKVmsfwz+gZGJsi2IdzN52yHsOfO6sPSjWB89QVXGT5Pu7J1ot5PcFv089bd5qJ1h8hkwcoA4chrXtvm2s6sv6ZHLxFVbUQ7XzkioCGjD7QzbT3tpzIKRD8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <186F6B25AC46C040B0F32828B831A0CB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c2b958-ea85-41ce-5a1e-08d73df91b5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 18:34:01.0072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +V683kfZnGCpdIC46g86cG3ol8m0dLrnkgNZbeVuWQWaqXWEl8fNGZ3tYplcrgoRbtJ7XNqgtDpTWc03B10OHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3619
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_06:2019-09-20,2019-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909200153
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
Cc: "openbmc @ lists . ozlabs .
 org" <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Ben Wei <benwei@fb.com>, "ed.tanous@intel.com" <ed.tanous@intel.com>,
 Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjAvMTksIDg6NTUgQU0sICJKb3NlcGggUmV5bm9sZHMiIDxqcmV5QGxpbnV4
LmlibS5jb20+IHdyb3RlOg0KDQogICAgDQogICAgT24gOS8xOS8xOSA5OjIxIFBNLCBMZWkgWVUg
d3JvdGU6DQogICAgPiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAyOjE1IEFNIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+PiBUZWFtLA0KICAgID4+DQogICAg
Pj4gSSBhbSB0cnlpbmcgdG8gYWRkIGEgZmVhdHVyZSBvZiB2ZXJpZnlpbmcgbWFjaGluZSBuYW1l
IHdoaWxlIHVwZ3JhZGluZyBCTUMgaW1hZ2UuIEkgaGF2ZSBzdWJtaXR0ZWQgYSBjb3VwbGUgb2Yg
cGF0Y2hlcywgMS4gV2hpY2ggYWRkcyBtYWNoaW5lIG5hbWUgaW4gbWFuaWZlc3QgZmlsZSBhbmQg
Mi4gV2hpY2ggdmVyaWZpZXMgbWFjaGluZSBuYW1lIGZyb20gbWFuaWZlc3QgdG8gb3MtcmVsZWFz
ZSBmaWxlLiBCZWxvdyBhcmUgMiBnZXJyaXQgcmV2aWV3IHBhdGNoLg0KICAgID4+DQogICAgPj4g
aHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJy
aXQub3BlbmJtYy0yRHByb2plY3QueHl6Xy0yM19jX29wZW5ibWNfbWV0YS0yRHBob3NwaG9yXy0y
Ql8yNTMyNF8mZD1Ed0lEYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25U
WENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPWFyTUhocnp6QkhVTXlJXzMwYXZnN2Vw
cFBUdzlESVpKb05WWXEyMEhybzAmcz03Zm9nLTNlekZuZWlOYk5lRlRzQnhPcTVlY2lTZ0IyMUpD
b3ZjRk1FSlhrJmU9IA0KICAgID4+DQogICAgPj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9p
bnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6Xy0y
M19jX29wZW5ibWNfcGhvc3Bob3ItMkRibWMtMkRjb2RlLTJEbWdtdF8tMkJfMjUzNDRfJmQ9RHdJ
RGFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4
MHZYa2tjcklhcVU3VVNsNWcmbT1hck1IaHJ6ekJIVU15SV8zMGF2ZzdlcHBQVHc5RElaSm9OVllx
MjBIcm8wJnM9Wi1Sd1RRMktvbU16U2FNVUdxeWFyY2ZSZjlFZktlUUU1Q0d0ZmVxTWZSZyZlPSAN
CiAgICA+Pg0KICAgID4+DQogICAgPj4gSSBoYXZlIHJlY2VpdmVkIHNvbWUgdmFsdWFibGUgZmVl
ZGJhY2sgb24gZGVzaWduIGFwcHJvYWNoIGFuZCBJIGFncmVlZCB3aXRoIHNvbWUgb2YgdGhlbS4g
TGV0IG1lIGV4cGxhaW4gY29tcGxldGUgdGhvdWdodCBoZXJlIGFuZCBwbGVhc2UgcHJvdmlkZSB5
b3VyIHZhbHVhYmxlIGZlZWRiYWNrIGFzIHdlbGwgYXMgbmV3IGlkZWFzLg0KICAgID4+DQogICAg
Pj4NCiAgICA+Pg0KICAgID4+IEN1cnJlbnRseSBhdmFpbGFibGU6DQogICAgPj4NCiAgICA+PiA9
PT09PT09PT09PT09PT09DQogICAgPj4NCiAgICA+PiBDdXJyZW50bHksIFNvZnR3YXJlIHVwZGF0
ZXIgdXBkYXRlcyBpbWFnZSBiYXNlZCBvbiB2ZXJzaW9uIHJlYWRpbmcgYW5kIHB1cnBvc2UgZnJv
bSBtYW5pZmVzdCBmaWxlLg0KICAgID4+DQogICAgPj4gSSBmaW5kIGhlcmUgYSBzZWN1cml0eSBp
c3N1ZXMgb2YgdXBncmFkaW5nIGFuIGltYWdlIHdoaWNoIHdhcyBidWlsdCBmb3IgZGlmZmVyZW50
IG1hY2hpbmUgYW5kIHVwZ3JhZGVkIHRvIEJNQyB3aXRoIGRpZmZlcmVudCBwbGF0Zm9ybS4NCiAg
ICA+Pg0KICAgID4gKyBAQWRyaWFuYSBLb2J5bGFrDQogICAgPg0KICAgID4gQW5kIGhlcmUgaXMg
bXkgdGhvdWdodDoNCiAgICA+ICogSW5pdGlhbGx5IEkgd2FudGVkIHRvIGFkZCBzdWNoIGNoZWNr
IHRvIG1ha2Ugc3VyZSBhIEJNQyBpcyBub3QgdXBkYXRlZCB3aXRoDQogICAgPiAgICBhIGRpZmZl
cmVudCBCTUMgYnVpbGQuDQogICAgPiAqIExhdGVyIHRoZSBzaWduYXR1cmUgYW5kIHZlcmlmaWNh
dGlvbiBjb2RlIGlzIGFkZGVkLCBhbmQgdGhlIHRhcmJhbGwgY29udGFpbnMNCiAgICA+ICAgIHNp
Z25hdHVyZXMuDQogICAgPiAgICBJbiBwcmFjdGljZSBhbmQgaW4gZmllbGQsIHRoZSBkZXBsb3ll
ZCBCTUNzIHdpbGwgbm90IGJlIHVzaW5nIHRoZSAiZGVmYXVsdCINCiAgICA+IG9wZW5ibWMga2V5
LCBhbmQgdGh1cyBhbnkgdXBkYXRlIHNoYWxsIGJlIHVzaW5nIGEgc2lnbmVkIHRhcmJhbGwuIFRo
ZSBvbmUgd2hvDQogICAgPiBnZW5lcmF0ZXMgdGhlIHNpZ25lZCB0YXJiYWxsIHNoYWxsIG1ha2Ug
c3VyZSB0aGUgYnVpbGQgbWF0Y2hlcyB0aGUgbWFjaGluZS4NCiAgICA+DQogICAgPiBTbyBJIHRo
aW5rIHRoZSAic2VjdXJpdHkgaXNzdWUiIGlzIG5vdCByZWFsbHkgYSBwcm9ibGVtLg0KICAgIA0K
ICAgIFRoZXJlIGNhbiBiZSB0d28gbWVjaGFuaXNtcyB0byBwcmV2ZW50IHRoZSB3cm9uZyBpbWFn
ZSBmcm9tIGJlaW5nIGxvYWRlZCANCiAgICBvbnRvIHRoZSBCTUMuDQogICAgMS4gQ2hlY2sgdGhl
IG5ldyBmaXJtd2FyZSBpbWFnZSdzIGRpZ2l0YWwgc2lnbmF0dXJlLg0KICAgIDIuIENoZWNraW5n
IHRoZSBuZXcgZmlybXdhcmUgaW1hZ2UncyBtYWNoaW5lIHR5cGUuDQogICAgDQogICAgQm90aCBv
ZiB0aGVzZSBjYW4gd29yayB0b2dldGhlci4gICBGb3IgZXhhbXBsZSwgY29uc2lkZXIgYW4gZW52
aXJvbm1lbnQgDQogICAgd2hlcmUgdHdvIG1hY2hpbmUgdHlwZXMgYXJlIHN1cHBvcnRlZC4gIFdv
dWxkIGVhY2ggbWFjaGluZSB0eXBlIGhhdmUgaXRzIA0KICAgIG93biBkaWdpdGFsIHNpZ25pbmcg
a2V5PyAgSWYgdGhlIGtleSB3YXMgc2hhcmVkLCB5b3UgbWlnaHQgc3RpbGwgYmUgYWJsZSANCiAg
ICB0byBsb2FkIGEgZmlybXdhcmUgaW1hZ2Ugb250byB0aGUgd3JvbmcgQk1DLCBhbmQgZXZlbiB0
aG91Z2ggaXRzIA0KICAgIHNpZ25hdHVyZSBjaGVja2VkIG91dCBva2F5LCBpdCB3b3VsZCBiZSBm
b3IgdGhlIHdyb25nIG1hY2hpbmUgdHlwZS4NCiAgICANCiAgICBGaW5hbGx5LCBoYXZlIHdlIHdv
cmtlZCBvdXQgaG93IHRvIHJlY292ZXIgd2hlbiB5b3VyIHByaXZhdGUgc2lnbmluZyBrZXkgDQog
ICAgaGFzIGJlZW4gY29tcHJvbWlzZWQ/ICBPciB0aGUgcHVibGljIGtleSBzdG9yZWQgaW4gdGhl
IEJNQyBoYXMgYmVlbiANCiAgICBkYW1hZ2VkIChhbHRlcmVkKT8gIEl0IG1pZ2h0IGJlIG5pY2Ug
dG8gaGF2ZSB0aGUgIm1hY2hpbmUgdHlwZSIgY2hlY2sgDQogICAgaW5kZXBlbmRlbnQgb2YgdGhl
IGRpZ2l0YWwgc2lnbmF0dXJlIGNoZWNrLg0KICAgIA0KICAgIA0KICAgIEkgdW5kZXJzdGFuZCB0
aGlzIGVtYWlsIGlzIGZvY3VzZWQgb24gdHJ5aW5nIHRvIHByZXZlbnQgY29kZSB1cGRhdGUgd2l0
aCANCiAgICB1bmludGVuZGVkIGZpcm13YXJlIGltYWdlcywgYnV0IEkgc2VlIGFkZGl0aW9uYWwg
c2VjdXJpdHkgDQogICAgY29uc2lkZXJhdGlvbnMuICBGb3IgZXhhbXBsZSwgYXR0YWNrZXJzIGNh
biBkb3duZ3JhZGUgdGhlIEJNQyB0byBhbiANCiAgICBvbGRlciByZWxlYXNlIHRoYXQgaGFzIGtu
b3duIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdGllcyAoYSAiZG93bmdyYWRlIA0KICAgIGF0dGFjayIp
IGFuZCBleHBsb2l0IHRoZW0uICBUbyBoZWxwIHByZXZlbnQgdGhhdCwgd2Ugd2FudCB0byBpbmNs
dWRlIGEgDQogICAgdmVyc2lvbiBjaGVjayBhcyBwYXJ0IG9mIGNvZGUgdXBkYXRlLCBhbmQgcmVx
dWlyZSBhZGRpdGlvbmFsIGF1dGhvcml0eSANCiAgICB0byBkb3duZ3JhZGUuICBTb21lIGFkdm9j
YXRlIGZvciBzZW1hbnRpYyB2ZXJzaW9uaW5nOiANCiAgICBodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2VuLndpa2lwZWRpYS5vcmdfd2lraV9Tb2Z0
d2FyZS01RnZlcnNpb25pbmcmZD1Ed0lEYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlN
VTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPWFyTUhocnp6QkhVTXlJ
XzMwYXZnN2VwcFBUdzlESVpKb05WWXEyMEhybzAmcz1nVVZBS2JUMzQ2aHkxbWt0MlFoZS0yaTVv
d0hQT2ViLW1Sa3pfMXRIVGdrJmU9IA0KICAgIA0KICAgID4NCiAgICA+IEJ1dCBJIHN0aWxsIGxp
a2UgdGhlIGlkZWEgdG8gY2hlY2sgdGhlIG1hY2hpbmUgbmFtZSB0byBwcmV2ZW50IGluY29ycmVj
dA0KICAgID4gdXBkYXRlcyBhY2NpZGVudGFsbHkuDQogICAgPg0KICAgID4+IERlc2lnbiBhcHBy
b2FjaDoNCiAgICA+Pg0KICAgID4+ID09PT09PT09PT09PT09DQogICAgPj4NCiAgICA+PiBBcyBJ
IHNlZSB0aGF0IHdoaWxlIGJ1aWxkaW5nIGltYWdlLCB0aGVyZSBpcyBhIC9ldGMvb3MtcmVsZWFz
ZSBmaWxlIHdoaWNoIGdldHMgY3JlYXRlZCBhbmQgaW5jbHVkZXMgdmVyc2lvbiwgbWFjaGluZSBu
YW1lIGFzIE9QRU5CTUNfVEFSR0VUX01BQ0hJTkUuIFRoaXMgbWFjaGluZSBuYW1lIGlzIG5vdGhp
bmcgYnV0IGEgTUFDSElORSBkZWZpbmVkIGluIGJpdGJha2UgZW52aXJvbm1lbnQuIFNvIEkgdGhv
dWdodCBvZiB1c2luZyBzYW1lIE1BQ0hJTkUgdmFsdWUgdG8gYmUgYXBwZW5kZWQgaW4gTUFOSUZF
U1QgZmlsZSB3aGljaCBpcyBiZWluZyBwYXJzZWQgYnkgdXBkYXRlci4gQW5kIHZlcmlmeSB0aGlz
IGFnYWluc3QgcnVubmluZyBpbWFnZSByZWxlYXNlIGZpbGUgYmVmb3JlIHZhbGlkYXRpbmcgaW1h
Z2UuIFRoZXJlIGFyZSBmb2xsb3dpbmcgcXVlc3Rpb24gY29tZXMgaGVyZS4NCiAgICA+Pg0KICAg
ID4+DQogICAgPj4NCiAgICA+PiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5IDogRm9yIHRoaXMgd2Ug
Y2FuIGFsbG93IGltYWdlIHVwZ3JhZGUgaWYgbWFjaGluZSBuYW1lIGlzIG5vdCBkZWZpbmVkIGlu
IE1BTklGRVNUIGZpbGUgb3IgaWYgaXQgaXMgZGVmaW5lZCB0aGFuIGl0IHNob3VsZCBtYXRjaCB0
byBjdXJyZW50IHJ1bm5pbmcgaW1hZ2UuDQogICAgPiBZZXMsIEkgcHJlZmVyIHRvIGtlZXAgYmFj
a3dhcmQgY29tcGF0aWJpbGl0eSBmb3IgYSBmZXcgcmVsZWFzZSBjeWNsZXMuDQogICAgPiBFLmcu
IGluIDIuNyBhbmQgMi44LCBsZXQncyBtYWtlIGl0IHN1cHBvcnQgdGFyYmFsbHMgd2l0aG91dCBt
YWNoaW5lIG5hbWUuDQogICAgPiBBbmQgaW4gMi45LCBtYWtlIG1hY2hpbmUgbmFtZSBtYW5kYXRv
cnkuDQogICAgPiBXaGF0IGRvIHlvdSB0aGluaz8NCiAgICANCiAgICBUaGUgc3RhZ2luZyBwbGFu
IG1ha2VzIHNlbnNlLCBidXQgd2UgbWF5IHdhbnQgdG8gY29uc2lkZXIgbW9yZSB1c2UgDQogICAg
Y2FzZXMuICBGb3IgZXhhbXBsZSwgY29uc2lkZXIgd2hhdCBoYXBwZW5zIHdoZW4gd2Ugc2NyYXAg
b3IgcmUtcHVycG9zZSBhIA0KICAgIHN5c3RlbS4gIFRoZSBCTUMgZ2V0cyBwdWxsZWQgb3V0IGFu
ZCBtYXkgYmUgcmUtdXNlZCBmb3IgYSBkaWZmZXJlbnQgDQogICAgdGFyZ2V0IG1hY2hpbmUuICBU
byBzdXBwb3J0IHRoaXMsIHdlIG1pZ2h0IGNvbnNpZGVyIGEgd2F5IHRvIG92ZXJyaWRlIG9yIA0K
ICAgIGZvcmNlIGEgbmV3IGltYWdlIG9udG8gdGhlIEJNQyByZWdhcmRsZXNzIG9mIHRoZSBtYWNo
aW5lIHR5cGUgaXQgDQogICAgY3VycmVudGx5IHN1cHBvcnRzLg0KV2UgY2FuIGNlcnRhaW5seSBh
ZGQgdGhpcyBmZWF0dXJlIG9mIGZvcmNlZnVsIHVwZ3JhZGUgd2l0aG91dCBhbnkgY2hlY2sgDQpv
ZiBtYWNoaW5lIGFuZCB2ZXJzaW9uLg0KICAgIA0KICAgIEFuIGFsdGVybmF0ZSBjb25mbGljdGlu
ZyB2aWV3cG9pbnQgaXMgdG8gbG9jayBkb3duIHNlY3VyaXR5IHNvIHRoZXJlIGlzIA0KICAgIG5v
IHdheSB0byB1cGRhdGUgdGhlIEJNQyB3aXRoIGFuIGltYWdlIHRoYXQgc3VwcG9ydHMgdGhlIHdy
b25nIG1hY2hpbmUgDQogICAgdHlwZS4gIEluIHRoaXMgY2FzZSwgZmxhc2hpbmcgdGhlIEJNQyBp
cyB0aGUgb25seSBlc2NhcGUuIFdlIGNhbiBkbyB0aGF0IA0KICAgIGluIHRoZSBkZXZlbG9wbWVu
dCBsYWIsIGJ1dCBub3QgYWxsIGZhY2lsaXRpZXMgaGF2ZSB0aGF0IGNhcGFiaWxpdHkuDQpXZSBj
YW4gYWRkIGFub3RoZXIgZmVhdHVyZSBvZiBOT19NQUNISU5FX0NIRUNLIGF0IGJ1aWxkIHRpbWUN
CiAgICANCiAgICA+PiBWYWxpZGF0aW9uIGxldmVsOiBDdXJyZW50IGNvZGUgdXBkYXRlciBzdXBw
b3J0cyB1cGdyYWRlIGZvciBob3N0LCBibWMgYW5kIHBzdSBhbGwgZmlybXdhcmUuIFNvIEkgYW0g
bm90IHN1cmUgaWYgbWFjaGluZSBuYW1lIGlzIGdvaW5nIHRvIGJlIHNhbWUgZm9yIGFsbCBjb21w
b25lbnRzIG9yIGl0IGlzIGRpZmZlcmVudC4gSW4gbXkgdW5kZXJzdGFuZGluZywgYWxsIGNvbXBv
bmVudHMgc2hvdWxkIGhhdmUgc2FtZSBtYWNoaW5lIG5hbWUgaWYgdGhleSBhcmUgcGFydCBvZiBz
aW5nbGUgbWFjaGluZS4gSSBhbSBvcGVuIHRvIGRpc2N1c3MgdGhpcyBwb2ludCBhcyBJIGFtIG5v
dCBzdXJlIGhvdyBldmVyeW9uZSBlbHNlIGlzIGRlZmluaW5nIGl0Lg0KICAgID4gSSBhZ3JlZSB3
aXRoIHRoaXMgb25lLg0KICAgID4gQWRkaW5nIG1hY2hpbmUgbmFtZSBmb3IgYWxsIHRhcmJhbGxz
IChCTUMsIGhvc3QsIFBTVSkgbWFrZXMgc3VyZSB0aGUgaW1hZ2UgaXMNCiAgICA+IGZvciBhIHNw
ZWNpZmljIG1hY2hpbmUuDQogICAgPiBFdmVuIGlmIGFuIGltYWdlIGlzIG1lYW50IHRvIHN1cHBv
cnQgbXVsdGlwbGUgc3lzdGVtcyAoZS5nLiBhIFBTVSBpbWFnZSBtYXkgYmUNCiAgICA+IHVzZWQg
b24gZGlmZmVyZW50IHN5c3RlbXMgd2l0aCB0aGUgc2FtZSBQU1UpLCB0aGUgdXBkYXRlIGltYWdl
IGNvdWxkIGJlDQogICAgPiBnZW5lcmF0ZWQgKGFuZCBzaWduZWQpIGZvciB0aGUgc3BlY2lmaWMg
bWFjaGluZSBhcyB3ZWxsLg0KICAgIA0KICAgIFdoYXQgSSB3b3VsZCBsaWtlIHRvIHNlZSAoYnV0
IGRvbid0IGhhdmUgdGltZSB0byBwcm9wb3NlKSBpcyBhIGNoZWNrIA0KICAgIG1hZGUgZHVyaW5n
IGNvZGUgdXBkYXRlIHRoYXQgY2hlY2tzOg0KICAgIDEuIElzIHRoZSBuZXcgaW1hZ2UgaW4gdGhl
IHNhbWUgc2VyaWVzIGFzIHRoZSBjdXJyZW50IGNvZGU/ICBUaGF0J3MgeW91ciANCiAgICBtYWNo
aW5lIHR5cGUgY2hlY2suDQogICAgMi4gSWYgc28sIGlzIGl0IGEgaGlnaGVyLW51bWJlcmVkIGlt
YWdlPyAgVGhhdCBoZWxwcyBwcmV2ZW50IGFjY2lkZW50YWwgDQogICAgZG93bmdyYWRlcy4NCiAg
ICANCiAgICBJZiB0aGVzZSBjaGVja3MgZmFpbCwgd2UgY2FuIGVpdGhlciAoQSkgZ2VuZXJhdGUg
d2FybmluZ3MsIG9yIChCKSANCiAgICByZXF1aXJlIGFkZGl0aW9uYWwgY29uZmlybWF0aW9uIGZy
b20gdGhlIG9wZXJhdG9yIHRvIHByb2NlZWQsIG9yIChDKSANCiAgICByZWZ1c2UgdG8gbG9hZCB0
aGUgbmV3IGltYWdlLg0KQ2VydGFpbmx5IHdlIGNhbiBhZGQgbW9yZSBmbGV4aWJpbGl0eS4NCiAg
ICANCiAgICBJIHNlZSB0aGUgY2hlY2sgZm9yIG1hY2hpbmUgdHlwZSBhcyBhIHN0ZXAgaW4gdGhl
IHJpZ2h0IGRpcmVjdGlvbiwgc28gSSANCiAgICBhbSBpbiBmYXZvciBvZiBpdC4gIFRoYW5rcyEN
Cg0KVGhhbmtzLCBJIHdpbGwgc3RhcnQgd2l0aCBjdXJyZW50IHBsYW4gYW5kIGFkZCBtb3JlIGZl
YXR1cmUgZnVydGhlci4NCiAgICANCiAgICAtIEpvc2VwaA0KICAgIA0KICAgIA0KDQo=
