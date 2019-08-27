Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03A9DBA3
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 04:31:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HXtj4h6jzDqbs
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 12:31:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=31428435eb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="j0eUBWn0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="VSUdQO0K"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HXsy1QX8zDqbD
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 12:30:38 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7R2SjKD025600; Mon, 26 Aug 2019 19:30:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=UIH/Kkd0Mb1MoRK6Z99WsuQ378nlD/9AjmDPoqnXkQo=;
 b=j0eUBWn0pOvEkuiacT2Rf9mrQmo14QQ+7OgxkewXlFYwfujdawlA9Ps6bD2PNKNgZssk
 WqBjLcI65o7GCBr819HMg2LVHOGsBEP3WlqlDjh1JLAh7Ks+qtKpLRlGqG5lmi3nZGqa
 i3J4c/YN2r99ISErrLPxl2jjE71tNRkZxaY= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2umfdwk93p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 19:30:26 -0700
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 26 Aug 2019 19:30:25 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 26 Aug 2019 19:30:25 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 19:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRHdIo+8cTfhAtH96Dzj12+BFVzkW7yV4CyRf1hK1TBK5v2aYC3i2T8cwzGZjm6a550XvUaSyxskvLkjInS/te2d1Fgkbs2QS9YkDmAi6G+NA8FOO5ecG+NJOqa56WnB82N/P420cwpAeQ4/TzN9qGY+LQxXZLc8GPcOPFftbuBVrhucWfZN/tiSJIaMEhZ8dt/8Og2coXk5VMRNXoaN3FkZeZoeLB4k16JMHTW9AQK1MVw2dCdKv0a5QJ4StivetBEGw4NbLB/M63LgYQApijlHVv53q3bLzk2VekhsFhKbvYBAd4UInbfqBFbM//aPPWVRKruNSJkrsi6kb5U5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIH/Kkd0Mb1MoRK6Z99WsuQ378nlD/9AjmDPoqnXkQo=;
 b=cUFKsbYDUzCSVB/EyiHcrerMY9Ck4RJBTu0GI/vg2R+YzdbVXMfCoGIjZDpVTWcU4860cRCP3tXb4EqqeZAByNt8O09camXxoE12ERuapCb8y7g/sDTPiHBRappIv4wgE16txZAbhVtX1tI/kgUN5Rs/5SeIKm0KfPLGs21coUqxR9p56HoK8qPXWVKPX82NK7lhPyTMd5axbnni5UBIhmqJE/3bHOqyarYX7ViHxMZmD8RYpqbFVbBEr4mlehTmTkmDTlbfsk8uewtP612wDM+4z2KB6nOW/3SV8W2Djbsj4b1cJNzliBTGF42ScblxI3vQs4CCpJ94jkmgCoB3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIH/Kkd0Mb1MoRK6Z99WsuQ378nlD/9AjmDPoqnXkQo=;
 b=VSUdQO0KaqOI81j381ww2GmTn6BFsYOHr0GWUnDiwC271tQNrVzQTNRY6n7sW0sLSbb5tvL3tBFKivL+9yn5FiHevapDiOvNEuOy8lH/vO05P4qE4iXl5fguUzPWHjT/Ue6Qc/oSNPjJh4u9yT3YfZM6dOZI9Ke/LtXJwmUyo60=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1782.namprd15.prod.outlook.com (10.174.53.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 02:30:21 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 02:30:21 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Tanous, Ed" <ed.tanous@intel.com>
Subject: Re: Asynchronous Event Notification support.
Thread-Topic: Asynchronous Event Notification support.
Thread-Index: AQHVWzHyhQqUhJS920OM4V2Qhj6dAKcN0wEA
Date: Tue, 27 Aug 2019 02:30:21 +0000
Message-ID: <CF0228C6-5A25-452E-8849-7BCC778593FA@fb.com>
References: <ad95a67f-dbf9-450b-9cf4-38d9a595bf76@linux.vnet.ibm.com>
In-Reply-To: <ad95a67f-dbf9-450b-9cf4-38d9a595bf76@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [107.77.211.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47b84b64-8951-489a-5e41-08d72a96822f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1782; 
x-ms-traffictypediagnostic: CY4PR15MB1782:
x-microsoft-antispam-prvs: <CY4PR15MB1782079587793802ECB1F7C6DDA00@CY4PR15MB1782.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(39860400002)(396003)(53754006)(189003)(199004)(4744005)(316002)(11346002)(6246003)(76176011)(2616005)(6436002)(25786009)(5660300002)(446003)(36756003)(6506007)(99286004)(3480700005)(33656002)(486006)(71190400001)(6486002)(2906002)(6512007)(2501003)(53936002)(476003)(14444005)(256004)(66066001)(91956017)(186003)(66946007)(229853002)(478600001)(8676002)(81156014)(110136005)(81166006)(86362001)(76116006)(26005)(66446008)(64756008)(66556008)(66476007)(15650500001)(14454004)(3846002)(7736002)(305945005)(6116002)(8936002)(102836004)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1782;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tAKsCVhf7HEXw7CKiNcFjmrJYPobMqZKnO4CXgBQrHcoTXIo02ISDFOc6TYzyfzr3YNWAXJ3v9+Pi8EUqlyjpK1jTsHTWQVwAWKswQfJYdGEK/Q+6ajh5AKOSEq/H1FOb3WQ99MoSzieLlo1kwaJor5hkBuJGRXyAwSnrYG0ObdI+F2TEb+WLRC6BDuaXxwmYqgSftDQhGZiGfzr7WdCbcnxlG2fbRLBgx+3p5SmgsfIzt8WhCxornN+s8yIUxXRfPdviBUlXg0TIJf+UvrJtUg8O1N3BWri4ogDkdIXh0bZGbC9i16CIZTmX6gLKcjVjDW7gfzaCEJkTtmK8HmqIh83k9shvPzRcPz77Sf2+y8+Guw1Io5QsK6UTm5lUDzD6YLu2inefjk/eAkaYblimUpJo6JqWTA2d9oDAimB78w=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <57FECDFD66322643848CCDF48C6EA3D6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b84b64-8951-489a-5e41-08d72a96822f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 02:30:21.3198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQMbFkr7fXj91A/hbsu1H9/B0GyRbPOLZGynFoEIZS6rG5cbf1QveYJk5X2O2OpamiCunjshRxuWpHn038ZNGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1782
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-26_08:2019-08-26,2019-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908270025
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

DQoNCu+7v09uIDgvMjUvMTksIDM6NDMgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBSYXRhbiBH
dXB0YSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgcmF0YWd1cHRAbGludXgudm5ldC5pYm0uY29tPiB3cm90ZToNCg0KICAg
IEhpIEFsbCwNCiAgICANCiAgICBEb2VzIGFueW9uZSBoYXZlIHN1Z2dlc3Rpb25zIG9uIGVuYWJs
aW5nIEFzeW5jaHJvbnVzIEV2ZW50IG5vdGlmaWNhdGlvbiANCiAgICBzdXBwb3J0IGZvciBSZWRm
aXNoPyANCkFyZSB5b3UgbG9va2luZyBmb3IgcmVkZmlzaCBvbmx5PyBBcmUgd2UgZXZlbiBoYW5k
bGluZyBhbnkgc3VjaCBldmVudCBpbiBCTUMNCkxpa2Ugc2Vuc29yIHRocmVzaG9sZCBjcm9zc2lu
ZyBvciBhbnkgc3lzdGVtIGZhaWx1cmUgZXRjLg0KICAgIA0KICAgIFdlIGFyZSBkb2luZyBzb21l
IGV4cGxvcmF0aW9uIG9uIHRoaXMgYXJlYSBhbmQgd2FudGVkIHRvIGhlYXIgaWYgc29tZW9uZSAN
CiAgICBpcyBhbHJlYWR5IHdvcmtpbmcgb24gaXQuIFdpbGwgYmUgaGFwcHkgdG8gY29sbGFib3Jh
dGUuDQogICAgDQogICAgVGhhbmtzLA0KICAgIFJhdGFuDQogICAgDQogICAgDQogICAgDQogICAg
DQoNCg==
