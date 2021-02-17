Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEC131D6C4
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 09:55:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgWrF3HPjz3cll
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 19:55:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CaJv6yTL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.129;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=CaJv6yTL; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2129.outbound.protection.outlook.com [40.107.92.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgWqx1rKqz3cVY
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 19:54:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMAx6stPAOe5gHLNaXPUANpG/M9NAa5G9OAyNZO6vWpC0wSQHIrGnoIhsgBi4w5xYE4FXUsxwj7k2cRdI6icc3BJSJGaIsNopglmflnpcY6GX/T28AeZ9JaXFQ5E1be6COoZxzY9/WzWyPJ9rwRS5mmdgBEIxNozHRv3mjht40eBPDPC10o4MsCw/RAUqqNCyrCkz4HSZ1Qy5vWpaXoIOGHvdAAQ9no1G3RgNPDUTr2CQ2Jk8Zjmi/GAwWj5d3ZRn74PDP4cuICkM83WwpcFLcqjtHV8YWrwnkLnN19GOvJZ1THZ9UZrE8htWaAIigfhTNy+nXqjQ466lRIS/HdfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg7wZQp6iyR/y1yJ0fOJwmQwC+FLzG6tgg4AHPQQtfE=;
 b=hMnJceGsY979hr1aCt7mhju5KOMTmKtI2Ab5rPohyZVOZFbtvxk6EH8ABUQR+iSbQWSq4v7rtATRWFsibw/qm3lrrF1szMiVixaGoh7d0wFKooPqChFahOFZyHOpqiBpd94HzFDg/ClJqWV1yrpgoO3f0LJVAnaFCg5/aFRC2mDQBDDI1yvR0dUH1uVTOxRefqOQXL39uf9h7FnsTSXCxMnoS4JJY8xJDdfdjxnt/Rtu37mrETmiavhU4wmevMTLjV/BaIDlyG2vVGHB34St5puTXnUrkWbrsLR1XibvrNaLsPKurU7DtZKWw137zQo3g0EM7GyjE+Jw9o2h9nK/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg7wZQp6iyR/y1yJ0fOJwmQwC+FLzG6tgg4AHPQQtfE=;
 b=CaJv6yTLmT8MrRsUjzogA9wK/y1Ci/3m/mi58yEHFqaFyBQt+7g42f+NfDB9BvGqwHojHfz8NBJWPlaMobFCAgesODz6WfQ340k9ti0KYZ99v7sYKdmXFNt7bhkBJd8aFnbPdS6DiFsjLMHIGfHdtF8GdgGoUBE1mj/B4Ki/Ilo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (20.177.225.155) by
 BYAPR01MB4008.prod.exchangelabs.com (52.135.238.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Wed, 17 Feb 2021 08:54:44 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3825.040; Wed, 17 Feb 2021
 08:54:44 +0000
To: openbmc@lists.ozlabs.org
From: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Any convention on putting source codes into openbmc/openbmc repository
Message-ID: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
Date: Wed, 17 Feb 2021 15:54:37 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [113.23.108.203]
X-ClientProxiedBy: HKAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:203:c8::22) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (113.23.108.203) by
 HKAPR03CA0017.apcprd03.prod.outlook.com (2603:1096:203:c8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.14 via Frontend Transport; Wed, 17 Feb 2021 08:54:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaac0fa9-d718-4b10-9f3e-08d8d321ab75
X-MS-TrafficTypeDiagnostic: BYAPR01MB4008:
X-Microsoft-Antispam-PRVS: <BYAPR01MB40087D41737B20E4018E2CCB8D869@BYAPR01MB4008.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rViqSirdreI6CjQn/mAHben9XEVHSKHQCnAHjcWxVr5ueMt/6hjDFfmDc8ajv1a6dnRNs6x0o6qo+2TI48lvmaikwk/paxBat5mAsyI9260LuDpvdok2CnuzalUwRCREqk14qCHVz23HjF3cddeH+psXbT0a+AvTp/pzm1NlQtKMwBUB1Z/flIIOLnaty5a2Z2J6iARuB17+enz/oa9f1xVFmp+4roDbeUMx/uO7SkW1KuTXv2yZup410eFVZJUD7Aj3tl9aSwGsRS19eMkWbLgHGIhbDBgsQDxrDXs7K46/2Rf0WMwVjtUu/Bk5pMF2QYGhXKn4W6VbRQPCoulRdKpZ4MepIRo9NVzVHiFE9T+FjLsPh94r43RvRAeXukP8uj/0pnt3o9nIMl7CTV+Na30sFCNLjHDg9K8lyEMpz6/f92WWLJ92b8fTBOyi8FfcbUvVENYaCPUnHBnkU7WaWpkhxRhIAdxLdu9ZbpTrjIDxz+nM0dnPsPj2sQZUbe3nCX9cyCO0bTpbuLJ+B+zU07AW1F5VmsYTO8ZE+zMn9uTijGIyugqWNcRgDObasTvf2Jx5huKu+7Sc9CONohfB08Q1csVYgmY2KL+cTYSWppj7pviy7JjVTW1n0+7a/PWSzYHzGNl0IAHogSzWYmogWnojUIjw5SAHyWXztF+NIBK1ipPEAFRkz9jgxpbHZ1OCfhUHVIyRQMUM5NL5V/wj2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(6916009)(316002)(66476007)(19273905006)(478600001)(66556008)(66946007)(966005)(31686004)(86362001)(6506007)(956004)(16526019)(26005)(2616005)(6486002)(186003)(8676002)(31696002)(52116002)(5660300002)(6666004)(2906002)(6512007)(4744005)(8936002)(45980500001)(43740500002)(563064011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WE5OWHdBdUgrVXBZQW9GUGxqUE0rbVpvVWRSS0tIclFBaHRmOFdwbUdTTUE2?=
 =?utf-8?B?S3c2M3l5d3JHc3VobU4zVStwZDdKUHZPVU9yYXZCRXV3Lzg5aXBtOEhsN1Jr?=
 =?utf-8?B?N2xDUHVBeXorMWR2aGRaUmZBRkg3OXdRcmMzNlJVNXU5TklxcGw4OWs4MUpK?=
 =?utf-8?B?UWRrOXhnclJXUldJS1lmcG40c29kKzRxY09iQXdTRHB2bEJrK0Q0YVMvWUMv?=
 =?utf-8?B?NmtYSnUraG1ocGN5MlNRNXJJRDdDZ1BHM2xpR2tLQ093Qmd3eVRoaUFiOE41?=
 =?utf-8?B?VlJJSHR1emlsa1ZkYXh0elFTOFJiUVUySi9zU0s1eGVrYjlCM1pzdkJLMkhV?=
 =?utf-8?B?TkFrc2xQNy9IL1lkRmh6Q2dKZ1JZZXI0RTd3dEZPUmRyT2NkeGs2bmJRK01j?=
 =?utf-8?B?YXFndU5idFNSUUhGZ0tKbzRYM3dqMWFyc3hYNWYwa1Z0Y1orSlNMdFZrM2Zm?=
 =?utf-8?B?OTVvSnlTNEs1bkVuUGdGWlNqZ0J1Y3hvYkJaRmdKaHJ0REVEeTJjYWVzYi9h?=
 =?utf-8?B?U1E4SGxOM1NCOFJ5M3dhVnpod3ZyWndCSVpyQWJ2UURKY3RsRGtOVUpQY0tN?=
 =?utf-8?B?ZEx1VHE3NTI2LzJkZkVIRmZKTXF2WTIwZGpJcXdKYmIwYndhbkZ1WGZ1SE14?=
 =?utf-8?B?Z2NxYU05V3Q5MDRrSlo4UVZEaEwrQlpGaFhwTHg1cTBNYWttSkthWTZLQnBZ?=
 =?utf-8?B?QmIyZ29DUUtwd2F6UVIwQWRKNVg1U1pVOCtkR3lMb3oxOUhDcVlDNTlzZFFU?=
 =?utf-8?B?Z1h1K3dmUWhCcnlEeHFOUUM1TDRvam40cmhTa3BlYkdQUzRRb3d4UWx4eWxR?=
 =?utf-8?B?ZWZGTE1xRktEeklZTGFQRHphcUY1VlJBQ1ZNUnFvUDNBalhGdGpmbDB1a3li?=
 =?utf-8?B?UFllakIyL1F2bWVSeXVxNW5MbjFLTzY0WGpKTUpSYy8vWXJaWW5uajU2NWZO?=
 =?utf-8?B?MWhZNTJDM1p6dmxVRlJNcWw0ckw5b01nZFNBM3M5S1V1NkVsTy9yT2lpRkJs?=
 =?utf-8?B?bWJiL2tDRFBFd0pRWlJ4eGQzYzBGOG50UDgwblZwR1gxOGlibDlWU1Z0V081?=
 =?utf-8?B?NkZiN1R2N05CUE9yU3RoTXk3aFRmZmNVV2kxNGtHN3Fidmppek5KOXVCQ3NM?=
 =?utf-8?B?UFErRmExSVFta240azQxUmJKL0NiS1BobWxXak9xSGxESzM0ZFhqRWxiNzNZ?=
 =?utf-8?B?MGxOVTJBWGk4MlNyVDY4THB2RHpPU0s5SEU3U25ZejZKaS9oMEJOV3VhVXZY?=
 =?utf-8?B?NEt4SXp4ZlJPY01rRFNSWWQ2aEJWUU0xY3FLUEpRd0VrUG9ZM0k3V3VsZ3Yz?=
 =?utf-8?B?UnZ1Ynk3aEloNXB2ZWhjc2w3WHZHcGIyb3dlOEpzZE1WdkVRVDJvSmtkV3Y2?=
 =?utf-8?B?VmdZZVl3SWM4WXRtdWo2d0dyRXROK3JwWU9GR29XNEpBR01ya1RtR09vWjc4?=
 =?utf-8?B?TDd1S0krY1BMaVRubTZ6N01tWjVxR0lvR2t3Q3hZbDdIc216eWRkWlRWRnBG?=
 =?utf-8?B?dGp4SjdkRzVlQjR1My9aZktqUHJrNUk3VllHUnZyVjhVdkpDNXhDQS9EcHBn?=
 =?utf-8?B?VGVVL0Vxbm9LSUpsRXdrbTlKaUxTZ1ZDNDE2YU1JWlNYa0tWTXhXeWJ3WFdZ?=
 =?utf-8?B?QjR0bnM1eEcxTjBLbUdIR25MWTcxNzNwR3dlQ0d6d3RYbGhuUVVzWHByNDgx?=
 =?utf-8?B?cXAyWXN1TjVNRlZwNmVRZjc0SDhVYVd6ZDFPOVNwMEJWZHhrUVowUTRYbjdn?=
 =?utf-8?Q?qo1cPjrPmM+ybaSbL65o91PaBdUEURx+Ra0o2qb?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaac0fa9-d718-4b10-9f3e-08d8d321ab75
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 08:54:43.9667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht+goAUXjOXy19jZDyHSeueAyDZjKeSqkqdT29qfKzJ/n0yvQfrjnXlHiPytiQFotV7qB/fKXOBVlsFHrOYjoarVSVI7aLgibSSfHyBnraE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4008
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

Hi,

We implemented several features using c/cpp codes. Currently we put the 
c/cpp source into the openbmc repository like below:

https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-common/recipes-ac01/host/ampere-host-error-monitor

https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-jade/recipes-ampere/host/ampere-scp-failover

I check from http://github.com/openbmc/openbmc but don't see source 
codes put there. Is there any rule that prevent source codes put into 
the openbmc repository?


Best Regards,

Thang Q. Nguyen -

