Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 049B341DCE4
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 17:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKxKR6r2Kz3bWk
	for <lists+openbmc@lfdr.de>; Fri,  1 Oct 2021 01:01:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=x6SE97RB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=x6SE97RB; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKxJy55j2z2yHt
 for <openbmc@lists.ozlabs.org>; Fri,  1 Oct 2021 01:01:20 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="286223140"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="286223140"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 08:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="564221935"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2021 08:00:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 30 Sep 2021 08:00:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 30 Sep 2021 08:00:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 30 Sep 2021 08:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZEEERTejRoIKbmTiZeGc1JarOwNy75a4PFmmBRI1oqUS5/WGAe0tryq1tme/jrPVMMzUZnfF3eTdmYSqFOcPQhlpWDi2cHbt9+p7EokzYVpIh095Pp6UQs6IlAFGvsQO2MKB8Xn+Zf8DDLo2J13XvvycUYMnOIquo+++CfmnmeLvprzYPekeWGq+Z4cyEsBv+JPzuWuR7FyZuYG9KvVMk/65piPimRDmedh0xQUc0D9DIThBvYfPsE+aACol22I9ts/UMTuAkD0itU2qPRFgTurabImv4WsC5q4vr7x14EfumF5DR/ujMPIiw/ilbqyb9d0wmcsSpvjDEPE4j5hSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nmBsh5zrMKkZtCt8fxvpPqtR4tgMWNNviKR1Be/Rwwo=;
 b=f/xwff+RtYBBLo7gvjBLWr8VOIhr/EVg9MLiHilL7KrVo6t1prLX4t1qyFrIphBZhYZmfCaA8yq+Mzl48/lL75kYEBf3wD6aD83vWhSnHvjqAJTFSpbrVNoCQ8QSnmnjod02G8WatlI7+DQKk4kKl+uaIA6/ZCl/kNgkLAT5KPIb3jNf7I0zRqDsuMvJ3nUzcHlLiyggu7A8vInikmM68CM3tYT7wucqp8Hz4A/kfQla09jMC7vK5leBg9RF1T7YNefkamJax+j01BOFOm6rYbFJ6nMR813OVDIJBX2zhi5pZ+/lCoNx1CqE5eIRA87Sj3vmosePrMdlNeslH9tFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmBsh5zrMKkZtCt8fxvpPqtR4tgMWNNviKR1Be/Rwwo=;
 b=x6SE97RBbksIxFpa9UIbD22d7mAj4zsECDenI76ZgeIPgw+2mIFGbVjtVeRoYci978Dc9vSg8Mcz85oBw8Kd5BckmiBB3cuA9m9bBNheHejnd3it6uxJtgEKZr4PsXyRBHWAiP5A7ff37V0+F4+48jF1ZZ+GkvjoakvO+Od/j2g=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 15:00:13 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165%8]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 15:00:13 +0000
To: =?UTF-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>, Andrei Kartashev
 <a.kartashev@yadro.com>
References: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
 <27ffb02323b8be39e1e92b37fc3cdc35857312b8.camel@yadro.com>
 <2BD99E33-F582-46C5-855F-942532F79FCC@gmail.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Ipmitool command & entity-manager question
Message-ID: <5072b23d-8165-19a4-f0e8-946a31e22285@intel.com>
Date: Thu, 30 Sep 2021 08:00:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <2BD99E33-F582-46C5-855F-942532F79FCC@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8oG2YeRgtqrs7hdB3uhQT0P4QFNm0ep9V"
X-ClientProxiedBy: MWHPR19CA0067.namprd19.prod.outlook.com
 (2603:10b6:300:94::29) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
