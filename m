Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB348A517
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 02:32:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXtTY4nHqz301M
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 12:32:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=PutvZbHN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=52.101.61.22;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=derekma@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=PutvZbHN; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020022.outbound.protection.outlook.com [52.101.61.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXtT32Pl3z2xtF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 12:31:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP4myH5/CtMd4UDx5zoZcMmcHRBmgoG2kXXZWABea16tnMpaN+3jgwLK5dC6DeoWGwhw5p+vz7/czJL55pIUwasbu5EZ4H4Yz9fTKQHz2Dz9p/mGC+qyu76/O3SQex0BGSgMEWua2r6DY4P8f+dwTu9ROhhfbMJ3Xboe14JJSbNnTS8+1COQvJPNun+QJ0Bgyzk/YYaOs46MXkN/vjA98GayANTrkWSUXoEHPE3VQdfU6Q+EUj3Icy0bRs23didZKLyWoZaBT2fmszQ/5275KTBA4Z0+ubhbJBXgGB+5Nr1YMfmR0wSKdMQ/yDW21zpTm16s6Da2yeodXD8xH4BsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHmxuxZp/J5sEYzTmF3VbgAC46xPpipLScXI0ykSwqE=;
 b=gyY0ZkXsVtbZBstXchzhwh+H2vA7REMo0UmVjBAoMtHa1M3LvXj5OI4YNnb5vqGIJJNVz6WNBSSeMoU7Dc+VtAaWphCgzdocEHqPZLyiSmYAGmABMDbNucBo8AS4zRS8s66MlCawl8B/Onsysi4bRhZ6Y5oHjaBW/agev2GeWTKQ77TWUvDkQb8jzqqL0d45YdiseyhFSOrfLAv3c7rMN2LnSirejam2jWkP3D7H+PFIASGcD2APOva1kqqEcgP63tTeXSQ1WOK+kMlaW7++UpOLjhwk5fv2AoJHcrBK4knf63rKdjLsxkmZaCg9iwMnCgyjKDALHOotiltxqZA5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHmxuxZp/J5sEYzTmF3VbgAC46xPpipLScXI0ykSwqE=;
 b=PutvZbHNPshOW/akBrWqdAYX/HvcdqvAVUtdFFBLdpNxxhcDRRoseps55D4ecCfARQ3p0v2OReMrPMoF+FI+84p54GTXQHvHHjfnN14Mcq4p9ZxaV0i9viHpNW0lnrsUBHEyD8+yInFfgbPnnu9kEwVynoNnb036QVVaOgVAy/M=
Received: from MW4PR21MB1922.namprd21.prod.outlook.com (2603:10b6:303:73::23)
 by MW2PR2101MB0985.namprd21.prod.outlook.com (2603:10b6:302:4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.1; Tue, 11 Jan
 2022 01:31:08 +0000
Received: from MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::6d29:a06f:80c1:fa58]) by MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::6d29:a06f:80c1:fa58%7]) with mapi id 15.20.4909.001; Tue, 11 Jan 2022
 01:31:08 +0000
