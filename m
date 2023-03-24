Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E46C8789
	for <lists+openbmc@lfdr.de>; Fri, 24 Mar 2023 22:39:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjwZb41sKz3fST
	for <lists+openbmc@lfdr.de>; Sat, 25 Mar 2023 08:39:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlMFNjBt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlMFNjBt;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjwYz6bN0z3cBK
	for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2023 08:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679693912; x=1711229912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nNO7zVG4pvCwjjug9fl6wnkrsgcVq+aQhOiGj2lQf5M=;
  b=jlMFNjBtvaJIgFD7g02wJeYcLyrynlFN+puRW+1DNnp7LpV5lbY1EENB
   mMVWZkkfjHMDdzkILbMfYHmx/50FoL9lRW7NNyVrX1sX052OBaT7Nt/Id
   d0BC/A+1ebmQiUvRB4VfvgjkCMJ0tswmA4L3capCTQ0FH3z72b5Z1MFjp
   s9ma8thfUHAkPT9gFoiv+tavjhcha7VXyEZ5uFZV19ogWiLx3nKyYgVEm
   T5s5aD+WPcFJtqusMzptp4f8sUy0JM7kHOGgpoLbqKox0KzohWz+7XjX+
   po05pCD3m94q9O3PpVtGRHCk/N5yJ2taado90iWpUpJXNL787Na+DTFjP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339914087"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="339914087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 14:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="747308063"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="747308063"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2023 14:38:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 14:38:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 14:38:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 14:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alFp77DqO6gfNKiR6OFWFGHqPL+0Z48tia1UxMiFpiRq/VpM9tfe26/UQD9r+qdB3l95Lg5RKvwxuMNhLqthYS8SwRNl0f0/EaygVwnqa7Iir2iKAr0fzhH4eRqzzwD59W8rCjk7TH5BRLd6xog9FwC17a1fOEvmMbBzQNdxGW+DX/tcpNuTiAWRGwBIEzdmP75/ifw4sf3lpgFuP4xmgX8OhBjv86XlnrL+pKLNcun58EOPbrpRO9SoKkO63jYeuIMNSu9eEMBBi0LloPFZloWak7DziHMCosXOhcCf6WIO4AexGVUi/tm+bkY9U1Rm9O2A6zzqqQJYD30ZFxZilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNO7zVG4pvCwjjug9fl6wnkrsgcVq+aQhOiGj2lQf5M=;
 b=iCNXn7K9ioLjPfTGIEUS36L1635NuYa+RRbojgyJCvyjgLKZkw/0TnfbVxC+2+lPRXaqz1nMXy+W+t8khp+9zasoZADeiiV10yvDt7vOxxllSib6CthIDZpg25dLlqi1R7av5KzCVQeE4I86IzNxTjP/9T6Pb9WWdu4EVY0YL9W6nw82eCPt+9fHr7zd7nRMrP62d9G8kn2BI0K7wF5KZxsiHKYsz4XkXMUpUvgTd+EVHMckdokuAsraRP1ksqpTRxq5JyMghfM+sjN6xNuqTO5Xc7QVjc3QUqJmAEiOVchWYGmCJwXIDFCYFtJgRm/8O1QgqxqRRHB6VMl3VFZVIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 21:38:05 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::1181:71b3:9254:ea83%5]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 21:38:05 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"fercerpav@gmail.com" <fercerpav@gmail.com>
Subject: Re: Plans regarding PECI sensors and PCIe inventory with upstream
 Linux
Thread-Topic: Plans regarding PECI sensors and PCIe inventory with upstream
 Linux
