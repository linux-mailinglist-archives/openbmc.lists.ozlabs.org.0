Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4925845A
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:20:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgR4k1cD2zDqWM
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:20:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=651215578a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=rdyCUY6g; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=kO5LFZZT; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgR2W4zZJzDqN0
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:18:07 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VNFLWl009360
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=5KGL97ETMCrYis9qCjOsFle3WRAebleMwHQGafvDQJE=;
 b=rdyCUY6gofzrqGHtaBSJo3+Zh0t6hW2Su8b7eSx9zfE+EuNsMiLEbblnD1eD/02+Y3bF
 CLiiVa4vQnXZjWoAscJWgNhpv45lnmQkKOPP35GGVnBaPlrdNwGWgNTXZm1UXSUNQ6Ql
 KgxS1RsBvCrqtOKjOq3rB9wA66wvzWQ7h6M= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 337mhntehh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:18:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 31 Aug 2020 16:18:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7pRnYbu7qgCh2etd/dkcrm+PKFYfbQVv9CB3BzLObfoOfO195V8hxuwNPIY9iSAXUSF8/FUcBcv+422mIW/mwcgR5eqlGREd80pDCi0+CYxxEkkF1TYNud/xpuV57UFR/r8uXF2RCjUIQbkzNkwA7Zt4+OpesUiviWalVoohwVcJhWQvBtcplr7xKwjQ+kZCzQcLvFB+ac9j02NQgOwKAVMeFUy/PoPnfJsWLZr/5fr1R0rF5hbZ8JFqUZnpahvcyXCKE6mglJJmuiJBOeyZ0++c4isrSZfY+f8NhyDpudnrpFEwAzrXZVuuDhccWSULfpWI+ma1qbyeMweyKgCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KGL97ETMCrYis9qCjOsFle3WRAebleMwHQGafvDQJE=;
 b=Kv5/c8kgxuS8DW/x22XTbTow4Xx6aim+RsGQRtyw7PPJyZiz8SVX8tGrCzG7WCx0CFXCGHRs46P4LYbYx9iXFB14/8KmWndroOHCpiaPAuIWBReu9HIorJIxM8No1oLUHlAeujV1Gk13bs0LmHnlx8haLu+fOjqM+fTWmEfeJuzvAS6j++mRRnh9ymFPW+I5+zhvxnKzfmN6AiXWnv4ssNCU2NYIwUh/m/xoMjET5y0QHPajnB1j3RzdLzbwlzo8Gw9AAADL1eFsL8oth+JZV/ER2ISd8QRfFPaMCWhAGzKGWBgDmB+lUseOhRVDbUl8h5DWeRmfXHVCigqy7DkGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KGL97ETMCrYis9qCjOsFle3WRAebleMwHQGafvDQJE=;
 b=kO5LFZZTxGCE1BpCkPYWoCFvr+0JKGHGmNhauOc6/zHBnZKaxpywT4Kf2j0H5YY+GNK3YQR7mDuky2eFhMvTW+xRkNJqaDM/XtmSVdXBzXEXcD31hGqvnACCkeLHIZn2DXO17U1nUPDFFU/LmYj5do4QXBnsHEP01uXC/tLDEpk=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2646.namprd15.prod.outlook.com (2603:10b6:a03:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Mon, 31 Aug
 2020 23:18:02 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 23:18:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: VR upgrade
Thread-Topic: VR upgrade
Thread-Index: AQHWf+z51HNHJ7tJS0yWNroPZEh3rA==
Date: Mon, 31 Aug 2020 23:18:02 +0000
Message-ID: <49DA29A0-B38E-440E-982C-98736C4C4657@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [73.223.116.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b01d294-cd09-4fe7-2c9a-08d84e041bdc
x-ms-traffictypediagnostic: BYAPR15MB2646:
x-microsoft-antispam-prvs: <BYAPR15MB2646AE97998011C8F32FEEE0DD510@BYAPR15MB2646.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0m/+iQXtiNfMG6cUZXodfKc1MivpucCFRa2Ck7Lml0nPtrjQmmNDD9KLMS255eMkS8XwWextTjBHxuJix7GSiKfURatpeyrlLTim3M92MstOQBkfR1iVUV2+ftKn7bxvhfwXwx0n6wOHdkRa+iiD9tispTzT/HSn5jYX9o+HT/NgbWXCBTuTU6hoj3fjen5pQuItg5eo+080sp2+aLgjT1JG+8pJIVTbgubNxbzwhHBmDLtq3n5EQnCKKkpTKCt+T288At2dTq/WvVbybISAfijKnRfTkb3gKBuSwxKqyWBa0sP1e5u+1CqKXw2nqAcu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39860400002)(396003)(136003)(76116006)(478600001)(3480700007)(5660300002)(2616005)(36756003)(6506007)(4744005)(316002)(2906002)(7116003)(71200400001)(66476007)(66446008)(186003)(66946007)(66556008)(64756008)(26005)(86362001)(6486002)(6916009)(83380400001)(6512007)(8936002)(8676002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HzmNO4St2efIZA/ccXvCOh8XcCRtQPvmdYXoxz9Zuu+RsCiZIvdhD25LY1dzp+/KCrF+d/ggC/jGBxbplmnA5M0t5k03yRxS1KKQeW5ZZf+nkOndh9//sNIoHwYbyy6jVhIuG4NECOSth39Oskh/GY9vq1tI1gnHyBQWj+xm2qTcAxYbo6Cd3Oooz2yue8rX07miAi5o/m6GnF/+9DryI7Xuy7f66cL4KCgCVzigi3D3bDfzWtpDU9w6Z7oKsWShGHqBDjxuDPTCqwLE8I4rsL7EfH1IfUgcR9+6PaN4WIm9o6KRvRhGgM8H6+LJ49rTipINEAm+D+2NvY1pbf5D5jET9C2Sz26MEUkHRgIRfnjwO5P1ezb+W91Ce/8V0JuOQ7ywCfaYD9IyQ21z+uynIJjlIPNEoHd9ZKQxUvrFmvV3RJC01vqH37nLOAxZquRTSXvmx80XK0pukWMk+GkjcIlNXSSf6zi6MvHfOZe9iLTNkEsG/b1oVPiotrxDG39mpIqNrenx1Hiz2OmliqABNl5AF3HrFTsTZh/36+YW1DRpuNsuSBjz/pbsLf+949EqIHI48QeIV+zge0hR+NJdMPmHTMUGvNKqwsIHfyTIEEc0VwLAwnfKrnNNJ1V8KmcjBANeDqtRVW10PUAe504cmg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_49DA29A0B38E440E982C98736C4C4657fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b01d294-cd09-4fe7-2c9a-08d84e041bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 23:18:02.6215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2L02dR6aKBsNZSrJMUnIRcIseP7SwfQ0OIIEvjAweiFnkeDXf5V5kyHgIuyNVRLyYnJ61yq5HhJDaXjwkf59DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2646
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_10:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 malwarescore=0 mlxlogscore=537 priorityscore=1501 impostorscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310138
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

--_000_49DA29A0B38E440E982C98736C4C4657fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgYW0gcGxhbm5pbmcgdG8gc3RhcnQgc3VwcG9ydCBmb3Igb3RoZXIgZGV2aWNlIGZp
cm13YXJlIHVwZ3JhZGUgaW4gcGhvc3Bob3Itc29mdHdhcmUtbWFuYWdlci4gIEl0IHdpbGwgYmUg
dW5kZXIg4oCcdHlwZT1vdGhlcuKAnSBpbiBtYW5pZmVzdCBmaWxlLiBUaGVyZSB3aWxsIGJlIGV4
dHJhdmVyc2lvbiBmaWVsZCB3aGljaCB3aWxsIGlkZW50aWZ5IGFjdHVhbCBkZXZpY2UuIEkgd2ls
bCBzZW5kIG1vcmUgZGV0YWlscyBvbiBteSBkZXNpZ24gY2hhbmdlcy4NCg0KSWYgSSByZW1lbWJl
ciBjb3JyZWN0bHkgdGhlcmUgd2FzIHNvbWVvbmUgbmFtZWQgTWlrZSB3aG8gd2FzIGRldmVsb3Bp
bmcgYmFja2VuZCBmb3IgVlJzIHVwZ3JhZGUsIHBsZWFzZSBzZW5kIGRldGFpbHMgb2YgeW91ciBp
bXBsZW1lbnRhdGlvbi4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_49DA29A0B38E440E982C98736C4C4657fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <67E12E682329CB46AB087706D8B1ACC4@namprd15.prod.outlook.com>
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
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWls
eToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZh
dWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJ
Zm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJ
e3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpk
aXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hl
YWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0K
PGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UZWFtLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGFtIHBsYW5u
aW5nIHRvIHN0YXJ0IHN1cHBvcnQgZm9yIG90aGVyIGRldmljZSBmaXJtd2FyZSB1cGdyYWRlIGlu
IHBob3NwaG9yLXNvZnR3YXJlLW1hbmFnZXIuJm5ic3A7IEl0IHdpbGwgYmUgdW5kZXIg4oCcdHlw
ZT1vdGhlcuKAnSBpbiBtYW5pZmVzdCBmaWxlLiBUaGVyZSB3aWxsIGJlIGV4dHJhdmVyc2lvbiBm
aWVsZCB3aGljaCB3aWxsIGlkZW50aWZ5IGFjdHVhbCBkZXZpY2UuDQogSSB3aWxsIHNlbmQgbW9y
ZSBkZXRhaWxzIG9uIG15IGRlc2lnbiBjaGFuZ2VzLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+SWYgSSByZW1lbWJlciBjb3JyZWN0bHkgdGhlcmUgd2FzIHNvbWVv
bmUgbmFtZWQgTWlrZSB3aG8gd2FzIGRldmVsb3BpbmcgYmFja2VuZCBmb3IgVlJzIHVwZ3JhZGUs
IHBsZWFzZSBzZW5kIGRldGFpbHMgb2YgeW91ciBpbXBsZW1lbnRhdGlvbi48bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_49DA29A0B38E440E982C98736C4C4657fbcom_--
