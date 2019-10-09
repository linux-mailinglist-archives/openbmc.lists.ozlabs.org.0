Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCA4D170D
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 19:49:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pMCg318PzDqVN
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 04:49:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=518556c0a5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Eqtydoe+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="PRKfWRKh"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pMBq3GDNzDqLq
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 04:48:14 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99Hm7mn029335; Wed, 9 Oct 2019 10:48:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=lx3qrNmUArCdBTWNuQcfQ19OeEbP5vIED3rfyNzYF5s=;
 b=Eqtydoe+U0vwEvHcXT61Fhl4WUz86WI5Xb2mNhAvMf7xPxhEah/9Wxfs9ZUS4jrsqMsB
 OCeJyzbG4R+XgafF9bLUNxFIr3wCP7oGs0h271WuxZiKrd7SReC6f8DcHKug2+4nB6KW
 7lOw4fbNoAAnqTO5NGisZWBOeO1ucsS+gAg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vgpq9rn9h-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 10:48:07 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 9 Oct 2019 10:47:46 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 9 Oct 2019 10:47:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6WTyovBRVX+2f07ZtYppccgV0WfndkV/RPXi49P0eWs3ku1wtPaUBku149q/C67+zTJyya8m1VUl/ijl8K5jMqg0yIRbuQgPZZ2dCGUqj8xWIrHrn8IHshxjtN5w53WWeUxTp7NunZEsjvJjC80oGTv2OdEUgvaICnq/L7k6B6lJY8GlPu+mZOyvpMGmlMYySZoO7JJ83ocu8avVCaUdL4vhNO3Punpf4Cd5yIcfiTyH2PjJJ0Lygb5NflKj71cZ6Ou0M8MXj6OgLP91/9HmoBr2FFZUA75wnltlR5WnO2+bDhrkGQiwUSQ+/WG5mbl+QMSbLoehnMI7Bj0/WlUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx3qrNmUArCdBTWNuQcfQ19OeEbP5vIED3rfyNzYF5s=;
 b=lvfkoLjqj8RtYm2K/MWuxVqWRXpmcd1hlTFgcom4e39ncWStOoOe1e/UlcwUs4yXzBIjGlcWvo+8efRXc12xMwpmhDyyPNXclt571/cLtm7MQyrGdhacPToFo0VqoKqyxtARpA2PTQRHnf0qf0Sh/LtWACERIFTThSWTGjuu8kfPJhaLsG/vnmc6CYqlc40HYxd5GMLhcCH+UIM0oCeMV+KLz59SjfRDv6hgZfzCvzPjdD9G75UWDJNAjolQEOWBD2hB14HJQP8mwWZwX/wusCNZXnPHi8E3+SAH4zNrTWWHwWEJqHi/kaXyU6UU3KMVR5dIOIpGop5wDYTCpkobzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx3qrNmUArCdBTWNuQcfQ19OeEbP5vIED3rfyNzYF5s=;
 b=PRKfWRKh53tQ4YhTJNPBzl6Bj/0o7aWjuLJcH/RMZ2nPA8+dXfk7ytp7PWHBl20i4sZfG738wlggn7LbykKwAJb1E49huq/ncfvhW93JpnEm8if2x1NHEobpsGQo6oE29fnhxEZUSBq/rDasmjpNZoAQagHxij9bx0HHJ3OhtFA=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3649.namprd15.prod.outlook.com (52.133.253.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Wed, 9 Oct 2019 17:47:45 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 17:47:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "andrew@aj.id.au" <andrew@aj.id.au>
Subject: speed-bmc-misc driver
Thread-Topic: speed-bmc-misc driver
Thread-Index: AQHVfsmnNsQbcA9jQ0Ge8qC4MJbYCw==
Date: Wed, 9 Oct 2019 17:47:44 +0000
Message-ID: <81DE4370-D135-48EE-A8FC-B079C4CE3648@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:1fb8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75e89ada-6670-4d86-cfe1-08d74ce0ca6c
x-ms-traffictypediagnostic: BY5PR15MB3649:
x-microsoft-antispam-prvs: <BY5PR15MB3649544CA8B0CBFB0BFDB9DDDD950@BY5PR15MB3649.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(14454004)(558084003)(7736002)(6506007)(478600001)(6486002)(71190400001)(25786009)(71200400001)(86362001)(256004)(486006)(2906002)(4326008)(64756008)(1730700003)(5640700003)(5660300002)(316002)(9326002)(76116006)(36756003)(2351001)(91956017)(46003)(186003)(8676002)(6306002)(6916009)(8936002)(81166006)(33656002)(66446008)(6512007)(2501003)(6436002)(3480700005)(102836004)(2616005)(54896002)(66556008)(66946007)(99286004)(81156014)(66476007)(476003)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3649;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wR3k0uoUVa4v9tmCzQJZKp8oJgk9PE5FVvLtmvb8jB8Y3XJ19e8d6PswCE7RBCldiudH2Z/2H/rvGGYYgPUUc6awNub55RBYVDpeDuyK2txJMzSm4y2pSehfiqELV60gOqj1nCM00IKzuD4mNxQnfoTWBeS0PRanpKtw8l+e9UAnA49BQBBPZWtPJwOJ6noXx+iHbw2AzGE1jrRdpz3UswzrVOMNxXJ+ENPheDm20Nc34u9auP6EhJ8js7Oah6soE6Dy9oNBUCauaEDynQaZwwP4KglOv0Gt8HaaPMJvp0nl4JPpKX69rg8MWim/MC3Z/wcg4rG2SyjghdHrlx1R0I8DS3zE/n+lG3kIaTPMkDwjqIkqiZutMrvQRUalblz0ViE7+y1mf4orYMv3S2kTUJWFrkBdkVkE1EZefcCd0to=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_81DE4370D13548EEA8FCB079C4CE3648fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e89ada-6670-4d86-cfe1-08d74ce0ca6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 17:47:44.6459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1C0S4T64sMJ6k+enLAtmtDo9rhkc7IRT/bsGfoY+8pK2mphoj1vd1DEWESbCIFPjkZyd06a1i8WbGxM5EX4fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3649
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_08:2019-10-08,2019-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=608
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910090150
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

--_000_81DE4370D13548EEA8FCB079C4CE3648fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KSSBzYXcgdGhpcyBkcml2ZXIgaW4gTEYgYXNwZWVkIExpbnV4IGFuZCB3YXMg
d29uZGVyaW5nIGhvdyB0byB1c2UuIENhbiB5b3UgcGxlYXNlIHN1Z2dlc3Qgc29tZSB1c2FnZSBl
eGFtcGxlIGxpa2UgZGV2aWNlIHRyZWUgZW50cnkgYXMgd2VsbCBhcyBzeXNmcyBpbnRlcmZhY2Uu
DQoNClRoYW5rcw0KLVZpamF5DQo=

--_000_81DE4370D13548EEA8FCB079C4CE3648fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <16DA8C13F681EA409F621B58A5A54833@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5IaSBBbmRyZXcsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkgc2F3IHRoaXMgZHJpdmVy
IGluIExGIGFzcGVlZCBMaW51eCBhbmQgd2FzIHdvbmRlcmluZyBob3cgdG8gdXNlLiBDYW4geW91
IHBsZWFzZSBzdWdnZXN0IHNvbWUgdXNhZ2UgZXhhbXBsZSBsaWtlIGRldmljZSB0cmVlIGVudHJ5
IGFzIHdlbGwgYXMgc3lzZnMgaW50ZXJmYWNlLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+VGhhbmtzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_81DE4370D13548EEA8FCB079C4CE3648fbcom_--
