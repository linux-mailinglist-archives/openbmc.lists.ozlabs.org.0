Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276C455112
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 00:21:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvf7s33TGz2yw7
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 10:21:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=HQqlKzF7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=HQqlKzF7; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hvf7F0m5Dz2xXy;
 Thu, 18 Nov 2021 10:20:51 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="297495515"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="297495515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 15:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="736002548"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2021 15:19:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 15:19:47 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 15:19:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 15:19:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 17 Nov 2021 15:19:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmKz+WndLmD+4gsjGoegI0Eoi8a5lGM5sdMxMwyxt1mqLg9u2UlYw5GFvq3Xjuhz774zjMQA0n9aumxqw+KSomqFa+0KX1TV1GipjlvxXd/3Nc2YjDtCS8Oq8MCsAOp5nbV5JuCvIS5JWTP+OiUFri88XEwYbKFvPzVgfN70MPooxkuwZU8gRbOFx0VJ2uO+lY+JVWhX8h8mVEsugKifbB2eMUz3PzLy4SkF6UPap8ICcRvvHShSQus0Be4eglGWW6ySH6d91O5G5rsNncBkHQMZknNdXZ1Oy32benh0/XtAAU9iruJxk9z0TZM11ZGh95hyW32ajJTRIIQd9r639A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FQCcMdZCYFnJPW/CnflWLUWFnwFCz4+RF52xoVxZEI=;
 b=IhCtEhIBXddhE6+QJwUBB3J8rcCEYsBdQnSnM3HAEj0b/4IW0dWWvZ+1dqJOtoV2dnjv01T8gb1LPCeThbmxt1SaWekgMygD0yUC1RbQXehiqz+A7xFZHaNYZd52c48TJYo8ZQBHBXCpW1vcNMw6Y42KjZNKjyeop8na29EITIIF70+jGum7KZ0OA+44RnZ+c4wPO7UXrQuJiztu8C5rZ5KAcid2GW5feI6MsxHL5CwyKadYm5lPVJk45XJAIvmXC+/Q5OH88jZx90EHYIW6VPxm6WtIDsUjokM/aIbvHMEID+XbLVa4Q1NL+hZCxz1JBCu8u8wfAuz0xQGhMQz/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FQCcMdZCYFnJPW/CnflWLUWFnwFCz4+RF52xoVxZEI=;
 b=HQqlKzF7noqXcmWHsrtXLfLNhdlzziRESQ+eZGyp4LSY+EKtTE91DCBv1u8pk1sGi1xlW2srt98KUxPh7BJ1PYFPCNSh3Q8yBPDJ1bYyAhFi4Mavcrgg2AZ6XehbvPphRP2/eTGFSDPldXqGbv0ouXcmkFZdTFnH/iyBYpQBJFs=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 23:19:44 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 23:19:44 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 06/13] peci: Add device detection
Thread-Topic: [PATCH v3 06/13] peci: Add device detection
Thread-Index: AQHX2k6vfpbjE6OLJ069BVykJfvHA6wE7o6AgAA++wCAAIOfAIACrW6A
Date: Wed, 17 Nov 2021 23:19:44 +0000
Message-ID: <93b78525b47e31664da362773f7c46e9cf77e1fa.camel@intel.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
 <20211115182552.3830849-7-iwona.winiarska@intel.com>
 <YZKr1Rqfx6Cmw+Ok@kroah.com>
 <368c990c30c5bacde15ac4bce5db8389aea3ec9c.camel@intel.com>
 <YZNPFGPXfCLfJMq3@kroah.com>
