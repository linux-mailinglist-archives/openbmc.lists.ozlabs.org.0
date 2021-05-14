Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD838021D
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 04:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhCc72dxdz2yyj
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 12:47:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=jnnOoOat;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.75; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=jnnOoOat; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300075.outbound.protection.outlook.com [40.107.130.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhCbr4RQ1z2yQy
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 12:47:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fllS0PcnoJ9HsKBX5s4eJIonJBusCjneVNTPYMBgztnROYPJILOW3ljBq4zoz3SPbWIY8n5GHeb0KhykiXctUa1c1fTRGVBP6rvr1LZCimiSVnVuEAWJ2RXnxEMf1HtrXHf7ti5NNFvB10PGdhRDPYRhwqc/VGnCi/BRZl/t4fGSU028IarYUdLmLrv7guWaFMzaiALtOX7/1L6HapGgP97LwW1zRSEUB6ldJgqopOmRR2yITlfFYBzqH7+F5Z3WsUl6rcJApk8UFeqXPgFqGyTz6+DuM4DJQYIHxkrav4iH7duyveJg9H/fRF9s7sRZ4edTR5U9e9YlQxjd/MqYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtl5yR9n/57p7nGruZ3r4kM8xbjBshSO2zUByXmHIIM=;
 b=KpVh3AAdLVtLwlpi58DIeDRyuSjvKIM5OBzRk6DB3OgrN2EzR01uHeFxWWLmONuFkPV6LGtnMWAPT6bVx57uKxgftgvWiv0aJ+05LSUXIJv8CS1puk2LuS7GRl13RZBLAaGdgqVA0Bp81ENjRfBleuAHZKIpmOD5iN6h3NnnSbkipB5Z6/zxUf6rBueSoRGpdoDqFsqcGIVdLBh7s8YI/hvJ+HLysnOGwSGJ83hg5cbenlfjyt98wcPKJu7VOMQ0igTFJ6+TpGKx8+hopWVrBb+o1lFNvIi+uglLS4QReFHuoEwa3EGKirIzs3IJKhe9orfaBxDFJRif+IgsdVuakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtl5yR9n/57p7nGruZ3r4kM8xbjBshSO2zUByXmHIIM=;
 b=jnnOoOatQr9LM3zng1iSER3CcZKkteTQsJU89KQJigKnWJKflF+2bzkaN0bUey1gqxvkeksgHnbHHwnxp47aOhwMoFw6hpusUf+QiDIugSSLhf2bDu4pV77Y5B1ftUKeIKw0LQNB3uMOOcEH4t7Sxa2S3XR3PACMXEA67/62wss=
Received: from HK2PR03MB4371.apcprd03.prod.outlook.com (2603:1096:202:1d::20)
 by HK2PR03MB4577.apcprd03.prod.outlook.com (2603:1096:202:24::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.23; Fri, 14 May
 2021 02:46:53 +0000
Received: from HK2PR03MB4371.apcprd03.prod.outlook.com
 ([fe80::288b:4348:c4ae:7ea9]) by HK2PR03MB4371.apcprd03.prod.outlook.com
 ([fe80::288b:4348:c4ae:7ea9%7]) with mapi id 15.20.4150.012; Fri, 14 May 2021
 02:46:53 +0000
From: CS20 KWLiu <KWLIU@nuvoton.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [PATCH linux dev-5.10 v3 09/18] ipmi: kcs_bmc: Allow clients to
 control KCS IRQ state
Thread-Topic: [PATCH linux dev-5.10 v3 09/18] ipmi: kcs_bmc: Allow clients to
 control KCS IRQ state
Thread-Index: AQHXRWmESC0KO3nGnEOPSlpsbYBxFKriRt3g
Date: Fri, 14 May 2021 02:46:53 +0000
Message-ID: <HK2PR03MB4371F006185ADBBF812A5892AE509@HK2PR03MB4371.apcprd03.prod.outlook.com>
References: <20210510064955.1704652-1-andrew@aj.id.au>
 <20210510064955.1704652-10-andrew@aj.id.au>
In-Reply-To: <20210510064955.1704652-10-andrew@aj.id.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [111.255.43.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ebc5ae2-eed0-4c54-71da-08d9168287f4
x-ms-traffictypediagnostic: HK2PR03MB4577:
x-microsoft-antispam-prvs: <HK2PR03MB4577AF0EC68CA3F81AC10235AE509@HK2PR03MB4577.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xs1Z8ZbNjATtqdAqm76HHWoyh7nNnTxGQRkyhef4kH04sn9h8sjBhQy+PFWsaYKFh211h25/KMNk6UlQtImKqqNXwraaMgVmq8Us8LyKhv4LBX0oanHxaH7D+1aHzuXHop6/Oj2p5RsSpFQPALC4Jdqd0JdEYBLFJBpWAkk8GWxPywk/Uf3J9BIlis/oL37UYCJLBtilbEzoZyqLa01fZInoxG6cq+kGmWPL/aAYlAdtCL3c7bvrYXYdQIoZcKhSS06MW4xK6DTA3nF1HVXx4o/xU5RDsf0gm/pbjVxvpbe+RdoXEZrycz/qYNjlXn25AyP+wldMYzCDgai7vYSN7uP83hky/8KfvkdE/igTs9IEKRUMAcuM7Zgz0lxbUpZa80T0dBeSs7Wc8x78vfwVK3WbIktKXlskhHVhsuN2kKgfls+hEfZRBgILS32ewrhNucAuPBg8R4kz9ZtiWeEY+cDEQxshUx0/GU05BCHBfdixhNwWDCezzu3a2uU7GNVj1E0dYz1vkXjvcDIJgtm00n0VDWelLNQVcQ5CJ2wr+NBVXoVZSgf9m+B9h/h+419KwlisBFyvNSI0f84hKMgvPB4CuO8HPTfQC5A8Dwk9Sis=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4371.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(186003)(6916009)(2906002)(6506007)(122000001)(38100700002)(71200400001)(8676002)(66556008)(66946007)(66446008)(64756008)(66476007)(76116006)(26005)(8936002)(83380400001)(86362001)(5660300002)(478600001)(52536014)(33656002)(316002)(7696005)(55016002)(9686003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rSm61iEjkekEpg+7Yk3dY6ypimaDuzeu0pRJtUKNPI5XZqpr9Kto2cM7CR+2?=
 =?us-ascii?Q?XUD4ZQR8L5pJbK7h7NxtzeELKuSg9wi0RLh9q7kxPRdZG2gOE97Xz6adNE6f?=
 =?us-ascii?Q?ZyuxaVwB9eb5OsezgI2xkjk4naZOrXijVlDvrr4rzt7lmLlazQ31qsIn4g86?=
 =?us-ascii?Q?O2LqATpVuYIRgdOeGlg3XrJuJZvl8JLhVzS9+8dmFqfypmEvUKtry19NQJO4?=
 =?us-ascii?Q?t4ArbGq7oKUEScXUfvbBzSsJC3H0de0oj68KiLwD9f+dGsRcSp67xRjgYw2V?=
 =?us-ascii?Q?pPv+w3Hd9bnlZUmTQl0rkomXIxdo5DCa8yxcsH4hgB/60Ftqydi4UtQVD4u5?=
 =?us-ascii?Q?mKaSb1nBXF5Kh7JGSjhuNNpsLpGMKJ+wxhJPCUiLH8cBzr7c4ruLnauH4CR/?=
 =?us-ascii?Q?9tY99v+X2Nbf/tjXjd5w/qnxzNVmnC+xdwJuwvnMZkQvPN6yP4VeSwLqk/rj?=
 =?us-ascii?Q?K5MwoVuYu/X/iVa34cilEyJPIQ2iPV+MvAFhhE/ZbbsYJzH9llMiicLSM+gM?=
 =?us-ascii?Q?yRKhZrCHfC0ARxR/JyrtkwZcNfce0LLmZ2mYdgbQlxCyp6V4mf2WK5X+74Ky?=
 =?us-ascii?Q?svmg5Yr2xs//QjKdCVQebYoZ2Bz0AtHf1Qb6xbF2naE0v/PVYihxY4SZaUn+?=
 =?us-ascii?Q?/0WFUHi5xfLAhgwcOgxiduKT+z/QDLprgvXZP69CVdqNtfh8x+SrxhdmgKpn?=
 =?us-ascii?Q?rAo3YbmE+e2Gqc8OKAUVDmqjkk/tIyFtCTE3q2Dm2B9hCEUzkpUtpUq+xqqF?=
 =?us-ascii?Q?bJA1IP4Sq7w1wCALvC4ZS6F7aHtkNLanwSHUy7TilQY6n5WPsSAns+wrRtU4?=
 =?us-ascii?Q?WDjJZikPcjUzR5pBvVEEtpNK6QDHv2wUDDD2G/MMVCbQH4REaJRH/2Z19H84?=
 =?us-ascii?Q?LT7EiwkbZDYU9OYxozG1c8zEMkP3ZZI/RdxsdHlg8b8suAwk38lYAm4apdR5?=
 =?us-ascii?Q?t6Lnoc48dD10SffLCE5jsMOVRVPD73uAXoYHQirZ3gtKKSdOaE0cfgjZESca?=
 =?us-ascii?Q?KurhL50kOoqFdDVm0etpGE5O6r0+vmtPmhfTuoQwuKKDMARWDfq0wCVTjYbr?=
 =?us-ascii?Q?Y1Ow7nm9KL/URLfP/K7vMNd8KpljtfO2lWkTVKTkNsqLFecODGOjjZOSzktd?=
 =?us-ascii?Q?6EUx8mHpcL2HglBOAXogKhXXDvca0rGUz2qF79/bKRWZmArj6drELMuFVxCw?=
 =?us-ascii?Q?Ap9Enk2NWayszmKoR4BEDtIP5IoqrW82JWV7q7CtBwoGlZ6Gpv+j8/SEVB6a?=
 =?us-ascii?Q?yYP8qN0Mx3QKldxzDh0ir9kAJbVSJuipRpOmVMfC2r+KFAJU8fp51PTR7707?=
 =?us-ascii?Q?vb4xaKHBuhEl1OgC6gBgRPSU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR03MB4371.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebc5ae2-eed0-4c54-71da-08d9168287f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 02:46:53.0460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vw6K7t2XtA7jP4+RwmGM0xefHvDKR4buXF8KeNOFBhFYkfNpNrXy0CYc/EIdzdj/drUxp+dTnQuTSO4uoy22Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4577
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>-----Original Message-----
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>index 9f0b168e487c..f8b7162fb830 100644
>--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>@@ -38,6 +38,7 @@
> #define KCS2CTL               0x2A
> #define KCS3CTL               0x3C
> #define    KCS_CTL_IBFIE      BIT(0)
>+#define    KCS_CTL_OBEIE      BIT(0)

Hi Andrew:

Appreciate all of your hard work and effort.

There is a wrong definition of kcs_bmc_npcm7xx.c.
The OBEIE bit offset in nuvoton BMC is 1.
#define    KCS_CTL_OBEIE        BIT(1)

Thanks,
Joseph

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
