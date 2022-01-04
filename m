Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EB484880
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 20:26:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT2f3235gz303H
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 06:26:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E6pcrAHx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E6pcrAHx; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT2dZ08nmz2xBT
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 06:25:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641324338; x=1672860338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=XkA2drYdF0VAwCs740O340FDnCrlaxqjDfE91mK0MS4=;
 b=E6pcrAHxGiDCM1mGFkggQVRLmuVZ6BeDp2JzAzxi7R6zxzt/33J3JE3i
 xHPH/FIHCIhScVL1fKGw4gszxBa0arLmy/WKne3+A46Oq+dZ3dJmbVqJf
 UFaDA6XmEcK+foQjQFhyJf6IfdmCTYtStxAun1WAkfYc8aMd5BdSSzDFz
 KmFVf+LP1m50Zz7wzkWeFB/23RpFUTQll1aHxpzpKzZZZZxv/g2KORiJe
 0q0DQqiPLMpu67s15/dF6qT6c4e5ECNvGBcTWf0r1MDbuWFP6HYr5OaoO
 7Q8lI6xLF18HN4q62K2IzhRoTY0w/POJVxtIxF/1DIYRvXeiT2UPlAStN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="239824631"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
 d="scan'208,217";a="239824631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 11:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
 d="scan'208,217";a="620755390"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 04 Jan 2022 11:24:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 11:24:33 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 11:24:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 11:24:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 11:24:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogmk1sQFdi5oQKG5VQ5Ja0BYR8aM2ReglZlisvGFs6ldioGcDBBcjCBieO5CtJCWcRHI0GFU5dWSKgOmSH0PnjwK6mjg0xoLPXddtSVLwqDFpag7Hb6NWpfjbMVS8PYyGTuUmBuwnWwvyJXNJj3U6HSEYZ0REg7BWbMbbVddHLgW8NZUDG11zsXNQ9toUmsvR+ZN5dgiu5s99iqVmK4Id2aBY2RBTLYWCN8Aw5mXsCT1K9BK8ffgo5eDBrJl3y6EKn11itn0qCkJIKipS/ZwjKkClXcJYwfD0tipSCDYzWqEpvmLTgXJMN8wgMu6wOWccmltC5AaRCbgfNq5uILrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrgPBl2l3WZxCU/x1pG6KIrm0iltA697yhRfWL7v3MU=;
 b=MVD0w6eQA6FTmGvfvHHfKhdZQiz0SMMD6U7+AkJP4yu7thzZT4YkjNPAuH0a1HgfGsTqciZkCzayrDB85Sj29pmCMWE8hvzjvthwHV5KI4S9Oyk9SjfecJ/HOhZ4xaA74LJ/Wp4YC5KssQBlvYk1j7sJ8RuIs8HkoE18Er7RbFSXVXEPg4PF22/2UiftkruBUmDbGixWAkgUST3RsvxoqEbk9oeLmhfa6kItfWeLcBCFXgkyDpPUpeksYJtijROkeQ09Ul3/+dYmf4PAMM9nTgZbXsP1Pn/LLJIEF+/vghC/TASdKrBYzxpnzggmGuHmLQJCZX7Hj9vYg7XKZFFc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 4 Jan
 2022 19:24:31 +0000
