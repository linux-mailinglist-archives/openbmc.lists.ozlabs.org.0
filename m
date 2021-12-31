Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D776C482388
	for <lists+openbmc@lfdr.de>; Fri, 31 Dec 2021 11:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQMRS2m6bz308h
	for <lists+openbmc@lfdr.de>; Fri, 31 Dec 2021 21:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=SCj61SsW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.96.134;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=SCj61SsW; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2134.outbound.protection.outlook.com [40.107.96.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQMR05Xwmz2xCt
 for <openbmc@lists.ozlabs.org>; Fri, 31 Dec 2021 21:52:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBH3A1it8DA8VApix+G5VIJFygweoAYRdkMuKTwxPe5p7kGF+LuNfvxKhPV8UOjS1spdPF0V2QcHjSKmKulr6+uKIQoLGVzH3CkhZyU9CJUgnEcCz6YXln777XUUSlsG0/Ma90/Y7+BndEeGvCUjiRdyhba6Pnc5r3LKUYWCCiTrQT1ILiyVzf4PqSAW6BByUcc/Qt2uKwIg28IauTbQ8PdN3XnEPmvFEh/4m1FUOJxnBUbIfHygniRBd/zjNlizSkmdbXJtN/gPY9PnI/CpoDg+t6dOLG29IxVmwXzrdzK2fr7jrqkpTYMh2VN/dKBs5OiQ1mg3Vb6g5dEwnEJ30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW6j4wtPpFf3uBHqx+pqfByrpC4acKzlaU6T2RWTRzk=;
 b=JMrzkqm7FtafBR6NLS5Z3S9bzm8qKhhZlndq5sHYv67DnsCcShj+GOEk7Am0zcO6L+C8D54jUmt0RQQd/vDaqUh2B2HbVGlH/G7uJZN7qBclEJrdtPjIYqhUE1CG3+n90DI65/dzcUQdqR1WTV6C0TwRxZ5ELN3ZYll6hxpT91QAwxARkJSwoZ0Gdmb5CwjiGa9oLQDSNfIXFkSAlSNgeaTuHUjSaj3ycdXPihELsVvWov+a+ql7jHjNwbsy+Noze3/zTcrkEoATemuLZfyJxxq3UQF5S4vxTeOr12wVTq8f+EXhMnB82f+LhLMJ0bX0mXgpKAKV8aJN5Z1PQ4BzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW6j4wtPpFf3uBHqx+pqfByrpC4acKzlaU6T2RWTRzk=;
 b=SCj61SsWuAy9D7Q2MS1wduNwfbQaig06H9ZD0wJV6Qc2WHwomAo+yjoK8iXCfFV/Vap/mT8/PTTcgXIznKSIj7UVTC0p5k+QKtZ4zzpvMUK4/ek60z/02zZ+BfOc0ADECcXw3DVqvCTG9EOVd6IGFIZ8siGpf3/MbtXlIWOe5+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB4071.prod.exchangelabs.com (2603:10b6:a03:56::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.22; Fri, 31 Dec 2021 10:51:49 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::c816:6179:3995:11d]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::c816:6179:3995:11d%7]) with mapi id 15.20.4823.021; Fri, 31 Dec 2021
 10:51:49 +0000