In-Reply-To: <YZNPFGPXfCLfJMq3@kroah.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71befefb-5bcc-42ca-ac01-08d9aa20bd95
x-ms-traffictypediagnostic: MW3PR11MB4603:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <MW3PR11MB4603C8444F1A021584BABC90EC9A9@MW3PR11MB4603.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZCPsdd/7mCIFRIFm8dIzD3SaEJhXPCmec/UqHUO83rBggplEkcM4YymowDxmGI19xv9VF3M0oTTrBn4bPoRM0SBurfKcOLhyAHHaZEU3sxVfSplHRDbvvF5NRF77/7VcbvEa4UP9OEKaAL9gONDY2pdguWUoNxmISAEfzm7MMiYupkltVorrgEeFcU0Y6zxXDptdnJNPoCArboNJCh615iqJbfQv7yCQUOjLrZOsw5diWKzBZqzOVpvxxra/1+0j/2E4vqVePXxIj0PBYYvy2LfP4f1JbyMKNuAhIiQKPXmdsHWFur4oDoGzD+0jkYbYToWbZbkfWBIci2E44HX7GzG5Y4ZWEXK78+H2nk4qrii8T4qPFcYGYNE937gEIJF4tO59wR1TUvAXvVE2rutQ5CDGtYuGTD995Z02XknUlb0hJ1Wh7iGivSrmZipFu/IRkdMkNJnmpg4atsTw/IygEgkAORC0DDJ486F6AY3PCrTEIj9ptvVTn54Xs52UNecd0ITN7wU25N3910jw5IS0OiRrLqSOBTT0ilf9BeshuHoYz7qsku/SawBVOXX6LufScmkTBbk7qR6c6DP7heP1SGSsfxq3ZTCPnjzbuqMVjf2HdFzig7OB+nqic6WhXIXHLGJycRoF0xGs+gGiCVcCgEODEZF+88uHR6zZ5e7UdmIu8ea27LFAj9SqVYl+EXtAPSdS0v1nBs1y8uWeUuZIaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(122000001)(54906003)(4326008)(91956017)(6506007)(26005)(38070700005)(64756008)(316002)(38100700002)(66446008)(4001150100001)(71200400001)(2906002)(7416002)(66476007)(508600001)(186003)(66556008)(66946007)(8676002)(36756003)(5660300002)(83380400001)(6512007)(86362001)(82960400001)(8936002)(76116006)(6916009)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0hTN29LQ2tscUU1cG9pQzIxK0dVZS9SUTZXaEl0dDJ1NzBldzRNdXViTEt5?=
 =?utf-8?B?RTlka0x1VnprMUhOOHFZWDArMGw0ZUVFMC9PWjZXa0FvSHY4dUUzSkw4QjM0?=
 =?utf-8?B?dHVhTG1LWlptSXdtMFBBMGVDYjh2UzFTcFJmRzcvbDdwYmNQcGVIa25WRTU3?=
 =?utf-8?B?TURHTlo5eFBsY0kwOENIL2NFendjUjNPK1g0V2tqSVdBYXVxS1M2cjV1QzlN?=
 =?utf-8?B?dTJ1SXVjN2ViRXUrQ3dzQmUyNFN0UmFOUkdSU04xRW51NWc5bjRkY2prTEpw?=
 =?utf-8?B?OVo3Z1dQRXU0OExyL0tta05HclZkRVYvNWtqR3k4OWhEMGpjemEwS0hWV2xC?=
 =?utf-8?B?Mms2akFpL1JkMUxEbUF5KzF4Tld0eGV4KzY2WDBzbWErdXpqWmJOdWRCUlVK?=
 =?utf-8?B?bGhod3g3TXRraVBRb01lRTdUSG84SnJtZFcwRFRNTlFKKzN0WWlIRTVRWUQ1?=
 =?utf-8?B?czhhRkdtMXhyRjhEVFlITHBQQnY4UUtLL0kwc2hrRnB4VXd4TU5EWXpJbnRP?=
 =?utf-8?B?bzExeXVFcVp0Q2dvR1I4bWtqWGdOUXVYSVpUK2tlQTVMOWlKd29uMnlQanVC?=
 =?utf-8?B?cVRhcjQwNE11ak8zaFExQ0dVTlk1QmFzam44Q3dkTFI2Vmcza0ZsSHRFK294?=
 =?utf-8?B?NERGQ1lvOVZpWk0vcUJ4bSswYkFUR28rUDJwbFkrSndyT1oxR1ZBMHBONllW?=
 =?utf-8?B?cTB3RXpPS3hlZHpJQnh6SzdjbURNa3BrTTJWbWNaMzJDNzRVK2hkRXdDaUZ3?=
 =?utf-8?B?RUpsMitZQ0FIYy9EOGFCLzRCeXZjV2IvbVFnMnhpZjE2NWNKaGdsa3VvSGNz?=
 =?utf-8?B?N3NuZkk0akZmaXF6OUl5dlpheDF1VHJkZWJwckYrWmFDMGVRVlFrdHBPLzBy?=
 =?utf-8?B?WGVHbEtsc3N3YWV2eGJuREwxWE9vc3hRdlVsUEh1R0JSUW1WeG95K0ZERytG?=
 =?utf-8?B?RjZZM3B3YlNLT2RLaGViREMyVXdYRGM2Szl0YVg2c000bTFUM2lsQTFBWm1I?=
 =?utf-8?B?QnNMWVNGemxLak5PRTlUKy9Mc0RvNlo1bzlDNXpLdUFQZXB6T1YyRWdMbWU5?=
 =?utf-8?B?S1kwSmZNR1hRcVRwM0VWd2JHN0JzYUg3aEE0UDN3ei90b2ZFM0FvZmYxOUpS?=
 =?utf-8?B?ajBET0VQV2lzSlBPVFF3aUdKTVAybkxHWnQ4SGFKMzlxbEwzMjl4T2N5cjlu?=
 =?utf-8?B?MjVleHZIL2ZvclJZVS9LSy8yd3JkSkwyZG9IaHNwTjFhYmtkcmgxWi9EUXVD?=
 =?utf-8?B?eFlFb2ZXRW11eXFJVWhNMzVKUk9YcWZHa3hva2dSVjdxTE80MzNReUVPT2Jw?=
 =?utf-8?B?TGF5M21FaDlvV2pPRVlvczZoUjErZGczSUpIdFFCRnh1anc5UlpFbkhqMnly?=
 =?utf-8?B?MlFGZDNRN1lWNC9WZ253ZGVwb1FHWjZsZENwODNvY2svK3V4WU5tRDBqcUx2?=
 =?utf-8?B?d2JDSXI2NVlqaVpnTkQ0MVJXMWlMUFlRbU1yeWY5UUxia2I1SlVBRDFSSVpp?=
 =?utf-8?B?QlZzNkJSRnVSNHRNK1c0RUsyeloxb3o5MUQ0eStFbG81MXFiMnFTRnFTZXdT?=
 =?utf-8?B?VEJlZ0hnRVFkUnVKaEN3aGNqdUp4aC9yOXRDd0RYVjZFZStjbStvOEZiWHJS?=
 =?utf-8?B?VVZ3emNoN1FvcEhHUTdIZ0RTTUhwQ1poYjJDQ3lSR0lPN0xCNk9CNEtPNW1n?=
 =?utf-8?B?dmV5OHlONFRnNkx5ckhOY1FFaUhFcnJNMU1hbEhRbXBqOUp2NVNDeVExZU9Z?=
 =?utf-8?B?U0xLTVJncW55SUpzb2RhendFeXZuSzk1YWhwaC9NYjgyREt5b1JaZktIT1Fp?=
 =?utf-8?B?NDFFVjJBRzB3L1NuaHNzRzVDeDVNTnlpaDRtaTBCTlh4VGl4UlhxYkIxZ3E5?=
 =?utf-8?B?TmF5aW05U0NsT29KTWZMNGltN0xZSkpxYlhaY3A0VWwzQVBNVVhadFRoZC90?=
 =?utf-8?B?eFdLMHhVNk1JMkdFZFVZMktnTkgrQmhsdGgraHh1cjBVRWZQa1lxaW5xb0V3?=
 =?utf-8?B?d25nYnpyZlIva0xKY0c5MGhaeHZOVW9SQU1mbVRSZWZuWFdmWTRyTHBxUlVC?=
 =?utf-8?B?SjlUZzcydUNYUDd0TlpnYXllVHlVVU1qcTZOVE5PWkU0LzZJeGp2bnRxTjh2?=
 =?utf-8?B?UmZ0YkNncDVJR1IrM2RZdzcvR09HcTRia0NiVFZHYitnS2kybmhZV3lkc2Y5?=
 =?utf-8?B?VmlUUGJHSnJKZHBEdThGVUhrVUNjZ3V6clBvL1pZR1ZWSzdRVlZ5SW1VR2ZB?=
 =?utf-8?Q?RRXQgJnb1NSZb67SVrl2IyIw5gWDeMFRUh3CYidbaQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF3EEEF749F5FF4FBC40E4E61A11A404@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71befefb-5bcc-42ca-ac01-08d9aa20bd95
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 23:19:44.5506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74qYHw7BBk43Bl4CZZkwCZsMhgLFHPyInw2zCfKa/JK0mQT21PjfkchRL4OF3H/aNDi0slepkZ8+8PN27Cq4Em7+Q1clJ/4IRrq1xzjEdWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen, 
 Dave" <dave.hansen@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIxLTExLTE2IGF0IDA3OjI2ICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gTW9uLCBOb3YgMTUsIDIwMjEgYXQgMTA6MzU6MjNQTSArMDAwMCwg
