Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8664F15
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:09:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZdK3MMgzDqPb
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:09:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ni.com
 (client-ip=148.163.158.57; helo=mx0b-00010702.pphosted.com;
 envelope-from=prvs=8093ea9614=joseph.hershberger@ni.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ni.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com
 header.b="ZGgJLqYG"; dkim-atps=neutral
X-Greylist: delayed 99 seconds by postgrey-1.36 at bilbo;
 Wed, 10 Jul 2019 09:24:26 AEST
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jz1623xwzDqWS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 09:24:25 +1000 (AEST)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69NKtli012745
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 18:24:22 -0500
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2057.outbound.protection.outlook.com [104.47.48.57])
 by mx0b-00010702.pphosted.com with ESMTP id 2tjrm09gpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 18:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlxA87KdUAGR4L+S/0+jOVG1vWtpWZ3CeVTpFZwIKfc=;
 b=ZGgJLqYGisG5XEfVK3CNv7bT2mMz62os4uyuYi0h9+i0s+C3oq66to+UnBHNMimaD1k6FHmPI7gEcltGySVBC6ADkn3t2rld2KuBPRaLcwSuFJBA/6lkvRSmcBtdEYdNOwJD81JllEChRicW/ANV5WgHHbUPHyTrFq7+NCYAncA=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5SPR01MB02.namprd04.prod.outlook.com (10.167.108.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 23:24:19 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad%3]) with mapi id 15.20.2052.010; Tue, 9 Jul 2019
 23:24:19 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: Re: [U-Boot] [PATCH v2 2/4] phy: Include NC-SI in phy setup
Thread-Topic: [U-Boot] [PATCH v2 2/4] phy: Include NC-SI in phy setup
Thread-Index: AQHVNq1u8mSLvD3LtEGiFotZbci9aQ==
Date: Tue, 9 Jul 2019 23:24:19 +0000
Message-ID: <CANr=Z=bkJMrmtPrPcUYsJQGrBzPSUguj46DHsq3nvrnRrZ+D6A@mail.gmail.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-3-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-3-sam@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:610:5a::13) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAVYFW26YnHbDT82ubHhhEkcUC/s3VN9I9DwgkPARzsjP4ZyT4HQ
 gRKmEuB68Ct7RYTaa5XamtF+4Wn2hU1KFlp6CgQ=
x-google-smtp-source: APXvYqxZg7BBPafigH/3hDKwnkJHqmA1u69d0N6CspNnNb2MRy8hcrkTefKnKohMPPFbSUwvjGtcOc4NyPrlcnep9fE=
x-received: by 2002:a5d:948f:: with SMTP id v15mr26557139ioj.93.1562714658067; 
 Tue, 09 Jul 2019 16:24:18 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=bkJMrmtPrPcUYsJQGrBzPSUguj46DHsq3nvrnRrZ+D6A@mail.gmail.com>
x-originating-ip: [209.85.166.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c48f212f-28cb-4eee-a74b-08d704c49114
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5SPR01MB02; 
x-ms-traffictypediagnostic: DM5SPR01MB02:
x-microsoft-antispam-prvs: <DM5SPR01MB02626ACAEEAE5B1E550D03F6F10@DM5SPR01MB02.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(396003)(376002)(199004)(189003)(4744005)(2906002)(256004)(446003)(6862004)(14454004)(81156014)(476003)(81166006)(55446002)(99286004)(25786009)(26005)(95326003)(54906003)(305945005)(7736002)(71190400001)(66446008)(43066004)(316002)(5660300002)(52116002)(6246003)(76176011)(498394004)(68736007)(3846002)(6506007)(6486002)(186003)(486006)(71200400001)(66066001)(8676002)(66946007)(4326008)(6436002)(64756008)(66556008)(66476007)(386003)(8936002)(61726006)(53936002)(53546011)(229853002)(9686003)(61266001)(6512007)(102836004)(478600001)(11346002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5SPR01MB02;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 85R68NFOQgylMuIceYUybTwcIZyx6rLg5cV18rvnBobjbZYTZWd3HyykfXdHGGvOcWBbjXgWFVH0PJHx0prgT4HdScCbUCPNTjiJG/YNAYPqiXMemfn5Xb6fY6E8ysP/r2D7MUA/lrj5V3Ay2XtsqBakZJm0F2JqPabzaX4YPoHjXK5q7wEF9XvMGzqpi8nSFQHkMSWNpfwzJ7UyPS8cJTLFxSUBXoE32HSRjQsG3vWgGtPdubJu7N3SBk5OEsN9IO0lpn+Xr7CEsaLRuvOpvTR3J8NKsMTxe+rBAFN7+rmx9MAj2BZMJNsdsan5YME6VA1Yr2HmxWUfclWLrMED+DjtJySQsskON9YU07Ofx1X1xOKrRoRQ90z1TndTtYMIqMtWXk18QDKT5O92tqycbmHWtpxgYjnlCrcJdzXC9rE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3C4012D6C3CE64BA43F4335C9D682E0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48f212f-28cb-4eee-a74b-08d704c49114
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 23:24:19.2537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joseph.hershberger@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR01MB02
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=939 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090279
X-Mailman-Approved-At: Thu, 11 Jul 2019 09:08:06 +1000
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
Reply-To: joe.hershberger@ni.com
Cc: u-boot <u-boot@lists.denx.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Hershberger <joseph.hershberger@ni.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgODo0MiBQTSBTYW11ZWwgTWVuZG96YS1Kb25hcw0KPHNh
bUBtZW5kb3pham9uYXMuY29tPiB3cm90ZToNCj4NCj4gQWRkIE5DLVNJIHRvIHRoZSB1c3VhbCBw
aHkgaGFuZGxpbmcuIFRoaXMgbWFrZXMgdHdvIG5vdGFibGUgY2hhbmdlczoNCj4gLSBTb21ld2hh
dCBzaW1pbGFyIHRvIGEgZml4ZWQgcGh5LCBwaHlfY29ubmVjdCgpIHdpbGwgY3JlYXRlIGFuIE5D
LVNJDQo+IHBoeSBpZiBDT05GSUdfUEhZX05DU0kgaXMgZGVmaW5lZC4NCj4gLSBBbiBlYXJseSBy
ZXR1cm4gaXMgYWRkZWQgdG8gcGh5X3JlYWQoKSBhbmQgcGh5X3dyaXRlKCkgdG8gaGFuZGxlIGEN
Cj4gY2FzZSBsaWtlIHRoZSBOQy1TSSBwaHkgd2hpY2ggZG9lcyBub3QgZGVmaW5lIGEgYnVzLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgTWVuZG96YS1Kb25hcyA8c2FtQG1lbmRvemFqb25h
cy5jb20+DQoNCkFja2VkLWJ5OiBKb2UgSGVyc2hiZXJnZXIgPGpvZS5oZXJzaGJlcmdlckBuaS5j
b20+DQo=