Message-ID: <5bc3550a-4ca7-f22d-8607-42954752f96f@amperemail.onmicrosoft.com>
Date: Fri, 31 Dec 2021 17:51:41 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Content-Language: en-CA
To: openbmc@lists.ozlabs.org
From: "Thang Q. Nguyen" <thang@amperemail.onmicrosoft.com>
Subject: Question on phosphor-multi-gpio-monitor
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c193240-9739-423a-a868-08d9cc4b8c21
X-MS-TrafficTypeDiagnostic: BYAPR01MB4071:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB4071010366867D9C396E99B88D469@BYAPR01MB4071.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hEVr2Ub69CFHtN/N4PODt6NPR52BQqI5uMSAInc29IJnd8R99HHpdFSP9eID5qXTFmRN9MO5zMXw+VIXAy85Cjks2fBptOXeZXsLyoug/8419ZA3f6RUATMur29ZZr3BTq+r7+8mO7xPQ1pGDINqzPjPuQ019pYv3kvbQBM32a5f+16Qpj0egFpP+rCB0WrPyDuYoaQk3h8Mi0eOjWd4MiiEORRBGlp9zVsj7H30SGj1KuydWg7IgWXdYpv5nEAk8SminUBBzHisVIOovXjTCMoecsXsmmNKA5s/k2fhPeRxhjQXHufFQnAInUD7ohxRRmA6TE8FM/ZEkGevGVvyHrZkcaWGPTTsTn4iQ0KsHjPaJ+AZ1kq9XGr1qJt4DCqf/Uw2NyhxHPJbiVQV23R207mS+m0e0qCaWwpVqFxaGW7V3nM2Ys85btKwUXFYGl1tDwW2P6Zbip87oMQIHT6gPiem3tDUvn0BnlSrrKXO2LMYhpTasJhmJSGYPhyo3Yfz6CMUj94GcNQzniNMGd5exu3m5ScIEHBJH0bdWkgJkcH40/CWTz+4YfwCHuQOVEQPiL0vvSLC2rBJuMbVJfMAyICnchKUh7+U+UixjBkKqBB2jaObgWSWVJbwubTC9YFu9dAa1r3bUhoAWbfq6scZe+TKS1SvOfWS6az7MTgxopx+5zF0PalgIv00i9dsmex5jqxm7ZwmMVB8tVNXauXatiyPrirIs0K+gQs68sbdb719xEGR1LE143xTaKKYDagLCLm1JNRpU0RtMvAkrZBbMbufr3PUVoJvESF0Q/tv47Wsr/3GG3J37jTnc+3hsEpVYUJ8cNrZrNKijF3F4r4Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(31686004)(38350700002)(508600001)(2616005)(6512007)(6506007)(42882007)(186003)(31696002)(966005)(4744005)(6486002)(316002)(6666004)(52116002)(5660300002)(83170400001)(2906002)(6916009)(66556008)(8936002)(26005)(66476007)(8676002)(66946007)(41852002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M083S2c0N1REOUhoaThNa1NOZUEzS2tuUEhOSFZYL1J0M05jbmpMMWsrT3FV?=
 =?utf-8?B?MEFpMmEwL3JiOVIyR0pmTjhHUnRVZERuNndsazAxMlBWOHQ1Q2NmREo5Njdy?=
 =?utf-8?B?L3NkSkVpOHV5V295Z3VLb0ZIdElPVnptWDNWYzJOTWpZUzg5eTlPQ3BBSGU0?=
 =?utf-8?B?VFJvc3hpUHZBc1o1cVljbGE0THJLT1RrMTVwY3h1MHEyOStlUUU1VHo1cTBL?=
 =?utf-8?B?UWtPQ1o5TzRsSDZDdGxlR1A0RGdxZDYybjZxa3Jpa2FPcVNzNkVTNnJsbFha?=
 =?utf-8?B?Nmx2WkVxeXY1YXpqN212eXgrSStTcE9PNFVpNWE2Ri96TzdWTUorSGYvL1Y2?=
 =?utf-8?B?MGE0R1JXNU1GeXJzUUxFM1dFbHM1d2pBQ043UFJZQ09ZU3diTEpuMy8wcFlK?=
 =?utf-8?B?THlCbHRBRVl6eHlYN2dKQXQ3cy84ZjRRVVNJQkt2elo0WG45UE1wRUp5a2Ey?=
 =?utf-8?B?QWpBdlVGV25GWTU2TEJqYWliLzFDeVNSbnlUSGYwY3FyNlMxazYyVmRtMm9K?=
 =?utf-8?B?K0F3VUtUazIyVVhLQWhDMlJzb3g2WG1SNkhqZnl4bkJ3MVpzSlhQLy9UTEZt?=
 =?utf-8?B?UHpTT0N1SXRma1EwbVNLVGpXVGwzOGtsQXFEK3pDa2VNaWxGOTAyTkl3VDdF?=
 =?utf-8?B?Rld6WTFDWGVEQzJXL1BTV2sxZDZYdWtOcUdNZHN1V3QxR1RrZ2tnZ2V0elFB?=
 =?utf-8?B?cVBUM3pISzJkVmhyTVNZU2ZYYkVMTnNIUGtnWGo4WklBK2JxK21yU1R6elh0?=
 =?utf-8?B?bzRRK21vZnM2QzlydEpDM3dKaXFUcDBJZjBuU2laVDd5WFVZWkI0YlhZTTZC?=
 =?utf-8?B?WFlObS84ZTR1cDdxNGZ1ZlF2RHJCaUNuK0FVQ21QcnRPbW1YbDNQMkdBUXMy?=
 =?utf-8?B?d1hxZlhTd3BoNXlaNlBJREdNMVF1WWlmY09NR1kvN2h6NnV1QTN2QkxmRzAw?=
 =?utf-8?B?dTRlZkFDV2dIQTNUSVltU1B2elFHejJlVG9waUFIcWdha3JiMEpYNk5FcXRP?=
 =?utf-8?B?ZjVVeUZZdUE0RjVTaTBOd3dnRkhTR3VvY1laU1NsdC9Sc0JGWk13bDdmMHND?=
 =?utf-8?B?cjh0UHlnd3FrdUxTS2FTZ3FYVzc5SWthM1NwQ3Z2Z3paeC9Ga0FpM2xwQUdQ?=
 =?utf-8?B?dHhGZ29uemlUbDRlVE9xK0lZQS9aYnF2S0E3RzIzd25nQ2s4WlgxM3JBRGgr?=
 =?utf-8?B?MHdEUEtqVUJrTVI4em1sTjJ5SHRONmhqS3oxTTBXcnlleGtmOXV4RnRwSndZ?=
 =?utf-8?B?dUM3MHZqSm5vV3FRalBaQ0hsazZFMEN4U3YrYjJTUGJXa2R1T2htRGtYc1Na?=
 =?utf-8?B?TTlzQ1psdjFFQkVJYXBPSUxiT2R3Z3Z6dlNnVU1pY2NvS3BRanZNSldrNy9m?=
 =?utf-8?B?VVZyV0NxU0ZwNkFCZ2ZzVzZubXJ4ZGttc2pDL2Zsd0IwcGJQUDBGbnJIS1JG?=
 =?utf-8?B?V2xVOXhYZjVyQkZWZ055QkZiOEFoTlpZNjByTG1ORkQ5RC83cHMwa2I2a2Zn?=
 =?utf-8?B?MklZY2d6VjE3NW1qYnZFck0wTE9jaUR2eW1XY25zOGRiVytyWThLZWFWdWNW?=
 =?utf-8?B?SjNGbUVZMC9CRkNhY3BUTXZTR1grVURORk1PK3QyU1ZTNUlKNXRYeEpTVmEz?=
 =?utf-8?B?Y3p5V3VraUFlR09zVXlPeTBIcWppTmVLcWxIU2o1a0M0R3pFbU82OTVIQWoy?=
 =?utf-8?B?VXY5eTlMclppMFpMVnQ2b2Z5RFIwVTZLUHZRNCt3WVB6VlJlSDcwVEFjbjRt?=
 =?utf-8?B?Zzh1QnZ5dlU5eEQ4N1NHbnp0YjIxUEFSNzl5elJQQ3FGS1BkU3hMRTVtMW9k?=
 =?utf-8?B?TzdDTVlyend2R2NEK2luUDZhU2o1aWJ3ZHl6alV6SkZUejJDR3lPY1pKVlRD?=
 =?utf-8?B?dnpPSklDaUp6bGtQa0dBQmI4bU1rZFZvalNpejZXMDJ5OFprd0VRamNnWUcr?=
 =?utf-8?B?RENKdlJZbEV3aERMWmNrL2VvYktvcGlMVlh0cWt5bDRtVlFPZDlGek9rWkVN?=
 =?utf-8?B?NXN1RmZDbGJ6TTZOK0k0REdxZDJhWCtqR3F3V2hKLzJLWE1TUXRVYnd3ZU1I?=
 =?utf-8?B?dGtvMEI5Nkg5S3NMbUh0a2NZVmdSY3FYNUVhOFdmd1NRWmJkeUJnN0oyMmcy?=
 =?utf-8?B?czVNbEh2VkZNR0FDVDkwU0d1UUVSSWdlOGNvUXR1dUFYeE1QTjV2UkE5RGtP?=
 =?utf-8?B?dVYvKzczUm9QR1VmRlRhSE43dzd3aVlGckZrcmNJQ0JaQmtiTHlGbDRZTjh0?=
 =?utf-8?B?ZmRHa0xrSjlseUNFb25Hd1F5cGhrQk90cjFWbWE0VE4zV1lObHNKYUt0N0ZO?=
 =?utf-8?B?WHRMNEFYRFpnT0w5UUVQSEZLN2NtQS9yblZkd3pMZHRYUlNrdWJJdz09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c193240-9739-423a-a868-08d9cc4b8c21
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 10:51:49.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FY6/U/QhiGhZFdKWQtCS5dfKbgTWPmr8pJ5FKSLVIwwIjZ3ZWbWtEHqalSeoTlNS5C7YEQG4luR+pkCXMHQLu91nuP67ZVTtjNd43TtYCFHODmibkFle0m6NUZZG5UHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4071
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
 From the guideline in phosphor-gpio-monitor for the multi-gpio-monitor 
configuration at
https://github.com/openbmc/phosphor-gpio-monitor#phosphor-multi-gpio-monitor, 
there are 3 supported values for EventMon: FALLING, RISING and BOTH.
In the case of BOTH, is there any way to check if the event is triggered 
because of rising or falling event? An application for this case if for 
CPU Fault GPIO from Host CPU. Asserting the GPIO means there is fault 
from CPU and deasserting it indidcates the issue is cleared. With 
gpio-keys and phosphor-gpio-monitor, I can support both case but I 
wonder if we can support with phosphor-multi-gpio-monitor which has 
better and cleaner configuration file.
Does anyone know about this?

Best Regards,
Thang Q. Nguyen
