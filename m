Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 916444298F3
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 23:31:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSsSR09Rjz2ynJ
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:31:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=YtMCzKE0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=YtMCzKE0; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSrf80DWgz2yNp;
 Tue, 12 Oct 2021 07:55:05 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="287844278"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="287844278"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 13:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="625654550"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2021 13:54:01 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 13:54:01 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 13:54:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 13:54:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 13:54:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+hT8bg8lH/GVYIVAANE/NjeP/GhsPmkX4dkQBhClvAqTgmeIel1cnk811jn+LuLVs/OQTFVIU3Xkof9usgFx/2l2iSFUl3U1Lb82g4YWbmSrjfiqgLs73vsDOpQULTrS7yPp5Vi5G/Ruo1BSt/ns+jVrbPRjG57qsSd/fJ2oZFCazVHntJsZzqW610QprGY5BlS/VkqhlDmOFIMu7U63paFeY8xB/zb6vWM/rjI+Wafwi7VH7RMQRB2vCqoe9UFg5fJJ2IPMUv8RxvFqxwyXkcEnh99BjF+OVDrJ+gFOpsno9/M8lGLKYS6OmfJ7buduBo3xYSpCuzHqqBmgZEXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOoGdcoB9BpEgjTNE6QR+CmXlk0ZdBF9xh4AyNxE6kQ=;
 b=QWUP2LzVD8N80NJWiujQ9WIpVV7+0vRdbdL1Vzq0SvHWlQa/nhXmY5DmXsZHwaDm4q8N2vx/ye+W1uxOUfo1bYmijOJaNO8wWEysx5qEevbIawc4XQK7KfGczPB91VmmeIEtbmMDwSX+yBywc1uwVDBWAMNKxEnMLr3VhbMaOKH7AC7dZ8r+SVa13pwZhQV5CVFnmAKSvLYb04tNyY4U+zsqATKbW2qfK/0Jbdy9SanDHanf7yy4pwCbaxx8Jdrw7eenIQ60WRd3q8PAr+CdmRbrivndGvg911LlBNJKlvQRSTHWo2HWJkeKmutEewPtXkeYVsQYGiSiSq4ITJUW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOoGdcoB9BpEgjTNE6QR+CmXlk0ZdBF9xh4AyNxE6kQ=;
 b=YtMCzKE08KlyfPXPT6j5WAifmC49Q1xF6VNuIYyAaWOdOStgZVfmvOyWU7Gi76gDwhvWpWi8IonsI0FZdPH03VRMQ1tUDsf5tKkPRt+8YAKBHvZl84+09e127RNkjVdPBGNhHier53nrbLx2jMOAFhbLwzB5ymj4Ukvc8uYngXI=
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 (2603:10b6:910:18::13) by CY4PR1101MB2279.namprd11.prod.outlook.com
 (2603:10b6:910:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 20:53:52 +0000
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc]) by CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc%11]) with mapi id 15.20.4587.026; Mon, 11 Oct
 2021 20:53:52 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "bp@alien8.de" <bp@alien8.de>
Subject: Re: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXiFtZAf43JMVeikGj7NGS9LF26KvDlHGAgAsFNYCAAAVHAIAAFIsA
Date: Mon, 11 Oct 2021 20:53:51 +0000
Message-ID: <43e367e452c6c8d9c6a275299d7ff6f2bb26b8e3.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-2-iwona.winiarska@intel.com>
 <YVtQG+idmwKn0qLe@zn.tnic>
 <58ef4107e9b2c60a2605aac0d2fb6670a95bc9e0.camel@intel.com>
 <67f2cfda-c78b-6282-f5a3-2f345f8e2849@intel.com>
