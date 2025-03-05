Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0125A50F32
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:54:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SX056Qjz3vbW
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.148.174 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741172023;
	cv=pass; b=A236kV+9mFesNUc3HFqmFvF+ZW/t/36T7ONaaBRYt60vO80deDuw/IP4VrhexIN0GG2GiqYqz0THuxhCM2NH6+v6qXbwkC1VYNZJ1FMBsxTRHjURJ7Y5J4mVHQL8fDpBqIZejvPYWvnEqSuyYejtik8/cEjnkZGSKkS9bDxwbNH2n/9u8yKarl1Ne0pPusDtV6HBOESpNiZjd2V/5iu6isqEeNuq410YAvJAXBEtpPcr0LGadHRJknAMu6DQGvDEMpvMj9T2+zuz4fsHoafsF0HGiPAkg8lQwu1N+JzU95afebajKw1AZG1Bkzxpv8DfdYuH7USDQYeBnF3sdyOvmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741172023; c=relaxed/relaxed;
	bh=Z7L0XGQ9STX484/IM0i3UAZmVdqUKHfLWcX+TvOHbKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XZR6swaUu9f+64N/eB2vzjQ1dJQGMSpPwc9iedpXn3q89PoR+QdtDVHTcuQSpVKxSKkYsWOWFlwWgPm04fZtUVBGF5LMF9+zztNYrg5ddMOg8CtkZdr/hPUvpI3N6D8yhHqCkNerztLu6otniueNoJlV9vJoQaWRXYJOUGDA3QFcfidPeUpQGmjG7DH7C+RiQ1wORiq+ho1yuVhHBWDgGYWUZq6ZvwBHz5AORnB8j+Di01sPvxmicyL9gYo0flPT8pN9Vaogn9/C7GUs3gxQAD+7Ou7guxPXZnC6kA0DKZnATbpiUrhMZiGwkb0DdnlDjKgJ4haz3BsGyLvB4UIJTg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com; dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=sladbzdB; dkim-atps=neutral; spf=pass (client-ip=67.231.148.174; helo=mx0a-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org) smtp.mailfrom=marvell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=sladbzdB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marvell.com (client-ip=67.231.148.174; helo=mx0a-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1046 seconds by postgrey-1.37 at boromir; Wed, 05 Mar 2025 21:53:42 AEDT
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z78YL1NT9z3bqq;
	Wed,  5 Mar 2025 21:53:41 +1100 (AEDT)
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5253vi6x028990;
	Wed, 5 Mar 2025 02:34:55 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 456f5tgnta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 02:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPCcibAdjXNq9edkhhjc1I8iupyMyyXi9aeGKRx6SutgxFlhb5PS/gKE2sgoNVE17oE11V3FkA27jVpmBy8wt4a7UnNOFLpFxCOklnE7p1/0PetM8UkHbdwVdixmnVBA0WCOi5JcOaHxUDRsuimGDtrCxZGqkZ7cO9IuumfKXxL1lhgESV19Z/ixEGP1EFHB2FScOaxD/YX6hSLzgcy32GAqj8JhSj+PFK9/JvFhQvu5gK1CtpAMlzs3kHW/3xz17GjguP3wWFE7SHpOheIcgYuqXWS6ES1p0NdFZmTCZ16kLjcGdTdBtUn4r7mEVpj2RiRCGzcjQQAyoWAfEbRE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7L0XGQ9STX484/IM0i3UAZmVdqUKHfLWcX+TvOHbKY=;
 b=pIwXXWpsD5K0zFyML14l7Q3Nh3U4QvVFwx/YhoqcOxrDHOyWtZWRBzMjjYdz//kl+Q4U8xMhqcsZfjS75ArHTnStb4DxVnhXxp/VaEaiJsWpI7+fJhaQ6eYUJhfMYjDf1Rav1gqnvOM6RNnsT7MOSacqP3dXse0a+skELq8ACUHPhnExoqX6zxfhAnXJBgIwcRjVQQVGxF8Q0rNp9f00wMVScwom6DlImygjAlZhihr7WW4/9HP1Y4m8pFYMz8WK6VlnwUm+yfoxx8Soj0RfspSurPBrjU34vALmvPrOHPQCECVLJaZ5/kmdMiSrePEXijDbku6AMKWdi/yCjY6jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7L0XGQ9STX484/IM0i3UAZmVdqUKHfLWcX+TvOHbKY=;
 b=sladbzdBNLTrmp3ojMZxLFeFmwqvvzl057bVXehzVbE9LLjuhdOfyGrWsG8sIhco/PA90zKlKlNhJNc85E+eLXpYLNHn/3ojWGLKkXPvbSAym+i+LP6FbfxAVxhr2eVTHxdh2AHXfBYP2jbzdVoQOjokZd4SUVJXlebh7yyz1lQ=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by CH0PR18MB5436.namprd18.prod.outlook.com (2603:10b6:610:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:34:50 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:34:49 +0000
From: George Cherian <gcherian@marvell.com>
To: =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Thread-Topic: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Thread-Index: AQHbjbo52JxREBNQ6UqbD0W7rj3cQw==
Date: Wed, 5 Mar 2025 10:34:49 +0000
Message-ID:  <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
In-Reply-To: <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|CH0PR18MB5436:EE_
x-ms-office365-filtering-correlation-id: 43ad9ebc-b6f8-4be2-e5ef-08dd5bd15b92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?NWRTOXZPaXdnUHpTT2MzRTg5UlA0WlRDL0ozaC9nTnJNZnZybC9qRlNNNWVj?=
 =?utf-8?B?MDJsR1FEWUpaSVlldy96bmphOTZDZXhLOTAwREdua01JdEFwUmo2Ym5qL0x1?=
 =?utf-8?B?c2xtSU1nZ0VPTlJqK0lFWnFSb2paN3MveU9FUE51UTBHbVBtUTBEbE9CN0Rr?=
 =?utf-8?B?NTd1UnduTGs1M3FkTUFpaHd0LzZqa2tqbjVKMTJUcjRFNVVxNEpod0xydHNL?=
 =?utf-8?B?QW5SRXZPTVRDK1BMaHJ1bjlmMDdkTDVrR1l6ckkweEFWc3JIYXZ2NGo5RFlZ?=
 =?utf-8?B?N1FwdHJrMVRwSEdmTXMyNjRTdGowVktsL0lwbFlSNHpESEVXUVJhQ1FDQ1ZB?=
 =?utf-8?B?RXpzdDVBTWExaXJ3c2pYSXJwd1J5NnFFZUxoNWVrVGtnMHhsOTFHS25xRWdM?=
 =?utf-8?B?dVIvN0VrNm5Hd2F6YUc1RmIwRUk1Q3ZCdUtGQVRqeVRQeWIyZHdlY1JLdjlR?=
 =?utf-8?B?VUJ2YmVIMDR5c3cxeWoxdngyYXFSbmdUT21aYzV3eW1aT040TVZTelAreFpR?=
 =?utf-8?B?VW5ielRnRERpSFl5THZtZDNnM0Zkd3lMTFJpUGM0OGlYK1ZvL2tPb0JJMkZk?=
 =?utf-8?B?alYxYnkyZERhbFdLK3FNWXIwZ2t3V290dk5EcGFwdnluMEx5ZDROaGQ3bzFE?=
 =?utf-8?B?dVN1ZjB0YTZ5Si9nY3JnVS9lZi9KN1ZuR1E0cmp6NnFqaWR4QW5qKzhURUFu?=
 =?utf-8?B?R0QvYzRQVk9WMjF4SXlkTnRteDluZzgxMGxydEhwR1huVG1PMkZEakt2OTZR?=
 =?utf-8?B?UWR2bnZHN1IxWXRKaWVsUzA3M0R6MTNYT3lRWG1mR0JuWW1HaTZuS09sdGdz?=
 =?utf-8?B?bk9RaWtGdkhrZ0k3R0w0cjVrSUZTemZtOFA5VVV4Zy9wazJQamJZZ1V4ZnA2?=
 =?utf-8?B?T0ZIamN3YmJVL3lueVUrdkJJaHRZWFpMdDFCUlVsMyt3aktkdUZqaEw2d293?=
 =?utf-8?B?UjdCZU1vUDF2NWtMM0gwOUpRQnVwaFowenRzSERVd0x1Y2ZvdEJFM1RvYzh1?=
 =?utf-8?B?TjVFMkZQT2d3WnU0WXhYRk0rSWxUdkxZdktURnJGYUoyR01mYzJldUtkaWxV?=
 =?utf-8?B?UFNOR2xZNUwzVktnUFZxUWFWMGQ5VXJROU9LRk4wNUZkbHpaQ1l6K2tJVFB6?=
 =?utf-8?B?MXkzeXdwckxRMjFuSzdENU90QVJPLzlhZHRoMEN0L1hyclRFclpzK3dkOVg5?=
 =?utf-8?B?L1NhZExBUGRISFpyYnZwOUlhdEpZSXRqZnJCbDNDcHRKWjZ6OEJ2SnUrSEtT?=
 =?utf-8?B?RVcyUHpMSXVSeGh6T1V6NjNJOG5pZGVPdVJXZWxlQUhtS05QRStxSThBTjJp?=
 =?utf-8?B?WUNCSzk5UkFSbGNydzRwYytJSVBnZWNYNEFGOHpVeHkyYk9zTFZ3aktsVmYx?=
 =?utf-8?B?MGY1a3d6VFhoOWN6VzlJc0JWOE9UVzVOcWM3QzlLUlEybGhLV2lkLy9TakNv?=
 =?utf-8?B?TE5qR0p5bzlMaTVSNWVBQWhYQ2w3N2xDTlpna1dLODZFRFlvUGg4czdXYm1S?=
 =?utf-8?B?dEJaSnBPeUk0RVIxSkpBZEU4K2QyWlpva0NnYWc3SEJHWVA0dklmckNOU1JS?=
 =?utf-8?B?MXY3RlZqSXJSQzZsVEZtNXJQekN1cUFpWFEvRm5zbk1BWjRObGZFcUl3TUNh?=
 =?utf-8?B?emtXMnVXZ1RJSmFZUXoyeEtYcVdCVTRPQmJGcVI5dTZxSWhaSDJZZW9ORVFD?=
 =?utf-8?B?d1MvY0U0U3YvVVoyS0VNN1lNYlBUM1lVa293b1lwUWhIWmlsenN2VHUyZ2JD?=
 =?utf-8?B?MmowUzgvUzlCSlBkc05lcHVWWEZyYmZDbmNxbEJLTFJ1RlFrZmc5ZGZUWXhK?=
 =?utf-8?B?eTFqNkdSWXptd0tudndoVm9uODR5bHlBQldmQjkrUGw5VmJocjhPTERvckhQ?=
 =?utf-8?B?amtMbzhhamhFeTY3RkRmOG9SWlkvZWJ3SlJGQ1I4RzBXS0I5eW5SNit6QitX?=
 =?utf-8?Q?onYPB2KcbjEYSLfRRRQMiGQUGzquRSUF?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y0ZDNjVIbTJSUDNWa1ZqM0dSTEEwNWhUSFBrU2RtWnJnN1gzV1N4THNqTUd3?=
 =?utf-8?B?emFtUzBrNzdlT3FPQVQ1bGU3Nnp0eEQxTU9LTlFhNXNtYnJ6UEN4UU42S3FT?=
 =?utf-8?B?UnNZcy83Tkl6OEJPNUJHMU9aRE9oVm1xZitBVHcwNkRzUHdWL1NRM2pYWnpT?=
 =?utf-8?B?a1FHdnVnRkFuYjQ4NXJIQkVOc3NjK21lek1qS3IwWFRJMnduZjJ2bG14WURs?=
 =?utf-8?B?QzUyeGRRNXNoWmZicVhrSFVmS2Y1QmExdks5QysvaVBIcldSS0MycExsbkwr?=
 =?utf-8?B?NE1XZkJmenlOZ0NLKzJRZjIzd1oxdW03UW4vSUUvb1J1ekJnRm5LNUlGY3ZV?=
 =?utf-8?B?SDU5MU9DTnhITWxoU2drV3R3UUZpM0NYbXAvUEt5a0VzQi9aQks2d1J5QmpK?=
 =?utf-8?B?Ly9TaUozSzRzNHpHcVExcGFZWm0yUEFIdE9uNHNtVi9oK3dyVFNYd21tbUFX?=
 =?utf-8?B?aU1MYjM0ZjRISWZoMjFuNmlTNThoN0ZtOE1RdlBPdDNOWmxyT0w2T3dpVlhY?=
 =?utf-8?B?MGxkeUptdytCN2JuMEFmOG0vN01hdGs4YVZRdE15dC8vVG52Ris5djRvaDlu?=
 =?utf-8?B?ZnNFOFhNb1dFMVhWRXRIMkRiRWxWcWlGOXkzSk8zL1hDUVptcFFQWWJycytN?=
 =?utf-8?B?aW9MQVo0QlFaMTZLL1EvNGJERS95bDZZeVJGdHlVNWpMeTIxUHlYV1FRQVhE?=
 =?utf-8?B?Q05vY0x1NDljTkFmdDZJUUowU3B4UllJV1lqb2R2eEZZNWs0UXFnZ05wV0R1?=
 =?utf-8?B?bDg5M2RNSUNHYUREcitHQTJiYnZOby90dkZSZ0o4WmI4cDNPazNMVCtNUFd6?=
 =?utf-8?B?aVo0RUgyOUJjQlVZN0o4dUp5c21YeUlKS1dvLzRKc3lrN0x6MitpeWpLeUJB?=
 =?utf-8?B?dVUwWUlUd0MyNzlmZG5UNXB5WWdYUTZScU84Vmc4bUN4YjNjWjVNM0w1VFRm?=
 =?utf-8?B?aWNyM3FRNVU1Tmh1b04zRHFaWlB5Z2pWRTN0WE5jNUVEc1ZGYWxVNXFzMzhU?=
 =?utf-8?B?ZTZkblo4Zkw0WkNJUkdqSm55WUo4NHh4SVVGeDluNWd1L0xBQkQwQXZnNGd3?=
 =?utf-8?B?bEM0Nzk3aDZVblcyRXpaUzNwOXdUd2ZiTitUNitJeUw3cU5JUWhxOEFMZURB?=
 =?utf-8?B?SEhjeTZqQStJMnhTSUQ5SU1Xc2xTSE1tR0ZKRDRacHUvbVNqUkRwakk3ZFlS?=
 =?utf-8?B?ZldEemtVZXJRRnlLaURnYWhUd3NLSUN5QjZ3QzRUVUJqZ1ZRMjJXQ2c2Qmtn?=
 =?utf-8?B?YVQwVWF4NGVrOVVKbkFDcTNYdWcybnU5MDQ5NFR1cWRBbGZ3eXBDaEcxQktJ?=
 =?utf-8?B?M0lJNWF3OFJMT1c4aC9NQWxSWXdIazVLSTh4dE1nSzVEZ3RLN0FUY3VBdXJW?=
 =?utf-8?B?SVJVUVhGMllVRjZ1ZlhIL0ErTDBSbThKUTJlcVNTYy9FdXF0UXlYU09MeHQ2?=
 =?utf-8?B?aXNYSWxRSjAzcnVWMTNZektuWXM2clBlUUp5bmRsN056UFdYaituV0lsM29C?=
 =?utf-8?B?R2xxZUR4T1FPNVVzR2ErTzhMeXAxMTU5TzRtMlN6MDdGandIQWY4MFdmdmF2?=
 =?utf-8?B?azFjaWdRU2xsTGFZK21sRzA2MVMvRytsK01CSkZYTmJwRG5rcDM5N1dmRis1?=
 =?utf-8?B?VVJrcG5YaHR2akNNa3BEbXdiSytmR0p3K2JRM3RubnoyVmh1YTRFQkZvODU5?=
 =?utf-8?B?SHMxb25ZaU85S0d1eXEyNnUwa1lhYzhDN1pXYU1OK3Z2L0lPTTkwUDVhak40?=
 =?utf-8?B?cnZRY1RhL3EwdEF3dUxKQWgwZ2VCUVdhSXprRE1nZndYaDFVeWJkS3YvY0Ru?=
 =?utf-8?B?TFpMRFc3aTVjSmlBdWoxU1N5UU9paGpOTXc5a25nQmhrUUlTMUEyd1cwSldw?=
 =?utf-8?B?OVpuK1luNkljdEFXY2lXZEt5WXh2blBVUmdnM0RLZ3piK1VmeXpNRmVKdWFu?=
 =?utf-8?B?Tks5Q0l5NmdpcWswOVFxc3hBUzJLMmI2bVFGWDEzWmRYY3dXRjhBS2tSQklF?=
 =?utf-8?B?WFVtUGZrUDljeCtVVmlEQXZ2Q1dkdk1ZaWVkc0JxbDNJZlN4aE00eUVPRTdw?=
 =?utf-8?B?YVdSNmtTc2d1aW13ejVXN0dWRVZQdmpWU2dtcUl1cXFuSmdKRERFTXJXUC9t?=
 =?utf-8?Q?6PGW4yNR4DN6PCRxQiAs+Ud2B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ad9ebc-b6f8-4be2-e5ef-08dd5bd15b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 10:34:49.8830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8Vk9SQQWzhlYyASlrhiXwGukWbOVYANJiwiigx1z0ffdmGOkfILRA2InsgVRiZFSdPvelj6Ev3xVRAl89GOFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB5436
X-Proofpoint-GUID: Vx3ZHgtp4HQW96Bz7s6FvrhCA4Dwv2Mh
X-Authority-Analysis: v=2.4 cv=JtULrN4C c=1 sm=1 tr=0 ts=67c828cf cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=-AAbraWEqlQA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=_jlGtV7tAAAA:8 a=e53pv_uEAAAA:8 a=cm27Pg_UAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=X3a0BiUdAAAA:8 a=ER_8r6IbAAAA:8 a=QyXUC8HyAAAA:8 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8
 a=1UX6Do5GAAAA:8 a=Bq6zwJu1AAAA:8 a=c-n4J4-pAAAA:8 a=JfrnYn6hAAAA:8 a=voM4FWlXAAAA:8 a=w1d2syhTAAAA:8 a=SXsqmeqgKWCo4p8WRO4A:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22 a=nlm17XC03S6CtCLSeiRr:22 a=i2WUat-zol0iyFTidwVo:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=aWu3muFgq6otJbhCXpL5:22 a=9LHmKk7ezEChjTCyhBa9:22 a=Et2XPkok5AAZYJIKzHr1:22 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IC2XNlieTeVoXbcui8wp:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: Vx3ZHgtp4HQW96Bz7s6FvrhCA4Dwv2Mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "mwalle@kernel.org" <mwalle@kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "paul@crapouillou.net" <paul@crapouillou.net>, "daniel@thingy.jp" <daniel@thingy.jp>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "festevam@gmail.com" <festevam@gmail.com>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "lma@chromium.org" <lma@chromium.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "krzk@kernel.org" <krzk@kernel.org>, "evanbenn@chromium.org" <evanbenn@chromium.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "naveen@kernel.org" <naveen@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>, "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "bleung@chromium.org" <bleung@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andy@kernel.org" <andy@kernel.org>, "support.opensource@diasemi.com" <support.opensource@diasemi.com>, "andreas.werner@men.de" <andreas.werner@men.de>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "venture@google.com" <venture@google.com>, "jwerner@chromium.org" <jwerner@chromium.org>, "romain.perier@gmail.com" <romain.perier@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RnJvbTogTWFyZWsgQmVow7puIDxrYWJlbEBrZXJuZWwub3JnPiANClNlbnQ6IFdlZG5lc2RheSwg
TWFyY2ggNSwgMjAyNSAzOjQ4IFBNDQpUbzogR2VvcmdlIENoZXJpYW4gPGdjaGVyaWFuQG1hcnZl
bGwuY29tPg0KQ2M6IGxpbnV4QHJvZWNrLXVzLm5ldDsgd2ltQGxpbnV4LXdhdGNoZG9nLm9yZzsg
andlcm5lckBjaHJvbWl1bS5vcmc7IGV2YW5iZW5uQGNocm9taXVtLm9yZzsga3J6a0BrZXJuZWwu
b3JnOyBtYXp6aWVzYWNjb3VudEBnbWFpbC5jb207IHRob21hcy5yaWNoYXJkQGJvb3RsaW4uY29t
OyBsbWFAY2hyb21pdW0ub3JnOyBibGV1bmdAY2hyb21pdW0ub3JnOyBzdXBwb3J0Lm9wZW5zb3Vy
Y2VAZGlhc2VtaS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBhbmR5QGtlcm5l
bC5vcmc7IHBhdWxAY3JhcG91aWxsb3UubmV0OyBhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb207
IGFuZHJlYXMud2VybmVyQG1lbi5kZTsgZGFuaWVsQHRoaW5neS5qcDsgcm9tYWluLnBlcmllckBn
bWFpbC5jb207IGF2aWZpc2htYW43MEBnbWFpbC5jb207IHRtYWltb243N0BnbWFpbC5jb207IHRh
bGkucGVycnkxQGdtYWlsLmNvbTsgdmVudHVyZUBnb29nbGUuY29tOyB5dWVubkBnb29nbGUuY29t
OyBiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbTsgbWFkZHlAbGludXguaWJtLmNvbTsgbXBlQGVsbGVy
bWFuLmlkLmF1OyBucGlnZ2luQGdtYWlsLmNvbTsgY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
OyBuYXZlZW5Aa2VybmVsLm9yZzsgbXdhbGxlQGtlcm5lbC5vcmc7IHhpbmd5dS53dUBzdGFyZml2
ZXRlY2guY29tOyB6aXYueHVAc3RhcmZpdmV0ZWNoLmNvbTsgaGF5YXNoaS5rdW5paGlrb0Bzb2Np
b25leHQuY29tOyBtaGlyYW1hdEBrZXJuZWwub3JnOyBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgY2hyb21lLXBsYXRmb3JtQGxpc3RzLmxpbnV4LmRldjsgaW14QGxp
c3RzLmxpbnV4LmRldjsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc7IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IHBhdGNoZXNAb3BlbnNv
dXJjZS5jaXJydXMuY29tDQpTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvMl0gd2F0Y2hkb2c6IEFk
ZCBhIG5ldyBmbGFnIFdESU9GX1NUT1BfTUFZU0xFRVANCj4gSGkgR2VvcmdlLA0KPg0KPiB3aHkg
aXMgYXJtYWRhXzM3eHhfd2R0IGFsc28gaGVyZT8NCj4gVGhlIHN0b3AgZnVuY3Rpb24gaW4gdGhh
dCBkcml2ZXIgbWF5IG5vdCBzbGVlcC4NCk1hcmVrLA0KDQpUaGFua3MgZm9yIHJldmlld2luZy4N
ClNpbmNlIHRoZSBzdG9wIGZ1bmN0aW9uIGhhcyBhIHJlZ21hcF93cml0ZSgpLCBJIHRob3VnaHQg
aXQgbWlnaHQgc2xlZXAuDQpOb3cgdGhhdCB5b3UgcG9pbnRlZCBpdCBvdXQsIEkgYXNzdW1lIHRo
YXQgaXQgaXMgYW4gTU1JTyBiYXNlZCByZWdtYXAgYmVpbmcgdXNlZCBmb3IgYXJtYWRhLg0KSSB3
aWxsIHVwZGF0ZSB0aGUgc2FtZSBpbiB0aGUgbmV4dCB2ZXJzaW9uDQoNCj4NCj4gTWFyZWsNCg0K
LUdlb3JnZQ0K
