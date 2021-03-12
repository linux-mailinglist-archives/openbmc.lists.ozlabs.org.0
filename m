Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD26346CBD
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 23:25:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mCn4qGNz30Hb
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 09:25:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=mJs2uJZs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=47056628f0=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=mJs2uJZs; 
 dkim-atps=neutral
X-Greylist: delayed 9814 seconds by postgrey-1.36 at boromir;
 Fri, 12 Mar 2021 16:29:08 AEDT
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxZ9w43qJz3cL6
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 16:29:06 +1100 (AEDT)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C2iCKe004189
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 02:45:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0b-00268f01.pphosted.com with ESMTP id 3776facgqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 02:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMWBYDin4n2qaSammMisYPF/Jp1pbdfU8RRqRFrXhqYIl4Uq1H+Wng3s59OCOvpORZ/9kZeL/NrFrk2USZoKVWqbS0PJBvdJMRkd5QiszEKROqT7a3YMVPhwJRZoALVLG0hmdSiZUln586HHS4rTAjq00cHOIDy604oXVg1603e9rUigj8uAokMjO4JuIHbzUyFfP/YGb1/kfaWKXySH7ag0HEGhfs+i/lXmYEqzO1VAHKtggj+xhfFhADRRAHl5o9bV/R7Xo9+9eAvUwBVLsu9IHAXOiVuaNQ8g1gJJ5JXwGXNx0M9i8Uknvjmh/hHI/hm/lRQCTw9C9RBHV/9lHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9hLxqjOEt5z5ClEUTD5O5uzRZGccQcAOdPXPssP9mk=;
 b=J7tlRA00l9Z77FrigCy4vQ/W1CRRLFLafzMa8xZ7O02bt5bXlSW4lzuDs3bQJS4IBuxSXvX7653EOn1NhMDV/fFmnYMZ6YYbYPy8i1AJnu3pqH7IpP/eo9KM3lmJg+MmcY7kKM2qVo6H0eRv63udXFOy8DeVVTrq02aOYDXWPq3nfyJzp8HI6K5ZZcIlICY8zJBfc1jGazL4+7mrWz5z2HNpTXFARvx7dZ+WVhYo6tQBecFjVpmgo52F2WXfXYcyO7uyN5OTKopm/PhdPJ9UHm2kBX0U5QyPxFnFFTYz8vU8VZ9HxT2D2voiQEnDbxPOvDuX7rvpcZ00tMSOmZVHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9hLxqjOEt5z5ClEUTD5O5uzRZGccQcAOdPXPssP9mk=;
 b=mJs2uJZsEDXxLS+TwPJ3EGPf3FfEp+R0x+soPP61TRX2VsUWTmikVh8sf8aaFXLOuKj7zJJwcrppXYLaKcfz8oJPCzjSmwhV7I2/A2GDoQSwkfZM9jlI5v382jszJftl4tcriauU1+6YRad49cu4mcik3GckdoUEsTw6rzMKCt0=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB4969.namprd04.prod.outlook.com (2603:10b6:5:19::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.28; Fri, 12 Mar 2021 02:45:27 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::a8f3:715a:f561:3e91]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::a8f3:715a:f561:3e91%10]) with mapi id 15.20.3912.031; Fri, 12 Mar
 2021 02:45:27 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RFC: ASRockRack E3C246D4I port
