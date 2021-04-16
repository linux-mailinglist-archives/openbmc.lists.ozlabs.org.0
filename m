Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5F361760
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 04:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM01c1gHvz30GD
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 12:06:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mJTD20g3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.96;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mJTD20g3; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2096.outbound.protection.outlook.com [40.107.93.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM01K4YGxz2yjL
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 12:05:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/IyMutv8NiNoXkbSRq4THg8Cuyaxy+AyANnBC8gVp+nNY5KA35Djr+8mWq/pdEketkeP0BfyC2GjL2/kYNkHlrvR2kuWYVcXowx2scLgqqloPOdK9SQ7UMoloJoY8vJdEDYAw7r79UsRaVKfy2USN7kwk7GobEBctTs6oo/Kw/1smDIE/gNVti+mmURVwHh4rfW3s0wZs3K1W8y/63a5LaWBt0exWBStKuNQ9Gl5/9cewAlGKkRmDIYoHC4jnpZrHIsvNfLprEFUpLmhyecCKAkdGYfnEGziUYU8ZH1mNDewNEU1+gzzRX1c5cu6MnkbKJTCNkJecoYpwp9pOhuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0QEWUnXIIvWdiEmLYhpBo+1khdbqfVRDAy2aesfHz4=;
 b=lZ5Jmf90JnRiWl5FfH5Nb01Dp8IOx95iBcZxG08gPElz9Rh9a0Babp4aEin9FRLzPsdG8Oe4oDF3WKLy7SZUatwr2XxJjuomgQTyeY0e/CQFLFgETt6xwONDj0bYVJff/yY8gtRY8UNqy9GKy5YlZdHp5LKYG9LHXw0FZ7dRLAVEgHtv5GNS1HBY2/FQ8mp1h/unDbDuc+XCUmRKmhZMCgNfQqNPVP82MtSau96/AixjHf6F6TspBIMY9Yva8n51Qe37ioWnhXckGpthJUwlExD8DmhJPd/h7iqyIPgtu0YIjtRBcwiFL4fY+XREHM0wTfQC07C8X7az/332eYgBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0QEWUnXIIvWdiEmLYhpBo+1khdbqfVRDAy2aesfHz4=;
 b=mJTD20g3MCu9p2vnG0u72sPI1LtISBKkkuR4podZZjEvgPvWhCFzOMyC3oDqFn5eFPuNPpsaU/s2Ym5WN65xo18yD2c73fqhUGH9ai98MDZ9iv28ZhwZ1yhuXhnBLFsVGPpmgmCN3I0swacnakRAmJGs3zZOL0pOpCJpn6ceCj4=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6579.prod.exchangelabs.com (2603:10b6:a03:355::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Fri, 16 Apr 2021 02:05:49 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 02:05:49 +0000
To: bradleyb@fuzziesquirrel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
Message-ID: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
Date: Fri, 16 Apr 2021 09:05:36 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:3:1::18) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 SG2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:3:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 02:05:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9d95e02-cb86-4549-2cd4-08d9007c27c7
X-MS-TrafficTypeDiagnostic: BY3PR01MB6579:
X-Microsoft-Antispam-PRVS: <BY3PR01MB6579201892A4CCCDFA1B6B0D8D4C9@BY3PR01MB6579.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Cbx85HUlSvmgWJtk7Ed1UBi2hn27wJzaluPZsJXgp5pd+zGXHPtWA9Dremltc7S+XWROuY5f7rr0orkFVvBhRBGubHfHN1p8Eky9YTjZsn7DqjS1OMNo8gvIPm7A2hJv6IZxMftB0uMg8W6jzudamL0jRbeGhqpYB4dvlfj4jcmXk83L+RAw0fZh72YEdEcCm1d6yAKjzr8FejTJp/PyXpIxEs40cxsl0w1hHckaz1HMc199+It7y+G+5UoC5XVNGk66V/ZpxwoeNpHLcStiHI93gnXvAUYea1nGhAl/s+sigmcmZPA5IrHNeZAKimYXHhQHHhPebueuFw4kb4+CKQP46WP9vlgtrqEveF6lyG6mJA8GLvSH918EDUWC17HzxDVUoGBLFBISycW1OVGL4h3PakPPpRfHpD43RLh9Fxln1V05iPTL8UihZNXWkvq9NR0+BBze2suY1T6qGsCnVWmr6XvUtkIbnq4651X+zHD0SoYR6s2IpVQcJB1zLEq88WuUcnk6UpcrRjLLkSc/lW7PBOrXL8daZoAalyhMGmLOwTr2jWWi/tTt6n4yR4K5Fp4ztAISa5dClMKqu1muryvjqireo7FYd3cakiC4jWoRta198zA+lnvA69eXfao9DZwC++GrNwlc2BXtivXCpmg8F5Y6/IhU9K/89emVr3f0ohUMiIfNdLAXZxEBzrlGXBAtWvTmy4Qalaj7YBfKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(346002)(396003)(366004)(376002)(6512007)(186003)(6486002)(26005)(6506007)(16526019)(66556008)(38100700002)(4744005)(66946007)(38350700002)(6666004)(2616005)(6916009)(316002)(2906002)(31686004)(52116002)(8676002)(8936002)(478600001)(66476007)(31696002)(84040400003)(956004)(86362001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTlzSVQ0WVpVQ3pBOXdoUDVsOU1zQXlFUlk3S0ZoZ3BuQ0YvKzhNaGNTKzFI?=
 =?utf-8?B?WmtPVGNwbDlIWmFlOVJxWUE4S2ZmcG9CcW9pS2lubWRqa0VtYjJlWE41dmpz?=
 =?utf-8?B?SlhNL1JxNUw5Y3JJN2pZTkw3WER0dUl2OE13blp1QWVZWlc0UnNySnJDb0Vn?=
 =?utf-8?B?VGhmNFNyblkyWDdtczhuRDNLeEtjQVhaKzBySGFYaDJBYXFTekpxOGtLeHJB?=
 =?utf-8?B?NmVVVFR6amIwM1FDWUlQQVA5VnhVNFFaZUNTQ2dZZUZpemRka1A3b0lZL3g0?=
 =?utf-8?B?WGhucENBS0l0Q1VES25MS21xaFRSYXhCbkZhNFJsRzdtd2o4ZUN2TGdQaS9t?=
 =?utf-8?B?RlpicU80M290cnJmQTAxQkJCaUtPcWR3RGdaVnQrdnBlRVBPdGRUOWc1SU5Q?=
 =?utf-8?B?Ylo5TTBOenVGWjdsRXN3djRlSDdxYmlTRG0zWHpULzQxZjRGQXBsUmdTbkN5?=
 =?utf-8?B?eTlxY3lYQkhQSWxHa1ZJTHR4dmRNMktrQnlFcHdrR0R2azhBaGM0dnRBa283?=
 =?utf-8?B?KzE4dWVqNnFRQ1QxeHJxMEU3N3dxdmN2ckU2VDdzb2w2OGZVdUxzV2lTNGg4?=
 =?utf-8?B?d0h4OEd2WGc5bmIyQS9JTW5UTE1SZnByTXBYcjJaSUtoQW5CLytuVUc5b3hx?=
 =?utf-8?B?b0wrNWhCcy8ySTBVU1lHZjh4b2hmOFpLa3hJSTJURUxvWElPV0NQbmVKMXdB?=
 =?utf-8?B?UnErMkZIM0trR1NGWm1xZFplbmNXd3NKeFhVVDIveDlwbkZFWjI0Z0ltckRh?=
 =?utf-8?B?UnNWOEZRdmtQQ216SE0rSnp3Z1JYZDNkOVlpdWhrL1l4TjNpYm5HbGNUZ3p6?=
 =?utf-8?B?bzZHeG9pQnEwSlZVcjdlZEVQU0dJMmdIeW9RdUJEUUhmYjJ4Ry9hTTFHVytO?=
 =?utf-8?B?UjlVak1Ib2JmaERMeDdBbm56ZG5DSWhrcm44QUd6QlpqbWZVRjlEV2pBZzk0?=
 =?utf-8?B?S0dyRjVvdlBpaDVKbFNPL0tyYzY5RlM5VjhwVFdaemhDNkJrM1ozVEdWMEdz?=
 =?utf-8?B?Ynd4dVFJcHdSNVhZNWpHMTJJUEw2TkJGRk1CaVBmU0FiRFRYWnVJQ0dqTWxG?=
 =?utf-8?B?d0JreEpGNXJKNEx2c2lBYUZSZHFQQ0c4OG1Oci9BSTNBL0tWMXpidWVpOERQ?=
 =?utf-8?B?cklJSzJlODNBZ2p5dkRsMjl1dWFOQ25jTGl3dlVVZktNaVhKZTZhVDlhWXlU?=
 =?utf-8?B?MkppKzJXbTZ4a203WVhEeGVYRHkwVTV0WkcxT2hnY2F3N1RTUEZFakl0Zmtw?=
 =?utf-8?B?YkpOc0w4WkFYWlErSklSWUlZVUR5WHdRaXdNK0dZQXRvbjlWWWlsSlRRbjN5?=
 =?utf-8?B?WE5tOWkyMmpYN1pJWVlidGlSSUJ3bWlNTUJ3b3BqUzJ1aXVtYWpEV2lwSFpP?=
 =?utf-8?B?RlNESkw2Q1FKOHE3VDRnQndhSjRqVm1scmtnSldYMUM2elZzbDZYNWl6TElt?=
 =?utf-8?B?UklYenUxbEVyNmozMWNCZ3ZZbTlqQmtHM08yV0wrMGREZXlmZXgyWEpkVUhh?=
 =?utf-8?B?R1dBSFQ5azlMN2E2NThuV1BMYm1jS2YyMi9kL09INXJaNGovREhnQmxJNlF4?=
 =?utf-8?B?STQ0UlI2bkJNVTFTQUN1bFRZMnpFdkZTZHRWbDlVdWk5dlIvRjVaOGE1Zzcx?=
 =?utf-8?B?Q2xUclo5Z1JtOFdQV21uL3U4SlFtdkpJVzM1dHpqS3lYZXZMbG9Pck5HOUIx?=
 =?utf-8?B?MnpER1REc1FnYytHdXFua1ZPd2FzU3pDMG5zcEVtWEJ1S1FzbHUwWC9sTEVR?=
 =?utf-8?Q?a4h26/aFW/3SXgaiQMgawMN8xvypzpNNIzK/NuS?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d95e02-cb86-4549-2cd4-08d9007c27c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 02:05:49.4973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtO6eCBJfLwo5bI2HbS3BvvPJM9B1pMDCPpxUZuFmH74HERnJrRD2Nz+KgCJ48tvGwGHJpIPibB25GoCvDomtQbuj2HEf9QSRW6sqACbACI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6579
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

Hi Brad,

Can you help create 2 new repositories for Ampere specific codes:

- ampere-platform-mgmt: contains codes for Ampere specific applications 
to monitor and control Ampere's Host like RAS error handling, Temp 
event, ...

- ampere-ipmi-oem: contains codes for Ampere specific IPMI command support.


Thanks,

Thang Q. Nguyen -