Thread-Index: AQHZXMBn4afc6+/mtkOgIHY8587TI68KeFKA
Date: Fri, 24 Mar 2023 21:38:04 +0000
Message-ID: <31613359fc3690a04a62da282c3e2fd494fd1f30.camel@intel.com>
References: <ZBr/QC4P32yoZyzs@home.paul.comp>
In-Reply-To: <ZBr/QC4P32yoZyzs@home.paul.comp>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|SA0PR11MB4638:EE_
x-ms-office365-filtering-correlation-id: 27ed5ef9-1688-4b25-a6dc-08db2cb00d35
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wsnr50wpuMWOkxx6Nh/uwQO8DH13rFDON9M9v8v1WH3vdvC3in0w38LK4CxaB6VcW2vigIkv1Y/INAqxAtd3vDqm5+35+/1Pk3NStHmkCphJU289pDI8sVsozRWndwuo5SyFCfmpwZSPAOx68BQArkTDTSiOw3bsl/maJ8THeplfTgMGfI1UkIOGyEeq5TacOJz55p0nDcPQTUfWeiWs3bFj1UiOY4Zx73gR5TxSm50rzDd/PWl3vP+ZPSUtS3vZBeyYvLwKuLhnG18ELCa72Vg5pAswwLva/bjLea+LBkJO9ji2oA1+oHXB6kXHY5DrhCn6L2oFRn+h5NN/DOVyak0scyNwhWdc8Qu6DOSxWpewJzozDUMxUBoY9GWDGRsP5yj2gsRv+w3wdWoCO09c4uON68NSPlqtPRHlO7l0p9zknKa1IPyw2GHl3mfrDZKTL7tLqbCi/E+5K0Cmy/+bXGcum2VJHAe/w38xF5jgrn8/a1+nljrI/idyCQHZ+hHRNvPMA7ggivhKDn6rns9qNQGVl7NZUYZbZI6pL3LwC17H0Q8WHpCtDBSl8eD3EdaBGovyCBypXnNrviFxiobwa25IjS7umkS2Py+Qb6tB3tsTHeXUFsjpn7eEBWBAIL17qeCfUkfn//6w3JoambYhrsojqS2N3rfvCB6d2kIt9SyJSRsIR1m5Z7kMYL3hN9d1FZwgYhTXAhktkEawrXYMaIedGISl4lfCIHdKDuTt/aE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(36756003)(86362001)(41300700001)(66946007)(478600001)(6506007)(38070700005)(6512007)(966005)(6486002)(38100700002)(8936002)(110136005)(71200400001)(5660300002)(26005)(186003)(83380400001)(2616005)(2906002)(82960400001)(122000001)(8676002)(64756008)(66556008)(76116006)(66476007)(4326008)(66446008)(91956017)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enhZYmtoaEhHRUJiT3YrQVViOHN1NnNUa0pZdlE2QXdXS2RUMkZHYXZjbHBz?=
 =?utf-8?B?V2V1a3l5ak5nNmQ0YVJXSVNQMmlwcEZTQ2RLTWNra3Axejh5ejcyU1BWVUlz?=
 =?utf-8?B?YVRxVk9oNFRHQ2hMT2hMZUhsNE5GazNsU05iMmNFVHZXYXl6T0FDclpLN2xJ?=
 =?utf-8?B?NTlSc1VSeVN2YmsxM04yQVRyN2hRcE5xSTRWOThZZUgyMnE4a2ROTDdIUk5i?=
 =?utf-8?B?eExJaUhQR1JvZHFqSGNUNHJPaFk5RUZVdU8zbWd4bUNQdHJJcnFNLzdRR2hN?=
 =?utf-8?B?UEJiKzlWWlkvQkJXUTczT3F5TGNmelN3WU54c0x1Rk43RGl0UUc0VUZ3cExz?=
 =?utf-8?B?THpYVkdjWmlqdVUrZHc0b1FMNUYxelMva0JzNHRKNnZmUG1MZWNPNnpnOXov?=
 =?utf-8?B?Z3VqUUxtZzV1SFVZNFVxakFkaHRLWURSRVBISWpBczNyZFBPMVRZUHl5YWpp?=
 =?utf-8?B?NTRTQVJLM3B2MERHRHVQUDNlNXZVL1JxTy81SXRISC9Eb2p3LzNFNXZaTGty?=
 =?utf-8?B?aVRHV01UWDBYRTBYd0dBcjNNc1R5L1RnRzl2Nm03OEdEZGo0Y1pxWHBxanFy?=
 =?utf-8?B?U3lHdXVMbUM2RDFPdldBeHlSWVIzOGQ2dHE0Z0p5VGhTbTlOTVc1S2g5SzlK?=
 =?utf-8?B?WVd6NnhpQVVWajlOZm02Ny85dTVyU3JEREh6ZEN1UE1zUmhWdlRXSlU2K0k3?=
 =?utf-8?B?Ump5aVo3L01ibk9VaWk5WWNpOHdoczB4LzVKSlgyb05vYjhObFloUGFmcTBK?=
 =?utf-8?B?TEFYNCtQRWFqRWZmYVM0QlFuVXJXYnBmYWhPS2xrYWl0cno3QU9zbGhXdy9O?=
 =?utf-8?B?c0FXY0x3eDlpNjl6RWYyaHF2S213NVozTS90eVFCb1EvUXNtYmx2d0NYNytX?=
 =?utf-8?B?V2R2Wkc2SWN0ZGx2YWEyUHkwK1NpQVEvclV4cXB0SkNrdXBLVWdDSWd2L1FX?=
 =?utf-8?B?UUk3Y1pzMWhrUk1Qbm03V0NaTkpaTDZGV2JWM3Y1ZXRBakNQTTJiTFJnMkF0?=
 =?utf-8?B?RG1DbENkbjZMbVhvMzFNd0d2Uk9FeTBEaTd0azQ2MnEydEQxMDVJM1VvVDdP?=
 =?utf-8?B?ejhZRG55RkEzMWd2SjBQOFFKZ0lQUUZkTU56SEwvVWl4N0x4REc0TnVRR0JG?=
 =?utf-8?B?WGlrYjlkc3BSYnQrMUJxMHY3emk1ZjhkMUhsbW9tTlJCUy9QWnNIejVvS3Yw?=
 =?utf-8?B?UDdhUm5mRVFOMGZ1SXhBV2Y1OWZVRktDM0ZIYWhJb3k4USsrbkExNkQ1aFpK?=
 =?utf-8?B?enpCdlNLb3dXWGdndDZWNERYTWd6c0dFQW4wUktzeG1UQllsREhMc1hHWS9n?=
 =?utf-8?B?UFQyVDgwYUw2T2htdVNIQ2tXL3FlWEtiVEZ3aUk2RkxldUpONmNOT2RYcG52?=
 =?utf-8?B?RUpqTlBJSzdiRzBkTkJzQzFLdG5rSzhWdDhta1FiRERJaU5rMU5jbHFaR0Z6?=
 =?utf-8?B?U09MY0RtRWpSS2hSQnV3Qk9EZStGamdDZ2oxV2FHMnhZQndGR3lCbmFGenRV?=
 =?utf-8?B?V0QxR1lzSWtVRTJNQXA3Q2h0aUh4RGxnM3hBNWoySGx3dGgvUXNFMHp4STlY?=
 =?utf-8?B?MlhQVVJlYStJYmJiWlZtenpSNjNyaEF2ZDU3T1llY1VCN2VpR21QQ01WS1p5?=
 =?utf-8?B?MkErNk1HTWNjSk9OeU41cUpEOVBzWHcvRWdXdDZ3bldKOUxkUm1qM0tuOUto?=
 =?utf-8?B?MEdJYncrUjNhd2RrNU9qblhUQTVwNkhURGU4UmNqemJ1QzBUN1RxaXdoZld1?=
 =?utf-8?B?MmRETDBxZ3BCVDdxdGxEUWhkVGFHWG9NUkxIa0dmdXNrWFlJOXg2SndTQ0lw?=
 =?utf-8?B?dk8zQ0haYlBJOXhReFpkS0wyQStSMHZGQnA0bGloSjRLTVNTeFVKNzNOaFl6?=
 =?utf-8?B?VzFSYWJ0RDAzcElMbVI5U2loWEF6bS9XQVczVEpKcGFYNjdQQStLcUlqYW9m?=
 =?utf-8?B?NzcyZXBqK1VZZmpRVUgyeXVoZXRrTWtaZWpCQ2cwRGhoN1dMK1hOelpoUWZh?=
 =?utf-8?B?WjJHK1B2R04zMjJNZkZyMGNmeXRXSkpFUFNGWFlQNVp4ZUx3RzZNV1V2d1cz?=
 =?utf-8?B?ZWxOZThKTlptK1VaZFYySVVWLzAwVG1YNCtDK0NVeHI4VkVDR29FSE1nRkNj?=
 =?utf-8?B?dVRBK2lEcU92dkkxTjg5cUNSUy9vUWx0bDN5SG16VjM4RDgzc0RkYkEzakdZ?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1ED0B6F1621FD428FE0F5A55E10EE81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ed5ef9-1688-4b25-a6dc-08db2cb00d35
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 21:38:04.9918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIdwkuksjJ0Hj1dsvTM5ca55zoIv3yx4w2Fs8NLzi1P1CrNdPvJB4GOlTao+zlXi5hRqhFSZpl1udYgCmCLPeecKZNihLY2aUn8yDjggjiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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
Cc: "Weiss, Zev" <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE2OjE0ICswMzAwLCBQYXVsIEZlcnRzZXIgd3JvdGU6DQo+
IEhlbGxvLA0KPiANCj4gUmVjZW50bHkgT3BlbkJNQyBzd2l0Y2hlZCB0byBuZXdlciBMaW51eCB2
ZXJzaW9uIHdoaWNoIGdvdCB1cHN0cmVhbQ0KPiBzdXBwb3J0IGZvciB0aGUgUEVDSSBidXMsIHdp
dGggQ1BVIGFuZCBESU1NIG1vZHVsZXMgdGVtcGVyYXR1cmUNCj4gc2Vuc29ycyByZXBvcnRlZCB2
aWEgaXQuIEkgYXNzdW1lIHRoaXMgaXMgZXNzZW50aWFsIGZvciBhbGwNCj4gSW50ZWwtYmFzZWQg
c2VydmVyIG1vdGhlcmJvYXJkcyBhcyBtb25pdG9yaW5nIENQVSB0ZW1wZXJhdHVyZSBhbmQNCj4g
c3Bpbm5pbmcgZmFucyBhY2NvcmRpbmdseSBpcyBvbmUgb2YgdGhlIGNvcmUgQk1DIGZ1bmN0aW9u
YWxpdGllcy4NCj4gDQo+IEhvd2V2ZXIsIEkgd2Fzbid0IGFibGUgdG8gZmluZFswXSBhbnkgc2ln
biB0aGF0IHRoaXMgY29kZSBjYW4gYWN0dWFsbHkNCj4gYmUgdXNlZCBpbiBPcGVuQk1DLiBpbnRl
bGNwdXNlbnNvciBkYWVtb24gZXhpdHMgZWFybHkgYXMgdGhlIHVwc3RyZWFtDQo+IGNvZGUgZG9l
c24ndCBpbXBsZW1lbnQgdGhlIElPQ1RMcyBmb3IgZGlyZWN0IHVzZXJzcGFjZSBidXMNCj4gb3Bl
cmF0aW9ucy4gSXMgdGhlcmUgYW55IHdvcmsgcGxhbm5lZCB0byBtYWtlIGl0IGNvbXBhdGlibGUs
IG9yIHdhcw0KPiBzb21lIG90aGVyIHdheSBjaG9zZW4/DQoNClllcywgaXQncyBjdXJyZW50bHkg
bm90IGNvbXBhdGlibGUgd2l0aCB1cHN0cmVhbSBQRUNJLg0KDQpJbiBKYW51YXJ5IHRoZXJlIHdh
cyBhIHRocmVhZCByZWxhdGVkIHRvIGRidXMtc2Vuc29ycyBwcmVzZW50IGFuZCBmdXR1cmU6DQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuYm1jL1k3OVU1MnRvUDArWTRlZGhAaGF0dGVyLmJl
d2lsZGVyYmVlc3QubmV0Lw0Kd2hlcmUgWmV2IG1lbnRpb25lZCB0aGF0IGhlIHN0YXJ0ZWQgdG8g
d29yayBvbiBkYnVzLXNlbnNvcnMgcmVwbGFjZW1lbnQsIHdoaWNoDQpkb2VzIHN1cHBvcnQgKGFt
b25nIG90aGVyIHRoaW5ncykgdXBzdHJlYW0gUEVDSToNCg0KaHR0cHM6Ly9naXRodWIuY29tL3pl
dndlaXNzL29tbmlzZW5zb3IvYmxvYi9tYXN0ZXIvc3JjL3BlY2kucnMNCg0KPiANCj4gQW5vdGhl
ciByZWxhdGVkIHF1ZXN0aW9uIGlzIHRoYXQgcGVjaS1wY2llIGRhZW1vbiB1c2VkIGZvciBlbnVt
ZXJhdGluZw0KPiBob3N0IFBDSWUgZGV2aWNlcyBjYW4gbm8gbG9uZ2VyIGJlIHVzZWQgZHVlIHRv
IHRoZSBzYW1lIHJlYXNvbiwgaXMNCj4gdGhlcmUgc29tZSByZXBsYWNlbWVudCBpbiB0aGUgd29y
a3M/IFdoZXJlIGNhbiBJIHRyYWNrIGl0cw0KPiBkZXZlbG9wbWVudD8NCg0KV2hlbiBpdCBjb21l
cyB0byBwZWNpZGV2LCBJIGRpZG4ndCBwbGFuIHRvIGhhdmUgaXQgYXZhaWxhYmxlIHVwc3RyZWFt
Lg0KRnJvbSBteSBwZXJzcGVjdGl2ZSAtIHRoZSB1QVBJIGV4cG9zZWQgYnkgcGVjaWRldiBpcyB0
b28gbG93LWxldmVsIHRvIGJlIHVzZWQNCmZvciBhbnl0aGluZyBvdGhlciB0aGFuIGRldmVsb3Bt
ZW50IHB1cnBvc2UuIEl0IHdvdWxkIGFsc28gYmUgdmVyeSB0cmlja3kgdG8NCnN1cHBvcnQgY2Vy
dGFpbiBQRUNJIGZlYXR1cmVzIHJlbGlhYmx5IChzdWNoIGFzIHdha2Ugb24gcGVjaSkgaW4gdGhl
IGZ1dHVyZSBpZg0KcGVjaWRldiB3YXMgYXZhaWxhYmxlLg0KDQpSZWdhcmRpbmcgcGVjaS1wY2ll
LCB0aGUgcGxhbiB3b3VsZCBiZSB0bywgaW5zdGVhZCBvZiB1c2luZyBwZWNpZGV2LCBpbXBsZW1l
bnQgYQ0KUEVDSSBkcml2ZXIgb24gdGhlIGtlcm5lbCBzaWRlLCB3aGljaCBleHBvc2VzIHRoZSBu
ZWNlc3NhcnkgaW5mb3JtYXRpb24gb3Zlcg0Kc3lzZnMgKGFic3RyYWN0aW5nIGF3YXkgdGhlIFBF
Q0kgY29tbWFuZHMgdXNlZCBpbnRlcm5hbGx5KSBhbmQgdXNlIHRoYXQgaW4gcGVjaS0NCnBjaWUu
DQoNClRoYW5rcw0KLUl3b25hDQoNCj4gDQo+IFswXQ0KPiBodHRwczovL2dlcnJpdC5vcGVuYm1j
Lm9yZy9xL3Byb2plY3Q6b3BlbmJtYy9kYnVzLXNlbnNvcnMrbWVzc2FnZTppbnRlbGNwdXNlbnNv
cg0KPiANCg==
