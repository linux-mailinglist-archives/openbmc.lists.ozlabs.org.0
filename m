Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F28704A7882
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 20:07:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JprsK5Pkkz3c5j
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 06:07:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eC2OMhoB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eC2OMhoB; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jprrp4js9z3bSk
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 06:06:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643828827; x=1675364827;
 h=message-id:date:to:from:subject:mime-version;
 bh=lTmbHUCtnRpewJ0P4uL8niOe46gqEOXiWsrY7cvzaWI=;
 b=eC2OMhoBcVtsxIDRe7lrVjf+0KdaC0+qHJaGNJicPBdeoJjIiB1jisHc
 7GGypU5COdK6Yky1GkoCKI65pt/mxzLEKIyBr7p7XQWTChfDqWpZEs2GO
 iPnN3aACtnNyX8KdfT1PfDvDgM+pifCW9ti4U4yAW130g46gYCaaXHKXr
 dIMalAixGTrM6PwUSvsMmp9DwO7KQRu0D8gogY9L1R952kBXSom34M4Lo
 El134Uv2oeOis7EQL39t2PvumNeCkdWR2qUCK9FYoIb9d+dFgbJXxoLnW
 XfVas1WwtjOp8qsKcHsYOtPG/BJ4gpbaYdINBnykDQin0DEuP4xmxpRic A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247952912"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="247952912"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 11:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="599665174"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2022 11:05:55 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 2 Feb 2022 11:05:54 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 2 Feb 2022 11:05:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 2 Feb 2022 11:05:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Feb 2022 11:05:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juGTHOYKeUFhiu8cRqcKWsL/w07RzGDalEyQSs4hYtWZveMGSaBNfGpbbK9OeESWTxOJFiOKw635IOzSgle1l13drU4abHUwg2HtJyoqDf2JVbd7Rj+a1PGfCzB1Qt7pj89wNFeOMabHpJXFF+SW8U0sdfF9PAwpO+8wnGHl4QDUL3FX5TG22eOl4L6p14OYaWYZdioXSj/2yYdnzHEtLvBZN3ZB7caokKIM3sN5MK5X0dyAjcxl3QTvHm8Qo5T9M+2O1MN4f1VwbZOw5UPp2uMDpN/LWCeZUPILz2hlCNniUcmMQaEHSbGp+6NBydnhIWAq4l1wKsKLXCyOIU5+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTmbHUCtnRpewJ0P4uL8niOe46gqEOXiWsrY7cvzaWI=;
 b=AaQMkloqwp/j28hi6jMvZPZGBAhf45vieSXzlo7A3sO0dasXcAWBmbRHlW4wyRwqpfC5skTPtiehfHrcKH9kpFwljxbORYlZiVfw8g2yODHNlGbIKeEA/wGX7GArWK8znFHyq3esmpPyt2GYa5l8s2FcIdwEEz5Z0PWq2uNXTUdGgsBeb2P4pf6d/wTE/uYskt/467btfUuCeBi29fI2UmXijAqIfC+uqsLG8roHa2y0Apct0DD1VGNj1ejGltNNMrU47xt77tpkxmi+05g7fn5Gwo4wFtXMvbgfqP/EaGS5AdfOLU5FKCwX4mrgUt0+5rFH73QHerOkNMFC6M5sdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by BN6PR11MB1844.namprd11.prod.outlook.com (2603:10b6:404:103::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Wed, 2 Feb
 2022 19:05:52 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::b90d:f84c:59f1:6927]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::b90d:f84c:59f1:6927%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 19:05:52 +0000
Message-ID: <52bab6e6-0288-2cd6-ae32-b3ba9b89d0c7@intel.com>
Date: Wed, 2 Feb 2022 11:05:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: OpenBMC DHCP Management
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vx5dsnlyDcL3zPQM9Ygxb5fM"
X-ClientProxiedBy: MW2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:907::18)
 To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6701e0a-d98c-4616-3d7c-08d9e67f07fc
