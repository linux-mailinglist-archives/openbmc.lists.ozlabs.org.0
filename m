Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF9F429C2A
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 06:05:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT2BC4VgFz2ybB
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 15:05:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=xbuAY6nW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=shuox.zhang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=xbuAY6nW; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT29g5CSJz2yMg
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 15:04:32 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="213980688"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
 d="scan'208,217";a="213980688"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 21:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
 d="scan'208,217";a="716707067"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2021 21:03:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 21:03:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 21:03:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 21:03:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 21:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOhrPDQ283AXh5rtg79QqqMRU61V1HCSsFs0D/PoCV/HB5+RkCrs2DXgd3LRVP6928zmPTZBPbImm43wUML0KuZaQinaloxeE+E22tveWW4ifNNRKlo0qM9gB3ao6meeeup8/Xrc+uOLypxj6J+rvmeuUy6sFHJQKgvtD8H0XY3nd1Qijs/9iHXFXL+UzH+LYxexiirQ/vmb14lHJDdyNIJOC9XbNfaKf78h/4V9yqzNwmK8HWzzV5LLzNUtPUqIFB6BoHYh7PjweeHo3zHtl5rMzbD4VXzTAigrMQfx0gudn5E8VFuPtusaGzIZFLGh8Ac9spinZ5SAx5NjkFHZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w4T0wzW8WUakUY37Rw4crGvLp84W/VcUCVSVGyzVOE=;
 b=U2kviJY1PMVgXA4ltD6JarCKzdrN6vGDZt+WLrk0yUvnmtBpuPRXPY9M+Mp4XKek2B6FzCNIc+laL0lT8rEFm9O+9y4xEE8AbGxdFyGzVJtmXDF1rouQDehpAV7uCQph9sdO1AY0sSX39GOTJKrxRKosfsyhR7NApnl2gqPRrswa4ksWIlX6HOSyQcQZ9MjhVNFygxMdwA83V4uO3KoOZ89ZH6WzTH9TLQNfYfp5i3uA0jFc8ijdAAsX5qeatxNa0rjZJbEDzPVJPwWcMWgbPv6Eb031kPLdxKa5WKI4VhFMUv1p/BJRpiDyT76EwiP2iUGLUawSK8uNjH8c3ShqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w4T0wzW8WUakUY37Rw4crGvLp84W/VcUCVSVGyzVOE=;
 b=xbuAY6nWMSc5z9KQWJUX+h0+rReu6T5R1IP0StA+/zR50Bg+j6wpto9X1oiL+mreyQrAY4gd5DUANClWGZN9IsNPM+s4wY879PylzNatsZn5ejb8KpE6bL7jHjd0qRwB9A49xHt85cLshEL9rAZI4UbhIv4jiqjV+1At+Tn+syg=
Received: from DM5PR11MB1547.namprd11.prod.outlook.com (2603:10b6:4:a::15) by
 DM5PR11MB1466.namprd11.prod.outlook.com (2603:10b6:4:9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.22; Tue, 12 Oct 2021 04:03:25 +0000
Received: from DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::9829:6c67:d7ca:af63]) by DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::9829:6c67:d7ca:af63%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 04:03:25 +0000
From: "Zhang, ShuoX" <shuox.zhang@intel.com>
To: John Broadbent <jebr@google.com>, Mohammed.Habeeb ISV
 <mohammed.habeeb@inventec.com>
Subject: RE: Etag support in openbmc
Thread-Topic: Etag support in openbmc
Thread-Index: Ade/FQhRoKYEaaEvQYOiRT9avfKCpwABYFSAAABNMIAAAH0Z4A==
Date: Tue, 12 Oct 2021 04:03:24 +0000
Message-ID: <DM5PR11MB154720B60C84C20E395ACBB2E2B69@DM5PR11MB1547.namprd11.prod.outlook.com>
References: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CAPw1Ef-s-eXPs-8KmHLUyRav0JTWLHRDdLKsGFaKTWmkoeiQzg@mail.gmail.com>
 <CAPw1Ef8fKL_cE=absnX-QwMBVckKy5vkffC08ox5ogPt46aUSw@mail.gmail.com>
