Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C213A40C797
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 16:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8jVt4F3kz2yPT
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 00:37:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=UH+2x55n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=UH+2x55n; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8jVK1fqLz2xZm
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 00:37:27 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="202502546"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="202502546"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 07:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="583308281"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 15 Sep 2021 07:36:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 07:36:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 07:36:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 07:36:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 07:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJr0mUDkPPGZuIuXteZH4y2sg39ffMNKlJXMk74PBq/ceMz28EzK0Kfk4UbIbM8/J+MKo0BZ54Z0UNeyLOmfLURTJcoNuYN++WwwoDXspJnRXsczUudqosHODJkH+/TlyZ5d2msGN4OAE9jAXP9gPyhXktDiIRdf/IVhfSSO6Ga9PGA3AokF6rbd78CGTxkz43rYtPbejtbI6gKhC3y6Z75MgLtRHA7lPl/ETXdqzcyqaqp5IgjT3U58Ob8DHORh2r+v1YR7ylrb2ZHRrghWVKENLst5o++N+v4C/CTDdoDbmes1mIS9eF3nhDTPi2DrBJ0AzUdfUchfAyzKXCQZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3bKVjfXx4OBUqi4qM4oGbmo1O1o75h5Zmn3NZLHCcWs=;
 b=Y51LpopPzKP6rLY2oKVJ0Xf5Ihx80VaQEEBuygfXpjGxp8Ow7DRlsDOnNaQ2hiGo80/fu08dZSTHZx9JPrJw5GEn87Bkcn1U3bG2/zyhjURDBvxw8mNNLTWLFdhb1VFZWmRtovLUwsNqIHmQIEBeyoR61ydXYFtk9hxIiz5j3KFCF8XuHlZwMKxU+4RnVNE/e8j+mDS+bRQ0+dQjM5y4yEHUuoqVuQcQBnHzEqWXnfzZDcefadIwCb0PAyzuQOs8XT+ZIEdyJMuBGBwXPQyF2UOz0kh4lS0B2lx5RbBhD9MLWq3zzcvMR5BgFKZgocdUBpCAslpi7M++E/XqfXcBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bKVjfXx4OBUqi4qM4oGbmo1O1o75h5Zmn3NZLHCcWs=;
 b=UH+2x55nlr5L7Wkbtaq5WvI/FaC3Wf3JCgUtoZ8MV+EfHfk20Nl4VyorkXgbS4ZhiwpAJX5m6ZDFKy+LR+tLbvX6w4rmH6amc9EbPTWF1VWiHggQZQMDmxHO6uBNF458/o/m2rfNKDYmCMIKfTAdnTq3tUIcTawDKUMQccOqs4M=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 14:36:16 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 14:36:16 +0000
To: Heyi Guo <guoheyi@linux.alibaba.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>, Tom Joseph <rushtotom@gmail.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
 <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
Message-ID: <a14d0f4f-d114-644e-1e09-9a2c3a0a46ac@intel.com>
Date: Wed, 15 Sep 2021 07:36:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RXygTLNHwnbMqrWOadrSLjskZxQlvdTo3"
X-ClientProxiedBy: CO2PR07CA0080.namprd07.prod.outlook.com (2603:10b6:100::48)
 To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
