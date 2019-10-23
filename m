Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9779E20D7
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 18:40:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yx2V5MFZzDqRq
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 03:40:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5199b5af04=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kcQIaEml"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jpGW8NUC"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yx1Q3B0fzDqRn;
 Thu, 24 Oct 2019 03:39:54 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NGdc0E013671; Wed, 23 Oct 2019 09:39:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ZwunrSZLfN75hI7nU+c5A/DVa8t7ApKSvYKq7LiuEEU=;
 b=kcQIaEml+L4ruYTTSmXFJsIUYJ7QXXI2X3n54MFfvW1hANuCSkvLvxKJmG5oyTVJtsv2
 3VOXF/n1gw3fMLbaZ0M1yf+5KoDQkdqa25wCtJJ4lT2PTfGtbWdate9qNNM9kx5SWgMz
 OBNlM41L6RCiBGIjIri2N3CJWE2zJtG7KuU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vt9tc48sv-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Oct 2019 09:39:43 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Oct 2019 09:39:40 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Oct 2019 09:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X12ZVJqfyVNSB+H8urN3Hm9ssE9keLNnNIX0DeFlcmvqfoHaWVTxmOAMXkorV3dwtag/etqq9JBt5VuP9HePPvbPBKFb3YruNBYUq3SlrX2s4fUvu7HaGWWsgqd0dYGSk4ZgTdnami9KSw8gMxgk69X80HqHxublEE411x88kZo/qmy53I/yEmfy83WAKhDhIpCdLc6lwPXrrniJm42EZETjY1QHWdHdrqDcUEuZWqbq1TLKt4vGbxvhz5kbrgfebmzxkYiGw8se36mZeWXgyKoHCVDZWnYq0/dHZfJ/a0yglcdQu1CfguhxHVV9RQJmUoZNvOoIAAuZKP7aswN4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwunrSZLfN75hI7nU+c5A/DVa8t7ApKSvYKq7LiuEEU=;
 b=Qg5WTjwHYEngqLTGwL/GCkJ3JpzEsxHbxOEuYx/cif9dooPszyvhq6lCW7PLsrzsxTdwyQ0eMZRNKBpxVdvEEoQNhkFzuvRpx9Ov0IhbbcOeJ8pGhYtlWaBlHYSn5LNDqVBhdgGI5wBZ2ZWHd0nwjmDFlIdUlLaE8QYIdSSCsL5gWLU90Pw80sUgS1abyw32NkuX/wZv+REbt6O5ziVO+X4tzhNBU7uvo7jdYmjrhd1cmax8FUfj3+J/N+ZroTZTYxDoC95CUaS5beklJPY7bm0AY+DsbCKlJPPdFKs6WwhSQDPvtn3YJU4liQmjPHbhaXN4zrNVIGLsvkNjpmci+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwunrSZLfN75hI7nU+c5A/DVa8t7ApKSvYKq7LiuEEU=;
 b=jpGW8NUCjXt5lf3DIGIyeaRNagXsw6LIPV1KfoxaW0Y2cgampTjDVAuHjUxZA1xbOXNc8cIXj8XlLP1kW+K9NO1MpA/GzAVnCAWxvYVIGG7PnzXw7IujouHlJ7l3BU2PeFxrsil0joL1SfeqC56AfyTdUJOwUVh+um2jaCsRpIY=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3697.namprd15.prod.outlook.com (52.133.255.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Wed, 23 Oct 2019 16:39:39 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2387.021; Wed, 23 Oct 2019
 16:39:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Adriana Kobylak <anoo@linux.ibm.com>, krtaylor <kurt.r.taylor@gmail.com>
Subject: Re: Improving the docs/ repo
Thread-Topic: Improving the docs/ repo
Thread-Index: AQHViPdoq8p5T2LViUCxKdIWQJScjadoQBEAgAAZbwD//6AkAA==
Date: Wed, 23 Oct 2019 16:39:39 +0000
Message-ID: <31BBC6ED-45CA-413A-9BE5-5A9887A3EA79@fb.com>
References: <2c77cbfb-9df5-278c-8f76-06193e125514@linux.vnet.ibm.com>
 <3a4d96b9-8810-e57b-690d-5fd791bc57c0@gmail.com>
 <ae161ca3003366f6e1f260b83d932cc1@linux.vnet.ibm.com>
In-Reply-To: <ae161ca3003366f6e1f260b83d932cc1@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:295c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52bdf145-13bc-4a19-88fc-08d757d798ff
x-ms-traffictypediagnostic: BY5PR15MB3697:
x-microsoft-antispam-prvs: <BY5PR15MB36970D2A312AE6BF765FE5BBDD6B0@BY5PR15MB3697.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(396003)(376002)(346002)(174864002)(52254002)(199004)(189003)(561944003)(6506007)(8936002)(81166006)(71200400001)(478600001)(6486002)(71190400001)(81156014)(229853002)(99286004)(256004)(14444005)(102836004)(14454004)(6512007)(8676002)(33656002)(486006)(53546011)(6116002)(305945005)(476003)(36756003)(54906003)(110136005)(86362001)(11346002)(4001150100001)(46003)(7736002)(186003)(6246003)(76116006)(6436002)(66946007)(446003)(25786009)(4326008)(316002)(2906002)(66446008)(66476007)(5660300002)(66556008)(76176011)(64756008)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3697;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sqfkwx6PktEcZEMgg3lG+aAIH95yQWe34dstoAcQkMVwtQQCVPEkfwarjW8i67wJpjg2qhpilsQgazoHaEJouMtoBu+CaBA9vHZBOuV94ebhKzAfJZVfjNxEZBQpex+qXiSAIhNBfc8Nn4jiT+Kg604/06KvEAFKGd7sMfEupYCvsxVa9wTHHr8aTA3AVR2zYvpdxHLZCZWSV+9Uselz1IQYLQv+YtDI4HUBfVvke9dskdxo78bRxeizo7no1JHkrk2imRBqdSugupXQ9yZh/dt0vFD0x3bhflqDOELTdGMwH9akhbkydaQBOGDdStDKyoY6Hxv5XfB9T298yTlj/wikWo97K1tK/iDUTSTvYc0Z/fSZ0jNPKnA9pIf1HcMwhE7LlhehUaiWmAgWz3YbBinVA4LhC0HbN2frTy798z5BYX5AKTIi1ad2MsB62s3I
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF08452743DAB645948CA2D587852DB1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bdf145-13bc-4a19-88fc-08d757d798ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 16:39:39.0634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xc8riFqdFn+exPimvJchjTRm7+efTLY6+H5WCifRdhAomlQ19oQKgxAgsMy2jto68M4EkmMdh0KmzY+zlRFvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3697
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 phishscore=0 mlxlogscore=851 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910230159
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEwLzIzLzE5LCA4OjIzIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQWRyaWFu
YSBLb2J5bGFrIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBhbm9vQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KDQogICAgT24g
MjAxOS0xMC0yMyAwODo1MSwga3J0YXlsb3Igd3JvdGU6DQogICAgPiBPbiAxMC8yMi8xOSAxMToz
OCBBTSwgR3VubmFyIE1pbGxzIHdyb3RlOg0KICAgID4+IExvb2tpbmcgdG8gaW1wcm92ZSB0aGUg
ZG9jcy8gcmVwb3NpdG9yeS4NCiAgICA+PiBJcyBhbnlvbmUgaW50ZXJlc3RlZCBpbiBnZXR0aW5n
IGludm9sdmVkIGluIGltcHJvdmluZyB0aGUgZG9jdW1lbnQgDQogICAgPj4gcmVwb3NpdG9yeT8g
TG9va2luZyBmb3IgZWl0aGVyIGlkZWFzIG9yIGNvbnRyaWJ1dGlvbnMuDQogICAgPj4gDQogICAg
Pj4gU29tZSBpZGVhczoNCiAgICA+PiBCZXR0ZXIgZG9jdW1lbnQgdGhlIHByb2Nlc3MgZm9yIHN1
Ym1pdHRpbmcgZG9jdW1lbnRzIHdoaWNoIHNob3VsZCANCiAgICA+PiBpbXByb3ZlIHRoZSBxdWFs
aXR5IG9mIGRvY3VtZW50YXRpb24gYmVpbmcgc3VibWl0dGVkLg0KICAgID4+IA0KICAgID4+IERl
c2lnbiB0ZW1wbGF0ZSBpbXByb3ZlbWVudCwgc3BlbGwgb3V0IGFueSBhZGRpdGlvbmFsIGV4cGVj
dGF0aW9ucyANCiAgICA+PiB0aGF0IGNvbWUgaW4gcmV2aWV3LiBFLmcuIEFsbCBmaWVsZHMgbXVz
dCBiZSBmaWxsZWQgb3V0LCBpbnZvbHZlIHRoZSANCiAgICA+PiBjb21tdW5pdHkgYmVmb3JlIHN1
Ym1pdHRpbmcgYSB0ZW1wbGF0ZSwgYXZvaWQgaW50ZXJuYWwgYWNyb255bXMsIA0KICAgID4+IGV4
cGFuZCBvbiB3aGVuIHRoZSB0ZW1wbGF0ZSBpcyBuZWVkZWQuDQogICAgDQogICAgSG93IGRvIHBl
b3BsZSBmZWVsIGFib3V0IGhhdmluZyBzbWFsbGVyIGNvbW1pdHMgZm9yIHRoZSBkb2NzLCBsaWtl
IHdlIA0KICAgIGVuY291cmFnZSBmb3Igc291cmNlIGNvZGU/IFdvdWxkIGl0IG1ha2UgaXQgZWFz
aWVyIHRvIHJldmlldz8gQW4gZXhhbXBsZSANCiAgICBmb3IgZGVzaWducyB3b3VsZCBiZSBvbmUg
Y29tbWl0IHdpdGggdGhlIHByb2JsZW0gc3RhdGVtZW50LCBuZXh0IGNvbW1pdCANCiAgICBhZGRz
IHRoZSByZXF1aXJlbWVudHMsIG5leHQgYWRkcyBvbmUgc29sdXRpb24gcHJvcG9zYWwsIGV0Yy4N
Cg0KSSBhZ3JlZSB3aXRoIEFkcmlhbmEuIFdlIGNhbiBhbHNvIGhhdmUgc29tZSBkaXJlY3Rvcnkg
c3RydWN0dXJlIGJhc2VkIG9uIGZlYXR1cmUNCm9yIGdyb3VwIG9mIGZlYXR1cmVzLiBBbmQgdW5k
ZXIgdGhlIGRpcmVjdG9yeSwgZWl0aGVyIGV2ZXJ5dGhpbmcsIGNhbiBiZSBsaWtlLCBkZXNpZ24s
DQpyZXF1aXJlbWVudCwgZnVuY3Rpb25hbGl0eSBkZXRhaWxzIGluIHNhbWUgZmlsZSBvciBjYW4g
aGF2ZSBtdWx0aXBsZSBmaWxlcy4gQnV0IGNlcnRhaW5seQ0Kd2UgbmVlZCB0byByZWFycmFuZ2Ug
aXQuIEFuZCBJIGFtIHVwIGZvciBpdC4NCiAgICANCg0K
