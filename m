Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EA8AC52
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 02:58:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466vV456yqzDqX1
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 10:58:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=312836eb16=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kzFk+LOA"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EU7t9kkD"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466vTN3PhbzDqN8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 10:57:55 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x7D0uRRo018065
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 17:57:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=mcEDniK0NHxCZI3+LLDBfyVvdvNfxHZckHdr/IkkTiI=;
 b=kzFk+LOATqUG6q7y5bxarub6Tm1g6D4progu7V2Gx2jPYYGUpw3Jojn/EvUEmpc63Lpi
 /DHOrY0PvQhK2KXVkXo1JdmLefBY0CHaGXXHXa9bWPEvrfHdnKVl+yUsBGCXGDE5uhSP
 vqnA/qMAF0OujP+/7wtes4heuLiZS+f26ig= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2ubjkf031k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 17:57:51 -0700
Received: from prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 12 Aug 2019 17:57:49 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 12 Aug 2019 17:57:49 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 12 Aug 2019 17:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ekq2OCHIMVHweKsDF2yWUAmDxMXONsisW1Pvu7yM/sDK9C+59CvaSbeJXpRUuj4ThdM8ZnyV2MzTFv+2XKTX2ShABdGCfbQLewPG+/GgX3RM8jXqxTKM1EkVi3Q5dbGteYMYT9BF4jhQ48Xy0rb7V5tp2PBLXiDg7mlZY032cr2JbnqATSDtwCTtvvWOVtuYptqwrXlGIAUBl1ESNodY522gO6TkNkssH9WPezk1CMm94hMM5FALc0kVItQAyOJ6v11EmxAY3U43RTQZoLBLYgL9ki3wvFOkBh2vMPEFmF+/llrLVPsMxDrZRKMZR7DRPt9/CuicuUir60i+42mzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcEDniK0NHxCZI3+LLDBfyVvdvNfxHZckHdr/IkkTiI=;
 b=LHmCCxn1VXGBFPyKdJWkMBofeHusm1iNcs8k0okjK3gkVPQyhh8jVqQpGsKokhLa9vo5waDMlTZTinVGBoQ1VBN2O31kvzLEnGseFeaFn1waeH4piukQQqQk1rO3jgGu6gtsKhuCVzai84VwDs8WPJNZtHD88ih7vU2FNetIoQk+pt/YRHEwv65GmNkLl+IrieGpdIIkoYjo3yJB/k76dwK+UMoY7cdXS1MeqmxqrJr0gjB9ddoOPc1w2vDuFkRyf49eAAST+PlkNkBI/F9iasyTlIIx4gEkdDoA5f3rXi9E/B9z09XPU75AEcHkLmTeIvu2AdojKTPmsyirK7BPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcEDniK0NHxCZI3+LLDBfyVvdvNfxHZckHdr/IkkTiI=;
 b=EU7t9kkDkYl2urA7JeaN6uD6noe+cFQxgNtAXfrp13CYko0HboxiTswD6yfjTbMBAEAG/FaRgqzghjN08FZAsQgZs2b6253/HwnbS5oM+2pf0/jIyTB97UI0Vmq/0oALHizWxkqTyPiH7AuDx1xx+vb4rDiT96NfhEeVsZuwJNc=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB3278.namprd15.prod.outlook.com (20.179.23.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 00:57:48 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 00:57:48 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Policy on Tools Posting
Thread-Topic: Policy on Tools Posting
Thread-Index: AQHVUXIgTlE2HlJMUEWTgBCXN5lVVw==
Date: Tue, 13 Aug 2019 00:57:48 +0000
Message-ID: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:458f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e66d808-65c9-4faf-9651-08d71f894296
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB3278; 
x-ms-traffictypediagnostic: MN2PR15MB3278:
x-microsoft-antispam-prvs: <MN2PR15MB3278CBFC804B928FA9B95CBFBDD20@MN2PR15MB3278.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(136003)(396003)(346002)(376002)(51874003)(199004)(189003)(305945005)(256004)(99286004)(2501003)(36756003)(486006)(81166006)(6486002)(1730700003)(81156014)(5640700003)(8676002)(8936002)(6916009)(86362001)(316002)(6436002)(7736002)(6506007)(2351001)(478600001)(2906002)(6512007)(14454004)(476003)(64756008)(2616005)(66476007)(25786009)(53936002)(102836004)(46003)(3480700005)(5660300002)(33656002)(4744005)(66946007)(66556008)(71190400001)(91956017)(6116002)(71200400001)(66446008)(76116006)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3278;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gzckJi8N1m7a198QGC4QXn/GLUth69LZi+8w1lKO9Iy+nbTfCqPwdhblFDP5x2sj/iOCU/p884gFxJ/9Bz742IbhYJLgxyLxD9Wv3HMzqd9Cly0p3It6JfvH4Is65nqbdXdPb/oougBlaJroGeDKU86CGsnbWKklNBJK2gtOOH7tvz6AeinbNOpz7suX0ziuQDBS2CWyNTeFsJcMHmHP51S4yG8G+qCJj66cnp61WClZMoF/zwOfVNlJyJdm2X49irHLpMADhfG7iPqzqFxozHTSLB5claFWoQYVSwijpHMOGXjIigiORWt3ojsAokpSHof2g0F0xzF9vs8BrnDkEFY98F01yJULSJjonAp4qIS2AmxsPmfyT6tRNXn2UEOXvZdc1vsIWwfb5ti1Dd0PIK7tvwFMl6m1JKbBeDn7OwY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1348588BF509F0409A1B77400B37AA4A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e66d808-65c9-4faf-9651-08d71f894296
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 00:57:48.3280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cwOQ4lQIctvb5QQKiADwa95uzv5Z1D9uLM7X9bkw6SrkrJiz+3tUGFb/2cr8va/zxebCH6lRG1QAXYExe5NW+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3278
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=772 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130007
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

DQoxLiBBcmUgdGhlcmUgZ3VpZGVsaW5lcy9wcm9jZWR1cmVzIHNwZWNpZmljIHRvIHN1Ym1pdHRp
bmcgY29tbWFuZCBsaW5lIHRvb2xzIGFuZCB1dGlsaXRpZXM/IEkgaGF2ZSBoZWFyZCB0aGF0IHRo
ZXJlIG1heSBiZSBhIHJlcG9zaXRvcnkgYW5kL29yIHBhdGggZGVkaWNhdGVkIHRvIENMSSB0b29s
cy4NCg0KMi4gVGhlIHNwZWNpZmljIHRvb2xzIEnigJltIGNvbmNlcm5lZCB3aXRoIGF0IHRoZSBt
b21lbnQgYXJlIGEgRC1CdXMgZW5hYmxlZCB2ZXJzaW9uIG9mIGZydWlkLXV0aWwsIGlwbWItdXRp
bCBhbmQgc2Vuc29yLXV0aWwgYXMgdGhleSBjdXJyZW50bHkgZXhpc3QgaW4gdGhlIGZhY2Vib29r
L29wZW5ibWMgcmVwb3NpdG9yeS4gTm90aGluZyB0byB3cml0ZSBob21lIGFib3V0LiBJ4oCZdmUg
cmVtb3ZlZCBhbnl0aGluZyBGYWNlYm9vay1zcGVjaWZpYy4NCg0KMy4gSSBwcmVzdW1lIHRoZSBj
b3JyZWN0IGNvdXJzZSBvZiBhY3Rpb24gaXMgdG8gc3VibWl0IEdlcnJpdCBwYXRjaGVzIGZvciBs
YXllcnMgdW5kZXIgbWV0YS1mYWNlYm9vayB1bmxlc3MgaW5zdHJ1Y3RlZCBvdGhlcndpc2UuDQoN
ClRoYW5rcyBpbiBhZHZhbmNlLA0KDQpXaWxmcmVk
