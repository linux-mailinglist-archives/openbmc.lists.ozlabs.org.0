Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E84525F9
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 02:58:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtTkH4sqsz2xh0
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 12:58:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=O1ndmKaF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=O1ndmKaF; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtNt42FHFz2xC6;
 Tue, 16 Nov 2021 09:20:11 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319755010"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="319755010"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 14:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="585757256"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2021 14:19:09 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 14:19:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 14:19:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 14:19:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 14:19:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0U1JrVHpf4vJp1UDpu7I8MfYNot3B0H47JAYwScpOYMo3XHaCkqR96XAl/jOmU0sylT+PmDL9dc3JfviN9DNcENYKrSW4gJhD9Fpcic00QtOTotledxpjJSovhxLK9UOC+7WkF0cQftOEZsAAs1rlx5laK0D7LUMRZXS9hZh6GgI5RtIqqNrLedZsKLmlewuwTGN8QtjLVXYX5zOxMlJuldnU1lul/T6/92GivYiIOeZHm/avIm3hrrfvz1R4CzBtk4Lf9iP0d6G5ht6+3qFK4Y8HD1MPAoC2SxY+v25ByqhHVeg+STRkjhPmchkiJxDl6vSIuBHAH+XiMwP9+DEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO1B13FXfDtzh5g6YD2DeDoRhAW9SYgu2tGS5tKKYTg=;
 b=OEdv2K+4/Yr14JTamtElDzl/Nzlu8NP0+9wIa879v1SoCTgS1cNr+PbnPUe+AH/h8nOqO+gHOrUn+0p9pPJKGrylYh8ZoBv7CW0rppC9X+km/UdNlCZjlnlfEhXSiz3hPiTIzrLAV9M+EKkXs8n/hIMvVo7HCnOInn/VUnz5w2ZtwPQoaYVgKa09CNFumrw5f0R0nc5IN14eS9p2kAEAoj/5is2qRsHye7tHQbIzbvMqLeX17g6Br0ni2hJB/iJvT4zVtk8lXhlMDYP/e2tr5W+2L07qtd5eY6CwlvFPDsrDj4yuicZlqbd282PT0mMCI7/xmsQvF1qECMU09oW1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO1B13FXfDtzh5g6YD2DeDoRhAW9SYgu2tGS5tKKYTg=;
 b=O1ndmKaFZcLdk8+HyZS1d/A6DtfHLlZUvqwTv8ITioZnFs5Grvq83An3A+MLpfrcud65Czase0QMHKcgOqE4qjuVYYeSaUpm0uJVMUPkgJ9Peucd50Lny8zZTR8JahFMBTjus4qCkDxaUUm2Pqy1az5sm3CiT/AyRQZtAuRKcLI=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 22:19:04 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 22:19:04 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 09/15] peci: Add sysfs interface for PECI bus
Thread-Topic: [PATCH v2 09/15] peci: Add sysfs interface for PECI bus
Thread-Index: AQHXiFuv54lK3OxVv02DvUkidMrMCquH3dMAgH3vCwA=
Date: Mon, 15 Nov 2021 22:19:04 +0000
Message-ID: <0fb36e270cd497ade90eb0a4e9882819af3472dd.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-10-iwona.winiarska@intel.com>
 <CAPcyv4hhtTi+dKspjoamYj53GxT4Ot_1pG5-eavUJdihD8iAEg@mail.gmail.com>
