Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75CA3C19BA
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 21:19:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLR1f2Bqjz3bXk
	for <lists+openbmc@lfdr.de>; Fri,  9 Jul 2021 05:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=AGEtVRMa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=8823184bff=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=AGEtVRMa; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLR1H2Nhwz3bVN
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jul 2021 05:19:13 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168JDhIr010361; Thu, 8 Jul 2021 19:19:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0a-00268f01.pphosted.com with ESMTP id 39nxx69y8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 19:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0Lss1HFJPgt7KXwacE8tz9/nA36CD5FvVIREwH62BCUepUZvDCHvpvk8Wmr8eo/wGxBLoAeMHZXgdwt8l+ErwE0Yj2Ty5BPfF1ZyX4vV8XT2laflNRBMv/zXRBXHvQy9zBPt/y2ZNS6vgdhArjVX4LRx9AxY5EsRD9wSwRGMpxdp9d0BvwpQYz3g5vgCKqo6uceO8yxjgcNIGWMzCZLOpNRGVuuU/XpLMZ68od2AYNK9xQfbDDluAbQHqGcoad92XLtu4blnH0YRcZUZrjGHs6f8Lkzfnlb86qt1h2BUeUmJJVtMommuK3zGSw58gX/mk3acjDFEKweB+nzdr1+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRbSpXn4Q7DVLCXQnmIu/jgVn346ve7bCTO4dMQBXRc=;
 b=e6Q6WnmMkujRZVArDmhCtoBNq3P00EQkZatmzH13cn1/YmKf6HKP9X4qsjb5pBAe4tv4zZeBFqN9/9NvuKUPDHwtpyVhkMH0nlrv+1Kqyq6RFORLnopezyGbFE8qvqSLqW7awqkHxi0yr9yEoZB4EZ4IMdR2A1PbgtLAWwmPbyW8cyiIj1opFs/lxN0VoA6EyPu+O1D6rk28HZXVq9zofpLVJGln7nAFbyRVByOFlZMy/3HObLbd1pLAfjELbHs/XTER5rxOh3osxUvY6+067ExXNjbdcbhbGLBPszSMUqWySInraJySt3JbNB9d7uObkw2Jypb8rpArsT6339waeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRbSpXn4Q7DVLCXQnmIu/jgVn346ve7bCTO4dMQBXRc=;
 b=AGEtVRMaDFFoS0MuYxQQgF+KVBI8AcuvRzMxM7OoMfhjuwc/kEMy/go9hXf1lfUMMF1B1NbabKLCR0jp0wVlWw6VXs4uPYZLlTp9sYIkwetSqB2cumAeBoinpZzVAIHDeY4aFgaunWp7GK1aToDqt03uhTk4GS9SkfWny3ykW+I=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB1036.namprd04.prod.outlook.com (2603:10b6:4:45::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20; Thu, 8 Jul 2021 19:19:06 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::e500:d29e:8a54:6303]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::e500:d29e:8a54:6303%3]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 19:19:06 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: U-boot version selection
Thread-Topic: U-boot version selection
Thread-Index: AQHXdC4eyEt6KE9R7k+thEOOmGGecQ==
Date: Thu, 8 Jul 2021 19:19:06 +0000
Message-ID: <20210708191905.GK8018@packtop>
References: <20210701024206.GH8018@packtop>
 <CACPK8Xfa6_LoMi23F5YRSvdcD8fF6GA=WQkDCw9Z-Jf8EkoTWg@mail.gmail.com>
