Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C476375F9
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 11:10:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHtzq5bQqz3dvP
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 21:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=+IRZzdol;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:7e8a::714; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=+IRZzdol;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20714.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHtz86kCCz3045
	for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 21:10:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2LDoKqjQ5zaRVrq/gKp10DAGqn9oKm9qmfYTLCWyrGvmgC6Q9+jk8n8ac+y/j077Z2kioJWrCmEEBC34f9u4vzpzY0xbU/v9s0TfgSDGqM9arz+SJ+V7Sj7mAn6Q7l+kfVHDR9vPUMEV0sJRtbnjlGjm3YHRMs79kFX7K49LeJHNyUa5yOqW0s0ulhIn/ioY57mxsnBQM9G/psFtRMpxSy6j4Js7QGRWfOoOPWUACQ7of3SwTwUDh5HICUGD8pLzcT2u4XMeiJLH6BH7DB+W6UheJqJW745wPiRqh3e4MMJfUV4TqFpycMDjdsGD+FrZLagC2UxTupehczKHwbC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuYR2ljAz657+wHyht+Z6MFIfVZX8m/wmnSFEwmrLcU=;
 b=Iw5+jPPV2qVEljoBhIl1LBar40tOoEF+URr/zUycwbCHqm2FHWx3UIcRC3mtl5nvXeertEnqCJRmaMfxkaUlm7Mmf0LPme+O5KSvzBqZGkqjZsF/C2a63rOoQtXS78vW1fuV9f9Fsm+Rc/BR4Z/OrvLnm+WMTOV52vOi8tWrVO2aTOQNvGifZl4c1Q5ZcunGlixtENhMjZaWBV2KB3hwsQX0ToeEuO+yziOz53xNibgNTIiLug1Sn4fXIgVeNJIfjve4CAkM6IzvzatGzsq7o2nLVIfhwLg2utjA0lASIGu/tJf5hLjBTmLF7V+b8XJKyfaPJ5NV+x5j4a2wN+YyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuYR2ljAz657+wHyht+Z6MFIfVZX8m/wmnSFEwmrLcU=;
 b=+IRZzdol0XsMsWdgWaSQYy+WdZ/Cq0HHuF8cJu0Myxs2R9yFDRIp74pJC64CvGjDI7Mu1cwe2Ie/RwLPKEzmTqoat4HuYhB4tL9tKoRAg+aEoGNCWaKY3qKv+nW93UmK1GFsV0zp+nDG6aNDcxSydBUsCPwREBRvN3WOVqogKHM=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 MW4PR01MB6162.prod.exchangelabs.com (2603:10b6:303:79::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.9; Thu, 24 Nov 2022 10:09:43 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec%7]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 10:09:43 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: Thang Nguyen OS <thang@os.amperecomputing.com>
Subject: Re: How to use phosphor-multi-gpio-monitor for GPIOs with both edge
 but different behaviors
Thread-Topic: How to use phosphor-multi-gpio-monitor for GPIOs with both edge
 but different behaviors
