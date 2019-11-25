Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A1109730
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 01:06:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MPMf0Hq7zDqHx
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 11:06:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=623285b47d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="MKVLq8kh"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="I6BMsY25"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MNjl5Y9lzDqP3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 10:37:14 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPNa4x1015296; Mon, 25 Nov 2019 15:37:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=NCm987YdgH1D/z5FcYZGB1NOfx3jmcQWjGEc6MafsxU=;
 b=MKVLq8khTiPwECoFoGEs7Xz1QxSmZmLfdwfZtFj//doiViYDIb9W0342pSroo/nN32oA
 3bsUB17tKgg44nSvBsGVAJLALkkKuUzPhOThBvEaBhw00Nc6TLX+NJ0s9QSNKo4oD1dH
 EipWzPz/P5lMIquVtyxLecquAy6VUXJyr/Q= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2wfnakgv4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Nov 2019 15:37:08 -0800
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Nov 2019 15:37:07 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 25 Nov 2019 15:37:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H87zvND0Qf8cYGwBqcM6GddXFvoGk6M2tkzvLxIjEVdpJQ0h8UdJRIuOTknumPBDrLTcuf0cZCHQ1HDCg0hmDWFAVh0kLOyGBvhJxnbG89Tu5rBJrCw9YaBJHbOkHm1AJ1LhyOp6eB2IS4RvwI5gyGQidLSTAFCg+o38l1X7Bf0ap5q9JCQwBhbQCkwA7LImBZDzBIEVLTKjZb6mG4TqiTSzt1N1AzRvtJzg8/qKveZoMcjjEdrv2X8lyiPr5+iauyVssiZTzG7AF6iPcQZiYZHnUSQG1Xrw0L97cYR3oG4BJ9cnI1r12I8DGaGGHZmIM3x7amjjgsvu48xzPrdKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCm987YdgH1D/z5FcYZGB1NOfx3jmcQWjGEc6MafsxU=;
 b=HbWe1gkNu1d0gkspHJBNx6SrInxLdK6dPvopHJnhmKVCExQvJZlxQqNFJnyVOxS6RRL5jFE930oqcMreg8+0BaF0n1sS89c8seFGrg+BAzTGOF3mM/kffFwZVR0tqknqYi5iyk24zqvqOo4Ybt3sUc00V/d3LIFz/Js5jbY9cI49U4nePSCliJJRVU+O0ht7dSXzXRmX2DjqXOkuFna9bySBFJ7WpKM5SUlEHHGx1F6Npa8y5b9WU3b6zGa3XlRyLoK2sb3NqiDGod2sjb03EVyiaqm6V4KLeV/DvmhA7ZeggWRBeQ+6PoOtenebhB0VqboBj//tgCov0W4qTBLNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCm987YdgH1D/z5FcYZGB1NOfx3jmcQWjGEc6MafsxU=;
 b=I6BMsY25nZ2BuUkSG+pcJ+bBagocdn7G5j1fAyOyol4YI8Z/AABnBFrADreXTu/CkfLVXDactZiLMOxHyZriTtETcGDeGLGMr/qOFETNektflnIuCv3GpnSTnkQ2Vd2CvFBTJG4rNrGqrfQtL3ygyKxEAAj1+XMi8GIb4bS9R8M=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1582.namprd15.prod.outlook.com (10.173.234.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Mon, 25 Nov 2019 23:37:06 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::2c43:c44b:2c95:e376%11]) with mapi id 15.20.2474.023; Mon, 25 Nov
 2019 23:37:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Re: i2c error for ME port
Thread-Topic: i2c error for ME port
Thread-Index: AQHVo8gV2NOlHgDr9k+GwqBCoAIdRaecSPkAgAALJ4D//6bxAIAAi1yA//9+Y4A=
Date: Mon, 25 Nov 2019 23:37:05 +0000
Message-ID: <78D819B8-5A29-444C-9048-2D2A0238BF11@fb.com>
References: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
 <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
 <69833bb8-89b6-2b06-818a-c8d16ce19ca5@linux.intel.com>
 <C4ECF587-E301-4FB7-AF5A-BB20F90F9083@fb.com>
 <960f28cb-3e53-14af-a2e7-63abeb0f9310@linux.intel.com>