V2luaWFyc2thLCBJd29uYSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjEtMTEtMTUgYXQgMTk6NDkg
KzAxMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDE1LCAy
MDIxIGF0IDA3OjI1OjQ1UE0gKzAxMDAsIEl3b25hIFdpbmlhcnNrYSB3cm90ZToNCj4gPiA+ID4g
K3ZvaWQgcGVjaV9kZXZpY2VfZGVzdHJveShzdHJ1Y3QgcGVjaV9kZXZpY2UgKmRldmljZSkNCj4g
PiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgYm9vbCBraWxsZWQ7DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGV2aWNlX2xvY2soJmRldmljZS0+ZGV2KTsNCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKga2lsbGVkID0ga2lsbF9kZXZpY2UoJmRldmljZS0+ZGV2KTsNCj4g
PiA+IA0KPiA+ID4gRWVlaywgd2h5IGNhbGwgdGhpcz8NCj4gPiA+IA0KPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqBkZXZpY2VfdW5sb2NrKCZkZXZpY2UtPmRldik7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKCFraWxsZWQpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm47DQo+ID4gPiANCj4gPiA+IFdoYXQgaGFwcGVuZWQgaWYgc29tZXRo
aW5nIGNoYW5nZWQgYWZ0ZXIgeW91IHVubG9ja2VkIGl0Pw0KPiA+IA0KPiA+IFdlIGVpdGhlciBr
aWxsZWQgaXQsIG9yIHRoZSBvdGhlciBjYWxsZXIga2lsbGVkIGl0Lg0KPiA+IA0KPiA+ID4gDQo+
ID4gPiBXaHkgaXMga2lsbF9kZXZpY2UoKSByZXF1aXJlZCBhdCBhbGw/wqAgVGhhdCdzIGEgdmVy
eSByYXJlIGZ1bmN0aW9uIHRvDQo+ID4gPiBjYWxsLCBhbmQgb25lIHRoYXQgb25seSBvbmUgImJ1
cyIgY2FsbHMgdG9kYXkgYmVjYXVzZSBpdCBpcyB2ZXJ5DQo+ID4gPiBzcGVjaWFsIChpLmUuIGNy
YXp5IGFuZCBicm9rZW4uLi4pDQo+ID4gDQo+ID4gSXQncyB1c2VkIHRvIGF2b2lkIGRvdWJsZS1k
ZWxldGUgaW4gY2FzZSBvZiByYWNlcyBiZXR3ZWVuIHBlY2lfY29udHJvbGxlcg0KPiA+IHVucmVn
aXN0ZXIgYW5kICJtYW51YWxseSIgcmVtb3ZpbmcgdGhlIGRldmljZSB1c2luZyBzeXNmcyAocG9p
bnRlZCBvdXQgYnkgRGFuDQo+ID4gaW4NCj4gPiB2MikuIFdlJ3JlIGNhbGxpbmcgcGVjaV9kZXZp
Y2VfZGVzdHJveSgpIGluIGJvdGggY2FsbHNpdGVzLg0KPiA+IE90aGVyIHdheSB0byBzb2x2ZSBp
dCB3b3VsZCBiZSB0byBqdXN0IGhhdmUgYSBwZWNpLXNwZWNpZmljIGxvY2ssIGJ1dA0KPiA+IGtp
bGxfZGV2aWNlIHNlZW1lZCB0byBiZSB3ZWxsIHN1aXRlZCBmb3IgdGhlIHByb2JsZW0gYXQgaGFu
ZC4NCj4gPiBEbyB5b3Ugc3VnZ2VzdCB0byByZW1vdmUgaXQgYW5kIGp1c3QgZ28gd2l0aCB0aGUg
bG9jaz8NCj4gDQo+IFllcyBwbGVhc2UsIHJlbW92ZSBpdCBhbmQgdXNlIHRoZSBsb2NrLg0KDQpB
Y2suDQoNCj4gDQo+IEFsc28sIHdoeSBhcmUgeW91IHJlcXVpcmVkIHRvIGhhdmUgYSBzeXNmcyBm
aWxlIHRoYXQgY2FuIHJlbW92ZSB0aGUNCj4gZGV2aWNlP8KgIFdobyB3YW50cyB0aGF0Pw0KDQpG
cm9tIHRoZSBmb2xsb3dpbmcgcGF0Y2g6DQoNCiJQRUNJIGRldmljZXMgbWF5IG5vdCBiZSBkaXNj
b3ZlcmFibGUgYXQgdGhlIHRpbWUgd2hlbiBQRUNJIGNvbnRyb2xsZXIgaXMNCmJlaW5nIGFkZGVk
IChlLmcuIEJNQyBjYW4gYm9vdCB1cCB3aGVuIHRoZSBIb3N0IHN5c3RlbSBpcyBzdGlsbCBpbiBT
NSkuDQpTaW5jZSB3ZSBjdXJyZW50bHkgZG9uJ3QgaGF2ZSB0aGUgY2FwYWJpbGl0aWVzIHRvIGZp
Z3VyZSBvdXQgdGhlIEhvc3QNCnN5c3RlbSBzdGF0ZSBpbnNpZGUgdGhlIFBFQ0kgc3Vic3lzdGVt
IGl0c2VsZiwgd2UgaGF2ZSB0byByZWx5IG9uDQp1c2Vyc3BhY2UgdG8gZG8gaXQgZm9yIHVzLiIN
Cg0KVGhhdCdzIGFib3V0IHJlc2NhbiwgYnV0IHVzZXJzcGFjZSBtaWdodCBhbHNvIHdhbnQgdG8g
cmVtb3ZlIHRoZSBkZXZpY2VzIGUuZy4NCndoZW4gSG9zdCBnb2VzIGludG8gUzUuDQpJdCdzIGFs
c28gdXNlZnVsIGZvciBkZXZlbG9wbWVudCBhbmQgZGVidWcgcHVycG9zZXMgKGFuZCBhbHNvIGFs
bG93cyB1cyB0byBoYXZlDQphIG5pY2UgYml0IG9mIHN5bW1ldHJ5IHdpdGggcmVzY2FuKS4NCg0K
VGhhbmtzDQotSXdvbmENCg0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCg0K
