Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A018ADB994
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 00:14:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vNkB0m4SzDqfF
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 09:14:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=51932c9067=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="jLnXv1nP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DgG1bOJq"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vNjJ5PjdzDqdP
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 09:13:39 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9HMDTv0026732; Thu, 17 Oct 2019 15:13:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=5sseJViGryuplFVop1w2jgZbx9fjBHf6k++u1GBZN84=;
 b=jLnXv1nPZS65ZBvHrokARAN2Y+5IC7ftO6OgWvTzzZZPQKxYxeMPATFlUit4iZQ/xZ/H
 WSSDR9LbsTUROAON9nKPF/u0dn/QgisoXKwiILtLu3ZoT2Cyqo/pa7+Ah90d2J6cx3PP
 firyh7wVsor5mR33nc2rhkQ3RKv7Xgfahwk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vpw9r90pt-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2019 15:13:36 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 17 Oct 2019 15:13:29 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Oct 2019 15:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOykPPIBSvb6zd9kwOXygfxxTSwWz86m+MNMJB2dKQjRrBlmwcHMmGEqN86oUGRGKg482t4toZjSPvMUA8q2hWJJMG5ZU0xgQcDMi3TpwZ4H/Sb3If5IveHSpWuGUCVIXMsfiYkByIW02azW2FjonzjkNviYHl9w7D9zKhaNDLmhBq01jFDIySbkfOqZlBFQXH8pdCKwVUoDZYgI7aGwzz3RCDRT8zBx4ciWUHtspIasvk08RncCJY10cX6bHRZqYZqwoE2XBTxoDvmsQMPOiiwGfxAbNpA0QnDNm+1pUGdS+u2CpPcIgEEkete3MiXhLyElppxPr5e5DTSIBK2v1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sseJViGryuplFVop1w2jgZbx9fjBHf6k++u1GBZN84=;
 b=NE/z0csZRoGsO0QvkRU/8M9OMbgbCT93NPPNPT2CGUVlYZtfFeTJZE+GCOlsnKknBtYJ4A+v+hsEUCNa8atYcqjg/0pgnsdHJREbdijDrF+M+/kDS/lISPD4o5rV8TSqo/MAcZ11YA81GaSUCqydUV+31Js22HGDK+bQEUOjUjcBRMv7aBnLTmNlVAjKaI+JV3hULu+EWHhZ4VJIiqXL7RdQdSyuLt+qbutAA4co+p72vso4HuaMW3cJgMJMcVWjO4cGNDf3HLq86m8QmaaEDp0vzg0en3H8SEtIdq4MhKxY0NxJLTdbAE29+1iBjLl5wcfAQJKDHXEqkKAM2IFaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sseJViGryuplFVop1w2jgZbx9fjBHf6k++u1GBZN84=;
 b=DgG1bOJqOUEHI/Y4eQ3BPnYKilZy7adY9U0UirqJ1zv0+NgYgxl4kr3QLAR1T8MXFplYD+87oHhpUxtmAT2TWMUD8nSPiUcOJdHGHpAZTvp49nCVn3f+WeGn08bF98xF7xosQMgCs1KW+7qvQk2Ea1M7rBzci3f9ytO5Xuc59fU=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3585.namprd15.prod.outlook.com (52.133.253.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 22:13:28 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 22:13:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Oskar Senft <osk@google.com>, Michael Richardson <mcr@sandelman.ca>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qdemVoAgAA91QCAABqbgA==
Date: Thu, 17 Oct 2019 22:13:28 +0000
Message-ID: <1C2F7013-811F-4B74-A58F-4FACC544817B@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
 <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
In-Reply-To: <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:f653]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b8d10b6-3d65-4328-5d65-08d7534f3cb2
x-ms-traffictypediagnostic: BY5PR15MB3585:
x-microsoft-antispam-prvs: <BY5PR15MB35856DB9FCD7E619F4D08454DD6D0@BY5PR15MB3585.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(33656002)(8936002)(8676002)(54896002)(6306002)(6512007)(25786009)(6116002)(81166006)(81156014)(7736002)(229853002)(2906002)(6486002)(6436002)(256004)(53546011)(4326008)(6246003)(102836004)(6506007)(2616005)(110136005)(11346002)(186003)(316002)(486006)(76176011)(71190400001)(14454004)(478600001)(66946007)(86362001)(446003)(99286004)(71200400001)(64756008)(66476007)(91956017)(66446008)(76116006)(36756003)(66556008)(46003)(5660300002)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3585;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mkWUoJoEBaYI/tL4Bw0J7fgMIYOrOhh2j9oqoCtTjCbw8rK5Tdqd+/ovR5uMm+20OUpJo5PsdYTZBXmKSsvUZXiMCvolmRxcGQ5hD2gchQJK3+vQlYWS3pHNgnyO0xDZADBaCcD6oDoE2WdDMXBLeV+HiB6XEGvSV9cUlqgpgD420GmSIterjgN4Z4CkjXewXrBAkHbnW22EOZfCMGnNO+DanWRL6kL9zCsEZBddtX9n/iEUIHWRWBkcOz7B+DGqyT9qe5nBfnNnQceVYYLtpPU/PGuttX8ZfF3XcRHhF8xCIjeLKgihuM2Q/V/AoBoSlJU6hmtuB2EUXQHSORc1b53puZJoPkyTDPkLJ4lFFo6s+ByZYKshVKIC2k8XysbyPNrt4E40YicEBFFS1rFFL8NwNF9AXL36r12MFmzsPfw=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_1C2F7013811F4B74A58F4FACC544817Bfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8d10b6-3d65-4328-5d65-08d7534f3cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 22:13:28.0349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXNnY+tRVoxJXjEzDFs1eYNtB1K3ly/lakVFkrywCE51mp/La/8daERmMbp60gEQsvp6A9HqlsUMg4+G9MSt7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3585
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_06:2019-10-17,2019-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=883
 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910170195
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

