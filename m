Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC42E1F09
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 16:59:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1HvD1tHczDqQT
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 02:59:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.120;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=v3eL4drt; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2120.outbound.protection.outlook.com [40.107.244.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1HtQ2XJYzDq8x
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 02:58:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlgkcJtIP9ufz26Z1Cc38APMRU4tp9kyspjeO7chT6ghdESUFCn+plKDm8f1upxMryVYki2JclYhAqenl8xhhHdPJW8RjN8asPYWjMVgFvbVNMhfLRmJnAy3QuLCPHKKcE4F57c3tBapFfli86Bl3uW3+RbdQkjss4v0vYjqBQ6UN6gsF2U2IF7h8mEoGX85zFUA7TgbCmvdfADhKaV6gNRFaxL092XeYo5hF2nhjQfTQ3BdB9s+LPziDUHVcczZIB0yJZghcAHl9U85dRU/X+BZz3PTTsmBz8ENiKlQV15x7OigIJjAgpThrVx0JKpnTBtyBAtAT1woPrr7maSaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4P1vlSQFF9uL9EM9did+lbl97YC9uugAUGZPJgVRUk=;
 b=CXXOB8WZG1YIBRpyfVOCWMDJKB+/Gs3Hz/A8JHRYUgidC4LBKI8F9sjauMA5opAQg5CDc5W21Ahr3kkBxT5GKkBa/IwxYvhmWj+uChfY4glKvzTTb7EkB+0B/G6d7bsx6PKfy8ubFKygOyMazpdb2+wwKrcwjQfnKBktkszlzvaQ5PO2r+tEKgb5go+KOWNwTOPdsbtNv+LmmpAsrHXXIaDDHHbJ9ZPFEEmCax9zW+WTgPp1FlHmh4vdH7AS4/dmyBklLfCuSXlqE/H//Oftg7YTIgigKU8B7wBiRRHKSY/wPYhfZUQU0enz9U1Pd+LBeA5On3JJMTq4yvFVcHqTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4P1vlSQFF9uL9EM9did+lbl97YC9uugAUGZPJgVRUk=;
 b=v3eL4drto8y4dd0xmw95hbuKUWGZLjGMGtZCU2SQL78UQjbF/xiQ+EQ1XWyzYOYbikSchk1mLhSg6ZxDRcJM+iYozSj/Z7+jspd22pYlRl5vu3aM+OOfpWZOtkCU0C+sS54wjuhc0AMf1zrRw1Gk/7V/VDbLSRRjRVxrUgxelmQ=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB3820.prod.exchangelabs.com (2603:10b6:5:91::11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Wed, 23 Dec 2020 15:58:12 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%6]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 15:58:12 +0000
To: openbmc@lists.ozlabs.org
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: Ipmid not work on eth1 when enable NCSI.
Message-ID: <2cd25ea6-f957-1536-cfb5-ba9aa2a31611@amperemail.onmicrosoft.com>
Date: Wed, 23 Dec 2020 22:58:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2402:800:6344:4074:6dc1:8edd:d928:e668]
X-ClientProxiedBy: HK0PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::32) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4074:6dc1:8edd:d928:e668]
 (2402:800:6344:4074:6dc1:8edd:d928:e668) by
 HK0PR01CA0068.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Wed, 23 Dec 2020 15:58:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e5b0db-c61a-4583-1907-08d8a75b8d65
