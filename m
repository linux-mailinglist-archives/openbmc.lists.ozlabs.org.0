Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5CE4502BF
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 11:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht5Vl2QBdz2yP7
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 21:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=lwywWfi9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.107;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=lwywWfi9; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht5VH298mz2y7H
 for <openbmc@lists.ozlabs.org>; Mon, 15 Nov 2021 21:47:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt28jwrr6yljZZ7hCmE6HKrJyMNLUVA4T+4VmXOuMKINf4kIwWf7J1VDH3cKlTu/kY0deAIyHKBNy/HeBJfDCSyR18w8+OptpaFp7/sI4cKdXFlaPruCN4I3A13paZX6qSujPAv3e0NWpa3aLSBEkY4PubQBPT+GJG3v6nU7XMM/STUtT7C0XsJOpBiJ3p3UbmumJ7YksQGMovtLDioTSc5qlPU31qZg1QTpHSwB416LwRtuemt1idYWWaWODChryyO55ZmEve3vT+cSukL1+eCK1uscPDqi+Yzac0fujGQCGjOUn+kgKwHHxV/2pJNPNdCuVPZ1A1ISgRzAUDtJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EVG82xu1GlKQSN9YO4ppAGg9Bs7IPpMAEMiCa0y5Ck=;
 b=c1dIZMgR24nb92udeILYWal+PBCy0GvG04szEg8mHxAf+ghwQTpUdSZ48feAx4vjrbNQj4V1F7qBeV5DqAx3R4E0GJ2vex8G559HbKCsHwpiwjPKyIhuMv06kscLiZ8D6gNpeVh98f9EqZ/ta4QLCfG6m6isL3TekqBLtinAkJUTN7sCmIl/TRaIb5zgYr1cRI4xP1ER6/Fh1AMnNX0gy4jSlFaitfiewyeTZpUX2PBmpDtoWoTfajRmImJ/W7wvt4OWtblsNpapcHMS0gzg78nv7/gKIKQivU4ODEPkxPekpTp7CVRibF9IqU5K3W7cO+6ERvqdqUgx6uHZgK636Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EVG82xu1GlKQSN9YO4ppAGg9Bs7IPpMAEMiCa0y5Ck=;
 b=lwywWfi9etcVO3vlQc8sWkY781lsPVNDjh2MPOeL/VlXDAaPYG60xDhcJOXa/z3y6rYTNb4quyAOxcRVw1NXoq+GSBKKDSq3e8XVzpFEUZsKvl2tgCCUg5VaMf/ETmNgWDHE7qGXudFEjBnaxyygYGiQsoCehPBYrFcUl9SfW+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB4280.prod.exchangelabs.com (2603:10b6:a03:55::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Mon, 15 Nov 2021 10:46:36 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::6476:8a6a:53f2:4bb4]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::6476:8a6a:53f2:4bb4%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:46:36 +0000
Message-ID: <0653d3ba-7bd6-c01a-741e-8b8cf5ee3655@amperemail.onmicrosoft.com>
Date: Mon, 15 Nov 2021 17:46:28 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Content-Language: en-US
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 ", Tim Lee" <timlee660101@gmail.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Subject: Check on BMC Reboot Cause
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0166.apcprd02.prod.outlook.com
 (2603:1096:201:1f::26) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