In-Reply-To: <67f2cfda-c78b-6282-f5a3-2f345f8e2849@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2c2f317-b587-498f-b9a1-08d98cf93b7c
x-ms-traffictypediagnostic: CY4PR1101MB2279:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1101MB2279F49F67F92809F64D4001ECB59@CY4PR1101MB2279.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KrPG5qWBCDXdXyeAkTeI5HVRl3bQm2VWYFOw4YKBHz9Oxp/xbeROlD43UW5tAOIJFGjFHsglc4myxiKWnv0yyu9ySmvbOL+ikZniPr81dcj6dn2ZxesKOKTa3KHuQxA7dtSa94l9yDrfEEG9p23CyDGwACiCHGLFoopvQPgHaEuoQV9EZD2fVSEntQwjhq+WrSwzhTA5bbzGikxOeDvGQrz+e6Dl0JEQcMV0uAOA3wKp3E7RzCq6FY1GGnuupfQWPsx8St+DjbaIgexdEutSegYSMhGLNN99UayMNrMHP0UXRO0csxNS8NuXS0mn0q8Jzcdq12OBmk74uKYGbdORYOX/oF2ec4k2xtP9WBKOfVu+Ohy3WJCe7tCX5adlI7EDgKUTeeQHKUhT5O5Wi8O8xKrUHMMHsXLW/VyDVg8r1vD1sQ0gLhDSFQDPHItJayLlWXgehniKz/Q/iM0JdHk2+5gYVnCHeUrn6VZF58o6eZAf9SXe2B6Z1CYeDDZ3/yhSkWVl6vxexrBq5Zv+QWAWedRah7VNM6Bu7msJuzkoc2jY7hyLJFSAGk/TRJzBLWcPr+dMM/oe+j2I+YDlhjV2caqvkYRbbBWCJbPOnCQACAKWk/NQnzpmxDiWCXTER41yrp27NXkJnheQzT5VHQD7E0L84YmZl8iemAJF7d5eCjfw89AzB3hQD8q32qahUL+4ytOppAyRxtXP7ax1TvlpcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(7416002)(8936002)(91956017)(122000001)(54906003)(110136005)(186003)(7406005)(71200400001)(6512007)(6506007)(4001150100001)(83380400001)(5660300002)(36756003)(4326008)(26005)(6486002)(64756008)(66476007)(2906002)(66556008)(508600001)(66446008)(66946007)(76116006)(316002)(86362001)(38100700002)(2616005)(38070700005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVpNUXJMUnZBVC9OWDEvdnh4cEdzQWVSZGwycktBeVZ0clE5MlV0T3VON3p3?=
 =?utf-8?B?T0NncXJ3c2IxcVhxeE9YSDIvd3lqZnZFcnhlUVM0TFpsaGZ4TnJiOWZUeDBx?=
 =?utf-8?B?NSs3Ymp3VFc0R0ZBVk9HYTNodEF1dnFkaVRaVEpwZ05BNzdybkVsM2xBQ3JR?=
 =?utf-8?B?clhaVWFuZmRJMTEySGJVNkloSnh6ZmZwUWloeFNqcm5RSHl6K3pQc0FPd2JR?=
 =?utf-8?B?TnRQZlpKbjFNWGZEZmNHSEc5cnVSbGRaMXM0TFlIdTVoVjZhQ1gyRStlTFk4?=
 =?utf-8?B?bEkreTJjN0F1NDF6Y2JSdWtPM0NMM1JjTjJYV0o2cG5SektsUStVQXRvaGx4?=
 =?utf-8?B?NTV3dUh4VXFqeUJNRnAxL0NzVlBmdStsQ3lFN0lDd1VvYzdSa21yKy9qSlM0?=
 =?utf-8?B?YTdOR245Y2ZMbjN4RlN6YjJ3UXJFd1ZMMXZJdjR4K283NWNzaUk0aTludjQ2?=
 =?utf-8?B?cSsrQTdyNVZpUXI4MGxicmFsc0VnWm1FWmJobXg4akI1NXc0MnZPZFcvbEJR?=
 =?utf-8?B?TDE5OE40OXFJMUZGOXl4VGczd1NDN3JLNkJBblFIMVR2T1pXSVR5VXo5Tjcr?=
 =?utf-8?B?eER3Wm5hOE1lWjZMM3RFOFpRRE1pODFKNU1qZ0RLMFYvUmo2Z2hPMlY0YUdD?=
 =?utf-8?B?ZVIvMHQvaUxrYmZvWkVQcDlBYXZsQ1JIUnNFVE1pVmJYNVBrWnlCZ3dvV0Jv?=
 =?utf-8?B?WHlKM0swWEQ5NFg1dUxjZDNjYklPTzRPUkhnZEJOSFh3UGdRbUV1RDlsbUNI?=
 =?utf-8?B?Sjl5NnBHdXM4RzZHZHc2RDZrZEQ2VHNrS01tS01scElKTUNEclZVcXlGQTZW?=
 =?utf-8?B?NG14OWRrSWtDMEoweGdNaUhIUUxSNDdSTnlLaERERGVja2gvd2VBMU91YWpP?=
 =?utf-8?B?YURZL0hWb0RuNk1OdkUxeUZzYS9RL3h2K3VNajZuZTZwTmFwdDVUSEIxenQz?=
 =?utf-8?B?ajJzeXFyYnFSRFpyVHZRS1dzUFhXbU1LdGwzeWpuUjU2MXVheEx6M1paMW1Z?=
 =?utf-8?B?czZjbnlIZjBWemZsVm41eGxrUVVvMForWjR6NnkzeDUwZzZVZWZDVEF0ZHZN?=
 =?utf-8?B?b3VOZDBnTERZcVdDWnRrMUFkc3dTZEw4TTM4c0pjOE9WdmJJaTFWdGVPV2xF?=
 =?utf-8?B?UTdUbzhlUS92TkphNlJDQ1ZkeGhMTGJrRUhLYVlZYUIvbXlTVmZHQmMzalB5?=
 =?utf-8?B?TVJrOFBBS0RzUlMxS002TFVwdlpwUDRDamxEQlo2UjVLUDhvTkNQSHo5V0FF?=
 =?utf-8?B?TzhoRXUzNFVDbU4xRklMdjJiak43UGNPV012OU0ybzgxU1VXMlJDckU4eU9P?=
 =?utf-8?B?YXNRcGwxTGRYSjllYndOS01MQ1ZEN1orTjloU1lhRHBkcFZWWW53TlpXbTk0?=
 =?utf-8?B?K0VyNms1TGd5TDUrNlo5STZBZkkwaTQxbVozcXJOQWlDLzJ3ai9VNnE5bW9L?=
 =?utf-8?B?SW1xMjBzYXlUaVo3TGMzd3c0aDF6VU04WktkcWZqM211Sks5L1pFMWZ6QmVP?=
 =?utf-8?B?UDkrRGNlajF0anZzc0h5RXU5MDhLclgrSjgzejZkZDR3S3B6c0tRMWs3akxw?=
 =?utf-8?B?MlZIMzVEa3dmZTZyRmxYMGdteTV5MFRjcUVvRXdMRmVtNVBjYVdsNVAwU0VV?=
 =?utf-8?B?MEkwQlE1dXk5MXFreThrMXhQcDhybm5ZL3lXUVplRnBySHZWSUwwOU5PNlJV?=
 =?utf-8?B?WjlmMWlTZFRnVGx0Mlp5MzFYN01rem1YVnU3b2MyNGwwTDVTVE8rYk9VMWYv?=
 =?utf-8?B?VCttdnhLTUdXWDJpNzV0YmdUMnJpOFg2MmV5QjF0Wm0xWVMxaUJrbjlGMTI1?=
 =?utf-8?B?Mzh1WVhQcVd0a2VkaE92Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21BD1D9D076CFC4A905980A87AE662C4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c2f317-b587-498f-b9a1-08d98cf93b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 20:53:52.0151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3m2SbFB1t+bhOgRrruaQecgL6ztslj7qD87UHdd5E59w0IdDZDLY87RMK/LBzuqlQDRr9lnxy8MnLljhDXU2iTKgDiA7GAC15/Bj96AiHxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2279
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 12 Oct 2021 08:28:10 +1100
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
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
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "Lutomirski,
 Andy" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
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

T24gTW9uLCAyMDIxLTEwLTExIGF0IDEyOjQwIC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
T24gMTAvMTEvMjEgMTI6MjEgUE0sIFdpbmlhcnNrYSwgSXdvbmEgd3JvdGU6DQo+ID4gT24gTW9u
LCAyMDIxLTEwLTA0IGF0IDIxOjAzICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6DQo+ID4g
PiBPbiBUdWUsIEF1ZyAwMywgMjAyMSBhdCAwMTozMToyMFBNICswMjAwLCBJd29uYSBXaW5pYXJz
a2Egd3JvdGU6DQo+ID4gPiA+IEJhc2Vib2FyZCBtYW5hZ2VtZW50IGNvbnRyb2xsZXJzIChCTUMp
IG9mdGVuIHJ1biBMaW51eCBidXQgYXJlIHVzdWFsbHkNCj4gPiA+ID4gaW1wbGVtZW50ZWQgd2l0
aCBub24tWDg2IHByb2Nlc3NvcnMuIFRoZXkgY2FuIHVzZSBQRUNJIHRvIGFjY2VzcyBwYWNrYWdl
DQo+ID4gPiA+IGNvbmZpZyBzcGFjZSAoUENTKSByZWdpc3RlcnMgb24gdGhlIGhvc3QgQ1BVIGFu
ZCBzaW5jZSBzb21lIGluZm9ybWF0aW9uLA0KPiA+ID4gPiBlLmcuIGZpZ3VyaW5nIG91dCB0aGUg
Y29yZSBjb3VudCwgY2FuIGJlIG9idGFpbmVkIHVzaW5nIGRpZmZlcmVudA0KPiA+ID4gPiByZWdp
c3RlcnMgb24gZGlmZmVyZW50IENQVSBnZW5lcmF0aW9ucywgdGhleSBuZWVkIHRvIGRlY29kZSB0
aGUgZmFtaWx5DQo+ID4gPiA+IGFuZCBtb2RlbC4NCj4gPiA+ID4gDQo+ID4gPiA+IE1vdmUgdGhl
IGRhdGEgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnRlbC1mYW1pbHkuaCBpbnRvIGEgbmV3
IGZpbGUNCj4gPiA+ID4gaW5jbHVkZS9saW51eC94ODYvaW50ZWwtZmFtaWx5Lmggc28gdGhhdCBp
dCBjYW4gYmUgdXNlZCBieSBvdGhlcg0KPiA+ID4gPiBhcmNoaXRlY3R1cmVzLg0KPiA+ID4gPiAN
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29uYS53aW5pYXJza2FA
aW50ZWwuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50
ZWwuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBUbyBsaW1pdCB0cmVlLXdpZGUgY2hh
bmdlcyBhbmQgaGVscCBwZW9wbGUgdGhhdCB3ZXJlIGV4cGVjdGluZw0KPiA+ID4gPiBpbnRlbC1m
YW1pbHkgZGVmaW5lcyBpbiBhcmNoL3g4NiB0byBmaW5kIGl0IG1vcmUgZWFzaWx5IHdpdGhvdXQg
Z29pbmcNCj4gPiA+ID4gdGhyb3VnaCBnaXQgaGlzdG9yeSwgd2UncmUgbm90IHJlbW92aW5nIHRo
ZSBvcmlnaW5hbCBoZWFkZXINCj4gPiA+ID4gY29tcGxldGVseSwgd2UncmUga2VlcGluZyBpdCBh
cyBhICJzdHViIiB0aGF0IGluY2x1ZGVzIHRoZSBuZXcgb25lLg0KPiA+ID4gPiBJZiB0aGVyZSBp
cyBhIGNvbnNlbnN1cyB0aGF0IHRoZSB0cmVlLXdpZGUgb3B0aW9uIGlzIGJldHRlciwNCj4gPiA+
ID4gd2UgY2FuIGNob29zZSB0aGlzIGFwcHJvYWNoLg0KPiA+ID4gV2h5IGNhbid0IHRoZSBsaW51
eC8gbmFtZXNwYWNlIGhlYWRlciBpbmNsdWRlIHRoZSB4ODYgb25lIHNvIHRoYXQNCj4gPiA+IG5v
dGhpbmcgY2hhbmdlcyBmb3IgYXJjaC94ODYvPw0KPiA+IFNhbWUgcmVhc29uIHdoeSBQRUNJIGNh
bid0IGp1c3QgaW5jbHVkZSBhcmNoL3g4NiBkaXJlY3RseSAod2UncmUgYnVpbGRpbmcNCj4gPiBm
b3INCj4gPiBBUk0sIG5vdCB4ODYpLg0KPiBJZiB5b3UncmUgaW4gaW5jbHVkZS9saW51eC94ODYt
aGFja3MuaCwgd2hhdCBwcmV2ZW50cyB5b3UgZnJvbSBkb2luZw0KPiANCj4gI2luY2x1ZGUgIi4u
Ly4uL2FyY2gveDg2L2luY2x1ZGUvYXNtL2ludGVsLWZhbWlseS5oIg0KPiANCj4gPw0KPiANCj4g
SW4gdGhlIGVuZCwgdG8gdGhlIGNvbXBpbGVyLCBpdCdzIGp1c3QgYSBmaWxlIGluIGEgd2VpcmQg
bG9jYXRpb24gaW4gdGhlDQo+IHRyZWUuwqAgSSB0aGluayBJJ2QgcHJlZmVyIG9uZSB3ZWlyZCBp
bmNsdWRlIHRvIG1vdmluZyB0aGF0IGZpbGUgb3V0IG9mDQo+IGFyY2gveDg2Lg0KDQpVc2luZyBy
ZWxhdGl2ZSBpbmNsdWRlcyBpbiBpbmNsdWRlL2xpbnV4IGlzIHVuY29tbW9uIChJIGNhbiBzZWUg
anVzdCBvbmUgdXNhZ2UNCmluIGxpYmZkdC5oIHB1bGxpbmcgc3R1ZmYgZnJvbSBzY3JpcHRzKSwg
c28gSSB0aG91Z2h0IEkgY2FuJ3QgdXNlIGl0IGluIHRoaXMgd2F5DQooc2VlbXMgc2xpZ2h0bHkg
aGFja3kgdG8gcHVsbCBzdHVmZiBmcm9tIG91dHNpZGUgaW5jbHVkZSBwYXRoKS4NCg0KQnV0IGlm
IHRoYXQgd291bGQgYmUgb2ssIGl0IGxvb2tzIGxpa2UgYSBnb29kIGFsdGVybmF0aXZlIHRvIGF2
b2lkIGR1cGxpY2F0aW9uDQppbiB0aGlzIGNhc2UuDQoNClRoYW5rcw0KLUl3b25hDQo=
