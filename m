Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE166DEAE0
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 07:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px9qG0htxz3ckZ
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 15:14:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=PWDWoRAl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=121.242.48.116; helo=inblrg02.tcs.com; envelope-from=prvs=459c351c1=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Wed, 12 Apr 2023 15:13:27 AEST
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px9pb2G5jz3bgy
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 15:13:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1681276408; x=1712812408;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version:content-transfer-encoding;
  bh=fJ7CuZrM2V611w+YFYlp5Bdlq5sxt/uBd5hMfb+xhMI=;
  b=PWDWoRAloK3aCPf4vZwtLZAm88B1GTjx5Bkeyn6fteeXZiXNnRpD0jrP
   9Q7QGe5KB2WXDgBc6GMkugHTtXSgUJuk30z502oOHnNmJLTZvZYAzhZq/
   OLLTimrsXVHGz1q5M3xIb6rP/BBX/3juR5SdD4FJBqEjg8devFn9LtFaS
   WxCVakT7hhL4ZV3Od58ODXQhoh7gHflPOlLUPjAd7CqT7kcgusnl9SaMz
   xV9c7koXAfV46HXiUltHECHugnEwKc6CbMwuBqHegfh4DLT5NJbderX9D
   VhQq3FXpA4Jiiff9vfVKI56N8PYEb8ZaYIThchNsZue1NjIsnxnIAfqK2
   A==;
X-IPAS-Result: =?us-ascii?q?A2AsAACVPDZk/xREqgpaHAEBAQEBAQcBARIBAQQEAQFAC?=
 =?us-ascii?q?YEyBwEBCwGCLXMCgVoELYQhiB6JEp1cFIFqDwEBAQEBAQEBAQcBAS4NCQQBA?=
 =?us-ascii?q?YISgnQCFjQFCYRlJjQJDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgQBg?=
 =?us-ascii?q?RyFLzkNCAEOEIIQKQGDIgEBAQEDASIRUQQCAQgNBAQBAQECAiYCAgImChUIC?=
 =?us-ascii?q?AEBBAESCIJ3glwTBqs/AQEBeIEygQGCFASBOAGcC4FhBoEULQGHSh5YYINSF?=
 =?us-ascii?q?4Qwgk+BFUOCZz6BU4EPAoErARIBIxWDRDmCLgSJdJBVgTR2gSAOgT2BBAIJA?=
 =?us-ascii?q?hFDKIEQCGaBeUACDWQLDnGBSWNMgXsEAhRFNwNEHUADCxsmND81Bg4fBQRVa?=
 =?us-ascii?q?wsjJAUDCxUqRwQIOAYbNBECCA8SDwYmRA5CNzMTBoEGCw4RA0+BRwQvRIEWC?=
 =?us-ascii?q?gZLnnGBQYERB4EPkmczg0ytJweEAYFZiHeBIo0WiBsXg32MZphflyFSII0zl?=
 =?us-ascii?q?QqFGQIEAgQFAg4IgWOBJXAzGiODNxIBP45UFoNQhRSKKAE8dQIBATkCBwEKA?=
 =?us-ascii?q?QEDCYtFAQE?=
