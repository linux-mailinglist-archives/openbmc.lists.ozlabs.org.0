Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83882F581F
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 21:21:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478sB01SmbzF7cn
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 07:21:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=62150e7a2e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="m5P+xPCu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Trl5i18u"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478s7M336zzF3ry
 for <openbmc@lists.ozlabs.org>; Sat,  9 Nov 2019 07:19:19 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8KFMlJ021230; Fri, 8 Nov 2019 12:18:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=vHbYIDjFj2Udqd1dmW30ZdxcyAsxbmMutWrnu412Lk0=;
 b=m5P+xPCuIXWFbbyS5gul+Yc6oBRLriwDNiLh4IGCfMD/rgQW8HKERmzflb4k8JrQH8zc
 fSLAHbpU40Jc7/Ji9or+7mYZJVNUJxudlT0xWY3Sf1RRb9sANstzwPlZJCrtbw63rg34
 g0EIU9ZLsegvKjUTStozoM+BlqbTYtN5jMY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2w5a4rhv6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Nov 2019 12:18:15 -0800
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 8 Nov 2019 12:18:13 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 8 Nov 2019 12:18:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9+cPQ3KooPKPmerM7nGNx+exuZcTLwW8WoV/Ws1CdZCWcQwMIGByhdMZ47ASKGCJj5IkGboe96dqlmSh2dJvF6bKSbPAbfZy+UTcKCORZNLXkxsfQ9fy3eGSbec7C7tjTp8BHWYG6n1jGGasipzJyikj8OF4zSh3FWxuwjYuYLyHIAtvaZyuuc0wX/D8fDCyJX+z9aJPlkY1Iy5Fgti4gGBQIcFRvRYT9kMwErISdUJiXvVv6dWy0Tug5eje4C9B9NryVx1uuV3743r059LqJRTt5U0Ms1C6WnO2LsvI7QhkNIVs2GO6f7IThXAI5Udo8Jhq5h6KXQLCPGL5Ww2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHbYIDjFj2Udqd1dmW30ZdxcyAsxbmMutWrnu412Lk0=;
 b=f/NkHlxetpcJbJvedbQupzQcBln5G7OHsdyqL97vgDOHClA3eeWmqGaChjoISbBjbJeVF8dO8Sv2uhUtfTIlbhxU/Ydu37Q9jAhKMwuGD9N61EcWP2iBTxeFhhyAbTLMnXNdQSgoIDfrnUwCJkriDYKYRo7nYI1fvHn2B0firMlLgQ0zdJEgvsftiNOkYoIVYMw94LQu8s1gQCjTPn6REaP0uyjJ/RjwZdWWIEHnb5Kx4DEcOuhMBeTmM2uSyYo0rexIKTcT4wgijU4+xnyrTfcPfE2EtEQ8qB50oQs2HLLXykC+9XCAqwp1U1+1bU2N+aRfl7QOZUpCqKVnKlTixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHbYIDjFj2Udqd1dmW30ZdxcyAsxbmMutWrnu412Lk0=;
 b=Trl5i18u4RcDsGvtimMooNLWyVkHAO7G4dETnYRVSftw+O3uFX7Ywd7RbMl0+cesF4OU7tzSbRwkxznGtwmBolziVeiT10ls4q7529iMwPMBBQ9TD93VRnrbucSe4IbnAArA5g4iy1F6CDFDp1kheSNwqinCvVoxaDT/jQX/++c=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3667.namprd15.prod.outlook.com (52.133.253.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Fri, 8 Nov 2019 20:18:12 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 20:18:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Subject: ipmb bridge
Thread-Topic: ipmb bridge
Thread-Index: AQHVlnGlQsGRLWH4QkWnkQ6P8OrtEQ==
Date: Fri, 8 Nov 2019 20:18:12 +0000
Message-ID: <AD40F5EA-1994-44CC-B49B-DBDBB79AD484@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:a87a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf2071de-0ef7-44fe-452a-08d76488c7e6
x-ms-traffictypediagnostic: BY5PR15MB3667:
x-microsoft-antispam-prvs: <BY5PR15MB3667115D05BA78C6874E6A89DD7B0@BY5PR15MB3667.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(71190400001)(64756008)(14454004)(36756003)(110136005)(66556008)(221733001)(256004)(25786009)(6116002)(6486002)(6306002)(3480700005)(54896002)(102836004)(71200400001)(186003)(6512007)(46003)(5660300002)(558084003)(8676002)(81156014)(81166006)(4326008)(2616005)(86362001)(91956017)(33656002)(7736002)(478600001)(66946007)(9326002)(66476007)(66446008)(8936002)(316002)(76116006)(476003)(2906002)(6506007)(99286004)(7116003)(6436002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3667;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wt8ts6lvrqmq4DNYLoHY/M87DV0Q4UlZ4MS4vKA939bZopHR3mtrEiiUYTpeqVp6ycnqgPgtjrBnDBbMWq65Gc+miRt01wLg2bNWCng52YDHF+qnaYbMeXqLAxpRx/cJCHewcGclllAe/OgN0FlYRjVGgJeqi67lUvj/nKHCFRptQnm+LKjpfLMDjDOGFoQUEjhMIypRWNnoW8xb+1VH8YK/nFwLbUaCaWEo/8SlwuIc8LJ4KShd464nY4u56TVt+FI/HG1NNEePjTkR3AcZYMFHT2iSmjBO3VZuBP/GTn1Cqv0yCn5zxCl2dq1wuh+PVjbJUeLOSlA3zb+cP8f+UowvNO7sNX+9niT78AaisnjjVpZ9gVFUgcn5whG9XPZGX0XUDE9evTA0bg0tYq0hqrKjf8UJsChI/Yh7h5g8oaPzOXMY0Nh6rEi3vSvzM2iQ
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AD40F5EA199444CCB49BDBDBB79AD484fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2071de-0ef7-44fe-452a-08d76488c7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 20:18:12.7102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83c6sYUUkslXijWoTG0QN1k5q9pOt1aT0Y4+lagec8XTwMnu1bvB+61GdoJ0GZmVsSY7qqqlAZxGAHKRJgaFRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3667
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_07:2019-11-08,2019-11-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 mlxlogscore=788 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911080195
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

--_000_AD40F5EA199444CCB49BDBDBB79AD484fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFlLA0KQ3VycmVudCBpcG1iIGJyaWRnZSBuZWVkcyBtcXVldWUgc2xhdmUgZHJpdmVyIHdo
aWNoIGlzIG5vdCB1cHN0cmVhbS4gVGhlcmUgaXMgYSBpcG1iIGRyaXZlciBpbiBrZXJuZWwgYW5k
IG91ciBpcG1iYnJpZGdlIGRvZXNu4oCZdCB1c2UgaXQuIEkgYW0gaW4gdGhlIHByb2Nlc3Mgb2Yg
dXNpbmcgdXBzdHJlYW0gSVBNQiBkcml2ZXIgYW5kIHdhbnQgdG8gcmV2aXNlIGlwbWJicmlkZ2Ug
Y29kZSBhcyBwZXIgaXBtYiBkcml2ZXIuIFBsZWFzZSBhZHZpc2UuDQoNClJlZ2FyZHMNCi1WaWph
eQ0K

--_000_AD40F5EA199444CCB49BDBDBB79AD484fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8462557FA746FC4782DD703CCBE4ECE1@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSBKYWUsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkN1cnJlbnQgaXBtYiBicmlkZ2Ug
bmVlZHMgbXF1ZXVlIHNsYXZlIGRyaXZlciB3aGljaCBpcyBub3QgdXBzdHJlYW0uIFRoZXJlIGlz
IGEgaXBtYiBkcml2ZXIgaW4ga2VybmVsIGFuZCBvdXIgaXBtYmJyaWRnZSBkb2VzbuKAmXQgdXNl
IGl0LiBJIGFtIGluIHRoZSBwcm9jZXNzIG9mIHVzaW5nIHVwc3RyZWFtIElQTUIgZHJpdmVyIGFu
ZCB3YW50IHRvIHJldmlzZQ0KIGlwbWJicmlkZ2UgY29kZSBhcyBwZXIgaXBtYiBkcml2ZXIuIFBs
ZWFzZSBhZHZpc2UuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5S
ZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_AD40F5EA199444CCB49BDBDBB79AD484fbcom_--