X-MS-TrafficTypeDiagnostic: BN6PR11MB1844:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB18443ADF53E41E7292887872E2279@BN6PR11MB1844.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/w63doi1IYmcMSO3qP+mSv+upo+54JbBzHQkjaJX9yeHcalC+sq2gE+KPo1rPQAbk4/hhlRL7RJojy2LUXyGHk9u3XsI+JCnZwZM3/D2H6ceId67a0J4tUgH5nMK4AE7mP/BOe1fTbilRftACvbEP0eHLgSpop2y12wEaTCy6CDWeXXpv7RqpXH5CFidf6hyp9Xppy5fEyuBOlzx/djWJhxNf+vPfKxqGLs5L6/Y0/QbX6uoD0tbMDvWuq75/I/zdzzGgVycYZ3rhBwvmwbCDjYSKDKVcrbsMLu/czI4MECqXtbyEWHwIBLan3WjXDM6rY7w28OrxeMbGlYJv0SHbNGPlWxs7EXTVnB7fMzAP77X6Jvu4niME1LixHAWsQZd7S2amVMAap/mXZSd/zoQGlOA/VvePKjZsem0ZsiB0P5txUIHWq5anfzokUnNjZflCJ9hqwYfu7DUIfb9HXcGi9DThHPnOnYZHmD3bT5SURQcmkhXAXhEZmRwX2QFtk/B/JVOXKVqV6Ch7qgbT6Gi6dP0HXqjuxisbgPsW5wJGxz6aWKFHSqwvgW/zynW1w3x0Hmsk4YOiic7BPeDKpx4GnJ9Kx3ukAZC5hA28H+0wlJ1LzbIYys0ubgM06aZPnAqU+duff7vOuehf4eEiiQnrWM5kGgFcZUsdku8yXXc/Ukj/GUJkbPwBpkBpEUZ89XEhe+8nRWOH0jdVz7sRM1iVgjTlRaVtFlz+k2ChDlcke/A1dahy0J2x3HL9UQC7ENX/W7PFvUfs5/nCWpYvrFibvEkGX2gqLEqJUXpOaGtr+1wz9eDtZtC1yempTW1ZKp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(186003)(66476007)(2906002)(66556008)(6666004)(7116003)(19627235002)(26005)(8676002)(66946007)(8936002)(36756003)(316002)(2616005)(31686004)(83380400001)(82960400001)(235185007)(31696002)(86362001)(3480700007)(6916009)(5660300002)(38100700002)(33964004)(6506007)(40140700001)(966005)(6486002)(508600001)(21480400003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0FHaXNaSzI2NWZxNU9aVytucWx5Mngrb0ozSUh5aERBdVhHMTIyY2VTaW1H?=
 =?utf-8?B?UVFnR3JJYmxHM3ovVy9qcUs4aGtaSjhScEQ0aGw0Ty9ZZ1RwQWdRZWF2eU5G?=
 =?utf-8?B?czgxMmdWcmNGenBUZVNWdUlvcWZ0SnppLy9XK3d0Tm9UWFdvZ2JZczAxTDJh?=
 =?utf-8?B?UkRiWDUzZnJjY2UxWmkrOHNZenRCOTRESlUrTFJMdmcyRTZqUGp5Tkt5cks3?=
 =?utf-8?B?ZkViYXNpYzhMSSt0YUJodEdyK25sbFhES1IvaWVDdmNHWlcvUnFzTmwrLzNh?=
 =?utf-8?B?RzNwL0JzMmg3cWx4SGJBWkJ6SkszeTdqcHlSUGxOUFhqUU0wM29EOXdUSW9K?=
 =?utf-8?B?U3VTNlhRRFIvWGxWcmJhTkxyM3RhbThad29kUDVtaWRtdzJvUVNUMnFRQjgx?=
 =?utf-8?B?bFBhem9iMC9JdlRqcm1qamFjelM3Ym9IeGdncWVUbVZKUitRemMwL2U1TnRC?=
 =?utf-8?B?eE9nVEdvUHhabERtR1JmMGdRYzNlYTdlMy9Gei9Pbm4wZ0FPYWNIN2RHcDdx?=
 =?utf-8?B?K2Q0a1d3Um5SRlBRbHlJNG9iRm9ROWNiYnptYzlKdGFud094V1MzQnJSYlhT?=
 =?utf-8?B?TkVKNE9IMkIwQlk4UEY3QmdaT2lkSUVWUUFIbzk3QlRUc1FOOUU2VzZOVFpN?=
 =?utf-8?B?bzE2bllUV3Q1b3hCMUEwamlncU1KN0x5WnNDZkk5VVdsK1ZYZVVaWmx5YkJ3?=
 =?utf-8?B?Y3BvOHBHSE9zR3RESzVHMlVCaXFDck4xbG1QeUl6OVE1Ry91UVFYQWR6b1ZK?=
 =?utf-8?B?a1RZcnZvM2tYalVQZmpwV045QlN4SFMweVBHNVkrbWFXMUpDcEd4ZWFsNGNl?=
 =?utf-8?B?V1M1RFIzRmF4VHpWU2tTSFRiRTcwcUh4ZzVaaE83ak1uOVJlMXI0dHRsNXM1?=
 =?utf-8?B?YzBWSDhZeXhhaU5TRUhnUjJacmp5ZlI5anJBR1BVWjJ1bWdoNHR3NWN1TjRM?=
 =?utf-8?B?U0I3L2RBeE5NWjBnTmxtQ3dLQW1WaTRDeUtPYjc1enRrN1dhQ1U4V2ZOVmNJ?=
 =?utf-8?B?eGlkcFNUMTd0U05wM3lvQlVPWjZWamZJUXc3cTV0S0ZTZkZjVmFMeHRZbTYw?=
 =?utf-8?B?OFVzaDIxdU8vMWxMbk9jVFNsUS80d01MWksxZFZXVi9vVUlVT2tkaTlnTUhh?=
 =?utf-8?B?SUhOdDdhZjVrbU5aczBodE02VTVSamoydnNZTXZqV2pCWlJraCtCRlU0NmpH?=
 =?utf-8?B?cEU5aGhBUnNjamZ6eVp6TWpXL2NLMm1kclRBNk5XMUtObGFmZkV3Mks3QzZw?=
 =?utf-8?B?L29hNXZ4Z1BLd2hwT0ZNS1d0WVArendmT0lZK2U3QXpoZjU4Q1pMS0ZUSFc4?=
 =?utf-8?B?RUpSeW1XNE9YS2ZQNlJ3Zi9BWHNxYXE5Y1I1cHZMYWJnMzEvbWswejU3VEhX?=
 =?utf-8?B?VndDWktXcGo5ZmZyUVM4bzF1d0JEYUJBb3lEV1RFRjlrS1UyMGFhRFZ1M09B?=
 =?utf-8?B?RmhWM3ZmV0tsM2RxbCtOaUpRNCtuQWdiM1l4NHFYUGpvNW1iK1ZGaFlwem9u?=
 =?utf-8?B?MndXc3JickE3bVVvMUFnRXd1OG1FSUd1ODhQTkJEQWxOT3JpaEhkVGpIUDlV?=
 =?utf-8?B?QnFONmR1c0QwdTlwQUE3b2pDdWQzZjIvNnBmSW5Hb0xEUERIWFRkaGpGYzZr?=
 =?utf-8?B?MkJyMHRpYUxvc3pKVllJazhkSDRZdjV4cllPWkc0Y2ltSDIwbkJ0Z016Z2Zk?=
 =?utf-8?B?WHpERFgvbDhHMDdORVJSMnhBcDl2S1VpdC9vdWtkbi82ZzhUbWM3ZnVVNnla?=
 =?utf-8?B?UHplOUN5bzJtZlZ5em5KWFJOcHFKZDNVUXdNS1J5VUlmMXpCSzdmeVdHU3hF?=
 =?utf-8?B?elVWdHJUc0l4VDZEL3p5VVUyNkhsaUoySGVlSnBEQ0pwU2pFQ010cFMrMU1n?=
 =?utf-8?B?WFVtRmJBVXUxeXplZmNDeG5NUlpyR3FKZFpWNDlrYTAva0dhYnMvaEtCQ1d0?=
 =?utf-8?B?R3lRWlVmYm1CdkVOa0Y3NDJHTTJDMkx1SnZIcVJoZVVtQ2oreXU2aUtYaHM4?=
 =?utf-8?B?QjdXQ3dqT3g3UXJOMUFSSTdUd0tkczUxVlY2a01hdWU1VTVMNUNGT3E5S0dk?=
 =?utf-8?B?dVlQbGtic0Zyd09jemdEcFh3anF3cERpRnNlQTYrQnBzR2o5NENXVk1DR3JI?=
 =?utf-8?B?Mk45U1oxc0FLcFZoU2VIWUxDbDk0WHprNGNoZ2JWRWFsSE50NXFaTGd2S2Uw?=
 =?utf-8?B?YkNrSUNQSzBBbmF4Z2NCVWk0VmlDWGxPSkNFTlVUTFN6QVgwTktBUU1KdXFo?=
 =?utf-8?B?RHUvYllSWk41QmtwdHBDWnpCRWR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6701e0a-d98c-4616-3d7c-08d9e67f07fc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 19:05:52.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31GlB8LAXK3uWghc2lYf7K5W6Kl/6t5r8P/s9Et8zSP0gT+4oa5f4il+LtPN4mSm1zwZ1YeWrvGz57AlgUzG35p4MG0TgaiGhEpK/QyHXPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1844
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

--------------vx5dsnlyDcL3zPQM9Ygxb5fM
Content-Type: multipart/mixed; boundary="------------jlqeoiTrOvPKDJJhermYwls0";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <52bab6e6-0288-2cd6-ae32-b3ba9b89d0c7@intel.com>
Subject: OpenBMC DHCP Management

--------------jlqeoiTrOvPKDJJhermYwls0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T3BlbkJNQyBESENQdjQgYW5kIERIQ1B2NiBtYW5hZ2VtZW50DQoNCkkgd2lzaCB0byBzb2xp
Y2l0IGlucHV0IGNvbmNlcm5pbmcgREhDUHY2IGhhbmRsaW5nIGluIE9wZW5CTUMuDQoNCkJh
Y2tncm91bmQ6DQoNClNvbWUgdGltZSBhZ28gSSBzdWJtaXR0ZWQgYW5kIG1lcmdlZCBjaGFu
Z2VzIHRoYXQgYWxsb3dlZCBJUE1JIGFuZA0KUmVkZmlzaCB0byBlbmFibGUgSVB2NiBSb3V0
aW5nIEFkdmVydGlzZW1lbnQuIFRoaXMgcGVybWl0dGVkIFN0YXRlZnVsDQpJUHY2IGFkZHJl
c3MgYXNzaWdubWVudCB0byBvY2N1ci4NCg0KRmFzdCBmb3J3YXJkIHRvIHRvZGF5IGFuZCB0
aGUgSW50ZWwgUUEgZ3JvdXAgaXMgaWRlbnRpZnlpbmcNCm1pc2JlaGF2aW9yIGluIGhvdyBE
SENQdjYgaXMgY29udHJvbGxlZCwgYW5kIHN0YXRlIHJlcG9ydGVkLiBNb3N0IG9mDQp0aGUg
aXNzdWVzIGFwcGVhciBpbiB0aGUgSVBNSSBzdGFjay4gSSBhbSBhbHNvIGNlcnRhaW4gdGhl
IFJlZGZpc2gNCnN1cHBvcnQgaXMgbGFja2luZy4gVGhlIHBob3NocG9yLW5ldHdvcmsgbGF5
ZXIgZG9lcyBub3QgcHJvcGVybHkNCmNvbnRyb2wgdGhlIHN5c3RlbWQtbmV0d29yayBESENQ
djYgY29uZmlndXJhdGlvbiBpbiBhIHdheSB0aGF0IGFsbG93cw0KU3RhdGVsZXNzIERIQ1B2
Ni4NCg0KSXNzdWVzOg0KDQpPcGVuQk1DIHVzZXMgdGhlIHN5c3RlbWQtbmV0d29ya2QgbmV0
d29ya2luZyBzdGFjay4gVGhlDQpwaG9zcGhvci1uZXR3b3JrIGNvZGUgdXNlcyBELUJ1cyB0
byBnZXQgY29uZmlndXJhdGlvbiBjaGFuZ2VzIGZyb20NCnVzZXIgc3BhY2UuIEl0IHVwZGF0
ZXMgdGhlIHN5c3RlbWQubmV0d29yayBjb25maWd1cmF0aW9uIGZpbGUgdG8NCmNoYW5nZSB0
aGUgc3RhdGUgb2YgdGhlIG5ldHdvcmsgaW50ZXJmYWNlLiBXaXRoaW4gdGhlIHN5c3RlbWQu
bmV0d29yaw0KY29uZmlndWFyYXRpb24gZmlsZSBpcyBhbiBlbnRyeSBuYW1lZCAiREhDUCIu
IFRoaXMgZW50cnksIGF0IGZpcnN0DQpnbGFuY2UsIGFwcGVhcnMgdG8gY29udHJvbCBJUHY0
IGFuZCBJUHY2IERIQ1AuIEl0IGlzIGFsc28gdGhlIHByaW1hcnkNCmNvbmZpZ3VyYXRpb24g
ZW50cnkgZm9yIHJlcG9ydGluZyBESENQIHN0YXRlIGJhY2sgdG8gSVBNSS9SZWRmaXNoDQph
Ym91dCB0aGUgY3VycmVudCBESENQIGNvbmZpZ3VyYXRpb24gaW4gdXNlIGJ5IHN5c3RlbWQt
bmV0d29ya2QuDQoNClRoZSBwcm9ibGVtIGlzIHRoZSAiREhDUD0iIGVudHJ5IGRvZXMgbm90
IGFjY3VyYXRlbHkgcmVmbGVjdCBESENQdjYNCnN0YXRlLiBFdmVuIHdpdGggIkRIQ1A9djYi
IGFzc2lnbmVkIGl0IGlzIHBvc3NpYmxlIERIQ1B2NiBpcyBub3QNCmFjdGl2ZS4gVGhpcyBl
bnRyeSBjYW4gcmVhbGx5IG9ubHkgYWNjdXJhdGVseSBkZXNjcmliZSB0aGUgREhDUHY0DQpz
dGF0ZS4NCg0KREhDUHY2IHN0YXRlIGlzIGFjY3VyYXRlbHkgZGVzY3JpYmVkIGJ5IHRoZSBj
b21iaW5hdGlvbiBvZg0KIklQdjZBY2NlcHRSQSIgYW5kIHRoZSBhc3NvY2lhdGVkICJESENQ
djZDbGllbnQiIGVudHJpZXMuIFRoZQ0KSVB2NkFjY2VwdFJBIGNvbnRyb2wgaXMgZXhwb3Nl
ZCB2aWEgRC1CdXMsIERIQ1B2NkNsaWVudCBpcyBub3QuIFRoZQ0KSVB2NiBzdGF0ZSBpcyBy
ZWZsZWN0ZWQgaW4gdGhlc2UgY29tYmluYXRpb25zOg0KSVB2NkFjY2VwdFJBPXRydWUgREhD
UHY2Q2xpZW50PXRydWUgIDogU3RhdGVmdWwgSVB2Ng0KSVB2NkFjY2VwdFJBPXRydWUgREhD
UHY2Q2xpZW50PWZhbHNlIDogU3RhdGVsZXNzIElQdjYNCklQdjZBY2NlcHRSQT1mYWxzZSAg
ICAgICAgICAgICAgICAgICA6IERIQ1B2NiBkaXNhYmxlZA0KDQpPcGVuQk1DIGRvZXMgbm90
IGhhdmUgY29tcGxldGUgY29udHJvbCBvdmVyIHRoZXNlIHN0YXRlcywgbm9yIGRvZXMgaXQN
CmFjY3VyYXRlbHkgcmVwb3J0IHRoZSBzdGF0ZSBvZiBESENQdjYuIEEgZmlyc3QgYXR0ZW1w
dCB0byBhY2N1cmF0ZWx5DQpyZXBvcnQgREhQQ3Y2IHN0YXRlIHdhcyBtYWRlIGluIHRoaXMg
Y29tbWl0Og0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMv
cGhvc3Bob3ItbmV0d29ya2QvKy80ODA0MA0KDQpUaGUgY29tbWl0IHdhcyBub3QgYXBwcm92
ZWQsIHdoaWNoIEkgYWdyZWUgaXMgdGhlIGNvcnJlY3QNCnJlc3BvbnNlLiBUaGUgY2hhbmdl
cyBiYW5kYWdlZCBvdmVyIGEgbGFyZ2VyIGlzc3VlLg0KDQpQcm9wb3NhbDoNCkkgaGF2ZSBi
ZWd1biBjb2RpbmcgYSBjaGFuZ2UgdG8gYWRkcmVzcyB0aGUgaXNzdWVzIGRlc2NyaWJlZC4g
TXkNCmNvbmNlcm4gaXMgdGhlIGNoYW5nZXMgYXJlIGdvaW5nIHRvIGltcGFjdCBmb3VyIHNl
cGFyYXRlIHJlcG9zaXRvcmllcywNCnNwZWNpZmljYWxseToNCg0KcGhvc3Bob3ItZGJ1cy1p
bnRlcmZhY2VzDQpwaG9zaG9yLW5ldHdvcmsNCmJtY3dlYg0KcGhvc3Bob3ItaXBtaS1ob3N0
DQoNCkFzIHN1Y2ggSSB3YW50IHRvIGdldCBzb21lIGZlZWRiYWNrIG9uIG15IHBsYW4gYmVm
b3JlIGV4cGVuZGluZyB0b28NCm11Y2ggZWZmb3J0Lg0KDQpNeSBjdXJyZW50IHBsYW46DQox
LiBNb2RpZnkgcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzLCBjaGFuZ2luZyB0aGUgREhDUENv
bmYgZW50cnkgaW4NCiAgICBFdGhlcm5ldEludGVyZmFjZS4gSSBwcm9wb3NlIGFkZGluZyB0
d28gbW9yZSBESENQQ29uZg0KICAgIGVudW1lYXJhdGlvbnM6DQogICAgbmFtZTogYm90aCAg
ICAgICAgICAgICAjIERIQ1B2NCBlbmFibGVkLCBESENQdjYgU3RhdGVmdWwgZW5hYmxlZA0K
ICAgICsgbmFtZTogdjR2NnN0YXRlbGVzcyAgIyBESENQdjQgZW5hYmxlZCwgREhDUHY2IFN0
YXRlbGVzcyBlbmFibGVkDQogICAgbmFtZTogdjYgICAgICAgICAgICAgICAjIERIQ1B2NCBk
aXNhYmxlZCwgREhDUHY2IFN0YXRlZnVsIGVuYWJsZWQNCiAgICArIG5hbWU6IHY2c3RhdGVs
ZXNzICAgICMgREhDUHY0IGRpc2FibGVkLCBESENQdjYgU3RhdGVsZXNzIGVuYWJsZWQNCiAg
ICBuYW1lOiB2NCAgICAgICAgICAgICAgICMgREhDUHY0IGVuYWJsZWQsIERIQ1B2NiBkaXNh
YmxlZA0KICAgIG5hbWU6IG5vbmUgICAgICAgICAgICAgIyBESENQdjQgYW5kIHY2IGRpc2Fi
bGVkDQoNCiAgICBUaGUgZ29hbCBpcyB0byBwZXJtaXQgcGhvc3Bob3ItbmV0d29yayB0byB0
YWtlIHRoZSBjb3JyZWN0IGFjdGlvbnMNCiAgICBuZWVkZWQgdG8gdXBkYXRlIHRoZSBzeXN0
ZW1kLm5ldHdvcmsgZmlsZS4NCjIuIERlcHJlY2F0ZSB0aGUgSVB2NkFjY2VwdFJBIGJvb2xl
YW4uIFRoaXMsIGluIG15IG9waW5pb24sIGxlYWtlZCB0b28NCiAgICBtdWNoIGluZm9ybWF0
aW9uIGFib3V0IGhvdyBzeXN0ZW1kLW5ldHdvcmtkIG1hbmFnZWQgSVB2NiBkeW5hbWljDQog
ICAgYWRkcmVzc2luZy4NCjMuIE1vZGlmeSBwaG9zcGhvci1uZXR3b3JrIHRvIGFjY2VwdCB0
aGUgbmV3IERIQ1BDb25mIGVudHJpZXMsIGFuZA0KICAgIHVwZGF0ZSB0aGUgc3lzdGVtZC5u
ZXR3b3JrIGNvbmZpZ3VyYXRpb24gZmlsZSBiYXNlZCBvbiB0aGUgaGlnaGVyDQogICAgbGV2
ZWwgbW9kZS4NCjQuIFVwZGF0ZSBCTUNXZWIgdG8gdXNlIHRoZSBuZXcgRC1CdXMgY29uZmln
dXJhdGlvbiB2YWx1ZXMNCjUuIFVwZGF0ZSBwaG9zcGhvci1pcG1pLWhvc3QgdG8gdXNlIHRo
ZSBuZXcgRC1CdXMgY29uZmlndXJhdGlvbiB2YWx1ZXMNCg0KQ29uY2x1c2lvbjoNClRoZSBj
aGFuZ2VzIHN1Z2dlc3RlZCBhYnN0cmFjdCB0aGUgcmVwb3J0aW5nIGFuZCB0aGUgbW9kaWZp
Y2F0aW9uIG9mDQpESENQdjYsIGFuZCBlbGltaW5hdGUgaW1wbGVtZW50YXRpb24gc3BlY2lm
aWMgZGV0YWlscyBmcm9tIHRoZSBJUE1JDQphbmQgUmVkZmlzaCBjbGllbnRzLiBUaGV5IGFs
c28gZmlsbCBpbiBhIGdhcCB3aXRoIFN0YXRlbGVzcyBJUHY2DQphc3NpZ25tZW50Lg0KDQot
LSANCkpvaG5hdGhhbiBNYW50ZXkNClNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlcg0KKmF6YWQg
dGUqKmNobm9sb2d5IHBhcnRuZXJzKg0KQ29udHJpYnV0aW5nIHRvIFRlY2hub2xvZ3kgSW5u
b3ZhdGlvbiBzaW5jZSAxOTkyDQpQaG9uZTogKDUwMykgNzEyLTY3NjQNCkVtYWlsOiBqb2hu
YXRoYW54Lm1hbnRleUBpbnRlbC5jb20gPG1haWx0bzpqb2huYXRoYW54Lm1hbnRleUBpbnRl
bC5jb20+DQoNCg==

--------------jlqeoiTrOvPKDJJhermYwls0--

--------------vx5dsnlyDcL3zPQM9Ygxb5fM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmH61gwFAwAAAAAACgkQOcg9x5uaKcA9
Uwf9GTlvyjQ+Sc+R5zAvpUSmtuX2FKPdAg/MSE2+43wqOc58j6pgOdrjQFuc24gxRUv/wdaVCpiz
5COCpyzcc0f80NIQ5ohxFWpZHfDJbmaKLLEEi3wk4NpckrsWECt3dOTuXrP0PojRxtKKNJHa71ta
XA30cIMcLBzeux2KnCIS3PzPAHdnZ78vuApEPuqe2li6PWTBc0deOnJ97FpL2mMKSuidiYNVLY6H
aZQVAL/4W+05eGQnh4iGjvXMZ9Bu/nB+CeLm7P5NjYy5gmBUOg22a4xBX4oN98h55Tkpk15zUCGF
VXdQlcwOP9rAno05Wx1iwb8C9KTfuk+IcwBIrthtuA==
=Bi3g
-----END PGP SIGNATURE-----

--------------vx5dsnlyDcL3zPQM9Ygxb5fM--
