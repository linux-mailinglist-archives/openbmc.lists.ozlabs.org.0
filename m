Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E109643BB40
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 21:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf2c36Sm3z2xDP
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 06:55:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=dC/s2fc2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=dC/s2fc2; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf2bZ2gzrz2xDP
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 06:54:48 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="293463860"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="293463860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 12:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497511537"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2021 12:53:45 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 12:53:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 12:53:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 12:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmMqwc+wj4ObpMyf/01v3eXv1EQCIjFS2kGwONUebZAbwXipBBVZGMJ5mmq8Pbep7Day7om03BRaulLybUFm++781Vh2eWBEgKmxuX8AkptECaDQ+8E43vyUExi9pCdB0Yt0Ltwk3+/cTTR37qQhuFcNi19+CFqVirkTBw8mZnWrUyTQ/C6MtItyGTOrtrUm+XzQgJtsr+9J+mpjJ/MG2jwo5TFqh/4Tis1sUj8EZUWUwL7WHfQOoda79vRIBKVmEEFj4EYI1jOu5NcV4IlFTpETHy9roq4FiOoymvvedpFFrJPl1I0r9lBaUe3ipVK5NZjWa3oJZv1OFCghNbky3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZIlZEPDDxeV6+K6zFZ/Ea33YaDMV4SxmRXnLRNfIlE=;
 b=b06FU80oJKH2mwFCyFwKXhLMr5abjMtkx6DICDw1z5hVGKAeFal9B9/wpuqk84Wu4O3oOs8gGU+cUR+ksZOoyqMtKZiJCHp3tEG+d1x7qpOBcK+bPKzOk+PBWY0NxI5jq+QlRY0nNPtM1hxtfKHE648OjeiWw8x7AUQTfz6y9xho9pE72TvXJ3RmXphW55k5RE9ySqpNYvNgVikCdNcHGy2HoBcWlIPzkUupAc2wJG+D3PGW2UHQYvhMB34Nt0822UzRsCcX6sA3KBch5nLiecJKfS2mfW+saK87iDnmwcnsU7Yy5Bioro61eBX51MKbcmM3YwdiAM+EuTBveNPymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZIlZEPDDxeV6+K6zFZ/Ea33YaDMV4SxmRXnLRNfIlE=;
 b=dC/s2fc2f45xGfUIBdQ0LzSFcvWsYiYagFIRTl/h0e8qyti629s7TWQbAEHRqs4sthfHPJF5VmyHDpY5mvL86/3Z3J8MD4Jln061f3DqkFIqC46+8IM8I4KNJ2peasCcknkqP1YrnlR2FqrCwOF+af+stuwYr0e3hPtuqFfy/Sc=
Authentication-Results: keysight.com; dkim=none (message not signed)
 header.d=none;keysight.com; dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 19:53:44 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165%9]) with mapi id 15.20.4628.023; Tue, 26 Oct 2021
 19:53:44 +0000