From: Derek Mantey <derekma@microsoft.com>
To: Richard Hughes <hughsient@gmail.com>
Subject: Re: Firmware update for auxiliary components
Thread-Topic: Firmware update for auxiliary components
Thread-Index: AdgGh9lMUh43zeumQyG0JT9dehtNEA==
Date: Tue, 11 Jan 2022 01:31:08 +0000
Message-ID: <MW4PR21MB19228AA5DAFEB23F82372330B0519@MW4PR21MB1922.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ca0337e3-9f23-45d7-814a-249e490e716b;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-11T01:09:01Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1df67766-9f05-4ab6-de81-08d9d4a20ae1
x-ms-traffictypediagnostic: MW2PR2101MB0985:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MW2PR2101MB09850DA144A1926A84152A62B0519@MW2PR2101MB0985.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4z0OgHcijQEcbDQcvotm3ug3wfPKdlODQj1rEs4nAsUIEUV5+w56Zkc+X9I7tWMfBgkwJghEizJhZ06223u32+5KL2QtH3kEXGGVj1sCbT9nEiZtA44GiuX1NZBi3smIxN51EXc0QdFcYtogxkwa6qD8jx5kT/fgqMbjWMmzvfm+gbcWDHJR6Xa4BQtWNOhWdbc8xM4278fFV2zW+Q8SWCWbpQoEthcqx/4JFj2bOMkywVi1wW4H6Ggh11t0RBrdz0dSKfbjdpXvGvRVqQh2tWU7SsUhS/XYgGaJQULXpfVgSnQ/G2GLlCWy8+IPgSAz5OUp43Ll7a8P/yi5ak05tSAO6ZgEWHC0T83R4uwoqfI9ATew12Rt1uA52MSuKSuaUerDuRocVI/yfpyYKB/cwpiwN19oi2afzbuL4E86y2ufGip0t+Nmw4NDekmg6bLnvuCw23CnTNFtXL00RgNPjjYn0crOH3GyaNB56d+3Zcsinqpl1+LyUIXOted+JrTEf+Mv8xyIRmE44PJJCNSSAJRHzk3FGaDV/QkxtiSCLewr68+JjTh8tOnnkJHlqYruKorFvL06790oCLnyX+f2RYGjiOiV96zdxjkcBYAd4wYB/l+z+p96SSNNa8Hxe/muCcSfVieUjDnOvbOdErHr5+H7ce+tfpS9JMV/ZDVnIb6ye9XwEhB5GzwOzH9Pi1ViJ6bwANwMEpRvTvbbBgCZxFNT7X//FbKei1wU3EzaoYy8cYNPrWXIZrBC0mVMlCH/HAZhps5CU9atleZUab33WHWSgq5DP19ImZR2TLGFrk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR21MB1922.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(71200400001)(86362001)(26005)(186003)(33656002)(53546011)(82950400001)(966005)(508600001)(9686003)(7696005)(10290500003)(55016003)(6916009)(316002)(38100700002)(2906002)(4326008)(66946007)(76116006)(122000001)(83380400001)(38070700005)(66556008)(8936002)(64756008)(8676002)(66446008)(82960400001)(5660300002)(66476007)(15650500001)(52536014)(8990500004)(10090945008)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?meuzWQ0b6wzyGeSaLp3v41tiVtWI94bZj6PL6Av8uL/ApqNqRoB05jAJhXou?=
 =?us-ascii?Q?jUZQGEJ0DopqLUG/woGUTivq+6lAROr3cV7GeBysTQSjn21GZGLTRwE2Pm4K?=
 =?us-ascii?Q?XOGXhxxDOA/SDaO5Z9gHYOxqdsJHQWv104W3QUkMwqfvV7sloApGOBACHouI?=
 =?us-ascii?Q?wHujkG6wMBIMOYAoqdOAdMuWWa1dzxFYSb8X5io8HE04/2xPqLHwoqGAWMp1?=
 =?us-ascii?Q?TCSQ4CM27V4SXAt8hScR5/E5GrsMHvlYf2DL5TYArmZZzbNGZvIQ1nIAp5R+?=
 =?us-ascii?Q?gm+eLMJMGX84lrYChwosbZwMSeON7/r3hpILpQP6/jMckypGg7+F+STpGxZX?=
 =?us-ascii?Q?uykmfdWIcLgRnZS/jgaBSLX3MWk9h/MHifky8mS2U1WvUVP90fDC/K68Ma0I?=
 =?us-ascii?Q?pdz7ygjFkjoB7DcYT6K5PYtp4OMC4LBg9jaV+WQbmoZK+cTSetwQDTowp66y?=
 =?us-ascii?Q?0GrwUVLFINtJ0u5gn0OMuuVrih+Rkj8lyQh4CNdNIN3Z1XUaqXhn+nGw/UTG?=
 =?us-ascii?Q?MXo8pzjlJyevGLYRv2ZU2H0EvQtTk0T4qiw2lFyLybErhzzPw++gxI4pHiXc?=
 =?us-ascii?Q?x9xSIgHyb9u7laQQKgHfctjz+Sp7YTNvvSYaJoTd+SEiJVZlOuv5dIQzxTm+?=
 =?us-ascii?Q?y4nGyx+51eWq2oLaYrSnlO85NF+H2Uwxm/w8do/nJVStmvAbdNmwMOgnVqti?=
 =?us-ascii?Q?gke1AUZcmfH/XAC1tXCu3Dbi4aklIRJCUeYOQTf8TQgBxZo4ZbDVDo/BMnWW?=
 =?us-ascii?Q?27OvYf40ivPV3lYkYsCOn36dVnsBVLi+CTXvP+QcbZUheeLNvVldidSlA/Ca?=
 =?us-ascii?Q?0SGPX8lD4BySNLlKclohnw1e5d6wECjQecnjHQhCCteubgy8vKgAdDeiyHNV?=
 =?us-ascii?Q?vJm2bUqnG2XakqPLsFy4t4qtL1iuJFNYwXLg1wNqcWfx3LWWXlx9YJl6S3Se?=
 =?us-ascii?Q?txVwEOs9JC9xKXRU5hSwy36kCfAiIHMDc+Wrsz8N7etK1631nan4foaiM0cH?=
 =?us-ascii?Q?yrT8Jfo9092vXruz2ZyzsfQFN0QCnnA78MuBbpvIUxTZRCphk3Lm0/bIqTZM?=
 =?us-ascii?Q?nldH05p/ZDFW16+DfxZvpJ9jInL4RSE28oHkOOjL074TormPO0yZywwEVVMq?=
 =?us-ascii?Q?5EybL84m0Y9UVgGyxlBbEJy76GsnbujxP1HJiSijWNYAxQKwrIKCDQBT/y+A?=
 =?us-ascii?Q?IWH5QOwI2nO1giJvfcrGdUJfLukqKOYxOsvFQYX/gX/CuJZUA8oUtwqnPTkC?=
 =?us-ascii?Q?hmpuKxJBVOQLl2Lja6uMlRKTLseDppPp+6VMU4dY7cva8BCGwt6gNTpxlMIG?=
 =?us-ascii?Q?NhxR0MTcEgCPbLZxEd6oVWxWDL04moh1Efw520yuwXKob2JpiIGlERNGAITv?=
 =?us-ascii?Q?z6jyQo+l+wdH3+fIB0m8O2rTG82gwMmsPbEmTMM4MbP9pGibA19nP4rVhcjg?=
 =?us-ascii?Q?s8KLPdV5luwtqEp6XhsrTFAqjtqWKICU2SB0ueeN4voVJHl4icYEQsDvyZz/?=
 =?us-ascii?Q?29wsW1TXKTylpaXRU9ZcuQMOsAWZdtCGzKW2n/Z+2yiSiFliI+WOYp0Uj1SK?=
 =?us-ascii?Q?IXctKt734sLoipMzOtCc/Kgvvzt87Fv1ijQn5lfOwvHOILwKaLXldFK6e/s2?=
 =?us-ascii?Q?kQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR21MB1922.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df67766-9f05-4ab6-de81-08d9d4a20ae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 01:31:08.0951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUK/LLQi+WDMW4rADwtIaraw3LS7NSiUfdYyqLJPndUuKFDlXn4sPaT1aH3BdnRfFYr3ROWnsaQCWOvkXjIi0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB0985
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

