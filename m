Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F694844B1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 16:33:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSxV572vLz2ynp
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 02:33:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5uLBo8B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V5uLBo8B; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSxTZ2C12z2xKR
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 02:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641310403; x=1672846403;
 h=message-id:date:to:references:from:subject:in-reply-to:
 mime-version; bh=ojieVhuIoPUpAO5+3BdpcgUFADUjoN2SzQ4ON2Vr1YI=;
 b=V5uLBo8BDlqbPZn5kNGOs/3jfB8uBFPI8WF0g9gWTP7FFqzniIGaBGZN
 6P+ykSux9nxSysVFW0hlG/gUArafp9niXU3PYLlafox8d4XnZxo2QOTxm
 K/EPsouIf7p2RBz8ZSttnthIVh9KQ2+BmsX6C5DWSBA86V//gISbZVLIy
 Ho+5bMX6LWoSFzIPy4yLe7TL0CgrrQjp4LX/KQVvtYQzRC69JN6Kz9a43
 wxHAh2sEF4mjiiC6wV4cFW7TzHNG7UOK+Dx9SQio4PgGzRIAky0EQuHcb
 CGawuK4TazeCGm++GZ5JRZLL+fG8b2tHnBoSDWg6KlXNcl1MnIZ8nfuiS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242449133"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242449133"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 07:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="512541412"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 04 Jan 2022 07:32:11 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 07:32:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 07:32:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 07:32:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY5ji3nShuMfQtzsHk8KnQXQjgIu2Sh2yI/fyt+ZzlJgTwMB0vYieVAMovxouvkQTTT8FK16gNA3NezW9W+eU+dlCRRrmn35TSUxK+8Lz2SSPkfijNUFGakt4Y3SLNnnSHLkNc74PTEMjWRw6mRyM69h/jUBOp2TOkYIVi67hhcmg6Cwva9TO7jCRRBMBcPVusgISYRfu1HM3NOLTB1AKAbH80/rOkPXIgb97fO1aNbsnA4so5He1O1wqcC4L6+MKHRFF1SbkJdsOcQTl9ZQk0WwBxUvOkiZvaoBgCqy1siJUOz44z5pB3KtfrR1SV32GHRpF49axOuIWZT9XIcTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojieVhuIoPUpAO5+3BdpcgUFADUjoN2SzQ4ON2Vr1YI=;
 b=OwwOGyM76I4cTUwx+ectRm/3E0hOJ5QoxpnWOVKR1cpOTbhF7xHfqS59btDEa0fU2F6mwTMGgAQH8nwz2MiBjId/buRoUhwTr2bJe6IAWlmKfJJwcBarOJ5qBBm0XWMnGmu7xkdYNEAZm7uVYGuOyxbw1hv9H4sWFMWG+mUW9hn60zXYc1V1US44CYf2bOQdASfwyp+HdiQ5noaD5XsOH5RWZ80Zv337novtu0Vbc5JTwewTiviOImezzfXFCkIwQ5Crx757Kycu3uNK9V6JL8pz1O9JvxwdjwYV03OQY5pywTdeORnFBK3MLKg9MG0u7Be0a6aEzq8TEIHxOb7b0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SN6PR11MB3104.namprd11.prod.outlook.com (2603:10b6:805:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 15:32:09 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::b90d:f84c:59f1:6927]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::b90d:f84c:59f1:6927%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 15:32:09 +0000
Message-ID: <af0e61cd-283d-1ba6-c426-5648c53c4915@intel.com>
Date: Tue, 4 Jan 2022 07:32:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
 <openbmc@lists.ozlabs.org>
