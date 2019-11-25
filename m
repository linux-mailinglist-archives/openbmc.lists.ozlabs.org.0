Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC01095EC
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 00:04:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MMzb6pKzzDqcV
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 10:04:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=623285b47d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="cJq4RHqM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="i97opKcs"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MMyk1S2CzDqZQ
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 10:03:23 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xAPMvO5e032538;
 Mon, 25 Nov 2019 15:02:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=BBYd9GVCN6J0CyMH4jhDVSTOW5BG7zQkBmsG012fVrQ=;
 b=cJq4RHqMSRyWpjrVUEGWkhxh7JZZXNTOYyAgZaNb7B/xLw4iztqRlmTB2Zgqjv7ktV4M
 Se+wLILXKZsDmYG/sC6ohbWTzXiVRsT4e4tRKgQL8LTDQJwtPqoGy+pr8SAqC2eZBC3i
 fHhBGZc9ngohIpt0i3zmL6dsyJ8T4bu1S6M= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2wf1ap48w8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 15:02:16 -0800
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 25 Nov 2019 15:02:16 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 25 Nov 2019 15:02:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CV8Lv5UdudNvfr3SSM46POIJrjlFPJCp9lMgCIof8e9iwIJJbJJxOY6OYPL6+hqQDgigUyQpuCWdgoybN5ZSgLzojCrxcMFlfMjY4krG2J63fROiRZxBpXcUhR2UONO/WekOD3ZGMnmfBuhSzEzfXp8vawelBfBjbzieEaCTZEH2UTyl9KWAxIqtzVhjx3bIiCVafWe5/cUZ/TkUxiTN7oTgEzZboAYM2ESvWUT8mM5SRPU0f272U9lKQivyYLKTWSDBD6W43+PV75+kfAVzMP2q0WBntGcsYg/4AhmBm8aiSQsAE6OK9xbbV+rJuzSkp0dFmLgl7+cP0MgGoJGOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYd9GVCN6J0CyMH4jhDVSTOW5BG7zQkBmsG012fVrQ=;
 b=oHG7F2Ud2YlNHK6l/fSStdeP3EGWtAQDbrRu+qVOJj+ZqDQrjt0+ldnDFVumEfxYNoZZucj1gthUuMlIVpCHPRYVDg+n5PoPpXf4kcaTfomUWBwAAcw0KBAksSzG40pGTVFvEJY3k+LzPbXoDFc9S5012wvrU+uYB8DIdiLSLr0oB8JmYg6VAC+1PrPBER6dNHlbMVDFgDRiz5Kw4d93ysvVn0RaQmjVu2h5VK1/xSuqBqXFkwQJ5+QUN7ZFxEIMW6q7Hguc87pPskKFZnY4g9Oy8EqYXcCUk32ghqMVeuXKLyr1nuzURMUWCLtraiCFUqrlpf6hiCSvnj5HFYvpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYd9GVCN6J0CyMH4jhDVSTOW5BG7zQkBmsG012fVrQ=;
 b=i97opKcsUWIJuJxfZ1Ya5j0X8b6ch2HpqicnSQTPsvDX9OQNvgt0OpwiyIr3/ZkjYPhksPMa3S1YgMDqfr+XDRLs9ju0y9ltXXi5HIJyg2D3Jod6eaW99E66u6BfQmulSPfAXtdvQT0E0lz/BX/Bd80d6V3y2VXBP0foRXPlxfE=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1119.namprd15.prod.outlook.com (10.175.8.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18; Mon, 25 Nov 2019 23:02:14 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376%11]) with mapi id 15.20.2474.023; Mon, 25 Nov
 2019 23:02:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Re: i2c error for ME port
Thread-Topic: i2c error for ME port
Thread-Index: AQHVo8gV2NOlHgDr9k+GwqBCoAIdRaecSPkAgAALJ4D//6bxAA==
Date: Mon, 25 Nov 2019 23:02:14 +0000
Message-ID: <C4ECF587-E301-4FB7-AF5A-BB20F90F9083@fb.com>
References: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
 <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
 <69833bb8-89b6-2b06-818a-c8d16ce19ca5@linux.intel.com>
