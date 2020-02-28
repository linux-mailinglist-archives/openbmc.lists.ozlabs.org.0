Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CA173027
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 06:20:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48THsx6z90zDrHg
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 16:20:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9327be7d46=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=NEEG4UI0; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=XumM20B1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48THs22vgLzDrF8
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 16:19:12 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S5GNjJ005827; Thu, 27 Feb 2020 21:19:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=vzef9TUKvyfpmLNAyoAf4AX2vniQDDjFTqxL0QiQnYI=;
 b=NEEG4UI0d892zRLtQNVCSDBcmhmUwxFNEsNUdKZQoJ2drV5c9HNUC+/iTL+G+IFxz0i0
 3sm3Nk1j5ctVjLdGaw0SQEIjLQNUo1nUQRfgb98PbqLvEggmOfpr5eZoEGWKLWVh/I36
 85v/u0j9umQdzN2hRJwgm4JFOR8AyT3osB4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2yepva1c1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Feb 2020 21:19:06 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 21:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8n1zmB91102iu1Mn8nqnpdormhv99EPLLPX38uFQ+jbEQ1sHaq1oQfnOVxNNh2Gj8gLQy9Djd8vgCgW7kUgmYzLko/RczZHBCbIKkWWWvZjuWyhos4xfJy0eTetCFqsf4UmoUq/q95uklKy1HwzscR6eGOqKJ6GHhZB1n/A4DnCJjti6+jFZe57nuHsgGhmxPHL/izhS5kBfCPgqRDZo6XarUG6C6lXGWDoVcS4iRXA72r4tJNLZJdXpDg1Uyaz8y+Iy+6RfvRUuCAL0cyXRRUBKoq3/PAOlvE+ci7pVHPCFO7lYbxc5jqamKP6pApuud3Q+/AQv3Mc4IJ24T1fgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzef9TUKvyfpmLNAyoAf4AX2vniQDDjFTqxL0QiQnYI=;
 b=HyGU8nRd/JTOETU4HDZn+m3YxR2jnWPhgURJPM0crIQ+hHYOYkW7TpnQigGPl4W+8HjOlwleWv0LIJKV3C0t7eJnCgNk1v5I0LUn9JJclTBkX8u8gnPeDoi9iABAiuM6sp9oYuS35r+Hr68MMEbXDWQYd6+5PUwu84til57QRNOdikeVdjG2uIQrWNxADr2W/YZYkxA56gItoeVDMQVkfFFqQMwKYHC09/84LyZYEtTdmQnEcNMIxY9UbcL3pw4rlnxi+w4esPdHo/yGXFH8Y0IZRC68CZ5i0dkhIGX1aU7XoLT4RWhCKIJl2sv4eNhtC28+axwutUJlT0dzx+Wu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzef9TUKvyfpmLNAyoAf4AX2vniQDDjFTqxL0QiQnYI=;
 b=XumM20B1pMa7vmbDg52OMDFEB6zqnLTRBTphs04jxWL2rofvXBQdCCw6qSWu/189lDoWTQgKUM6S+jqJKpq3nld7i+sS30UuiEws09sj4ZiW9dbTOOvJWmr46w59/BOEemS2zlvmS5HJwpI0infwImAb1vDigjpxtOvps4CcsZs=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3881.namprd15.prod.outlook.com (2603:10b6:303:4a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 28 Feb
 2020 05:18:50 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.012; Fri, 28 Feb 2020
 05:18:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: obmc console for multiple host
Thread-Topic: obmc console for multiple host
Thread-Index: AQHV7faP5RFIDWYuz0yVWkpwSrbrEw==
Date: Fri, 28 Feb 2020 05:18:50 +0000
Message-ID: <37851ADF-67EC-4761-A4C5-33F28373A609@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:773f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4328565e-10bd-44a1-50ce-08d7bc0db225
x-ms-traffictypediagnostic: MW3PR15MB3881:
x-microsoft-antispam-prvs: <MW3PR15MB38811A78155191A565196E89DDE80@MW3PR15MB3881.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(33656002)(86362001)(66556008)(66446008)(64756008)(478600001)(6506007)(36756003)(66476007)(316002)(6512007)(2616005)(186003)(6486002)(4744005)(81166006)(4326008)(8676002)(81156014)(66946007)(76116006)(8936002)(71200400001)(2906002)(9326002)(5660300002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3881;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lTEDdhcTjj3lhRfijQfJsrlTzhU/oO/QbZ6ghkoIhFzu8KB36zcY9UcY45ZwItUa+gsv/DiTwYUTXayZh5S412Mhl6L65HODoKv1ogy/8uQ0NSpmYwvKTN/GltjUiD3ixpDOdhxWwaAnaPWraHFl7DnR+EnjjxsxSUmkCH70aAoVpKYDF3VrylZBKyOD2St8iJDRihLKEjTRYIF3oQ1j9totMBc8/2sN28gSnhqYYBS14WXQQQSEgO26Tw20JTBahii7x01jlXWy839ioxtOuUbRn+nlFtUs6BRUuOx1arBkIJGW17jblTMBECYRA+RuSruRjdzSPRo+CJLhKdbPZO9fk6WirPhU0arAWPii0VvMwM1FKGMvVZnTe7hBhU16wk4qOP9lhWUn8h+trZaGUQPUoZ3ze+EMNPFO6v2Ug4AEMY/CcugdbXafLCbMRaRf
x-ms-exchange-antispam-messagedata: OlwCLOJ/djmS8CA6JwsjtsxdCjc4TSzW3SYxDKtZ2j3ZwVCrUh8o+Zk0TDCehBosHHcBd9Iv5ukb/yzkXRqy2N9j6MLDRI+uambRbA4TLCiYlUCUqdrdaTeA5qDIRB2T7FinKU9F0rxrtB8zDwWmgmTYgQq0QqFEqbLq7rOdM3r9DkbC/+DyRNtnS82YTTCM
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_37851ADF67EC4761A4C533F28373A609fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4328565e-10bd-44a1-50ce-08d7bc0db225
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 05:18:50.3590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhSxtTzhpBN3z5NNpfCzZqH6fEDjjGDny2+EZg2pp0zJ6Nae27M12A/+FaOziVxol4M4pPZbBWqbiyp9KY0/YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3881
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_08:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=727 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280046
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

--_000_37851ADF67EC4761A4C533F28373A609fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KSSBzYXcgbmV3IG11bHRpIGhvc3Qgc3VwcG9ydCBpbiBvYm1jIGNvbnNvbGUu
IFRoYW5rcyBmb3IgZXh0ZW5kaW5nIG9ibWMtY29uc29sZSBmb3IgbXVsdGkgaG9zdCBjb25uZWN0
aW9uLg0KDQpDYW4geW91IHBsZWFzZSBzZW5kIG1lIG5ldyBjaGFuZ2VzIHJlcXVpcmVkIGluIGNv
bmZpZ3VyYXRpb24gZmlsZSBhcyB3ZSBhcmUgZGVmaW5pbmcgbG9jYWwtdHR5IGFuZCBiYXVkIGZv
ciBob3N0IGluIG91dCBjb25maWd1cmF0aW9uIGZpbGUgZm9yIHNpbmdsZSBob3N0LiBXaGF0IHdv
dWxkIGJlIGEgc2FtcGxlIGNvbmZpZyBmaWxlIGZvciBtdWx0aXBsZSBob3N0IHN1cHBvcnQgYW5k
IGFsc28gd2hhdCBhcmUgY29tbWFuZCBsaW5lIG9wdGlvbiB3b3VsZCBiZSBmb3IgY2xpZW50IHRv
IGNvbm5lY3QgdG8gcGFydGljdWxhciB0dHkuDQoNCkFueSBkb2N1bWVudCBvciBhbnkgbW9kdWxl
IHdobyBpcyBjdXJyZW50bHkgdXNpbmcgdGhpcy4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_37851ADF67EC4761A4C533F28373A609fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2739CE8653ACB740A589D33536C78988@namprd15.prod.outlook.com>
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
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEFuZHJldyw8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
SSBzYXcgbmV3IG11bHRpIGhvc3Qgc3VwcG9ydCBpbiBvYm1jIGNvbnNvbGUuIFRoYW5rcyBmb3Ig
ZXh0ZW5kaW5nIG9ibWMtY29uc29sZSBmb3IgbXVsdGkgaG9zdCBjb25uZWN0aW9uLjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q2FuIHlvdSBwbGVhc2Ugc2VuZCBt
ZSBuZXcgY2hhbmdlcyByZXF1aXJlZCBpbiBjb25maWd1cmF0aW9uIGZpbGUgYXMgd2UgYXJlIGRl
ZmluaW5nIGxvY2FsLXR0eSBhbmQgYmF1ZCBmb3IgaG9zdCBpbiBvdXQgY29uZmlndXJhdGlvbiBm
aWxlIGZvciBzaW5nbGUgaG9zdC4gV2hhdCB3b3VsZCBiZSBhIHNhbXBsZSBjb25maWcgZmlsZSBm
b3IgbXVsdGlwbGUgaG9zdA0KIHN1cHBvcnQgYW5kIGFsc28gd2hhdCBhcmUgY29tbWFuZCBsaW5l
IG9wdGlvbiB3b3VsZCBiZSBmb3IgY2xpZW50IHRvIGNvbm5lY3QgdG8gcGFydGljdWxhciB0dHku
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5BbnkgZG9jdW1lbnQg
b3IgYW55IG1vZHVsZSB3aG8gaXMgY3VycmVudGx5IHVzaW5nIHRoaXMuPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1W
aWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_37851ADF67EC4761A4C533F28373A609fbcom_--
