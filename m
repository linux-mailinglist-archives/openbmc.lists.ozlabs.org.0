Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E428372859
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 11:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZFYH25MQz300c
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 19:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=fFViZiQW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.95;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=fFViZiQW; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2095.outbound.protection.outlook.com [40.107.92.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZFXx6fCYz2xZM
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 19:53:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDSxslLPTuh2ZoL7xTdra2YFRMTbVICocts/Lj9F0AmnJJ1iMtWK5YoPThBtD3vCLdd3YggqZt7LIFcpx7sPHtSZNZxx5l7sKy3qm7Xeds0QNgU+p1PA4gVPC8BRTVgwKMgJ987aSpXbcm5Ly7S/fgHEzf7gbB1HkzgXq5nP3yfS/MPzgzILdBGSd8ylUm42bH8c29FSou00alT7SQQawipSCSd1J2QBPqjcn4K18G3Vdpc3oQngKooQ4dt87VbLqCwZ+NvnSZRN6cezE7BiE7etus1w7iTGf4cTXqAnSW6B67+Pig8kF044qQYoRl3BvHSgWlueRB/HxfMioMYs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFOYT8GnDMQx83XyKTktLACmRrOFsuoD4CPadfSf3JU=;
 b=MK1whbYHVwu+PQV9f535UrxlnO8YbYjJ1BHCwpChLttJSAn4tltnZ5QWsHnaHak3KnYWFkK+ccSEr4MaLg29ux3nXpo8jZ0zVaqPPt7dbNCUqD/BjgFmMe8w+BykcmInRgOrzIlGlVV6t+8bbMeApZYBQIZmVkqb8ZDzqKSD2XDNKvFfT44FoZvaTxIkK9R9p8+bZHMEFlxy5WSX2DZzBxk1pzfUe9QUQ+6JXXGcXgJUOwiFbMs05tUtKaY6hWutmQVoaCoDnnW1GYFfwfQwCoZmnSrh9CpSxmOp/x65daaqsaO3AL8cqSX9apQ7jW0yidTnqvez0cbpVcWlm0V2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFOYT8GnDMQx83XyKTktLACmRrOFsuoD4CPadfSf3JU=;
 b=fFViZiQWaZtj0yYy8P/9V6j9xtY9OjoML/ikxazdlDWCqwTDgDMP+1Bi6AT0GSjbYk9/lOQ396iO84kouwO9gSOmcRGikZr9UQ0RDTNo7fsf4cw+jB+1l5TfVF5MCB/o4zEcxp5Z6+f/BHC12jC8VtMJ9eSSk6xdGtUHj9sYBco=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY5PR01MB5828.prod.exchangelabs.com (2603:10b6:a03:1c1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24; Tue, 4 May 2021 09:53:43 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4065.037; Tue, 4 May 2021
 09:53:43 +0000
From: Thang Nguyen <thang@os.amperecomputing.com>
Subject: How to add Redfish EventLog using commands
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <11e4ee9d-d19c-dd79-aedd-8104a7ad081b@os.amperecomputing.com>
Date: Tue, 4 May 2021 16:53:37 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.53.112.237]
X-ClientProxiedBy: CY4PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:903:c6::15) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.53.112.237) by
 CY4PR04CA0029.namprd04.prod.outlook.com (2603:10b6:903:c6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:53:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3289cc46-f490-4059-d190-08d90ee280a8
X-MS-TrafficTypeDiagnostic: BY5PR01MB5828:
X-Microsoft-Antispam-PRVS: <BY5PR01MB5828CA64168DCF01B07A10DA8D5A9@BY5PR01MB5828.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syLzWABNrTjgrmoBgwfAA+Bth29wVdUu2eS9ty8QcFpRFBrSfrlHW3DI+evIz0MX3YbwlHV2uDPVHhKN8M49hb3Lie6HC3g0QBp4jSQt4/6PBqRFnus9axCwIr83ZyO4vadRG9Z4v/xEAD3os3whFHiQT4hztusvSpm6Hlh6HUdFFhDs2lfIg6hcGbwSuisD0juM7CNun03BXDBElq/nSfnV78yRgdhF+6C2Jvi30639uTDcL4Y4bpq796fmcdZRxh3GELdBk5nnfC6S59QgekxlaFuOCf87HEJQqhMqgGOOL4ymKn+dB3pcBavy7xVzG7T3oDYvfgaR0q3+8OnPknPJyq2tfc+SAb1HKrdDfEa3beDpH3RVAm0Q7bvaWrJia9Qt2vR4lUYmsZPf/bI38wnTs8mKlGPbZ/k/22V/ZJLgb6+JEK5Fn5IEmdclktFtgsZHLvYvbgHkLR0QYD329ZdxzFwZ88+cmFdUq8wIwjG5/SCCgXc7GszenWRAnQbLP/OF78UvXb3LsynPvsI/xUsqPwt1oRz4tDIa6XMQwCWZd06q4HGP8vVdJZ5ZWg2QnEGHztSVgqtSf1ZG9YlRvuldKnzgPDIBv4wdUYPL4l9q79Ix6rKsd/0N+DSoNCF+yMIw/bhUxjaOgk9d8TE07Stf6c8smEnSf9oFMky+7gBroR8BK/IC+YBkqIfg5Zue5BdCR3YGUQu7y0UJN35ZSixAlrl7cTHwPZhlMZJe7Q+RmPxRPwEx2a4EyMx8jZDWDP6R6SEgckGSXX2lqKuMetACIpuKmxmTAnGD9RR4dpzsV+YHTQHZqXWJf3cQoMGkK2djG8uSmcaSoPc4RBUMVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39830400003)(346002)(6916009)(26005)(316002)(956004)(8676002)(86362001)(2616005)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(2906002)(52116002)(186003)(16526019)(6486002)(6506007)(31696002)(31686004)(8936002)(66946007)(478600001)(66476007)(66556008)(5660300002)(36456004)(42976004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3I1cWlNMDB5MWRJa3FvUHNKNmh5Q2hickIyNlNWRmRldXd2VlltbnMwVUtQ?=
 =?utf-8?B?QzVxUWNiclBtWlhuTGgzaGMwTy9HTDV3RFY5OXRvOTlEVTJWZ3ZTUUpGdm42?=
 =?utf-8?B?clNUbkRsY1IxRkgwSFFxMTJDdlNQUGxEL1hyWWdDeUk3bDY4L3hheFFDbk9R?=
 =?utf-8?B?RVJ5KzZMdXJXenNxOUVmSytUTjB0YlNuQTVVbWV1NFEvZ1dSYThJc1Fya3gx?=
 =?utf-8?B?OUhycHAzd0xHcm5XazVzbk1ReHJIckxLcGxGZ0p1c3k1Mm9FOG5Dd0dWYmtu?=
 =?utf-8?B?N1ZFM2ttTk55NjB6blNDdlYyZ1pubTdITkZKa2R4S2g0bEMwZGpwZEhaZndK?=
 =?utf-8?B?WGlweTNtNTU2a2Jjb3ZsbTN6VHlsNS9rMEpWMmVwWUMwYitQcWVScWpBN0Vi?=
 =?utf-8?B?eDhNRng3M2ZDd25PS2FyNUg4RjZvOGFmWjNUQzBxcnBjZlVPM1UveUlMYlIx?=
 =?utf-8?B?cHFDaU9CYVRYL0tjajh4WkNIMkFaRUk4ei9UVlUwR00zS3ZZVlRXREYxNVp5?=
 =?utf-8?B?MXpqdzkzekJ2MzJhdU1SbWdGMU5kZ1NyUWRaWWNLV2N0Mk5hZHd5S2pzc2hy?=
 =?utf-8?B?OUNXM25sbGRsMWV6alJDM3M5K28yZ2kzV2k4QnltVDlybFBLRU5uNGdZUTN5?=
 =?utf-8?B?M05nK21jamRzOW43d0Z3ZVR5cXRqNlMyNmpuWU02YlFRRzZWMGlXQ2FuaHUw?=
 =?utf-8?B?S0ZPZ3lERTV4QlcxVCtoS3NFaG4wenRKUHZiYk54SUErZ0ZCSC90Z3RNS2NO?=
 =?utf-8?B?dHc5NVdnZFRSVWpRUis4bTM4WFNiYndTcnBKTzhTZW9NOXgrMngwZmdTcEdO?=
 =?utf-8?B?emp3aUFLUDNSa3ExT0tRYTQxblFIQWNJTFBYZjZlREtpdWMvK1dOeG0rNVE3?=
 =?utf-8?B?RllyVWVHNGxKU2tnNEpGYVVXbzkwUTRudVlFSXhxamU4SGF0Y0hzaHRPbnN6?=
 =?utf-8?B?U09UMjNBL1lEdGFteVd2UWRMQllvNCtNOFFUOGYyWmRFYWJzOEZHZm9KclVq?=
 =?utf-8?B?aDhOdk5sT0VIdGVTYzF6R2h4NGEzTXJHRytpTmZSYWI4NVE4b2loNHhaajF6?=
 =?utf-8?B?ZWJnZy91Ky83eStUczd4VkE5NG1TZDdqMWFob0VhVVJ3bkxXLy9FSGxhU2JE?=
 =?utf-8?B?MEoybENGZDIwS0JCTDZDMjZaSVBndFNKNTNucllpc1NuS3M0ejFNdGYwY0tQ?=
 =?utf-8?B?ZFZLcmFnTFpndVBrK2wvNStYSHpHS0RWUm16NUFEY3pKenMwRkptZEUxZG1Y?=
 =?utf-8?B?UTlHc2hLVUJNVGhtL3daYlZkZm5kOS9vZ0dTYTlXRkw2NWkvVHNQTTVFVVk5?=
 =?utf-8?B?amZJQnBFWEpiQUxNVS9jbTJpbW5Da3JPU1NkakVDTnlSOHNTTDY2RnBwVE5H?=
 =?utf-8?B?U3lPbkl5NW5VdVN6RkRienlmQmRTMHF3TlZuVS9mNjdkbUhjYkIvRzY3WVUw?=
 =?utf-8?B?RC9Ed0F4WUdveGVGeSsrcE9oSVllVDBYeGFaRlgzVWZVVEoxcXBlNXRWK2R2?=
 =?utf-8?B?UG9pMG5ac2RYY3hja3VyL0x1diszUzJmUEJjR295VkJBdStBRm5hNi82UDhL?=
 =?utf-8?B?S21SU3RFRjIzS3V4LzNYRjZTOG0yVWJXOU5GOFRwMGFydDlFNk9vTWZrOHgy?=
 =?utf-8?B?WHZDclFnNnRKNVVZeFNhdjVZcFN1R2VKdzVWRG50WE5aMUpiZjhHR3E4amQv?=
 =?utf-8?B?ZUk5dTRnN3NqRnh6M1U5aW5MTWZFVVlTMWJ1SkNNUWp0dkNpVHlHbFFvekwv?=
 =?utf-8?Q?GeG0oXa3ckkTBBsrMF/Ip0YbLYuWlBF/p2z/krR?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3289cc46-f490-4059-d190-08d90ee280a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:53:43.4810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHGbbfXoAcot0DadFAI1EMDpVbpi+o9hCd5taLzaHyZGBvjbwd/WJ51sRbo9Edcr3wr/mDhxdvZbwEu7IQQKGzX8jXYdeQIbc1xVfTCfff4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5828
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

I am looking for the mechanism to add events to Redfish EventLog. I 
checked on the Redfish EventService design 
(https://github.com/openbmc/docs/blob/master/designs/redfish-eventservice.md) 
and it seems only has C++ functional calls (sd_journal_send(), 
phosphor::logging::log(), ...) but not user commands that can be used in 
the shell script.

There are many use cases for adding EventLogs:

1. Use phosphor-gpio-monitor to monitor signals like power/reset, 
button, ... and log the event

2. Use phosphor-gpio-monitor to check if the Host boot fail, control the 
mux to switch to other boot devices, along with logging events.

3. Check device presences (from /sys interfaces) and log events, ...


I checked on existing repositories like phosphor-sel-logger, 
dbus-sensors, ... and they only support events for their features (like 
power dc on/off, sensor threshold, inventory data added/removed, ...) 
and the Redfish events added in C++.

I can have a C++ codes to just support options to add different EventLog 
data with parameters. But it can't be inside meta- folder so need a 
repository for it. I think it's not worth for creating a new repo just 
to support an application with dozen like of codes to just add EventLog.

Do you have any idea of any existing repo support adding Redfish 
EventLog from script/command line or any repo that we can extend to 
support such command?


Best Regards,

Thang Q. Nguyen -