In-Reply-To: <CAPw1Ef8fKL_cE=absnX-QwMBVckKy5vkffC08ox5ogPt46aUSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf96497-f5cc-492a-47f9-08d98d353d54
x-ms-traffictypediagnostic: DM5PR11MB1466:
x-microsoft-antispam-prvs: <DM5PR11MB1466F4977BFA5F3A46DC2576E2B69@DM5PR11MB1466.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kBsj9q5MR1YTY1VAP8egl2ZO2HHHNj2q2Uf2KLNWvFmgnPetatRuiUoNX29zdU9BDfoCX+N7OxFXl1k38ZAp0A/3kKQicC5ZUqu5t4ZJntPjd99PVWneaVNMzSajahgIBarNbvqXVZ+ThbQYDKjGV8ZwRdrYf4qL3AmQ2WH4CzS5W9/1c4dBD3+oxwFASZ3ORv0Hu6FzzpUHwvmsMDfVyZaV0N04ioi3fwV8+61dYH8p/YaG2DRcXGTtuWX5T6O9VrvSCte+kn5oyMyCeS3Hn7Ey/MkhC8NH+Se5wfjZQK6K4N+S2HoL2PniXBnkO7iiCZ8HtxL0+jkfWebR5hzYSEXinJe6u4HRUB3/I83SBCvsiz6PSqJ2l6cYKPDOpQftYHwY7wJhCdZ5vcALSnmqa/9PcXzSCHDqobxkfe18jRzwWESVNy4Xe47AEqa4A598BVMrpU4dUP9ZIQANgolwY6RkVq84OUNxPHyI2G80l9gQg9whINLtIlPatGtx3VXF3EjqlMP0afgvuH38d7aJnbgPby96J82yiCzRYkl5cSwgrmF6e3uLgFQNVYbDgs6A6+g3gu0XYBC73ysFqtWVjC+zGCQtNv5u1kvxzMuLCGylnm+dF8Pyh1yAvmDGtK83ZNUNtuW+nkGNyT/yuUCh+RHplZ0ajENrdRPnXAOebCl1M/H0x97idgIomST9ewweYuxzjM9BbrMueBGfzKHw22ayAQdc3KCffc/Z9BU9Y4BE5r4cHXg8zh+GjxQygTsN8uWIMUYt1xv3a/z7Icc51/iASfvotTXASVDpVUOXvhjB2uJQTNMdUZQbcldy/0rar3vEEq5KmVRcraKFi+SRGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1547.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(2906002)(508600001)(3480700007)(66946007)(122000001)(5660300002)(66446008)(71200400001)(7696005)(76116006)(21615005)(86362001)(33656002)(38070700005)(64756008)(966005)(316002)(66476007)(166002)(26005)(4326008)(186003)(9686003)(6506007)(8676002)(8936002)(66556008)(38100700002)(53546011)(83380400001)(110136005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlB2S0d4RkNNcnlUMHVzZjhpRHIvcVczOGxwcDdPMUVlaTRGNk9NcDhsTnZI?=
 =?utf-8?B?V2Zpc04zWmkvNmJBZWJUdmlqdFpIMTE4VjRQTUoyNTVNZHB5cGtKMjVMMyti?=
 =?utf-8?B?NzRneENPRnR0citjV2FHM3RCcTBPS1JnSHRYa0FLMlU0ZXR4QTRJcytFSStV?=
 =?utf-8?B?eXUxSVMxWS94bVhqTFNaUXJ6OGJFbnVTWTRPOU5JeXBwNVBaTkRUL1ViRkxv?=
 =?utf-8?B?b245VSs5U1c1Tk04YkJEWERRWVQ0eFloTW12SVBPenp2RnEwaHIvSmRwcmIw?=
 =?utf-8?B?VnAydGpYVE0rWjBublg4RE1nKy9lYXh4NFlhRVV6SzhrYlFnOVhxc252VkFz?=
 =?utf-8?B?Tmk0ZXZJc3RMRndkWEdXWmhzQ2RwL2ZDSFFzeW5ENzdCdVJndGZMYUpIcVAy?=
 =?utf-8?B?R3ozbVVNSDhka1NEb1V5MUZyNnNVMlJTdW1DcC92ZnpSK0k4YUZlR040UHIv?=
 =?utf-8?B?Smx3OHRYYjRnMHpXSzA4RGdQdWZleGFCMGdiODlLMFhTT1kwWWlUMHcvMGNh?=
 =?utf-8?B?Wkp5dEYwY2tMcXJINDNpd2g2M0NIRFZBSDJUR1NHVHNtYUdUZVBYQ3VzUmdX?=
 =?utf-8?B?c1A5byt2NTBpclNOTUErNHhxMWtPa2FMM1pIM05Od2VPS1F0bnJoM0lKSzUz?=
 =?utf-8?B?OUpicU81cnJ3Uk50S05iMHBRK1RHNGxJd1YxQXptenZRRkNMaWlHeDc5U1hp?=
 =?utf-8?B?MG92bEw2YU1HN21taUUvY2xtaEF4U1JYc1pmdXl2a1JoY1pIckVoUWZRTWdK?=
 =?utf-8?B?ZkhFblRRTXYxNDhiUXVIRkZEY0dkS0pkekJOQ0Q5dUo5WVNsRXM1THZGNWlF?=
 =?utf-8?B?TWNNRjZVU2RJVDhoTWQ1dmg0MG1zVTZlS2JEUnB5T1hlcjJjblJDQ2hPUVV5?=
 =?utf-8?B?Z3pQQURiSzJ6ZWFYRGEzWnhOdDIwNS9EaTlrcGwwT2hKWVNPQjhFZlZCbngr?=
 =?utf-8?B?M244SW5YdWs1THBoSDNVNUdUQWFuZFIvZkdOQTg5SEVqd3NwYXhBZEs1R1RW?=
 =?utf-8?B?eVhxOVJ5WjVqRXhWUEQ0UmQrc3dwT2krZXZic2MrWUh2ZWJueXdTbEM0MEla?=
 =?utf-8?B?VlN2UTFYL2FsdzRyQVUrSHVlVDBYVmpKc24zbk00NzVLMkxoMVU2SXB1a1pF?=
 =?utf-8?B?c05IQnJOVC8vd0EyNE5HWkRMWUV1L3JtZkNnR2FSdG1CZVFGMUVxTjBXYWdD?=
 =?utf-8?B?NnBWRmpEN2l5Qm5FNlVIUzhpNXE5VWFYaitBM2JGV2cyMnFydUNqRktPY0Rx?=
 =?utf-8?B?bWxFUXZyTkJYOVhtOWNSbTRhTVlxSUl6bmpDZEpzYUdFMDBpSlcwVnZ1WFIv?=
 =?utf-8?B?bHFBZDJucUhCOFU1Q1FQMjdnYjMyVVBzSFhlUDFhUVo2ZGsvNzVyU3pEbUpV?=
 =?utf-8?B?ZThINU1rWWVqb0NZWWtVdDdSaG5QZEhjSXpuL1pDWHVic3NzZW9acXdrZTEr?=
 =?utf-8?B?MGx0YUYvUzVwc2I2akpHVUE5TkhId0RWaUFYZFZGVnI3YzhMMENtaitHMEVV?=
 =?utf-8?B?VjhNd3VUbE1BYVlGY3VBWXpXN3JLK3BkLysraW9iZSs2MWpva2QzWVVBYjVz?=
 =?utf-8?B?NW85QnpPNncwUzkvcFNjS1VNTVJVYnJEVk9PNzBzbzVIRVp3YkV4b3NQbFNH?=
 =?utf-8?B?TFFsZ25EU0FFcjFNandyVGcrMXYrYVlYQWxJMnZ2NVZ6R2s1Yk15QUtJOVJz?=
 =?utf-8?B?ZWlrVFJPRWpoVWhiWGlpRGx5dEdET0pRdzZHVXZ5eWEvRVYwSEJ0Tml3b1E4?=
 =?utf-8?Q?QE2szcXehTL1jbpNSY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM5PR11MB154720B60C84C20E395ACBB2E2B69DM5PR11MB1547namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1547.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf96497-f5cc-492a-47f9-08d98d353d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 04:03:25.0193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HuFE5xGTQJnaZMRQwV6zoEPJjTDjgiBxV/+AxtCraUhJN+cTKerwuLmspywoP6T46mjtEWFRE2auzGUXPa+czg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1466
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

--_000_DM5PR11MB154720B60C84C20E395ACBB2E2B69DM5PR11MB1547namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIHRoaXMgcXVlc3Rpb24gdGFrZXMgYSBsb3Qgb2YgdGltZSwgc28gaXQgd2FzIHB1dCBv
biBob2xkLg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrc2h1b3guemhhbmc9aW50
ZWwuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBKb2huIEJyb2FkYmVudA0KU2Vu
dDogVHVlc2RheSwgT2N0b2JlciAxMiwgMjAyMSAxMTo0NyBBTQ0KVG86IE1vaGFtbWVkLkhhYmVl
YiBJU1YgPG1vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSZTogRXRhZyBzdXBwb3J0IGluIG9wZW5ibWMNCg0KU2h1b1gg
WmhhbmcgZnJvbSBJbnRlbCBtaWdodCBiZSB3b3JraW5nIG9uIGFkZGluZyBzdXBwb3J0LCBidXQg
SSBkb24ndCBzZWUgYW55dGhpbmcgaW4gZ2Vycml0Lg0KDQpodHRwczovL2xpc3RzLm96bGFicy5v
cmcvcGlwZXJtYWlsL29wZW5ibWMvMjAyMS1BdWd1c3QvMDI3NDA1Lmh0bWwNCg0KT24gTW9uLCBP
Y3QgMTEsIDIwMjEgYXQgODozNyBQTSBKb2huIEJyb2FkYmVudCA8amVickBnb29nbGUuY29tPG1h
aWx0bzpqZWJyQGdvb2dsZS5jb20+PiB3cm90ZToNCkkgZG9uJ3QgdGhpbmsgYm1jd2ViIHN1cHBv
cnQgZXRhZ3MuIEkgaGF2ZSBuZXZlciBzZWVuIGxvZ2ljIGZyb20gdGhlbSBhbmQgRWQgbWFkZSBh
IGNvbW1lbnQgYWJvdXQgaG93IGJtY3dlYiB3aWxsIGhhdmUgdG8gc3VwcG9ydCB0aGVtIGluIHRo
ZSBmdXR1cmUgaGVyZSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy93ZWJ1aS12dWUvaXNzdWVz
LzQzI2lzc3VlLTcyODMyMTYxNQ0KDQpCdXQgSSBkZWZlciB0byBFZCwgYW5kIEd1bm5lci4NCg0K
VGhhbmsgeW91DQpKb2huIEJyb2FkYmVudA0KDQpPbiBNb24sIE9jdCAxMSwgMjAyMSBhdCA4OjAz
IFBNIE1vaGFtbWVkLkhhYmVlYiBJU1YgPG1vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb208bWFp
bHRvOm1vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb20+PiB3cm90ZToNCkhpDQoNCkRvIHdlIGhh
dmUgdGhlIEV0YWcgc3VwcG9ydCBpbiBPcGVuQk1DPyBJIHNlZSB0aGVyZSBpcyBhIG1lbnRpb24g
b2YgRVRhZyBpbg0KYm1jd2ViIGZpbGUgcmVkZmlzaC1jb3JlL3NyYyAvIGVycm9yX21lc3NhZ2Vz
LmNwcCwgaG93ZXZlciBub3Qgc3VyZSBpZiBFdGFnIGlzIHN1cHBvcnRlZC4NClBsZWFzZSBsZXQg
bWUga25vdy4NCg0KUmVnYXJkcw0K

--_000_DM5PR11MB154720B60C84C20E395ACBB2E2B69DM5PR11MB1547namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxARGVuZ1hpYW4i
Ow0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMg
Ki8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBp
bjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
O30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0K
CWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5
bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2Fs
aWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJ
e21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJn
aW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldv
cmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hh
cGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlm
XS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQi
Pg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94
bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIg
dmxpbms9InB1cnBsZSIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Tb3JyeSwgdGhpcyBxdWVzdGlv
biB0YWtlcyBhIGxvdCBvZiB0aW1lLCBzbyBpdCB3YXMgcHV0IG9uIGhvbGQuPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXYgc3R5
bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMu
MHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBvcGVu
Ym1jICZsdDtvcGVuYm1jLWJvdW5jZXMrc2h1b3guemhhbmc9aW50ZWwuY29tQGxpc3RzLm96bGFi
cy5vcmcmZ3Q7DQo8Yj5PbiBCZWhhbGYgT2YgPC9iPkpvaG4gQnJvYWRiZW50PGJyPg0KPGI+U2Vu
dDo8L2I+IFR1ZXNkYXksIE9jdG9iZXIgMTIsIDIwMjEgMTE6NDcgQU08YnI+DQo8Yj5Ubzo8L2I+
IE1vaGFtbWVkLkhhYmVlYiBJU1YgJmx0O21vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb20mZ3Q7
PGJyPg0KPGI+Q2M6PC9iPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8YnI+DQo8Yj5TdWJqZWN0
OjwvYj4gUmU6IEV0YWcgc3VwcG9ydCBpbiBvcGVuYm1jPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPlNodW9YIFpoYW5nIGZyb20gSW50ZWwgbWlnaHQmbmJzcDtiZSZuYnNw
O3dvcmtpbmcgb24gYWRkaW5nIHN1cHBvcnQsIGJ1dCBJIGRvbid0IHNlZSBhbnl0aGluZyBpbiBn
ZXJyaXQuPG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YSBo
cmVmPSJodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5ibWMvMjAyMS1BdWd1
c3QvMDI3NDA1Lmh0bWwiPmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvb3BlbmJt
Yy8yMDIxLUF1Z3VzdC8wMjc0MDUuaHRtbDwvYT48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gTW9uLCBPY3QgMTEsIDIwMjEgYXQgODozNyBQ
TSBKb2huIEJyb2FkYmVudCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmplYnJAZ29vZ2xlLmNvbSI+amVi
ckBnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxibG9j
a3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0
O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0
OjBpbiI+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SSBkb24ndCB0aGluayBibWN3ZWIg
c3VwcG9ydCBldGFncy4gSSBoYXZlIG5ldmVyIHNlZW4gbG9naWMgZnJvbSB0aGVtIGFuZCBFZCBt
YWRlIGEgY29tbWVudCBhYm91dCBob3cgYm1jd2ViIHdpbGwgaGF2ZSB0byBzdXBwb3J0IHRoZW0g
aW4gdGhlJm5ic3A7ZnV0dXJlIGhlcmUmbmJzcDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy93ZWJ1aS12dWUvaXNzdWVzLzQzI2lzc3VlLTcyODMyMTYxNSIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3dlYnVpLXZ1ZS9pc3N1ZXMvNDMjaXNzdWUt
NzI4MzIxNjE1PC9hPjxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+QnV0IEkgZGVmZXIgdG8gRWQsIGFuZCBHdW5uZXIuPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rIHlvdTxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Sm9obiBCcm9hZGJlbnQ8bzpwPjwv
bzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gTW9uLCBP
Y3QgMTEsIDIwMjEgYXQgODowMyBQTSBNb2hhbW1lZC5IYWJlZWIgSVNWICZsdDs8YSBocmVmPSJt
YWlsdG86bW9oYW1tZWQuaGFiZWViQGludmVudGVjLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1vaGFt
bWVkLmhhYmVlYkBpbnZlbnRlYy5jb208L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0OnNvbGlkICND
Q0NDQ0MgMS4wcHQ7cGFkZGluZzowaW4gMGluIDBpbiA2LjBwdDttYXJnaW4tbGVmdDo0LjhwdDtt
YXJnaW4tcmlnaHQ6MGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIDxicj4NCjxicj4NCkRv
IHdlIGhhdmUgdGhlIEV0YWcgc3VwcG9ydCBpbiBPcGVuQk1DPyBJIHNlZSB0aGVyZSBpcyBhIG1l
bnRpb24gb2YgRVRhZyBpbiA8YnI+DQpibWN3ZWIgZmlsZSByZWRmaXNoLWNvcmUvc3JjJm5ic3A7
LyZuYnNwO2Vycm9yX21lc3NhZ2VzLmNwcCwgaG93ZXZlciBub3Qgc3VyZSBpZiBFdGFnIGlzIHN1
cHBvcnRlZC48YnI+DQpQbGVhc2UgbGV0IG1lIGtub3cuPGJyPg0KPGJyPg0KUmVnYXJkczxvOnA+
PC9vOnA+PC9wPg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_DM5PR11MB154720B60C84C20E395ACBB2E2B69DM5PR11MB1547namp_--
