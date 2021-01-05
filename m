Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CD2EA190
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 01:43:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8tyv1QVMzDqV3
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 11:43:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=INQXB3W4; 
 dkim-atps=neutral
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8ty11dsbzDqT1
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 11:42:46 +1100 (AEDT)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1050eQtS021511; Mon, 4 Jan 2021 16:42:43 -0800
Authentication-Results: ppops.net;
 dkim=pass header.s=selector1 header.d=keysight.com
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-003cac01.pphosted.com with ESMTP id 35u99a1t1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 16:42:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKnPp5/VB3tl7oHlj57l0dYOkPjE6RM0QiVX8/Aa8ErkpMj9TQ09uEWnxSEQnFJMzVqunlHrpmbGeDewnJNGnrVNoMshR0KQFKJvSBQ4bok9DHuv/22HiBS2Rkt13TXNTFAHQG8FzwyVzGoShfLTE8pdUbWWNDVOCDsMMEt1FoKAl6jUiipikXACQadmudXjkXZIBsPhXZGydOcGIawg4R6fYyTwyor15TVFwj1W6kR9KcK+nxuidL8ThnyziZS+9HpLA8axk96YOa9Tq1GAJIFEKjvNzKgyJ71WUPIxPkc6x0MLMHBshBPQyHrXgHByc17xMLFipBI2KiVO4jYAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqHJ85Ud5WdM22RaglB6gJiKPrTS/Z7MoCWwJaV3lsc=;
 b=MO7CZDSFNCfpOSpyxelyp5VKCHIKNrmxZZH//YycZBnVp64hpjsWFmh4ArgMeXLUGXD4seJ8JHgBD2u8oOL4CnGTcvA47ekgc5d7ggioKQf7EJcNFDGWnx318HsJyLmEiDuCwLsTlQagcLLEtLQW8Rv523g3FQ3595CmXVgG8PpmiVA3WZAToL5Dxy1rMCLkwSojUXc4K7TNkQneKcmjGU073Del1SS8lN1gdxg+1R3+oSNFyMSi522XyMOIINkbN5cMpVoBOGz+WdeVoyyPMzFiKSNk9bTlWFp+DmMVjcD7BFvny/HqxArPl+QSzNViQHK/RDZnairMQQzt1cg5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqHJ85Ud5WdM22RaglB6gJiKPrTS/Z7MoCWwJaV3lsc=;
 b=INQXB3W4sE8wxZ6Oo80d0zrLzSOJSMKyrar/pM8xUGSM2BnFaCyDKqco82SSRkkU2kaihh6aWEgbPa92kFtXuxpfuB9vF9LjIxl6Mdba1lXnXXDZUTjelE6b1UaPp/eT3wtF577EzHX+Hl1C1Q+dGC5q71u5XZOBFpMOtU/BP5s=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SA0PR17MB4442.namprd17.prod.outlook.com (2603:10b6:806:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Tue, 5 Jan
 2021 00:42:41 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 00:42:41 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: add a new yaml interface definition
Thread-Topic: add a new yaml interface definition
Thread-Index: Adbi09Kn+0NMxZAyTvq9aP/32+RboQAFDtmAAAFspyAAAGwDgAACo0Xg
Date: Tue, 5 Jan 2021 00:42:40 +0000
Message-ID: <SN6PR17MB255875944AB6F6884DE94FA296D10@SN6PR17MB2558.namprd17.prod.outlook.com>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OVFwJ9589BhkXb@heinlein>
 <SN6PR17MB2558F662101C2B4AE4A09F5096D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OhexuWrZFhy+v6@heinlein>
In-Reply-To: <X/OhexuWrZFhy+v6@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=keysight.com;
x-originating-ip: [64.157.241.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 770f5726-9d43-49eb-1c78-08d8b112cedf
x-ms-traffictypediagnostic: SA0PR17MB4442:
x-microsoft-antispam-prvs: <SA0PR17MB4442A10EE7C77B14A5B4EEE796D10@SA0PR17MB4442.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NOKsHxBn2LsdW8DHHwWIV6kxFxOuUY3uV1rOQhXKa9hjrb+MlECZEOACbsU+YyktebNqOXhESDYB3bk9E7dgixsJ885opTxq9jX8KJqqLwWQSfQ8op+BJokXgYO0y08yHkPOT9E6JseysW2u8EbJ/dhtX1s8OBSYcFwRjTfuOsskhAyLlauKT1+UjBu0bjMqEPvMgGRxnMPwRkBcvfZ69Ixumws/n1TEFXseIVGh7VXMCxiPie5p/EbdD9pM+Joll4NhWrkLEaitA9HdNHJ9mAMAtsCsBWLK/jEEt0ZoMmA0D/qy3yKLZorhKayGQr9pL8nvjZkKjdjyc4QucW00gjE116Fi1/4St3Tx0wst/ZhmlwhG4Y3Mdtl+0yko1a2yz7b5MR7SyMxWtbKZyyMcHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(76116006)(66476007)(66556008)(33656002)(55016002)(186003)(66946007)(7696005)(4326008)(8936002)(52536014)(26005)(2906002)(478600001)(5660300002)(6916009)(64756008)(66446008)(9686003)(71200400001)(6506007)(8676002)(44832011)(83380400001)(53546011)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Zyt7WZe/XdeLtNK/KDHRXR3ma9Elm1ejAL1nuIKCI1ulIu1t6jOeq74NcXd3?=
 =?us-ascii?Q?qhsFl4SlFPvhVTtbzKR8uVKNzjU5OVtVMLab8D/ny2f0KCH51KdSGYzY7Car?=
 =?us-ascii?Q?ac0ZhKfCE0crD9R7znWHihHAEWfKLkRV0sWkGAOMWOfUeGjXErlA1kmZ8DKq?=
 =?us-ascii?Q?VYUkvEzr2dVIZkmfR2XGDqn6HTi6kcAtddOqcnTjXJe6d5ffG1IZFiiRBWvw?=
 =?us-ascii?Q?l/KSUzLAVCNf7apxscu5z41XoebtoSNEqqrIUgt5MlYFfnUUQBpSaQbsExtN?=
 =?us-ascii?Q?0Jm2Qn4PLQFJ3e6tAXGZIf3jVO+z3FFytZk0w4BP9G66SfkXTqqL/JbEfLLr?=
 =?us-ascii?Q?hP4a44omVvYvU8uEnuM5ofmEN0+x6YvXBf7amxmOefx1vvd3P061HeMpUasF?=
 =?us-ascii?Q?3L8UKndONM49WdoHFbNw+sMoe+O9uIgyBWc5EtRF0sFPBWS7CIPvr7eWgV42?=
 =?us-ascii?Q?0zJ00EaItE6VdFOzoMx/Zgy0WVPs0tZXWJRcUbXE0L4M3dEAzo6OozWSLVIY?=
 =?us-ascii?Q?j+bHOhr+G4xc9IQgN1XSOxWWQVHeTwTOy+bfGzkjBI4emyu+JXL60PDj3RU7?=
 =?us-ascii?Q?3xMiZlYI+sx39AU2Pv7yR3+tfDKlQ9yCvxyd9otqWDS7pIox5GO+TCvBnFWc?=
 =?us-ascii?Q?CHZfUsXlSyTuFamVB1QOuSRe3TJRXicfey/zbVGxvY5biwRSXsiKzJvxWcX6?=
 =?us-ascii?Q?6K+IlzAO989FbpDhdtRwb4VQcVMGlthwM3k4S/3LYRJEF+eMocgxjsul6sZ/?=
 =?us-ascii?Q?o1cqe9Y/Xat8cGzCLuWE9CKPlBO/0NRscwsikgLp0cOutCjRdkvmEqR7G6/C?=
 =?us-ascii?Q?44vPLisIg7/mVf3TbcCmQQEdDCUxkUZBobJyZjwzxunWbIx9iVstWo5Tufze?=
 =?us-ascii?Q?dC24sUS/BN0i8M0Qzfbt3RnL7Cauxg4+K88zpkurzKD3+vE70DFPJw0OSkS4?=
 =?us-ascii?Q?vj68kSqBmh9NNm8tSUajQXPjgy3cgR/22u5Be8qjI3A=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770f5726-9d43-49eb-1c78-08d8b112cedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 00:42:40.9751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXll00R15tr1VjCNEPmMHOAgcZrl80VP3V6TQvJEB3PnznHa6naaluJKjKf5REJS2fNRQrLXsZxSr0VVERbriu17yR+RjNLH6SpnnTc9Seo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4442
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_16:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=651 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050000
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

Hello Patrick,=20

Thank you.  Updating the meson fixed the issue, and I see the cpp, and hpp =
files generated.=20

ixia@ubuntu:~/git/development/openbmc/build/fender/tmp/work/arm1176jzs-open=
bmc-linux-gnueabi/phosphor-dbus-interfaces/1.0+git999-r1/phosphor-dbus-inte=
rfaces-1.0+git999/gen/xyz/openbmc_project/Control/Alarm$ ls
client.hpp  server.cpp  server.hpp

I have two more follow-up questions on how I include this code in my server=
:=20
1.  Does the libsdbusplus.so contain the methods that I defined in the Alar=
m.interface.yaml file?  I thought it would.  But, I don't see build time st=
amp changed for it.  I thought, all I need to do is include the header file=
 in my server code, and link the server with libsdbusplus.so. =20

2.  I see that in the example/Calculator_server.cpp file, both the generate=
d cpp, and herder files are included.  While the corresponding server and h=
eader are not included in the x86_power_control.cpp server.  I see that in =
x86 server code, namespace is referred again.  Is that the reason why they =
are not included? =20

Please help.=20

Thank you
Mahesh

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Monday, January 4, 2021 5:15 PM
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: add a new yaml interface definition

[EXTERNAL]
