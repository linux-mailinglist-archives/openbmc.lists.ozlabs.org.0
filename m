Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC1A767F
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 23:48:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NLDz0Vx4zDqmJ
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 07:48:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4149b83a3f=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UhJ1MNpa"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Uh3Fqvjg"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NL9K4dDTzDqn4
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 07:45:33 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83LhY4T001373; Tue, 3 Sep 2019 14:45:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=vLDjj/R/E/AJg5Q7ggiHFrGyEyElqujqIeyMJrR1iTk=;
 b=UhJ1MNpaWm7sDJclrX2spTJ9d8x0o5yT+SzRgrP45Orkdc+hBRAt9ko50Jrg/UzFRDAx
 ThkVgUzP0smRh93GCnSu7TIO3iY4ztT/EEGSuC2BSikAcTjg6w9s/hq7vvRs8RfZiJzJ
 qEREZH98MiU9cwW7qH3PKBBzu0UGTlsvGSw= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2usq7eaqdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 14:45:29 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 3 Sep 2019 14:45:29 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Sep 2019 14:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6LYzgxsa9+0RmIDC7NELRob2UZsCWWlE9xwr//adxWg5OyvhyWBAJf/gjtyr4K2ZtJ0A9UHpeixw3xVTkZqFmZTu0KDKbWS7E/6sMQARbGJJeRRu6hIwhU8NHyC7dE0CHjlos2bIPTR+SHkPrpziDofrhaEHre8ag8sSYsnBmx7mYHDTZCAKEc5YQPQ9ViWuKuRXSBBywZH0RgmPBkzNdYv9jwHH4oKjXWSXN9iIiT5CiTQ/n87JeCvMa1qvI7D0xVHvr+vN9Ho0gsVbSLfzAL3OmKKc5moJCPUXRAVk8aAph/XpYkNzHc0BrrZfQIaVOMqRGJdrBh2R2fztfDJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLDjj/R/E/AJg5Q7ggiHFrGyEyElqujqIeyMJrR1iTk=;
 b=dqHRp9U054HTQI+PU9aumCpAqywnCIrF/LyV/bz1xfPQGSJbmuKj/CqCzs6l6pCtF9z9DUiAKj7jY1HS7hoX7MPtiC9q+ly6EtuaJ0sadMqdIOKF3trhjaIiDtZMumQ2fcVjejUHdZ/fJkW3iUb+RzQ7L59axEA41N9HCY0Z31EWHdLMJvC9okhaGbS9iR3KUE1IF/N75oHDOHEzaHeMHPwf0NwpW8KJ/++qZjNBhcHSPABrNo7+caufWXC6OSyHgxbMf7GwdNvsEBp+lG5pAvpSMFy7ngClhlFlvJmRk5736JLVd992CNynDCM0Uzha/oOMb8+z6WnskYObrT8kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLDjj/R/E/AJg5Q7ggiHFrGyEyElqujqIeyMJrR1iTk=;
 b=Uh3Fqvjg8MS5nP8l5/pLt3DlANogaGOdDmiqFYFTaW84ctsPmGKDnHVzCI5F3G9+bbaZj6xrPp9iJnvBNtACjZxiAM0ud3s2vhHvmEUUhliBljpQdX/v3M0H68IE/FisJoTZ+Z+bEpAOQCrPKaObVUjkSFXZc7gxuaQ1TiRQIqA=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1680.namprd15.prod.outlook.com (10.175.141.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 21:45:28 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 21:45:28 +0000
From: Tao Ren <taoren@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Subject: AST2500 I2C Controller got stuck in SRXD state
Thread-Topic: AST2500 I2C Controller got stuck in SRXD state
Thread-Index: AQHVYqDmxoI65lUE002/x77mu+FSgw==
Date: Tue, 3 Sep 2019 21:45:28 +0000
Message-ID: <7af0671b-524c-02a7-fc6c-60360b06f0db@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR04CA0134.namprd04.prod.outlook.com (2603:10b6:104::12)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::9c56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5341bc11-8ab8-43d9-f3a7-08d730b80907
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1680; 
x-ms-traffictypediagnostic: MWHPR15MB1680:
x-microsoft-antispam-prvs: <MWHPR15MB1680BD7CFB626A3C95394602B2B90@MWHPR15MB1680.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(110136005)(386003)(6486002)(14454004)(478600001)(2906002)(5660300002)(476003)(58126008)(66476007)(53936002)(66946007)(186003)(8676002)(31686004)(86362001)(2616005)(66556008)(64756008)(66446008)(7736002)(31696002)(65956001)(71190400001)(71200400001)(4744005)(256004)(46003)(305945005)(8936002)(25786009)(316002)(102836004)(52116002)(65806001)(81156014)(6116002)(36756003)(6512007)(99286004)(6436002)(486006)(6506007)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1680;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +qoJ9miEhV00oqSfltpqmkc4KIkPqpPtjnAYjtP34KFXNMmPPOmFE0cLRCIikVJ08Pmtv6dyhbwxAGlcmWP5CHk8wcNhPyI4iUX3hZKDH2uIG2+oSIqXRImIaUwgyET17/qBFGVfzndHWPimBCnHoFsIXCMUzIk4fOZ97CMiTb5pKKJE6w8GC7h4UdQVYQVNRlY4yfhewnrHLR08EhcfIPPRUhWgyXNh3g/wdn6I4XACsumNnumeJHGpTk/D3C7SzP4HTiIb+8++7+Igg3kuqXNAD2Nw59A+eQ+u2sX+UKE6g8XViZvvin5GLkPa9UOkBtB6Pa8PiSDYIn14DKXTd/6da6oKL+wrMop0d0HYcT11qRrUESdK5v4jpFnp5vs4pDLH9YmRzDwATqIZBbv2yhUhuz+T1MWdqULTJ0wdDdY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <13F35A0E3056F44CA248728249FFBDAA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5341bc11-8ab8-43d9-f3a7-08d730b80907
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 21:45:28.1685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2L4r1TGrdOgdj5R83bkAvi2m7to0yZbedK22jBHFE24+qLvOiz3z+OW4JvEZXnTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1680
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-03_05:2019-09-03,2019-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 mlxlogscore=783 mlxscore=0 clxscore=1015 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909030215
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

SGksDQoNCkkgZm91bmQgdGhlIGlzc3VlIG9uIE1pbmlwYWNrIChBU1QyNTAwKSBCTUMgaTJjLTA6
IGl0J3MgbXVsdGktbWFzdGVyIGVudmlyb25tZW50IHdpdGggQk1DIGFuZCBCcmlkZ2VkLUlDLg0K
DQpUaGUgQk1DIEkyQyBjb250cm9sbGVyIGdvdCBzdHVjayBpbiBTTEFWRV9SWF9ET05FIHN0YXRl
IGJlY2F1c2UgU1RPUCBjb25kaXRpb24gaXMgbm90IGRldGVjdGVkIGR1cmluZyBvbmUgQklDLXRv
LUJNQyB0cmFuc2Zlci4NCkJlY2F1c2Ugb2YgdGhpcywgYWxsIHRoZSBzdWJzZXF1ZW50IEkyQyBt
YXN0ZXIgdHJhbnNhY3Rpb25zIHdvdWxkIGZhaWwgd2l0aCB0aW1lb3V0Lg0KSGVyZSBpcyBCTUMg
STJDIHN0YXRlIHJlcG9ydGVkIGluIEkyQ0QxNCBDb21tYW5kL1N0YXR1cyByZWdpc3RlcjoNCg0K
LSBJMkNEMTRbMjI6MTldID0gMDEwMGIgIC8qIHRyYW5zZmVyIHN0YXRlIG1hY2hpbmU6IFNMQVZF
X1JYX0RPTkUgKi8NCi0gSTJDRDE0WzE4XSA9IDEgLyogc2FtcGxlZCBTQ0wgbGluZTogaGlnaC9p
ZGxlICovDQotIEkyQ0QxNFsxN10gPSAxIC8qIHNhbXBsZWQgU0RBIGxpbmU6IGhpZ2gvaWRsZSAq
Lw0KLSBJMkNEMTRbMTZdID0gMCAvKiBidXMgaXMgaWRsZSAqLw0KDQpJJ20gc3VzcGVjdGluZyBp
dCdzIGNhdXNlZCBieSBzb21lIGZsYXdzIGluIEJJQyBmaXJtd2FyZSwgYnV0IGNhbiB3ZSBkbyBz
b21ldGhpbmcgaW4gQk1DIHNpZGUgdG8gcmVjb3ZlciB0aGUgYnVzPw0KRm9yIGV4YW1wbGU6DQoN
CjEpIEFzIEphZSBtZW50aW9uZWQgZWFybGllciwgZW5hYmxlIHNsYXZlIGluYWN0aXZlIHRpbWVv
dXQgaW50ZXJydXB0IGFuZCByZXNldCBidXMgd2hlbiB0aGUgaW50ZXJydXB0IGlzIGRlbGl2ZXJl
ZD8NCg0KMikgQ2hlY2sgSTJDRDE0WzIyOjE5XSBpbiBhc3BlZWRfaTJjX3JlY292ZXJfYnVzKCkg
ZnVuY3Rpb24gYW5kIHJlc2V0IGJ1cyBpZiBuZWVkZWQ/DQoNCg0KVGhhbmtzLA0KDQpUYW8NCg==
