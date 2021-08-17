Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490073EE47B
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 04:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpZvg0dZpz30DY
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 12:38:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=y2/NE5l6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.95;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=y2/NE5l6; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310095.outbound.protection.outlook.com [40.107.131.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpZv31Drzz2yQy;
 Tue, 17 Aug 2021 12:37:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcEsgstLELNM5x3RDOF50vI2ppsbRil0rRHdz3t+qqsLFMGD0FY1kftuxnVHX7V4vZrdpmvf7+FFl7e51f1MhE2++w+kivDGm1eqCRlc9B5znqFSyXWfP+W7kpeLe6tAna+VnNHdbR2tqQlYxs5BDG5X/9XbLgY0C5IvFImCmED+0/2gaFtLdETLdVWun5mZ/BNku2R76Jv0uFj+yA+5lGagxvscX8V9qc0/07/4FJhzOEk9oaEu3aloy+7WmVYGPRdKRtoXVr7okwfMMPfHmW1gglICcN3aS+Y48NzU3lCU+b3B/N59EnmCNRK/06toCiQmdsw8LL6bSD9BggN3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4CA9wvLSV6qAqV1a7KpXaVkYKzdYvpLIiiqP0P2ibA=;
 b=aZx0FZ5gYSphGuIPIbYfoGMQFfaKu4BiWH/fU2UE+r8fORpdKl1dF8pb2SMGMUIxrHuG84slT544hRnblaHDtxXKioV/goyCA1CUECivX3cOlm/pBv2dn2FwQm82PBIWZh9/YlaXh8TIyM4SgqmapTum3BCiUoVPKJUTJTbchchgI2yCsOpU0dgAdfOOBOU6Es7iBCO8KNvw2tVJUsIPRCk26wCXs39qOpclyQ7y6nOdEUlchN9l5mdeqo3cv26n81Mf5nl6n34KEbjZMAZdCwKKD/gpNa8sbqfjsLYnkrNTHZ5sKZKo1afijrS+/nGkWGfaVbsxzMs2+QXgyi08PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4CA9wvLSV6qAqV1a7KpXaVkYKzdYvpLIiiqP0P2ibA=;
 b=y2/NE5l638bA50QN3UBGW1HlygSHoZf/r9xQH4aypQDgrluAyzDHOrywN+djO6g0Z16Dfx8NiDxZo2d5CftXObo/7o9ya7UFkIY49BYe0q1vHXqy6QHeMlvSlzgqrzFoJLytI2x+sGczReSck1lka2o9F73/3YZN6awlvADAGglCFJn91R7K+3J8r5oakYh6iJftjgfUCAFr8Ebf3AyqnmjALfPFGiDIj2ne9joRN4kcHx28R4kkSeHU6KqWUPaRPE1kNWGsJh4FUVNbhjDLwBVJ4rLfuTI4RLy1/jTg24xuWeRmZJPRrh8JL3cxvFLU04sH1nZP2f4/NDqGHMFvww==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2609.apcprd06.prod.outlook.com (2603:1096:203:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 17 Aug
 2021 02:37:13 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3012:25b6:3003:f065]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3012:25b6:3003:f065%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 02:37:13 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, "kbuild@lists.01.org"
 <kbuild@lists.01.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "cyrilbur@gmail.com" <cyrilbur@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH 1/2] soc: aspeed: Add LPC mailbox support
Thread-Topic: [PATCH 1/2] soc: aspeed: Add LPC mailbox support
Thread-Index: AQHXkAbuYQV5hUkRrk6mm7VMl+/1kat15ZCAgAEbqYA=
Date: Tue, 17 Aug 2021 02:37:13 +0000
Message-ID: <HK0PR06MB3779008AC59C277899C95D1291FE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210813054758.13189-2-chiawei_wang@aspeedtech.com>
 <202108160813.GOZ1P4Y8-lkp@intel.com>
