Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444D4AB6A
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 22:08:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SzfW08VczDqjM
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 06:08:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=1072ca1e4a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="giqvbM66"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="nOGJxL3E"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Szdt5SJSzDqgn
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 06:07:42 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IK4Jqt026769
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 13:07:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=b1i4TbRfAjQqC8lOmZUMYRf5RjObtN+AYe+Ee5IpKmw=;
 b=giqvbM66oDZpx8E10Ne7wrBFZDcDyXAODAngl5llW2X5SnGDMq/kUj7lbPh94H4TdV8A
 +CLtjAkrayIuCIyOtT7yIO4Fr+yArLE1p2TcsTxGH5lXokoz8q5+0D51rZQ2Aux7m6eT
 CN5s3iqDM3aqIz0QJyMMXFAZfkb2u01nD4g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2t6xxn1swu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 13:07:37 -0700
Received: from ash-exopmbx101.TheFacebook.com (100.104.35.171) by
 ash-exhub104.TheFacebook.com (100.104.35.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Jun 2019 13:07:37 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Jun 2019 13:07:31 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 18 Jun 2019 13:07:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1i4TbRfAjQqC8lOmZUMYRf5RjObtN+AYe+Ee5IpKmw=;
 b=nOGJxL3EK7TassVwo7fZmgHjJwN5WqxjHebpw1wRakpNj6K2xtG8CFcneKDFb4bylEPxWIeYhGRgdez6ZGo4doQinHy1SgxA8edwDZd6hsVPqbioDchePzMAgE1DQ+1sV8ThGS9xXAJL2nl7mX2KqE9+KVaSFAi6vtkY09RZah8=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1767.namprd15.prod.outlook.com (10.172.76.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 20:07:30 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c026:bca5:3f4e:9b1f%3]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 20:07:30 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: NVME-MI temperature sensors
Thread-Topic: NVME-MI temperature sensors
Thread-Index: AQHVJhF1JZY8k04OyUub+UD9bakQWg==
Date: Tue, 18 Jun 2019 20:07:30 +0000
Message-ID: <963572AF-71AC-4830-ACBE-CABBFDD2B929@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3b5a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7205433c-c61a-4b7e-7a2d-08d6f4289804
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1767; 
x-ms-traffictypediagnostic: CY4PR15MB1767:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB17671157D41E43F0624906EEDDEA0@CY4PR15MB1767.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39860400002)(396003)(366004)(346002)(189003)(199004)(81156014)(1730700003)(6116002)(4744005)(6506007)(54896002)(7736002)(71190400001)(86362001)(76116006)(3480700005)(73956011)(66946007)(81166006)(91956017)(53936002)(8676002)(8936002)(2906002)(316002)(6512007)(33656002)(6916009)(99286004)(5660300002)(6486002)(64756008)(66476007)(68736007)(66556008)(66446008)(71200400001)(46003)(2616005)(486006)(476003)(14454004)(478600001)(256004)(186003)(102836004)(2351001)(6436002)(36756003)(6306002)(5640700003)(2501003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1767;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IZmLcTdT3jFscu8cuEXK4AoVH5ztEbdCA6z0+n+Ztq9NbsLiJ9jkixJZvnsuMI7HaGNydii+FZxdFEYW23VMxESK5h7vFPkqs+gtLCpFlFmdtQg6o5gsqTaR3gvAFnwmG8wNO9aI66VeyYaSZ/UC6BS6D8eIKI+M8EmeIiBs8WtrFHd4E4X97js7KHXsHJkuMX0R9c119mW+t2MWR7AFFNsRthlIG8Xp7Fu1pSSYz+EUiQrMh/UKyuOafseBcRlQ8IAaQHZcKfgb3/7URMo/3lYaE558sE15qNKa0GW2v7oRaMVLtN2vkszbR+wHX5Ivpz38/P9WRpgXaDd8JhkG/3hI7ldII6Pkh5jEP1HqC5qkSnv3VIyVMeaXsABvv1g488yCY0rYtUYP8C5eiY2t9Gn11S4o7oaSqz0VLAhuXGM=
Content-Type: multipart/alternative;
 boundary="_000_963572AF71AC4830ACBECABBFDD2B929fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7205433c-c61a-4b7e-7a2d-08d6f4289804
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 20:07:30.4992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1767
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=711 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180159
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_963572AF71AC4830ACBECABBFDD2B929fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgYW0gdHJ5aW5nIHRvIGV4cG9zZSB0ZW1wZXJhdHVyZSBzZW5zb3IgcHJvdmlkZWQg
YnkgTlZNRSBTU0QgZHJpdmUuIEFzIHBlciBOVk1FLU1JIHNwZWMgZGV2aWNlIHByb3ZpZGVzIHRl
bXBlcmF0dXJlIHNlbnNvciB2YWx1ZSBhdCBkZWZpbmVkIHJlZ2lzdGVyLiBJcyB0aGVyZSBhbnkg
TGludXgga2VybmVsIGRyaXZlciwgSSBuZWVkIHRvIGVuYWJsZSB0byBnZXQgdGhlc2Ugc2Vuc29y
cyBvZiBhIFNTRCBkZXZpY2Ugd2UgaGF2ZS4gSSBzZWUgc29tZSBOVk1FIHRlbXBlcmF0dXJlIHNl
bnNvcnMgZGVmaW5pdGlvbiBpbiBtZXRhLXF1YW50YS9tZXRhLWdzaiBjb25maWcueWFtbCBhbmQg
d2FzIHdvbmRlcmluZyBob3cgYXJlIHRoZXNlIHJlYWQuDQoNCkFueSBpbmZvcm1hdGlvbiBvbiB0
aGlzIHdvdWxkIGJlIGhlbHBmdWwuDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_963572AF71AC4830ACBECABBFDD2B929fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D0808B062EAC564A916B2C18D57F4F55@namprd15.prod.outlook.com>
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
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNl
Y3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAx
LjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5
NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UZWFtLDxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5J
IGFtIHRyeWluZyB0byBleHBvc2UgdGVtcGVyYXR1cmUgc2Vuc29yIHByb3ZpZGVkIGJ5IE5WTUUg
U1NEIGRyaXZlLiBBcyBwZXIgTlZNRS1NSSBzcGVjIGRldmljZSBwcm92aWRlcyB0ZW1wZXJhdHVy
ZSBzZW5zb3IgdmFsdWUgYXQgZGVmaW5lZCByZWdpc3Rlci4gSXMgdGhlcmUgYW55IExpbnV4IGtl
cm5lbCBkcml2ZXIsIEkgbmVlZCB0byBlbmFibGUgdG8NCiBnZXQgdGhlc2Ugc2Vuc29ycyBvZiBh
IFNTRCBkZXZpY2Ugd2UgaGF2ZS4gSSBzZWUgc29tZSBOVk1FIHRlbXBlcmF0dXJlIHNlbnNvcnMg
ZGVmaW5pdGlvbiBpbiBtZXRhLXF1YW50YS9tZXRhLWdzaiBjb25maWcueWFtbCBhbmQgd2FzIHdv
bmRlcmluZyBob3cgYXJlIHRoZXNlIHJlYWQuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5BbnkgaW5mb3JtYXRpb24gb24gdGhpcyB3b3VsZCBiZSBoZWxwZnVsLjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_963572AF71AC4830ACBECABBFDD2B929fbcom_--
