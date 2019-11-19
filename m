Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D72102FBA
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 00:11:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HhQk3Cd7zDqcR
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 10:11:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=62266bf8b7=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="D6d8UxZl"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="YXjmUrZd"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HhQ11l1KzDqg7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 10:10:47 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJMxMvr019840; Tue, 19 Nov 2019 15:10:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Yw3Vfgw3ZETsE60zEM/eRiMB4y+LUfU2tmK2tgpFfes=;
 b=D6d8UxZlFdLZbb8E4CkECJlkTdEa7zJrCIbEDOgpH2g7QuioeDqvH21HX5qbUqbgMzM6
 GoWNXTv0e5aG/J61XLS7efS4U9c6g+Rqx3ZK6wO48glQb1obXb2ta96KvYr/19oDvcss
 X7ervkU/biJ7J+f1dGKMlm13BVg5/i4PkaI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2wchewjs02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 Nov 2019 15:10:41 -0800
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 19 Nov 2019 15:10:40 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 19 Nov 2019 15:10:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6wYaMejwtPayliryrCvZRRkd/J69cp5WsQB8lXNrOPJPzEbUMIl7mIlW8YDzNiWNJ5U98EkuD3ZEb0Us4xGEdl5F8f3FuDcToNFNhJWLZPfePB9QRuGxsBlNathlLO6GGwiJNzmXLDVa27cd63JhK6h4K3DXLrEwb70wMdgrp9n3o6JgvqvwzqJqqmSwhRHIO+E9uAzk0BwQencUPP2dNuWdQcuk+nj9BW8D3a4BH+KFPJgzNcoTU/01Ay4UCpdO2TLELicdK8DT33Qij9sRTWHqjBrluVEnMTbghKfa1FEPxf5bTUyyMiwxMhPIPsz8LOg2gf94UuroBJATsXc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw3Vfgw3ZETsE60zEM/eRiMB4y+LUfU2tmK2tgpFfes=;
 b=GJLTtsFWCisZOssm8Gt9++5oEX10WB5LebDI2AAgPUJ4DpwakgOBeES/sRHfe0YR5+Bgj24WKc9UBa4ZasvPjYu07CSwjRqPZvSxduMip64xCR5jT8UxAyisTpuSIHMXbuMpomErRS+9aQiOfjkImM+e77gr3xro76EkYTtGu1b00PPLo+EWxjUtYYMejgbt6Ikdcvu3jDT4WCJ1cCoHFxhTeKez/y+KN9B2t+tE5b0iv7UmaOv75yGtJlSn6+WIzKICXXKomWvRsbf7ODqVmlcn/qft1oegMCUAJE71MLEtlNrPqJfEmKm/cqmrgLuJ+aAE8DiZtU90bn+957qVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw3Vfgw3ZETsE60zEM/eRiMB4y+LUfU2tmK2tgpFfes=;
 b=YXjmUrZd6Np/Um59FiOxA8txfpckTvJgeE5Ex0xrFWATHt4B2CyW+T6jlwmjTNHGekYldWzNxaRDK0oTnoqWr8QkC+7nqw631qCQfweQ9Ye20VBPzM1K76XFssBuzR9LDdXIC8cqCFufBdeJKID/k6M5Jfq3jypupwnfaMJqu+c=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3698.namprd15.prod.outlook.com (10.255.245.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 23:10:39 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2474.015; Tue, 19 Nov 2019
 23:10:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Re: phosphor watchdog for intel platform
Thread-Topic: phosphor watchdog for intel platform
Thread-Index: AQHVnxUb/23TiP8U1U6PsH5UMbH54aeTBVoA//+TfYA=
Date: Tue, 19 Nov 2019 23:10:39 +0000
Message-ID: <5C914A56-D2FF-4458-B230-F29734011798@fb.com>
References: <2432F395-A8D9-4026-8E74-E14B00799DAA@fb.com>
 <73c2b5f7-4838-c985-d578-cfd0cfaf6df9@linux.intel.com>
In-Reply-To: <73c2b5f7-4838-c985-d578-cfd0cfaf6df9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:edba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c55f57d-eff2-44fd-9006-08d76d45b1c4
x-ms-traffictypediagnostic: BY5PR15MB3698:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB36984B79F901D38A8B866A85DD4C0@BY5PR15MB3698.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(396003)(376002)(39860400002)(199004)(189003)(256004)(6116002)(486006)(6486002)(4744005)(4326008)(6246003)(46003)(25786009)(229853002)(33656002)(76176011)(5660300002)(476003)(6436002)(11346002)(102836004)(2616005)(6512007)(53546011)(6506007)(446003)(2906002)(66946007)(8676002)(66446008)(64756008)(66556008)(81166006)(8936002)(66476007)(81156014)(71190400001)(305945005)(7736002)(76116006)(36756003)(71200400001)(2501003)(478600001)(186003)(99286004)(14454004)(86362001)(54906003)(110136005)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3698;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ooYGAlPIvOEdyYA5QB7A9cpmeo2RXiOfUB5fGBh/kiGZ44QuUSy9Q1wzdUYU0soBN1roCH3icHTl19pLVPEFoJqdkA9JzC0q3yKLsqXtu5SMKtbolWfQJRTGCRBecpzjFHril7ql4z5JnJEEwsqpXTtM1wp1OJ1BWlNHvblLwK/4XgfKMkoMKwIV9tw70FaTHhM/TB0tcFmUXpI+V0zwFUayHdr1qSYkNaGOqFe0hvYkNLiGrIcMcXJxJAqWYwwQNPr2ryfvxiPreGMsiVWDeJ5ug//Nz78F3ZYUvgj0Yxebgk284K3dPOQmXtMK6RmDvwNJOKD/Geq59fxXZfmCEb1rsX+57xOYf1+WEQu1FcErd7tK7d+ZNV+sP+8h+QUSgYbJUEXb+w2ioLhwB8vNdYIZq9enKgXWOZYTp0mz8TQPV6i/kdJrOax+aoxtT1cX
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE975EDC58CCD04986B78AE71F0C95D1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c55f57d-eff2-44fd-9006-08d76d45b1c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 23:10:39.7585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TLX5xm/ERv25l1ojVWnmImoNnJyz3n49vmmsg7YxcGg+Q4Fco0cp86zRVErzGuKqrf9fyp5fahviKJnnkCrstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3698
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_08:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911190182
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDExLzE5LzE5LCAxOjM5IFBNLCAiSmFtZXMgRmVpc3QiIDxqYW1lcy5mZWlzdEBs
aW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gMTEvMTkvMTkgMTI6MDggUE0sIFZpamF5
IEtoZW1rYSB3cm90ZToNCiAgICA+IEhpIEphbWVzL0phc29uLA0KICAgID4gDQogICAgPiBJIHNl
ZSBzb21lIHBhdGNoZXMgaW4gSW50ZWwtQk1DIHJlcG8gZm9yIHBob3NwaG9yLXdhdGNoZG9nLCB3
aGF0IGlzIHBsYW4gDQogICAgPiBvZiB1cHN0cmVhbWluZyB0aG9zZSBwYXRjaGVzIGluIHJlc3Bl
Y3RpdmUgcmVwb3MuDQogICAgDQogICAgTGFzdCB0aW1lIEkgY2hlY2tlZCB0aGV5IGNhbid0IGJl
IHVwc3RyZWFtZWQgKGF0IGxlYXN0IG5vdCBhcyBpcykgDQogICAgYmVjYXVzZSBvZiB0aGUgaW5j
b21wYXRpYmlsaXR5IG9mIHVzaW5nIHN5c3RlbWQgZm9yIHBvd2VyIGNvbnRyb2wgdnMgDQogICAg
dXNpbmcgYSBkYWVtb24uDQogICAgDQpZZXMsIEkgc2VlIGl0IG5lZWRzIG1vZGlmaWNhdGlvbi4g
IE9yIHdlIGNhbiBoYXZlIHdhdGNoZG9nIGZ1bmN0aW9uYWxpdHkgaW4gcG93ZXIgY29udHJvbCBy
ZXBvIA0KICAgIA0KICAgID4gDQogICAgPiBSZWdhcmRzDQogICAgPiANCiAgICA+IC1WaWpheQ0K
ICAgID4gDQogICAgDQoNCg==
