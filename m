Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA87B68E7D5
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 06:44:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBTTm5TSxz3cf4
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 16:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=UpwwQfwt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=122.184.60.32; helo=inchng03.tcs.com; envelope-from=prvs=3969f7b21=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=UpwwQfwt;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Wed, 08 Feb 2023 16:44:09 AEDT
Received: from inchng03.tcs.com (inchng03.tcs.com [122.184.60.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBTT56FMTz3cD8
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 16:44:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1675835050; x=1707371050;
  h=from:to:subject:date:message-id:mime-version;
  bh=8/oBhuj+3cgcDXqGf6Rl3S4MC3OSz0kPr8X9UI2LLZE=;
  b=UpwwQfwtB99tCyYis7TRPtN0jathXWnEI9yt3IT87finfd0nBQKKUA8W
   iiWgI3uEdq3IyWny8QqlIJ9o/rZD1sKIiT7piCFnF4YzslZiWCOfbIbAP
   amFvZ78PhO5bh9OxjSXXn6lIXImFiMnUk1GguYe2Wr3YcDIJB1U7WaOd2
   ZR3HvjXEGJxZnyZo1OED5Q8MwC9QvVhtk5a0B0OWcCx3vpStLVnDEwLjm
   m8lGFm0/hAFqf5krhWu/rWuezvhYFiUmJpPDzj3s2GR79lORX63rLfR5H
   iA112nb3VFpEtmCHRBYugNLCOdT4h0AqvDjhPsV0Oku9TWXOVyTpZ1ERh
   Q==;
X-IPAS-Result: =?us-ascii?q?A2DeCADyNONj/xVEqgpaHQEBPAEFBQECAQkBFQmBSIEoG?=
 =?us-ascii?q?wJmgQcCtwwPAQEBAQEBAQEBBwEBFDAEAQGFBwKFKCY4EwECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEDAQEGAQEBAQEBBgQBgRyFLzoMgjcihDBeAQwJayYBBBuCd4IWgQyrB?=
 =?us-ascii?q?gEBAXaBNIEBghQEnUGBZ4E+AgEBiQ6DUBWEMoJQgViEeIJzhA+CLgSURmqBN?=
 =?us-ascii?q?3eBJA6BRIELAgkCEXOBGQhqRAc2A0QdQAMLGyY0PzUWKgUEQgYCDx82BgMJA?=
 =?us-ascii?q?wIfS4EeJAUDCxUqRwQINgUGThECCA8SDyxDDkI3NBMGgQYLDhEDT4FOBHOBF?=
 =?us-ascii?q?wpWnQ2SUJxhlAgHg3eBUp87Fqkvl1Egp04CBAIEBQIOCIF5UIEuMxojgzhRp?=
 =?us-ascii?q?QiBMAIHCwEBAwmLNgEB?=
IronPort-PHdr: A9a23:hbPHeBe2l3sGcTiewRdvLp6flGM+KN7LVj580XLHo4xHfqnrxZn+J
 kuXvawr0AWUG9yHurkU0aL/iOPJZy8p2d65qncMcZhBBVcuqP49uEgeOvODElDxN/XwbiY3T
 4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6JvjvGo7Vks+7y/2+94fcbglWhDexe65+I
 RqyoAnetcQan5ZpJ7osxBfOvnZHdONayH9yK1mOhRj8/MCw/JBi8yRUpf0s8tNLXLv5caolU
 7FWFSwqPG8p6sLlsxnDVhaP6WAHUmoKiBpIAhPK4w/8U5zsryb1rOt92C2dPc3rUbA5XCmp4
 ql3RBP0jioMKjg0+3zVhMNtlqJWuBKvqQJizY7Ibo+bN+ZxcazGcNwAWWZNQtxcWzBdDo+ia
 YYEEuoPPfxfr4n4v1YAsAGxBQ+xC+zx1DBInmL906gn0+QkCw7GxhErEtUVsHvOqtX6KbkdX
 v6tzKXS1TXDbO5W2TLn54jSaR0hve2DXalqfcXNzkkvEhrIg1ONooPqIz2bzP4Cs3SH7+V+T
 +KvjXYqpg51rzWtyMohiYbEi4IIx1za9Ch03YY4KcC5RUJmb9CpHoVcuiKVOYZ2Qc4vTW5lt
 SImx7AFu5O1fCsHxYo7yxPZdveJcJCI7wr+WOqNOzt0mXBodK6lixuz8kWs0PPwWtSs3FpUr
 ydJjtfBu3UQ2xDP7sWKS/5w8V291TqS0g3f9/1ILEUxmKfZLZMq36Q+mYAJsUvZGy/7gED2j
 KiLeUo64uWo8OHnYqn+pp+bKo90lhnyMqQwlcy7BuQ1KgsAUXCF9Oq+zLPt80v3Tq9NgPMoj
 qTVrojWJcUdpqGnHw9Yypsv5wqlAzu70tkUgWMLIVNGdR6dkYTlJknCIPXiAve+h1Ssni1rx
 /fDPrD5GZXCNH7Dn6r/crlj805Q0hIzzdNC55JREL4BOun+WlPtu9zDFBM2Lwu0w+P/BNV7z
 YwRQXiPDbOBMKPOrV+I4foiL/SUaI8PpDn9M+Ql5+LpjXIhnl8dZbem3Z0MZ3C9AvtrOEGZY
 Xv3gtcdCmcGpA0+Te3uiFKYSjFTfGy+X6Um5jE0W8qaCtKJQZighraE1w+/H4ZKfSZBGFSFG
 2yucJ+LEb9YbzqfJMVkmRQAVKO9UMkmxxWnvhS8zKBoeLn64Cod4Knq0tR46vWbtgw3/CY8W
 9+U1W2AQnkyhmAVQjYs9Lx0ugp2zVLVgvswuOBRCdEGv6ABaQw9L5OJl4SSQ/j+WQPEK9GOT
 lvuAtCrGio4Qd95xdgSK118FNOvglGmvWKqDrYZmqbNCMky9aTRjHT0Ltx2nnDB0qRphlI6Q
 8xJYGuhgKM39wXaC4PT1UuDkKP/aa8HmiXK8TTr8A==
IronPort-Data: A9a23:XUkfYqLu56ZWGkn9FE+RQZclxSXFcZb7ZxGr2PjKsXjdYENS1DQCz
 DMaD2GFO/jYMGT8Ko8kPYy0/E0BscWHmN8wQVA+/nxgEngX95POXN3GIBf+YiiZdZ3PQUw5v
 s9BNoCaJ+k5HyTWzvuP3hgNjpXeOYWgHOeU5DvsY3gpLeNcYH59z0olwYbVu6Yw6TSDK1rlV
 eja/ouOZzdJ5xYuajhPs/jb+Es21BjPkGpwUmIWNKgjUGD2yiF94KI3fcld+FOlKmX8NrfSq
 9frlNlVzEuAl/seIo/NfoLAT6E/auW60T5iKJZhc/PKbhBq/kTe20ugXRYWQR8/Zz6hx7idx
 DjR3HC9YV9BA0HCpAgSezgfKwEufvNYwoDocHPgitCWkBz7SEK5lp2CDGluVWEZ0sdRKkFo2
 dggDQwkNHhvhcrvmPTiFbEq2JRldpCD0IA34xmMyRnCBPAqTJ3bBb3J+NpRxh8sjdsIFvHbD
 yYcQWoyMUSaOkwfYz/7DrpiluOPu1vHTAEJuWjI/K4m8nb41AVYhe2F3N39P4biqd9utkGAq
 2TM+m/RBhABKMfZziiB+3i3wOjVkkvGtJk6TeX+r6EyxgPDgDZKYPELaWaGTTCCohbWc7pix
 4Y8o0LCcYBaGJSXc+TA
IronPort-HdrOrdr: A9a23:/zJ5gqBoJ/0HSc3lHehDs8eALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcT2/haAV7CZnishILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAQGSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL7vNHOlIjre1ovGwMnwBPmt0Lv1JfKVzyjmjsOWTJGxrkvtU
 LflRbi376ut/GgxgWZ/3PP7rBbktrozdtYAKW3+5EoAwSprjztSJVqWrWEsjxwivqo8kwSi9
 XJow0tJYBa927RRGeouhHgsjOQiAoG2jvH8xu1kHHjqcv2SHYREMxan7tDfh/Y8UY7+PpX+s
 twrj6knqsSKSmFsDX25tDOWR0vvFGzu2AaiuIWj2ZSS88lQpo5l/1EwGplVLM7WA7q4oEuF+
 djSOvG4uxNSEiXa3DCsnMq/celWW4rGAyaf1MLtcOU2QVHhXwR9TpC+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVd9QbaaJmCP1EScyrCnbVSRaJKmibJl7gE7wKKm+lke+n3JwFoMWRPLAYxpo7n5
 rMFHlCs3QpQlnjDc2V0IcO9hzWWm2yUS7q1tpV6/FCy+DBbYuuFRfGZEElksOmrflaKNbcQe
 yLI55TA+XuNy/pAoZG3wr3XpNWKXUYTc0Nsts3QF6VuKvwW9LXn92eVMyWCKvmED4iVG+6KG
 AERiLLP8lF7lqmQDvgmx7aV2n2dkG69oI1E67H5O8azYgLOOR3w1gooGX8wvvOBSxJs6Qwck
 c7CqjgiLmDvmWz/XzF9SF1IRJbFF9S+6j8SHtEqg8BLlPsfd84youiUFEX+EHCCg50TsvQHg
 IajU9w47iLI5uZwj1nI867M0qB5kFj606iftM5oOmu9M3lcpQ3AtINQ6pqDzjGEBRzhEJDtH
 pDUgkZXUXSfwmex5lNzaZkRd03ReMMwztDEvQk6043cn/s4P3Hc0FrHwJGl/TnxTrGCQAkwW
 GZuJVv/IZo0QzfVlcXsaAdPFpQaGKRGtt9fXm4jS9v6+PWkUdLPCu3bHWh+m8OU3uv+EMIim
 P7KyqIPfnNH1pGo3hdlr3n6VVuawymDjRNg99BwP9A/En9ywJOONWwF92OOyf7UCp2/sgNdD
 XeJTcCKAJnwN66kBaJgSyLGnkixpItJKjXDKk9f7vP3GjFEvzBqUlFdcUktaqNGOqewdPjC9
 jvCjN9BAmIe98U5w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.97,280,1669055400"; 
   d="scan'208,217";a="855821981"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgOmAiWa8nxrmbCI6oOic1RSa/g3S8sWno9WMOh1Xl9HhJIumetahuTbspmiajDmx/C2eRXkPCR+DeSH6khwYSJQddWzKgEtWjn93FE+7OJd8D+RSflIL1BDkhwijjzVYeARLW0hWiBDDB567pwSGwjaDNnwyPyUjKJM/gYJrTN12Wad8WqaxE1Wmfexz8XbbHQp/tte+MsW8nsrJVidoVMoWVeUGiS/EVDekMBv43cCnut90ry5kbphCuJkJnSDx7dtkMdgfZTK9D2Mz8+kIjskPjhWPg4U5watjEZa+JpCYuKxmsc64j7VEWKeo4QFv4vTSKHdmHanyX8kdUpEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rY4o2dxs/2jeES8Q05xwgR74eESendb8rmpFVWTlIo=;
 b=AwubwropF0NXwo+r+HxAlSRFu/AaFXvd7rbQWLIsKz3RUo8GQWyhZsuhi6RUQddDEKzzNGbvSiLYn5Ob0Tw7XpxRXPZFCkX345lIWr93auxUG5B/m+6KTpb7q1DZbVll7wu+T/0dqhLMbP/UwkzFF6V3QCHa1goUNyzmlCQlicZ/NNmCgexE+nREgg1ht9IemTcNyv4PowEXc51Ez3NOH5t0o+LcjkixySJ/C5xKdwlSpMfPdZsMRlsSEzQoeiVNyMz+am32zH077fUTDTtOBKzgVEJux7TRBX/Z3ewhtY5ig52XMq7jQpndSyIsydJ5cvQfy+zx34/YpUsySLgwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBmc support for RISC V
Thread-Topic: OpenBmc support for RISC V
Thread-Index: Adk7f97l3m5HrF6gQVeUrhzR5EgCWA==
Date: Wed, 8 Feb 2023 05:42:44 +0000
Message-ID: <MA1PR01MB41298C4DDD52B649014A599F87D89@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-02-08T05:42:43Z;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=3c0d1927-7730-456c-a8d6-6faac6487f25;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|MA0PR01MB7378:EE_
x-ms-office365-filtering-correlation-id: 9f45fa07-7bb9-481c-0f96-08db09974d74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tC6R8iKDoRgvOu+VdWI7Dn2hcqnJ5iWZnSfNsKXUJp3WGm0VDG+6a8BxKUVVra8DYA2NmGm4GAuV7n6AFcyoV3N8uObXn1NLwTY4MO5fSQNYnZLA8WXmxLDB6UkU9lhoHZxdiSUL3a81bh63+6/jlSVX/i8sVU2d1ROqngF58R7DCWziWXDtPeiJa9rrij5dKMLXINxp2yETMj6XbDdMN6rKs22UB4+bvot6VLRziBuuCGfNvvXCQnlwRE15CZTqE9VVADQBVoskKS04FgEQrPpyDcrpMQ42udSTkwv2l3Z2eqzgccvONWs8rNY8NgSWYnu0KkRB3ZGxut3uMuU4aJM7O6ZXDZRkNVsGJ9HmD4RjCL9w4kmjhwVvr99FFhz5N8OsfW14b/ZqdH+jhVBsMs0qXqg1waKbE4+8gh2YAVRtsS3lO7+FnMngjEvMvjAqdxc4yeC5N3oEKngZBPlIewVQlQ6PqhP5iZht81ZdQ0dgZy5+s22d55VtPWikbClcJaFMzZEa+wPZyO3zv0Rc3VWD9o0cqJtiphAzTIZ6NYoA5qnqaDYHTRkXcjKXzFsUtML1VWn89yRpQlmtL9m4c2QYnJVYISvCtY3xtj3kQMsGaxAj037x50vDrjiDcnBQPd8XK6HfM+hWdMcADeW+ZnxtlQE68jkxCyAG0UW/4z9g7ObkGJ1P1YHJkOzjRe0xyJC7GkLCMmlPdjws4v3mVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199018)(5660300002)(2906002)(186003)(9686003)(71200400001)(26005)(6506007)(33656002)(8936002)(52536014)(66446008)(64756008)(66556008)(41300700001)(478600001)(86362001)(7696005)(82960400001)(38100700002)(55016003)(38070700005)(76116006)(558084003)(66946007)(316002)(6916009)(66476007)(8676002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2v1yxrh6/6KTIM8awspSqxw3lbUfD22vTG9UW3JoXw2kbUf34P5bBvCuFmNq?=
 =?us-ascii?Q?1IMkVIH07nJT0PVJ3PAXz8VH5Y60n8hNSqrqS5olhn6mrVa4nBuqOKzQ2XUn?=
 =?us-ascii?Q?S/XjXuNPwJZEvKlCCozxsMs45Wps0veUy0QYBHM+C4d+s0uCa3xD7kq19EUu?=
 =?us-ascii?Q?aQGpgyijAtzOxrrnN8qmI9WB057rUZk7JoJngqFLRiG3Cni85HsPoIDf4cVs?=
 =?us-ascii?Q?pYsllHILsCcD5AmoOglNGgoKDqN8mmJsu4gnBw49vei2mdOQUaHi/NRV1HQo?=
 =?us-ascii?Q?HrzSS96a3daFhWhvl+aVGrLKeO2YPI/8JpbHqRY1VTGGNY+VgHx6u7PqU8oe?=
 =?us-ascii?Q?5QR2ukyQsQa/xH7qmpmkwvcd7apsVNLSPyAqtMm5goc/0/ynu2ctnQMl2MO3?=
 =?us-ascii?Q?uwJOeK+MuZKiViaudziCOMl99prZX2fbRBnoY7tbL78H/ExqN/xC+e4XYV8q?=
 =?us-ascii?Q?00cURc0kess3c7YX7V33hVJ8+zEMfaeDyQVdf3HRYnrtzXV0P368WWyTwWGI?=
 =?us-ascii?Q?Gum637q1ROqElBt13KWeXwUAZwMnPHQQrXiKekViAoMZK6lxZZoklhvjABAu?=
 =?us-ascii?Q?26ryZWQXgxaSH9XL5sU4r/pFrXKmCD4UljxZ9Z3crdt2495Nhwb6I50/eul+?=
 =?us-ascii?Q?dEbyj/MbIGgqIIYSAMC78f40XpAvchdKH6SySHMhs6DryvW6tJ7siOaZ427x?=
 =?us-ascii?Q?yd2lb9d1cTpwOBXekUEbnoYr0lZ7NYescZdfYV5JsQfPbiyW6J48XHWLv53R?=
 =?us-ascii?Q?YJZlCktDoTzHYT5dyYNmz5eTKc8at53G3kH8GAmAy8Y+L8u14k1nj4GTdtf2?=
 =?us-ascii?Q?CWbnbyiJ0oKmIohK6sdya5U0dDy5KJEoOKJcHLfGwUDO9VLPVIYtpwweJpwq?=
 =?us-ascii?Q?xDyOyPYTdQZdz6i98UDLKA57SOu9pZCUYR+DT46OtfuIAGBuZLpc00GQC2z9?=
 =?us-ascii?Q?JhdfHnMTh5KlFcPfdXTKNvgzO3cTa8KDR0v0DJxzMwhA6VK0wk56zocAi650?=
 =?us-ascii?Q?HfNpjQc2AOBrk1bwz5LsDH7lE9th/sRAIKhTwdebpnNdeinU+apU6y49NFVl?=
 =?us-ascii?Q?ajOPQv83YN1lPUKM/oSHegQ71+2mfwTsDwG4BgNQNsK/3Mp/c45TnaYohZzY?=
 =?us-ascii?Q?9+PxeSYo6GnGKO8vLEBF5qZtP2HroTwQPF/e9d4Dwc0NzW02a+WQkSQXsZ7P?=
 =?us-ascii?Q?xjPTDMeSNnlpRph+bA4qXnuVuB9+EXpW0kotjru2KlNRCepBuk0tWNuzPBF+?=
 =?us-ascii?Q?N2wXO+CnQxEduM9wx2W7g2sR7Hn4+A+DdmLD6usHPxABl5Jw7yt4xwfSkkjR?=
 =?us-ascii?Q?zxaMR/1ellMbsbvFxpgJ+q8X2IYEK7/BTZ1Eat3Nb1azyoYYrTij0dyahpIV?=
 =?us-ascii?Q?sTXfsTH9GRFyfrw203+CqYSFTLJlyw14ZrYlPtwNpZfUrx+rt3w6F+H7p9RF?=
 =?us-ascii?Q?CbfyN2HR8xWzKwDjFWCXr8GQJ7NJulg5cwVYlVzJqN/RAfgeOrHzD70BTKaD?=
 =?us-ascii?Q?zTckaRxc0RN4p4jjyS/8B31eV6RmFbYOhySR4vl5eM5LQYcJgzqYewXFz/JE?=
 =?us-ascii?Q?tPEArD3/fd0WqYZ2/xI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB41298C4DDD52B649014A599F87D89MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Em/F/PxE7FJB5rZiz+NwERKTQQV3kiE+nr53UqbZ9NNjc3LqzEpxRW/TCyHWReSs+qqkGDleIhN0+LVbV/P9kNnijGo7JcmFrJQKNDalPjTMJPfkJWxNaQE/XsM3TRe+mMc18ZaQ8NqaXM4CsNw4TELVXtWtwCKyD0Gofvlx8nznUWcPiQxRFj6bPJs9dmW5Bx9IjciIc+7HK6Ar3zBZJBD2svyMK9honX8BN57nst5V0A1OCXkdEYRWAxRGXQOiz8NesgEOd1vX6DPuAcjDtNhNGkgIVRXI81Z7h4vn6Kqq6j34MKwYTEyU8KdTUsahbwGHG16xoBuM4FupqDG7KEth4CwLePjBW1uYtDTC3yYluvtsT/xDMloj6GjRnAsKvzd7L5IMaqxb8q1vZS9DSBzun0DHPJ+E+HLkk5wfcWFBtrsFAeN1UOJJZ6a0SQ8B9HC2I2uvAoUSXDc/w5qTzw9mqRr9zf09kP/eSzIZ1tFHYsFhEtjp2e27dN1dkmWG1WuD1RckkBrcZjb/ohy30oMvOa/jI1rgtd1Gc+Mo6ssk9duvBTylTfshVqjco3wP6pDaNtijXbTqb/tHtKUoWvBM5LKAlJauQvaSuMC7ci/UBUCu7X2cj7f56vwiNWwFLcrtznScvYyO8/nrRShDGnBDhFQ/LlmRbnEV4QdWzj/OXoCHGG5S2TwP7LdPqBR1XOHKqenZ2HySISlKez4UGRW34c1NQY50kNANUm19QLzfjwx9Vb3LT36h8OB/QXC2Cpzg2kKDy76zjOUPBOl1tC+9F7pJ2XaN4dR44HO5pNk=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f45fa07-7bb9-481c-0f96-08db09974d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 05:42:44.6751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJIz2wWYy7wNCI5fbUY+jA+5x0KwozlaToiH2vxcGLOkK2X/FstDznYpjEM6Kq7T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7378
X-OriginatorOrg: TCS.COM
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27434.002
X-TM-AS-Result: No-10--10.834900-8.000000
X-TMASE-MatchedRID: pj4HYrB/oXZyT9Lk7c70V95x7RpGJf1aDGPdYDozjWP+7KZICEbEssnw
	pkV7euuvtsDkvuS4EQsXlxePCzMBLEdb73gUDwkXKwi7MItzaY3qvccKLF+4pxziuLhElX/Vb9E
	MBlN1IjcP4aT1dGzYAYPbw023vELIhbTQ15Ff4GvfSQNpZkETVNBO21OxlsovB4N9b2b2Ot5dH+
	Gf7hAirWUBu1X0Aadz9yaXhPhnUZ1FLl5Fk0ov0dwWRN30KO5Pd90yS//gJoZf0yVReoVM7TRif
	7JSrYOq515WlqfwoXxF37kzro/Xgo9oUcx9VMLg/sToY2qzpx6mHa6PLd1EFvoLR4+zsDTthUfR
	2rvBju6nw52XVXCkJLIGldNHldAFuzvaF3cHQP3nplyWGoiJJqYm9u5qOLR74T3DrnIhkMCM6Lj
	k08KDxMw1PdI0og9b1UIMXv3gvnrThhl5IR7yQlgpWCbva+Mm
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.834900-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27434.002
X-TM-SNTS-SMTP: F4EE6464FD2BE8E50B4BE333717AB6869714B996B243A5BD4DBF72A6A81A42B02000:8
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

--_000_MA1PR01MB41298C4DDD52B649014A599F87D89MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hi,

Is there a support for RISC V systems for building openBMC ? I don't see an=
y specific layer for RISC V in the OpenBmc stack.

Thanks,
Sandeep.


TCS Confidential
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



--_000_MA1PR01MB41298C4DDD52B649014A599F87D89MA1PR01MB4129INDP_
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
<p class=3D"msipheaderd4f7db42" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Calibri;color:#000000">TCS Confidential<=
/span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a support for RISC V systems for building o=
penBMC ? I don&#8217;t see any specific layer for RISC V in the OpenBmc sta=
ck.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep.<o:p></o:p></p>
<br>
<p class=3D"msipfooterd6682aa3" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Calibri;color:#000000">TCS Confidential<=
/span></p>
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

--_000_MA1PR01MB41298C4DDD52B649014A599F87D89MA1PR01MB4129INDP_--