Thanks, when I was looking through some of the history for this list I saw =
some of your emails about the fwupd.  I tried to pull the changes in but ra=
n into some build issues.  I am guessing we are on the "old" side of a brea=
king change to Yacto/BitBake and we would need to upgrade first before we c=
ould get things build.

I know I should have read up more, but since you replied suggesting it, cou=
ld you tell me a little more about the interfaces that the fwupd uses?  Is =
it searching the device tree for devices that it can update?  Is it searchi=
ng the busses directly?  Or is there a way to give hints for devices to upd=
ate?

For example, we have a CPLD on our board (see the Open Compute DC-SCM spec)=
.  We don't currently have that listed in our device tree as it is just sit=
ting on a generic SPI bus.  Would the fwupd tool be able to update it and h=
ow would we need to specify how it should communicate with it?

Thanks,
	Derek

-----Original Message-----
From: Richard Hughes <hughsient@gmail.com>=20
Sent: Monday, January 10, 2022 1:53 AM
To: Derek Mantey <derekma@microsoft.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Firmware update for auxiliary components

[You don't often get email from hughsient@gmail.com. Learn why this is impo=
rtant at http://aka.ms/LearnAboutSenderIdentification.]

On Sat, 8 Jan 2022 at 00:45, Derek Mantey <derekma@microsoft.com> wrote:
> I am looking at enabling firmware updates for some auxiliary components i=
n our servers that don't fall into the "BMC", "Host" or "PSU" bucket.

If it helps, I've had quite a lot of success getting fwupd running on OpenB=
MC; there are several dozen firmware update protocols supported there.

> Or important discussions around the current design that I can look throug=
h?

What I don't know is how/if fwupd should integrate with OpenBMC; presumably=
 we want to expose the fwupd devices through the internal D-Bus and Redfish=
 APIs.

Richard.
