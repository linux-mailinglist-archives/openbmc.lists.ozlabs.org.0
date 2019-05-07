Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 411AE16C50
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 22:38:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zBJJ5bykzDqDY
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 06:38:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00300071b5=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Fe4sjphE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="VyY/9u6c"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zBHC07yVzDqJR
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 06:37:06 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x47KS0IK006548
 for <openbmc@lists.ozlabs.org>; Tue, 7 May 2019 13:37:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=2FR8m8CQudAOgOaPItxda6CWtDAzgBBAQ8T2WGHkPZU=;
 b=Fe4sjphE5FoXAsXM/oR4GpdgDX2/oc0Y5PeKgPMjIVEsBtXdpFoIGnE8r2vj1amVTmnV
 1zNpO7BCp1pwvb67M8oW76ubcq5/vrbuLSyKAArYvzylq+NNH5b0DctnQy9eMIod63V1
 A8dlfjsCM1N4drZX4AatkzdnNRVCsyDHa9M= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2sbd0rs46a-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 13:37:01 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 7 May 2019 13:37:00 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 7 May 2019 13:37:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FR8m8CQudAOgOaPItxda6CWtDAzgBBAQ8T2WGHkPZU=;
 b=VyY/9u6ciC6QRTVa1wT0sTJUlqtqYlWXCxjaCk08ZJhmA9Fpop0bRwtA+hntxb0haEqsLAq2ZOrvkgt8S3FBD9d/DCWmYS/r9ZqJRe6bWAn6AH34FIUNJL5DCcyJonVM4b+qTS4IYTNP71bZ6V6d+KXrnZ6pTjMh+fsfgwvWgsw=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1135.namprd15.prod.outlook.com (10.175.2.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 20:36:59 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::60a3:aa3d:235c:1b57]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::60a3:aa3d:235c:1b57%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 20:36:59 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: OpenBMC@OCP Technology Day(s)