Message-ID: <d35dfb3e-608b-96a0-f026-6d6063121bb4@intel.com>
Date: Tue, 26 Oct 2021 12:53:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.1.0
Subject: Re: cannot ping serverip from u-boot.
Content-Language: en-US
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <SA1PR17MB4593DE25C67A9229F65DEF4196849@SA1PR17MB4593.namprd17.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <SA1PR17MB4593DE25C67A9229F65DEF4196849@SA1PR17MB4593.namprd17.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pQCOymJ7xVv6KqwD4pW2SCrW"
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
Received: from [10.54.51.75] (134.134.139.85) by
 MW4PR04CA0159.namprd04.prod.outlook.com (2603:10b6:303:85::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 19:53:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70fcbe74-836d-4b2e-4750-08d998ba5136
X-MS-TrafficTypeDiagnostic: SA0PR11MB4767:
X-Microsoft-Antispam-PRVS: <SA0PR11MB4767B2872E95B3FDA44F8FECE2849@SA0PR11MB4767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BjMorgTMT2bRLT2ea9ctn/08AUUv/yKVZhowvim/AciNYlu05RUuvuhaO8Qxw/EU9ABw/d3ySPd1ojIZP/VtKkCtuUdrL0rNj/6OHdPDG3gj6CfJaq1Da9CAHFWK96JrO0dADEo8/HLVStcXqo9tjuQGGvAgD5NbkTK00hxcVeoRW/2VLpq16ygc+uD5QKiwIN+Ahrp0ZSzYcT2j8uaQJWk/H7UbyUfFyl0SloaLndjWnYlOclIBTAXmiQuEkkUYKoc5aqKgAzCgIycaa5Lm9vdhAHd8zes8f20gk10SiNTIy792e4jPGUAl9mMyNpXAJb3Ur+zLLCCwhQJB4XLYwTekMuMFCjrNd967bEgBajAsKsdFc9mR7xBPbYk4FQn3kKElSMX+XL5nRf0YMUejF3wG+3UW2zZ3pFCmjF2BvRRs72KNlieQjwQVKyRP7UUDy59sfI+/BwakGu/9liMZk43APfFPuhPp6k9BZy7reAgrL0MsJBapyFMyytxC2+huVSb8Inu8ZiZAp79mEu/zoe+yt6Z6JJzYpI9O42AqPB6hrM4pE0dI2IjlwlPlmN1YYYnlA/eVoNlo/DU/aeUcydV/f0ekK0LpHhdElpj/hHAx+Q5Lp2S425ITmUDrPkwxZtH/irfHpiWysPtV3fH3ct2FeHqPVYoPW41APigYHaJpSjF7jpic8RmrRlor5wFW11U2WmrIMYCFsu2+6/812vRhyZOcAy+94cmpQWQ/erM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(66946007)(186003)(2616005)(33964004)(66476007)(66556008)(110136005)(8936002)(956004)(36756003)(6486002)(38100700002)(53546011)(8676002)(16576012)(6666004)(2906002)(235185007)(31686004)(21480400003)(26005)(83380400001)(5660300002)(508600001)(86362001)(82960400001)(316002)(40140700001)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21QUHU0ZFBDMFZ4OW9SK3Z0WnJxc0VvTjhUWmNYbUlTN3NRM0szL0ZjVldv?=
 =?utf-8?B?QVFOblNINFVKSWVSSGpIWnhZcVZjVDNqVFdaZzg4bGtCc25EeGM2eFQ5Z2Ny?=
 =?utf-8?B?Q284bkxOcmdZRDdkaVVMb1ZIZ2xicGNUNk5FRm5rR3RTVzFDTVNrZThiS0lu?=
 =?utf-8?B?M0RqcXBYNlQ4S0FBU2VVc05wZHdYeGZNSnJmSU5yWW5JcFhISk1DNnRidWJJ?=
 =?utf-8?B?cXZXNUpVMk9OQURoVmNTV1d6eG83RzVMY3ZTUXhheHFBMkE1U0k3QkduSmZT?=
 =?utf-8?B?NnFUVGpoYlVZYmgveFMvTEdFMTlkRUpiWWFKem9ERXYvcThUb0plZ1lVV045?=
 =?utf-8?B?VjByVS9yaHN4OGM2T1A0U0dNck5Sa25QK2FESVdCeFV3bTI0Ukh5a3Y5OTNU?=
 =?utf-8?B?V1pTUW54Yk8rKzczaUwyMTNWZ3ZJazk5VHhpYVBjVlZWSUlmK2tXU0t6Si9z?=
 =?utf-8?B?LzFhZUJvSkVIUFQwQnBzWWF2Q3ZncU1TUWVWeDM4N2tmTThDZHEwdzVuQi9n?=
 =?utf-8?B?VGluMlVITXNRRFplTVB6MURvNklxWDhad1FFUFNhM1pFSTlBU3JrU2VBcyto?=
 =?utf-8?B?cjZCN21TdXp1RnBYWGpONElYZURIM3VHNmNDREhwQW54OU9wOTdNWDE2T2I1?=
 =?utf-8?B?ek1pNm00cVIyYmY5bHlVUFJnSy9XcDRUUEprMlkzMjFtM2hxWjE1TkJFaytz?=
 =?utf-8?B?WEsrbUI5QmRUZEVsUW5nRnE1aDFRQjAvdjh0eExDV2dXL0xzdWNPaDhwMVZv?=
 =?utf-8?B?cmV6QzJOdml4b2t4RTNtVkk3QWdER1NacndnTW45UFNCdFU5NGZ1MzE1Ymh5?=
 =?utf-8?B?YlNWTDdWR2VDa3lJeDFBODR6YWtKNEtkd0x4SmVmdmJ1c1ROR2c2dThNcGVv?=
 =?utf-8?B?SlpDODFYdnUwVGVoWDczVHZwbW9kdUNGL1ZwTW1EV1ptWTdqbG1FSzIvSXVi?=
 =?utf-8?B?UG5uV25ZVUFDOEd1RHQzRWZIbWZod2pha0tYOW8vNXBvWVIzbDVaQXM5Tnhw?=
 =?utf-8?B?TXlMdGxXZmN3bWorR2pRbHRLdVFvYU52akpSNDNTbmtWclBGYXVQMkN1UDBB?=
 =?utf-8?B?eCthSzdnVlJWTk5ldWNWUlcrRFpHSXJkZk5KS0ZpQ2lUTmFZTDBBeWVVOFB6?=
 =?utf-8?B?eXAvc2NIUEdWS3laRTZ4L3pJK2tjUTFpS1AreExoR2FOWUVvWU44RnoxNzAz?=
 =?utf-8?B?V3REMU1ZQmRFano2Q2dkU1RCUkcvNzVkTXZGakY2QnREbGtPS0xJVTA5TEI0?=
 =?utf-8?B?aGVPM1VWQ2FIa3BRUlRpTGNwU2I0RGQwQmlYRmtDR0FsNDFLTGtwZ1VSRVJo?=
 =?utf-8?B?Q2dLZ3JEcHYzTmtYWEVVR2lUOUluUDc5b29YKzM3UTZNbWIxYjhsc0FySkln?=
 =?utf-8?B?R1lVYlZmMGFCRWtYcVltQTZSeDc5MW5KNHhvMWo5bkYrNWc0ZjVUQlRmczVS?=
 =?utf-8?B?NXBLSkxoRW9tOUlDRFIxZk1jVlFGdlhHSmpZcG1vMERSdllLMS83MDdaSVVq?=
 =?utf-8?B?M3UyQmkvbGQvVTlmZjlTMmo4WEZzLytNZklwSXM2YW9ZVVFLNDNBbG5ieDg3?=
 =?utf-8?B?VGJPaEYzaUp2T2RNbG5sNHNwU25UQlpvanEwdmlMTWp2Yks5UlRtOThqOGhi?=
 =?utf-8?B?M1RKMXVPbkJmVWdKT2UyR2xReE9WYlJWL0gvNlBSSlRYZTBVMHdReEllYkNi?=
 =?utf-8?B?cnk4YklZMkpnMnNiWHBraVB5Uytlcm9lUVlCUGNZWHBjYWsxRHFjU01ZeVdz?=
 =?utf-8?B?eklsNVR3d256Y0p1b0hnWFpqV3VIQ2lwUDIyZ1hCcHdkTkJzUi9ZaWhsYTYv?=
 =?utf-8?B?ZUVnVVE3cVZwUExOVlg2UUNSdUFWWC9PbEtBWlVxUzFXa3ljUElVVitXUU1N?=
 =?utf-8?B?Rm84UG1KeVM1dmFiV2V1Yk9kSDV6cHVBMitoVG84SUN5b0VqZmtWRmhKK0p0?=
 =?utf-8?B?K095WU5DQnROQUFqTFRmQmVFMW5KVkZCRklYQnVURFY0OXU5clYzY0wzdU1k?=
 =?utf-8?B?T1FqUkJvdE5xcVYxamYvZ1JiSFhpTjFWeWhicU55YTc4bTVmMFpVY0pYL20r?=
 =?utf-8?B?bGRmV1JKcHNVNmxoZ3l3UVFuZUROcUhTaHZrckhEcmVOZUNaUFFHdHJjS1Fj?=
 =?utf-8?B?ZFJHTFFpbEp1c1ZzWFFjUy9zNGhOeHJDazBaSC9MTEwzdUduZnUyd2xNb2ZO?=
 =?utf-8?B?eGE3cERZRnFnV2RuYmpTeEJNc1RxNWd2NjJwQWViMlBBQ3FQcVNQVDFzaXBs?=
 =?utf-8?B?UjVBNVBnV3B3dUFmakNCbmZlbGx3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fcbe74-836d-4b2e-4750-08d998ba5136
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 19:53:44.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGV1FsegAjeAClqnDj2l7GHs4XOzIR1LAhWewGnzA4tM/DvAQia+MHbAHMtdHvMFNRNFboWyuYuol/AA8e2Y4cdRE+D/DSKGoKrQKU/TirE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------pQCOymJ7xVv6KqwD4pW2SCrW
Content-Type: multipart/mixed; boundary="------------WD3KSRGEThmyN3DJDF0OhhvB";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <d35dfb3e-608b-96a0-f026-6d6063121bb4@intel.com>
Subject: Re: cannot ping serverip from u-boot.
References: <SA1PR17MB4593DE25C67A9229F65DEF4196849@SA1PR17MB4593.namprd17.prod.outlook.com>
In-Reply-To: <SA1PR17MB4593DE25C67A9229F65DEF4196849@SA1PR17MB4593.namprd17.prod.outlook.com>

--------------WD3KSRGEThmyN3DJDF0OhhvB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjYvMjEgMTA6NTMsIE1haGVzaCBLdXJhcGF0aSB3cm90ZToNCj4gSGkgYWxsLA0K
PiANCj4gSSBhbSB1c2luZyBvcGVuYm1jLTIuOS4wIG9uIEFTVDI1MDAgQk1DLsKgIEZyb20g
dGhlIHUtYm9vdCwgSSBjb3VsZCBub3QgDQo+IHBpbmcgdG8gYW55IGV4dGVybmFsIG5vZGUg
YmUgaXQgb24gdGhlIHNhbWUgbmV0d29yaywgb3IgYSBkaWZmZXJlbnQgDQo+IG5ldHdvcmsu
wqAgSSBjb25maWd1cmVkIHN0YXRpYyBpcCAxOTIuMTY4LjAuODEgZm9yIG15IGxhcHRvcCBh
bmQgYXR0YWNoZWQgDQo+IHdpcmVzaGFyayB0byB0aGUgc2FtZSBpbnRlcmZhY2UuIEkgZG9u
4oCZdCBzZWUgYW55IEFSUCByZXF1ZXN0cyB3aGVuIEkgDQo+IGlzc3VlZCBwaW5nIGNvbW1h
bmQgZnJvbSBCTUMgdG8gdGhlIGxhcHRvcC7CoCBJIHNlZSB0aGF0IGxpbmsgc3RhdHVzIGlz
IA0KPiB1cCBmcm9tIHRoZSBkZWJ1ZyBwcmludHMsIGFuZCBhbHNvIHRoZSBNRElPIHN0YXR1
cyByZWdpc3RlcnMuwqAgRG9u4oCZdCBzZWUgDQo+IGFueXRoaW5nIHdyb25nLsKgIE5vdCBz
dXJlIHdoYXQvd2hlcmUgdG8gbG9vayBmb3IgdG8gZGVidWcgdGhlIGlzc3VlIA0KPiBmdXJ0
aGVyLiBBcHByZWNpYXRlIGFueSBzdWdnZXN0aW9ucy7CoCBXZSBhcmUgdXNpbmcgTWFydmVs
IEFsYXNrYSA4OCANCj4gc2VyaWVzIFBoeS4gwqBJZiB0aGlzIHdvcmtzLCBJIHdhbnQgdG8g
dGZ0cGJvb3QgdGhlIGJvYXJkLCBhbmQgZmxhc2ggdGhlIA0KPiBlTU1DLsKgIFRoYXQgaXMg
bXkgZ29hbC4NCg0KRG9lcyB5b3VyIHN5c3RlbSBoYXZlIHR3byBOSUNzPw0KDQpJcyB5b3Vy
IG5ldHdvcmsgY2FibGUgcGx1Z2dlZCBpbnRvIHRoZSBOSUMgc3BlY2lmaWVkIGJ5IHRoZSBl
dGhhY3QgDQpVLUJvb3Qgc2V0dGluZz8NCg0KSGF2ZSB5b3UgdHJpZWQgY2hhbmdpbmcgdGhl
IGV0aGFjdCBsaW5lIHRvIHBvaW50IHRvIHRoZSBzZWNvbmQgTklDIA0KYWRkcmVzcyAoZS5n
LiBldGhlcm5ldEAxZTY5MDAwMCk/DQoNCj4gDQo+IGFzdCMgcHJpbnRlbnYNCj4gDQo+IGJh
dWRyYXRlPTExNTIwMA0KPiANCj4gYm9vdGFyZ3M9Y29uc29sZT10dHlTNCwxMTUyMDBuOCBy
b290PS9kZXYvcmFtIHJ3DQo+IA0KPiBib290Y21kPWJvb3RtIDIwMDgwMDAwDQo+IA0KPiBi
b290ZGVsYXk9Mg0KPiANCj4gYm9vdGZpbGU9YWxsLmJpbg0KPiANCj4gZXRoMWFkZHI9YzI6
ZDE6Mjk6Zjg6MWI6ZTMNCj4gDQo+IGV0aGFjdD1ldGhlcm5ldEAxZTY4MDAwMA0KPiANCj4g
ZXRoYWRkcj1iZTpmMzpmYTo4YzpjZDplOA0KPiANCj4gZmR0Y29udHJvbGFkZHI9YmNmODIx
MzgNCj4gDQo+IGdhdGV3YXlpcD0xOTIuMTY4LjAuMQ0KPiANCj4gaXBhZGRyPTE5Mi4xNjgu
MC40NQ0KPiANCj4gbmV0bWFzaz0yNTUuMjU1LjI1NS4wDQo+IA0KPiBzZXJ2ZXJpcD0xOTIu
MTY4LjAuODENCj4gDQo+IHN0ZGVycj1zZXJpYWxAMWU3ODQwMDANCj4gDQo+IHN0ZGluPXNl
cmlhbEAxZTc4NDAwMA0KPiANCj4gc3Rkb3V0PXNlcmlhbEAxZTc4NDAwMA0KPiANCj4gdmVy
aWZ5PXllcw0KPiANCj4gYXN0Iw0KPiANCj4gYXN0IyBwaW5nICRzZXJ2ZXJpcA0KPiANCj4g
VHJ5aW5nIGV0aGVybmV0QDFlNjgwMDAwDQo+IA0KPiBldGhlcm5ldEAxZTY4MDAwMDogbGlu
ayB1cCwgMTAwMCBNYnBzIGZ1bGwtZHVwbGV4IG1hYzpjMjpkMToyOTpmODoxYjplMw0KPiAN
Cj4gVXNpbmcgZXRoZXJuZXRAMWU2ODAwMDAgZGV2aWNlDQo+IA0KPiBBUlAgYnJvYWRjYXN0
IDENCj4gDQo+IEFSUCBicm9hZGNhc3QgMg0KPiANCj4gQVJQIGJyb2FkY2FzdCAzDQo+IA0K
PiBBUlAgYnJvYWRjYXN0IDQNCj4gDQo+IEFSUCBSZXRyeSBjb3VudCBleGNlZWRlZDsgc3Rh
cnRpbmcgYWdhaW4NCj4gDQo+IHBpbmcgZmFpbGVkOyBob3N0IDE5Mi4xNjguMC44MSBpcyBu
b3QgYWxpdmUNCj4gDQo+IGFzdCMNCj4gDQo+IGFzdCMgbWRpbyByZWFkwqAgMS4wLTYwDQo+
IA0KPiBSZWFkaW5nIGZyb20gYnVzIGV0aDENCj4gDQo+IFBIWSBhdCBhZGRyZXNzIDE6DQo+
IA0KPiAxLjAgLSAweDEwMDANCj4gDQo+IDEuMSAtIDB4Nzk2ZMKgID3DqGxpbmsgaXMgdXAN
Cj4gDQo+IDEuMiAtIDB4MTQxDQo+IA0KPiAxLjMgLSAweGRkNA0KPiANCj4gMS40IC0gMHgy
MWUxDQo+IA0KPiAxLjUgLSAweGM1ZTENCj4gDQo+IDEuNiAtIDB4ZA0KPiANCj4gMS43IC0g
MHgyMDAxDQo+IA0KPiAxLjggLSAweDRhMzgNCj4gDQo+IDEuOSAtIDB4MzAwDQo+IA0KPiAx
LjEwIC0gMHgzODAwDQo+IA0KPiAxLjExIC0gMHgwDQo+IA0KPiAxLjEyIC0gMHgwDQo+IA0K
PiAxLjEzIC0gMHgzDQo+IA0KPiAxLjE0IC0gMHgwDQo+IA0KPiAxLjE1IC0gMHgzMDAwDQo+
IA0KPiAxLjE2IC0gMHgzMDcwDQo+IA0KPiAxLjE3IC0gMHhhYzA4DQo+IA0KPiAxLjE4IC0g
MHgwDQo+IA0KPiAxLjE5IC0gMHgwDQo+IA0KPiAxLjIwIC0gMHgyMA0KPiANCj4gMS4yMSAt
IDB4MA0KPiANCj4gMS4yMiAtIDB4MA0KPiANCj4gMS4yMyAtIDB4MA0KPiANCj4gMS4yNCAt
IDB4MA0KPiANCj4gMS4yNSAtIDB4MA0KPiANCj4gMS4yNiAtIDB4NDANCj4gDQo+IDEuMjcg
LSAweDANCj4gDQo+IDEuMjggLSAweDANCj4gDQo+IDEuMjkgLSAweDANCj4gDQo+IDEuMzAg
LSAweDANCj4gDQo+IFRoYW5rIHlvdSwNCj4gDQo+IE1haGVzaA0KPiANCg0KLS0gDQpKb2hu
YXRoYW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXINCiphemFkIHRlKipjaG5v
bG9neSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5IElubm92YXRpb24g
c2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9obmF0aGFueC5t
YW50ZXlAaW50ZWwuY29tIDxtYWlsdG86am9obmF0aGFueC5tYW50ZXlAaW50ZWwuY29tPg0K
DQo=

--------------WD3KSRGEThmyN3DJDF0OhhvB--

--------------pQCOymJ7xVv6KqwD4pW2SCrW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmF4XMYFAwAAAAAACgkQOcg9x5uaKcC2
tAf+PJ0csIVIM7G6DbeEqFNsJcMJJLVitbjCE0AI2o44TmLp4uJ6ybu07aGeAajwQELJsB1eYnK5
pbVIoa8c27c8PYX7+UPHwioHqsNqaoBfZ3LfsmIzXRqm/HiSaGIvLUSqT1BlDj3SYMCt+q03WO87
ckZquYVHPY5RAFaT15odEUWL5yneMWpArkMP7G10V8UJsYnqtyipFYGsxfqVFyLjV513wXOgjtV9
gTRWxDPtqi1yzi6ls81y9TsQPA2zjhQtfYLXFZ+aN3hNjmWBRW/YgH+106Ydov+9q1qIa6PZGz4b
ELdH6RrHOC3vg8g3bXZHFuJ9lMCD7h8ocLqXm31mIg==
=CxXu
-----END PGP SIGNATURE-----

--------------pQCOymJ7xVv6KqwD4pW2SCrW--