Received: from [192.168.86.214] (58.187.175.27) by
 HK2PR02CA0166.apcprd02.prod.outlook.com (2603:1096:201:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 10:46:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb5d3d29-bb5a-4df7-993a-08d9a825322d
X-MS-TrafficTypeDiagnostic: BYAPR01MB4280:
X-Microsoft-Antispam-PRVS: <BYAPR01MB428091CF843B661617B920638D989@BYAPR01MB4280.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1y9wvM3Dp5RXL0Fj5oHU2GcXF9/CyG8FQ7la8EMVtDEMukQv4PGvZydCC86lka/yNVYW4jw2DaOVoX1vzIgRBFXq4FdHEJwLZJ65jEATdu22rH6LcE6BL5TuFYQubJ7RfLNEf22c30zuWm/qqvQyomD0zTDJoI7/oGXOZS9/uo/3b+pJyahVGpvfl2XUnUGdhJIe2MC0YoRY6K9piNxJLnfrHDEbSiFMqZXHfyX1ugAALt29HJ41b5+aTEGIuABtKjWVp0v95TYIgRZxsz9PnU2uqbCA2i5cvPs90M6G9DNa7HjB9RJnGSwQiqXOSdisHPozoTeD7aeCbmbmRikr9Jb9Z2MPgqgN3+XnPh7dfONnYqkHITc6mGXYcXJtx+UnFVfYPHiib+XYeeLFJNER/wty/I+ZkQlea/qLcSQ7cQeQwU/csOS0qYfAxvpqAXteYZCokgW1Rn6uWDoeJ6WBOxAye00CRLpHl+mPAYwTl80BeS2W+u2gRYCRngFl5uwlu86VfLBvno/b4LrkbkRXh19QK1zw07EHe89xcJHcfcSCrIPNMOIt+JHwfcGfOO+xsApILZLc4LgkasvPEVEITXGLzJ3iR3zKGBhGVv78O48OlD+E4KYGhR0VAe8kbZlaspRTy5k0Z2nplRlcJybh5TCtKV0ci4k7qXz0RnY1+E7GlHssF/0BElVudnCMB+NkB1APhncNHGfhjxybZ82zmifaVE8pdU0iZq1kTkylq9Qi9Nexpi6W+Dfw7ouIbkGi6MbFrtcwOll6jMLLi3YoE/vuo2gG1qBrOEmOBbt+FHDVjBM4aQmm+njChroxEgzg579lSNhKNC0yBJHYC/zQBCuXZKaJO9x2gsAYLRLzt7P9JXzYSnIuXxj6lhEYDnmj5ST4/RskEjzya1VjpGckQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(84040400005)(186003)(6486002)(66476007)(26005)(2906002)(83170400001)(316002)(110136005)(16576012)(38100700002)(38350700002)(31696002)(966005)(6666004)(42882007)(508600001)(66946007)(8936002)(8676002)(31686004)(66556008)(52116002)(5660300002)(956004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFrRFA3dFplMitIZENqRE9adFJMdktSdEJNYTRuRy9tUFN4aWxMRHBUQTJJ?=
 =?utf-8?B?Y2NZcCsraUd6NTdDMTViVGtoSGJvUnRxNkUvUVVqWEdYdHQveC9QR3R2QlBJ?=
 =?utf-8?B?MU9zbGI4V1ZDM2l1bjQ3RE0rNDVyVVVwTDZKT24yZUN0VktGaDZxQnB4MzJy?=
 =?utf-8?B?TTl6U0Q1TlJxZC9yUjRkYkk2RVpwc2hGYlRqMEtITHFRdS9QUEl1NWdib1li?=
 =?utf-8?B?K2ppcFpDSTQ1eC9XTS9ycGdOWGJNWVgvWXR0SFVWZjlqd0NnZkZRL09xdmE1?=
 =?utf-8?B?ZzBMWk4zQ00rUG44TnpCdjFuZUtUd2tLMWhsWWQxeVF4dHR2T0pnVWU5eU9O?=
 =?utf-8?B?eEJTbVZEOHQvZ0VXWmltZlFrTGJ2SFdzKzcrczRrbmVnSHUxM25CazBJZWt1?=
 =?utf-8?B?bERWd0FmR254dDhsZmZWZ0x0SHFDSytjbTRKejI3Y2Q0NnR6YVltWXN4dG5q?=
 =?utf-8?B?aFZpM2ovMmtkZm9KVlhGRGhOTGpkQXgycmIwMDJMNXRLODlOWDhRQlk5dUxB?=
 =?utf-8?B?REphalN0dkVVOERKWjNpY3VoL1kybDZndHlvb0ZnUzVtSG9JampsR3o2N0U0?=
 =?utf-8?B?TlFjMitCZUxJc0F1OWlJcEVxaFhwYyt4aVdFK1N0bzJrWU1SWEtoNlNaa21J?=
 =?utf-8?B?cVhRcHlHZGRyaC90L2N3QjA4dVRsNVJrbmo3aVhYSURod1R0YlhEOGNocjNW?=
 =?utf-8?B?YTBXMFlLaWNCR0Z1M0taT3g5Y3dNYUFiaWdnUDEvZVQwR1E4cEN5TmErWWlE?=
 =?utf-8?B?S2xFS01sN2N2WVYvbi9TTU9TNmI5UERjdXV5TlhYMnJZKzVFYWRLTDdkOVpl?=
 =?utf-8?B?VjFrb1NrbE56SWRDT242OEFFRlFtamo4TS9XS3ZDemxlOHg3a1RNay9DVFVR?=
 =?utf-8?B?eUdNZmIwcWZ3dzcwQTNvdHBseWJ2ZCtlcmVPVzFBZ2d4dWIwOUFCUmFmWTVE?=
 =?utf-8?B?RmJRcVR6STQzblZrZFBwMlNzVkd1V2NTQXVacjFSMkM5MVJuV1VxMldyTEhZ?=
 =?utf-8?B?S3Yvc08vMGh2YUZzL1p5NGVIYkl6STk4UldiOURlUENhbVFyMUw4Z2tDdzVi?=
 =?utf-8?B?Y3VxUC9WaG9ZUGpGaXFlZHZIVVlyYTVYU0ZFNzlodFlwQmUreWFuRDNHTG12?=
 =?utf-8?B?S1BlQVc3Zkpic2szWXpZUElTWFZMMXNSeHRMRnhSMFBncXRFMmo0bjhObzJ4?=
 =?utf-8?B?Y0JKN2MwR0VLMENtY2U0NENjT2Zyc04vdThmYzh5MG1BRHJnWGdEZG50RFgr?=
 =?utf-8?B?L1ZaejhIT2ZNbldIbTdkRHJ1ZEVkbjdVUGZ6RkJsNXVTM2p2ZEVGQTlOdkZB?=
 =?utf-8?B?NG5Id0xnZFJISTVSWkRWWUgyekM2eEpMWWZqZlV3MHJIWEpBNzRLZmM5cEQ4?=
 =?utf-8?B?MFVsNmkvdjV6VFJVMVJHZ3BKMWtKaU1TaHdRUmV3d2l0dFFxSkhkdTE3Q2tH?=
 =?utf-8?B?SVdVZmpha0VUdFMvdDFWK281OGluUFVqb0JjeWpkY2RKNkQzUkhxVHRhbHVG?=
 =?utf-8?B?enBlaU55cFJHT3AzdXNLdUg3SHpSZk5TVXl2MFlxbHVNd0UzU29YSzBNTGlm?=
 =?utf-8?B?NVdUNDcyUWg2UlhmWVIrUi9wbjdiOFpxUU5CS0pTTmtTQjR6bEh2Z20xajBH?=
 =?utf-8?B?LzRFVVRIL2xLL2EzdjlQSDlQaEh4VElWMUtEeTQ1VFdDWlRDK3NhTHlXQ2FY?=
 =?utf-8?B?bm9WRjVrT1duQTVkTzU2aWpsYkZUcWJEcElPVlFwSXIrY0lJb0ZCVGRHOVdS?=
 =?utf-8?B?TDZuTHNpK2FCdnUyclB6NGJEZnlveFN4SVJQM3lZREdpMEFXeUxPSGhtNUZm?=
 =?utf-8?B?Qnh1Ynp5dVovdGgraG5oZjdSdXBaL0pUZTdZVTZLTjltTHZYaFBhWXg1TklJ?=
 =?utf-8?B?bndMaVJMcWt5S2VHWXRLYytPcUVoazZGaHJOSlJLcEZDMXpuM20rT0w1QXUv?=
 =?utf-8?B?emtOR3lraU1ONjN2S2s5QXFQOHNNTnpnbkQ5WDhNOHFvWWhvVFdONTZLTVNU?=
 =?utf-8?B?T2FsOXdtZ3BzL0RDZTBOcml3N0dBbk9WK1pKeC8vV1dyOXVpelp0cWZvOEVK?=
 =?utf-8?B?NjJOVU1IV1pzb3VHTURCcmdoSnhXYndTNlEyY1FTbytteEdsN0JObXpvMjht?=
 =?utf-8?B?dldkQ0kvUk9hYWlyaXlGdzBvcHl0Mk4zOVJOQ1AxRXNweGlxRW5XbnMxUXpW?=
 =?utf-8?B?Q0lEQ0o4elI2WklwRmh3VmlYSDNIbDVhV0kxVEpxTFdaWW40OFU5TERXN09B?=
 =?utf-8?B?VTN5bllSS1pMYVA2bHJadzFFUmFxRWpoTmdjZlM2d0tBN2xUeVJucnlyOG55?=
 =?utf-8?B?OFdScFI0RDFZYnBmRGhNN1pYNFFNY3h2WnRWcktCVUo0b21JS3c4dz09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5d3d29-bb5a-4df7-993a-08d9a825322d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:46:36.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLKguR5FoNWNc6aMFti5OIzhGl8NnuV8gDsLTu8rRd0UH+biio7E9cJ6MwA+8+Li24r/i7QhKuC7JWzqyI4ilsqA4LDEOr3EX+ZSr84RiaWjRKVuvCAfvqPYI5Nc/5wQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4280
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

Hi Tim Lee,
I checked your change at 
https://github.com/openbmc/phosphor-state-manager/commit/2bfb1efc4bc7e781224e19c05b51e6675f13a488 
to support BMC Reboot Cause feature. But I does not understand about why 
WDIOF_EXTERN1 is translated to watchdog reboot and WDIOF_CARDRESET is 
translated to Power ON reboot. Can you help explain about it?

I checked on 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/watchdog/watchdog-api.rst 
but the explanation seems not clear.

Note that we are trying to make Aspeed watchdog support this as below 
but I still not clear if the use of WDIOF_CARDRESET and WDIOF_EXTERN1 
are correct:

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 436571b6fc79..c5c3f80dfc48 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -54,6 +54,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
  #define   WDT_CTRL_ENABLE              BIT(0)
  #define WDT_TIMEOUT_STATUS     0x10
  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
+#define   WDT_EVENT_COUNTER_MASK       (0xFF << 8)
  #define WDT_CLEAR_TIMEOUT_STATUS       0x14
  #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)

@@ -369,13 +370,19 @@ static int aspeed_wdt_probe(struct platform_device 
*pdev)

         status = readl(wdt->base + WDT_TIMEOUT_STATUS);
         if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-               wdt->wdd.bootstatus = WDIOF_CARDRESET;
-
                 if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
                     of_device_is_compatible(np, "aspeed,ast2500-wdt"))
                         wdt->wdd.groups = bswitch_groups;
         }

+       if(status & WDT_EVENT_COUNTER_MASK) {
+               // Reset cause by WatchDog
+               wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+       } else {
+               // Reset cause by Power On Reset
+               wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+       }
+
         dev_set_drvdata(dev, wdt);

         return devm_watchdog_register_device(dev, &wdt->wdd);

Thanks,
Thang Q. Nguyen -
