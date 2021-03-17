Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960BE33FB75
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 23:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F14zW4LNFz3bmZ
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 09:47:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=mi4Kdj2B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=471059df55=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=mi4Kdj2B; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F14zG11l5z2ysm
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 09:47:04 +1100 (AEDT)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HMhZPm015377
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 22:47:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-00268f01.pphosted.com with ESMTP id 37bk0whn2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 22:47:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ8kORSNv6yj54pHPgSClJ2jsySfZ812S86CINzI4y2P3NyrFZRgLX9QS6mvPCu/C4CzklVAv74rn1/tucInj15tI1HQZXvHuW0ogQnvsSGn94mzL6ofAaeN5ry6jAo6A/7/CmjeuAV9EIe7NO+PsTILIAxBDHKBDIueBzKU6gfTlxXNtUuqFiYEy+EKsBjdahPzPMQJGGDJJtJrfQT6UVPDVZIVyDZIV4J8srtoh7G6c9kBLutKSxblWjJuUnMgTtwuWXMZqrLLz2+4N27A8JiPbyRLMvlgsA9Sd7G3db+J/oRjiMucP03B2z27t3ySoP1ZccjvB/Lbuv/5b2hYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/8S0cpnhM89loK9J3P5vagxtdBYazPteJIKMDBrLSI=;
 b=ObFUBhmV+3nfTd20EQHFhNeRopbH0KNJ3/Fm5hb6r+gt8xv9qK87ur/GcpfDU+vJi51h46/6OyDPD9xGHOc3AWugZI8YT5iXFG7DLfMsFLWKpmgK+SERNQgFuU2C0ubw47Q/csUx3A7ir2ty9w7ld9IcDoTsLHk8mSAJsYk3UwWU7P0rWsZW+rCK+IUPUb0Fzq+M9AeM75jIIyxAMkY6tR5loz6ZANiBHrebJnTp3MrhqV1LgTuy+VZCrEL3KpIGn9OIcyDcMn2gPp7wlmm4xwoNMakKkHxx+EMSRVunG0qCq48Xvr3VFCb6pCAnELbV30C8cz3c5rBCBbBlaRpuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/8S0cpnhM89loK9J3P5vagxtdBYazPteJIKMDBrLSI=;
 b=mi4Kdj2BM/j3C25enHivDtxSkpCm8nxuVorZn79GWHIcGEyF2FrKO1+iQh/hgX8Zu7e1PNiPVRF6mAq8gNJVIkmU+2vYZrT1DPbS/KCWAhN8mJlp7HElmygDH7F7sJVgTxb23licBnqO58d27hj7pDwd+K3QkdAImkJmS5h4jrg=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3932.namprd04.prod.outlook.com (2603:10b6:5:ae::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Wed, 17 Mar 2021 22:46:59 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 22:46:58 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RFC: ASRockRack E3C246D4I port
Thread-Topic: RFC: ASRockRack E3C246D4I port
Thread-Index: AQHXG39wiJDegY/1AE2e1zynsHBzog==
Date: Wed, 17 Mar 2021 22:46:58 +0000
Message-ID: <YFKG4aPg+n5MsrQ9@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0c57f499-1f64-46ea-ec75-08d8e99692ab
x-ms-traffictypediagnostic: DM6PR04MB3932:
x-microsoft-antispam-prvs: <DM6PR04MB3932DEB362F0FCFDFA95CE5BC36A9@DM6PR04MB3932.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cr7P4BRFRZjInZJWGVyYAAv0DTijU5SKys2AwI4ht+adNfAN+cT4qHR2lGDE6rTM5VL83tJxhZwqAReICXasobzlt7YZzrM3iauMJKZM5lyjno+MHoPJs86vNYVujme+z9VWcBW8MbvfbwNKNJAgplidqpneh+kBzLPoYue+G5zY6Q7hC8LRnojn+hjAWyU2sksix3eLguixvmvxka08YtYfspK+5bBbRPj/7tQ7QQys6jUwZ4jKQUKOC1a4/4P9OPvbn5mdWMq53R8ser2SkRvWedhRilpvaJcf9/yTvWoI21I8+ZDs1sFgyMhLkT3GS6z9ABn4lc8yubBXyy6xQcKFd4Wq9HOsV3yyG+MB26iOUXeDUcO5jcNCZxMqsyuS0SUBO7SfrOwFXGOdkqMKzVkquA+OU2i9Gm494TRjVdkWE5I+GzPOJ35OlD0C46zaHcd0mNamsgb3ZyXE3Yf6Gh8tOOO9mZ6OPL3mQo/Rp1svlU0TAs/iX4f+t9FPNrVz+zl08nv29w5s/dzJsveBHbrQ8tCSvqiZ8YGTwiM6TCet17xWFVDSow1BNk5EcmDQGoEh1vCKbzu0cY26lUIFii1EcmFLt0Hcg01PgBn0q3ulf/Sad5eqIBfKFbOElPlgC8J/pX0TbSGcAtOWpMKLnPiyGgaok8IVDCkxQ8tKHT6/o18DFQE7z/drzk7lCQtD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(346002)(39860400002)(396003)(376002)(366004)(186003)(86362001)(6512007)(8936002)(9686003)(7116003)(6916009)(66946007)(91956017)(76116006)(66446008)(5660300002)(66556008)(71200400001)(6506007)(66476007)(33716001)(26005)(83380400001)(316002)(2906002)(478600001)(8676002)(966005)(64756008)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?406ankKxpigEIQ56+rvchijIa5nSJTnndiqCauDjLCHEe9OGGkqv635Z/YGO?=
 =?us-ascii?Q?k5TEj0oLJX4ACURNCW6c8+Yilb6aZ4RIGH+oH7lSR3BP7xLi9hluHTv9rw7Z?=
 =?us-ascii?Q?Q7bLjfpoB3W2W6yFMJyHSG4d1l8zOsoFEv7BGjB+h+cuDpblxL/SdWiAY2Wk?=
 =?us-ascii?Q?2mXsuDz2+3jxRpiLeRRB6Qb4vEsbjDLtmDgbWltuLztxj+4d8TYlwO22i7yT?=
 =?us-ascii?Q?+rZdieXuBlslH/C2E1EXuykIf6RW/hFIcmatUfTjnjvQCGByvzRs0He4Id45?=
 =?us-ascii?Q?T/I2FaLjFEGznaV+tTnLZ4Gj6AyJM8S65jwaS8MW0DEt6qNAxdAgZAvSY3UA?=
 =?us-ascii?Q?QW5Zol0fPjO5jys4vxu74VbbmUQVEeFJmiCey9OdLPsKSOQBz+MiWuOfiMTu?=
 =?us-ascii?Q?XCCXMGVullDJ0TR6bkke54grnENEYxc3Dewd9zmlpMPgW4m5bd/x603DUVPV?=
 =?us-ascii?Q?mcdxn12canQxT1WDGzAFEJny1U3MEB4RbuQKvtfc0NTWNpxY9C03rvU+hlro?=
 =?us-ascii?Q?BFKyAgEdtgbFr/rUnLSoj3kSIkysx6dljuyTSZTQZY6RtN4HRTq2T45jth2S?=
 =?us-ascii?Q?rOw9gqXOrMsYFI7uXcftcyN+52e414A5udNJ2/KPJqXitF88nXev3IIxFUPE?=
 =?us-ascii?Q?Ovr9Noz3dSO50Epluvyl2A72+fyyEJLBJzRwAk8qw+Q3UG+7L12daTGk3Nmk?=
 =?us-ascii?Q?vZ/UsYMrl8qxosW43FcBemMc5o7xSzKyai2yE6iBkWRkK3znz+yjleliKMa0?=
 =?us-ascii?Q?1VZlL6WQGRETc7ltAvLy4zA7wHUvoATupkgJPOwJuhRWbLNYeYhwlU7Q5qEi?=
 =?us-ascii?Q?+TWi6v/0MvAVBm7/ofrh4vgE1vopRw9udpK5XrulBzi5CceNkh3homHMXB7a?=
 =?us-ascii?Q?vpmkOpWHXiq/o53OjLzk0UJYcxjyC2iDMD4xqfz1S8VQr7QcTypiInXEuZDs?=
 =?us-ascii?Q?73v1CwgOTGSroCbGAOz1acMFk5Uuq92FeJXy5hndKggdIq5/yiEpYz2YOGBb?=
 =?us-ascii?Q?TWOs9S1+e8tzcHJ4/GigImXXO33iRgANEmZvMR7+S/P4r5px4HSRCaxHStVN?=
 =?us-ascii?Q?pl81RiZhRVjBxreRKs7RLXUzpeR1h3Mp8yjvMaYKihoP+n3udhMe4EkebqLu?=
 =?us-ascii?Q?IT4j4u0WkPY/ZTSoTHrOA12oAwK4OjH4xEmRgpCMet37A1ZY/XK8L2vCWtX4?=
 =?us-ascii?Q?0zHrCEj1aBIDmQ/3bQaxfBm6Ycq5scSHmcCV+Ep3eI4MPO0FzsBc/vaTb+1A?=
 =?us-ascii?Q?4lCZ0UNgMLhjCRJhMzn6BUTrj5rqRVBFA1Ml72d6ryrfC33eErZhXdz47/AC?=
 =?us-ascii?Q?DCUrGgPwB+CcLK3nmAnVJXx0nEUwr+wwezjJdYElneVA+Q=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FF3B2C21AF88843BE97B3C407987E1C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c57f499-1f64-46ea-ec75-08d8e99692ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 22:46:58.6632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOOpX7yDxhtNXPXDRp208/4R1rywD1ag6JV00U7dqAOEZfFRn/zWElpOJpK3iZuDdRY/KL9GQaEwCiWSDAj1+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3932
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_13:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=905 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170160
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

[Re-sending, apologies if this ends up duplicated.]

Hello all,

We (Equinix Metal, formerly known as Packet) having been working on a
port of OpenBMC to the ASRockRack E3C246D4I board
(https://www.asrockrack.com/general/productdetail.asp?Model=3DE3C246D4I-2T,
an AST2500-equipped Xeon E-2100 mini-ITX board), and we're now looking to
get some feedback from the community and hopefully start the process of
getting it merged upstream.

It's currently sitting in a Github branch, since at the moment I'm
mostly seeking fairly broad guidance on what sorts of things will need
to happen to get it into a mergeable form (not sure if gerrit is the
right tool for that).  Anyone who'd like to can take a look at:
https://github.com/zevweiss/openbmc/tree/e3c246d4i

Known issues, in approximate descending order of significance (by my
estimate):

  - The kernel situation is...kind of messy.  This mostly stems from
    having a dependency on the PECI code, which is why the branch is
    based on the 2.9.0 tag (the last one before the PECI patchset was
    dropped from the openbmc kernel) instead of something more recent.
    We've got some additional PECI patches on top of that to work around
    some limitations in the PECI support on the particular CPU we're
    working with, some of which is fairly gross hardcoding for that
    specific SKU.  There are also a few non-PECI-related kernel patches
    that I've posted upstream but not yet incorporated the resulting=20
    review feedback on.

  - There are various hacks to get things like x86-power-control and
    host-error-monitor compiling and working reasonably, and I'm sort of
    skeptical that the approach I took there would be considered
    desirable.

  - The directory naming is currently meta-equinix/meta-e3c246d4i;
    starting out I was a bit unsure whether to name based on the
    maintainer/developer of the layer or the maker of the hardware and we
    ended up with the former, though I see Ed's in-progress x570d4u port
    has things under meta-asrock, so perhaps that should be renamed?

  - There are some relatively generic patches for dbus-sensors and
    entity-manager that should probably be merged independently.


If anyone can give it a look and let me know what the best way forward
would be for this we'd certainly appreciate it.


Thanks,
Zev Weiss=
