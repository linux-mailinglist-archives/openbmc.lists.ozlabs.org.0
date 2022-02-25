Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA24C3E8B
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 07:44:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4gHS6t2sz3bbW
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 17:44:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=CoWGDv3C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com
 (client-ip=219.64.33.222; helo=inmumg02.tcs.com;
 envelope-from=prvs=04811d176=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256
 header.s=default2048 header.b=CoWGDv3C; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 25 Feb 2022 17:44:09 AEDT
Received: from inmumg02.tcs.com (Inmumg02.tcs.com [219.64.33.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4gGx3xtjz30Dv
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 17:44:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
 t=1645771450; x=1677307450;
 h=from:to:subject:date:message-id:mime-version;
 bh=3e+z/v6sBXc84oT54CCPMW7mtIc5KXWAn28Fe2khsPg=;
 b=CoWGDv3CJrNBhR5BNAn5oghuTdoN+rsomekQEqbaVsM2TMThQNsGRiJd
 XIm9n8TiCbT+YhEWU3ksuWJVYvv0bGTRIHfUZ539ZN5VOsLC+mkB6AZpA
 0PW5XQw2ph906qQvtrsjSWXhXu64+/21f9g4NzMGlZEloK+2W45ILlGfa
 gECuGmAmpq3admsGkQjZjP1WEgtdv3yj5Cn65szoOu8DraSIWGr70asOz
 QpMvMWLXPw4u60PYCejac/i/atAXYH8EynIDb8H3B62sGmoHgocgayXFe
 eerj3N9EmegMGB+9kzJrWvL3DXyMykLsFprCKZXeRulxdVgY3cDkrzeKD w==;
IronPort-SDR: uLgy1KZdaY1iwwzjUz0mcBOV34yBWxzogjAgPeFdvyzGeu+XACoBOw9kT0SDPuvJQvmixzbNcp
 P0pl2XzMxY4Q==
IronPort-PHdr: =?us-ascii?q?A9a23=3AnPwSehaYJ9ljgcYlaOejvCj/LTG+0IqcDmcuA?=
 =?us-ascii?q?noPtbtCf+yZ8oj4OwSHvLMx1gWPDN6Qu6MMotGVmpioYXYH75eFvSJKW713f?=
 =?us-ascii?q?DhBt/8rmRc9CtWOE0zxIa2iRSU7GMNfSA0tpCnjYgBaF8nkelLdvGC54yIMF?=
 =?us-ascii?q?RXjLwp1Ifn+FpLPg8it2O2+5YPfbx9MiTezbr9/LxG7phjNu8cLhodvNrw/w?=
 =?us-ascii?q?QbTrHtSfORWy2JoJVaNkBv5+8y94p1t/TlOtvw478JPXrn0cKo+TbxDETQpK?=
 =?us-ascii?q?Hs169HxtRnCVgSA+H0RWXgLnxVSAgjF6Bb6Xortsib/q+Fw1jWWMdHwQLspX?=
 =?us-ascii?q?zmp8qVlRwLyiCofNzA37nzZitB+gqxYvB2uqAdyzJTIbI2JLvdyYr/Rcc0cS?=
 =?us-ascii?q?GFcXshRTStBAoakYoUSFeUBO/tXoJfjqFsWsBCwABSsBOb1xT9Sm3T72rY63?=
 =?us-ascii?q?P4nEQ7bwgMvAcoOvG7MrNX2KacSVPq6zLPTwDXfc/xWwi3x55TPchAkuPyBW?=
 =?us-ascii?q?697fsXNx0c1DQzFkkmQppL/PzOTzukAvGyW4uhuWO+shGMqqxx8riauy8oxi?=
 =?us-ascii?q?oTFm4MYxk3K+yh33oo4JtK2RU54bNOqH5Zdsz2XOoh0T80iQGxlpjo2x7sbs?=
 =?us-ascii?q?pC4ZCgH0IkryhzBZ/CdboSF4AjvWPieLDtmnn5oe7Cyiw6s/UWh1uHxWMy53?=
 =?us-ascii?q?EtWoidBk9TBs2oC2wDO5sWCV/dx4kKs1DON2g3V9+pKO1o7lbDBJJ4k2rMwk?=
 =?us-ascii?q?50TvlndESLug0X2ibOWdl0j+ui19+TrerXmqYGYN49zkgzzLKogl9KhD+o2N?=
 =?us-ascii?q?AYARW+V9/qg2bDh5UH5QbNKgeMqkqTBrZzXJ9oXqrSkDwJXyIov9RmyAym83?=
 =?us-ascii?q?Nkbn3QLNFdFdwiGj4jtNVHOOvf4DfKnjlS3ijhrwe3JMaP/DZXVNHTDiLThf?=
 =?us-ascii?q?at460FG0go+1sxf6I5PCr0bPP3zXUrxuMTeDhAiKwO02froCM1h1oMCXmKCG?=
 =?us-ascii?q?rKVPLvIsVCU/uIvP/WMZIgNtTb6M/gq+fjugmQ8mVABZqSp2ZoXaGukHvR9O?=
 =?us-ascii?q?UmZZnvtgtMbHmgRpQoyVuvqiEeNUW0bW3HnFaUk6zcxDYmOCYbYWpvrh66F1?=
 =?us-ascii?q?S2gWJpMaSoOXleUHHHico6sX/YXdDnUJd1lmzYfE7+7RNly+wupsVrBwrxrI?=
 =?us-ascii?q?+fMsg4FsJv5nIxu7uvfmBwqsyR3EsGUyUmRRHoylWQNEWxllJtjqFBwnw/Qm?=
 =?us-ascii?q?ZNzhOZVQIQ7D7thXgQ7MMvayOp3Q5D3Vxnad9iEAFChXp29AD43Q95wpr1GY?=
 =?us-ascii?q?0t0F9i4yByW2S2sDuwZkrWRD8ky9aTRl3H6O8d6zSPA068sx1krS8dCLyuon?=
 =?us-ascii?q?Kl6ohTYHMjClEDK/5s=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3AxrMMjaBPDm9T9RVW/x/hw5YqxClBgxIJ4kV8j?=
 =?us-ascii?q?S/XYbTApDJzhTxUzzRNXWHXb/vYM2L9fdAjOY/k/E4Ou5fWz9ZhHlQ+ry1gF?=
 =?us-ascii?q?SIapZGZVN+TdR+pMXrNdMCbFxI5vp0SZInpIZFvRBcwhPsN3psND5VEOCvhq?=
 =?us-ascii?q?oPUUIYoAQgsA148IMsdoUg7wbRh2NQ12YHR7z6l4LseneWOYDdJ5BYpagr42?=
 =?us-ascii?q?4rbwP9elKyaVAEw5zTSVtgX1LPqrET5ObpETU2Hw9kUdaEPdgKyb76rILhUZ?=
 =?us-ascii?q?Qo19T91Yj+uuu6TnkHn3tfv0QayZnp+A8BOgzBpigcO/oIDEcY1Ni+7iR3Qw?=
 =?us-ascii?q?Io3kYoL78DqD1d2VkHPsL11vx1wCCh4MaBL4PnfImW6uNa700bdNXDrxp2CC?=
 =?us-ascii?q?WltYtBHpbgqWQmi8tRdcljhdCurgPq7xri+QcFoh98/N4/sLocWsGomyivWZ?=
 =?us-ascii?q?cvK67irr77ivIACmm5vwJoSR7COOKIkhfNUREyoS3Vy1p0/UvrSRNuVu0Q?=
 =?us-ascii?q?=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AeqSG8KGY/1c+l6BapLqE/ceALOsnbusQ8z?=
 =?us-ascii?q?AX/mtaY3VuE/Bxl6iV8sjztCWE6gr5N0tMpTntAsW9qBDnhP1ICOsqV4tKNT?=
 =?us-ascii?q?OO0ACVxelZnO7fKlbbexEWmNQz6Ztd?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AMBQAYehhi/1fyEaxaHgE8DAILFQm?=
 =?us-ascii?q?CcoEHfpQ+oVsLAQEBAQEBAQEBBwEBQQQBAYUHAoQNJjgTAQIEAQEBEgEBBgE?=
 =?us-ascii?q?BAQEBBgQBgRuFaQyCNSKEH14BDAlrJgEEG4J9gg6uVgEBAXaBM4EBghQEhX+?=
 =?us-ascii?q?BZIE8hzCDAIQTglCBWIR4gnSDTYIuBMZrkmUHg0uBP55FFagWlk8gpioCAgI?=
 =?us-ascii?q?CBAUCDgiBeFCBLjMaI4M6UJ0YgS0CBgsBAQMJkwsBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AMBQAYehhi/1fyEaxaHgE8DAILFQmCcoEHfpQ+oVsLA?=
 =?us-ascii?q?QEBAQEBAQEBBwEBQQQBAYUHAoQNJjgTAQIEAQEBEgEBBgEBAQEBBgQBgRuFa?=
 =?us-ascii?q?QyCNSKEH14BDAlrJgEEG4J9gg6uVgEBAXaBM4EBghQEhX+BZIE8hzCDAIQTg?=
 =?us-ascii?q?lCBWIR4gnSDTYIuBMZrkmUHg0uBP55FFagWlk8gpioCAgICBAUCDgiBeFCBL?=
 =?us-ascii?q?jMaI4M6UJ0YgS0CBgsBAQMJkwsBAQ?=
X-IronPort-AV: E=Sophos;i="5.90,135,1643653800"; d="scan'208,217";a="37577650"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1c0Rbsz9/nGx6qEtFjxwJDDeM10NTNvDwXrjP2rokN0D9we1an3SbaoJ9Ke0pBcN5g4vax3r31fcfoSL1tYzg1PmicX5e5+7D3fxy8+Vh3I5gaApQYSIIe0tb8Lt6yBN0dMdxpcFxvjgNVP5FOuyMbPnh3ibsQi1oeqRtxWOMArukRRLbB2kyw89C9+fEth6+Y36kiMdkZhI46hqI5UiExZWloJ0KfV6G0GI6sfdmsJ1gzR0Fr9fPHhIONRPIDOFWrz1VSMd1zYTTSR783+nhQdR7UntCWMmTjA+q7UkTz9mIUmUCbYQLVVB5DCikVvSIg1r/ozgj1bkdkr49SChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgJR3Uqy9osqq9PEQyiWqldtF9rFhTbT5LkDNiYNBYg=;
 b=jgPOIcNBCSyhazaiErEjKDqjciHxVY5K/bqtP0Fj/jU0KVGsaHT4mQWIvKC2yURtPu172kotBOd+xKqEEF7BLd9REHamwGRrAdyKxmPX8/dK33WpYoyEu/EwD6vl2UlEwBnnAzKPMeJEeJw+calIzVqEVJy2xkxThWWguWDO2vOVGuATgj8DbMZbGpuiDkRedf0mE19XmJTa6kXLFlNyG8U0kInZ2C5GA0sFxLxYWl5S1VYX54prPD/0TUubPJBDZH2R8LJPwGMzm/GeorAvtUT1YPAH76wiGmEV8a8sT0YxeUpZnJq7QmbMpf2IP52rnkFGh6vklZITjrauflXrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: openBmc Code Structure
Thread-Topic: openBmc Code Structure
Thread-Index: AdgqEnoKusptz7YpTwiYMV2le+cEdg==
Date: Fri, 25 Feb 2022 06:42:49 +0000
Message-ID: <MA1PR01MB41290C4B84DDFB7ABD101CB7873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73f7b909-990d-4ef9-de71-08d9f82a0a66
x-ms-traffictypediagnostic: BM1PR01MB2241:EE_
x-microsoft-antispam-prvs: <BM1PR01MB2241EE93A8BE532A013C6E4E873E9@BM1PR01MB2241.INDPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wr0zAkAr2y95ZKDjzl4U944kXuuLtN+1JatAlrTbCR+jA7u5nlQUNUHhBkbL7ioObfcsIBoUQy+yFrjVOMtRK5Tn+YljZNDWRSlH20DwUtSsOo9UwwFCbsvSseQCYGC+cv0bg+dm0hAr3fplpP/4+S+zqcMXVQxKAR+awDgP0c6JoOMY2QT5MkWG8maiPSRtYJF4LcQNEyndXbupDmZPLqcYR++Cy8hnCKX7LZXByebXmd6TNLt6Yq/n+m2uD3Lcx+qLO5HukbmoZ0HYahmyGFCuimdkd8pyt8ANKsJsibmO4Sh3UJkaimYrQgOgz9ipJij2R8DUelfmV7WuST+9es3yQugcRy1v5lNQ8rLarDqo+2a76zlIS1QbHU/gpgg9BreFKUeCiiSFXTBtTy57nrGvA7SjAIuszU79vQmWdtLWh/64ipObd0Mnq65dqfpoVYtS4M3Ra1dPWUKEmQEdruUS7ufjstAdcawjZTwr2zHN7I5EN/KcmonK5Z6vSfBI5+jOQragDbzKCsZ15Dsez66qFE7UbbmbUpDr4Vx8uhgNILDSbRsoc2BmNJGW0GUynlW6N1on9bxomR/VIkDMCg2IdW2CnT/Uobk/jU5KIWMPZXnNgTOIh+79QtF92I8OOKty0e8/pwE5dafQmlUNbxycZsQBRCa3NEdjjSrVza8zEre8WDImRsvR6WmDG3S6y/lhfbHCWVTonRALc9Kt+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(508600001)(3480700007)(33656002)(26005)(186003)(64756008)(5660300002)(7696005)(316002)(38070700005)(66556008)(66476007)(8936002)(9326002)(82960400001)(66946007)(8676002)(6506007)(55016003)(55236004)(122000001)(71200400001)(86362001)(66446008)(38100700002)(7116003)(52536014)(9686003)(76116006)(6916009)(558084003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jemxt40USwWr7kSjp4bUNN2UbInTp/DPrYclL1mFgIsAPztevyYzLmpquJZu?=
 =?us-ascii?Q?mWOuepe3kG9x1AqzdgpnNbJNT3uCrXQhraoCLVxm7GD4PTQOM4uR0RpRjnva?=
 =?us-ascii?Q?F1ndMHG9X+ReZsiNivb46GQlX9yjyq0qGdtyCC6OjZLvHrnABkeHB3vf/7iE?=
 =?us-ascii?Q?WohOIihVuHpV87rTKVcQugQNkb+a4w2uhtADdyBvseFLPnlING3o4GyNbzc4?=
 =?us-ascii?Q?yen5R1qnOzScfaxi9rJKbdye6kc2ruAuIgQxH/bmSNv7B0SU9bJxbMFLs1cw?=
 =?us-ascii?Q?5ZSHu9z2PJ/WMqN6Manye9UENqWMH7tXKFA3XqYbCxrzFgyPEn67ks/VaGIV?=
 =?us-ascii?Q?24Om7LZUlRzXKskNqAAnQ56UJXx5PmWvKZ+JXGcURXIeikN1JKRm68eLHZxq?=
 =?us-ascii?Q?qW/6CvjVAsvUFbjTBLZxlhVvJVfewpAoGdZl0DuGH8ygky5Ao6uCnsAicay6?=
 =?us-ascii?Q?CqNFzFdakKeCmBE+jPJcLzd9Ss6ZC2q2g0j0wODxc7FsmaNfEymuoWlFMeYz?=
 =?us-ascii?Q?w4dIPXG/R7Bgv5zVMz83pz8QNGFfzL3eMD7BEg7quYiDB7b4h/GZ+YYP5RJb?=
 =?us-ascii?Q?fIeBvC/p3dSHJsYi0cGlLjEix2pm6YMBXgeeifmK9U+tk273PU6pP8jrztJa?=
 =?us-ascii?Q?G5fzFdlBsBnGyLD2dU3cIy//HDkQZwPkgl/8X2XHVvShN3i7nPnY5yjeOWSa?=
 =?us-ascii?Q?uTky1QkDTzYe2wkkZK/FnqOVFd361Obh54iueKC9wpAeqf7GVVrDxt79Uz7J?=
 =?us-ascii?Q?Lz8WSE9kbCtHeDHLvIqCo0oJzWVVBrFrDwU8ehHLupGLNyLltH52ZVRQaoJN?=
 =?us-ascii?Q?c6LLUB+il0cfIWcXOF4dZOJDPO+tyLTGCT6saE2iLzI9S9/mOE5NuxyKH5mJ?=
 =?us-ascii?Q?cQkn64ZM9VFzW+onFPslW56ukH6k1U9RXkYf8xRXjf4iz6x1ES+mK1jqNVRy?=
 =?us-ascii?Q?8ZP0M82WjWNhlVMfFswTEYcKiYPEv3heXUegVAmGzlnSPHRcHrAyTdFYtR6B?=
 =?us-ascii?Q?Qr3rKyl8HPCKu3ybsMy1dqDA4JX2RSnvQy4bZNIpYGnXUxaHGC4SMeHdXn9F?=
 =?us-ascii?Q?GKt60TlRG4OIz+JTNLH3doiXo82GuEfRGul7ytOPIv/0JrLSdHtvqC53RSOa?=
 =?us-ascii?Q?EC7YPpW3b2lKxInzsBRmpZ/jkyuOAZXCiVnBwAQxwqXrzj1DLGvBItL6oJwz?=
 =?us-ascii?Q?0QkWf4vI2XyhrSPasALg8wVikFsDEJZ3vxQjJmLe9NTFk8EOWumP+lEQxxHV?=
 =?us-ascii?Q?f+0RYitemcaSmKDfUFTqo0/SdHobVHQEwG0TSVJmBx/yWb9zjdWlJRb2wJ5Q?=
 =?us-ascii?Q?tIKbvm1mjzfruM+UpzaFS3/Lq3OLdDYRFv3EFKSksC0NSUL2YB0M35354SqU?=
 =?us-ascii?Q?Hy/ulkFEHoXecra5qRFPE5meMI9KnQ5/f7UxGej+JO0yTZk1jB+NrkfdiaRz?=
 =?us-ascii?Q?4hU7e3cCEoqFVgiBUDunHmccQ0MYMNaYzbb3tFbTORAdjSC30JXnAp/q4aK5?=
 =?us-ascii?Q?TpfxMDbggMvijFQZouor2WPEYhr0ecDdst4VPg5256x8Bvsg5Wm1Mv0FfweB?=
 =?us-ascii?Q?GxsqwmviHf1LpflSX+4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MA1PR01MB41290C4B84DDFB7ABD101CB7873E9MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f7b909-990d-4ef9-de71-08d9f82a0a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 06:42:49.5371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEJu2zgccG5WAjWuwsGGHEKeg9QOY9sKX7UlLP1uMhxzIRzmksy8+3ICR0zCOqa1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2241
X-TM-SNTS-SMTP: 114798AD60184183A8BA12F82EBA931B461BF255285BAABF0ABFEA2F26CFD3DE2000:8
X-OriginatorOrg: TCS.COM
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

--_000_MA1PR01MB41290C4B84DDFB7ABD101CB7873E9MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have just started looking into the openBmc source code. Could anyone expl=
ain the source code structure for openBMC?

Thanks,
Sandeep.
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



--_000_MA1PR01MB41290C4B84DDFB7ABD101CB7873E9MA1PR01MB4129INDP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have just started looking into the openBmc source =
code. Could anyone explain the source code structure for openBMC?<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep.<o:p></o:p></p>
</div>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you</p>

<p></p></body>
</html>

--_000_MA1PR01MB41290C4B84DDFB7ABD101CB7873E9MA1PR01MB4129INDP_--

