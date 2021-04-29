Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FFF36ED96
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 17:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWKcf3MMSz2yxx
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 01:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=Fu5jyneE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.94.52;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=mohaimen.alsamarai@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=Fu5jyneE; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWKcP2Hyjz2ysr
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 01:46:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtndsYtMA+7MylvgBe+cYY/wsp0v7S38QjdbNDBPIY9r7bT9/jm1rd0hDhjhRse0+I/3KLdxNe4U3YemF3kdC/cTCwGhF20cTw2IJ7pe6kF2/3PGuB3pD0nb9T8QKVCjfcvWRTVOG/MiDP0Ephk5w6kLHo3EaK/4PoT8ZK6zSvWUw6YPRuWBuTkRd1cO58U8oNqRnQfd/224fwCMkMa4SjvLy1l741GEunLgDMmo4ZionvlfiOObkr5fTcEIHrwJNOUX9AYFEI3hEznxrVCJn8ZCrkqJoOrtq+8Nue7mzG42QTUdwzdLeN+YrnZfWoMI6gwmLWrhJMgfraoq3W5B+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LTnR9gyjQV7Nb6yfU2NkCcj1Qr0JOGJyl7NUlhRRUQ=;
 b=RNygBgBfH3CRJ7fabFSHQHARquHrA6uhjZcxGSzn6pzfYbGwn/UL8G8RLKv+lS2leZVqaPlPMWb8Kppft6+x7BWPLNIfFaRPFGI+sNmzSkfq9DeuWbmLEXaGp2wXVEQMoEy/ebyTBl/hWA5CIy99Hxy+mRkbjtwXm1lzpoprN+DICn4FECrIKiJJxWDP6RgUpGBVCFmHhx9PUxvsOFKw8KBkSKe7CtRZo0prcvRCp4xpl8bcoteQCtpbcbc8iS9uD18TbvYlo+rtyb8flPQxZ8qnrDvd8xTv/ekWCTty850o5yfpXjigCfaWQ6w1YZHkUchuRH+OuPNvdqoRaQE9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LTnR9gyjQV7Nb6yfU2NkCcj1Qr0JOGJyl7NUlhRRUQ=;
 b=Fu5jyneEIKJ7Xlu7dFlr0MLO2FuiBNb+XZ3Eaxc9FaVC5TxTBbvxoFYdbw/jVwrnRYtt6Pscn73c1qKDyiIIRn/Gcm49vFO2HrjF1pmRRV0tENXgp381EQVBL3CK7da7bQv9J5hx18g8BQYSVfwx6k2FJ1m9ihaJQCn7GtaGtgi7s5Lthp2rhhfxdWT74hFW91v9b96FbvWXJp3s3Xo6Av+jLQ65tNrRzFBsstIZDu1iVuKDOtJX/r8HE49vYTY2PICyWXG7tRGHKKf9vEzLXbvRIewAaJCAnpmzbeFlROLz2VlPC6QIj+zMnuSl3+N+N3o+YNVJ08OmUWyBXLw2dw==
Received: from DM6PR08MB5883.namprd08.prod.outlook.com (2603:10b6:5:152::18)
 by DM5PR08MB2508.namprd08.prod.outlook.com (2603:10b6:3:c7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.30; Thu, 29 Apr 2021 15:46:35 +0000
Received: from DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::f427:75bb:e9b3:7919]) by DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::f427:75bb:e9b3:7919%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 15:46:35 +0000
From: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, Brandon Ong
 <Brandon.Ong@fii-na.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: x86-power-control for ARM CPU based system.
Thread-Topic: x86-power-control for ARM CPU based system.
Thread-Index: AdcfafjVQjBg4+FmRDGKM3TE63UAfQAvq/CABzlqc6A=
Date: Thu, 29 Apr 2021 15:46:35 +0000
Message-ID: <DM6PR08MB58830D49DACE954A4C7EDFCBB25F9@DM6PR08MB5883.namprd08.prod.outlook.com>
References: <SN6PR08MB43999FF4F59E2DB627EF52CBC3659@SN6PR08MB4399.namprd08.prod.outlook.com>
 <91538a6c-60be-b8fa-7b9a-021c98a06326@linux.intel.com>