In-Reply-To: <CACPK8Xfa6_LoMi23F5YRSvdcD8fF6GA=WQkDCw9Z-Jf8EkoTWg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 181b572f-b45c-406f-3471-08d94245413a
x-ms-traffictypediagnostic: DM5PR04MB1036:
x-microsoft-antispam-prvs: <DM5PR04MB10365C76D219B7265E4E6829C3199@DM5PR04MB1036.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:369;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBTercUXpcyGDlwde2V402JChIvUt+TU3uKqQDeDcYhZcBpnnmGmdw56fLCeAGynMMH2j5oE6AVva9Xv+Dja8+ZYSWycPOC83UwkxwgXCWqTryq4k5yw6/26iQN7ITw5ZIvVU7f5bQeJX4TGXobl9pOtRrH5eV+srZdTrJRD67ntn0rglUekuZ2x6dPUKZgZhjIg5WUscKiCluEDEY35dy5xeEhePZijtZjiyVXQWRRC3zomZm/1Bn1lNcjY/wFDmmp7wz17w7caMtje1cfhW1ZYtbHnIFhEVsEmRj6HPccsptTQabPf0YEznUGhLyK//RXPDL+XbM9MZI15mBBbmI6VWQCvfzwxnio6dKE7R9tkl6Ato6cuPX+khu3WXK+kBdxDq+l7sWsDODOKclLPAU+jdL9eXLmHmteHpbbqGH+E9SsZuzISemlxCZDqt5iq+9K9YPjUTuJ+lJDnb/ttMUjUqsMC+J9EeNVStjk0l7R1L10Et7YlUD3YzemNMrBfDkjhRUhu+NF6b4pyhTOUjGx8lJ73uli5ejfFxbIEvJraG60+g950YfoyQa+ZphT/a/8KbqCjILJovTXQMjKmPPh3wDEXI7VpC11gVmfeLGEPJTpcw/mtVQ4KYhs/VUwwxEtsKYyfR6o/GL+0dC37jWKruJN8zbkyT0KBeLp24w+CEBnRmjKVyV7ng+WmqgsVCZHZUB3mdn5hymJdbOCSsoPE/3p3EWJHu1xTLJVO4+c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(39850400004)(136003)(376002)(396003)(346002)(366004)(316002)(54906003)(86362001)(3480700007)(8676002)(478600001)(2906002)(6916009)(4326008)(6486002)(64756008)(71200400001)(26005)(966005)(5660300002)(6506007)(66476007)(38100700002)(76116006)(9686003)(186003)(1076003)(6512007)(66946007)(122000001)(66556008)(33716001)(33656002)(83380400001)(8936002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?aUo3ZkNuR0IyV0dBbWFNeGFVYXljRWhaTnkrSEtGb3M5QVhEZTNJa2tK?=
 =?iso-2022-jp?B?dzFiby9nV3dUVzJ4K2NsRUFWSFAzMW5hUFBNUlRKZGdOQzZWaVJYL0xI?=
 =?iso-2022-jp?B?cEw0NGF1Y3VDc1RvMWRJbHluemd4L1poRVVXU1RJTUxvSGJNN2FVaG9R?=
 =?iso-2022-jp?B?TUJERHZxN2REV3NZbFYyeHhBNjMybGhBb0JxYnZCSnVucnFmdFpUYjM2?=
 =?iso-2022-jp?B?Y0k5RENHWGxJZkxrenhlWXErOFRPeUJwcEhGUElVak13L21vU3RhMEtJ?=
 =?iso-2022-jp?B?aldoVW5ZR1c4Y1c2djMwSVhob0VXdHhWUk91R0xEamJNL3JJeWcxZjNX?=
 =?iso-2022-jp?B?MjVhdFM5OSt0Ly8zd1lIYjhSZFYvcjE1eWFRbWtDWGRJdXo4RXJTQ3dE?=
 =?iso-2022-jp?B?K0tLS3BNcW5mQVp6ZkRseXdoL2NZcTh1eUJqbWZYZUdBWmdJTFB3cmYz?=
 =?iso-2022-jp?B?VDg2UDFnV29zOXVZRmZSRVluMS84UGRha2dqbXNzQnoyWVQvNlZtZlNC?=
 =?iso-2022-jp?B?WllQaDVEdFBmMXJQM0lEOG1JR1IrNkxEQVZzaFNWSHRzS0pFMDFYeXF0?=
 =?iso-2022-jp?B?ekNxck9sSXZmNDljcFV2aXRha1l0b0R0K3dNYnRrQkhPUnUxWnlJWCsy?=
 =?iso-2022-jp?B?UFQ5akhvRVA5R1UxdUJQSnVxdzZKV2hkOVl2SldtY29ka29EREtUMmxF?=
 =?iso-2022-jp?B?OW02d2tMVHliMmNxY0I4RFBrdDVta2xpWHg5ajI1MnRQY1VQRUsvRG44?=
 =?iso-2022-jp?B?VnAyZ09jZHJHUDRrS1NzMXA3RlQ2MmMxeHR0R0JIdVJVWEVnNE1aNll6?=
 =?iso-2022-jp?B?YjA0TCtlQi93SERlUnZUTkF0aEZkdTZJVHB6UTNweHNwSkhmNExEZXdX?=
 =?iso-2022-jp?B?SE1mb3YyK0lUTWtWRVdQQzFsV3NiYW9VaUVzYWg1SVhaK0pYRk5mVlh4?=
 =?iso-2022-jp?B?SE5wQm1NcDcxa08vNUY4Vm5nYVhxMitZQ1FiUUlQL1diTVo3ZlFkSDNM?=
 =?iso-2022-jp?B?N0d1MkZuYSsrUFFlVTVoS1BCTy9ybi9tWXZNVVZUemRuOURvdGdPQXl6?=
 =?iso-2022-jp?B?V24zZ2psZ2tBZ1A5OW14OWEwSjNGeTk1MXh1MmNCMzRXVE9zVFhEdWtZ?=
 =?iso-2022-jp?B?RzZ6SSt4bmU4cC9RdGpWZ3NSd2VPbzBxZTRySVVvcnR3L1hTZnZJWWN3?=
 =?iso-2022-jp?B?WmVmVzI0dWw0WHJqaG1RcnNWOFhURDZMSXZvdWVsNzJ3UGFZUnAvY2NC?=
 =?iso-2022-jp?B?N3ozSk1QT3NyRHlLTUIzaEgvRGFuMWJGTWZqdzJlK0lnRVNidDBLY25X?=
 =?iso-2022-jp?B?YUEwQkI2OHBvL2lNNG1veEtSYys2Z1hsVnF3YWZweloweFlXWld4dFhU?=
 =?iso-2022-jp?B?NytQcnZEa21MQzFXWE9rL3lGZ0s3Z1pCT1RSYTFDSkNkNVBiZ2FHQkpV?=
 =?iso-2022-jp?B?OE5oNjJiVkJhd1V1VFAyWU1KWWt2bzdLUTZXeUtGQnNLUThIUlNDL3dG?=
 =?iso-2022-jp?B?azVRSVk2elF1dlBrSVBsangwVlh3MFMzbVFpaWxaNDkyWnAxWjJCa2dU?=
 =?iso-2022-jp?B?bC9vejRDanlWWTBPaUd3MGFScDBmOUZHQXpVeFdhZjcwSXhlOVViMHls?=
 =?iso-2022-jp?B?Wkp6WDZZSTJtaGk2UEV2WHYxaHFTMzVpVDYxa29mb2dDVVlYblN4MWRT?=
 =?iso-2022-jp?B?QXZSZlBNQkxxUWkvN05rNS9PSTBFVjhQbUZJeG81UnA2eS9uZ0NGRkQw?=
 =?iso-2022-jp?B?OVdZeVo3dnorSFErV1l6NDQyU05lakVMRm9oeUNiTXpDQ1RJcVZzWE9F?=
 =?iso-2022-jp?B?NldRclFRcUd2R29XWndXcmcvb0JKM1hRU3FmWlkwN09hbm5ZYmR4eHl3?=
 =?iso-2022-jp?B?SjdDNDBOS1NUWm16WVhLSEtudWJDTzF1TERlbjhnVkwyMXcxUWwzUzc5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <8D138E3921942446BFD10DBB54F119DC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181b572f-b45c-406f-3471-08d94245413a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 19:19:06.3416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxY+U0Ep7UYhefA97ueZ15KS369kFNRvW9IUjdFVSBAa00RghjCrYrjSSRL/45PWnkFJKqc7bQizkueNX8/buw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1036
