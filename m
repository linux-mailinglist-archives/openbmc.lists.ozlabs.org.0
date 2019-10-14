Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73FD6A05
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 21:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sT1s31RJzDqwr
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 06:21:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5190d6c953=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="mq7bh/Nr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="YS2fhLCW"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sT0y5jTjzDqwH
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 06:20:30 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9EJI5xv024211; Mon, 14 Oct 2019 12:20:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=egNMD7V+apwaexxul05Tn6aQRrREx9v6Cdq+aSUGsew=;
 b=mq7bh/Nr/wFvq2OHGooEZRj02SUiAr2bEFl4uuq5xPebFRuAP52TBthQ4el4RIg6YI/X
 U7BGSLYhTOq9b2RWIAOpt6wzTioiLluaWGTbt2kYMdSNrRlgr2oPGCODX1MDgPqJmhIa
 aeo25b7PTx2qonu/ZrA4xEX1GLhnp+MG5ZQ= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vkxhs61yy-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 12:20:15 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 14 Oct 2019 12:20:12 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 14 Oct 2019 12:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgaabmAHFk+tVE1Ejx6K32WRipfjtFDIqzRMe1wEtwCle47HwmmVdzZMs/pGbiKxJETTkW6kQBSf5JANjOyshAS6ECI6J7KMl/SiyafNlOuAxRZHQKdRGZXaEWphw6C4nLLhBxFiTSiVtFSFk8YCmD9hoXUqTjQVkaaT7EmxDRtqZVpNYzm8JwqSFil5qFC3H3tHmsYk1ViGL4qfbQ7K4Ov5yhoHD0fKWGGHmEON+zuzpgo80MvT3MhGzRKkV+ItdSjsnqcXOIS8ezcUMA2OnxRMy1N/ryW8kwOOmTSNsFFpAAD5XoDnRixEbTSo0JPux+h/wMBiEbXvtJXyQ0biag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egNMD7V+apwaexxul05Tn6aQRrREx9v6Cdq+aSUGsew=;
 b=Yd69mHswbHcGJDVclxqE7ULWkLpYwP8ejyp+r01I0iaGOG3RjzHXExwfzwmXkVeyMccPVuuM10apD0BexTJyz1en4yyvZzIyyiBDSPnzEVjtFmHQRT06JSlXz7rK8tTEJY0K6r8P0ztYNYA1I4mLCFTDceM+21Qd8Lrz0ugtcS7wj+HV+yjkJHkgRuYc1yVcFSA78+94I5UBcEbZNs1pEhhEDPTczz5ldBsYZD5iN0XMDKDtY3y/s4sDXdPlRlSBmgHG/A8+iPT0IYeIepvWS1brJXjcfXMLidgG2jNUU5cQtV4AWyfi/R3XL4xMmXwCFq3JBl36vgELMU/vn27ySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egNMD7V+apwaexxul05Tn6aQRrREx9v6Cdq+aSUGsew=;
 b=YS2fhLCWJ9IlU5MIZ/K/UBeQbgDOZmby5obMXG2lzujcm0KVf+dDgvYjRI7nN2+L2EVCasf7WEBqCCN179HKoKAx9MGd0G9wUW2RqEwpVMIXEXghl7ILBy4fiyKJbEvOXCXOpj3nThGG4FuLCKp0sa2Jm2mwJQ9OpTrnKPpx6UA=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3586.namprd15.prod.outlook.com (52.133.254.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 19:20:11 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 19:20:11 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, William Kennington <wak@google.com>
Subject: Re: host-ipmid bumps failing on tiogapass
Thread-Topic: host-ipmid bumps failing on tiogapass
Thread-Index: AQHVgqBSH9UcBbf6bkKUd+roUN+yKKdaRXiAgAAJHoD//7+aAA==
Date: Mon, 14 Oct 2019 19:20:10 +0000
Message-ID: <43CA2EC8-7A74-4A95-A5E9-FA669C2309C7@fb.com>
References: <482C700C-A6AC-4B90-96CC-0E0BB2A7F4F3@fuzziesquirrel.com>
 <4cb17f48-d29d-4994-e516-315068dbabfd@intel.com>
 <563ccf95-dda2-37f5-33d7-0bc8aafb61c0@intel.com>
In-Reply-To: <563ccf95-dda2-37f5-33d7-0bc8aafb61c0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:955]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa3750bd-9342-4122-f3c5-08d750db8864
x-ms-traffictypediagnostic: BY5PR15MB3586:
x-microsoft-antispam-prvs: <BY5PR15MB358668905EA01AF0B5A62F50DD900@BY5PR15MB3586.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39860400002)(366004)(136003)(346002)(189003)(199004)(6486002)(486006)(99286004)(86362001)(6506007)(76176011)(53546011)(6436002)(186003)(102836004)(25786009)(46003)(91956017)(6246003)(5660300002)(36756003)(2616005)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(229853002)(11346002)(476003)(446003)(4326008)(6512007)(54896002)(6306002)(71200400001)(7736002)(478600001)(71190400001)(14454004)(33656002)(6116002)(81156014)(316002)(54906003)(2906002)(110136005)(81166006)(256004)(8676002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3586;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FGJmEgV3JgEBViVnV924JRihwFwbeBz574aNBU77APkIxsuUBtbsN04yBGFAh0+sTsI31eb3LgMfoA3ZLfqdsd2J/u55WoKEdmDzir+GUXXW3/EFR4GQoN8hpBeD4GR+rHGz2UkY6Pr7ceB9CyetL5GD1lx5/MGi+qEFt0XOTxNmli09geMTwk2BNg4QcUn/A3WRk4Ir88R6W6HWQMg12QPvn1xn87NvP6nm7mD2Nt38jqOHIlfN/2Bxh/fm4EZhKTd8qjpMAaJ24vUthAvDyrJKcKvi2iVvyA6UsQzWKxbtov7npSpdVcd6qR62iJYs5pbt7Bu2uerlbiEoxhztTMrYS2tcY3qw0BNHmtrRW85/f+YL20dtUqmgMQx6nsLpY61PSTdf1Nnr+g6f0cjOX5EWko6TmARg0xptRGfcHE=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_43CA2EC87A744A95A5E9FA669C2309C7fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3750bd-9342-4122-f3c5-08d750db8864
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 19:20:11.0243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFICCkUuHMOODd95ENlcWHFmu/x48ATc0G4AuhJnYrL2e5wMNz4ZAHzkJ770loHIDjeWAZ8yWILTQ3xvtWk5+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3586
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_09:2019-10-11,2019-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910140158
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_43CA2EC87A744A95A5E9FA669C2309C7fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IEpvaG5hdGhhbiBNYW50ZXkgPGpvaG5hdGhhbngubWFudGV5QGludGVsLmNvbT4N
CkRhdGU6IE1vbmRheSwgT2N0b2JlciAxNCwgMjAxOSBhdCA5OjEwIEFNDQpUbzogQnJhZCBCaXNo
b3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4sIFdpbGxpYW0gS2VubmluZ3RvbiA8d2Fr
QGdvb2dsZS5jb20+DQpDYzogRW1pbHkgU2hhZmZlciA8ZW1pbHlzaGFmZmVyQGdvb2dsZS5jb20+
LCBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbT4sIE9wZW5CTUMg
TWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4sIFZpamF5IEtoZW1rYSA8dmlqYXlr
aGVta2FAZmIuY29tPg0KU3ViamVjdDogUmU6IGhvc3QtaXBtaWQgYnVtcHMgZmFpbGluZyBvbiB0
aW9nYXBhc3MNCg0KPkxvb2tpbmcgYXQgdGhlIGxvZ3MgZnJvbSB0aGUgYnVpbGQsIHRoZXJlIGFy
ZSBzb21lICJtdWx0aXBsZSBkZWZpbml0aW9uIiBlcnJvcnM6DQoNCj4wODo0NzoyMiAvdG1wL29w
ZW5ibWMvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9mYi1pcG1pLW9lbS8w
LjErZ2l0QVVUT0lOQyszODE4M2Q2NjcwLXIwL2dpdC9zcmMvb2VtY29tbWFuZHMuY3BwOjc3OjE2
OiBlcnJvcjogY29uZmxpY3RpbmcgZGVjbGFyYXRpb24gJ2NvbnN0ZXhwciA+Y29uc3QgYXV0byBp
cG1pOjpuZXR3b3JrOjpST09UJw0KPjA4OjQ3OjIyICAgIDc3IHwgY29uc3RleHByIGF1dG8gUk9P
VCA9ICIveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrIjsNCj4wODo0NzoyMiAgICAgICB8ICAg
ICAgICAgICAgICAgIF5+fn4NCg0KPlRoaXMgY29udGVudCB3YXMgaW4gdGhlIGluY2x1ZGUvaXBt
aWQvdXRpbHMuaHBwIGZpbGUuICBUaGUgY29tbWl0IG1vdmVkIHRoZW0gdG8gdGhlIHRyYW5zcG9y
dGhhbmRsZXIuY3BwIGZpbGUsIG1ha2luZyB0aGUgZGVmaW5pdGlvbnMgcHJpdmF0ZS4NClV0aWxz
LmhwcCB3YXMgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSBhbnlvbmUgaW5jbHVkaW5nIGxpYmlwbWlk
IGFuZCByZW1vdmluZyBjb250ZW50IGZyb20gdGhpcyBmaWxlIGltcGFjdHMgZXZlcnlvbmUuIEkg
Z3Vlc3MgbW9yZSB0aGFuIHRpb2dhcGFzcyB1c2VzIHRoaXMgZGVmaW5pdGlvbiBpbmNsdWRpbmcg
Ym1jd2ViLg0KDQoNCg==

--_000_43CA2EC87A744A95A5E9FA669C2309C7fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <912C02E54F7705418C63C761E22B583D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQph
OnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAubXNv
bm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6
bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47
DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQt
c2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5F
bWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVm
YXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4g
MS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUi
IHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNv
bGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+
RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFj
ayI+Sm9obmF0aGFuIE1hbnRleSAmbHQ7am9obmF0aGFueC5tYW50ZXlAaW50ZWwuY29tJmd0Ozxi
cj4NCjxiPkRhdGU6IDwvYj5Nb25kYXksIE9jdG9iZXIgMTQsIDIwMTkgYXQgOToxMCBBTTxicj4N
CjxiPlRvOiA8L2I+QnJhZCBCaXNob3AgJmx0O2JyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbSZn
dDssIFdpbGxpYW0gS2VubmluZ3RvbiAmbHQ7d2FrQGdvb2dsZS5jb20mZ3Q7PGJyPg0KPGI+Q2M6
IDwvYj5FbWlseSBTaGFmZmVyICZsdDtlbWlseXNoYWZmZXJAZ29vZ2xlLmNvbSZndDssIFZlcm5v
biBNYXVlcnkgJmx0O3Zlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tJmd0OywgT3BlbkJNQyBN
YWlsbGlzdCAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0OywgVmlqYXkgS2hlbWthICZs
dDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPlJlOiBob3N0LWlw
bWlkIGJ1bXBzIGZhaWxpbmcgb24gdGlvZ2FwYXNzPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9k
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8
L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEyLjBwdCI+
Jmd0O0xvb2tpbmcgYXQgdGhlIGxvZ3MgZnJvbSB0aGUgYnVpbGQsIHRoZXJlIGFyZSBzb21lICZx
dW90O211bHRpcGxlIGRlZmluaXRpb24mcXVvdDsgZXJyb3JzOjxicj4NCjxicj4NCiZndDswODo0
NzoyMiAvdG1wL29wZW5ibWMvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9m
Yi1pcG1pLW9lbS8wLjEmIzQzO2dpdEFVVE9JTkMmIzQzOzM4MTgzZDY2NzAtcjAvZ2l0L3NyYy9v
ZW1jb21tYW5kcy5jcHA6Nzc6MTY6IGVycm9yOiBjb25mbGljdGluZyBkZWNsYXJhdGlvbiAnY29u
c3RleHByICZndDtjb25zdCBhdXRvIGlwbWk6Om5ldHdvcms6OlJPT1QnPGJyPg0KJmd0OzA4OjQ3
OjIyJm5ic3A7Jm5ic3A7Jm5ic3A7IDc3IHwgY29uc3RleHByIGF1dG8gUk9PVCA9ICZxdW90Oy94
eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsmcXVvdDs7PGJyPg0KJmd0OzA4OjQ3OjIyJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgXn5+fjxicj4NCjxicj4NCiZndDtUaGlzIGNvbnRlbnQgd2FzIGluIHRoZSBpbmNs
dWRlL2lwbWlkL3V0aWxzLmhwcCBmaWxlLiZuYnNwOyBUaGUgY29tbWl0IG1vdmVkIHRoZW0gdG8g
dGhlIHRyYW5zcG9ydGhhbmRsZXIuY3BwIGZpbGUsIG1ha2luZyB0aGUgZGVmaW5pdGlvbnMgcHJp
dmF0ZS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4t
Ym90dG9tOjEyLjBwdCI+VXRpbHMuaHBwIHdhcyBzdXBwb3NlZCB0byBiZSB1c2VkIGJ5IGFueW9u
ZSBpbmNsdWRpbmcgbGliaXBtaWQgYW5kIHJlbW92aW5nIGNvbnRlbnQgZnJvbSB0aGlzIGZpbGUg
aW1wYWN0cyBldmVyeW9uZS4gSSBndWVzcyBtb3JlIHRoYW4gdGlvZ2FwYXNzIHVzZXMgdGhpcyBk
ZWZpbml0aW9uIGluY2x1ZGluZyBibWN3ZWIuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibWFyZ2luLWJvdHRvbToxMi4wcHQiPjxicj4NCjxicj4NCjxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_43CA2EC87A744A95A5E9FA669C2309C7fbcom_--