References: <Yc25imp2cCDpyXNt@heinlein>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: meta-phosphor: enable `allow-root-login`?
In-Reply-To: <Yc25imp2cCDpyXNt@heinlein>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e0IS5n0BQmNfx1Fh8CaJUzyf"
X-ClientProxiedBy: MWHPR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:300:95::20) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2160562-07e5-4a45-fe9f-08d9cf975efc
X-MS-TrafficTypeDiagnostic: SN6PR11MB3104:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3104B61012577B7CCAFDBE6CE24A9@SN6PR11MB3104.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHoRUIC5WSwQK4g1qfIxHnJyIr9TVXAW0Uvqsmo24is71Ia2KrmXgGZenki2Jxq1DD8OKQC7+NEdnuBQiSZ70xM27fORsZo9OLBVs6mGFHFXd7wTBDMgDFWz0CdLQE4Ykr+uIe3Fh2NG5sLTcCJ/a7lYV2l9NiO3rg8QQwBQHO11q5jUN4Knk/8NsfEICC+ItV0pWtIcs0m5ndscxDKhgMG9ViF5KvgaWcF2RVeBNBuRaBJkZvhekP4hSxv+gLDofhb6cbQd2TNMCVVrZEZgC2eNNYtlEXs/pw8UaIZpHipJ5Yi0UYrXw10+y9L6kYL80D6j7U0psRizjPdMyKMnFBKQ40KNqkNBaHxRqOJKmWd0/fKE09XKcYv5F0bBbEtyJIqwgt1sMPx8JchZl0XnYtWSVyTqs6TZmFoLhIhmWfa6c8+iMJrKODU60fd4ACG5CauPDYf3J5u1emefQABntit9qB5ZxS2i+hhLgjWp8QLm1pjTH3Oo9bOmiCJZ3IRPAAoJgb8h+54YvxnOr00weMu8lPxinhJ2Bp6jzuFIVUM3pNpGnjOQs0M2o2Iflx8NE8ruUIAAZ+YTvtzoEJPm9YqvBZdI08AGJM7T0/CWT03ebhpr9tVGUv1824hZDsG3AEVaYkYG19Rol3B+SWRIBKXYf7LjsROM6LU1QNGOHZxaFusYKJtAzs09/edefTHy2oYBpSVP/RDnmCPksLKskQ70HA1qb92Kwh9XlxULLfFODgOC4FvS1DE7O1vt6nT8sBHtAv/rYWZwZk+siLtGuWepP7UL/1Us295FCNuhFG9vaTH1hXoyB8hfpp8k405adSpuAjLjpv43xbx4+YTGCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(8676002)(53546011)(33964004)(31686004)(508600001)(86362001)(316002)(966005)(36756003)(8936002)(110136005)(2906002)(5660300002)(6512007)(6486002)(235185007)(82960400001)(38100700002)(26005)(40140700001)(66556008)(6666004)(66476007)(31696002)(83380400001)(66946007)(21480400003)(2616005)(186003)(81973001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REErZkg1eStuMTdpMlBDcXU4VFl3S1M4akw5UWdRcU92VmJzc1lkNlBwaDNX?=
 =?utf-8?B?K2c4bEtrK0VhRitkaU12eFFKa25rUW5CMW1URjQzNG5FR25XL0lsVy8zcVZ6?=
 =?utf-8?B?L2xlR0liVHBWT1FvRnJvQ014YkNqQVNFclhQazZtZm5hU2oyYjVmdnFvdkdV?=
 =?utf-8?B?NkdkQkwzdDB4YmRtc2tpYkNqZWRIVzg3Qk5xMlEvY1dDR25QRElzb0VwSlh1?=
 =?utf-8?B?d2t5ZjByL0pEcEhPWjl4Y0RQckVFU1ZoWkhFbEMwT1c1VVZBZ3lpQWRnWExS?=
 =?utf-8?B?azlVYk5OajBPNDB3c2w5ZndZTW1tLytqR29PckxXTVMwMnJINUh5MExzR1Z2?=
 =?utf-8?B?TjZVYUpXcmdWajNMVTdnRGNhVTFxNjBuNVowaXRoSzFDUkFjbTFYbjlxT0I0?=
 =?utf-8?B?RXVjSjdBdkVRNWNoY0JZWkZobGhSVHhEUlFRT2lsK0t4VkIxVzdnaWFicTdj?=
 =?utf-8?B?TmhNRytBc29SdW1vZFBBbnVkVGVsc0hZK21RT0hqWmY1UWpxYmRRVWNCdWhj?=
 =?utf-8?B?V2tzN0djM2FJeXdoR0h1MmFMeHphYWJOeHpRVzBjdDl4VlpLTXNKS2xKVDZU?=
 =?utf-8?B?cm43ODlzVmxtczMvVzFQWG9OdEtpc29FUHBuTWFLQUlVWjBGV216YjNRak1B?=
 =?utf-8?B?anYwMkxacUgyaVhudFNhaTFTb0hPdUlvelR1RmpnZ2ZKcWh0SDdTZEs5UXRE?=
 =?utf-8?B?elBZczBqTmdSdERDRlNNbkpGNWxDSE8zUFZjUWdVcUVVT2xFVGhTbzg5YWxz?=
 =?utf-8?B?R0k4a2tKQjRhYTVKMXNpR1RXdUdQa2FqQnZOK0tiSDdTbkNJbXN1QzJzNEtr?=
 =?utf-8?B?TXRVS0tScHBySkNLTG1sK2dyVkYwL0s0Y0Nza0NTODB1Skk0RGh2MlZmSWpQ?=
 =?utf-8?B?ajlwQmJDQjZ0SnVjbFJwd3lMak1vWG5xL3NXSkNSV1dvTFU3a2M0Y21IOGtW?=
 =?utf-8?B?ZnhsNVpWRW4zSHlRaGtnYlhKNmsvNTUyMkxWMFFHT3VJTkNnYjAxR2ZKNWFW?=
 =?utf-8?B?SFNxZi81ZzVYMldJZWFpQTBvM3BPNW5DVmM2OGcvUlArUHYvM0ZtMHY3ZS9F?=
 =?utf-8?B?ZWJEbmxUR1E1ZVpjWTNjNHQ1cm9lRjRSYmJoU1gwSmhGbzRmeG1EZ0dwQi9T?=
 =?utf-8?B?MlRXY0t5OU52NnRuY3ZXVEhBU2lITExoWkZRdlpVZ2pFZkhPM0R1dWRnUDFp?=
 =?utf-8?B?TjJCOXlNMk8vK2ZSUWhidkNMa01vM0hzOHpkYXk4U1lXQ3l5czl5UExONWxN?=
 =?utf-8?B?NHV3Ris3L1h3N0o3REhKQThwYVNNMi9FUTQwRHNTYnFHYXYyK1dWNHgrM2t6?=
 =?utf-8?B?V1hVZS9aK3FFcUdvcjEzSFZWQ2lDS2crRHZHeW1aTHkxdlpidVRENUE3dXY1?=
 =?utf-8?B?eE1QbkFEM1ZJZWVxUlhxaTJQN01haDFwUWpvYkdQVWs4UVFDc0xYNlo1MVZy?=
 =?utf-8?B?SDZmZkYzRHBRbExjWWpSVGF5emljSzU1ZjZUdnNOQzdEZW85eEZaNEhGeWdh?=
 =?utf-8?B?L0hPL0hENU8rMkR6Mi9WNFpvcTZQZjFOTFMwcExtMnBaczU3ajg2QXZZcDE0?=
 =?utf-8?B?bE9EcFo2RDdBeHdZUERVeGhOekVBYUEzaTFlM0ZVYWZCejFSVFoyeVBOMWVo?=
 =?utf-8?B?ZE0xSXZTd3Nkb0F3MUJKR2MyczltcmNiYU1CUWlSMzJZV1Bra0FRK2lZbWpB?=
 =?utf-8?B?NFZuV0I3TVNEOXF6ZVVuWDIvOEFEek8vV0ZhUlA2Tk90V3h4RWxaN1c4THdM?=
 =?utf-8?B?Z2c1a1p3QkFxcUVwRzhvaHZQZ3h3MzJSNlY4b0JidWovRGhMVmp5UVNQbzlP?=
 =?utf-8?B?bXBMSDNicmltZnJLSlpCS1hlRHNObnZYa01NSmxDNzRJcUdlbjFMWXBCMnE0?=
 =?utf-8?B?QTkyZ3czTWU4UFZLNVJYNXJPN3lsL3dSWWk4MUQyeVVQNU5xZU5BYnFsWkI3?=
 =?utf-8?B?d1lKWGtjZHk1cjRpUkxJa1NZQTMzcHNFK3RqMGRvMWtFUVA2NTIzZS9lbEh1?=
 =?utf-8?B?U0x1TEVtY3BWcWxaWkErSkNmM2YwNnpVcHpuNlBDSXNUWXp2Zy9IYnhOUlAv?=
 =?utf-8?B?WnFXc3ZWMjFmVkhrZWpNeW1TR0NydkVleDVNaUcxdktNVzNCMUhMa3N2WDRT?=
 =?utf-8?B?NGswclR1aTlaaEVSMUxBSWJGUDYrdjUycVA3VzJhYVA4cUluNUEzbGFtLzh1?=
 =?utf-8?B?R3R2SjcwRjJxTUVCZngvaGViM3dHdVJMaElQVUhBSUdWbXJSQUxkTlowb0pU?=
 =?utf-8?B?RVQrT1RBWk55L2xTZVI3VlkvZlBBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2160562-07e5-4a45-fe9f-08d9cf975efc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 15:32:09.3253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTHW7Qei61cX8TGFW9R2JAKg+sA41hPO6YuOscfTXdE/n1BRyoWfasFl0yxwyuf9eGRwcbbSbJ3zVUyfX+zG+uaU1iT3lYjMPAxHZHquET8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3104
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------e0IS5n0BQmNfx1Fh8CaJUzyf
Content-Type: multipart/mixed; boundary="------------S9Vz2enTcynpctHmK2YEXkvj";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Message-ID: <af0e61cd-283d-1ba6-c426-5648c53c4915@intel.com>
Subject: Re: meta-phosphor: enable `allow-root-login`?
References: <Yc25imp2cCDpyXNt@heinlein>
In-Reply-To: <Yc25imp2cCDpyXNt@heinlein>

--------------S9Vz2enTcynpctHmK2YEXkvj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGF0cmljay4uLi4NCg0KT24gMTIvMzAvMjEgMDU6NTIsIFBhdHJpY2sgV2lsbGlhbXMgd3Jv
dGU6DQo8c25pcD4NCj4gDQo+IEkgYW0gY3VycmVudGx5IGVuYWJsaW5nIHRoaXMgSU1BR0Vf
RkVBVFVSRSBpbiBtZXRhLWZhY2Vib29rIHRvIGF2b2lkIGhhdmluZyB0aGlzDQo+IGhhcHBl
biBhZ2Fpbi4gIElzIHRoZXJlIGFueSByZWFzb24gd2h5IHdlIHdvdWxkbid0IHdhbnQgdG8g
ZW5hYmxlIGl0IGJ5IGRlZmF1bHQNCj4gaW4gbWV0YS1waG9zcGhvcj8gIFRoZXJlIGlzbid0
IHJlYWxseSBmdWxsIHN1cHBvcnQgZm9yIG5vbi1yb290IHVzZXJzIGluIHRoZQ0KPiBiYXNl
IHN5c3RlbXMgYW55aG93LCBzbyBpcyB0aGVyZSBhbnlvbmUgdGhhdCB3b3VsZG4ndCB3YW50
ICJhbGxvdy1yb290LWxvZ2luIg0KPiBlbmFibGVkIGJ5IGRlZmF1bHQ/DQoNCkludGVsIGV4
cGxpY2l0bHkgcmVxdWlyZXMgcm9vdCBsb2dpbiB0byBiZSBkaXNhYmxlZCBmb3IgcHJvZHVj
dGlvbiANCnJlbGVhc2VzLiBFc3BlY2lhbGx5IHNpbmNlIHRoZSBkZWZhdWx0IHBhc3N3b3Jk
IGlzIGEga25vd24gcXVhbnRpdHkuDQoNClRoZSBJbnRlbCBzZWN1cml0eSBhdWRpdCBncm91
cCBlbmZvcmNlZCBibG9ja2luZyBhIGRlZmF1bHQgdXNlciBmb3IgdGhlIA0KUzI2MDAgV0Yv
Qk5QL1NUUCBzZXJpZXMgb2Ygc2VydmVycy4gQWxsIHVzZXIgYWNjb3VudHMgYXJlIGNyZWF0
ZWQgdXNpbmcgDQpsb2NhbCBJUE1JIGNvbW1hbmRzLg0KDQpJbnRlbCB3aWxsIHByZWZlciB0
aGUgZXhpc3RpbmcgYmVoYXZpb3IgcmVtYWluLg0KDQo+IA0KPiBJJ20gZmluZSBsZWF2aW5n
IHRoaXMgaW4gbWV0YS1mYWNlYm9vaywgYnV0IEknbSB0cnlpbmcgdG8gcHJldmVudCBzb21l
b25lIGVsc2UNCj4gZnJvbSBoYXZpbmcgdGhlIHNhbWUgaXNzdWUgZm9yIHdoYXQgc2VlbXMg
bGlrZSBhIGRlZmF1bHQgY2FzZSBwcmVzZW50bHkuDQo+IA0KPiAxLiBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2Jsb2IvbWFzdGVyL21ldGEtcGhvc3Bob3IvY2xhc3Nl
cy9waG9zcGhvci1yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3MjTDEwDQo+IA0KDQotLSAN
CkpvaG5hdGhhbiBNYW50ZXkNClNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlcg0KKmF6YWQgdGUq
KmNobm9sb2d5IHBhcnRuZXJzKg0KQ29udHJpYnV0aW5nIHRvIFRlY2hub2xvZ3kgSW5ub3Zh
dGlvbiBzaW5jZSAxOTkyDQpQaG9uZTogKDUwMykgNzEyLTY3NjQNCkVtYWlsOiBqb2huYXRo
YW54Lm1hbnRleUBpbnRlbC5jb20gPG1haWx0bzpqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5j
b20+DQoNCg==

--------------S9Vz2enTcynpctHmK2YEXkvj--

--------------e0IS5n0BQmNfx1Fh8CaJUzyf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmHUaHYFAwAAAAAACgkQOcg9x5uaKcDw
wwgAhpChNALjaUHg+NGffJ6wfP5XlpVbp2ZWBLHtwSXY+uydCEoMAp4LB+F0DMvDe9EcD3q2LYD0
GrAg/yTyYRJfQ3Ht7U3DHGCf5XesFDdzZzkMWKtVOxXp7FtNtqXYweJP1omk9FGde8AggMRZ1PzG
XwL+w9U0WsrUga7B1tsnFe1HIo6CzgeHFYWen8jFjBAuOhHKFpb9Q2CmKOSH2+r4wODJUTcGzw6J
ZJoHfRGw00l9nhoIGTA90Z0vAjxc5VRhZowY2GVA2cBeMcse9unqx8Mcj/yQeGCZcKK+8m8AjDJE
DlMbmdTvTn56D5pPAzQzOXO9d6JQtT9manP1uepZdw==
=LlHz
-----END PGP SIGNATURE-----

--------------e0IS5n0BQmNfx1Fh8CaJUzyf--