In-Reply-To: <CAPcyv4hhtTi+dKspjoamYj53GxT4Ot_1pG5-eavUJdihD8iAEg@mail.gmail.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d900d939-6e3f-4c0c-56ae-08d9a885ef28
x-ms-traffictypediagnostic: CO1PR11MB5121:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <CO1PR11MB5121F93A7CB31CFE950068E5EC989@CO1PR11MB5121.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WQiENCMmz2BVn0UFIeZvyKsCn6sgU3dr7JUK0ra6T9UibwPOd1Z+p6vxrL3lAv5VRQ0g+Cx7pK69/l16B/fVcx/jJvhOX0Y8Ds0X6lGHc+EUQYbCvL3x9ey8gYNbwDD6pZP+s+wtxqr80vIjSwYwvIEpukCF1sOPlDhFHgAeAFgipIkzfTIoZjq3Dmh26UpJghn0d88gj8rJdDLfu0af2LUtQsDYbVcgRryH88sXazaK5U086T2XDHO0z5cQtKjYLictgPhtqThsKYfh7jMWAiqLjtGTzvel8CChtbP3aU8WjqGyAEAXa6IZbq2eyvnzXMtTA0dRTyZW1cUmymP4ECf/8SdLxhGwIE3yWaRyNq/W7FvgzE0FdeHyCqEMqzgWqGIYqAD0TC5dFv58GW/7d+Ki8eT8850W9gUsyp96REIKRdMmmedHSOowPPaZ5ZVZjrU9Zym+5Xv8fPuDP2/jXK8etWl0d8jQoDhpZ/2VKQqpEunisRKMzXpRVaXJH8yk51PdkE/notXPOOBBHiv2pQduwM6l7FefDQYmj8yxQUycE5If8Nzzu9ZQQ7JKEdrL55z6DPEqe6DXXCUFNAR29QHFgTvNYkPuzqppXkkfVsK238YZV9FU1bWIMZQnx1E9s3LzS7Kask+L6X3l0fB+DQD6F/1sAfPsJxY6tBhnZbD9e44tgSUQCIl6ZpkptAduizw/fFmMtSieNjo/cPw5Ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(5660300002)(53546011)(508600001)(4326008)(6636002)(6862004)(186003)(54906003)(26005)(83380400001)(8676002)(66556008)(64756008)(7416002)(7406005)(66446008)(2906002)(66476007)(38100700002)(38070700005)(37006003)(316002)(2616005)(36756003)(71200400001)(86362001)(8936002)(122000001)(66946007)(6512007)(76116006)(82960400001)(91956017)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3J3RWJSU0J6bE5MaklSUklXaWFMa05uMkNJKzdScHpNUUdQRXVZZGVUeHNK?=
 =?utf-8?B?akRJYkpmdDZtakNtcnE5N3UzQ3lLbGZML3g3WjZUb1N0MmVBMDlGNERGVUIw?=
 =?utf-8?B?ZE8zWEFMdUNodm1mQ1g2dDlVZml3NnQwUm02UFRzb296WElMd3ZXdm0wMUZ1?=
 =?utf-8?B?ZnYycFdYMjVoU292OGRRazZuWlh3TnhnVXNXWm5Id1htS05UaFdLb1YvcDZC?=
 =?utf-8?B?VmNxaFJ2VUFObkZHQ2NOdTBmQXkxaGZnTTVJVFdGVHkwQm84N2lXZm5JV0dx?=
 =?utf-8?B?cUpvKzI1T0JyRFFMb01sZzBOdVVOQlBCOXQ2WUZuUUJYRjN6Ym1RdHRhTVBT?=
 =?utf-8?B?K09ncUZRZVZxTTN6eDg5WWN2d2wwNjV0L0ZDMUJIS0Z2UVV2WTNHVEsyV3RH?=
 =?utf-8?B?Q3lDMC9BR1FLeE4reU1IV3B3Nm9qc0tzWDc0ZmlwT1JvZDI3RWUybDdvbTJK?=
 =?utf-8?B?S083M2ZHR05rWU5UVjljQjA0ZkxmdTQrQStpQnhCc0RqNmhRbUpsMHV3Sksx?=
 =?utf-8?B?MS9ZNkd4dEVTd3dpMExIZEExbk43UVAvTWRCNDBxTHVUL25ncUtBTzVOT3dG?=
 =?utf-8?B?U05ScWNmbVUwdnFZeHdnWUJteUw2TlFzQ2pMb3RiTFc4dkp5Z0FmbHdYK3Vj?=
 =?utf-8?B?cXBMU1hkZzNSYThsVUszYkk0UDBlRnZJT0ZqcXhXQ3ByVmdqY3BnK2FITTNr?=
 =?utf-8?B?Sk5hMHlZK01KVUZFUkRycDBsVHdyTWJZZThHMHptTXB5MmtwU1B2eFFFRTFq?=
 =?utf-8?B?alRvMHY4aFE3QVF3Yy90YWJrcEJqcHVOcDlpa1BoNEFpKzdEUXdYQnczakZr?=
 =?utf-8?B?SzFycDRXWGJwRkswMGtjSFpXbGd6TVJlT1Q4RHYwU2FaaUdKUW9JK2g2Vkg2?=
 =?utf-8?B?Zk1VZEdJUHJHbzcwQUc3UHJtSjZrR1dGZU82SWgxT3A3SFhSQU9FQm1Tc0la?=
 =?utf-8?B?ZmVUWGpYYmlhTlVObmhTT0pGUE5JSFhYMDFLZ2dYaDN6U1dDemxlalUwOXlT?=
 =?utf-8?B?WElQcnFONFExNUhJaCtNZHJvdnZJdzFWQ21xaDRpRTZ2WWFFMHBZeWJZYS85?=
 =?utf-8?B?eUVMY2ptMW9OTDFuVUczaWJvVDYrbG1NcmlIa1VnczZIelpIZHltUTdvLzVy?=
 =?utf-8?B?bzdwclp2Z1dFc3A1U2JWc1plM0xYeXh0NE9TTDlCSEMwQlA0QXNsSndHV1Zp?=
 =?utf-8?B?NmYvYmErM2YwY2RFMk9CaXV6OUVIbnRqOG9mOXJkSmhkWUNRUHA1bkl6NDFo?=
 =?utf-8?B?Q0tsM1NPc1ZRa2tNQjBqdksxK1AyNkJVMUVvajVRZVIzRmdYbnh4Y3RJREZF?=
 =?utf-8?B?VkdQS0FET2FVbEJGK3NCVWJxVUhMUXY1S3pCOHh0NldzRkM4dndWa0NuQ3dK?=
 =?utf-8?B?aVhpV1hwb0lSSjRqN3MxOFhsSE9weUUvK0xjenAzL3lWV2NwdmpReXdlbkdu?=
 =?utf-8?B?THkzQXJWOFErREN4MFZDNDQ4K2k3T3lHMlpHVVluai80OTRxdmtzdEh6UWZy?=
 =?utf-8?B?NG8vVklWLzVGeUdTRjlOS0s5R2lrZjMrWUlVRWlqMmIwSlMvOWR6czd6THU5?=
 =?utf-8?B?NHh4L0I2UjNvdEdOekRhM2tyUWdOd1NhVjc4Mk5IMkU0KzFGWENjVkZzdXVl?=
 =?utf-8?B?bU5QdU1MbS92TjNxSWFFbFFTM21CRVdEd3hxMlpRTnlQSWU4bXFKN3kvZzlO?=
 =?utf-8?B?R1pOMnRocUZuY1RyRzV4YWZObVJCREl3MzJ5QkhaNFc2c1BhRUVYL3BrTjFE?=
 =?utf-8?B?dnU0SENDRk50K3l4MUJzM3dWek4vUXRHa0lXNHdiUE5GM1BxcVNqOXI4WDhz?=
 =?utf-8?B?UkRxZUlLQlNCQU4rUUJIMDh4TkpWKzJFcEV1VGFSYWNldS9jTDQ2S1lNdFBr?=
 =?utf-8?B?K1lJYlRGWE1HLzFvNGtNQ1p0RDB0RnZuRWpZcWlCTUR6M3BuVnNucTVneHNl?=
 =?utf-8?B?bmt3T09EZlRNNVpEM3M1QVhyUVlobHhFa0s3TUhVaGJBbWFGTlJsOWVTc3hV?=
 =?utf-8?B?d0pVcDVkYlZ5UDFERGliLzZrM2cxOTFhZmdjRndaTDRSUGljT3JrSXA0UDgy?=
 =?utf-8?B?SkdBVFJGMG5MMzBLQmZBa1VaNFV1Z2NxTlFFWTJpTTQvWi9GTmJyalhpT0lW?=
 =?utf-8?B?ZlF2eXpBREtUYXViNERmUmxCdUlmdXREaCtESjZOWm9zTUU2S3BDSnlaajJ1?=
 =?utf-8?B?V0l3cnc3Z3JEYUkvRjR1Q0ZESzJQWDgxaWNzcWlPMXNGaC9OSnhaTWJSUTBk?=
 =?utf-8?Q?fl8qeU3zRweON2Jsljo0mdSpfY3+trQlSbxiTg2nks=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8F743B875D1124BB78C35324970FA39@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d900d939-6e3f-4c0c-56ae-08d9a885ef28
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 22:19:04.4916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhJXawW6tRxVOHM321/avEhyG+CheiSm6gMQI67nrz2SF3wFN6OAU20iXij4U4/7VOODifQWXfQh1oCf9uj8/7FaPLFIvH0+/jZjxT2W1ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 16 Nov 2021 12:57:15 +1100
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIxLTA4LTI3IGF0IDEyOjExIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6DQo+
IE9uIFR1ZSwgQXVnIDMsIDIwMjEgYXQgNDozNSBBTSBJd29uYSBXaW5pYXJza2ENCj4gPGl3b25h
LndpbmlhcnNrYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IFBFQ0kgZGV2aWNlcyBtYXkg
bm90IGJlIGRpc2NvdmVyYWJsZSBhdCB0aGUgdGltZSB3aGVuIFBFQ0kgY29udHJvbGxlciBpcw0K
PiA+IGJlaW5nIGFkZGVkIChlLmcuIEJNQyBjYW4gYm9vdCB1cCB3aGVuIHRoZSBIb3N0IHN5c3Rl
bSBpcyBzdGlsbCBpbiBTNSkuDQo+ID4gU2luY2Ugd2UgY3VycmVudGx5IGRvbid0IGhhdmUgdGhl
IGNhcGFiaWxpdGllcyB0byBmaWd1cmUgb3V0IHRoZSBIb3N0DQo+ID4gc3lzdGVtIHN0YXRlIGlu
c2lkZSB0aGUgUEVDSSBzdWJzeXN0ZW0gaXRzZWxmLCB3ZSBoYXZlIHRvIHJlbHkgb24NCj4gPiB1
c2Vyc3BhY2UgdG8gZG8gaXQgZm9yIHVzLg0KPiA+IA0KPiA+IEluIHRoZSBmdXR1cmUsIFBFQ0kg
c3Vic3lzdGVtIG1heSBiZSBleHBhbmRlZCB3aXRoIG1lY2hhbmlzbXMgdGhhdCBhbGxvdw0KPiA+
IHVzIHRvIGF2b2lkIGRlcGVuZGluZyBvbiB1c2Vyc3BhY2UgaW50ZXJhY3Rpb24gKGUuZy4gQ1BV
IHByZXNlbmNlIGNvdWxkDQo+ID4gYmUgZGV0ZWN0ZWQgdXNpbmcgR1BJTywgYW5kIHRoZSBpbmZv
cm1hdGlvbiBvbiB3aGV0aGVyIGl0J3MgZGlzY292ZXJhYmxlDQo+ID4gY291bGQgYmUgb2J0YWlu
ZWQgb3ZlciBJUE1JKS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhpcyBkZXRhaWwuDQo+IA0KPiA+IFVu
Zm9ydHVuYXRlbHksIHRob3NlIG1ldGhvZHMgbWF5IHVsdGltYXRlbHkgbm90IGJlIGF2YWlsYWJs
ZSAoc3VwcG9ydA0KPiA+IHdpbGwgdmFyeSBmcm9tIHBsYXRmb3JtIHRvIHBsYXRmb3JtKSwgd2hp
Y2ggbWVhbnMgdGhhdCB3ZSBzdGlsbCBuZWVkDQo+ID4gcGxhdGZvcm0gaW5kZXBlbmRlbnQgbWV0
aG9kIHRyaWdnZXJlZCBieSB1c2Vyc3BhY2UuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXdv
bmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKg
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtcGVjaSB8IDE2ICsrKysrDQo+ID4g
wqBkcml2ZXJzL3BlY2kvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQ0KPiA+IMKgZHJpdmVycy9wZWNpL2NvcmUuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArLQ0KPiA+IMKgZHJpdmVycy9wZWNpL2Rl
dmljZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiA+
IMKgZHJpdmVycy9wZWNpL2ludGVybmFsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCA1ICsrDQo+ID4gwqBkcml2ZXJzL3BlY2kvc3lzZnMuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysNCj4g
PiDCoDYgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1i
dXMtcGVjaQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9zeXNmcy5jDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVz
LXBlY2kNCj4gPiBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLXBlY2kNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTZjMmIyMjE2
YmJkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rp
bmcvc3lzZnMtYnVzLXBlY2kNCj4gPiBAQCAtMCwwICsxLDE2IEBADQo+ID4gK1doYXQ6wqDCoMKg
wqDCoMKgwqDCoMKgIC9zeXMvYnVzL3BlY2kvcmVzY2FuDQo+ID4gK0RhdGU6wqDCoMKgwqDCoMKg
wqDCoMKgIEp1bHkgMjAyMQ0KPiA+ICtLZXJuZWxWZXJzaW9uOiA1LjE1DQo+ID4gK0NvbnRhY3Q6
wqDCoMKgwqDCoMKgIEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4N
Cj4gPiArRGVzY3JpcHRpb246DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgV3Jp
dGluZyBhIG5vbi16ZXJvIHZhbHVlIHRvIHRoaXMgYXR0cmlidXRlIHdpbGwNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbml0aWF0ZSBzY2FuIGZvciBQRUNJIGRldmljZXMgb24g
YWxsIFBFQ0kgY29udHJvbGxlcnMNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
biB0aGUgc3lzdGVtLg0KPiA+ICsNCj4gPiArV2hhdDrCoMKgwqDCoMKgwqDCoMKgwqAgL3N5cy9i
dXMvcGVjaS9kZXZpY2VzLzxjb250cm9sbGVyX2lkPi08ZGV2aWNlX2FkZHI+L3JlbW92ZQ0KPiA+
ICtEYXRlOsKgwqDCoMKgwqDCoMKgwqDCoCBKdWx5IDIwMjENCj4gPiArS2VybmVsVmVyc2lvbjog
NS4xNQ0KPiA+ICtDb250YWN0OsKgwqDCoMKgwqDCoCBJd29uYSBXaW5pYXJza2EgPGl3b25hLndp
bmlhcnNrYUBpbnRlbC5jb20+DQo+ID4gK0Rlc2NyaXB0aW9uOg0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFdyaXRpbmcgYSBub24temVybyB2YWx1ZSB0byB0aGlzIGF0dHJpYnV0
ZSB3aWxsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVtb3ZlIHRoZSBQRUNJ
IGRldmljZSBhbmQgYW55IG9mIGl0cyBjaGlsZHJlbi4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wZWNpL01ha2VmaWxlIGIvZHJpdmVycy9wZWNpL01ha2VmaWxlDQo+ID4gaW5kZXggYzVmOWQz
ZmUyMWJiLi45MTdmNjg5ZTE0N2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wZWNpL01ha2Vm
aWxlDQo+ID4gKysrIGIvZHJpdmVycy9wZWNpL01ha2VmaWxlDQo+ID4gQEAgLTEsNyArMSw3IEBA
DQo+ID4gwqAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiANCj4g
PiDCoCMgQ29yZSBmdW5jdGlvbmFsaXR5DQo+ID4gLXBlY2kteSA6PSBjb3JlLm8gcmVxdWVzdC5v
IGRldmljZS5vDQo+ID4gK3BlY2kteSA6PSBjb3JlLm8gcmVxdWVzdC5vIGRldmljZS5vIHN5c2Zz
Lm8NCj4gPiDCoG9iai0kKENPTkZJR19QRUNJKSArPSBwZWNpLm8NCj4gPiANCj4gPiDCoCMgSGFy
ZHdhcmUgc3BlY2lmaWMgYnVzIGRyaXZlcnMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNp
L2NvcmUuYyBiL2RyaXZlcnMvcGVjaS9jb3JlLmMNCj4gPiBpbmRleCBkMTQzZjFhN2ZlOTguLmM0
NzNhY2IzYzJhMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BlY2kvY29yZS5jDQo+ID4gKysr
IGIvZHJpdmVycy9wZWNpL2NvcmUuYw0KPiA+IEBAIC0zNCw3ICszNCw3IEBAIHN0cnVjdCBkZXZp
Y2VfdHlwZSBwZWNpX2NvbnRyb2xsZXJfdHlwZSA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoCAucmVs
ZWFzZcKgwqDCoMKgwqDCoMKgID0gcGVjaV9jb250cm9sbGVyX2Rldl9yZWxlYXNlLA0KPiA+IMKg
fTsNCj4gPiANCj4gPiAtc3RhdGljIGludCBwZWNpX2NvbnRyb2xsZXJfc2Nhbl9kZXZpY2VzKHN0
cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIpDQo+ID4gK2ludCBwZWNpX2NvbnRyb2xs
ZXJfc2Nhbl9kZXZpY2VzKHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIpDQo+ID4g
wqB7DQo+ID4gwqDCoMKgwqDCoMKgwqAgaW50IHJldDsNCj4gPiDCoMKgwqDCoMKgwqDCoCB1OCBh
ZGRyOw0KPiA+IEBAIC0xNTksNiArMTU5LDcgQEAgRVhQT1JUX1NZTUJPTF9OU19HUEwoZGV2bV9w
ZWNpX2NvbnRyb2xsZXJfYWRkLCBQRUNJKTsNCj4gPiANCj4gPiDCoHN0cnVjdCBidXNfdHlwZSBw
ZWNpX2J1c190eXBlID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPSAicGVjaSIsDQo+ID4gK8KgwqDCoMKgwqDCoCAuYnVzX2dyb3Vwc8KgwqDCoMKgID0g
cGVjaV9idXNfZ3JvdXBzLA0KPiA+IMKgfTsNCj4gPiANCj4gPiDCoHN0YXRpYyBpbnQgX19pbml0
IHBlY2lfaW5pdCh2b2lkKQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvZGV2aWNlLmMg
Yi9kcml2ZXJzL3BlY2kvZGV2aWNlLmMNCj4gPiBpbmRleCAzMjgxMTI0ODk5N2IuLmQ3N2Q5ZGFi
ZDUxZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BlY2kvZGV2aWNlLmMNCj4gPiArKysgYi9k
cml2ZXJzL3BlY2kvZGV2aWNlLmMNCj4gPiBAQCAtMTEwLDUgKzExMCw2IEBAIHN0YXRpYyB2b2lk
IHBlY2lfZGV2aWNlX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+IMKgfQ0KPiA+IA0K
PiA+IMKgc3RydWN0IGRldmljZV90eXBlIHBlY2lfZGV2aWNlX3R5cGUgPSB7DQo+ID4gK8KgwqDC
oMKgwqDCoCAuZ3JvdXBzwqDCoMKgwqDCoMKgwqDCoCA9IHBlY2lfZGV2aWNlX2dyb3VwcywNCj4g
PiDCoMKgwqDCoMKgwqDCoCAucmVsZWFzZcKgwqDCoMKgwqDCoMKgID0gcGVjaV9kZXZpY2VfcmVs
ZWFzZSwNCj4gPiDCoH07DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9pbnRlcm5hbC5o
IGIvZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4gPiBpbmRleCA1N2QxMWE5MDJjNWQuLjk3OGUx
MmM4ZTFkMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BlY2kvaW50ZXJuYWwuaA0KPiA+ICsr
KyBiL2RyaXZlcnMvcGVjaS9pbnRlcm5hbC5oDQo+ID4gQEAgLTgsNiArOCw3IEBADQo+ID4gwqAj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiANCj4gPiDCoHN0cnVjdCBwZWNpX2NvbnRyb2xs
ZXI7DQo+ID4gK3N0cnVjdCBhdHRyaWJ1dGVfZ3JvdXA7DQo+ID4gwqBzdHJ1Y3QgcGVjaV9kZXZp
Y2U7DQo+ID4gwqBzdHJ1Y3QgcGVjaV9yZXF1ZXN0Ow0KPiA+IA0KPiA+IEBAIC0xOSwxMiArMjAs
MTYgQEAgc3RydWN0IHBlY2lfcmVxdWVzdCAqcGVjaV9yZXF1ZXN0X2FsbG9jKHN0cnVjdA0KPiA+
IHBlY2lfZGV2aWNlICpkZXZpY2UsIHU4IHR4X2xlbiwgdQ0KPiA+IMKgdm9pZCBwZWNpX3JlcXVl
c3RfZnJlZShzdHJ1Y3QgcGVjaV9yZXF1ZXN0ICpyZXEpOw0KPiA+IA0KPiA+IMKgZXh0ZXJuIHN0
cnVjdCBkZXZpY2VfdHlwZSBwZWNpX2RldmljZV90eXBlOw0KPiA+ICtleHRlcm4gY29uc3Qgc3Ry
dWN0IGF0dHJpYnV0ZV9ncm91cCAqcGVjaV9kZXZpY2VfZ3JvdXBzW107DQo+ID4gDQo+ID4gwqBp
bnQgcGVjaV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIs
IHU4IGFkZHIpOw0KPiA+IMKgdm9pZCBwZWNpX2RldmljZV9kZXN0cm95KHN0cnVjdCBwZWNpX2Rl
dmljZSAqZGV2aWNlKTsNCj4gPiANCj4gPiDCoGV4dGVybiBzdHJ1Y3QgYnVzX3R5cGUgcGVjaV9i
dXNfdHlwZTsNCj4gPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKnBlY2lf
YnVzX2dyb3Vwc1tdOw0KPiANCj4gVG8gbWUsIHN5c2ZzLmMgaXMgc21hbGwgZW5vdWdoIHRvIGp1
c3QgZm9sZCBpbnRvIGNvcmUuYywgdGhlbiBubyBuZWVkDQo+IHRvIGRlY2xhcmUgcHVibGljIGF0
dHJpYnV0ZSBhcnJheXMgbGlrZSB0aGlzLCBidXQgdXAgdG8geW91IGlmIHlvdQ0KPiBwcmVmZXIg
dGhlIHN5c2ZzLmMgc3BsaXQuDQoNCkxlZnQgdGhlIHN5c2ZzIHNwbGl0IGZvciBub3cuDQoNCj4g
DQo+ID4gDQo+ID4gwqBleHRlcm4gc3RydWN0IGRldmljZV90eXBlIHBlY2lfY29udHJvbGxlcl90
eXBlOw0KPiA+IA0KPiA+ICtpbnQgcGVjaV9jb250cm9sbGVyX3NjYW5fZGV2aWNlcyhzdHJ1Y3Qg
cGVjaV9jb250cm9sbGVyICpjb250cm9sbGVyKTsNCj4gPiArDQo+ID4gwqAjZW5kaWYgLyogX19Q
RUNJX0lOVEVSTkFMX0ggKi8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNpL3N5c2ZzLmMg
Yi9kcml2ZXJzL3BlY2kvc3lzZnMuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5kYjllZjA1Nzc2ZTMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvZHJpdmVycy9wZWNpL3N5c2ZzLmMNCj4gPiBAQCAtMCwwICsxLDgyIEBADQo+ID4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiArLy8gQ29weXJpZ2h0IChj
KSAyMDIxIEludGVsIENvcnBvcmF0aW9uDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2
aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gPiArI2luY2x1ZGUgPGxp
bnV4L3BlY2kuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJpbnRlcm5hbC5oIg0KPiA+ICsNCj4g
PiArc3RhdGljIGludCByZXNjYW5fY29udHJvbGxlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgIGlmIChkZXYtPnR5cGUgIT0gJnBlY2lf
Y29udHJvbGxlcl90eXBlKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAwOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiBwZWNpX2NvbnRyb2xsZXJfc2Nh
bl9kZXZpY2VzKHRvX3BlY2lfY29udHJvbGxlcihkZXYpKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIHNzaXplX3QgcmVzY2FuX3N0b3JlKHN0cnVjdCBidXNfdHlwZSAqYnVzLCBjb25zdCBj
aGFyICpidWYsIHNpemVfdA0KPiA+IGNvdW50KQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoCBi
b29sIHJlczsNCj4gPiArwqDCoMKgwqDCoMKgIGludCByZXQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDC
oMKgwqAgcmV0ID0ga3N0cnRvYm9vbChidWYsICZyZXMpOw0KPiA+ICvCoMKgwqDCoMKgwqAgaWYg
KHJldCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+
ICsNCj4gPiArwqDCoMKgwqDCoMKgIGlmICghcmVzKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBjb3VudDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBi
dXNfZm9yX2VhY2hfZGV2KCZwZWNpX2J1c190eXBlLCBOVUxMLCBOVUxMLA0KPiA+IHJlc2Nhbl9j
b250cm9sbGVyKTsNCj4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCBy
ZXR1cm4gY291bnQ7DQo+ID4gK30NCj4gPiArc3RhdGljIEJVU19BVFRSX1dPKHJlc2Nhbik7DQo+
ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqcGVjaV9idXNfYXR0cnNbXSA9IHsN
Cj4gPiArwqDCoMKgwqDCoMKgICZidXNfYXR0cl9yZXNjYW4uYXR0ciwNCj4gPiArwqDCoMKgwqDC
oMKgIE5VTEwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmli
dXRlX2dyb3VwIHBlY2lfYnVzX2dyb3VwID0gew0KPiA+ICvCoMKgwqDCoMKgwqAgLmF0dHJzID0g
cGVjaV9idXNfYXR0cnMsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtjb25zdCBzdHJ1Y3QgYXR0cmli
dXRlX2dyb3VwICpwZWNpX2J1c19ncm91cHNbXSA9IHsNCj4gPiArwqDCoMKgwqDCoMKgICZwZWNp
X2J1c19ncm91cCwNCj4gPiArwqDCoMKgwqDCoMKgIE5VTEwNCj4gPiArfTsNCj4gPiArDQo+ID4g
K3N0YXRpYyBzc2l6ZV90IHJlbW92ZV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlDQo+ID4gKmF0dHIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291
bnQpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBwZWNpX2RldmljZSAqZGV2aWNl
ID0gdG9fcGVjaV9kZXZpY2UoZGV2KTsNCj4gPiArwqDCoMKgwqDCoMKgIGJvb2wgcmVzOw0KPiA+
ICvCoMKgwqDCoMKgwqAgaW50IHJldDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBr
c3RydG9ib29sKGJ1ZiwgJnJlcyk7DQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAocmV0KQ0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKHJlcyAmJiBkZXZpY2VfcmVtb3ZlX2ZpbGVfc2VsZihkZXYsIGF0dHIpKQ0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBlY2lfZGV2aWNlX2Rlc3Ryb3koZGV2
aWNlKTsNCj4gDQo+IEhvdyBkbyB5b3Ugc29sdmUgcmFjZXMgYmV0d2VlbiBzeXNmcyBkZXZpY2Ug
cmVtb3ZlIGFuZCBjb250cm9sbGVyDQo+IGRldmljZSByZW1vdmU/IExvb2tzIGxpa2UgZG91Ymxl
LWZyZWUgYXQgZmlyc3QgZ2xhbmNlLiBIYXZlIGEgbG9vayBhdA0KPiB0aGXCoCBraWxsX2Rldmlj
ZSgpIGhlbHBlciBhcyBvbmUgd2F5IHRvIHJlc29sdmUgdGhpcyBkb3VibGUtZGVsZXRlDQo+IHJh
Y2UuLg0KDQpEb25lLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiA+ICsNCj4gPiArwqDCoMKg
wqDCoMKgIHJldHVybiBjb3VudDsNCj4gPiArfQ0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfSUdO
T1JFX0xPQ0tERVAocmVtb3ZlLCAwMjAwLCBOVUxMLCByZW1vdmVfc3RvcmUpOw0KPiA+ICsNCj4g
PiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnBlY2lfZGV2aWNlX2F0dHJzW10gPSB7DQo+ID4g
K8KgwqDCoMKgwqDCoCAmZGV2X2F0dHJfcmVtb3ZlLmF0dHIsDQo+ID4gK8KgwqDCoMKgwqDCoCBO
VUxMDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9n
cm91cCBwZWNpX2RldmljZV9ncm91cCA9IHsNCj4gPiArwqDCoMKgwqDCoMKgIC5hdHRycyA9IHBl
Y2lfZGV2aWNlX2F0dHJzLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArY29uc3Qgc3RydWN0IGF0dHJp
YnV0ZV9ncm91cCAqcGVjaV9kZXZpY2VfZ3JvdXBzW10gPSB7DQo+ID4gK8KgwqDCoMKgwqDCoCAm
cGVjaV9kZXZpY2VfZ3JvdXAsDQo+ID4gK8KgwqDCoMKgwqDCoCBOVUxMDQo+ID4gK307DQo+ID4g
LS0NCj4gPiAyLjMxLjENCj4gPiANCg==