IronPort-PHdr: A9a23:yH0WDhF0/2L+JOBw+Jcppp1GfyxKhN3EVzX9CrIZgr5DOp6u447ld
 BSGo6k30RmTDdiQu6MMotGVmp6jcFRI2YyGvnEGfc4EfD4+ouJSoTYdBtWYA1bwNv/gYn9yN
 s1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgppPOT1HZPZg9iq2+yo9JDffQVFiCCjbb5xL
 Bi6ogbcu80LioZ+N6g9zQfErXRPd+lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q
 6VAADspL2466svrtQLeTQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms8
 6tnVBnlgzocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSXZEUstXSidPAJ6zb
 5EXAuQBI+hWspX9qVUNoxuwBwajGOzhxTBTi3/qxqI2z/gtHR3a0AEiGd8FrXTarM/yNKcXS
 e270bPHzTPeYPxIxzj98JXDfBU8ofGJR71wa9faxE40FwzfiFWftJLqMC2N1ugXq2ib7PdgV
 ee1hG49sAxxviSgxtw2hobVgYIVz0nJ+CNky4k6OdO2UlR0YcK4EJROrSGaMZN7T8IjTmx2u
 Ss217wLtIClcSUWy5kqxQPTZfKEfoaG7BzuSemcLDN3in9ld7+yiQi//Eagx+D4SsS50EtGo
 zdLnNTKq3sD2RvT6s2dRft8+EeswTWP2B7J6uFCP080kbDXK5k7wr4/jpYTvkXDHjP2mEXrl
 6CabFkr+u+t6+nhf77opYecOpdphg3iKKgih86yDfgiPgUPXGWX4/qw2KH78UHnQbhGkvM7n
 6zEvJzGIckWp6u0DBVJ3oo+7huzEiuq3dEdkHQFKl9OZQiJgJLzO17UJfD1FfK/g1Oxnzh13
 /3GJbjhAonVLnjEjbfhYa5x605Cxwo3ytBS/5FaBKkfLfzxQkH/utrWAAU+PQKq3+vrFc1x1
 oIYWW2RHq+UKL7evUOS6u4yIeSAeJUZtTf+JvQ/+fLikWc1mVoHcqmo2ZsXZmq4HvNjI0iBe
 nrjmNEBHnoUsQUgVOzmkkWCUT1OZ3a3Ra08/Co2CJ66AofYXIyinLuB3CKjEp1QfW9JEkqMH
 mvwd4WYR/cMbzqfL8B5njweSbehU5Mh1Q2ptALi0bVnKPfb+jcGupPtz9V6/e/TmQsz9TNpF
 ciSyXyNQ3lunmwUXz82wLx/oUtlx1eB1Kh4mOdVFd5W5/NSSAs6NIPTw/ZgBNDvQg7BZMuGS
 E66QtW6BjE8Vs4+w9sBY0tmGNWtlBfD0DewD78SjbyLC4Q48rjA0HjpO8Z913HG2bEmj1k+X
 MRPM3aphqtj+AXIA47Jkl6Zl7qxdagG2y7M9WODwnCVs0FDSgJwVr/FXX9MLnfR+P946lnDR
 PeKBPwINQJdxNTKfqBOZfXqhFJKAvD5N4KaKyi2g2q2DxOD7reNd5bxPWIP2CzXEw4DiQ9Zt
 SKBLQU4DCKqi2bfFyB1U1X9Z0rm6q95snztCgcSzgeDYwVZ3r6u5xoYzaiaSvUa0poAuSE8u
 3N1FlP71NXTXZ7IhQ1seO1nfdo75FpWnTbbshdVPJm7aaFuwFcDJUA/lkXizRhoQqdNn8Ynt
 mJimAN0JbiVz3tIdXWZ0db5J+uEBHP1+UWUYqja11zGmPWL/64VoKAjolPvsQyxUFIh7nBuy
 fFJ2GDa7ZLPWllBGantW1o6okAp74rRZTMwssaNjSUE2eGcvjzD3ocvA+0oglalcsxEOayJX
 An1D4UBBseoJeBr/jrhbh8NMO1IsqJhOcSgeqiK3aexN7NmmzSrxW1M/IF61BeK8CxxAu7F1
 poI2beWxAyCAiv3lxGqtcWk8b0=