Thread-Index: AQHY6r+9wxiSIfgIVU6GBEEciYJhNq5OBD0A
Date: Thu, 24 Nov 2022 10:09:43 +0000
Message-ID: <DACA2057-CB42-4507-88CF-4312B8960493@amperemail.onmicrosoft.com>
References: <94bedfa0-06b6-b83f-bbfd-696e36f6b4eb@amperemail.onmicrosoft.com>
In-Reply-To: <94bedfa0-06b6-b83f-bbfd-696e36f6b4eb@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|MW4PR01MB6162:EE_
x-ms-office365-filtering-correlation-id: 014a34ae-5401-4225-692b-08dace040221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Uv/b9I9UgGZE4HTVZJyOgXqe/q2tO5gNxjV6BozkCYXu5951hVn1eQpYSQOJ2cAp70a4dN21/N08u3MlXP2Or3V0v0A+a1ZLWMa5f4EH9RdzIDfDbXKh/R5a+eTsh3Y+2IVS5vXZ8KyJQU/PP+lHwk37DbMjMVAAFxe63G2KN4hqUsyoMHjMnWzrquvgnlLgBA9lbmOahoojTE3kDc9KAG76aX2Y+vuuljmQ0gtI0M7Di49mLT/BaKM88JR8f4COWzzPomFzs5oVC2rH1mmYzXRgKOj1a5XXhbwahiHM6GFY3vZhw1MQZnuVlT2bVzQcGXmEhDw7hN9bz9acqS2CJ64N0XtS68hHL7XNhCcPBE5HTaGE4v76Mo9s9TRtv5mRLz8NdSl+LxxKWKvVrMgkAd/tn6E80JOWvxcK79S/LsmVyJXvSXFijgV7AqJmNANnZEuPUsdpDHlQJqKIrFPoK+ZzLDiCd6gLIKAvT8rteR5QcZjrJXz7gEKL+W2ZC17gL2j3EOkyh4aRAdW0dRtwlRnzz+ym79fNAFfjVPbeaNl/VgpXCXdzDq1hlBDqWfi/KQUbCCB/mrcFJGrYQVTW47i81YZaeUAadGvAY5ex8ZsZwICIDFeGPuZaXRgFQ/P9JswFWu7soP4s2t+PF5OHnVlA+bLBohql0KCbFJoiEsnhbJeYz4xXJf6Sh1WYv7z02Plgv+TppwmD9OYBzCya0w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39850400004)(376002)(396003)(346002)(451199015)(64756008)(122000001)(53546011)(83380400001)(66476007)(86362001)(6512007)(76116006)(38100700002)(316002)(66556008)(26005)(66446008)(2906002)(2616005)(186003)(6862004)(41300700001)(4326008)(5660300002)(91956017)(8936002)(71200400001)(33656002)(38070700005)(66946007)(8676002)(478600001)(6506007)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?95PR8SV9VfN1yiZh7KKVKd0BtkkyHTgOpNjZUSD2h6yvb8PZoOQD44ZAECwo?=
 =?us-ascii?Q?0XOJ/mpTfLbTEV+2yuX3FdeLZqbvUhkW0VpWksQW9BeCLhzBF7hFkCQeqcpR?=
 =?us-ascii?Q?Sv5KkOtSDdotXHmD/0hPakUvZPZy+U3y7dpshQrrIzfppeLiUBmB6eGugL1S?=
 =?us-ascii?Q?c7AU3436rGo9Dn6Uh0Tdw/vIB6uHY149mavLkcxxsPCDy9DLBU4H+hFPzBqm?=
 =?us-ascii?Q?zboIsrYIH2KFlbofXJaU7XUo5FUklktUetZYScKYfzvt178qBrwpW5TttjhC?=
 =?us-ascii?Q?JMxKPvHtNmMStdqmvywl8sB2fGaofCByFnBf/haLb750HBrggPZHn9j5ORNd?=
 =?us-ascii?Q?20WM1x3nmjX1yxgSSQl6mwlhJj59vilh1AGA23AIZpgh+SoQ7j/lc/ZZ0Ilj?=
 =?us-ascii?Q?/Vtz9X/54MsSl+xqbZLq69hMceBPMfmHSvJqGC6krij4umjhaneCtLRft3V/?=
 =?us-ascii?Q?kvWzX+x+MkFXkAJu16aGXIQXW1+s56+QiQDzuwFlVF8ifz3Te8Mv0rUHzj1v?=
 =?us-ascii?Q?b8ucBffKMTrz7DIRz3Ydu5fow2huGdxnla7VhqSG1Kf3i+2T001OO7Rz3EC9?=
 =?us-ascii?Q?J/bmcHJHn5gTCTOq8G15vfp6hbPCB1tny8RScgM5ko6pW106fiyOmnqefVMq?=
 =?us-ascii?Q?eaadnYqtq2G/VB7XlOjSz1RXdZLErDpNq+Q55JWD6ZyscS4nSsQPf/H95xqw?=
 =?us-ascii?Q?k4KgtdPxUTRmdyQeKMDOfwc6XVHcRVuHyLOT/5dN3KvYldtwV6xcvaG6ytY9?=
 =?us-ascii?Q?Gof7iTzwrdZ8ScSXrpR/hqhaiaqoGQsM+pucdsrcuKgT/dQMnaxPTklMQcly?=
 =?us-ascii?Q?WsG16OjNwhENgvgkvLBdN4gXxymF89m226PjWT/Y+rmcolB4+Hg0vUO40+q/?=
 =?us-ascii?Q?xDeFZymDHT2VMyWTN53h5I3FAiOxoR6lB61a6GL1IKH8dioRe6N42+8Yv/wV?=
 =?us-ascii?Q?JmoQCinbBYDGJmEJuR2vn5QvOxW+uaJeYF+V2nAakN9p4QXXhfXzwi6L0YkD?=
 =?us-ascii?Q?+fmqgsCpiASAJUnH2Aolizc9C6OPCP5aHyi4ti7X3FdvpC6A9rIjaFNd6wxD?=
 =?us-ascii?Q?PGK4IWLXdZHO/EBTwKLzgWDhOtziFI805B+HG2SkLU2RDbxSeIttYaByvz3/?=
 =?us-ascii?Q?dTQIK7coZBkwETUGtALziw8dAo9y/LiXhZTMQUYcZVj108sK0thz8pWpQeI+?=
 =?us-ascii?Q?BRdrXK5QCFI8Ew3NDg3XmEImhl996wAwtX4W5+W7JBZB11XQ1+SnhUMivrRk?=
 =?us-ascii?Q?TENV8GqH1MkA8rVcyOtCgoZtDngWdOThI6VvIXSkU0B/jAer3dL8XolrmbPS?=
 =?us-ascii?Q?G0vuJgihctTSBxRjbMDvBVLxwFUutV3TNQ6kpyo4QL1NuTJUMsWWnudVVUnu?=
 =?us-ascii?Q?2KmlnSY/r3kTfcqcCsz8HMixhefkyB0MO6x8EQ4/0fzRh6TiYuOfbSTwbD8r?=
 =?us-ascii?Q?daBnYvbVfQO5cs3VUrXzoxCWVi/u+IpUIGMJ4TKokfuvQXH+w9mhSHqzy7Wv?=
 =?us-ascii?Q?JUIbGr1NHCRhh8xUORptgFX5uVy6bDpJnMuyhFChmeW2z8CuP7OSiahUX3i8?=
 =?us-ascii?Q?dTGT7/ToVoo3/h0B6cBZHC+XCwRnirYXeECV4t79zISKDd7XfoeT5u1QtWQl?=
 =?us-ascii?Q?9I6E2NIcrUlGYTmeoKSBVkk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA0EE091C49B7C4197E94DAD6FB2097C@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014a34ae-5401-4225-692b-08dace040221
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 10:09:43.6799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXtzemxAblJubbOzWgTDuFuBY7fU1lExkcJoBefTChTDeL5IUKP4JB9r9mAQlMYgX4Rl8eUl98tbhoAqHil6GL/pl9/pUB8bHFBWh/pjPgyfUwHZ5BNN/sAcpyifo45O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6162
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

