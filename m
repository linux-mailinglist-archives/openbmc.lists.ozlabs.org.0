Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F8B05E0
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 01:19:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46THsw6slLzDr5l
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 09:19:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4157066396=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UoTPFeqm"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="jOP8O49K"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46THsF0wvpzF3yX
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 09:18:48 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8BN4SDm005003
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 16:18:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=u80KHH/lhMVrC0BsTlGCDthqXjuaNQG3a/Ya/v595W8=;
 b=UoTPFeqmSSkIzrLy3bf9rpmwHnbfZYGZzPMXm4eZnFxia++TArLOQfrPnnAp4oKXKL6g
 U94qFkbLc2zAvmXFr4tmYDrBsf4IcRO1JW7CCrNAIZfwJ2tBYkFHlvaF9pOrQ81FfS4Y
 HL0xS23VeRW15ypTX6UibaXwp8tR0oD3zvg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2uxqew4ryf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 16:18:45 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 11 Sep 2019 16:18:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Sep 2019 16:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naKE9CLM0ShCp6lvNBr9LDbHEBuYbwXnmpjWhVui3wgEdjTMrqW/WTme9rrpErRzK0F4wxgxzmZwsLDYfFaxrn0PebpR9jNlaZOufz3am0GoSHOXPfKL28m1JDhwQIGXDue8d2nRwyrVuWUAyuKYEAyM2fNt2G4V6V96oZaIGv0/R3JunDfdwldKpFeVmXsoUg+L0oQjOOEuF9ApjgWLzKF0gERKLqGxOdUVEv5pSBI1GoFya6RUd8sN6RrVjls/O5QfHFYiEycql9qlrSRIfi/FUIgoUzcBeuZMFOPhY4BRwRCSkyB7VpH8I9rJroThMTloDekmFWKDxFvapwM9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u80KHH/lhMVrC0BsTlGCDthqXjuaNQG3a/Ya/v595W8=;
 b=UXXcD3PB72x8DYmlWtGKEIKp9UGxpWDx4ZJKXRVe4yaKDjTm2j1ao90EdgpVeMvOKi+jEpZ/KKm+WPBAJLQoZa8hMvwOwlAHqiBMA2wmB+PjYZHDtRPhsskpWNDSv/GbfhwgCxLTSJ+9wMdPYr7ehJyN/U6aN9X7jTK5njlmJOIRwF4JetD8K8ISnW4/8LszKYgly9+ecB9iGjlaxAqLAoIUMu/ujOgac5nt/21rwhYg0jtQsPu07B5LUmvigxVsdoTRda07fBuFljzrYuX6w/Bm4KFqcCp0S8byccn+l81Ysj/TwezSqTT+KE+GPXo3eHUZQZeQjxSUfpPX6JbOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u80KHH/lhMVrC0BsTlGCDthqXjuaNQG3a/Ya/v595W8=;
 b=jOP8O49KBDLyWBwA/Ealm5YojrcSFlJ/XtVlme6DX7u6ls9ft/arWntjVdUhXQg4ZPGq5OGt3u7ITJVyU+4wZHEMzGu4yXek9En1EQxEQRuWbqbyosG2lCqXOMoYGkMT+hlkH7pIc5oP3/aXNMWC5fVrXCnjQd+mAXc87P+fE3I=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1391.namprd15.prod.outlook.com (10.173.234.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 23:18:42 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::58a4:cdb7:e5d1:ce7b]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::58a4:cdb7:e5d1:ce7b%12]) with mapi id 15.20.2241.022; Wed, 11 Sep
 2019 23:18:42 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Port 80H Snoop
Thread-Topic: Port 80H Snoop
Thread-Index: AQHVaPdArVWxHMOe+UiKld4czdVbSA==
Date: Wed, 11 Sep 2019 23:18:42 +0000
Message-ID: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:c910]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6851b9bb-8a1d-415f-c8bf-08d7370e6319
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1391; 
x-ms-traffictypediagnostic: MWHPR15MB1391:
x-microsoft-antispam-prvs: <MWHPR15MB1391ABCF7981A1CFB575C4EEBDB10@MWHPR15MB1391.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(8676002)(2351001)(1730700003)(186003)(5660300002)(91956017)(86362001)(81166006)(305945005)(256004)(81156014)(46003)(76116006)(6512007)(6436002)(7736002)(5640700003)(2906002)(2501003)(6486002)(6916009)(53936002)(102836004)(6506007)(8936002)(14454004)(6116002)(558084003)(33656002)(478600001)(316002)(71190400001)(71200400001)(2616005)(99286004)(476003)(36756003)(66556008)(64756008)(66446008)(66476007)(25786009)(66946007)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1391;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UVgHP1sHGLNXYBE1AkVoB5g5XVhODUURLnn0hun+RR3T/sX9HjsTczIsxTuX5IVPlKg2Uu3UgZ7DL8gO19K1gVjjDM4yRe5i1GOeA8YOKuBX1OPBRHi802I7+QR19wW8jRDroCDiXJT/3vnuxg3f7vq8Iuwj45Y4t+47VbAudIRIswHcFe7rTaJ0LSdqSuX2p66u87oS22xdkhMJxhaulr9kI572QuTHxatP7xb06Oy4KMOkTRB4tAxYgXCTiqI10gmNTETlvlLYHW3rVE4Qs51eV2lhV3IXeucTD7Csn2NE6GN7FCMHKCWUiLQg4G3ALqNq8zl/38XeAFAoX5p/c95usZ9hnVvh/jry6e6e2D9G0y5iFfhWwFhI9Dof8C8iU1OLyDdGzlVCBxxd1pCqd5fP8KKNl5Uxfa4QprHM84M=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <341CB6D4F9FBEB4A8150423C65FF625F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6851b9bb-8a1d-415f-c8bf-08d7370e6319
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 23:18:42.5899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSfC+4CB1WrptTPyUGn43FKMQcGNZYdC/9TbnuKIrm6CqWy7Hsn1hXtqN1CcBuqc6KfzkPMsbk8aqN2NwgIhMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1391
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-11_11:2019-09-11,2019-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 mlxlogscore=592 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1909110205
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

Has anyone done a port 80h snoop history module? If so, pointers appreciate=
d. Also interested in constructive peanut gallery thoughts and consideratio=
ns...=
