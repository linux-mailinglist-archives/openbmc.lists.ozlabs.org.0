Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D0725DD
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:24:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tj0R0G1fzDq9F
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:24:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="b3ZaOV3l"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="V3Eeek80"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tS8z6kF2zDqLh
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 04:45:38 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NIh41n030477; Tue, 23 Jul 2019 11:44:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=uLuzJCsC6uBHI0zkTPJPjZFaBQloKIu5V6XChjDnsRA=;
 b=b3ZaOV3lK7UaAntvh6HipQBudIOG7x3btE8d+SQc+Qq8JsYZLc4jFftkE/XCTcj7hNn/
 kMRukbXLep5BrEEZgIbn+RjrAkplaMC9Mtf+FyL/hMQAwDHUBndMd28XAwJ2vcrX4dMr
 5dUOZ15A5uFj0tzfl5DP2Vs8YrTUAcAyh6s= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2tx61grgmu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 11:44:31 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 11:44:30 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 11:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuLlY+aJI9rXHgdFJOyvg1fNePdDDJ2IfevlNESquFMQaFu0IyPCjWeVkbs1JMI4Pp0y3zB2Xkt7N8k6zhnOmh1SPT8MdaPjlRb1hX9TKh9DEkiRR5JZtSNu3nyEuWydOz3KBKfubFfMD+onUnnYGK85IhFyc7k4fvakjxiVO4eim/r/0GlX2lB+oPtNi3hUXaw2UUbG2klBDb4XACkU1j/FcpWiBiHxHb97w+pUBarCLlZPOC2ZfKM6lBqiofb8hOakfd27Z9TzuwJGyoyt8bhOxfbJNyKs8rHcV4oiTEgw4HuE9VqOWw4cDns5lM2Fxnek4S1FczCIb1FNxd/60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLuzJCsC6uBHI0zkTPJPjZFaBQloKIu5V6XChjDnsRA=;
 b=AJUIZOPsC+E3rQN374Irl+GZNwydxtk8tzPe0FXSvVPiLLfWRhrrXvk3Snl2bM4MVZUI6lwsu/OBcotuQitCVMfseWTaICnrak0z37fu/lfeCADaOHzk4OaZRnFkRsQd907IxHRUtygqogNA7bdGY8zMV0wp9tDCBzNM0R5diusCf5Cl/I0P+faktExzTc5ufRZ1t8YXwxCvVaqnJJhI05am/JFkUpuIZOMk3tzfljWBuT6d9a/YNFxvT29ot8r0B5CjFKSr3i5qQT9B3XCv30iJ58uT/fC4LQHRiRkJRumNM7eJ4m4WunqUlGsbOWPQkqd5p9980Y/+7N2XSqJBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLuzJCsC6uBHI0zkTPJPjZFaBQloKIu5V6XChjDnsRA=;
 b=V3Eeek802PQdgFes3iPqEwXQW/1zjfJ82KemvxeKDWSN6lrwG5nQ4vxnhzzogycPBV0bpdGdWPxhqjXC5VnRqWz395aH4HiaqV3KyLqaHIXHX4iXzIPGmDqPxgnB8x3678idZFQEF7VNzLkW5g2uGjIwFp2mlJFY625rlJJ6Y1g=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1592.namprd15.prod.outlook.com (10.172.155.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 23 Jul 2019 18:44:29 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 18:44:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>, James Feist
 <james.feist@linux.intel.com>, "Tanous, Ed" <ed.tanous@intel.com>
Subject: Re: dbus-sensors + phosphor-hwmon
Thread-Topic: dbus-sensors + phosphor-hwmon
Thread-Index: AQHVQNy7FpVS6+5RikGfBXFaDQadpabYFj+A
Date: Tue, 23 Jul 2019 18:44:29 +0000
Message-ID: <F9CAF6C9-15F1-4AE4-A63F-4329EBB849E0@fb.com>
References: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
In-Reply-To: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:8724]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1f85971-37ce-4801-4eb5-08d70f9dcb9b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1592; 
x-ms-traffictypediagnostic: CY4PR15MB1592:
x-microsoft-antispam-prvs: <CY4PR15MB15925C3659CF8F66D2985218DDC70@CY4PR15MB1592.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(396003)(346002)(366004)(39860400002)(199004)(189003)(33656002)(305945005)(36756003)(7736002)(86362001)(256004)(4744005)(81156014)(6486002)(5660300002)(8676002)(91956017)(229853002)(81166006)(102836004)(6436002)(64756008)(66476007)(76176011)(8936002)(53936002)(2906002)(66946007)(66556008)(99286004)(186003)(66446008)(68736007)(76116006)(6506007)(71200400001)(71190400001)(486006)(2616005)(476003)(446003)(110136005)(54906003)(46003)(316002)(6116002)(14454004)(4326008)(25786009)(11346002)(478600001)(6246003)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1592;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SbKI8/jIgvUBfYIp0CwmN053auKSn4OMEP9Y2nl666SD704gCO0yf8tNAJ+QChaD/3irtim0Qj2BlQOXgzSepOJG9zyQNM5zkGhFJpNAzZxTCrM6Lm50LWNmmugGArjHXCAUlrV0EXQ09mZocU8uGy1+YVeXnsnfludtWtfluaf1NUZLKYRzZl2nowBnWPjRMZHFOFM5DlHj6ujd59gBcasilp4pbzfZN+58YObchvSokn3Sid8QPDCVlYx5OE4wZ9wmgoNUXx7xIMEyZ8gH7Oc1Wk5EHPSjh90Jj4u3feezvZAxfhgCksVfhMnxC3YBfARV5zk8f0t1I1Ca3H0XJtEY2A4VTas8aXu/HhBAtlndN8KZ9BKcablyv0BGzrv9dNrQayWLAAlsDEyswWZGE9EFy9/DZdNGaxd8XHOJE7I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D821B6B3359F01448E64AE02DEF7C1FA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f85971-37ce-4801-4eb5-08d70f9dcb9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 18:44:29.5630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1592
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=968 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230188
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvMjIvMTksIDM6MjggUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBQYXRyaWNr
IFZlbnR1cmUiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQoNCiAgICBJIGhh
dmVuJ3QgdGVzdGVkIHlldCwgYnV0IEkgaGF2ZSBhIGRldmljZS10cmVlIHdpdGggYSBsb3Qgb2Yg
fjQwDQogICAgaGFyZC1jb2RlZCBzZW5zb3JzIG9uIGl0LCBhbmQgdGhlbiB0aGUgb3RoZXIgc2Vu
c29ycyB3aWxsIGJlIGRldGVjdGVkDQogICAgd2l0aCBlbnRpdHktbWFuYWdlciAob25jZSB0aGF0
J3Mgc2V0IHVwKS4NCiAgICANCiAgICBJbiB0aGlzIGNhc2UsIHdpbGwgZW50aXR5LW1hbmFnZXIg
cG9wdWxhdGUgdGhlIGRidXMgY29uZmlndXJhdGlvbiB3aXRoDQogICAgdGhvc2UgaW4gdGhlIGRl
dmljZS10cmVlIGluaXRpYWxseSBtYWtpbmcgdGhlbSBhdmFpbGFibGUgdG8NCiAgICBkYnVzLXNl
bnNvcnM/IChvciB3aWxsIHdlIG9yIHNob3VsZCB3ZSwgYWxzbyBjb25maWd1cmUgcGhvc3Bob3It
aHdtb24NCiAgICBmb3IgdGhvc2Ugc2Vuc29ycz8pDQogICAgDQpJbiBteSB1bmRlcnN0YW5kaW5n
LCBlbnRpdHkgbWFuYWdlciB3aWxsIG5vdCBhZGQgYW55dGhpbmcgZnJvbSBkZXZpY2UgdHJlZSwN
CkFsbCBzZW5zb3JzIHNob3VsZCBiZSBpbiBqc29uIGZpbGUgd2hpY2ggd2lsbCBiZSBhZGRlZCB0
byBkYnVzIGJ5IGVudGl0eSBtYW5hZ2VyLg0KTGF0ZXIgb24gZWFjaCBzZW5zb3IgYXBwbGljYXRp
b24gZnJvbSBkYnVzLXNlbnNvcnMgd2lsbCBsb29rIGZvciAvc3lzL2NsYXNzL2h3bW9uIA0KYW5k
IHRyeSB0byBtYXAgd2l0aCBpdCBsaXN0ZWQgaW4ganNvbiBmaWxlIGJhc2Ugb24gaXRzIGNvbmZp
Z3VyYXRpb24NCg0KICAgIFBhdHJpY2sNCiAgICANCg0K