Thread-Topic: RFC: ASRockRack E3C246D4I port
Thread-Index: AQHXFunC4ji2LlSDMUGuWbnhSszW5w==
Date: Fri, 12 Mar 2021 02:45:26 +0000
Message-ID: <YErVxrB4afOz1ejt@packtop>
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
x-ms-office365-filtering-correlation-id: a63d00c0-f7fd-47ad-6ffa-08d8e500e49f
x-ms-traffictypediagnostic: DM6PR04MB4969:
x-microsoft-antispam-prvs: <DM6PR04MB496997FC89685DEFB5495FE8C36F9@DM6PR04MB4969.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ee55aMoRWHx3pV2CzfwyQDekZJIKoylTBXfFiqUn3+Bs6v3urRolqFkGzF12oohRPbR83ndBe/myK3sJ5NRABgWDbrv3zfUxOKbZb0cxB8HPEv41r9v0EdiiVinwkixjmP0bQDBzeREhj+KKLZ3+ZUvnFRVx9kKJ1IaJjKSW1cVeB6u5FJS2yp1Wm0OhCt3euip6BfWaB9MFsDyyYFM33nGlhFlhd7S0XRW5U6VJtWJNTvWusIKT/fSnnkalTYPun+z2+ZozTs19BRqhvmlIHvnRzONIkPzOeEKvs42OUgEU+1yYb1GXzl11hc+6Rh9pbRIuQN95JxZuLcnuGyw9q+8awqrAZkN3aW7nBkSeA88gI7UkvbiY66axOQE/JiXpEyun6oNKN7Nly4Kz8l+weCGsilNIN6mtrHSnC1nnTYisvy8TQ0m2Pn71a3kNOPZyLWxd0ZmjSUjsjTw96UyyZuWlEYak27daph9eDBvx2XWSD8eeXChofPnWYGHbgfSgiKvxh3Q3hQEAlyI3+NjMAmpZUbGnCJO/lEs6sxwUIstQEqU+ltx4w++Fjs78VuLrHMO9k3jlkr1njFRZa992VyNNcP8dPffbuI+RzjQtK8U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(396003)(376002)(346002)(39860400002)(366004)(136003)(33716001)(91956017)(478600001)(66446008)(76116006)(316002)(186003)(66946007)(2906002)(26005)(8676002)(6506007)(66556008)(6916009)(8936002)(83380400001)(66476007)(64756008)(6486002)(7116003)(6512007)(71200400001)(9686003)(966005)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SIOku2+wFu3MU7qLZ6ES810yLghb6AIlcXm+BceDeeqhK+WZeAX4X8vwBNiy?=
 =?us-ascii?Q?3ulc8hfY8+KBPeDMMSD2vUCWDhgA6HJ4tfSCJ/BonfZC3BypRGrc+/mX3LOR?=
 =?us-ascii?Q?jJV585ze67rSJ3z99lN5RkpyfM/Gv1YWzpbYecE284PGmkNQbYIUxT1KwttD?=
 =?us-ascii?Q?j2wgKRnDnu2QAeU+PoWINvm71dDUd7MvsuDTru7cblCpPw1HHd2h27U/wml7?=
 =?us-ascii?Q?KYarhTuaW9dLAxm1O66G3FDPzuGEUEAl9JFrf25r+3y0KsWo6z99mp8p32gT?=
 =?us-ascii?Q?K/m+JQvxKytZ6oR5HpzhrHSijRSeoIyWfqFKyK4WB4dc52yJlfRE8O6LJwFm?=
 =?us-ascii?Q?IJ8xlMtEvlvj9CicIG8FLuPgCe8kvEfNl+DAD9zYuGoGxR7mLREJetZyoLK4?=
 =?us-ascii?Q?RmeCrAPgDvOrYis85zsTpATkpa57Mo5BIFXCDdPZk6ooJNUQfwB7G94eoxmf?=
 =?us-ascii?Q?bDhjtUx6ROwRnbJi3Oa8+Nk56M4NE6JQFkvGYAP5ChWaaDKJJ2h1GSdq8cqq?=
 =?us-ascii?Q?36iAe0mDM90tPXyoHQMixdOMUQxGOa2CggiOjNAc+AaYmlkLzv1FuaWUf29f?=
 =?us-ascii?Q?WZX4CVAYmkCrWsy6hXOjl1LAnjz6p+A8fw4b3XuJHpyDJHSqlNjAHYvqP3nZ?=
 =?us-ascii?Q?qtqRiXxIyxepgCPZVKLd3Uv36DhW6X55M+hR5Ytfx1pb9mTlDl9JaCvv1Abg?=
 =?us-ascii?Q?groz/8wRbq2xbz9ydzAFeB106YQE0zaaz1M0Gp/zgMunM1dYJiwnG3oqoWYg?=
 =?us-ascii?Q?o8eLQgFQ+vNQUUWS0jKNlDteM51njrUCc+ASNfw/xFLSDjolZhytzkyaojIH?=
 =?us-ascii?Q?mBCpjegtdLhZRG30oAqV5mYhqLOgKs7WDsWiyCsviYVtqFDu2UUJUXE6jJcu?=
 =?us-ascii?Q?NHp5ZWgBOwAf8nEGNiLnPU+NRxRs8WHNf7CCOjREfmy86zg7NxQRtJ0ABnT7?=
 =?us-ascii?Q?qUBirAfBb2XYgj2rjnhQZE9a6eW5IOvwrGxqFSmqubgB4EJZyDbGWIl0FzQ0?=
 =?us-ascii?Q?arPzE8IDFbTdWTqGtJZK8FVuHcVt3BLVAE5zHEv54F7evoVDis/fNRoRwGZp?=
 =?us-ascii?Q?ntmh2RkTzBAtiFZCCmcM4WlhazJLgJpRW5cCY1cGR2L1PdUR+fe4GdcghPHD?=
 =?us-ascii?Q?Y+JKAOdvoaOq8Qh0yUCXqLk2suaAR0g1pghuOXY4xUTx9usIrBLDO/BSa8Zg?=
 =?us-ascii?Q?hOJadvBF5oawd2MMeNExMyaqFsFtlo48wplhxRCwxUvixHB5Ml6OoPtA9Yio?=
 =?us-ascii?Q?svoeKtfXanFXKe0X9S/lkkHuhjwvCSynaDNMzi/iRRCEdAYZNoiRDNt7eGr1?=
 =?us-ascii?Q?308PnZ06S56EjyXGTlOFODnm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8359643680B2F41B4172F376E4B1FA2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63d00c0-f7fd-47ad-6ffa-08d8e500e49f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 02:45:26.9810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeAepp8Y+ayfV0U+sk/SZmbTLGYJGa2rb3znf0T2Js/nTfl6dfEs6lF6qGh0maAhE0/lcBQNxK60duIV6ZkKhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4969
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_12:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=854
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120017
X-Mailman-Approved-At: Wed, 24 Mar 2021 09:25:27 +1100
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
Zev Weiss
