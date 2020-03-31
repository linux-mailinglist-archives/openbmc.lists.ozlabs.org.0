Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F77199EA2
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 21:05:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sJgP2SqdzDqvY
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 06:05:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HPQeckik; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=LojAShJ3; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sJfW3rQrzDqts
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 06:04:33 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 02VH48ua007231;
 Tue, 31 Mar 2020 10:04:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LwSyuAGMfITHkTsWudrczOZBEGLk8MOjt+5Lcy+nGV0=;
 b=HPQeckikyxZE3lMxvbrWJ51VCVt7Gq4VtgoPNC0YZIBYrkR6ILIEWu3+8fiw/VXgCOP4
 pbrzmfYy2oYd02HYdoS3rtuz4A11OOkILRh8KiR3TL/8URNl6z+/w3lv8HlfoARHjsTs
 pcAc8zyhjUIcCnO20iPedIN8+CAs0j4hrYw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 302dw7hrg2-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 10:04:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 10:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRZD2SO6vlJYcWh0w/2JF6zy9he6MUnJ6YRbavUXyhnNneU/Lj+DRS09fB+iQT8JNAO9DSrbenYOqBnrtRtqRg6sCEhAHVU5tLKu2PYSGVJGaOQMwGnfEatUBBupaxZxKEJ/bZdE/xJPYEdPBa5gg8SHTtvs/GBenW/HNAVgcE2kj/tbxgADzRUIeqzGah0ejMlmAciqNynmc7cXBIHI8liZ0MsbjCs4vPd+kpALt8DcPe57/dSyaong0nUgr6ATg8A66JnO3K8IMcRwZlJ6U9JkW0Dksy32a336RVdacmhzOycowYRB4PPkobWrturRniTAp7KujRKxiK0yKRgatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwSyuAGMfITHkTsWudrczOZBEGLk8MOjt+5Lcy+nGV0=;
 b=m4ifbxkcvdGS9pWRdPmjtEYudEy+1GGIepl9KCoovII/N8V2qEqzroc7er5hiTlHGE4utR+qgo6ZmMGvXAVzacnxLBkKY3VFrUc6MlBafozU/sThf5y3UCAhf6PReahYQzznejbMLOaHyFiAon6lHws/YL3OSGSL0GnWRfty3/dLV1salcsWuVuq1gRX8HATRT2GOp7h055SDpJAuJCdHtOT7AQ+8hCDbJP67MswGc8ME0yJf0rmegiEsTvaOSwSI65b4NwEwvQYPIjr6p9/PezpDLBt4Czvj7Nj2Ak44oMpwiTZdPNtMUVkDglqGxk+6V/bIHP51Vc90ChBRI6E/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwSyuAGMfITHkTsWudrczOZBEGLk8MOjt+5Lcy+nGV0=;
 b=LojAShJ31gjwg06WPPI5usfgdL8m8Q7S3E4S6bcDD4vpjFZ47qN0GeJp8gHZElxjOUdyo7gyjzh4aSz4g4v1D5lmrJZxkhHK9QtC5TeuI3gnerfVrXpoRq2RLbp+hZ3LDlbFvj046VbP/vIFO+M4NgzPzg31sssTSW6QIQI2PEg=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3964.namprd15.prod.outlook.com (2603:10b6:303:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 17:03:25 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 17:03:25 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>
Subject: Re: New repos request
Thread-Topic: New repos request
Thread-Index: AQHWA6o9emMK5/O3gUivoy5bU+uBE6hi3fkA//+h0AA=
Date: Tue, 31 Mar 2020 17:03:25 +0000
Message-ID: <723777DD-6CF7-4C46-B79D-BE2AAF66C693@fb.com>
References: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
 <56BA4944-EF73-40E7-9E16-35A327A2DC9B@fuzziesquirrel.com>
In-Reply-To: <56BA4944-EF73-40E7-9E16-35A327A2DC9B@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:51f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9713af10-469d-4be1-c430-08d7d5956d47
x-ms-traffictypediagnostic: MW3PR15MB3964:
x-microsoft-antispam-prvs: <MW3PR15MB3964E31589CCF822FF14E679DDC80@MW3PR15MB3964.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(498600001)(66556008)(66946007)(2616005)(66446008)(110136005)(76116006)(66476007)(64756008)(4326008)(186003)(4744005)(33656002)(5660300002)(71200400001)(81156014)(2906002)(6486002)(8676002)(36756003)(8936002)(86362001)(7116003)(3480700007)(6512007)(6506007)(81166006);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 93g+r4lJXE8qVCpxXsjpbEs71gC6T9C/KtZo20ZjfMU9LZHwDxGVLTNY0SVEdi9wocpjrSdLG0xkQEwwZfyVyBWuGtlMc9P20kJKySnZJJrOxXyOVCku48PTg1GHACSHUOsIbER1LIfsYcCyjkvg7TDpiXnvTyHDYHQWDSxbEYsuPD1VcdQRiew2ciJTS1yPTcS0eKf9xzBfWiKeu3yWMSFhpZkQwcIzwnakYgtkdtDp9xXdYi1hLFzbKX4a2BtvuImbQLWGsQKgucp5wMBlIImD6m8kQAM1GH7BwATZVJ7FK/j1blSNXZrewqBsfcPnhF/BTozbEHztEYaonvCxJRT2HNPhy3eWdwkgmjPwwTmfscV3tUeb6XsW+0z/9DsiFTgb/8Fx2WTQBarYoR+5NiRW17QFEJL9FrDDGkhgYUx9mVQFB21C6AtHfMoEH+E+
x-ms-exchange-antispam-messagedata: BHOg4SxTjoPGB+M41SL86sBfGkufazxgC15SMU4cQOcO06TaVaS1LdDExq/SfP1v4RSWuEalw/rsy593JTOH6ReKYoGwG6xNlkD+PNnprklO6rVh9fdQZIv9Ry5XhTFfoUQoYVfWajuZKTlkoEzZtvv+Pst1V0iuBjlOOubqAJPFJPWKj56wHfOIJxHn0P2V
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <36C37A165C5F9F40AA2ABFC63E78920C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9713af10-469d-4be1-c430-08d7d5956d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 17:03:25.4755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoHWdmHtMYLnYoYOMIj1C8WZjy5TganGgK1TE8lnLguMtoDyhn0IlGJoZN49VsDyogB6YHcquS/EW2Qylxl0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3964
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=876 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003310148
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmFzb24sDQpDYW4gd2UgZ2V0IHNvbWUgZGV0YWlscyBhYm91dCB0aGVzZSByZXBvcyBsaWtl
IGZlYXR1cmVzLCB1c2FnZS4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDMvMzEvMjAsIDg6
NDUgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCcmFkIEJpc2hvcCIgPG9wZW5ibWMtYm91bmNl
cyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YgYnJhZGxl
eWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCg0KICAgIGF0IDQ6MDUgUE0sIEJpbGxzLCBK
YXNvbiBNIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQogICAgDQogICAg
PiBIaSBCcmFkLA0KICAgID4NCiAgICA+IFdlJ3JlIGRvaW5nIHNvbWUgaG91c2VrZWVwaW5nIGFu
ZCBoYXZlIHNvbWUgY29kZSB2YXJpb3VzIHBsYWNlcyB0aGF0IHdlJ2QgIA0KICAgID4gbGlrZSB0
byBtb3ZlIGludG8gZ2l0aHViLmNvbS9vcGVuYm1jIHJlcG9zLg0KICAgID4NCiAgICA+IEknZCBs
aWtlIHRvIHJlcXVlc3QgdGhlIGZvbGxvd2luZyBmb3VyIG5ldyByZXBvcywgaWYgcG9zc2libGU6
DQogICAgPiBob3N0LWVycm9yLW1vbml0b3INCiAgICA+IGxpYnBlY2kNCiAgICA+IHBmci1tYW5h
Z2VyDQogICAgPiBzZXJ2aWNlLWNvbmZpZy1tYW5hZ2VyDQogICAgPg0KICAgID4gUGxlYXNlIGxl
dCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMuICBUaGFua3MhDQogICAgPiAtSmFz
b24NCiAgICANCiAgICBkb25lIQ0KICAgIA0KDQo=