In-Reply-To: <91538a6c-60be-b8fa-7b9a-021c98a06326@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=fii-na.com; 
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5af4f5c3-05d0-4298-5ac1-08d90b25f85c
x-ms-traffictypediagnostic: DM5PR08MB2508:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR08MB2508C87A786FBCB9FDA2F1E1B25F9@DM5PR08MB2508.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MoVL6Ya0T9bcJjoB3WtAVow4G1p2e93nRYV0eIeY7WzCw9XiISQ+ln7QGFiDj0rHMP5iofzOojKdzGw+MdgTcLCHlG40hnF0PRjjh3GU02oWA9WDMnPdRU1W3hLNY72Gh330MEb7dCBlBbvXOlyY4FCBOzPK3guxxV74H/7IySSAb5vGMMcz13mzd9Wwjm2+2lZdHPzHbUxD7+kAoaY72YbUvCRcTkahNnRgEDlyu3DTo0Jweu/Vk0qbW3GMatyCArWhSj6ZwvpMIGEcEZqBl8cYpCcFD5g1h7uxVYFxX3haZYYQOqfiCjZLY8fUR3wE1A3wvvYjWyL0rZmEkaHoud8dfA4WWuVG8j1/L+UgsrG+9iX0TmElL1t7RbkpBKaCCvo7TBsUnTZT/DRBFUH58TAeXllC+2hkUHpX383zk9y+vFNIFWIwFE9jVj0JkpwoAIQNd0+PhZHMiDl2UQUSNg5U4GS8zgjvCrm/+9wlegf/NlyC4aE2WlXtvO+hAQ0CN7ACAAp09teMz8VBcCC67N0KE36Z7f0WQBByFb6pkOdp7qCzMoavFLkwuVWl2a+uj4NuE/C9a5jQPkiTb0xmJLa4gmH0UZxdQ9ivk+yNKJypEbp7ZL+s64wPo1qAUIRwcELlMCVvjfBbsyj5cc0EK2q/6pKMmjw9p0dIni1iVZaA26xeju1E21ZtRHmLaFZJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB5883.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(376002)(136003)(396003)(478600001)(55016002)(86362001)(66946007)(64756008)(7696005)(66446008)(4326008)(66476007)(76116006)(38100700002)(66556008)(2906002)(8936002)(186003)(122000001)(71200400001)(8676002)(6506007)(83380400001)(9686003)(316002)(52536014)(26005)(33656002)(5660300002)(53546011)(107886003)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?oxpp99a8z6LjjJjTaw45KAyziTogaZZV7C5OYwNMAF2IKkTzxI3Mlpb6/1GW?=
 =?us-ascii?Q?PjHkbLayrvnmi3nU9MGmayLFXAEL+NVtAILYlERlHWKQqXHvjJFP6Dz1r+uv?=
 =?us-ascii?Q?CsYYqATHoey8tyNqQhCX77qDOMByq53/EKwYLyDpSzUfGwM8uVM1g3gwuyUn?=
 =?us-ascii?Q?QMJ7BVgDCB0m8auS8qtJ5+ya6S52W6c28tsqdUL3Y8x6fIMo0n5JMuVr6LUS?=
 =?us-ascii?Q?OJ22YX+5ZM5AGuFi8mDs7IAg6Du6uM3cvhqLYBG5o6p51fKkBz9i15F8LMbD?=
 =?us-ascii?Q?0ErU5GKBJMafzEzSY1jL4GeYYbOfTnGROHX/2NJcuJbzbhiA8cfL7rg06KWd?=
 =?us-ascii?Q?mwvQp93zJKpI5emSl0wcAHEZ/L27zuQWfZUQUDYZxSfj0FmX7N5Sa2hIK89j?=
 =?us-ascii?Q?qGsigX+WfcMxvnsv2FdhlLHIDN1z+AEyW7oBkokl1I87SShtZ3vIYFhWOPTF?=
 =?us-ascii?Q?FL+Zzm6M2ETmlPGyCrYxPcQdl8sg5u6pLZgBKiTCPmb0/VBHpG2yw8Y/8Rc/?=
 =?us-ascii?Q?Cg7PYOWffiQDjlnWnJvqNYBxFfmmYkA83BaUYkpnC5jCLyI3O+5ssrvgCPPB?=
 =?us-ascii?Q?X9buXbbd1ER8w9HH4ooNpu2OeUKmF7p2opVJMdp1zLNffS4+1NnY97uUwEyN?=
 =?us-ascii?Q?QF7VvCJO5QooT91oEjko6e0cmqOccHc7lIom32uhoXg9Icw9BpADOXyRp5ZW?=
 =?us-ascii?Q?A+bbqsSCJ9gQuqo/UzrlwNxb0fMnjSjyu7K/5G++ih8Seja8nmgfMcGqrz/U?=
 =?us-ascii?Q?hpgqlMu0NF9zYVeiS2m/YsO0evDhL288OVEsyIGXV7TUwxnhI4u2unAnAlUd?=
 =?us-ascii?Q?iU+t722QMKDH1QY2+hzkHrzC0Pqb2XY1Ho+uw8Df3ftoP8l2OmXAthnI/nCZ?=
 =?us-ascii?Q?3YXo2anMkJOwvhwbrJNNUc5nTQ/TTY8ERbnNHYQSWcwyGNDpPsa83M8G9K73?=
 =?us-ascii?Q?UM+D8Bkj/UL2cZxla8YkhQdvM9eGGIOWygnyyfuwEHPKDG0iMog7hJ62fK1d?=
 =?us-ascii?Q?bIbImc+TsEzrOeq2gK+wj2KR6qz+DjFd2uNPfl15Y6bo2S2W5vN8Mp6akpSw?=
 =?us-ascii?Q?vPd2LufSK0i1Z0fdBupT/KaTwgODzN1P76wxSZgIkqthb2i85hw5RUB2M1ZI?=
 =?us-ascii?Q?wu31ZDD0SE41OvSPBgIE3PQ0x8YhiSP0FiBhp/DHsamxGkcxNzR8j1zdEWud?=
 =?us-ascii?Q?MV+ECbnbEpDsJS20aT/T/k3aASki/aM2WNF+CRz22sVSrmGTx7+YQqGsN5TE?=
 =?us-ascii?Q?F3nzMfmXNt1Gpd7v8Ixr/zqguxjA4KFNAHQ5VfLHgpSuTb1pTZUtfvZjB7JJ?=
 =?us-ascii?Q?H3gqvH30BuOrs3IFrFWipjzN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5883.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af4f5c3-05d0-4298-5ac1-08d90b25f85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 15:46:35.5125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Uqj8V43TWvix7qZeJ3UVIm2cyhNHXCqXlmcSrh0Jki1FjCcGc6EIssuszzY/mwrE3GnQf0kS7FnklkpjCsDOYkMiSWNdurRgH7UQmNEDr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2508
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding openbmc mail list