Thread-Topic: OpenBMC@OCP Technology Day(s)
Thread-Index: AQHVBRSeFNSC0pTGjkajhriKEqYcdg==
Date: Tue, 7 May 2019 20:36:59 +0000
Message-ID: <2B4BC3EA-95BD-41E6-98DB-8BA5408598B8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c091:200::1255]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba694dfd-2e4b-4cd0-a71d-08d6d32bc109
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MWHPR15MB1135; 
x-ms-traffictypediagnostic: MWHPR15MB1135:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <MWHPR15MB11357591261858551A388898CE310@MWHPR15MB1135.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(136003)(376002)(396003)(199004)(189003)(476003)(6916009)(83716004)(2616005)(316002)(7736002)(54896002)(236005)(6512007)(86362001)(102836004)(46003)(33656002)(6506007)(186003)(66476007)(66556008)(66946007)(66446008)(73956011)(64756008)(53936002)(76116006)(71200400001)(71190400001)(6486002)(82746002)(606006)(256004)(6436002)(6306002)(99286004)(25786009)(410100003)(68736007)(8676002)(486006)(8936002)(5660300002)(6116002)(478600001)(2906002)(81156014)(81166006)(966005)(14454004)(36756003)(4744005)(15940465004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1135;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TWOSpDvCGXJ+lsSxAtQZW+AH417rHyCJf9GyNjTXkwWy9qDBHF+HKdO8/QsTiox8gz4kdP+Bww3UlQftxBN3VgvJPhTib/uIVfgHM3XJ+cCRquXDx8wvLNN4LV00omglCN2KuAb5O+91xbmpYDZUffeY9kaWRQbu2Ohpoqg0nJw58OslqkMJlEw9mksqtVWNxBzGi5unBbA6ERzkMLSVQ4zs156nlldDSYgRjTaM/KG5nFdnZ3FdeCz2OWGKZyqhz+E/oq82v9QUsD3zVfKkLzT0pboKfrQ6YgExpIJxprPBw6/EetbCYeAexMXQ5PI4Rx5nVC+Aa27+TOrriLtTJffl9EQhcypLuU5C3ujC1bkSEAyZjzHx1Z39aOkhhgmwcf8CJMrp8iJGdjwb0Zc8R1xuvSSZb8AR6C6YqoVpL3E=
Content-Type: multipart/alternative;
 boundary="_000_2B4BC3EA95BD41E698DB8BA5408598B8fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ba694dfd-2e4b-4cd0-a71d-08d6d32bc109
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 20:36:59.4092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1135
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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

--_000_2B4BC3EA95BD41E698DB8BA5408598B8fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aHR0cHM6Ly93d3cub3BlbmNvbXB1dGUub3JnL25ld3Mvb2NwLWlzLWhpdHRpbmctdGhlLXJvYWQt
Y2hlY2stb3V0LXRoZXNlLWFtYXppbmctZ2xvYmFsLWV2ZW50cy1jb21pbmctdXAtdGhhdC15b3Ut
ZG9udC13YW50LXRvLW1pc3MNCg0KVGVhbSwNCg0KRllJLCBPcGVuIENvbXB1dGUgUHJvamVjdCAo
T0NQKSBpcyBkb2luZyBzZXZlcmFsIHJvYWQgc2hvd3MgaW4gdGhlIG5leHQgZmV3IHdlZWtzIChU
YWl3YW4sIEluZGlhLCBDaGluYSwgSmFwYW4pLiBJdCBpcyBhIGdyZWF0IGlmIHNvbWUgb2Ygb3Vy
IGNvbW11bml0eSBtZW1iZXJzIGNhbiB2b2x1bnRlZXIgdG8gc3BlYWsgYW5kL29yIGF0dGVuZCBh
bmQgcmVwcmVzZW50IG91ciBPcGVuQk1DIGNvbW11bml0eSBwcm9qZWN0LiBUaGlzIHdpbGwgYmUg
YW4gb3Bwb3J0dW5pdHkgdG8gZW5nYWdlIHdpdGggaW5kdXN0cnkgYXR0ZW5kZWVzIGFuZCBzaGFy
ZSBvdXIgb3BlbiBzb3VyY2UgQk1DIHByb2plY3QgYW5kIGNsYXJpZnkgYW55IGNvbmNlcm5zIHRo
ZXkgbWlnaHQgaGF2ZS4gRmVlbCBmcmVlIHRvIHJlZ2lzdGVyIGZvciB0aG9zZSBldmVudHMgYW5k
IChvcHRpb25hbGx5KSBhZGQgeW91cnNlbGYgdG8gdGhlIHNoYXJlZCBkb2MgdG8gbGVhcm4gd2hv
IGVsc2UgeW91IG1pZ2h0IGJlIGFibGUgdG8gc2VlIGF0IHRoZXNlIGxvY2FsIG1lZXR1cCBldmVu
dHMgQCBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9zcHJlYWRzaGVldHMvZC8xcHkzMldiS2swMHl6
a2g4ZlFLaEtJMHh2ejliY0xFbWVjQUtFcVhTMi1hUS9lZGl0P3VzcD1zaGFyaW5nDQoNClBsZWFz
ZSByZWFjaCBvdXQgaW4gY2FzZSB5b3Ugd291bGQgbGlrZSB0byB2b2x1bnRlZXIgYXMgc3BlYWtl
ciBhdCB0aGVzZSBldmVudHMuDQoNClRoYW5rcywNClNhaS4NCg0K

--_000_2B4BC3EA95BD41E698DB8BA5408598B8fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <1DE5D80AB4170443ADB5A43C52C9E277@namprd15.prod.outlook.com>
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
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxhIGhyZWY9Imh0dHBzOi8vd3d3
Lm9wZW5jb21wdXRlLm9yZy9uZXdzL29jcC1pcy1oaXR0aW5nLXRoZS1yb2FkLWNoZWNrLW91dC10
aGVzZS1hbWF6aW5nLWdsb2JhbC1ldmVudHMtY29taW5nLXVwLXRoYXQteW91LWRvbnQtd2FudC10
by1taXNzIj5odHRwczovL3d3dy5vcGVuY29tcHV0ZS5vcmcvbmV3cy9vY3AtaXMtaGl0dGluZy10
aGUtcm9hZC1jaGVjay1vdXQtdGhlc2UtYW1hemluZy1nbG9iYWwtZXZlbnRzLWNvbWluZy11cC10
aGF0LXlvdS1kb250LXdhbnQtdG8tbWlzczwvYT48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+VGVhbSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PkZZSSwgT3BlbiBDb21wdXRlIFByb2plY3QgKE9DUCkgaXMgZG9pbmcgc2V2ZXJhbCByb2FkIHNo
b3dzIGluIHRoZSBuZXh0IGZldyB3ZWVrcyAoVGFpd2FuLCBJbmRpYSwgQ2hpbmEsIEphcGFuKS4g
SXQgaXMgYSBncmVhdCBpZiBzb21lIG9mIG91ciBjb21tdW5pdHkgbWVtYmVycyBjYW4gdm9sdW50
ZWVyIHRvIHNwZWFrIGFuZC9vciBhdHRlbmQgYW5kIHJlcHJlc2VudA0KIG91ciBPcGVuQk1DIGNv
bW11bml0eSBwcm9qZWN0LiBUaGlzIHdpbGwgYmUgYW4gb3Bwb3J0dW5pdHkgdG8gZW5nYWdlIHdp
dGggaW5kdXN0cnkgYXR0ZW5kZWVzIGFuZCBzaGFyZSBvdXIgb3BlbiBzb3VyY2UgQk1DIHByb2pl
Y3QgYW5kIGNsYXJpZnkgYW55IGNvbmNlcm5zIHRoZXkgbWlnaHQgaGF2ZS4gRmVlbCBmcmVlIHRv
IHJlZ2lzdGVyIGZvciB0aG9zZSBldmVudHMgYW5kIChvcHRpb25hbGx5KSBhZGQgeW91cnNlbGYg
dG8gdGhlIHNoYXJlZA0KIGRvYyB0byBsZWFybiB3aG8gZWxzZSB5b3UgbWlnaHQgYmUgYWJsZSB0
byBzZWUgYXQgdGhlc2UgbG9jYWwgbWVldHVwIGV2ZW50cyBAIDxhIGhyZWY9Imh0dHBzOi8vZG9j
cy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFweTMyV2JLazAweXpraDhmUUtoS0kweHZ6OWJj
TEVtZWNBS0VxWFMyLWFRL2VkaXQ/dXNwPXNoYXJpbmciPg0KaHR0cHM6Ly9kb2NzLmdvb2dsZS5j
b20vc3ByZWFkc2hlZXRzL2QvMXB5MzJXYktrMDB5emtoOGZRS2hLSTB4dno5YmNMRW1lY0FLRXFY
UzItYVEvZWRpdD91c3A9c2hhcmluZzwvYT48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPlBsZWFzZSByZWFjaCBvdXQgaW4gY2FzZSB5b3Ugd291bGQgbGlrZSB0byB2
b2x1bnRlZXIgYXMgc3BlYWtlciBhdCB0aGVzZSBldmVudHMuPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlNhaS4gPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9i
b2R5Pg0KPC9odG1sPg0K

--_000_2B4BC3EA95BD41E698DB8BA5408598B8fbcom_--