Hi,
Is there any comment on this issue?

Thanks,
Thang Q. Nguyen=20

> On 28 Oct 2022, at 18:23, Thang Nguyen OS <thang@os.amperecomputing.com> =
wrote:
>=20
> Hi,
>=20
> Do you know how to support GPIOs with both edges but different behaviors?=
 For example, I have a GPIO named OverTemp and I would like to support like=
 below:
>=20
> - OverTemp =3D 1: power OFF the Host to protect the hardware. And lock th=
e power control.
>=20
> - OverTemp =3D 0: unlock the power control.
>=20
> Although phosphor-multi-gpio-monitor support BOTH attribute, I have not f=
ound any way to check current value of GPIO to do the appropriate behavior.=
 I can't also specify 2 entries in phosphor-multi-gpio-monitor.json with RI=
SING and FALLING respectively as the first one will block the GPIO line. So=
, to support this behavior I can just specify the GPIO as gpio-keys in devi=
ce tree and use phosphor-gpio-monitor to support different edges, with is n=
ot expected.
>=20
> It is helpful if you have any idea to use phosphor-multi-gpio-monitor to =
support or any idea on changing phosphor-multi-gpio-monitor to support this=
.
>=20
>=20
> Thanks,
>=20
> Thang Q. Nguyen -
>=20
>=20