-----Original Message-----
From: Bills, Jason M <jason.m.bills@linux.intel.com>=20
Sent: Tuesday, March 23, 2021 4:08 PM
To: Brandon Ong <Brandon.Ong@fii-na.com>
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>; Mohaimen Alsamarai <Mohaimen=
.Alsamarai@fii-na.com>
Subject: Re: x86-power-control for ARM CPU based system.

Hi Brandon,
On 3/22/2021 3:43 PM, Brandon Ong wrote:
> Hi Jason,
>=20
> I am currently working on the implementation of the x86-power-control=20
> for an ARM CPU based system.
>=20
>=20
> Is there a way to add a compile option to x86-power-control in order=20
> to change the behavior to support the ARM power control logic if it=20
> were to be integrated into x86-power-control?
x86-power-control was created to solve specific timing issues with our plat=
forms.  It wasn't designed to be a flexible solution for the community to u=
se.

phosphor-state-manager
(https://github.com/openbmc/phosphor-state-manager) is the OpenBMC communit=
y power state manager.  It is designed for flexibility in how different sys=
tems change power state.

Rather than add build modifications to x86-power-control for your needs, I'=
d recommend that you look at phosphor-state-manager which was designed to b=
e customizable for different systems.

Thanks,
-Jason

>=20
> Thanks,
> Brandon
>=20
