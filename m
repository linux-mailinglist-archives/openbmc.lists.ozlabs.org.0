Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F149D700
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 21:48:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HMy53XPFzDqmT
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 05:48:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=314158d10e=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lCt3mKnF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="JgGvpu+6"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HMxM1zy0zDqZ9
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 05:48:02 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7QJlsAC005668
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 12:47:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=5PAg4gK7tW8FYHKMDdcfVy/SdWVG6FMygCIJ9qOoFmk=;
 b=lCt3mKnFTOtf5NvOmVOFu6TqzgLNU5+ls/I2ltnki3F26uwDtrcLgytSgV8rInbo58aF
 BY1pVROllLrX8Ksim3kHF/8ibM9qlO/wnG+QMwFV0zb45dRz3PFxF56zaxzoiAs079TB
 XRhT41wRm5+bS1FIi8vql54+ztfT1C3udHk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2umhkp9b2g-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 12:47:57 -0700
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 26 Aug 2019 12:47:30 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 26 Aug 2019 12:47:29 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 12:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMuSz/Kv/+ItTEnAyymkAeKgtwVkjRj4UuIUn/9B60kU/quC7ytZKGQg57+v9hQDYgt5gEerBwJNu2uiKe9GWVLRYwyq3GKFvIiHE/kDbl1eztJDcXWS7ExjV9Mj9vBsYcxa4beRI33mct/1bTu3S/j6n7sZKjKjPeQF8Towu/A7x4Wb84dHDy6+hDOOAv6e1KvKbg9sH2XUyF9+qAfBT50Nva2OC34fgQ5YocJD5OLqj3YQeztgaCSlDBikPnivp+lOIAVb+RLCWZRzras7F3fqLWRwjOKu9KDOoiJClei3M6OtzkmTJKed5KlBnE2TNASG8YXQTlIbpR7B1xdEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PAg4gK7tW8FYHKMDdcfVy/SdWVG6FMygCIJ9qOoFmk=;
 b=JOIQS42YybGPcQtpFRcjhBlPipxUlTmTeJ+P8o0VCHDeIvLyDGxvCAUA+uTo5D+9Ut6EzRfMZa1pPaNx+tbgFpl2C3N/qhqjm6iLA74K6PnVxvv/f8NVXovyCG1vJHcexAAtHZaYG3A0UaszgqiN/T+LrkgfjtHAn7sbmBN//fOedmsPMQhXZaRMQl/r+B68oZ7FRCuMObmAUrpMUz+rYL0eJFfe462CNBBSAWvik2A2djkFYfLwyf2qGW9pAu5sCxhL32rPz3gdCoQvYJbaDW073y5RVJSFxt0tDzZXXbXSwaza09kuY5bsyJJRiJjXpVgC3EmQn001tPv/XEy6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PAg4gK7tW8FYHKMDdcfVy/SdWVG6FMygCIJ9qOoFmk=;
 b=JgGvpu+6cR/hian2nxkUaOJMABnHQyHhzLqDNJ3Xzk/eS307pl+v34h/CCAuymXBiLp2vSur4SzXRTCffHeG8T0aFNp4yp6pBB/mDXf2XkbYIggYVbH8/kxG/eyxTmLpK4JJGDcmQxPDW0S92ZvJRnCzrvRRmsuxVk/E9pR2oH0=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB2864.namprd15.prod.outlook.com (20.178.251.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 19:47:28 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2199.020; Mon, 26 Aug 2019
 19:47:28 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Virtual sensors
Thread-Topic: Virtual sensors
Thread-Index: AQHVXEcXIr2Ht1JqKk+TD/xHMHcuMw==
Date: Mon, 26 Aug 2019 19:47:28 +0000
Message-ID: <CB9FB78A-5D6B-42AD-98CF-DD2CC3B43958@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:e2e2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f585858-1e07-42ac-096c-08d72a5e39e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB2864; 
x-ms-traffictypediagnostic: MN2PR15MB2864:
x-microsoft-antispam-prvs: <MN2PR15MB28646D68393BB0771F42ED58BDA10@MN2PR15MB2864.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(4744005)(316002)(6916009)(2616005)(6436002)(25786009)(5660300002)(36756003)(486006)(33656002)(3480700005)(6486002)(99286004)(6506007)(71190400001)(86362001)(53936002)(2906002)(2501003)(6512007)(476003)(256004)(91956017)(66946007)(8676002)(1730700003)(81156014)(81166006)(221733001)(76116006)(66446008)(64756008)(66556008)(66476007)(5640700003)(71200400001)(7736002)(305945005)(6116002)(14454004)(7116003)(46003)(8936002)(102836004)(2351001)(478600001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB2864;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VLYsZjgasreIYwcagHHsK2IWdydqVHPD7OsJ021C8cysmtoq2ync5GmWM+4Tx0e6bGE6E52mhiAURJjeGmjlYtoI9aOfvCVm9y/1uhB9SPM1CmxD3336T6GFfThciCwKHFH1s8pwJ94CyKHTWxXfsRIHQ7NbW4lzKkIYTHiciLSzZ5bTFSr2vlsCFyWqgxg2+aYgYIwcFu4BM2z2nb1mNS97YFMQiCImmKGL9EgEEhfVPflc5IQFK2/RNqHQg0d++WL4bZDMVS/DOZoXeCrIF5+ncy3NZtWRYEX+6fFQGPqoHpGr1m2YXZedkoO5R77NjCzNzxjK0gCv2Xam4OlglCk7qY49co2kwi0Shns2smyvqRoO313yL2C5jIg582B2+RMJH5IJ0nyVu+YUiP168QAuXK8N77SVv1aWToGDsLg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB80860EA6880D4982FEAAA29F4B7C3B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f585858-1e07-42ac-096c-08d72a5e39e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:47:28.1517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PfNupwiCSS3aAE8nXotJU/MzjGOraxEQqnT9tnv4rOoYgBXCZ389lzYVEVjHlhIrFySH898cic8hA0ftYN4CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2864
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-26_08:2019-08-26,2019-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=360 mlxscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1908260187
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

SXMgdGhlcmUgY3VycmVudGx5IGEgdmlydHVhbCBzZW5zb3IgaW1wbGVtZW50YXRpb24/IElmIG5v
dCwgaXMgYW55b25lIHdvcmtpbmcgb24gb25lPw0KDQpWaXJ0dWFsIHNlbnNvcnMgYWxsb3cgeW91
IHRvIGRlZmluZSBhIHNlbnNvciBhcyBhbiBlcXVhdGlvbiBhdG9wIG90aGVyIHNlbnNvcnMsIHdp
dGggZWFjaCBkZXBlbmRlbnQgc2Vuc29yIHNwZWNpZnlpbmcgaXRzIHBvbGxpbmcgcmF0ZS4gRm9y
IGV4YW1wbGU6IFBlYWtEcml2ZUJheVRlbXBlcmF0dXJlID0gTWF4KERyaXZlQmF5VGVtcGVyYXR1
cmVbMeKApjQsMjBIel0pIHdvdWxkIHBvbGwgdGhlIHRlbXBlcmF0dXJlIG9mIHNlbnNvcnMgMS00
IGF0IDIwIEh6IGFuZCBwcm9tb3RlIHRoZSBtYXggdGVtcGVyYXR1cmUgc2Vlbi4NCg0KV2lsZnJl
ZCA=