--_000_1C2F7013811F4B74A58F4FACC544817Bfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIE9za2FyIFNlbmZ0IDxvc2tAZ29vZ2xlLmNvbT4N
CkRhdGU6IFRodXJzZGF5LCBPY3RvYmVyIDE3LCAyMDE5IGF0IDY6MzkgQU0NClRvOiBNaWNoYWVs
IFJpY2hhcmRzb24gPG1jckBzYW5kZWxtYW4uY2E+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IHg4Ni1wb3dlci1jb250cm9sDQoN
CkhpIE1pY2hhZWwNCg0KV2h5IGluIGEgdGFyZ2V0IHN5c3RlbSB3b3VsZG4ndCBuYW1pbmcgaXQg
aW4gRFRTIGJlIHRoZSBtb3N0IHJlbGlhYmxlIGFuZA0KbW9zdCBlYXNpbHkgYWNjZXNzaWJsZSBt
ZWNoYW5pc20/ICBJIGNhbiBzZWUgdGhhdCBpbiBkZXZlbG9wbWVudCBiZWluZyBhYmxlIHRvIGRl
ZmluZQ0KdGhpbmdzIGhlbHBzLCBidXQgaXQgaXMgbm90IGxpa2UgdGhlIHByb2R1Y3Rpb24gc3lz
dGVtcyB3b3VsZCBoYXZlIHdpcmUtd3JhcA0Kd2hlcmUgdGhlIEdQSU8gcGluIG1pZ2h0IGNoYW5n
ZS4NCg0KSSB0b3RhbGx5IGFncmVlLiBJIHdhcyBhY3R1YWxseSBleHBlcmltZW50aW5nIG9uIG91
ciBwbGF0Zm9ybSAoVFlBTiBTNzEwNikgdG8gbmFtZSBHUElPIHBpbnMgaW4gdGhlIERUUywgYnV0
IEkgY291bGRuJ3QgZmlndXJlIG91dCBob3cgdG8gcmVhZCB0aG9zZSBuYW1lcyBmcm9tIHVzZXJz
cGFjZS4NCg0KSGVyZSdzIHdoYXQgSSB0cmllZCBpbiB0aGUgRFRTOg0KDQomZ3BpbyB7DQogICAg
ICAgIHBpbl9ncGlvX2QyIHsNCiAgICAgICAgICAgICAgICBncGlvcyA9IDxBU1BFRURfR1BJTyhE
LCAyKSBHUElPX0FDVElWRV9ISUdIPjsNCiAgICAgICAgICAgICAgICBpbnB1dDsNCiAgICAgICAg
ICAgICAgICBsaW5lLW5hbWUgPSAiU1lTX1BXUk9LX0JVRiI7DQogICAgICAgIH07DQouLi4NCg0K
QW5vdGhlciB0aGluZyBoZXJlLCBJIHdhbnQgdG8gYmUgYWJsZSB0byBtYXAgYWN0dWFsIG5hbWUg
ZGVmaW5lZCBpbiBEVFMgdG8gcmVhbCBuYW1lIHVzZWQgaW4NClBvd2VyLWNvbnRyb2wuDQoNCkhv
d2V2ZXIsIGZyb20gd2hhdCBJIGNhbiB0ZWxsIGxpbmUtbmFtZSBpcyBhY3R1YWxseSBvbmx5IHJl
bGV2YW50IHdoZW4gdXNlZCB0b2dldGhlciB3aXRoICJncGlvaG9nIiwgd2hpY2ggaXMgbm90IHdo
YXQgd2Ugd2FudC4NCg0KSXQgaXMgbWFpbmx5IHVzZWQgdmlhIGxpYmdwaW9kLg0KDQpEaWQgeW91
IG1hbmFnZSB0byBtYWtlIHRoaXMgd29yaz8NCg0KVGhhbmtzDQpPc2thci4NCg==

