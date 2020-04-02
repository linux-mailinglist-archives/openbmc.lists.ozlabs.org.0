Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790F19C86C
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 19:58:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tW4r54khzDrR6
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 04:58:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=136150da4c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=daQMA3fP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=FsTxrM88; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tW441YHhzDrPj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 04:57:16 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032HcuWl023565; Thu, 2 Apr 2020 10:56:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=Z1AGBOI0NAt/x4m2CrWpf325pS+wT0Tn3qBtRQ4pGgg=;
 b=daQMA3fPdUd2/NzUKDf/rzBSKfkDIiKMDElqFFGbFI9PlZyfrB4iGCvSqkE/4WdHiyvi
 CdPeBWLdTbZU3rdlDd+279sgNGIwbNyygGrS5u+7WE7TEtjkkdnsYYp7VclYIv3vH0m9
 /VyLbKN4ixIjyFL1Zl576O6fK71UKoLi3AU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 304cxbtkwq-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Apr 2020 10:56:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 2 Apr 2020 10:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixowg7h6BwbWi9rQeGDc1cp6BrfYyeirKObzZ44nV3RPhcgZZXFLSb7RVFeREoNEpAJnCaX6lJoERomIS5pSXt+1wJW26sAUSiV0Xig46n8DmklJjA1+fT+jC8tXsZuK9xnewONTgZAg3ZABTFUGfz22EM+NtGQ4Gs2v9+noiK7tqi16IUaGNFR3o111mIm+64sSgvPbFX1tJAWtnud9Gr49974mwEZ5azZsc5KJPkOpeFRzq79LUNoD38mTEoIQXyhYxQzGCtrzYdzfprHZZeBkPRW/LWr+bsPcOkYMlGmaeNirK/wGS1LhnSkuqyABfj25msgZgf9smvHWMWQmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1AGBOI0NAt/x4m2CrWpf325pS+wT0Tn3qBtRQ4pGgg=;
 b=ZHFB83Qgc9x3S8AJSE4fhnEAsHisXRTKssyG/sxb+UpgaTnGWSQlFJfoRhQIL2G2DNW8TW/9SbkiKbwvJeO9Qxz54n8wirPmZBPBALLzTDiMgtcdq1iYBgEYe5ReDK50K/Y7oykbOAQWWgdqrBQWhh961TBE954eAj+uqbmM1e4pxdaPzt2KNrabK7xk0BFb/QxQlCmjfgfvck2zqJTYzPx6KfVVRabSxjU627iRbEpX9LE0yV02y9Elo1wmENKjhFqz+8fMByOmHaLe8UTd8bKxvA413Jijb9dauP2ku0TVIAEmVRH2T19p5TR/9rceYXMQ4c7T6K2OUgKJmPPO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1AGBOI0NAt/x4m2CrWpf325pS+wT0Tn3qBtRQ4pGgg=;
 b=FsTxrM88WmPT2FgPSW0F5fwxw0iDTHJE7TJdHQ/7rx9Y3TT/isU3Z/IAAvKHvd+7u93KVlPyVnEpZY27AumHd69px539zQrWAagfds1Ib9alHIW4El71WV62E1RNI5ugg3FwcS8v9qSavGQsm66o9XJR8DfCP5YBcekY1c/FGFE=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3786.namprd15.prod.outlook.com (2603:10b6:303:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 2 Apr
 2020 17:55:59 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:55:59 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Subject: power policy restore
Thread-Topic: power policy restore
Thread-Index: AQHWCRf3b0zT45fpmk+NqEh4rhzsWA==
Date: Thu, 2 Apr 2020 17:55:59 +0000
Message-ID: <420CA5B5-8C0F-4ACD-84E8-8FD374B7F1C7@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856e8a42-335b-4a02-ecdf-08d7d72f1a12
x-ms-traffictypediagnostic: MW3PR15MB3786:
x-microsoft-antispam-prvs: <MW3PR15MB3786D247DBF8BD999AFEE34EDDC60@MW3PR15MB3786.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(39860400002)(346002)(376002)(396003)(136003)(7116003)(81166006)(81156014)(9326002)(8676002)(4326008)(8936002)(478600001)(6506007)(186003)(2906002)(6486002)(6512007)(33656002)(316002)(66556008)(64756008)(36756003)(66476007)(71200400001)(5660300002)(3480700007)(66446008)(6916009)(86362001)(2616005)(66946007)(4744005)(91956017)(76116006)(133083001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ozO3qBvfy7heVnJ9jv/vD0p6ez/upJtHVT92qopYTWNj6lh0YbOUFrT/EE4l6J+5JAu4EsuFJNha+Ikivzg8V1pJ8FfR7ZsDf9CWJdsQumYKLOBN1cNYYZfEroFXMV84ButbNKBndE59X7a+paKck4IVY8Sbs4Y3o3Qa1mhpWbHqQewpePf86aSrP+p6yMCqmmuajXMoKnFTjarrdUTXnCnJ96ZWk7kfQnUxcHJtJ3ckAxTuKtKvnOAkAkLZs0XsFOTz7NjvA/QtBE1SvbB74iCbeOSYb3qkZS/dT4STkFoMyHXGxPTF7zpoJLkMqxFhDDGZKaFd6dJnMIlbKaouonyGFe4Luu5yU5QhS6SrUOEMBXSTvLkhx0772ci3P9FXdfPuT2aA1GbPi4ZVoYRitr1jskTkjFeklFWdTT0ae8iKPZqnB8MF0jy7s6irOZc89OQkR0fW5CFiOug91iW40kelaBH7yj+H7XG6J1TgID9w7OWDi/7sSwykwB+DLbdY
x-ms-exchange-antispam-messagedata: yOEdTpgP+TA5tqwF6ce8S98Ky8KzWalkD88dEHUWG5y3rq6gGe5yx5+rxQlg/LHY4xahNrkYnPyN08EKetqa6omB1RbhcIbJSLcR1eynieZyQ5ayuwK/T39XAQvg58hbIm8UlX1KSMkpmQr0nt20OmYK9WdS0t8yKwW51ggqlKY2hd/Y0JGLR6XL09SHCuDNzQpyUmqU6rQaz7snTNAmlg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_420CA5B58C0F4ACD84E88FD374B7F1C7fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 856e8a42-335b-4a02-ecdf-08d7d72f1a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 17:55:59.5195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0G4nhY/rHFtrPi9iGzPTLpn5mV3ByVGcYn+iNyuPA8mMs6OQ+dLlqZuzzcZA58+qtyDV0myCnetNseLEHGtSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3786
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_08:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=511 mlxscore=0 clxscore=1015
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020137
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

--_000_420CA5B58C0F4ACD84E88FD374B7F1C7fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFzb24sDQpJIHNlZSBwb3dlciBwb2xpY3kgcmVzdG9yZSBpcyBpbXBsZW1lbnRlZCBpbiBj
aGFzc2lzIGhhbmRsZXIgb2YgbWFpbiBpcG1pZCBkYWVtb24uIEFuZCBJIGRvbuKAmXQgc2VlIGFu
eSBpbXBsZW1lbnRhdGlvbiBvZiBhY19ib290IGRidXMgaW50ZXJmYWNlIGFkZGl0aW9uIHdoaWNo
IGlzIHJlcXVpcmVkIGJ5IHg4Ni1wb3dlci1jb250cm9sIHRvIHN0YXJ0IHJlc3RvcmVQb3dlclBv
bGljeS4gSSBkbyBzZWUgdGhhdCB0aGlzIGludGVyZmFjZSBpcyBiZWluZyBhZGRlZCBpbiBpbnRl
bC1pcG1pLW9lbS4gRG9lcyBpdCBtZWFuIHRoYXQgcGhvc3Bob3ItaG9zdC1pcG1pZCBoYXMgaW5j
b21wbGV0ZSBpbXBsZW1lbnRhdGlvbiwgYW5kIGlmIGl0IGlzIGluY29tcGxldGUgYnkgaXBtaSBz
dGFuZGFyZCB0aGVuIGNhbiB3ZSBhZGQgY29kZSBpbiBpcG1pZC4NCg0KSXMgdGhlcmUgYW55IG90
aGVyIHBsYXRmb3JtIHVzaW5nIHJlc3RvcmVQb3dlclBvbGljeSBmZWF0dXJlcyB3aXRob3V0IGFj
X2Jvb3QgZmVhdHVyZXM/DQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_420CA5B58C0F4ACD84E88FD374B7F1C7fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B1CF0659803DCA48BC08E5FF35FEAFF9@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3
MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEphc29uLDxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5J
IHNlZSBwb3dlciBwb2xpY3kgcmVzdG9yZSBpcyBpbXBsZW1lbnRlZCBpbiBjaGFzc2lzIGhhbmRs
ZXIgb2YgbWFpbiBpcG1pZCBkYWVtb24uIEFuZCBJIGRvbuKAmXQgc2VlIGFueSBpbXBsZW1lbnRh
dGlvbiBvZiBhY19ib290IGRidXMgaW50ZXJmYWNlIGFkZGl0aW9uIHdoaWNoIGlzIHJlcXVpcmVk
IGJ5IHg4Ni1wb3dlci1jb250cm9sIHRvIHN0YXJ0IHJlc3RvcmVQb3dlclBvbGljeS4NCiBJIGRv
IHNlZSB0aGF0IHRoaXMgaW50ZXJmYWNlIGlzIGJlaW5nIGFkZGVkIGluIGludGVsLWlwbWktb2Vt
LiBEb2VzIGl0IG1lYW4gdGhhdCBwaG9zcGhvci1ob3N0LWlwbWlkIGhhcyBpbmNvbXBsZXRlIGlt
cGxlbWVudGF0aW9uLCBhbmQgaWYgaXQgaXMgaW5jb21wbGV0ZSBieSBpcG1pIHN0YW5kYXJkIHRo
ZW4gY2FuIHdlIGFkZCBjb2RlIGluIGlwbWlkLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+SXMgdGhlcmUgYW55IG90aGVyIHBsYXRmb3JtIHVzaW5nIHJlc3RvcmVQ
b3dlclBvbGljeSBmZWF0dXJlcyB3aXRob3V0IGFjX2Jvb3QgZmVhdHVyZXM/PG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
Pi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_420CA5B58C0F4ACD84E88FD374B7F1C7fbcom_--