X-MS-TrafficTypeDiagnostic: DM6PR01MB3820:
X-Microsoft-Antispam-PRVS: <DM6PR01MB382005D2B589AB45A00FC60090DE0@DM6PR01MB3820.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8zUJekI3uHfE/QYGdoPnrFbVXzW45DyM/vUCtgxHfpxPEivitNGdT8UWdHCecqvfXIlyVzPNXTnBEIKeA3HyEKQZktmXiJItBgafMIqeE/GtO0baaWK+vTdpeAO7jK37+62qcxRnjgyb/Od1zuC8CZCJ96V2vyY27jDmtm+9/3X3WJgHLY4lRPVMJLKXQ5iGlSj2JWeLXO4lvx5d3ktymwDSbKlmfRDIU/SnVPWVss66+5MVtyyoP0fnYhvCYjZmx9MuXZ13h3xcGDqn+ASNINJygtQ29bTSaYqkakQEBiB7FL/rZJYnjy2wP233YBaUnUrZr9Oq7Fu5JhtTjoiqkYTH/+CYddPGyXVOF4NFEpdlcjftc5nzOy+OxoCxM7BlfPynQ7jOoLTp1q/XJkcjJHX913SiwAD67uP4NDStEGuas38PDWMQ8Gx/R34cDw5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(376002)(366004)(396003)(136003)(31696002)(16526019)(66946007)(186003)(83380400001)(83170400001)(5660300002)(52116002)(8936002)(66476007)(6486002)(66556008)(42882007)(478600001)(2906002)(31686004)(6666004)(2616005)(316002)(6916009)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QnhydGorWDc3em90aDRUVFJkczZmSk5LcXBOMENCZjJCRmF4OUlQa3NpeS9Z?=
 =?utf-8?B?cS9MQnlJRW9xSGhjc21sQkxZSVN3R0dWZVU4T3ZpWEVCS2RHanBvQlY5bk5o?=
 =?utf-8?B?My9JaWoyVzBjYVF5bGQ2SW9ZdjE2M3N3Y2JvSnJ1WnRTbUtrUHQ4TTRSRXJ4?=
 =?utf-8?B?d3hhWEJESnNLNUx2STdYL1hoRHZFQ2RJRThQRklWTVlGU29mYkpoSWczQ1Ni?=
 =?utf-8?B?VnVWUFgzLzdyTHRLdkgwUjlQR0E0aDlpcXlVZlNrZkF2VlFEZ3BqcGhNOURa?=
 =?utf-8?B?MHdqSWFESlRMdkhUYjk2c2VnTWRuMmwxUG9SQzlSUHQ2Qy9JR0FnT2ZpZkZM?=
 =?utf-8?B?M0E4ZmVpVjFGVXJtbGxleCtqdWNzM0NOQVU0VCttOFNGRmVSUEJiNlRXYWsr?=
 =?utf-8?B?TEJhQTVXKzB2aHNqbG1DUlJYYzBSK1FzejBlODk4RjJTQzRYNDlwYmZIc3li?=
 =?utf-8?B?REpZMDUvQ04rbm15aThpZ0xFQWZ1VE9QaFBCeGZLZ3RzWkxMZm5QKzFHYk1z?=
 =?utf-8?B?TllwUHFYeWl5TXpEZk5CdUR4c2QwNW0rTHo4Sys2eXZjT0dKS3ZvRVZTWFRx?=
 =?utf-8?B?YWVxV0tvNUs1bzFSWjlFWkRFdGU1L29tTjd6T0pheUVaRmtVbUgxV25wdkE2?=
 =?utf-8?B?c25EVHdyd01qYmJtVWk3R0kvZUt3L2pLRE5KS2xLM3RWTlhydkJ1N3kwdXRQ?=
 =?utf-8?B?TUVGSmVZOEZZaTNNdklXTTBxY2NMZWE4ZHFrUGY2U2drQzNxMWdJajZTdUZj?=
 =?utf-8?B?L1JvQ3dsc0NjaVdKTEhuS3c3UWVUQUNJWFErMG95OXN6dmNhbkdVYjY0RzNz?=
 =?utf-8?B?MmVDS3dGeGFKeEJUNHJxcEszQWtZS0ViWTUyZW8yQS9NaXdCOUlOQ3dHdG9r?=
 =?utf-8?B?Z3duVFFxTWZ6ek9uV3NTQ3ZRUU1reDlzUWFKbmo5Y2tDUGFRRUlPUlkzTzJX?=
 =?utf-8?B?QzBlcTE1NXdleE11UThNV3JDTEs4T2NteHM0QXRtaC9MNHhGZDlBQk0rZXJX?=
 =?utf-8?B?dVZKbXlOcXhPYm9Wazl3TEpVbHMvV09UbUlPSEx2NjhOWmxxK1JIcmFaSTc3?=
 =?utf-8?B?eFFnZnRLTkdEV3I4SXpQc1U2YXY1QmF5c2QzVnhYL0Jvd1pLeXdaWlpHdVA1?=
 =?utf-8?B?RVgvc1VNdW1QYTVoQ0tLYzBjcVRWOEVhMnZFLzFwWEZuM0swQTVJSkpocFdG?=
 =?utf-8?B?c3crQjdSQTQ2S2JDWWYrTWxnaHBhWENvZFZlOHhNOEEvRmp5Tit6VFNaeGtE?=
 =?utf-8?B?Ry9rZUROY1ZYYnhGSThwUC9pQWR1TlpGZnNrVzZxbEVMTGx6NzFVcDBpRm5O?=
 =?utf-8?B?L05seERjQjYydTJhM2xaYmdhd3RId3JmeUEvMDdVUE9hbVRvd0Q5WWxiQ2NJ?=
 =?utf-8?B?a2NCRGowR3gyQUhsUzdVbnNCc01rZVNOTXkvSE81TjVSbVVZVThoc01RQldJ?=
 =?utf-8?Q?mn9+e8eW?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 15:58:12.8271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e5b0db-c61a-4583-1907-08d8a75b8d65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feP+AlMXT8gXifWoHl8QP3mUPjHBVPcXLNcAo8X6J+hRvicqHwLvwusHWnIPYEJgVGhHJ8i/RthGrodbmW6gC1hMzqfCJzBfJ/sAxUy/3OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3820
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


I'm verifying NCSI with my Mt.Jade platform.

In Mt.Jade platform, we have the shared NIC in eth0 interface and 
dedicated RGMII in eth1 interface.

I used below steps to enable NC-SI in Mt.Jade.

1. Add definition in DTS for MAC0:

&mac0 {
       status = "disabled";
       status = "okay";
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_rmii1_default>;
       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
                <&syscon ASPEED_CLK_MAC1RCLK>;
       clock-names = "MACCLK", "RCLK";
       use-ncsi;
};

2. Add build configure to enable OEM Command to get MAC for NCSI.

CONFIG_NCSI_OEM_CMD_GET_MAC=y

After these steps, My system can detect OCP card, can get MACs and both 
eth0 and eth1 interfaces are up.

I can access BMC Web use both ip of eth0 or eth1. The same for Redfish.

BUT I can only use ipmitool with eth0. Ipmitool command not work with 
eth1 interface.


Check the setting of phosphor-ipmid-net in

meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_access.json

meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json

I can see that ipmid is configured to listen on both interface eth0 and 
eth1.

Do I miss any configuration here?


Check the journal log, I saw some errors and warning from NCSI:

Dec 23 10:14:50 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: 
Handler for packet type 0x82 returned -19

Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: 
'bad' packet ignored for type 0x8b
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: 
'bad' packet ignored for type 0x8b
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: 
'bad' packet ignored for type 0x8b
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: 
'bad' packet ignored for type 0x8b

Because NC-SI interface is up, so I just ignore these errors.


Regards.

Thu Nguyen.