IronPort-Data: A9a23:3Hfdga2fGpv0GCMHGvbD5ZJwkn2cJEfYwER7XKvMYLTBsI5bp2cGy
 TRNXWmHOKmJZzD1LY1zad6wpk5TsZ6AmoM3Gws+qyowH3gapMbIWoqQJxqoYCrIIpWeFhNts
 clEO4SbIZ4dQy6HrH9BEFRBQVqQd02sbuChYAIREnkpHWeIcA941VQ73bRRbrdA2bBVOSvU0
 T/Ji5CZaQ/NNwJcaDpOsPrf8Uk35ZwehRtB1rAATaET1LPhvyRNZH4vDfnZw6zQH+G4tsbjL
 wry5OnRElHxpn/BOfv5+lrPSXDmd5aJVeS4Zti6bID56vRKjnRaPq/Wr5PwY28P49mCt4gZJ
 NmgKfVcRC9xVpAgltjxXDEAIQEkOaBo+4OdBn++uO+9nhafUGPFlqAG4EEeZeX0+85WJ0pu0
 9A8EBUxR0nra+Cemer9E7Y0wJpzapOzVG8ckigIITXxFv8gTZ3OW+PS5sJd1S0YmstVW/3ZY
 qL1bBI1NU+ZOkQfYgx/5JQWp+KSjCjWShpitVOYqvNu8WWO4xRw+e24WDbSUpnQLSlPpW6Ro
 G7c8nvRCxNcNdDZwCft2nCpncfNmDi9WY5UHaDQ3vVuj3WQz2sfThoMWjOTpuG0jES7UPpbK
 lcI4Wwpv6w7/lftScPyNyBUu1bd5lhFBIIWTb18slnlJrfo3jt1z1MsFlZpAOHKfudvHVTGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:OeeFlqqqTIIC1JpgQmQBPCAaV5o8eYIsimQD101hICG8cqSj9/
 xG/c5rtyMc5wx8ZJhNo6HiBEDiewK5yXcW2+Ys1N6ZNWGM0gaVxelZnOzfKlbbakjDH4BmtJ
 uJQ8JFZuHNMQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.98,338,1673893800"; 
   d="scan'208";a="213111803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m825yJcowSXllLlZPGROq3uDX2R5vgNvg6+ERxxtnEU7fOaE1rn07R+/OZwrJFXC0v28RVdr0LqStLO3haoQ6og2j6OZJSQlU9oBiPELQCn5Xj20VIV/AEIbR2/2kGJicrJcDoyOs3YqXAG0En66pFoIm3LzVuUdMX58l+6ATekXEHuX+d69VOuCpXMC2T2efz+Q6N6LD1ayBGtds8zL05PN63gUvwFfJ38HAbggeELLobyMlEZyQaM9aDigeQ5DXVV+4nlqun9XO2Vv2h5HkAcBrYEdKSlEkaUIgMc0c70087txKfupZicFLYh4YmT17spQORuRX6BuveUudXrLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JwdS5vg1IRKPBlUxyI5/TXvexstTlNypU0N1xAuK0c=;
 b=eVFRh+4+FL4hrYdcFesCc3MZ0xPMS3NGFF7dhyt+O6oMLhlTABdBxkIILwEDur3p3gE5syOpz07pb7+HVdHnztZk6mj6aLIA4xQpbssIinekysHy0s/NEis6c3yHwZzgwBvLhXbeBbv2RjqpBpq+KV7n0mzGB+bqAsII2XIwco6PKrgKyM3fys3GDNeSbstTVkj8DpJOzGweEnMz0KJmmYGXDlDF4b5v2fPv2kAWwSZrEPYGqtsa1jP0QS55BY0oI1Pd1juO53EksvUvFEs38ODfj/6VNUUU/BIeVhjUJvnA+vwvMGSjMJ4eUREbSFHGhDcBaQBSW8bXlgOZGM0/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ninad Palsule
	<ninad@linux.ibm.com>, Joel Stanley <jms@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>