Received: from jmanteyx-desk.jf.intel.com (134.134.137.85) by
 MWHPR19CA0067.namprd19.prod.outlook.com (2603:10b6:300:94::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.17 via Frontend Transport; Thu, 30 Sep 2021 15:00:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03fb14c-d993-4d8d-441a-08d984230162
X-MS-TrafficTypeDiagnostic: SA2PR11MB4937:
X-Microsoft-Antispam-PRVS: <SA2PR11MB493762397DAB62269FB40669E2AA9@SA2PR11MB4937.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12qyJCq9PvqCoG7QZjWHmdryV1RQkPUWrlzNquP635jCohcnbj8N/tAubnGqXJPd8QqTxBhRcDAF0bMCTrgjaszVeJhmmRU5YKwhtFrNFCNaXh7GUwZLkUuUePo20FXff0nWHMSKcasEuVNbtAn2+/i/Gh4viivzLWtX4CdL0Am81YzKkORujtTrlDpYe+9KadvnzNvnJeI4UYjlw49pEKiuvnK6/wnm2CyRHR0Hkcisl5R6fsp/3pdW+6v9U0fYfaz2EuJKHjKP2qnHIY2uDKNX4irKANT2WeLrvGPCblwJxmR7PHhvul5UbiaDj53MOIsIM4c/xkSaApkZx8jFJLybziLVsWAsTwrIgqV1c92/OH/uEne5VN1+MX7Mp0k8yCMYu8YGTEz0VxhzJIG8NqYV87MwD6AUWcgjlcN4ky2cJIR38GvNDQNkJqS0n99UlaNfGBOsFzx8l2n9g6H5nS3DDy8iqubBeDTD6vPXVV48anX2hV0ei1QjMy4FKNCVEwQqP3zlPwVsoEpwZ5Y02GSqe+a3msTdDzDAdHUM4X/tmCjrsvJsSiWYUizBhwIQ491+QfBLHZ76C7plCxlUp3D5KfrFVgkjnf++30yfATh8iDQRogm83hjzzqZAs0LTV9X8Nvo9A4Yd/e+CZOeLW3auXhIYkOt1kcEOtIj1079keAnQe/cXALzf0omotxa7WOiCYLG4qmsOigni5Md9wfuFlijsjP0pu4gr6Jlp/p8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(19627235002)(86362001)(31696002)(110136005)(38100700002)(508600001)(8936002)(21480400003)(31686004)(4326008)(316002)(66556008)(53546011)(8676002)(6486002)(83380400001)(26005)(5660300002)(186003)(2616005)(956004)(36756003)(66476007)(33964004)(235185007)(66946007)(2906002)(7696005)(40140700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amhZdnBmMGc1bWpjOHdsM2Q3cXM2dFFucUtMWkRwekJqYmxsSWdHeVRvSlpI?=
 =?utf-8?B?NGtqTnRqWGl6T0NNdjRjZCtjSlRUbis1UHRpbmM4NVFUK2FFdWM4ZXo1N0ta?=
 =?utf-8?B?VldWdVVsSGpJZCtUVDV4cmlNN1RyYVFXU1lPa2pEbDJyZXlhM3QvcENGVjE5?=
 =?utf-8?B?VVM3SjVXbGJCSVYzTE9IU2xKQW52L05aMUtPam5NRGpvaHFDTlAveWNucnJM?=
 =?utf-8?B?L1hqVEJmK3ZhZUE5SzlhWnlWd3djd1FPamtIakh5RzhjUld3SkgxZXEvdHlD?=
 =?utf-8?B?aGtLc0RqK3llczF5bjQ1bzArb3B3TCsrN2N4L2hkUzlHSXBHamNsRWRmU3ZU?=
 =?utf-8?B?NDRDcVZwMktOZnZaMzRsTGxJM2h5UkYvTHFrdGVUdHcxZmpBdWRjZVcrT0d6?=
 =?utf-8?B?T2N2M08yRFFzN2FJMHpobFkwdTNOQzRWVStOaCtlZWFMdXdPWXRPVUJKWEFB?=
 =?utf-8?B?MDQzWGlGaHgvdDBYU0UxRXlPUEcxVXNJa3VDNlhkdndBdjFFRE1QdkgvNHdz?=
 =?utf-8?B?bmFaWGs4aEYzNjFmZkxVQ0FhTXIxaDcxb01OeHoycFhhZDc0TDk1RnVLaWV0?=
 =?utf-8?B?K1pMbGpPRlZNZEoxK25ja3BEdWxRVklSNlVEbVNyUjMrZG5HS3J0aVJjck5L?=
 =?utf-8?B?TnVab0FvT202ZXdVaVlQditQL1BGSGxHVHRHVEhGQUNyZkRXUFhZYktmcmoy?=
 =?utf-8?B?WVljeWlvZmg3NVJ6T1kvMUZ3cTZxOWpiOG9qK01sY1Q1TTdEMElCcitpRjFl?=
 =?utf-8?B?amp2WlpGM1FPdkQ2WFc4SVZSVk0vZVVVeWxhSmF5U2Q2T09tWklqV3hEUENp?=
 =?utf-8?B?UWtnMjhNYkJyd3AzQlJvY1BNRHF1aDlWOEl4Lzg3RnJPRnVDem9BbVdkVFBH?=
 =?utf-8?B?WWZEc0w0bVhicW55a3VyOFhiZ1BtckRvZzJ5dE8zS1ZhTldrZldBMmhCL0pp?=
 =?utf-8?B?SE9jN21PT09VbHdZakM1UDRXRDUvbkhZaTNMU0Z1bk5lUDNGWXA2TDV1c2Nu?=
 =?utf-8?B?TVJMZ2pvb2UwYm4raGRoVkNBWGR5Skp1VHJyOGZjK056UnpFN2YvWm5kN000?=
 =?utf-8?B?ZG45MmtNYmlsWUxpZGlhOXdUMkltYWU2aGNDR0xTeWFJZS9Xa09yVEtwS2tu?=
 =?utf-8?B?Q3YwSHJLMGhHVS93NUo3MllHeDZldnZsY0hENVZIM3VzMm9sSVpwR2hHVTdU?=
 =?utf-8?B?cnVjU3AvK2dKU3oxK2xHakovM0NuaFdEaWxPL3BkTkJzbXlOZUJyWWtLNVZN?=
 =?utf-8?B?Q01CazFTM0hZdFJOcnNlVHBrNWFrR2RXNnJCaThPeDQzeDh2MlVySS9RVmE0?=
 =?utf-8?B?SGtHalhFUEU2cEprMHhUZVc2YjlvbE00Yi9QMEkrOGRsTDhlMlRlWXR6TWIw?=
 =?utf-8?B?WkxDQ3YxcStIR1p0MXIwOWtvdmI4cFozQzlBVGFPM2IwdUpVV3pSQXJnOVF0?=
 =?utf-8?B?U0NzNkk5R2lrT3BGeTVDWWZvVTJINk1LcGxZQXRlOTdiNGFWUGRGL0lXMHBX?=
 =?utf-8?B?azM3bGRiT3ZmRy9qbGc1QW1QUTFqM2l1a2NCY3ZrWFN0amlqckRZeEdTMjZ2?=
 =?utf-8?B?V250eXlRQXkvRUxNNUN3TWNVTmNheDZBcUZHWXlEWTluRkFFdmp5LzV3a1pn?=
 =?utf-8?B?WjVoZXRTVkQ5WENzRklJdm9xRW9wTUc2aDNUN2dGVUxzTlBaTDBJQVhJWGha?=
 =?utf-8?B?SWpDTXpjV29GdFFJY1VkK3Evb1A3SU53SnFIUG1aMnpEd1pOOTJWMmQzTWZG?=
 =?utf-8?Q?DylwOMYYqNgJYMZHuAWKxTrUAEV3M8/jCc2iAMo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e03fb14c-d993-4d8d-441a-08d984230162
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:00:13.5019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3PdLCZAOHZACeY2h2s6qgrBaTxpwbCxLn9uRByMZcry3n+t+oLakdr85du17lIJl1XYjXsNUTuIRGjE/ieZodT/US3c9HOVJgv4rkCDSo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-OriginatorOrg: intel.com
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--8oG2YeRgtqrs7hdB3uhQT0P4QFNm0ep9V
Content-Type: multipart/mixed; boundary="x46lcUdxc0ZeD8gpbTNFLnN98v1gmHTMW";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: =?UTF-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>,
 Andrei Kartashev <a.kartashev@yadro.com>
Cc: openbmc@lists.ozlabs.org
Message-ID: <5072b23d-8165-19a4-f0e8-946a31e22285@intel.com>
Subject: Re: Ipmitool command & entity-manager question
References: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
 <27ffb02323b8be39e1e92b37fc3cdc35857312b8.camel@yadro.com>
 <2BD99E33-F582-46C5-855F-942532F79FCC@gmail.com>
In-Reply-To: <2BD99E33-F582-46C5-855F-942532F79FCC@gmail.com>

--x46lcUdxc0ZeD8gpbTNFLnN98v1gmHTMW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/30/21 3:13 AM, =E5=90=B3=E7=A7=89=E6=98=8C wrote:
> Hi Andrei
>=20
> My question is that I set MB_P12V "upper critical" is 13.23, "upper non=
 critical" is 12.6, etc .
> When I login web page, I can see the setting what I want.
> But when I use =E2=80=9CIpmitool sensor=E2=80=9D command, the response =
is wrong. Like below
>=20
> MB P12V          | 7.215      | Volts      | ok    | na        |6.386  =
   | 6.723     | 7.429     | 7.829     | na
>=20
> I am not sure am I miss something.
>=20
> Thanks
> Paul
>=20

ipmitool uses SDR records to calculate how to translate the 8-bit sensor =

reading into a value in range.

For intel-ipmi-oem the SDRs are generated on the fly, with most being=20
Type 1. The Type 1 has a M, M(B), R, and R(B) value that is calculated=20
from the values in the JSON. The code inside this section uses several=20
of the entries in the JSON to generate the M and R values.

We were recently bit by this calculation, because the calculation used=20
the "worst case" values of reading(min), reading(max), UC, and UNC, and=20
combined them for the M and R.

Somehow the UNC and UC values were outside the reading range, and the M=20
and R values were calculated in a way that made the sensor output=20
incorrect as displayed by ipmitool.

You may want to investigate if the SDRs are correct. Use 'impitool sdr=20
dump sdrs.bin' and find the SDR for the sensors of interest and see if=20
the M and R values are sensible.

If they aren't find the code generating those values and identify how=20
the values are created. Adjust your JSON as necessary.

>> Andrei Kartashev <a.kartashev@yadro.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E4=B8=8B=E5=8D=886:03 =E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> Hello,
>>
>> What is your question exactly?
>> If it is about precision, then you should take in account that IPMI us=
e
>> 8-bit variables to represent values and some coefficients which
>> calculated based on MinValue/MaxValue parameters of corresponding
>> Sensor interface.
>> You will never get exact values in IPMI, unless you values can fit to
>> 8-bit integer.
>>
>> On Thu, 2021-09-30 at 17:07 +0800, =E5=90=B3=E7=A7=89=E6=98=8C wrote:
>>> Hi all
>>>
>>> I add the sensor in entity-manager config like below
>>> {
>>>              "Index": 2,
>>>              "Name": "MB_VMEM",
>>>              "PowerState": "On",
>>>              "ScaleFactor": 1,
>>>              "Thresholds": [
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper critical",
>>>                      "Severity": 1,
>>>                      "Value": 1.32
>>>                  },
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper non critical",
>>>                      "Severity": 0,
>>>                      "Value": 1.26
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower non critical",
>>>                      "Severity": 0,
>>>                      "Value": 1.14
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower critical",
>>>                      "Severity": 1,
>>>                      "Value": 1.08
>>>                  }
>>>              ],
>>>              "Type": "ADC"
>>>          },
>>>          {
>>>              "Index": 3,
>>>              "Name": "MB_P12V",
>>>              "PowerState": "On",
>>>              "ScaleFactor": 0.23,
>>>              "Thresholds": [
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper critical",
>>>                      "Severity": 1,
>>>                      "Value": 13.23
>>>                  },
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper non critical",
>>>                      "Severity": 0,
>>>                      "Value": 12.6
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower non critical",
>>>                      "Severity": 0,
>>>                      "Value": 11.4
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower critical",
>>>                      "Severity": 1,
>>>                      "Value": 10.77
>>>                  }
>>>              ],
>>>              "Type": "ADC"
>>>          },
>>>          {
>>>              "Index": 4,
>>>              "Name": "MB_P5V",
>>>              "PowerState": "On",
>>>              "ScaleFactor": 0.55,
>>>              "Thresholds": [
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper critical",
>>>                      "Severity": 1,
>>>                      "Value": 5.48
>>>                  },
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper non critical",
>>>                      "Severity": 0,
>>>                      "Value": 5.24
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower non critical",
>>>                      "Severity": 0,
>>>                      "Value": 4.76
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower critical",
>>>                      "Severity": 1,
>>>                      "Value": 4.48
>>>                  }
>>>              ],
>>>              "Type": "ADC"
>>>          },
>>>          {
>>>              "Index": 5,
>>>              "Name": "MB_P5V_SB",
>>>              "PowerState": "On",
>>>              "ScaleFactor": 0.25,
>>>              "Thresholds": [
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper critical",
>>>                      "Severity": 1,
>>>                      "Value": 5.48
>>>                  },
>>>                  {
>>>                      "Direction": "greater than",
>>>                      "Name": "upper non critical",
>>>                      "Severity": 0,
>>>                      "Value": 5.24
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower non critical",
>>>                      "Severity": 0,
>>>                      "Value": 4.76
>>>                  },
>>>                  {
>>>                      "Direction": "less than",
>>>                      "Name": "lower critical",
>>>                      "Severity": 1,
>>>                      "Value": 4.48
>>>                  }
>>>              ],
>>>              "Type": "ADC"
>>>          },
>>>
>>>
>>> I use the busctrl command to see MB_P5V_SB information, it is normal.=

