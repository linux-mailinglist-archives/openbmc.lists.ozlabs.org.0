Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30B5BC3A4
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 09:48:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWGxr2vnZz309f
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 17:48:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=hKr+baRK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.177; helo=smarthost4.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=hKr+baRK;
	dkim-atps=neutral
Received: from smarthost4.atos.net (smtppost.atos.net [193.56.114.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZfL13QJz2yxX
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 23:28:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1663334938; x=1694870938;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EU1ss3Nvc/lgidIZWVMPTPFcHDMiS1IafO4Ir8HBoEA=;
  b=hKr+baRKdwIH06cIh4D7L20u06Zuk5WppB3xUgVEkOgRIiCa30jqkSTK
   VU4xIlxxD5Md/Kdw7rusjATJQ7wycMWjPPqPAmrJhOvqA2krDd+dsIieb
   h6e5OPSiVRyk3PmLjfhgKpQIyTEctavLMj6nveib233Mg4qfdNI+Rvx5s
   XmfpI5vN0jCN2eGKyhDL2+LH4GX350NnMOxoBg18a6KaXMRVA3hLh5J+X
   VBiMxdxiLftEWRH8rMpiuT+UQt/dOMsaAdTjQtuSAURL4Ikq2Njxh2qfW
   8M3OmEoBNU0JYto7CkJ+FSqOMEN6CXzuf2MwGJCbkbDsC1Z24ShEgAr2Y
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654552800"; 
   d="scan'208";a="404498542"
X-MGA-submission: =?us-ascii?q?MDG94eXuT1zzQq12DadRc+TeFzrHVkWYHX39a/?=
 =?us-ascii?q?2eL6XAvJVjEV+qLhVwMlEVw2zTtkd2sghIsJ+aFM/UKp5/09oRl3rqd/?=
 =?us-ascii?q?oSCZUat+rDMLGQyBx9Xgp6VMpH+Bjs1Q+lvxmezH/C05WlQKGI8vl/1D?=
 =?us-ascii?q?Ay?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB14.ww931.my-it-solutions.net) ([10.89.28.144])
  by smarthost4.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 16 Sep 2022 15:28:47 +0200
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) by
 GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 15:28:46 +0200
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24 via Frontend Transport; Fri, 16 Sep 2022 15:28:46 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OifHOz7wxG9kJLwGLXKx/JGM6kYelSx/sZJWONrBcZo1Y2xWlYBDh77SvtKlXvCSvKdtxoiDzAWvbpVJhWVP9+uee73Pd6SGhtMfIA6gUUw8fTlHPBX+4kvwOTu1qzsnVccljTscdOw8I7DJOFU8dM0GQI0V9InDJXv1fp+Y5nMRHpyHwaD2cnvbjUYAzFDqaphTAqtWto8NUbzUk0TC4KSMvnkrrY9jeY12t0sBLmsjjEdE45gl5ETaUjd7sSUFo3TQxXaHV461XexGjs63hmzy56CLY5+6uHlDRXyNzCyT/NOXya0FQ1L+ZDNbBYLjoCUd/FGOdowgVcR1HaMiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU1ss3Nvc/lgidIZWVMPTPFcHDMiS1IafO4Ir8HBoEA=;
 b=XWqQdhjZCaMt1VcYU7/4C/wXkQaybs1Qgs3m+hqLmP5TQ+CckzXArK54qLOprlF8Ne4jxQ/GOzFZwjCJBRHKempNiY3/cne5XPcQV3VPEz+NXKbiapsQYvygrbbvI1vzXYjIgxYLUBc0TQV8KMA1UKozIqHEym7MLIJdtJQxqdvsc3ML7tFW97ZLZcOdTiqiA4i0Jgb1LLIKux6BORHduyhgpzV0RyZpQK0ztmxOm7Ikm/2CXJjijGe5kZLWEdOWXA18U8Bk2tTjRoSn+Ku/LYEZ9qPkmybKVUYeVcZ0jpK2JOVS0zteeJvzVb5ADJdU6Hggiokkwcm+KnBiBRDjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by AS2PR02MB9956.eurprd02.prod.outlook.com (2603:10a6:20b:604::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 13:28:44 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::cde7:7ad9:917d:e3b4]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::cde7:7ad9:917d:e3b4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 13:28:44 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: What is the purpose of xyz.openbmc_project.Inventory.Item.Global
 interface and getGlobalPath in HealthPopulate ?
