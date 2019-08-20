Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C296AEC
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 22:54:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CjhP5h1mzDqdc
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 06:54:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=31355049cb=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PBCNtXQJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="e/wffSNj"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cjdn5xYgzDqZH
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 06:51:54 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KKnu2v028882
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:51:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=kpTkQjmb2CjVsI/mll+qJdWobwG6RKkVwMXgFJbpqHE=;
 b=PBCNtXQJK1w0KH4wZfpqlmgMi6XgR/PCcmGR5azkihySsGAWBe21Qq1Fj9TnLPj7PZKJ
 M3jjzWC51NAGTeu9gkp9FI4WxNA3nsUPur5wZxm/fJVap1aCmLqoovcgvkAaVDUsr6Kn
 e6xnGyEo2+t0gssNP5jKBDR51JBZ/rr3NEg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ugpj28ftc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:51:53 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 20 Aug 2019 13:51:52 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 13:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdfT+MS+qzMlUpdOnafrbDKqWdYGk+BLPF7TNbe5LdqrVOBBy38cOnZ9tLN+EYLJU9NMaKlRhJD5RX1kCpE28EzRvW7L1vsCPynYaWMmrYQY+LohwTgEmm63pq5ARSBdrLnhjZW/bfgd5vsEly3DBWW+Ty+v7nE303UvA9CVQKxXRVUVSERU4Or3qlvKqbnQpkev1WTs4OV/SF/5y08xI/P6hm9XtdXwjhjLuRsGpWLdSp9xYVr2fUOb9xKhtlJFfdPxSoJGnScc2k65wO3ZjLFWTL4hpb6vNjpRwqEfR5o5AmoAKzCKJL/etUuDLdNKax4Jn+b2GEHLDn03s//Vsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpTkQjmb2CjVsI/mll+qJdWobwG6RKkVwMXgFJbpqHE=;
 b=VgUQHRz0anyocDEdm6IppcqWT3kcIbdG1GLuxB+snyYnfWIqNEZGzN1GrwB5RQ4cvMJbs5McJg99fHwu+cstFbxKN2Af7YfWvdUUn5kK0Hzxd0IgNl1WH6ZsrfXiqrHiwFcvYGeTqfNu0RQXRVdtJvRlyQX+qszkhWYIE677/AVPo9bEp4VC+5DZ+EA4ELFYce6kFhRequaKtOCkYmmlziXffIQ4fTTwZf/0Wy0IVL1i5MqMEVsVsdSMsgZSi6oiwJbjn/t9TrHOca5HM2f+ESsS/7XgvjI6xVLDJGR7/MkXRQ9mAubcNOY0Vln7S8MKrwxswAU+jUw0njnuNWwU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpTkQjmb2CjVsI/mll+qJdWobwG6RKkVwMXgFJbpqHE=;
 b=e/wffSNjEC4vxFPBu+duIlm4tZIzT+XGUqhUSt/x5Lb4IG+K1YixuyVzG20SeX9uR8cEwy8U1D3MpOXgZHrg3DlCEb/u2Gka7Vk8wrq492ZgLZLoHqqz8a1IfcHO2OY1yp3QBiRTqAEvq1PsaoSbz68zmjCq/AsQBXpxhcF81LY=
Received: from DM6PR15MB3675.namprd15.prod.outlook.com (10.141.166.85) by
 DM6PR15MB2812.namprd15.prod.outlook.com (20.179.164.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 20 Aug 2019 20:51:51 +0000
Received: from DM6PR15MB3675.namprd15.prod.outlook.com
 ([fe80::8cd8:8e95:59e3:532e]) by DM6PR15MB3675.namprd15.prod.outlook.com
 ([fe80::8cd8:8e95:59e3:532e%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 20:51:51 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Host Crash Dump Handling
Thread-Topic: Host Crash Dump Handling
Thread-Index: AQHVV5kXofAvQx5o1kKV2jauyAnkfA==
Date: Tue, 20 Aug 2019 20:51:51 +0000
Message-ID: <FD330412-85F6-4994-BBFB-5C5F53446371@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:7f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e49182b-3881-470d-3e25-08d725b039fd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR15MB2812; 
x-ms-traffictypediagnostic: DM6PR15MB2812:
x-microsoft-antispam-prvs: <DM6PR15MB281222353ECFCC1D5B164CC9BDAB0@DM6PR15MB2812.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(99286004)(71200400001)(2351001)(33656002)(1730700003)(71190400001)(8676002)(478600001)(86362001)(81166006)(81156014)(102836004)(6916009)(476003)(3480700005)(6506007)(186003)(7736002)(256004)(53936002)(5640700003)(6486002)(8936002)(46003)(2616005)(14454004)(6436002)(486006)(6512007)(36756003)(305945005)(316002)(25786009)(66446008)(66476007)(6116002)(2906002)(91956017)(76116006)(66556008)(4744005)(66946007)(5660300002)(2501003)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR15MB2812;
 H:DM6PR15MB3675.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z7cbwnKUrhslnlj2+3gZEvLOZjB76CdnO1zhuomDKoZ2wL3t3Nfd7QdJu4hSlKrQBpRhf9aKltm+0xZauWqsP6raJyR+L9i3gCNV0086H0ZFa5yHpvq7ktjZcWyTg7ZWQJxQvMqnRBKNXPkJoIJiFVTlO9PgNp8C+n5vN6x5CfldSNw2FendGCiu6G3btXjwQW2IbfyWjkiXPwECbAM7mdl7VnF4w/b/4hkOClfd8a2urRVdGsvRKjzRK+ggrKP+olxs5CM0YawerjKNrHnejnGJD94Nl2qcxjZxxWl5J34Xxj6CXmI/YdX9kWeVciJXLzejPBs2eqADp+dI3MsfTWviVNEE+comxXJYXJXSC8O8DuBGUTEPDHiR19IFxArWnKfsh/dhZ1sQCY29gFVyRKuLVxpqvdn2/2qxng6V5lc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F69EF254715924BA388A13588862F23@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e49182b-3881-470d-3e25-08d725b039fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 20:51:51.3184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/Lu8mTIL4yayR7b0bcG3SEHYiIXQfa39MGjFOp2vjDF9Uu3MDposYY73AkqVrQWAp4me6732RNP7H8WlQWLcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2812
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=619 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200187
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

Has anyone published support for crash dump handling yet? By this I mean, w=
hen an NMI, CATERR or a verified threat to let the blue smoke out occurs, i=
s anyone currently using ME/PECI to grab the CPU state, PCI bus and bridge =
configuration, any relevant sensors and possibly a copy of system memory or=
 just the stack frames to be spirited away for later diagnosis?

Wilfred=