Subject: RE: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Topic: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Index: AdlnvJ+n/GpqnOWCTXuloOzDKwOlRwACYiMAAU26xTA=
Date: Wed, 12 Apr 2023 05:12:02 +0000
Message-ID: <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
In-Reply-To: <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=5c84f553-5d3d-40a2-91f0-69272f7b4569;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=0;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-04-12T05:10:19Z;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PN3PR01MB6628:EE_
x-ms-office365-filtering-correlation-id: c113163a-66c4-4b33-65de-08db3b14736c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6OTGrMORm34TULA79+GH0cgwk9H4Lj5JKW2A+out4q0SGBaR0SMXGmOLlsVQJkoLflL5/dvU6CLMsmzlyY48boE4RDxGXyZ6HbZ+6TpS3KLFemQt75lgD1VEQj3OKJKyM5Gl4IH2fSo1avoBZdYSbQaPJzxBdGoJgclw+6DHMcD+agWCnp1ntMYvYuHG23sBmFS/9LIqtAgkraTm0mwGbfrWYqMYV3SUDm6zV2clUJiDflcikZVLq7uXd9AzXk4t56CE4A98jUuPHucVIjNH4Ilbli3HNjbD5BIWBaS/yKG1LkYoXXPd3/KmsisPVxOyVZMcD/KfXptKA5jUDj7fdPFKX23SkM8m73mOUdvgLeyuLmfQHCjQriTTTcfAo+1G+Zt8uA+/KuoolOiQMM4mw6r7uJC+EHinzGkjSty9i6KS34MVS9EHcSvl9d1OpviJzI8Ltci3ya1vPJ2h37rFB/Xo+BxDqq7nVnxi2AM72k6y7ernd31KbdGKpJAmIS9hzN0EZqJeMVJRNttuL8KBCXT2uqUf9kNBEh6ufMDLtAQb0IaAqUaPVmVvWfxl9x3ISQYScKn71I3isNsFigpAU1Bf8Q6SKGmqXf9AeDcDm3M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199021)(33656002)(38100700002)(122000001)(5660300002)(52536014)(2906002)(316002)(38070700005)(55016003)(86362001)(8936002)(64756008)(8676002)(41300700001)(66446008)(66946007)(66556008)(66476007)(82960400001)(966005)(83380400001)(76116006)(53546011)(26005)(110136005)(9686003)(186003)(478600001)(6506007)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUUxZTlPTFJ0TFFIUFMwZDZSYnJRMWt2NURvOXhCbzQvUTd2MjRSWUU3VDhn?=
 =?utf-8?B?eVRyUVIyczJzVmZnUzVrQlg5c1o5ajJqY0crOUllUnFQeEdhMElKcXdIVTRv?=
 =?utf-8?B?cVRvS2ZqT1BJM3hWdjVTanFCM3NGN0NxMGJldHNWNVhiNGorSnZzNWZvZXRU?=
 =?utf-8?B?QlNMby9qZzFrOEpKQms2a21WYm9kVHZ1RGcyME45ei9VWENNRE5IdVMzVFBa?=
 =?utf-8?B?aXNxYnlJUXg3Ym4rN1IrRkJYdlppVmEwWGxVcW1SdHpTYlhMSkJDTlV4bWdK?=
 =?utf-8?B?ZVRheUIyOTl2S3VaN0tOSU1YWExpeFdZVGhwelQwcXJvZG9rVlpGL0pzbFRk?=
 =?utf-8?B?QlVvK05MaGoyMWh3UGVGNyttOFVRUUIzWWVwOENBQ3JyL3hWemE1OExZWUJT?=
 =?utf-8?B?Ny9mVFN3UkViMGpKbzN2MHNSV0VxUGhYK0pCc2E4cXVYanYxQkduWG15aThE?=
 =?utf-8?B?Y3VWVzI0QXVxZHFER0V2Sk9TZXgraWJPYmFGYVVIOGt6L010M0lrVGEzcUVU?=
 =?utf-8?B?YkhKNGlzY0NyQlRzYzVCZEtQU3JQYmxXMWNOZjVVN1R0UlBQYXdoaXFrb2tT?=
 =?utf-8?B?R0g5UzZUZ1d3cXQ0aFRCdHRDemZiN2NTR245Nnd2SHJTVEpoVXZDS0hlNmFk?=
 =?utf-8?B?ZnlMUjN6S1pzNXZxREtpaUoyVFFhamVablZ0OW1JQllBbi9wbmhubnhIL3lD?=
 =?utf-8?B?RDltU2I3ZHpXZ09zZ3oxc3RMNWdUT0thMlNJY212N2hPRUlOMjh1eDQwVU9V?=
 =?utf-8?B?NmtqS1BMb2dwTWlzNVJzbmVNRTFLencyVGpYWEVRQVVKZmZuUDY1NkZLcThy?=
 =?utf-8?B?SDIwQ3h5TEdrZ1dWc0VVQVhZc1A5RWdmNlJ0RnVTaEsydzIvTlRJWC95Ly9Q?=
 =?utf-8?B?MW9iazU2TEUrbmZGQ3l3V1FkdHdUNFBjQktnZWpCOE5adWpOYlJyajBkcDh6?=
 =?utf-8?B?VWNLaXdOQ3lmWW1ZMnZlak0yMXpqUWpCN0Z6SCtCVUZXTTZSa21jeWdVVnJh?=
 =?utf-8?B?SXA4UHliZ3gyU1NTRVV2TFQwd21xc1dXNmFzVmFCNW1JeGhhRVpPWXZwaCt6?=
 =?utf-8?B?bGI4YzlVNU1NeUo3TFdLdEdWQ2pYR1BXSWh0Um8rTFVLeTVzbXo4NGpjSjJV?=
 =?utf-8?B?SzZiUDFpZ2lJWUZLY3BRZUtyVktqRjdnSDdWREJMVnhhdUNuYU9FSmgyOFVE?=
 =?utf-8?B?RVBlZTVMNHRZcGpHdkN2Ymw5bWtlWVFKTzNaNzVOUi9QMm9QVTh3aHQ3b3o2?=
 =?utf-8?B?YnlaVk9VOTNFSWJqR3lMMjB0ZEhiMXFyUk5rRVdMWStoMm1ScHFDR3VkdFQv?=
 =?utf-8?B?U2Q0UExidFBmZkJtUzE3S1d2VEdsak1PUjJHR0NiWVc3b21JRHNuaWxSMDlT?=
 =?utf-8?B?Z3dWallNUVpUZ3VDYWZYYThLNm1VVjBDYm9vTEtMV0xSWkU3cE9aV3c5S1VB?=
 =?utf-8?B?V3J4TlBFcVZ3K2J2bnFvQko5NGtTTXlHaUc5WVRDaVhmQ3kvQ0hjdU9wODJV?=
 =?utf-8?B?Y3FUVmkyTVQ1Y1hSMnhHU1E5MmRNS2llNWY2aFhRd2RLOXNVU1NuTjRuNTFD?=
 =?utf-8?B?R3k1OXFhVThpMWNWT1k5OVBPTWRVMVQ4VGpkeU1YbDROT0liM3hISU1KVWlj?=
 =?utf-8?B?cXYzOU16TG00Yk1XaXNNL043aXVPYjFoaFpwRXpuaTBvZjFQeXZaWUp0VFMy?=
 =?utf-8?B?ZVp0UVg1ckhNN0dqZkF5MXpFOHdJd1EwN0hrekVENVlDVHp6azJQa2toQUty?=
 =?utf-8?B?NXFLUVBGa2pOYXh2Q2lrSkdZNmxWRUJuMUx3WmRaK3VQalZtaE80M2EzUXhQ?=
 =?utf-8?B?eU52cjJpa2R3YjE3bXo2cGVvWk1pVHdsTnBPT2VJVVJmVnJBZnM5bGtyaG9Q?=
 =?utf-8?B?ZTZPclB3QWx4bzRneXNEM1lJOVlmMTd1N2tiL0htaFhheXUyL1l2QkcrbGly?=
 =?utf-8?B?SjE2VGNMWTYxSkp2R0JiNTY2VlFEYUVEZzlJcjVrUWMzZE9QbVp4MUZ6UFRs?=
 =?utf-8?B?M29yTmVTK2JzdmlRMUFZb3FZcXZzQUwvbFg3MVE1U3RvUW9xVlorUFJYOTJs?=
 =?utf-8?B?RGhzOTJMakFwWEZzejZpUHlsNFlwU3ByTVlHbEthelRUNE5PbzBkWlYzcUVj?=
 =?utf-8?Q?LW9w=3D?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: T9LeDmiKthx2dZMGOejNfTBC4INS5Ao7cM1M1qfqj04ril/FmYDhdY91diwZkuGDDxwr0tg6g31dHManCx2cmqNqwXxhLd/sGIWup4GXMKcgVnhGQiWidUkeRrgt2I1JRRKULmRntQ09ig7fcvXJcDsxfxcBlno08GZg3QLok/Jsc40fbPMf6TX+qsPeL6WYcdkakXRFF1Hizc+Ln9ejJbz7NlskNwoyFRs0DcLdu7Lux9G4bKj778BykTylNl5zfxitcxFzb+AqFMLLqhGp0ib4WJ7ompOmx5b+Vs2RMIcj8z1d4pspajjedGpvdlaahc15Vf9v+ip2NdMWI4V11p2+U12seDvnDcCuoHcSV5e0fNj5p0/KlbUghNvQ2QRLOkRCGIByYfSgiwEpH0zA8BGZvbvIbqFmSeSLvk8nn2L3N3kS5hjwpK8xN0BLFdNb/s4PCHTDJZTrtAr2fr96te1QQ3AFnvCjGBqFXs1Dr2GogDD6k2UwwN+l1vKwwjM1+IN0pvcd5XPPfWhctSDsqoD4rqXa6m3Y9I9LL1c66tO3FTGmx4JHrNJDxozENOLKbyfOMRXJ3bitPBdVU69XKzyJ//RoDqKomqmL2GWCPNnAUCrO1N8duSma3k0SgEiRqPj+g6d6k0lhqvZWkgYJVfRNc57XR3tbJC4P1gz2LhbPgvBBVAMKkSbozP9Bx/Q92WV8ciH/prjOKgw7SR/sBFdpxcpNzL0SWwJlpbPzt1SsEPJf+sAOwjL0UpgWWn3RBGzOZsCn58u0v6vWzsvzhUzDy92kdCHSWcyNLZvSrrG4zCao3r2pl3y2lyjtL8sckN4I1iyczU8jmD4bMQ/2dINrbkSoNavGF4G0bQQVeIu0hV7v4eRV0brJLMFPzg8e
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c113163a-66c4-4b33-65de-08db3b14736c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 05:12:02.4894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2TJDh6r1fpq7XBtFk49pQY11N9sjV2NaO6fVLYnVlueiEBekID2Vo039ZO/WzJo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6628
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27560.004
X-TM-AS-Result: No-10--10.528200-8.000000
X-TMASE-MatchedRID: UuaOI1zLN1jAIiGVQCd+Fo61Z+HJnvsORWl9Bl0RPNaNiKnsxFZrQCyB
	2QdJzFQxuYhCPdC+eqGRT2RRsSFe2aNu8YiLlIJQsKXAHHQHe95R3sGN+j7mNBXsn8ikX6GtZAu
	8acU1fbNFJJNtxP84/wiTEoJLe9VADtBt+r/CzCo4zRqVgiL30zmnLV0DZ9+SYUdWP7oX6shxCf
	sCLFW9XOmUeFxbkTOM5m1tVCx23SjfytYpCSLCzhMXUu1hb2VrAajW+EL+laOkS8ofY79gjNuei
	HTXMaT64QRvjxz49tGmO9JfpHloPi+3xqQ44pFWlOneJcroAxRO7662jaYapwZZ8N3RvTMxo8WM
	kQWv6iUVR7DQWX/WkTzvSj1BF/M78dA3q/uj/L/EQdG7H66TyKsQd9qPXhnJ/4rWvpj9UchoEvw
	0p8P8VDnb370beSXt9CFnhT2AUF+AmSoLb8j033JM3i2VW8za
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.528200-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27560.004
X-TM-SNTS-SMTP: 68BDB6AFC841BA2613C7FB9BC85DFE5CA6603E69E0B256694967BB1272CA57C82000:8
X-OriginatorOrg: TCS.COM
Content-Transfer-Encoding: base64
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