Thread-Topic: What is the purpose of xyz.openbmc_project.Inventory.Item.Global
 interface and getGlobalPath in HealthPopulate ?
Thread-Index: AQHYyTQHaw+aB6lhj0yvuQWHn8MIPK3iDfAA
Date: Fri, 16 Sep 2022 13:28:44 +0000
Message-ID: <PAXPR02MB768059CED0E9C45301E3F5EBE4489@PAXPR02MB7680.eurprd02.prod.outlook.com>
References: <PAXPR02MB768047479061D2A85A63A2B5E4469@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <49eab14f-806d-fa1d-9867-c6f0ce549ad0@linux.vnet.ibm.com>
In-Reply-To: <49eab14f-806d-fa1d-9867-c6f0ce549ad0@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-09-16T13:28:43Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=87c5da77-854f-4a49-af48-41815d466133;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|AS2PR02MB9956:EE_
x-ms-office365-filtering-correlation-id: 4834aaeb-fe8b-4602-6ad2-08da97e760ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+mQg+K9bV6S5CsgLOzoUv2GI9M6sWOfFASuw5Ws79xN7+FK8DLPZQCuHyZebfa8I1cVUfg8r7lCmd4Fc6VizPo+gMvf9DKtMi9HS44CgHdyf3vMJFPvNK3M6tWttoR8JHw1o8gCSqLBcDaNAirSWnMJVw3SEk6CBurIIivUTbKWPzo3ou3xi+6EVGZNw8bUm3kpq+lvVPpx7xYqfv+CLBHjRVeGj+xOeNmZ4OT2g8qEP7CMSXkoF2PprbQ7a1BMP4qUcu/zBWiLQ483WKh/oj0BHA4jdzdaSPETPpJX7mCD3ZxafGABYhziyccegtUKGA92j1KHSQgO/OUU3/MsmGLP9hHYvAQsRBpOP2H4jEBatYWpRQP0V4CRbUjloHLmu5vrHCuw8hMs9UrHs+PuBpOe/49LVWgJRL/c3PWMA+yMrZWzJZ2MtY5vT9yu6IAK9XRLZEvP9eLpEU56CS2wVLVjonrYcg5HG63so3qJG9c8PmIeN+CzDoNHqWnZHURk36Lbcx+gBC9nanlI5xieBkEGS4amGalMhzQUmLYJiFmDk4ps5WEvcuWgqcmbL8QXOEz8M4ADilHiV6scOKEIHzQf2JHu0B0Wx+w+T4PmPTaK4zLSa/1Fgto9WTJrsqV5yKGPgC/zFrH9Ptlc5noYMaPoOdgec8cu85HgU7eHHBrlVWpzrCh2KOzatxE8XRc5qhsoXQizvjfzg98yn68DUGWTc5VFnTymJt5hZE9T9m752e/0t/P9l79tLWIxpm2mpNxlacOAcx82eArkbzquwFZOwjuNFoYPgtV+HJEc6+7wwfhbAJ0foIU1+dl4bU5JjNW8Sl1gzOpm55CRYXeRng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199015)(122000001)(6506007)(8936002)(53546011)(186003)(71200400001)(66574015)(38100700002)(41300700001)(83380400001)(45080400002)(66946007)(66446008)(64756008)(66556008)(55016003)(66476007)(44832011)(7696005)(76116006)(52536014)(5660300002)(38070700005)(33656002)(2906002)(86362001)(8676002)(966005)(9686003)(478600001)(82960400001)(110136005)(316002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3B6UUE1R3hGV0M0Vkx4Q1JxOTRvanlKdVJ1TWdlTHN3bGg2NXdTMUdwYW4v?=
 =?utf-8?B?UU40RGowSXJGTFcrSnlYZGMxdlc3RXBOd0dkaUxjSEtUc3U3aWZiUlBvcU5h?=
 =?utf-8?B?TS9sNVFvQnhrME1aRHJicWk2TmFKemovNi9oeHhFZ09ESEFGeGEyWFJQYmN0?=
 =?utf-8?B?Nm9IcXgxS2FpdHlmelF1YkxuWUsveEdOdkJGSGd1czloeFRtSE9LTzhtMHhK?=
 =?utf-8?B?OWJ5T1p1cmI3c0NFNzRma3IvTlhqNnMvNDd2NzdvOUFQbnFNdWM4d2RkQkNo?=
 =?utf-8?B?QzA2TC8yRzMvd3MvTjVnYzNSOGhlSXIrd1lBOUZ0Z250QTM2cUtYdDV5bGZy?=
 =?utf-8?B?UTBEQVNucVRoUUkwRjdCZFcwZ01YVDJoZmZPUWpEZG8rTnVpZGlKNTBJOGdW?=
 =?utf-8?B?VjZzaUZRWmdES0x6MmdvV3d5MVArUktWVkFoSXNBbTlvV005YURxREhRWjdo?=
 =?utf-8?B?YnNNN3JyTURuM0pvY1FERDNFdnMzNHlJdUE4S29lV1NSK1JHZEduRkhJRFhV?=
 =?utf-8?B?Q2VLdUYvNXdRZk5mamFwS0xqeVpMT05GbWc4b3pWVU1lemVrVitMbWVpYmVK?=
 =?utf-8?B?UU9uQzVvYUgvSWlqM013aG10akhjMmxUa2lQam1OYVZIaDVwN3ZIMkdTWDJ6?=
 =?utf-8?B?Kzc0bm5vRS94TFFUUFFDc0dXZVBiblA0SERiZ2ZtYVJmMGJhREIxUU9Gckts?=
 =?utf-8?B?Q1VlNXo3d1F6RGZBMnMzRk9ZU1VKWis2bXpUb2RQbXZZMVhqN1VObEhGYUFF?=
 =?utf-8?B?RHRQY2M0d3hCOGxEVkY0azhHZjBlajYyUE1aTjNTcGNGOXF6WWJOSVdnYklC?=
 =?utf-8?B?Y3lyczFuWTlpY1FGa1RBcCsyR1BkSTIwR2FwWjFqcnZhYWJ1R1BsS0J3MlRt?=
 =?utf-8?B?USt5ZFV4NXVENEtObWZyTXRNdnZwVHlWNkZmR0o3bUVtU2ZtSFliQk9nOTQ4?=
 =?utf-8?B?K2xMV2FuL1dKS0xwSnBWbkM4RlBtNU84Wm9qeGl4dmFwVHF6L0k5Yk9CTmlk?=
 =?utf-8?B?UFlHV29WV254ZnBUckFEdVd0NmdqTlBGaTlUVWt6VVZzWjdpbWJLRGhnWk9R?=
 =?utf-8?B?blhUN09Ha1p4QlVRUjFRZWJiVzFHTDRkd2FNanpLalU0QnJuOVNlUXZPL3Jw?=
 =?utf-8?B?N2I4Ujg0enRQd2UySlJFR1Z0UlV0VTkxQkYvcEsrMkQvK0ovWmt1cVp2RXk3?=
 =?utf-8?B?QTJQU1ZHMkpyS2VnZHMvWENQZHBYcnFaMlV0SC9iOHJZSzZXd3lRQ0JpaDln?=
 =?utf-8?B?cEVnd09aN1dCbUQ3YXVwdVVBY2hVY0xKTG1aL25BS2FWR3NPSm5Oa05HckZz?=
 =?utf-8?B?SGd5L3Q4UnkvSDlkK2NJRVE3V0hPR3hJR1c5VUkwSnRaaXUyS2NESmRMZ2xh?=
 =?utf-8?B?Vm9RdnBSeGJ6cW9kQTRSeFlmeDFJaWNzZVUzL0w2TEY1V1hEbXdZOGg1eTdX?=
 =?utf-8?B?OWFWYzU3eXFyNWg4VUM5SFRIQ1JrK2tDT1BxYUhSVzZieHFSd1JCS0ExTWdy?=
 =?utf-8?B?ZkRwdkhUa0JEZHUwT1k4ek1zd0FjbTIrcDdKNUdrU2ZQVGxhMnRNcnZDK052?=
 =?utf-8?B?OWlFOUpKcy83TjE0eDZlbHpjSXFIbVlnSzArZjdsRCs5dStNbm9La1ZqTldu?=
 =?utf-8?B?cG55c2dzVEpqN2lDam1nai9BUmhNVGdXZGoxZGRheHFWZzhMSDBqZGJQTHp2?=
 =?utf-8?B?ampFYVpyZFlNMFdHTDhmc1M1dUF4VFdDR0hGZDNoSlFUdjBMWmpxeStEd2FS?=
 =?utf-8?B?V1FuVHEzVmJqZnd2WEZhcDRlNUFBWTd4YWg1RDBVQndQU2xvT1ZVdWlKUHk5?=
 =?utf-8?B?Tmd6MWQ0MjhkTVhmVHhvZDJhNTVqSHhDS1hzbUVjV25GUlJYWEN4cUVWUVll?=
 =?utf-8?B?dGNMc1JvQ3o0dkpCeEtkbXVUaWVwUDhpb3pCNmRwVkp2OFhYd0JPbE42RkRP?=
 =?utf-8?B?ci9aN01TN0RTcnNLNzVnclBKb2ZrcG9QTjRPVTI1VkZ0L0VQRllIMCtxVXh3?=
 =?utf-8?B?Y01sWlRvYUVjUlV3cUEzeWw1dFJmclhQUDF0NkNnRnpyNHJnaVFtRTRCeHZq?=
 =?utf-8?B?YUtWZHgzMkkyUVU2UFd5U25jRHVZUVFvd1JFN1lWOWQ1cGVsU2ZPcGY1WllF?=
 =?utf-8?B?NURvVkFPMXFibWF1OGR5RHlCbnRiWVVHbGNUcWtNRHVLTjBlWDBzRkhQVENV?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4834aaeb-fe8b-4602-6ad2-08da97e760ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 13:28:44.3570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WK9qPiwdZhRVrQDggjbhSjnnuTt5cwHCC1umEn90Az6lc+lkx2kA0WY5UCXTBmvfStY5fwSFwWU0iLwoKheeBbzv0UcrCDBlAMQAwm+HiMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9956
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Mon, 19 Sep 2022 17:45:24 +1000
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

VGhhbmsgeW91IHNvIG11Y2ggIQ0KSSB3aWxsIHRyeSBpdCBhc2FwIPCfmIoNCg0KS2luZCBSZWdh
cmRzLA0KDQpGcmFuY2luZSBTQVVWQUdFDQpUZWFtIExlYWRlcsKg4oCTIFImRCwgQkRTDQpBdG9z
IEZyYW5jZQ0KTW9iaWxlOiArMzMgNiAyMSA0MyAxMSAyMQ0KUiZELCBCRFMNCkF2ZW51ZSBKZWFu
IEphdXLDqHPCoOKAkyBGcmFuY2UNCmF0b3MubmV0DQrCoMKgwqAgIA0KDQoNCg0KDQoNCg0KDQpU
VDogW1RodXJzZGF5IC0gRnJpZGF5XQ0KDQoNCg0KDQoNCi0tLS0tTWVzc2FnZSBkJ29yaWdpbmUt
LS0tLQ0KRGXCoDogR3VubmFyIE1pbGxzIDxnbWlsbHNAbGludXgudm5ldC5pYm0uY29tPiANCkVu
dm95w6nCoDogamV1ZGkgMTUgc2VwdGVtYnJlIDIwMjIgMjA6NTANCsOAwqA6IEZyYW5jaW5lIFNh
dXZhZ2UgPGZyYW5jaW5lLnNhdXZhZ2VAYXRvcy5uZXQ+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcNCk9iamV0wqA6IFJlOiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuSW52ZW50b3J5Lkl0ZW0uR2xvYmFsIGludGVyZmFjZSBhbmQgZ2V0R2xvYmFsUGF0aCBpbiBI
ZWFsdGhQb3B1bGF0ZSA/DQoNCkNhdXRpb246IEV4dGVybmFsIGVtYWlsLiBEbyBub3Qgb3BlbiBh
dHRhY2htZW50cyBvciBjbGljayBsaW5rcywgdW5sZXNzIHRoaXMgZW1haWwgY29tZXMgZnJvbSBh
IGtub3duIHNlbmRlciBhbmQgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KDQpPbiA5
LzE0LzIwMjIgODoxNiBBTSwgRnJhbmNpbmUgU2F1dmFnZSB3cm90ZToNCj4NCj4gSSB3b3VsZCBs
aWtlIHRvIHNldCB0aGUgU3RhdHVzL0hlYWx0aCBvZiBhIHRhcmdldCBkaXJlY3RseSB0aGF0IHRh
cmdldCANCj4gaXMgbm90IGEgc2Vuc29yLg0KPg0KPiBJIHNhdyBIZWFsdGhQb3B1bGF0ZSwgY29t
cG9zZWQgb2YgMiBwYXJ0czoNCj4NCj4gICAqIGdldEFsbFN0YXR1c0Fzc29jaWF0aW9ucyBsaWtl
IGFsbF9zZW5zb3JzID0+IGxpbmtlZCB0byBhIHJlbGEgc2Vuc29yDQo+ICAgICA9PiBub3QgaW50
ZXJlc3RlZA0KPiAgICogZ2V0R2xvYmFsUGF0aCA9PiBjYW5ub3QgdW5kZXJzdGFuZCBob3cgaXQg
d29ya3MgPyBTaG91bGQgSSBhZGQgdGhpcw0KPiAgICAgaW50ZXJmYWNlIHRvIGEgZGJ1cyBvYmpl
Y3QsIGFuZCB0aGUgbWFnaWMgYXBwZWFycyA/DQo+DQo+IEkgd291bGQgYmUgZ3JhdGVmdWwgaWYg
eW91IGhhdmUgYW55IGV4YW1wbGUgIQ0KPg0KDQpBcyBJIHVuZGVyc3RhbmQgaXQsIEludmVudG9y
eS5JdGVtLkdsb2JhbCBpcyBhIHdheSB0byBkZXNpZ25hdGUgd2hhdCByZXNvdXJjZXMgc2hvdWxk
IGhhdmUgdGhlIFJlZGZpc2ggaGVhbHRoIHJvbGx1cCBmcm9tIHRoZWlyIGNoaWxkcmVuLg0KDQpJ
bnZlbnRvcnkgSXRlbXMgbGlrZSBDaGFzc2lzIG9yIFN5c3RlbSB3b3VsZCBiZSBnb29kIGNhbmRp
ZGF0ZXMgZm9yIHRoaXMgSW52ZW50b3J5Lkl0ZW0uR2xvYmFsIGludGVyZmFjZS4gQW4gZXhhbXBs
ZSBpcyBhIFJlZGZpc2ggQ2hhc3NpcyB3aXRoIEhlYWx0aCBSb2xsdXAgZnJvbSBjaGlsZHJlbiBy
ZXNvdXJjZXMgbGlrZSBwb3dlciBzdXBwbGllcyBhbmQgZmFucy4NCg0KaHR0cHM6Ly9ldXIwMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHVi
LmNvbSUyRm9wZW5ibWMlMkZkb2NzJTJGYmxvYiUyRm1hc3RlciUyRmRlc2lnbnMlMkZyZWRmaXNo
LWhlYWx0aC1yb2xsbHVwLm1kJmFtcDtkYXRhPTA1JTdDMDElN0NmcmFuY2luZS5zYXV2YWdlJTQw
YXRvcy5uZXQlN0NiOGQzMDc1OWY2MWE0MTRiYTI0NDA4ZGE5NzRiMjk0NCU3QzMzNDQwZmM2Yjdj
NzQxMmNiYjczMGU3MGIwMTk4ZDVhJTdDMCU3QzAlN0M2Mzc5ODg2NDYzMTczNzUzMDIlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9RjJP
dkNxR2VvRndVeEt3M1ZUcHVNZVdNVGxNTVFqcjcwaG42MCUyQlpXdzlzJTNEJmFtcDtyZXNlcnZl
ZD0wDQoNCmh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGcGhvc3Bob3ItZGJ1cy1pbnRl
cmZhY2VzJTJGYmxvYiUyRjExMzM1MjQ2MDFkZTJmZmMyN2RkY2JkMDVmZjZhZmM4YjVjYzE0MjAl
MkZ5YW1sJTJGeHl6JTJGb3BlbmJtY19wcm9qZWN0JTJGSW52ZW50b3J5JTJGSXRlbSUyRkdsb2Jh
bC5pbnRlcmZhY2UueWFtbCZhbXA7ZGF0YT0wNSU3QzAxJTdDZnJhbmNpbmUuc2F1dmFnZSU0MGF0
b3MubmV0JTdDYjhkMzA3NTlmNjFhNDE0YmEyNDQwOGRhOTc0YjI5NDQlN0MzMzQ0MGZjNmI3Yzc0
MTJjYmI3MzBlNzBiMDE5OGQ1YSU3QzAlN0MwJTdDNjM3OTg4NjQ2MzE3Mzc1MzAyJTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJU
aUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPXZMajFj
ZlE1TkQzSUdPMnNFY0JsM1VhMmtJWU56M0JNbDNwTDB5cnhGVFUlM0QmYW1wO3Jlc2VydmVkPTAN
Cg0KaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZibWN3ZWIlMkZibG9iJTJGbWFzdGVy
JTJGcmVkZmlzaC1jb3JlJTJGbGliJTJGaGVhbHRoLmhwcCZhbXA7ZGF0YT0wNSU3QzAxJTdDZnJh
bmNpbmUuc2F1dmFnZSU0MGF0b3MubmV0JTdDYjhkMzA3NTlmNjFhNDE0YmEyNDQwOGRhOTc0YjI5
NDQlN0MzMzQ0MGZjNmI3Yzc0MTJjYmI3MzBlNzBiMDE5OGQ1YSU3QzAlN0MwJTdDNjM3OTg4NjQ2
MzE3Mzc1MzAyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENK
UUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0Ml
N0MmYW1wO3NkYXRhPTBQcnQ0UjluQTFWWjhBb1FBTXpUMURzaURaSGhUWm8yc01SNElYUUswRW8l
M0QmYW1wO3Jlc2VydmVkPTANCg0KaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZzMjYw
MHdmLW1pc2MlMkZjb21taXQlMkZkYzdiYmRjYjYyYzU5MzAxMTY3MWFmZTMwNDcxY2M4ZmZmNmVi
YjE5JmFtcDtkYXRhPTA1JTdDMDElN0NmcmFuY2luZS5zYXV2YWdlJTQwYXRvcy5uZXQlN0NiOGQz
MDc1OWY2MWE0MTRiYTI0NDA4ZGE5NzRiMjk0NCU3QzMzNDQwZmM2YjdjNzQxMmNiYjczMGU3MGIw
MTk4ZDVhJTdDMCU3QzAlN0M2Mzc5ODg2NDYzMTczNzUzMDIlN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9RUtOY00yTThtQ05NQ2tlTFRK
YklBQW5WVjlHUzYxdjVXMG8lMkJrT09SJTJGdDQlM0QmYW1wO3Jlc2VydmVkPTANCg0K