--_000_1C2F7013811F4B74A58F4FACC544817Bfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <75700623AA0CAE4390C8C87CF97914E7@namprd15.prod.outlook.com>
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
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0No
cERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBw
dDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEu
MGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2Vj
dGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIj
MDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRl
ci10b3A6c29saWQgI0I1QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9y
OmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2Nv
bG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO3ZpamF5a2hlbWthPWZi
LmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgT3NrYXIgU2VuZnQgJmx0O29z
a0Bnb29nbGUuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5UaHVyc2RheSwgT2N0b2JlciAxNywg
MjAxOSBhdCA2OjM5IEFNPGJyPg0KPGI+VG86IDwvYj5NaWNoYWVsIFJpY2hhcmRzb24gJmx0O21j
ckBzYW5kZWxtYW4uY2EmZ3Q7PGJyPg0KPGI+Q2M6IDwvYj5PcGVuQk1DIE1haWxsaXN0ICZsdDtv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPlJlOiB4ODYt
cG93ZXItY29udHJvbDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIE1pY2hhZWwgPG86cD48L286cD48L3A+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPGRpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpz
b2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6
NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XaHkgaW4gYSB0
YXJnZXQgc3lzdGVtIHdvdWxkbid0IG5hbWluZyBpdCBpbiBEVFMgYmUgdGhlIG1vc3QgcmVsaWFi
bGUgYW5kPGJyPg0KbW9zdCBlYXNpbHkgYWNjZXNzaWJsZSBtZWNoYW5pc20/Jm5ic3A7IEkgY2Fu
IHNlZSB0aGF0IGluIGRldmVsb3BtZW50IGJlaW5nIGFibGUgdG8gZGVmaW5lPGJyPg0KdGhpbmdz
IGhlbHBzLCBidXQgaXQgaXMgbm90IGxpa2UgdGhlIHByb2R1Y3Rpb24gc3lzdGVtcyB3b3VsZCBo
YXZlIHdpcmUtd3JhcDxicj4NCndoZXJlIHRoZSBHUElPIHBpbiBtaWdodCBjaGFuZ2UuPG86cD48
L286cD48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5J
IHRvdGFsbHkgYWdyZWUuIEkgd2FzIGFjdHVhbGx5IGV4cGVyaW1lbnRpbmcgb24gb3VyIHBsYXRm
b3JtIChUWUFOIFM3MTA2KSB0byBuYW1lIEdQSU8gcGlucyBpbiB0aGUgRFRTLCBidXQgSSBjb3Vs
ZG4ndCBmaWd1cmUgb3V0IGhvdyB0byByZWFkIHRob3NlIG5hbWVzIGZyb20gdXNlcnNwYWNlLjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IZXJl
J3Mgd2hhdCBJIHRyaWVkIGluIHRoZSBEVFM6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtD
b3VyaWVyIE5ldyZxdW90OyI+JmFtcDtncGlvIHsgPGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7IHBpbl9ncGlvX2QyIHs8YnI+DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IGdwaW9zID0gJmx0O0FTUEVFRF9HUElPKEQsIDIpIEdQ
SU9fQUNUSVZFX0hJR0gmZ3Q7Ozxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaW5wdXQ7PGJyPg0KJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBsaW5lLW5hbWUgPSAmcXVvdDtTWVNf
UFdST0tfQlVGJnF1b3Q7Ozxicj4NCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyB9Ozwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90OyI+Li4uPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Bbm90aGVyIHRoaW5nIGhlcmUsIEkgd2FudCB0byBi
ZSBhYmxlIHRvIG1hcCBhY3R1YWwgbmFtZSBkZWZpbmVkIGluIERUUyB0byByZWFsIG5hbWUgdXNl
ZCBpbg0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Qb3dlci1jb250cm9s
LjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+SG93
ZXZlciwgZnJvbSB3aGF0IEkgY2FuIHRlbGwgbGluZS1uYW1lIGlzIGFjdHVhbGx5IG9ubHkgcmVs
ZXZhbnQgd2hlbiB1c2VkIHRvZ2V0aGVyIHdpdGggJnF1b3Q7Z3Bpb2hvZyZxdW90Oywgd2hpY2gg
aXMgbm90IHdoYXQgd2Ugd2FudC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkl0IGlz
IG1haW5seSB1c2VkIHZpYSBsaWJncGlvZC48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0Fy
aWFsJnF1b3Q7LHNhbnMtc2VyaWYiPkRpZCB5b3UgbWFuYWdlIHRvIG1ha2UgdGhpcyB3b3JrPzwv
c3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYi
PlRoYW5rczwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5z
LXNlcmlmIj5Pc2thci48L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_1C2F7013811F4B74A58F4FACC544817Bfbcom_--