IFRDUyBDb25maWRlbnRpYWwNCg0KSGkgQywNCg0KVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBpbmZv
LiAgV2UgaGF2ZSBzdGFydGVkIHdvcmtpbmcgb24gaXQuIENvdWxkIHlvdSBwbGVhc2UgcG9pbnQg
dG8gdGhlIGV4YWN0IHBhdGNoZXMgdGhhdCBuZWVkcyB0byBiZSBhcHBsaWVkIG9uIG9wZW5CTUMg
UWVtdSA/IFRoZXJlIGFyZSB0b28gbWFueSBwYXRjaGVzIHRvIGNob29zZSBmcm9tLg0KDQpUaGFu
a3MsDQpTYW5kZWVwLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgNSwgMjAy
MyA3OjI1IFBNDQpUbzogU2FuZGVlcCBLdW1hciA8c2FuZGVlcC5wa3VtYXJAdGNzLmNvbT47IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgTmluYWQgUGFsc3VsZSA8bmluYWRAbGludXguaWJtLmNv
bT47IEpvZWwgU3RhbmxleSA8am1zQGptcy5pZC5hdT47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdA
YWouaWQuYXU+DQpTdWJqZWN0OiBSZTogSW50ZWdyYXRpbmcgc3d0cG0oYXMgYSBzb2Z0d2FyZSBU
UE0pIHdpdGggT3BlbkJNQyBvbiBRZW11DQoNCiJFeHRlcm5hbCBlbWFpbC4gT3BlbiB3aXRoIENh
dXRpb24iDQoNCkhlbGxvLA0KDQpPbiA0LzUvMjMgMTQ6NDgsIFNhbmRlZXAgS3VtYXIgd3JvdGU6
DQo+IFRDUyBDb25maWRlbnRpYWwNCj4NCj4NCj4gSGksDQo+DQo+IFRyeWluZyB0byBzZWUgaG93
IHRvIGdldCBzd3RwbSB3b3JraW5nIGFzIGEgdmlydHVhbCBUUE0gYW5kIGNvbm5lY3QgdG8gb3Bl
bkJNQyBvbiBRRU1VLiBIb3cgZG8gd2UgYWNoaWV2ZSB0aGlzPyBNYWluIGlkZWEgaXMgdG8gZ2V0
IHRoaXMgd29ya2luZyBhbmQgbWFrZSBzZWN1cmUgYm9vdCB0aHJvdWdoIHRoZSB2aXJ0dWFsIFRQ
TShzd3RwbSkuDQoNCk5pbmFkIGRpZCBhIG5pY2UgaG93IHRvIDoNCg0KICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIzMDMzMTE2MTMxOS4yMjUwMzM0LTQtbmluYWRwYWxz
dWxlQHVzLmlibS5jb20vDQoNCklmIHlvdSB3YW50IHRvIHRyeSwgdGhlIHBhdGNoZXMgYXJlIG9u
IHRoaXMgYnJhbmNoIDoNCg0KICAgaHR0cHM6Ly9naXRodWIuY29tL2xlZ29hdGVyL3FlbXUvY29t
bWl0cy9hc3BlZWQtOC4wDQoNCmFuZCB0aGV5IHNob3VsZCByZWFjaCB0aGUgUUVNVSBPcGVuQk1D
IHJlcG8gYXQgc29tZSBwb2ludCBpbiB0aW1lLg0KDQoNCkpvZWwgYWxzbyBwcm92aWRlZCBhIHNp
bXBsZSB0ZXN0IGNhc2UgOg0KDQogICBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVs
LzIwMjMwMzI4MTIwODQ0LjE5MDkxNC0xLWpvZWxAam1zLmlkLmF1Lw0KDQp1c2luZyB0aGUgYXN0
MjYwMC1ldmIgbWFjaGluZS4NCg0KQ2hlZXJzLA0KDQpDLg0KDQogVENTIENvbmZpZGVudGlhbA0K
PT09PT0tLS0tLT09PT09LS0tLS09PT09PQpOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBlLW1haWwKbWVzc2FnZSBhbmQvb3IgYXR0YWNobWVudHMgdG8gaXQgbWF5IGNv
bnRhaW4gCmNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uLiBJZiB5b3UgYXJl
IApub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgYW55IGRpc3NlbWluYXRpb24sIHVzZSwgCnJl
dmlldywgZGlzdHJpYnV0aW9uLCBwcmludGluZyBvciBjb3B5aW5nIG9mIHRoZSAKaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgCmFuZC9vciBhdHRhY2htZW50cyB0
byBpdCBhcmUgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgCnlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
Y29tbXVuaWNhdGlvbiBpbiBlcnJvciwgCnBsZWFzZSBub3RpZnkgdXMgYnkgcmVwbHkgZS1tYWls
IG9yIHRlbGVwaG9uZSBhbmQgCmltbWVkaWF0ZWx5IGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhl
IG1lc3NhZ2UgCmFuZCBhbnkgYXR0YWNobWVudHMuIFRoYW5rIHlvdQoKCg==