X-Proofpoint-GUID: LQwDnTNXdv2qLKgswgreJ3_C1ctU7e1Y
X-Proofpoint-ORIG-GUID: LQwDnTNXdv2qLKgswgreJ3_C1ctU7e1Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_11:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080098
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?iso-2022-jp?B?GyRCMGpNaxsoQg==?= <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 30, 2021 at 11:51:49PM CDT, Joel Stanley wrote:
>egacOn Thu, 1 Jul 2021 at 02:48, Zev Weiss <zweiss@equinix.com> wrote:
>>
>> Hi,
>>
>> I recently found myself needing to make some tweaks to u-boot to
>> accommodate a new board I'm targeting with a larger flash part, but in
>> going to do so I remembered that I'm currently using u-boot v2016.7,
>> whereas new development is strongly encouraged to use v2019.04 [1].
>>
>> As far as I know that happened entirely by default (i.e. I didn't go out
>> of my way to use the older version), so I hunted around a bit for how to
>> override that to use the newer one, but wasn't able to find anything
>> obvious.  What's the recommended way to go about switching that for my
>> board?
>
>You can see Lei's change to use the newer tree here:
>
> https://github.com/openbmc/openbmc/commit/1aa72efd0f54
>
>UBOOT_DEVICETREE =3D "ast2500-evb"
>UBOOT_MACHINE =3D "evb-ast2500_defconfig"
>
>PREFERRED_PROVIDER_u-boot =3D "u-boot-aspeed-sdk"
>PREFERRED_PROVIDER_u-boot-fw-utils =3D "u-boot-fw-utils-aspeed-sdk"
>PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-aspeed-sdk"
>
>The important change is to point it to a valid defconfig for the new
>tree, to specify the u-boot device tree to use, and to change some
>yocto PROVIDER variables to use the "u-boot-aspeed-sdk" variant.
>

Great, thanks for the pointers there -- that worked smoothly on the 64M
board I'm currently working on a port for.  Unfortunately when I tried
it out on one of the 32M platforms I've got I realized that the u-boot
image with the new branch comes out to around 430K, which in addition to
being quite a bit larger than the old branch (~225K), is too big to fit
in the u-boot partition of the 32MB static flash layout (384K).

With a bit of haphazard experimentation, I found that disabling
CONFIG_EFI_LOADER got it down to 370K, and turning off
CONFIG_SYS_LONGHELP reduced that to 357K, leaving a bit of breathing
room, though perhaps still less than would be ideal.  Since a quick poll
of FLASH_SIZE settings seems to indicate that most existing OpenBMC
platforms are 32M, would those be appropriate candidates to add to the
evb-ast2500_defconfig?

(I also encountered an ftgmac100 phy-related null pointer dereference
that leads to it spewing a bunch of garbage to the console, which I
band-aided temporarily with a dts patch to disable the second mac.)


Zev
