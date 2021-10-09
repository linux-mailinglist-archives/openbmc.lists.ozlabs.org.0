Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7B427993
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 13:48:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRNc04CMdz2xYX
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 22:48:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=dIzSLQ3O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.90;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=dIzSLQ3O; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2090.outbound.protection.outlook.com [40.107.95.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRNbV1lSkz2yQ3
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 22:47:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTeMVYktNbEFhKG5HLdik4m10Svg1MqjwhRtmW9T5SuBCW1dGlbcg4ACCJkixRbxazeqchP0HoTNmIwsIpjswnwPwojiYrI799FqQFCaW325cuK+hq5Q0yqk8i9208gE81YK030Wp2gwCrLzTS6AjdZitnRswyoEW8305uLZTCIRZOQ7nT0dkcuL2HJnWb96VNCFYijdbyA5PIXt596EmcHHtYS/DfOWbrTySdKDtrujzNexqFRz5o9tbtQazHV/kKnHMxnjFs2PK7uaxfXhQV8V+zEtJ+IvdRiX5rdcOG4s1+D1r82hLCW7IRrZNij2uZZ/Ri5jSjo7nziYf/yJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SFAEnKfJKZXxTXZfCtngNq5GCmucJUs23fCa7IT6CI=;
 b=lyGMDS/m8bI8ptHyOiU6PzCDbs/Wqv09ZYK6BgGnwbqwIUUy0fmbGFIkwWdFEuV7G8MVQgZ4c5VYZpFaF33KmMm69wEI/yiTMw7WWyTyGEzXdgcc9FZke7BLcoBLfRYb0o/Qzs+SHI1Wk9McKW79SH7LX7ccrDlqf/VVB9Zhcrke0tEbYOCimx4nQ5MF/nHbP7bw5v0IjqdsGyMew00dcupZF+diWXdApclHZO7taR7210ktjRkUm6rMQTBcC5dRRzizbcU2PpiowqTjj42O8FBpC8yNSUbca4MHh6VLO2Q09JdeWfWW7D8dQNreMAi2PQk9ZTYg+Z08RavDynNrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SFAEnKfJKZXxTXZfCtngNq5GCmucJUs23fCa7IT6CI=;
 b=dIzSLQ3OrHgn35xaWhoK0SoEg3vjfmQBUhoCrQ2Y4y/iwa50iC7fyTNH9kqDaO05BGQbW466f8TUsxph2oCugRzkfZACGjRupTirhNY/K8DiSht/JBn6PYm0yx7flNzcHwWBuXEXYKwthHM1o9OcxnEM4jFlt6EWIzN1keJIIcY=
Authentication-Results: inspur.com; dkim=none (message not signed)
 header.d=none;inspur.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR01MB2796.prod.exchangelabs.com (2603:10b6:3:f5::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Sat, 9 Oct 2021 11:47:40 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com ([fe80::fb:2dbc:70b7:30f0])
 by DM6PR01MB5145.prod.exchangelabs.com ([fe80::fb:2dbc:70b7:30f0%4])
 with mapi id 15.20.4587.025; Sat, 9 Oct 2021 11:47:39 +0000
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 liuxiwei@inspur.com, duanzhijia01@inspur.com
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: Softoff features in PLDM lib.
Message-ID: <702956f7-e667-8fd5-ed8c-4ddafbe67ccd@amperemail.onmicrosoft.com>
Date: Sat, 9 Oct 2021 18:47:29 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16)
MIME-Version: 1.0
Received: from [IPv6:2402:800:6344:422a:695b:6951:bf8c:cae7]
 (2402:800:6344:422a:695b:6951:bf8c:cae7) by
 SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.1 via Frontend Transport; Sat, 9 Oct 2021 11:47:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b193447-5214-4054-dd9c-08d98b1a988b
X-MS-TrafficTypeDiagnostic: DM5PR01MB2796:
X-Microsoft-Antispam-PRVS: <DM5PR01MB27967EFFBB67BF4C0194B4AA90B39@DM5PR01MB2796.prod.exchangelabs.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcSwepw7dWM4REGwRx+LPEwNl5m10ow4ilwNxu635WiOPLSDJbL7ZAjF7q2xWt2C+rD6ojHUsMVU1Dyw3z9sXWgP+s+puMRPlKSyr0rWfSLcjv2MQvMTjcSOQh9/4LN6G9eDVhd9tY/SaLijNijdxGLqlSD/4aFZtO640lpgTgDoKOnkdHZMcriK+ClFzwk0dk5KnvIl1jxe2o2t3Arnx1vmsm1r7qTnRGOPM2PIqp1jDMHIjUynJ/+v0adQ/OHALcAid0NRJVVRQpd3V+OQl2YcBHKZizSbb9M9RcGu3UAGrUOCcmarTWIkGFXlUiob33rKvO/Is1fwqOrtjcSbHgtgtUsxtoDewaltkMxlDg2JAQEIXj24+ogFbGI4LOYVNfh+pEFmrxm4RmJ/zyx8BcoUXrDRVy6ph2m7nVNIEeQMfkWL+uwrH6SxYw2y9K8Xnkeo8QZSt9subEdUTWQTAmCHEDIt1MuDiA4mqgqo+1ho9xbKuFOlpRXMHIx+Ex88n42tTQf/mAsLz5mmPLT5MJU1kjyAhaSijvyBvOctPDppuBkwgST2hzNPJ/UEgFBuUsHxv7v/Lt71D6afBMqSWvWli0g6CuFm6t18xLkuYQX6JPgU8iVRoEacZIAimlgI3DDCr6t1JXA6MS05aSh9PCDR96YQ43tVRDR00Xxelyn6fmXGl4OJTZ8PwDJwgCqUCajEZmq5Q4WawdVyWisKdyQDIPiEee9X+7/1fuIhjBzGGw7FYBjdHAROg+TN1fd89klIT7qS09SrlW7K5d+QCAa6MZ5qDzx1iNEYfYp/tPyjhep1/e2MZY5gX+5XV+zl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(2906002)(2616005)(66946007)(66476007)(83380400001)(66556008)(31696002)(186003)(5660300002)(38100700002)(83170400001)(6666004)(31686004)(4744005)(508600001)(8936002)(52116002)(316002)(42882007)(966005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JtaXJzSFk4K2lkeGJMSXJ1YjJ2NnNPdzZLamwyRFpIUCtwaEYyYytVMHNC?=
 =?utf-8?B?T0JtcDdLVEV0OU5vcFR0ZmhwTnhJaE0rZTVzNU43SjV5SVVHSDFkOEp1QUpN?=
 =?utf-8?B?TnlsTzQ0RGJyMEtGVnc5V21lazZ5MUNMblROZE8xbnZvMGMzZDdSa21OWnBu?=
 =?utf-8?B?UEtVbGQ0Nm4vZjVvRCtlWHhCODNoWFNGdGgxUlJlNXZyVGkrcFc2RGhtMkU1?=
 =?utf-8?B?aWl5SjNEQVdwQ0hkZGlmRCtSaDEzYzFGeTdKUTgvSkwzNC9qcXhTbWVhRmpL?=
 =?utf-8?B?a3VnT1BQWlo5MHEvSWlqM2RXODBTZUZPOThBeEdFNkNib25wZTFXWHR1b0xF?=
 =?utf-8?B?UnNmelNZV3JrLzFkc1JRNzV0ZFVSQVVxV3ljZFRoYzNUVGVvVlo1aWlHMVFj?=
 =?utf-8?B?QkEwaHZLN3JLK253bnBGSCtnbGY5UHhxckkyY0FvKzlZMGRISkl2bjh0b21O?=
 =?utf-8?B?SmZ6TE1BbEhKc3hZNkkzQm4wYlZOM0tTam9NcmNhc1dMdkZ3LzZreTludUxQ?=
 =?utf-8?B?Skt4SHFpY3l1MldFYzgxMkMrb1laOFoyQm1wa1pRUFdGU1p0eXZ2dlVlMWM0?=
 =?utf-8?B?T0tUSkhpbzE5US95YzczWW5VYzlBUktYdGg5SHI5QlF5WGt5empPVHhmWWpa?=
 =?utf-8?B?YVFuRC96QkZJdXhLSU1JTDZ2bzR5M01pNHM5RGpxM1pla1pGYTJzU085ZjZM?=
 =?utf-8?B?SVRPRGU4YmQwejh4aGYySEJUWUFGdUhLUGJDSHlUNU1yVWg3a0VOT24yZ3BO?=
 =?utf-8?B?NnFiK3d1RU83bGc3VUx4Q0cwb1NneFk4ejNvckNuQXNjWERLcEFEenkyM1NS?=
 =?utf-8?B?RDhrZEVsSDVtYnA1Zk5oN0dwU080eXFtd2dZc2lWbmRPQmJZNTdwWXV3V0t2?=
 =?utf-8?B?cnZDWC8rYjBsRHNTOXpHQ1BKRzFLeWZKaTluQ1F5dkdEK3NQaVpDRTUwb3Ew?=
 =?utf-8?B?UzQ0MFpEWUt1ZEtTeUg1WjdYcFJ2SFg4bk1HZWkzejJEQ09TQlQ1RVpaaGtX?=
 =?utf-8?B?S0FjUkJ6bFBTYWxwSUx6OTA5ckFCeVdyVGhXcXB0cmozKzN2QUdsRmxzcFU1?=
 =?utf-8?B?eElGUE1iWG42Mnc1MDVGcldEMnhjOUVvazlzWVdBcDVINjB3V1cwRUdNRTd6?=
 =?utf-8?B?WHg2TUtlVEMrRytzbkpoWXVKQVludTl4MHpIZ2NOQjVQc1NjVGhvRTAyQ2VI?=
 =?utf-8?B?cGJ6Wkd0dVFEblJvYWNOaW14WkFPOWNCVXQ2bnZZTkpmMENEdXV0d2FWNHNl?=
 =?utf-8?B?bmYyZFAwQzZPVXE2clI2TjF2bi9xWEpVRWxNajhmYXdCVzUrN05RQk56N01n?=
 =?utf-8?B?WWUwR3oydWZIa0w4dUJxbVorWnh1d1dRQmcwakZNaURhaHpsbEJ5eE9HeEM0?=
 =?utf-8?B?WXQ5MGZFRGkveGNCYTlGb1dyNmNhZ3VoalhpeUoyY29sNjNucHZ2WlRhOFJs?=
 =?utf-8?B?VUkyaEorRlF5N0E5VkFLcHQxc0psTmNJeXJMZHdXQTQyQmZpWk5KTnYyYVQy?=
 =?utf-8?B?dkdPNDV1bmtwQmpTRHdEa3JyZDZMbmxVbjdqemVOY1UxbzRUVno3UkN1clJ5?=
 =?utf-8?B?NDFXWHpDWml2cnM3c011a01mS3VXQWN2QlVabnNqNTRyZmZIZ0RVRmpDc1FT?=
 =?utf-8?B?VnlyUFNYZnpzWHd5Z2dZRCsyLzF2R0pOTk1rVGxkVXgvNFNFK1JjbmlRdWV4?=
 =?utf-8?B?M0lMKy9jVERHT1NXZW1wdHhlZi9NQUhGcWNJNXlJNCtlQzlOOWtoaVBETkpT?=
 =?utf-8?B?K0RoYnZXZGtPM2JIWm5wbmNSaGhXbWdnWnVidVNYU0hYVkNhRjNKVUw5SW9P?=
 =?utf-8?B?V0I1THNhVXNNaXNoWVo2dE9FL0d2QXJrZHhSR2RwUENGeGQ1RUdJMThxUGVn?=
 =?utf-8?Q?llK3G8Z0eeuGk?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b193447-5214-4054-dd9c-08d98b1a988b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 11:47:39.6028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyZGqOvopkO+moDlIepckQM2j0i8lxIvnU3H3l4CVi9KB2F68EXZiIznwYi819hJxbvOUkGmoaiLOun6W+EYlGY8/kG9m/oKgGVfjBF9dqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2796
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

Dear Chicago Duan and George Liu,


In PLDM source, I saw that Inspur supported graceful shutdown the host 
OS thru PLDM commands.

https://github.com/openbmc/pldm/commit/184f60263a0e4c3dda934d94ecb2a904ef835299#diff-59fd39a9594f6d6f82af25037f211858fafa418aacc055e85b4cc29abccf9dee

The feature used PLDM Platform SetEffecterState command to request the 
host OS shutdown.

I wonder which part in the host software will response for this PLDM 
request?

Does the host OS ( Centos, Ubuntu...) directly handle this type of command?


Thanks.

Thu Nguyen.