In-Reply-To: <202108160813.GOZ1P4Y8-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e0fd7d7-b289-450b-ea81-08d96127ebc6
x-ms-traffictypediagnostic: HK0PR06MB2609:
x-microsoft-antispam-prvs: <HK0PR06MB2609FAF34132513528EC725391FE9@HK0PR06MB2609.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M2dhejlGjLGlQuRVKOC+1sZxqR3aa8gNKyhWVM9lprESV/Y6sGJyB6A1vSIPiXiRrkn9jatSKj6uvf/BRck1hSQi0J1IDDitDk6a2HN0l/vd5JAnXV7218N6WAo/GPfC4pXVKKonJyiuSnnfWvhhbrayidinO7+965oiKTTAHm6trbBRYQ7TxkhHg/V4mz+LsX2ylDJG+xpq1ZkpPkGsyHNoAozjYAbVf6ult2VswVHkNOTkHLepat324epopZHzstQJI071ZTCP1yjtd6EuNaeUnSW8WRtpKOleg3kpS6qYrxJYELBxfip/Q2417WTEr1zFMxYRK50U2H8WBcj1dvteO+JvbLxv/6nzXSEBrotssza9dC9ALkxJZlFl0rLzbx25tfpZslyyfddFOU4jid9TfWnkjYrFCl9kZOjUfLjeSeqoE4gUpTxNBRGmkzDm37wC/IJWtuJK8yscZvDdmL2oHc9QJ/omvYgPtT6ACquLLmXxIFXeFdIftmLS7VgMYM4RgtsascvZnU0pqVfRjdoEdPPIFgsk5Y/VxzF/ZLQ3coaeibB1FkrmYBn/G/loELAtQeefb7Cm42L2uosb7oReSuPIPZpaS2sekZSOZt1ut5dPL9tER4o6ddqmD7IHwEeILxgtj/mTOPXYMkUvNGvSkl835D+RF8ScAWHMyKwfwuQ07pCcfJH0xADh3PzmFnAx8ShlVrtGQHA7+2OZZCF0XRt5JNgRnPwmnKJvxHCILZ9B7lNsZT4eFCyFwu+i7in2SVbWKXt6sBbkeIXCTLHkY8wWqWQyCzOAKvASTIMgWKU4iG10g4v6HGXw26Dd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(39840400004)(366004)(346002)(966005)(54906003)(110136005)(316002)(76116006)(15650500001)(7416002)(38100700002)(4326008)(122000001)(5660300002)(52536014)(478600001)(66476007)(38070700005)(66946007)(66556008)(64756008)(66446008)(8676002)(9686003)(921005)(8936002)(6506007)(71200400001)(83380400001)(86362001)(26005)(186003)(2906002)(33656002)(7696005)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Rvv1fx+rxSjSdeoV0RKEn0CvbXcis8B7l2HDxsgUgc9Z0IlSdcACoEM//xVb?=
 =?us-ascii?Q?2HUDn5Wj7m2wTn5y29aEnkb+iTGPQk/9x9WXKo2NQztBZuvau4JCczfx4+aP?=
 =?us-ascii?Q?CYmyOn5rD/RT657hMzo2tXXDLRf7rNZ824VRW9BXfmnbpyKmKrqpKpIUbtkE?=
 =?us-ascii?Q?X9Hk/jZfJzOTvxjFV8vTWdbRd47RpENu/CbgkYBrsBBPXSBzlgBPxFDE7C0R?=
 =?us-ascii?Q?5BDwU0bI4F+bqSuROh9PwFRBB9S/ttM168vn0qZG8uwTXN9gOJS7EGrbMh0k?=
 =?us-ascii?Q?XwSs0+/HMAQaFn93Xrxx7UIHNlzIYcxH3o5sENSJ4X41mVAijGhr5c1E8rMi?=
 =?us-ascii?Q?d7EBfSFQIy0edmT9wupt+IcyjCbRC8UDSDrC3pxZ0nr/+jX5g+3oG08ZlBf9?=
 =?us-ascii?Q?a+XnkozhPAJHfK2OCmNHbkUO6VpvVHpOvXLdIyZLwh3pT8FUn7zx6K7LzYn0?=
 =?us-ascii?Q?mixnB++YQMQRTuTEJSTNokqtKktCZja/iuo1mZNwPCHzn5eDlZGySW+0WrPI?=
 =?us-ascii?Q?6e7MDq9TsyuW/j7zoIaYxwI0DUgTscobcdIGUHScDLGdmvPf/OX5s7a01AY7?=
 =?us-ascii?Q?dlr6wV0dInk0hW72e3thc7G8UBPasolOC35CBvIv7XZtrompP983CajfWYAr?=
 =?us-ascii?Q?KVw5rQFriMQvOXw5qv6VfuORxZgVS3W3/kmJYnCbsWqFD5U7pPZMztlIpRKZ?=
 =?us-ascii?Q?EJjIm/pRay5KuHkUB8m4S/rVOLRZy/VAfsgBqE2uiiqKzzziEpHgytyChoIc?=
 =?us-ascii?Q?olVj99gnU2WqmJGBEM73dL0eXtCAw0FeTN3XmQGRFMhTybleWjQQ6dwAcf/E?=
 =?us-ascii?Q?lChHX1+vDbRDN3jhGTF0vO5E6GL6E95QDfZLKBLhKxIHjzorEQkL+1rBY4oM?=
 =?us-ascii?Q?TtD4UONgXOfZkiPt8h2/ZdKcKqrbMrn5zA+5+nBLhPFE/geXUtg1K9A+wp+S?=
 =?us-ascii?Q?UTPwkHZpoO6/IzkYVfczTj2xUaFzSEeSK+dzqQINvmcIc6lnrJoi6pPHkR/y?=
 =?us-ascii?Q?fcIJb5Q9LInQ++84epHn8ll2uM15yvXGyLpdQ1HmY+9V5HaIx8UN7xXo922u?=
 =?us-ascii?Q?R+Fj+F5gBlM8nvDUZrjrtLSCcIfQs1TNwRTXul6zH/ljUNBgz59WGc9Y0Y+t?=
 =?us-ascii?Q?rpkhNG11yFgj3pJhnXACgL3QlvrwoI3Nfc0AL+Y0QhbohvBXO04zry8oXT4g?=
 =?us-ascii?Q?NNOt5egc0NdmeATfhpK1DqU539cfHOFoo8nnckfeZDCXDOTzT7/8t4QlrMPB?=
 =?us-ascii?Q?P5+Kp0FX0J+7f+P5RbfXwpldVHq8cHz5ihVldLurNU2enyMwZicjlR4h9DzT?=
 =?us-ascii?Q?kNWyIeteEmBvT+bOplG1V52C?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0fd7d7-b289-450b-ea81-08d96127ebc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 02:37:13.5457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdfIDiJoMDRf3KTnNslhpIcpJKfmMILUK/xmLR/QeAqzsOroXwI5x9PmS0oCMfB4MNVycESbj7XhYQPQk/Oe4ojIZvtKTE1NaEbXT93XROE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2609
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "lkp@intel.com" <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, August 16, 2021 5:41 PM
>=20
> Hi Chia-Wei,
>=20
> url:
> https://github.com/0day-ci/linux/commits/Chia-Wei-Wang/aspeed-Add-LPC-m
> ailbox-support/20210813-134908
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> for-next
> config: openrisc-randconfig-m031-20210816 (attached as .config)
> compiler: or1k-linux-gcc (GCC) 11.2.0
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> smatch warnings:
> drivers/soc/aspeed/aspeed-lpc-mbox.c:230 aspeed_mbox_ioctl() warn: maybe
> return -EFAULT instead of the bytes remaining?
>=20
> vim +230 drivers/soc/aspeed/aspeed-lpc-mbox.c
>=20
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  214  static long
> aspeed_mbox_ioctl(struct file *file, unsigned int cmd,
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  215
> unsigned long param)
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  216  {
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  217  	struct aspeed_mbox
> *mbox =3D file_mbox(file);
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  218  	const struct
> aspeed_mbox_model *model =3D mbox->model;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  219  	struct
> aspeed_mbox_ioctl_data data;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  220  	long ret;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  221
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  222  	switch (cmd) {
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  223  	case
> ASPEED_MBOX_IOCTL_GET_SIZE:
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  224  		data.data =3D
> model->dr_num;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  225  		ret =3D
> copy_to_user((void __user *)param, &data, sizeof(data));
>=20
> This should be:
>=20
> 	if (copy_to_user((void __user *)param, &data, sizeof(data)))
> 		return -EFAULT;

Will be fixed in v2 patch. Thanks for the review.

Regards,
Chiawei

>=20
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  226  		break;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  227  	default:
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  228  		ret =3D -ENOTTY;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  229  	}
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13 @230  	return ret;
> 72c5a69dc779f5 Chia-Wei Wang 2021-08-13  231  }
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