Received: from PH0PR11MB5176.namprd11.prod.outlook.com
 ([fe80::bdea:48bb:2b17:e59d]) by PH0PR11MB5176.namprd11.prod.outlook.com
 ([fe80::bdea:48bb:2b17:e59d%4]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 19:24:31 +0000
Message-ID: <751ead02-272c-6882-5108-dc5df3bbfc53@intel.com>
Date: Tue, 4 Jan 2022 11:24:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: meta-phosphor: enable `allow-root-login`?
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <Yc25imp2cCDpyXNt@heinlein>
 <af0e61cd-283d-1ba6-c426-5648c53c4915@intel.com> <YdSRSUhGYWj58YJb@heinlein>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <YdSRSUhGYWj58YJb@heinlein>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sQrbFJBFOcZfjoRDdG3k9Vb4"
X-ClientProxiedBy: CO2PR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:104:3::24) To PH0PR11MB5176.namprd11.prod.outlook.com
 (2603:10b6:510:3f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ad895b8-6823-4384-7558-08d9cfb7d55e
X-MS-TrafficTypeDiagnostic: PH0PR11MB5157:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5157F715CB005B35F0C11133E24A9@PH0PR11MB5157.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H5qTXicvvdVotp8+Idx3MfevNgRLDKjJ480KCBrJoLRXvq1vKwR7v8L04XTGodS10Ziq727wmBzEdjcePp3eogT0hHP18s3vlxKacnsTvWaI9zQhheAsy/YLC7IxsJ5QElxZu9qHbx7zyxmDIvbLeMh3k8tSvrTZqzq3eOG3EJBq13A1mi5or238GTnXcIEUFjXS/BrzNrK/zg8hQIlH0D9WfsG/ewr2Mb8RkpLSkJCcf6X3XlCIRETWB70IF0GgkgIsFaCMuEm77o7HVs9GdyxdwqSjpAVxOED7SA+cjuystdYQaJ+hayKQ2rgjZt029LPebpPqWpshRhPF3X75FR2w8d6UNyw8rX7i7p2AfdxNyIR6JF5s39ew24NQArsxRNrZ77K553bbpR6dqjPjjlAK1CmOxQsvciMsuWz4V8ZVP4lzhHXkLYULes7C+NQeqO2MAUKrqWhRuS59ftSzHjakqN4869R3ECTYFSpKGqZmvIkGJN/QT1+z0IeYoqdkU++p9TABMYJHQt3Iet+7WmfMqedYfv1heBSBkJ+dpt5ShsOR/+0ifd5oMwalmpwZ+357mcGFH2U7qRocw1aSeWSa3kEnXGnw+yFWImjnvzqiul3OrGgnI054+N54OCYn9FO3X/8WttjHKUhXBNFvCXNRh7Maww6ZoaM5dONfMHOP438/15IKVOFpgM5wuV2PiKaqEb0sPA9NnAZ+IvdfHumzahQkOBum+kMGI8iT/aIovan++zthyreSGSdP72v+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5176.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(40140700001)(6916009)(6486002)(4326008)(66946007)(33964004)(508600001)(6512007)(5660300002)(31696002)(83380400001)(2616005)(235185007)(66556008)(66476007)(36756003)(8676002)(186003)(38100700002)(26005)(6666004)(316002)(86362001)(21480400003)(6506007)(82960400001)(53546011)(8936002)(31686004)(2906002)(81973001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE0vSTdETVRLSG8wTGN4RWVFUFpXWmZpQmkyV2JOMmJmYTBQQ3ZmZTFNOWlK?=
 =?utf-8?B?QzhvUGZtZUcxUU5tUGRBbEZHMk9WQXhCbGMvenN2RnZsODY4Z1ZyYlkzMStj?=
 =?utf-8?B?ZE00eThmb295YVlENGpyYUF1bi9rSGk1UWYyQWtIK2hIZU1FZDkrcFcyREc2?=
 =?utf-8?B?ZFRMcVJTNEVOaUZJa056TXl2VXJaZThYcE9zWmJUc2dtYzE0TEJQTTZXU0Nz?=
 =?utf-8?B?cEIySVh6RzJVMzdpOTlVQ1p2Ky9CNUljdHVHVE9nSUJSalpMdFQyRGxzWVZx?=
 =?utf-8?B?KzN2YmxIRVIwNkE2ekRhRmVTOWJaNFNKNnBJUklJYjR2RHNxbjg4cVdkcVFr?=
 =?utf-8?B?NW9Rd1VFenBERjVCQ0lsMStqNlZQdGFOa2dHdmlHbmVubDJIQjJROHZ0Mzh4?=
 =?utf-8?B?NEFPMVg3bXpyN0xLVGlFTmlDOWk1Zlkxa2FjWnNRWURSdnBsc1JPRTlTNnhv?=
 =?utf-8?B?bTFLVEVkWDY3MldIUzhBMEdDbENKbjloZExzVWhqVDBWM2hGakowWi9ZK092?=
 =?utf-8?B?QlgzTmVJRlJ1R0VzdlBuVUw4VWtkc25KUEh2NG81N0M1Y3RuR2xQbkZCa05j?=
 =?utf-8?B?V0FCZEtMdURsY0E3NUFFM0RBMVg4Y3kwckhUUitGanZsOEFNbitRMEdaTXMx?=
 =?utf-8?B?b0czT2ljNGxrZEVzWEJOVmRNK0c1amE5ODZZY0NmeVJ6WERwVGxwdjVkNTZI?=
 =?utf-8?B?Y1AyOWk3VzF3TUJna1JrbWZDd3hhL2hnQldzaW9lbDVzVlpoNTJ0aFlkOW5x?=
 =?utf-8?B?L01FV3ZTVytId0RtdmRHcEQzSE8wd0k3NTJSbWM5b1ZqVklSdXc1VnA3OTNh?=
 =?utf-8?B?bnBEV1hjZGVYdGx4Y1pXNENzK3cxSmRnU1Vwb0hwcTd5WWd1OWxkeHQ0dG1q?=
 =?utf-8?B?dFhxUXlQU0dOdDl6RkF4MzFZeGh5Z3BpTEEwOGw1NkFLbElGWitGUmFMdWpH?=
 =?utf-8?B?WDBaZHVLMHJOYVZtd0xMQmhtZWhGZkpEcHRVbGUwTlhRQVMrbTIxeDdxNmRR?=
 =?utf-8?B?akhDYjFORmQrWXBoeWxiREd1WkJNTVdHU2hwaEFZRFMyWVVJN2VLUFdhSXVt?=
 =?utf-8?B?WGxWNS83KzRPVzFVNXFNb2JLaHBKSERLb1FoaGFZT1FaMkM2SU56dnZUQ0hE?=
 =?utf-8?B?ZTRaUXhqeGs2L2RDNURJM1hKTXpDa09XcUtqdkcxcnVFVmdFVFlXRHRjcGJQ?=
 =?utf-8?B?anEvS3hhWTZJeHJuT3hta1FOdWh0TE9IV09jdVN4dnU1bjA4VFlROXI3bmJ0?=
 =?utf-8?B?dEhMU25ZSjRKejJ6bndEZXVPU21ONnJPNm1VQUc0Z0RlWFhJLzVZUkN5c1I4?=
 =?utf-8?B?SG9FbnhLemVFRFJlRVZnSzdidFg0bTNSbmxVUnBLS1IxR2Z3OE84K2pWWE5Y?=
 =?utf-8?B?TFZ5Qk9Wanlpa25QYS9KWitwVFJPWWxoVEFPTUEwNERXNmlrQjJycXdqcjZM?=
 =?utf-8?B?U3lNNERjajRPZVdJV0tFOG16ZGpUdHlGL0ZPdHJsUEpkVThwNGcwbHlqUTZm?=
 =?utf-8?B?UWE3c0ozQXJKV0RBUmJOQUlPNm4yRWJzMUdjNkNNU2IzNExPSXJGQmkvSjVY?=
 =?utf-8?B?MGpMdTJWZWo1ODdqVk52d1dMVzM1cERhQytpcG5FeFpjSTFSK1VQMVBFcXdi?=
 =?utf-8?B?NkNBb1lzYjlSc3N4RW1SMUI5NS9sRHJNWjlIM2tDUzhtMVNJYi9VTzFxMFRH?=
 =?utf-8?B?UXpNM2xodWsrc0hSc1ZvR2tDd2o1aDYvUEdrSS9yKzdnTVBjNXplclVCV2Ez?=
 =?utf-8?B?WXVOSlhKVHNJcWFhWncwQXZQVjZ0MmVIL1J0UnVVRnFqV3kyWnJHWWNhU2RD?=
 =?utf-8?B?MkZhVUVHdy9kWHpKMkVKNmhjUE0wQUh4NjZUSTgxMGVHVmxQYWwvV2xOTDdq?=
 =?utf-8?B?VWhiQUsxbkkvV3A2YVp5clQwWVBnOXV2Ym9OejFSaVhmb3lpTEdxSjBnZjZZ?=
 =?utf-8?B?dkpVcUVHNStGcWJoRzhyNjNFMHZJQTdyRVkyRFdFV2xFeXRVV2JBTGRmcTRD?=
 =?utf-8?B?TVFZVWlhOVd1OVFRR0h0T1ZYUkExNWF1emVHNEFBWFkvZ0VtL0JYOG1rY1kx?=
 =?utf-8?B?c01scHVLR24xd3BQWUYwamlJQmMwOEIvRjFVdFRRTGt2T2FKU1VQWlA1ekFG?=
 =?utf-8?B?ZzVEa3dhaGl0TDJ5RHJXSXZCbXl2ZkM5Z1FrRURGRXdNR2VXQnFzL3FXYURB?=
 =?utf-8?B?dUZabXRFU0hLY1RtYmJodmN3bSt6MldCMVhOWUJuUDBvait6RVlKcVpxM1ZS?=
 =?utf-8?B?VndrMGJxanYza1czclA2ZUhKWEVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad895b8-6823-4384-7558-08d9cfb7d55e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5176.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 19:24:31.8462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AphkbHABvypTZrkQILfmA+KgWeZV7d3J/ry68wJkTwdOWfUZbSZAXvXBLPiCjdLCvQuCI14Lu6tigZEmMrhm4V9Jq93ywx34RWjc8UqeTmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------sQrbFJBFOcZfjoRDdG3k9Vb4
Content-Type: multipart/mixed; boundary="------------JTpmVd50mp2O5W0LWCBSJ14c";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Message-ID: <751ead02-272c-6882-5108-dc5df3bbfc53@intel.com>
Subject: Re: meta-phosphor: enable `allow-root-login`?
References: <Yc25imp2cCDpyXNt@heinlein>
 <af0e61cd-283d-1ba6-c426-5648c53c4915@intel.com> <YdSRSUhGYWj58YJb@heinlein>
In-Reply-To: <YdSRSUhGYWj58YJb@heinlein>

--------------JTpmVd50mp2O5W0LWCBSJ14c
Content-Type: multipart/alternative;
 boundary="------------9GC96xeNyn40oYiZ0Yj5GBGY"

--------------9GC96xeNyn40oYiZ0Yj5GBGY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDEvNC8yMiAxMDoyNiwgUGF0cmljayBXaWxsaWFtcyB3cm90ZToNCj4gT24gVHVl
LCBKYW4gMDQsIDIwMjIgYXQgMDc6MzI6MDZBTSAtMDgwMCwgSm9obmF0aGFuIE1hbnRleSB3
cm90ZToNCj4+IFBhdHJpY2suLi4uDQo+Pg0KPj4gT24gMTIvMzAvMjEgMDU6NTIsIFBhdHJp
Y2sgV2lsbGlhbXMgd3JvdGU6DQo+Pj4gSSBhbSBjdXJyZW50bHkgZW5hYmxpbmcgdGhpcyBJ
TUFHRV9GRUFUVVJFIGluIG1ldGEtZmFjZWJvb2sgdG8gYXZvaWQgaGF2aW5nIHRoaXMNCj4+
PiBoYXBwZW4gYWdhaW4uICBJcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB3ZSB3b3VsZG4ndCB3
YW50IHRvIGVuYWJsZSBpdCBieSBkZWZhdWx0DQo+Pj4gaW4gbWV0YS1waG9zcGhvcj8gIFRo
ZXJlIGlzbid0IHJlYWxseSBmdWxsIHN1cHBvcnQgZm9yIG5vbi1yb290IHVzZXJzIGluIHRo
ZQ0KPj4+IGJhc2Ugc3lzdGVtcyBhbnlob3csIHNvIGlzIHRoZXJlIGFueW9uZSB0aGF0IHdv
dWxkbid0IHdhbnQgImFsbG93LXJvb3QtbG9naW4iDQo+Pj4gZW5hYmxlZCBieSBkZWZhdWx0
Pw0KPj4gSW50ZWwgZXhwbGljaXRseSByZXF1aXJlcyByb290IGxvZ2luIHRvIGJlIGRpc2Fi
bGVkIGZvciBwcm9kdWN0aW9uDQo+PiByZWxlYXNlcy4gRXNwZWNpYWxseSBzaW5jZSB0aGUg
ZGVmYXVsdCBwYXNzd29yZCBpcyBhIGtub3duIHF1YW50aXR5Lg0KPj4NCj4+IFRoZSBJbnRl
bCBzZWN1cml0eSBhdWRpdCBncm91cCBlbmZvcmNlZCBibG9ja2luZyBhIGRlZmF1bHQgdXNl
ciBmb3IgdGhlDQo+PiBTMjYwMCBXRi9CTlAvU1RQIHNlcmllcyBvZiBzZXJ2ZXJzLiBBbGwg
dXNlciBhY2NvdW50cyBhcmUgY3JlYXRlZCB1c2luZw0KPj4gbG9jYWwgSVBNSSBjb21tYW5k
cy4NCj4gSXMgdGhpcyBjdXJyZW50bHkgYWJsZSB0byBiZSBkb25lIHdpdGggYWxsIHVwc3Ry
ZWFtIGZ1bmN0aW9uYWxpdHkgb3Igc29tZXRoaW5nDQo+IHRoYXQgb25seSB3b3JrcyBpbiB5
b3VyIG93biBmb3Jrcz8NCg0KQXMgYSBkZXZlbG9wZXIgZm9yIEludGVsIEkgaGF2ZSB0byBl
eHBsaWNpdGx5IGFkZCAnZGVidWctdHdlYWtzJyBiYWNrIA0KaW50byBvdXIgYml0YmFrZSBj
b25maWcuIEkndmUgbm90IGR1ZyBpbnRvIHdobyBtYWRlIHRoZSBkZWNpc2lvbiwgYW5kIA0K
d2hpY2ggbGF5ZXIgb2YgdGhlIGJ1aWxkIHByb2Nlc3MgZW5mb3JjZWQgaXQuDQoNCj4NCj4+
IEludGVsIHdpbGwgcHJlZmVyIHRoZSBleGlzdGluZyBiZWhhdmlvciByZW1haW4uDQo+IEl0
IHNlZW1zIHRvIG1lIHRoYXQgdGhlIGN1cnJlbnQgYmVoYXZpb3IgaXMgYnJva2VuIGZvciB0
eXBpY2FsIGNhc2VzIHVzaW5nDQo+IGN1cnJlbnRseSB1cHN0cmVhbWVkIGZ1bmN0aW9uYWxp
dHkgYW5kIHNvIHRoYXQncyB3aHkgSSdtIHN1Z2dlc3RpbmcgdGhhdA0KPiBtZXRhLXBob3Nw
aG9yIGJlICJmaXhlZCIuICBJdCdkIGJlIHByZXR0eSBlYXN5IHRvIElNQUdFX0ZFQVRVUkU6
cmVtb3ZlIHRoaXMNCj4gZm9yIG1ldGEtaW50ZWwtYm1jLCByaWdodD8NCj4NCg0KLS0gDQpK
b2huYXRoYW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXINCiphemFkIHRlKipj
aG5vbG9neSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5IElubm92YXRp
b24gc2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9obmF0aGFu
eC5tYW50ZXlAaW50ZWwuY29tDQoNCg==
--------------9GC96xeNyn40oYiZ0Yj5GBGY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 1/4/22 10:26, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:YdSRSUhGYWj58YJb@heinlein">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jan 04, 2022 at 07:3=
2:06AM -0800, Johnathan Mantey wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Patrick....

On 12/30/21 05:52, Patrick Williams wrote:
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">I am currently enabling =
this IMAGE_FEATURE in meta-facebook to avoid having this
happen again.  Is there any reason why we wouldn't want to enable it by d=
efault
in meta-phosphor?  There isn't really full support for non-root users in =
the
base systems anyhow, so is there anyone that wouldn't want "allow-root-lo=
gin"
enabled by default?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Intel explicitly requires root login to be disabled for production=20
releases. Especially since the default password is a known quantity.

The Intel security audit group enforced blocking a default user for the=20
S2600 WF/BNP/STP series of servers. All user accounts are created using=20
local IPMI commands.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Is this currently able to be done with all upstream functionality or some=
thing
that only works in your own forks?</pre>
    </blockquote>
    <br>
    As a developer for Intel I have to explicitly add 'debug-tweaks'
    back into our bitbake config. I've not dug into who made the
    decision, and which layer of the build process enforced it.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:YdSRSUhGYWj58YJb@heinlein">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Intel will prefer the exis=
ting behavior remain.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
It seems to me that the current behavior is broken for typical cases usin=
g
currently upstreamed functionality and so that's why I'm suggesting that
meta-phosphor be "fixed".  It'd be pretty easy to IMAGE_FEATURE:remove th=
is
for meta-intel-bmc, right?

</pre>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=

                      class=3D"moz-txt-link-freetext">johnathanx.mantey@i=
ntel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>
--------------9GC96xeNyn40oYiZ0Yj5GBGY--


--------------JTpmVd50mp2O5W0LWCBSJ14c--

--------------sQrbFJBFOcZfjoRDdG3k9Vb4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmHUnuwFAwAAAAAACgkQOcg9x5uaKcD3
lwf+LjSgb2KHBE0r5gGCCsdxF951weHhrXPd2z1OAWqy6BNRyYp4yidqbQh+2AT7+tTvlvBEb5md
I5722nLAiJSGLOOJJABnLz4Gn/yq+skcL3DjU8ZI45IlA97kwVcj3Pk/NyqqsC0Ns8YViAdiKS6y
uGlgeheElw8PBDGeq+ZoHDazqtVidjq57nlYb3n0Ds9OMrYK19J3IOZ8jYOFhlf8k0lfc8miqknZ
ZYACk21GJNnS49GJBLUoH1HjIIYmyXJAzB/7QZ30w66h+ImVoN1MOMHlnpCsBYNlaIM16SXLt3zO
ZD+fA2xPXBQ+OK+aQgDIB86gOfs28JD2YnduZsFRDw==
=y6t1
-----END PGP SIGNATURE-----

--------------sQrbFJBFOcZfjoRDdG3k9Vb4--