>>> root@fws7830bmc:~# busctl introspect --no-pager
>>> xyz.openbmc_project.EntityManager
>>> /xyz/openbmc_project/inventory/system/board/FWS7830_
>>> Baseboard/MB_P5V
>>> NAME                                              TYPE      SIGNATURE=

>>> RESULT/VALUE         FLAGS
>>> org.freedesktop.DBus.Introspectable               interface -
>>>    -                    -
>>> .Introspect                                       method    -
>>>    s                    -
>>> org.freedesktop.DBus.Peer                         interface -
>>>    -                    -
>>> .GetMachineId                                     method    -
>>>    s                    -
>>> .Ping                                             method    -
>>>    -                    -
>>> org.freedesktop.DBus.Properties                   interface -
>>>    -                    -
>>> .Get                                              method    ss
>>>    v                    -
>>> .GetAll                                           method    s
>>>    a{sv}                -
>>> .Set                                              method    ssv
>>>    -                    -
>>> .PropertiesChanged                                signal
>>>    sa{sv}as  -                    -
>>> xyz.openbmc_project.Configuration.ADC             interface -
>>>    -                    -
>>> .Index                                            property  t
>>>    4                    emits-change
>>> .Name                                             property  s
>>>    "MB_P5V"             emits-change
>>> .PowerState                                       property  s
>>>    "On"                 emits-change
>>> .ScaleFactor                                      property  d
>>>    0.55                 emits-change
>>> .Type                                             property  s
>>>    "ADC"                emits-change
>>> xyz.openbmc_project.Configuration.ADC.Thresholds0 interface -
>>>    -                    -
>>> .Delete                                           method    -
>>>    -                    -
>>> .Direction                                        property  s
>>>    "greater than"       emits-change writable
>>> .Name                                             property  s
>>>    "upper critical"     emits-change writable
>>> .Severity                                         property  d
>>>    1                    emits-change writable
>>> .Value                                            property  d
>>>    5.48                 emits-change writable
>>> xyz.openbmc_project.Configuration.ADC.Thresholds1 interface -
>>>    -                    -
>>> .Delete                                           method    -
>>>    -                    -
>>> .Direction                                        property  s
>>>    "greater than"       emits-change writable
>>> .Name                                             property  s
>>>    "upper non critical" emits-change writable
>>> .Severity                                         property  d
>>>    0                    emits-change writable
>>> .Value                                            property  d
>>>    5.24                 emits-change writable
>>> xyz.openbmc_project.Configuration.ADC.Thresholds2 interface -
>>>    -                    -
>>> .Delete                                           method    -
>>>    -                    -
>>> .Direction                                        property  s
>>>    "less than"          emits-change writable
>>> .Name                                             property  s
>>>    "lower non critical" emits-change writable
>>> .Severity                                         property  d
>>>    0                    emits-change writable
>>> .Value                                            property  d
>>>    4.76                 emits-change writable
>>> xyz.openbmc_project.Configuration.ADC.Thresholds3 interface -
>>>    -                    -
>>> .Delete                                           method    -
>>>    -                    -
>>> .Direction                                        property  s
>>>    "less than"          emits-change writable
>>> .Name                                             property  s
>>>    "lower critical"     emits-change writable
>>> .Severity                                         property  d
>>>    1                    emits-change writable
>>> .Value                                            property  d
>>>    4.48                 emits-change writable
>>>
>>> But I use "ipmitoo sensor=E2=80=9D command, it return the error infor=
mation
>>> below as
>>> MB P3V3          | 3.271      | Volts      | ok    | na        |
>>> 2.947     | 3.046     | 3.511     | 3.596     | na
>>> MB P5V           | 2.982      | Volts      | ok    | na        |
>>> 2.662     | 2.829     | 3.123     | 3.264     | na
>>> MB P5V SB        | 5.048      | Volts      | ok    | na        |
>>> 4.484     | 4.766     | 5.245     | 5.471     | na
>>> MB P12V          | 7.215      | Volts      | ok    | na        |
>>> 6.386     | 6.723     | 7.429     | 7.829     | na
>>>
>>> Please give me some advise.
>>>
>>> Many thanks
>>> Paul
>>>
>>
>> --=20
>> Best regards,
>> Andrei Kartashev
>>
>>
>=20

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--x46lcUdxc0ZeD8gpbTNFLnN98v1gmHTMW--

--8oG2YeRgtqrs7hdB3uhQT0P4QFNm0ep9V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmFV0PoFAwAAAAAACgkQOcg9x5uaKcA7
Owf7Bbe5Sd9J+u55bwSjmrg92a0Br9KlHA+zVsvcKpSRpZ4z3l9P0DgkB0sDAADxDBFEDxi4Cnz/
p0sg87UiB/2TR/sqdvZTETcUVBlosqz3V1uvD46cc0KzdauwHe9dEK+RhknoueTES4H15SSzoMv8
U+5eTRsdZ41crRyg+i9WPkL03K0Ow5IUfbekhvMfsegokx206e+NX7ZAknOBzXvzogMGHVJ6WHvo
MSHWOHH4Cz3qbim7tPLXDXUPrJ3kjpcZ3lRAt5igW5Zwten6nhpbWiLNK0gk3YJ8mPtBmniWXZvz
jtsGzLBJIKoilCXxbGV8Yv+0Ax5728zgcoIdvWGdIA==
=VRHg
-----END PGP SIGNATURE-----

--8oG2YeRgtqrs7hdB3uhQT0P4QFNm0ep9V--