In-Reply-To: <69833bb8-89b6-2b06-818a-c8d16ce19ca5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:182d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70b984e0-5eea-49f8-d78c-08d771fb82d0
x-ms-traffictypediagnostic: MWHPR15MB1119:
x-microsoft-antispam-prvs: <MWHPR15MB11195D16B407AB61C11B44B1DD4A0@MWHPR15MB1119.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(25786009)(7736002)(186003)(71200400001)(4326008)(33656002)(81156014)(71190400001)(53546011)(102836004)(76176011)(6436002)(6506007)(6246003)(229853002)(8936002)(76116006)(66946007)(66476007)(110136005)(64756008)(66446008)(5660300002)(66556008)(81166006)(99286004)(256004)(46003)(2501003)(6512007)(446003)(8676002)(2616005)(11346002)(14454004)(6486002)(6116002)(498600001)(36756003)(2906002)(305945005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1119;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qykc/EAnDZa02/+S2qeX/hCirKATN9kkDaonoWymt/MHQ1d9xWvrpzb6aAkpMggAA227M7XdYrtgSQPHfhM5JNqRspmr9HlNSEFtlrg8hUbnz5bMIJMQDUAi/IrpdprMgUDMLAHnD9jg+XTk0Qlk04hX2b0GMYWOzMAmjGPjbKc2CTe6WdQQyuwuOJ/9878VECieVihFz2gcxlz/hhlwRmonw7JhWgvl+5+9/r3v7bX14W3ZPGCwUGjCGCU/Ndjmd61wBPylswhNyfWJcKEsXpM8Y/9FOjI/ESL1ljvXFXNvbSwqAH+zuTEq8Gp8aTeQfgK73aAoC9NgUa4wH/jv7yZPlshrX00qlb9XBApgZ9/4yeAWCKHfzzUr9qxWgZGeQdg090dOuAFnx38rn1YJtcSqd9kaO4HdZuKlXI0oqhvsX81bJXQrz1mUMmqr8/ZJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <45244C92DA88DF468807854D83328AFA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b984e0-5eea-49f8-d78c-08d771fb82d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 23:02:14.0709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOllYHM4FkZlCTUY2u/U/UMVv/LbWrxdqCUuimtEmcAbHj5LlcOOZ2rq+zffeD1GxOMJ43MfkWFod67VEO2zMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1119
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_06:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911250181
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

DQoNCu+7v09uIDExLzI1LzE5LCAxMjoyMSBQTSwgIkphZSBIeXVuIFlvbyIgPGphZS5oeXVuLnlv
b0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQogICAgSGkgVmlqYXksDQogICAgDQogICAgT24g
MTEvMjUvMjAxOSAxMTo0MSBBTSwgSmFtZXMgRmVpc3Qgd3JvdGU6DQogICAgPiBPbiAxMS8yNS8x
OSAxMTozOSBBTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4+IEhpIEphbWVzL0phc29uLA0K
ICAgID4gDQogICAgPiArIEphZSwgYW55IGlkZWFzPw0KICAgID4gDQogICAgPiANCiAgICA+Pg0K
ICAgID4+IEkgYW0gc2VlaW5nIGZvbGxvd2luZyBpMmMgZXJyb3Igb24gaTJjIGJ1cyBjb25uZWN0
ZWQgdG8gTUUuIEl0IGlzIG9uZSANCiAgICA+PiB0aW1lIG91dHB1dCB3aGVuZXZlciBzZXJ2ZXIg
aXMgcG93ZXJlZCBvbiBvciByZWJvb3QuIFBsZWFzZSBzdWdnZXN0IA0KICAgID4+IHlvdSBjYW4g
dGhpbmsgb2YgYW55dGhpbmcgaGVyZS4NCiAgICA+Pg0KICAgID4+IFJlZ2FyZHMNCiAgICA+Pg0K
ICAgID4+IC1WaWpheQ0KICAgID4+DQogICAgPj4gWyA3MzU4LjQ1MDc2OF0gYXNwZWVkLWkyYy1i
dXMgMWU3OGExNDAuaTJjLWJ1czogRXhwZWN0ZWQgQUNLIGFmdGVyIA0KICAgID4+IHByb2Nlc3Nl
ZCByZWFkLg0KICAgID4+DQogICAgPj4gWyA3MzU4LjQ2NTU2NV0gYXNwZWVkLWkyYy1idXMgMWU3
OGExNDAuaTJjLWJ1czogRXhwZWN0ZWQgQUNLIGFmdGVyIA0KICAgID4+IHByb2Nlc3NlZCByZWFk
Lg0KICAgID4+DQogICAgPj4gWyA3MzU4LjQ4MDM1OF0gYXNwZWVkLWkyYy1idXMgMWU3OGExNDAu
aTJjLWJ1czogRXhwZWN0ZWQgQUNLIGFmdGVyIA0KICAgID4+IHByb2Nlc3NlZCByZWFkLg0KICAg
ID4+DQogICAgPj4gWyA3MzU4LjQ5OTY2M10gYXNwZWVkLWkyYy1idXMgMWU3OGExNDAuaTJjLWJ1
czogRXhwZWN0ZWQgQUNLIGFmdGVyIA0KICAgID4+IHByb2Nlc3NlZCByZWFkLg0KICAgID4+DQog
ICAgPj4gWyA3MzU4LjUxNDg3M10gYXNwZWVkLWkyYy1idXMgMWU3OGExNDAuaTJjLWJ1czogRXhw
ZWN0ZWQgQUNLIGFmdGVyIA0KICAgID4+IHByb2Nlc3NlZCByZWFkLg0KICAgID4+DQogICAgPj4g
WyA3MzU4LjU5MTc5MF0gYXNwZWVkLWkyYy1idXMgMWU3OGExNDAuaTJjLWJ1czogaXJxIGhhbmRs
ZWQgIT0gaXJxLiANCiAgICA+PiBleHBlY3RlZCAweDgwMDAwMDg0LCBidXQgd2FzIDB4MDAwMDAw
ODQNCiAgICANCiAgICBMb29rcyBsaWtlIHlvdSBzZXQgdGhlIHNlY29uZCBzbGF2ZSBhZGRyZXNz
IGZvciBpMmM0IGJ1cy4gSXQgaW5kaWNhdGVzDQogICAgJ2FkZHJlc3MgMicgbWF0Y2ggZXZlbnQg
YnV0IGN1cnJlbnQgZHJpdmVyIGRvZXNuJ3QgaGFuZGxlIHRoaXMgZXZlbnQuDQogICAgDQogICAg
Q2FuIHlvdSBzaGFyZSB5b3VyIGkyYzQgYnVzIG5vZGUgc2V0dGluZyBpbiBkZXZpY2UgdHJlZT8N
Cg0KJmkyYzQgew0KICBzdGF0dXMgPSAib2theSI7DQogIC8vIEJNQyBEZWJ1ZyBIZWFkZXINCiAg
aXBtYjBAMTAgew0KICAgIGNvbXBhdGlibGUgPSAiaXBtYi1kZXYiOw0KICAgIHJlZyA9IDwweDEw
PjsNCiAgICBpMmMtcHJvdG9jb2w7DQogIH07DQp9Ow0KICAgIA0KICAgIENoZWVycywNCiAgICAN
CiAgICBKYWUNCiAgICANCg0K
