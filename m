Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3E2E8CAA
	for <lists+openbmc@lfdr.de>; Sun,  3 Jan 2021 15:45:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D81ky5PvgzDqpk
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 01:45:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.122;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=Mhjd96bM; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2122.outbound.protection.outlook.com [40.107.220.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D81jw1yYvzDqGN
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 01:44:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCJUUOa6TMBIb8jAbrUQpNNqJJNASSubEpbLXe6v1tLkWnF7bc31+Gc6sF2CXEuCkLEVv+L1tA6gJg3hH+LmOH0z8nXKAkCyu/JvKkK1OaQPlWK4xQHU3PKyG8ky5Z/jeM3iZk7PFfl/D7e6cREsqNwFjj9yru2P8D88HmUxvVjlEePgKq33gfkxoKcwy2NNhoOrH+Ztlg4P/tSW0gD+gyaOXp1txRaSFbiS4e2HIiEfgmJN9hIZ0uuyZNDWFgKT0AY/ruYqHLrX/lrn4VeexN7paYtKw9N1wyrxeq7miNt1Na2smffMEfgX3al/l7PHtYbqt/Tqu1QGo9w49vwq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY60hw3KldmdYINhpguh3qCuiSD+YjsLftvlseIePtg=;
 b=CflFQcuIPcC9HhxhyKAm4uXRYM6i/3xPXONkMoueAtnoYaYNUBUNVt6dhAS6hxlLnGllkZOh/LbaRNaPlMeQEnbSG1AkZGSqF6lfXrX98k0Z8gNDbYYnocycJafFUt9VXM10XwhVGbDvqAOLBzE5dYZlWUiqdNn1+vl3lEgrQQ+p+Vn8Ql5LE53RgCkQ+Cef1KLPEoR2JhWVjOoVJUjp9Ar+07TKpmbJaevS5JNRKQVkvEvLGybSFQrwhyHLyeeeU8qvFBxDoyeM3kTNyf+jv+ENtZh3tjUsBeH18UcTufEgWGETu+A2LT/+ob6twiolCuKakmVENlhISYIn24PNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY60hw3KldmdYINhpguh3qCuiSD+YjsLftvlseIePtg=;
 b=Mhjd96bM5190fpn07TyhktuBRVFR4Kub+BRFOlSxoVmCrJldNGOJRH1Dc7qgb0HNq3VKBBc7588doX3MOQbsYBvswtpYBCB8Lp6IsoBighsWsX1/89U7Gr7QAEraSBcvpQKwPIgufVqYhxXnFgoV/PSDpsisOGqDE5Ch2lN+5K4=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5739.prod.exchangelabs.com (2603:10b6:5:202::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.22; Sun, 3 Jan 2021 14:44:10 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57%4]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 14:44:09 +0000
To: openbmc <openbmc@lists.ozlabs.org>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: NC-SI driver: Detect OCP module power down!
Message-ID: <e26b2a0e-3251-bf00-5055-7a09f0f57d4c@amperemail.onmicrosoft.com>
Date: Sun, 3 Jan 2021 21:43:59 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2402:800:6344:4074:c1a2:32a7:d88f:9d45]
X-ClientProxiedBy: HK2PR0401CA0021.apcprd04.prod.outlook.com
 (2603:1096:202:2::31) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4074:c1a2:32a7:d88f:9d45]
 (2402:800:6344:4074:c1a2:32a7:d88f:9d45) by
 HK2PR0401CA0021.apcprd04.prod.outlook.com (2603:1096:202:2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Sun, 3 Jan 2021 14:44:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bdfe98b-ab0e-476e-d350-08d8aff607a2
X-MS-TrafficTypeDiagnostic: DM6PR01MB5739:
X-Microsoft-Antispam-PRVS: <DM6PR01MB57391B37E91EA44490BBF5B890D30@DM6PR01MB5739.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FebCC2PiviWbrrhFBMl3HMXAyGFiSs+58vW2OfbueKOX/tk1oLigMRXCg+LlTFrX8CHwsoVNQ5enLYECrOJ6nTWom1xdC2P4UcGJy1greDXYWnQ0eKCQUrEhGSbNvaaavIC0cQKWulwwAj8CKZIeCBm9zuoELTJYK0af0e//CbvT2cJG7OuM2ItpD9Jfmxh1lsgZQD/+MiokLq1tTyXwYQK1vC9yPKQx3zLTT63bKEE8vOIlOdjdYSURwNkSS/1ceUmYOllilMKX2zzvVvzeTiMiLMwvQgi67kvXn6Vae416nV7ud5UsF0zOWlegg7aj8HcvhoxX8MqXVyMrXTr4ixvTOiznuz0CrnTZQBGDqVr8iNOT6A3nfUyiMODiWBf8JD4cTQoCFQBaOucte9kwUWFd8TQ+4hUqpVznjTLAfLcMgEeQ4vM+SWndy0J0Csn0eikSJFZJXCTa2r4lAGI8UZAzrWCz1BBlTC0t4Q5Ocm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(136003)(366004)(346002)(396003)(66476007)(66556008)(83170400001)(66946007)(6916009)(8676002)(2616005)(478600001)(16526019)(186003)(6486002)(42882007)(6666004)(2906002)(316002)(5660300002)(31696002)(31686004)(83380400001)(8936002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTNPZFdoZVBrOG9JRnBTUCtHVVpwbkRRRU5aNC9xVUlWaUoyNEkwWnZTbmcw?=
 =?utf-8?B?TU9mbWlTNS9BcHVlNHY4U2QwTDlhVGtrWS9YMTlNN0Ftc3Y4UlhaNFR3dzBV?=
 =?utf-8?B?Q2oydU9RYU9oU000R3M5b0pLRmNWb1o1L1JmckIyUEtHNWtVR2RkaGVvbTBJ?=
 =?utf-8?B?ZjBnNkJUQ2k4bHVnWVBKZlcvY2tFRmxhUXVZeWdpbXdPOFhzOTVJTDNKZ1ZH?=
 =?utf-8?B?UFQ5M1pUb2ZzOE1vcFFGaUFaVjQwbW8wcTVscHoreG5NamtXUUMxSzl1b25F?=
 =?utf-8?B?T1k3ZXY4ZjhLZitBek1lV2NwRE1SQ2huZENtWExQbW1tY25OY1JJaHEvNVVK?=
 =?utf-8?B?cVJFdWE0aGVFcVpWMXVyZC9BSjB1Q0puWjdpNjB6N3Y3elI2MEtORGkwbzMx?=
 =?utf-8?B?TTl6blNNMVp0aVNoNDVVNDBBRnpsa0lOemhObHFudGVBSVBENmJrNTdDYlRF?=
 =?utf-8?B?a3lxRTN0WkowRTBMM1JhUm93QXExN2xyNnNuN29ZNVV4eGFwcERYUU8vdzE4?=
 =?utf-8?B?S0g1cmZsQkhjNWhZNm9wZGZuOERBdHhvTVoyL2xET3ZRdWtjRDBqL2FrTDZM?=
 =?utf-8?B?bkJ2MkRoK3M2OFJzekJwcHhMaUZaSFM2UHp2Q2NGZW5UUXFhaU9VZm45NDA0?=
 =?utf-8?B?WEsvL3FxQkNJWnJlbWs3OE9Qdkl1bk5Od3lOZ3BVVzladWlmdVJyOGhsRXZI?=
 =?utf-8?B?ak9VeTFadjdjeWFwV2ZhVWZkNFhJODcvYU5jQ3VMdWdwLzljS3lZL1d1THBL?=
 =?utf-8?B?Q25KeEV4TmdLOVJUWFhaQ0R0aVpxWXZXWHluQkV1bW1tNmVWaXRwMGliSkYy?=
 =?utf-8?B?aVcybHExdHFDTVlGcllpZ0pVVktGVGF2M2w0L2hhWUxPTVBkNkdvOFkvM1g0?=
 =?utf-8?B?K0hUWHVMQm5jYjF1MXdqbWJ2eWYxTWg2QStYaTdVSkJlcHRiSWIrcDNsNzRJ?=
 =?utf-8?B?TEJYQmFjckN5bUpzeWdsNk1GUHowUENUZzVKSmwwWTRQNXYvUUR2bWZ0cUtQ?=
 =?utf-8?B?bUxwQ29wQUhFSytCRTRVSzJTNENoSkJEK3FQZ1Q5c05yM1loME43L3FnV1gw?=
 =?utf-8?B?Zlo4NVZYaGcwcXRKYnBLT0s0ODJkeVdIMXQybUw1QzVsb3BGak12L1FHUEVu?=
 =?utf-8?B?dUpzTHhtT2hCMEYzRzQ4ZGgzRWhybWN5UWxUTTlPNXlUejc0M093SlJrR3Yz?=
 =?utf-8?B?QkpHVnNESjFmZ3JSUDlINEM5RzdGcUh6TGZKSmw4VWM4N0RaUG9hd1RsMEpx?=
 =?utf-8?B?djFncFpUN0VaM0gzSFRVTFppQUhuaXhCRXgxRUxZaTJuSXNNWVB2Wnh0cDZE?=
 =?utf-8?B?eUVDL3JyT1FaYjRNZG5jM3RRb3hHRFJxN2pXVUx5ZExXRmhNTFdkSE13SlR3?=
 =?utf-8?B?b3loeDR6NDRsenFNd0FGdXFjYWV6MmtvN25qdUVRbC9lSytpRTBQbCtubDcw?=
 =?utf-8?Q?/EEupr3n?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 14:44:09.4784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdfe98b-ab0e-476e-d350-08d8aff607a2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: an2+kvnidRnCNqy0mRaOSXht5VE0JindJwgdySTmE3Gopb0n+XlRjeuLv1LkjEhDDI/66HE94ddAcEpibkHBMVImpkKPGpEfJBBt80rCh5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5739
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

Hi All,


In our test platform, BMC boot up with NC-SI module is plugged and 
powered. NC-SI interface (eth0) is up and worked well.

Then the power of NC-SI module is power off. NC-SI driver can't detect 
this state.

BMC console keeps print:

[ 1780.411126] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!

[ 1785.579455] ftgmac100 1e660000.ethernet eth0: NCSI: No channel with 
link found, configuring channel 0

[ 1802.253375] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!

[ 1807.501456] ftgmac100 1e660000.ethernet eth0: NCSI: No channel with 
link found, configuring channel 0

Look at the ncs-manager.c code, it seems if a channel of NC-SI module is 
time out its' monitor_state will be disabled, the link will be down then 
the driver will go to next channel.

But if all of channels of NC-SI module are down. The driver will reset 
the monitor_state of all channels and check their states again.

Do we have any mechanism to detect power off state of NC-SI module?


How about hot plug NC-SI module?


Regards.

Thu Nguyen.