Received: from jmanteyx-desk.jf.intel.com (134.134.137.85) by
 CO2PR07CA0080.namprd07.prod.outlook.com (2603:10b6:100::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 14:36:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2028aa-e2ae-4526-65f4-08d978562c8a
X-MS-TrafficTypeDiagnostic: SA2PR11MB5177:
X-Microsoft-Antispam-PRVS: <SA2PR11MB5177414E4C99F04C036A7BB2E2DB9@SA2PR11MB5177.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQRwkHeptKCeTXB/583TznQKC7j5Bek478zzgKRwaIliltpYVuBGE9Yh1ASbggtKVB3iXjbIjkQq9G6NXt+ykCDiI5l5eVkzgkjqUoQGc0Qe7XAiOuSZDdhnThCnnEAXR4/Sbqixp90ubWHpJsQkm/BjwOSPcyIEhQ6vE8/hXis1OMAhhTuJFFArp6FUeI2snu8PzjuGLcy1bp1Wsv0BZmOzad+5+f2mph2KR3vBiyEgURrAxdGa5IhibQinFIOU2uXvXULA41mcw+WcjOLtqWTd8MbVKiJrPfkbMCGhavmqnA9GF2/rZ6OI/3kH1VfAAOHKwRvA63HAGMmMztbHqvDu6EPWNZJwDOP4ETQU8PbR0k4U2Ai6ixn4N4okbsyIzhBjs90Tr5FrKMzP6LKKyd2vuiz1xesCwCyHW4rlbPl1mC749VL3BQpetm2c5bFvjNPiWvs90kbcQO8/JkwDBcP43MBQJKDesUOj5Ji5ixxUb1uuoN3xZSOhF8spzOvDpcEhcPu2wEc/k1wQv1oS9BTvBVosA8mgwNxcEbf6H130KHCasd0LtvvdRc8HB0KGjlMjoX3acZrMAR+D7GE/v6NhTWKsvGLC9OUY3E6gW9nvVnKsMIySh+jsl4EDROrx3oUQ+Lbyblta4GKJ7fLVOEW4ZgB649/LOKWdXGGqnREtikH6veXcRJhfTemkaR7bnrOeVDTNjB7OYC2m1eBlBkZr3SOi78xsv7BBDduxnkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(8676002)(2906002)(4326008)(33964004)(38100700002)(8936002)(7696005)(53546011)(316002)(31686004)(6486002)(478600001)(235185007)(110136005)(5660300002)(186003)(26005)(66556008)(2616005)(66946007)(66476007)(956004)(31696002)(21480400003)(36756003)(40140700001)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjQzK3N4VEFONUNvR2orTVhTSTBkS2VweUVUbHhPeHFObVdwUnVwU3RzdVZH?=
 =?utf-8?B?cjk3dERKSS9Ud2lMVWVMdGR6ZkNRUTBhNVNJSktCQkQwaDJBTUY0cWlQbmcw?=
 =?utf-8?B?RU9wL0o4blprNjlNUUt2Q2NaREcrdXlPajBUVnBOaGx1SXp2NUZ5Mm4zQ1cz?=
 =?utf-8?B?Z2tqcFg2WndIVHQ2NWRKT3J2YzEyUU4rRWdPKzFKZk8rNGlBbXl5dlBxam1m?=
 =?utf-8?B?RXVPOXJYOW5kNEJraDBUQVFkNzFzZUNVY3M4OEVkRVNtOEdORFhlTktUUll6?=
 =?utf-8?B?M3F4QWlReGVtWmxMaDBkblRuc2tjUDJKY0ZVMjZ5R3k1REpwdjl0VFl4VjZi?=
 =?utf-8?B?cjZUNkE3QzhvRXRDZWJtT1dIMG1sN1dtYUZxRE9nS2p2WmV4dy9YTVdXOWZr?=
 =?utf-8?B?VnQzeTN1MkdwOXFXNUFzWmhHWnRQK09wcUkwUFY5YXF3MHF5NVhCcnFqTURL?=
 =?utf-8?B?VmcyRm4vNjYyQ0NvMWcxTTFiNEZIYUJVbjBST3BZYXU3Mm9saFlTL1VkRUJV?=
 =?utf-8?B?c0tpK0IwcWs3d2N0UHpWOC9FMnpldTVid1gxdmpJTEZPNWVGSDZ0RHlZYjZo?=
 =?utf-8?B?cEpYT24wZXRhNmhjS2FRZGJ0dDhHZTF5NkhjOTFUVnI0NCtmN2gvWlBKTUxC?=
 =?utf-8?B?WkY0UUpqQU1JU3VvbUhqWG1HYUtVbXd3bnJlVHdiYmhNazhIUXJTODRxdXVF?=
 =?utf-8?B?dldsbW5WUlRjNjJZUUk0MFptZ1pReE94OTQ5ejBnYmQyaFI5dkdjUFBURTRo?=
 =?utf-8?B?Z1BkdVI2eHlNVndGS3hZenp4RVM5dVdkWVhQSFBicDMrZklnU3VHaDk3bUJ0?=
 =?utf-8?B?WjlpNUowdGhwQmk5Q1JOeTFvbEdKb3BPK2Y5QXpzLzUzTjhxZ1QzUmpVYUxh?=
 =?utf-8?B?M3hkYXNRWFl1dXZvSDk2K1lBSzNOa1c4ZDUxVk9BNmJ2TFFVaFFPamVZcFRu?=
 =?utf-8?B?QlRwdVVoL290OG1SVmxDVkNWblVsUTIrRC9LOXd5V3p3TlFZUGd1aG1GSXky?=
 =?utf-8?B?QmRDYmhBRU9WalRiVVRoUWowV0JLdUxUNEtJMHpieVlLTDYzRXhvdzgyUk5Y?=
 =?utf-8?B?cXh4QXZXRWp0aTR2WDJKTkJqeEkwUGtBWEtNMHNYOWwvdFlTQThMdWJKUm9M?=
 =?utf-8?B?RTd5eE53bytIenZrTU5Zd0xIUHBOak82WnJBTDBOL2VlMGZjR0loK3N0dnFt?=
 =?utf-8?B?YzhFTjhSdFJRSkFRL1dqSHVyK2Uvei9xQ05Ta2IwczdwcGRtRG1jOTZGVUxy?=
 =?utf-8?B?Skl0VWdUOHp0M3JVcjA3aXE5TWdaMUl6UjNTdS9GN2FId3IwOTh5eG1LenI5?=
 =?utf-8?B?dDV1dmhJV1R3VDl1RHVwVVI3a3V5em5GdzZmUHBGTlR5QXBZVGU5cXpPdmtU?=
 =?utf-8?B?emFaOXNGTUxJRkxIL1M2YXIxZzNtNm51NGlIWFRLeUVMLzczM0NPbHFBZnZI?=
 =?utf-8?B?NmdWWEplSU5taUc1aWM5WFFCb3lXRGZLcmhNdXNiY3JtWmJlR2pXeUtYbGdx?=
 =?utf-8?B?eDlWaHRiSVRxS3d4a1NzMXNvUVdvVEhPU3Vsa3pwYS96bGQ1ejc5bUpwRE9B?=
 =?utf-8?B?dTJFTHlha2VGc2s3a1k3VGMrRmowM05RZS9KWHZtc1pXS1U0cDl6ejVaMTVu?=
 =?utf-8?B?Q2lubEgyRUF3bXZxejJVV05SRWsxWjBLcDRGc0NKZlVUMXc5SmJUN2RGTkds?=
 =?utf-8?B?QW9va20wUkdEclREZ1Y2WDlqaVpYeWF2cnlGL2JxNzduTEMzaGtubjE2N3BP?=
 =?utf-8?Q?Ufl88sig3gXJLrWBzw7ze7x1dID25tOwpe7Cb07?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2028aa-e2ae-4526-65f4-08d978562c8a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 14:36:16.0768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQH8GI290d5ElBd6DIQTHOcm7mHGE7VSvAYpepwxOHMMJgxOJk0d7LIGzTAzEdbqelB1MbA/zGQ64RSKqfbHm6yYdRMRIxC8vPCCjdMngxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--RXygTLNHwnbMqrWOadrSLjskZxQlvdTo3
Content-Type: multipart/mixed; boundary="PsrUil53TPuDAKyRwbVOwcXpUuCq9eQLO";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <a14d0f4f-d114-644e-1e09-9a2c3a0a46ac@intel.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
 <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
In-Reply-To: <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>

--PsrUil53TPuDAKyRwbVOwcXpUuCq9eQLO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/14/21 9:57 PM, Heyi Guo wrote:
> Hi Johnathan,
>=20
> The code in dbus-sensors will translate sensor name by replacing space =
"=20
> " to "_", e.g. ADCSensor.cpp:
>=20
> 53=C2=A0=C2=A0=C2=A0=C2=A0 Sensor(boost::replace_all_copy(sensorName, "=
 ", "_"),
>=20
> Then in phosphor-ipmi-host dbus-sdr/sensorcommands.cpp, it will try to =

> revert "_" back to " ":
>=20
>  =C2=A0419=C2=A0=C2=A0=C2=A0=C2=A0 std::replace(name.begin(), name.end(=
), '_', ' ');
>=20
> The first conversion does nothing for our case, but the 2nd conversion =

> will unconditionally convert "_" to space " ".
>=20
> If we don't really forbid to use "_" in sensor names, I think we'd=20
> better replace space " " with %20 in dbus-sensors, and convert %20 back=
=20
> to " " in ipmi-host.
>=20

Rereading your original post you were having issues with sensor names=20
you explicitly had "_" characters, and the line on 419 turns it into a=20
blank space. The underscore character is overloaded at the D-Bus level.

I expect there may be an issue with my proposed solution, as D-Bus is=20
probably not going to allow the use of the '%' character. A solution=20
that fits within the D-Bus naming rules will be required to provide a=20
reliable encode/decode scheme.

<snip>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--PsrUil53TPuDAKyRwbVOwcXpUuCq9eQLO--

--RXygTLNHwnbMqrWOadrSLjskZxQlvdTo3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmFCBN0FAwAAAAAACgkQOcg9x5uaKcBg
Nwf/eSVCCt9WXlB9W37RAFfs+U1uSREfkzrtAZw1FPUAPgk6fxVha3upLF28SOHzNohWUUTfnrBC
ivHsN5RPsYDacxH7l/BycQsM4NXuvEcuj40UM6/7pUTdcJLVWsUFaChd0HEatUP3+2NCjvuUs4lw
8pE5QCLzuvla17mbQrtlDMP01sEoL9y8qKXYFwes8vaybI0+zX8sX7kEgUSODADdGkEhaqw9cPfr
hHFM7q3Qdl86TR1xbTlj2itABuyza5WDWFzX6w2mFWxN66j+BZ/55aX9wNXIBShY+QuzFVmfMwy+
QVrICGs3iEpkgmz/pFxJkoQKnUGM5RQCAhknXUxKfg==
=vIxu
-----END PGP SIGNATURE-----

--RXygTLNHwnbMqrWOadrSLjskZxQlvdTo3--
