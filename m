Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBC72DBC6D
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 09:03:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwnhC22RhzDqLH
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 19:03:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.118;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=y7agXZaj; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2118.outbound.protection.outlook.com [40.107.243.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwngW10MGzDqCG
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 19:03:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRxjq+JfNPeJlXjZtqNPiBB8TEk2/CzRW7B+kXfy+sAqkrmfi42KRqO9lM8sKjLSHfLKJofaKZ2rCytBUrQQvhUTOqanSW2lc3nhk/YL4HioI+yTo7IXv7N7JQPXk/NNqzOh7vZILGmwwpzfi/LYuHWtyZLmV8AvhhHCJXJWzNs7hLULPwzKJJ37awDQwrhLJ9jjqJzwk5eBdIW25nA0OqOGe9g6cpPf+3knQHAuxrK8LZRgYVzOG8JLsRJ4OQMgaogSW9TDI+VGFenW+xFOdOLp0O5RYJZiT8GaAzrIa/mbYDoSklsRzN75tVorls9D97kLRVwOjiAAg8qVoWwoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFb+5J/3mFKb8XdMLHKHxJTHp5UsIBHernZOO7ONi5o=;
 b=TK7u2LkYI8WqCi8iePt8qsSkViWXJjGYz++arPX1wpB0gKxPP9h54qW7oLItUOdZLtx886F1zXpJdxBK1IfaetnFi94C32KkN/CBvPxSv3xqtqNRiny6Hcd3Wt5ous5SflIGbUO4ln+WmUZqx1N483rSvGJ25tPMgorsukijbt9pJvTHK4NbVWjmMTEyUkm99SKfI2ktuTbSXkjz89t/63vaKAq8mrln+CHLfS7K7stmv7p+mF2iDhbircPEnGmwIWrjshD/IT+JxBK16dFiGytQsKp+YscWBPiT/oa/MOXtL9eTIC8iFQCO1FpLVcNXpn2JhryWaU9kPbUqHz1fKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFb+5J/3mFKb8XdMLHKHxJTHp5UsIBHernZOO7ONi5o=;
 b=y7agXZajed9kKToVkUCkkdUduOi7MPrRxhdnVmnaNyUojnurMw1mJMeVIQ7eiR6W7tr2es6F8r3cR6LAxzMUfsOeR3fVdpV1HEL6l5iZb2wq9rlWdzahZQ/kthgknpxKaCwzYqd/Xvmj9Nf9F9GL0StYwrzLvp8U1qUZJpoxqqg=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR0102MB3349.prod.exchangelabs.com (2603:10b6:4:9f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Wed, 16 Dec 2020 08:03:08 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::c930:8fc9:847b:7f3e%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 08:03:08 +0000
To: openbmc@lists.ozlabs.org
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: phosphor-hwmon + phosphor-fan: Fan functional properties are
 mismatched when unplug fan
Message-ID: <117d107d-236d-d361-7188-42065baaa656@amperemail.onmicrosoft.com>
Date: Wed, 16 Dec 2020 15:03:01 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.175] (118.69.219.201) by
 HK2PR0401CA0022.apcprd04.prod.outlook.com (2603:1096:202:2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 08:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ce6db61-8061-49d5-4b47-08d8a19906d1
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3349:
X-Microsoft-Antispam-PRVS: <DM5PR0102MB334989D47AF9F2405F8264AF90C50@DM5PR0102MB3349.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQ1JUs1v7dD/4I3ZAZq9BxSvlrUlzCWlgJkPj9gdx6NUymqywCJe27LDlb5kwZmwQxePDjXEaqNklJmP4gbpwimE3C00V0ZjMPVhs2CMRxo5PAu+GYqWywEjLI6TP1gLjFNYXnY5zFrt0WL96HzwNlWs6Z0+4tg+1beKspU2GvZ9xlhNN32ZdPRivYpU+CTpnS61SCztk3jxqrZxaLd5z7JA0OLeAI+wqJEC9bkW1ugrN7HqnEgiNa2z5jqJtp8Gxu6PXNsj/bSNSGvcJ4EAsBs5jzju1mBhvyGsl3jd59Tue0hlfKaM5O9rF1XVbZ5BiWpVSBm+rhT0uOGA2a+pGspoO+AWYbuA5mKcvda5cfbPZRUaSu/TtvlAhO2OywnJLGaVzFQhZGcsBADYP7m2HOfzrkEX3b6hatfzHQBD3ys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39850400004)(6666004)(186003)(83170400001)(83380400001)(5660300002)(31686004)(6916009)(26005)(19627235002)(66476007)(42882007)(956004)(2906002)(66556008)(66946007)(316002)(16576012)(6486002)(31696002)(2616005)(478600001)(52116002)(8936002)(8676002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RndWVGJkM3Fid1NoQ01MV0haYWhHMGFpVjdCTFZwYVhmeTg5RnM3SmdmU2Fw?=
 =?utf-8?B?aWp6U3dVbXZSakFSQ2VkaGxLOHFkcVdObFd4STBkcWtOK3AzSHlyZk5wN1hE?=
 =?utf-8?B?bzRicXlHdU9UcEkyZjdPUHltWDdOMnNuU1RtQXFJQ3pZZzV6ZW1GQm5sZWYz?=
 =?utf-8?B?MmErbU5NSW8yUTVKNk4wNEJZZDZwL0orOVB4dHdRaS9IV0J3aklCU0R3VFJ6?=
 =?utf-8?B?blBVU0IzdFNhcGxKWnd5V2Q0dkhHdkphbWt1dWRlL2Qxak5iN0c4Z3RHck4y?=
 =?utf-8?B?ZW8rODV3b1lrWG1jaG5IQ0JkdWpMRlhJVEpyTjBiMUNMOVpiMjQwQU9aeVJ4?=
 =?utf-8?B?YW1Ld2tVSyt0N0hIMGdTRTN4SmxGbyswOFhJOEo5OGVtekhMdEc5NVBrbWNU?=
 =?utf-8?B?SWhpT0thdDRTNGhwRVJPSzd4NVlZNFlubFcrRjVEREZrbjA3S2UwWEhwdElw?=
 =?utf-8?B?QmxSTTEwZFI1enY3NHI0M1lFUDVZaVhSejNjZkJ3SFd1R3FrK3NaNUl4Wm1r?=
 =?utf-8?B?NmlIVjN1KzI3R2dGaXcxMHorQmdZYk1hL01TUkFrSW13bWZkUXBiT05pRVVt?=
 =?utf-8?B?VGFkMXdnM2NDcksvV3M3RDNJNWF4NTZLU2NoYU9Mc3FDK2haV2xFSlQzNWdE?=
 =?utf-8?B?ekRBUi82L0Yyc3d0VmlvQXEyVlRzSU04YVIwOXY1R1RWaDdtM082WFBOZ00z?=
 =?utf-8?B?Ti94QXN3cWtKMjlPblRISHBsSEpPOVZLNkxFajh6bzJzWVFVVENybktHakZY?=
 =?utf-8?B?am9DalRwRWZGWEtVSzRHclpJMUFRb0dtRkx1N3pWbFoyMkE3clBtNTNvMnZB?=
 =?utf-8?B?SlJ2ZjJwMGNaUnExTzlIYU82VHRBdlBPc1ZKb0dnSDBCQWNQYmFpQ2dCNjdE?=
 =?utf-8?B?aDloeElQZXVmUEN6UXF2QTFHQXJJSUxkZ29wNHRkdzJWd0xZcmpNakhFSURD?=
 =?utf-8?B?OStDRWdESmtPWWdOaE5mOTFYNVNoKzdpUVlNc0R5UWw3SkJ4TzNTSUtpZGR0?=
 =?utf-8?B?bE05WkMzYWpiWXU2MXJHR1lHRGo4MUtmdUdUVHM1ZDFlTE05OWMrR1hHTi9V?=
 =?utf-8?B?V2FKNmZTTXBMQ0FLTkp1L3Q1Y1BmUlprcTZOL2o2VUV4Y0hIWnp0K25Hd3ph?=
 =?utf-8?B?eFhLcEJhYUxVMHBGSUFXMmlUTC9qei9ZekxETFlRcFdBTXZMY2FGaVpLdTJO?=
 =?utf-8?B?ZGJpN1VFQVAxS2wwMTFnM2hOS3EreUdJZzRCSDhSak9JVlpzSjNCc2tBZmVG?=
 =?utf-8?B?Qm81dnJtNFdSZmdkWUxZZ1had0hJY01kaVpUKzZyNkE5aTJ5R2k3R2NEY0I4?=
 =?utf-8?Q?kjhZsSiFRJWW3x6+WjjBzv513sKGCLlz40?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 08:03:08.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce6db61-8061-49d5-4b47-08d8a19906d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf0WI5kgt4pZcjrTdAhh0nV3pK97OF8q0kCMGeOsy5r7Gm3opVY2ScV67WUJI6oSMNFxJAW551WicTHc4fQYL+GKwGy4JZL8Z6nIt3+0B5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3349
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


In the current code of phosphor-hwmon, when flag 
--enable-update-functional-on-fail is set. The fan functional DBus 
property in sensors interface will be set to false when unplug fans 
(FAN4_2).

~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b false

AND the fan Value properties will keep the latest reading value before 
unplug.

~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN4_2 
xyz.openbmc_project.Sensor.Value Value

d 4794

~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
/xyz/openbmc_project/sensors/fan_tach/FAN4_2 
xyz.openbmc_project.Sensor.Value Value
d 4794

This cause phosphor-fan-monitor failed to detect the fan failure so the 
fan functional are wrong.

busctl get-property xyz.openbmc_project.Inventory.Manager 
/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
xyz.openbmc_project.State.Decorator.OperationalStatus Functional
b true

Should phosphor-hwmon keep updating the fan value Dbus properties with 
error code when the fans is nonfunctional? Or phosphor-fan-monitor 
should also check the fan functional in sensor interface to update fan 
functional in inventory interface?


Regards.

Thu Nguyen.