In-Reply-To: <960f28cb-3e53-14af-a2e7-63abeb0f9310@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:182d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0191ba6a-d6b7-4888-1193-08d7720061c2
x-ms-traffictypediagnostic: MWHPR15MB1582:
x-microsoft-antispam-prvs: <MWHPR15MB1582FD9365F32205AA91985DDD4A0@MWHPR15MB1582.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(376002)(39860400002)(346002)(199004)(189003)(478600001)(256004)(4326008)(2501003)(66946007)(6436002)(71200400001)(71190400001)(186003)(11346002)(66556008)(36756003)(6506007)(316002)(66446008)(5660300002)(110136005)(46003)(14454004)(446003)(76176011)(102836004)(2616005)(64756008)(8676002)(33656002)(6116002)(2906002)(76116006)(66476007)(86362001)(99286004)(8936002)(81156014)(81166006)(229853002)(6246003)(6486002)(4744005)(25786009)(6512007)(305945005)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1582;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBcIXW89QMNCE6TRf00QydAHdkXmPm3C3qgruIvZOHbyur2VWbLLNzO3P4+vJ6QES7/i5t8NUj2Z2Fc1QJ1WJ0cduyaN3waBQ5WGD8FdhvjqHUXjlgLkXD4mCvMysWYJovXAJvOrFedDXIbpHJbQD8x7vRIzRgma8vNZVb8VNZvBGiX1HIEZjcDwEc0exPQ+DFckzx5ytrb9D/dQFXBPRODi0UxO68/Tc2tuygOmXfyF6KGcbJqpYpAopbVTpFZ+3Pq+jojD5x4qroNnStcfwcMqn6Pvz64T9PyC7CxCCRNcqfTQo+unrb9Ki68eT89dZSLkPcR3prwsDjlyoMFUV0sRUJVmdHAbfY7BrukHiZKI6rNDF08ulGUeSRq9tO/okDXrTVnq1Amzp4KtZeUaDg7lPs/OmsmXRYmszOid1dRJ6MNQBJ6X4sQDYAliJUib
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C761E8D716FD24DB852D30BD462DEC9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191ba6a-d6b7-4888-1193-08d7720061c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 23:37:05.9800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GD+GePFST3NWF2m4FyYQJCRXJDZAIZOGCDnI6IOQr8SAqIl3ntPZAZkFfsfiepxvok9CogmH9Ugbs25Vwa0YcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1582
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_06:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250185
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

DQoNCu+7v09uIDExLzI1LzE5LCAzOjIxIFBNLCAiSmFlIEh5dW4gWW9vIiA8amFlLmh5dW4ueW9v
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICA+ICZpMmM0IHsNCiAgICA+ICAgIHN0YXR1
cyA9ICJva2F5IjsNCiAgICA+ICAgIC8vIEJNQyBEZWJ1ZyBIZWFkZXINCiAgICA+ICAgIGlwbWIw
QDEwIHsNCiAgICA+ICAgICAgY29tcGF0aWJsZSA9ICJpcG1iLWRldiI7DQogICAgPiAgICAgIHJl
ZyA9IDwweDEwPjsNCiAgICA+ICAgICAgaTJjLXByb3RvY29sOw0KICAgID4gICAgfTsNCiAgICA+
IH07DQogICAgDQogICAgSWYgaXQncyBmb3IgQk1DLU1FIGNoYW5uZWwsIHlvdSBzaG91bGQgYWRk
ICdtdWx0aS1tYXN0ZXI7JyB0byBlbmFibGUgSC9XDQogICAgYXJiaXRyYXRpb24uIEFsc28sIHlv
dSBzaG91bGQgc2V0IHRoZSBzbGF2ZSBhZGRyZXNzIGxpa2UgYmVsb3cgYWZ0ZXINCiAgICBpbmNs
dWRpbmcgJyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pMmMvaTJjLmg+JyBpbiBkdHMgZmlsZS4NCiAg
ICANCiAgICByZWcgPSA8KDB4MTAgfCBJMkNfT1dOX1NMQVZFX0FERFJFU1MpPjsNCiAgICANCkkg
Y2hhbmdlZCB0byB0aGlzDQomaTJjNCB7DQogIHN0YXR1cyA9ICJva2F5IjsNCiAgbXVsdGktbWFz
dGVyOw0KICAvLyBCTUMgRGVidWcgSGVhZGVyDQogIGlwbWIwQDEwIHsNCiAgICBjb21wYXRpYmxl
ID0gImlwbWItZGV2IjsNCiAgICByZWcgPSA8MHg0MDAwMDAxMD47DQogICAgaTJjLXByb3RvY29s
Ow0KICB9Ow0KfTsNCkJ1dCBubyBpbXByb3ZlbWVudC4gSW4gZmFjdCBzb21ldGltZXMgSSBhbSB1
bmFibGUgdG8gY29tbXVuaWNhdGUgd2l0aCBNRSB2aWEgaTJjLg0KICAgIENoZWVycywNCiAgICAN
CiAgICBKYWUNCiAgICANCg0K
