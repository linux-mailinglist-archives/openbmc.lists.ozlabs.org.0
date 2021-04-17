Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A0362E86
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 10:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMmRk4BcLz3bv8
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 18:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KJgZNKlw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.76.134;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=KJgZNKlw; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760134.outbound.protection.outlook.com [40.107.76.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMmRS4ZLKz304T
 for <openbmc@lists.ozlabs.org>; Sat, 17 Apr 2021 18:27:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR/rmdYwkjPbVrTgzPE3YLdmePGqi8qvexxkoyVxcBCstUXktfoqgpOn8q42OM8Lma+bTK2Zqy5ZdaNeV+xLWPKAX05WyzXosyZePFG2XaTieHR2v8qE2zJ+cI2kN8bY2yqDRGd5iZ8xqrHuPg6dehfzTI9GTfzG4EwPoEGQKGEVo7iwOA7UxR0WJ1CYsh8+hgPTklirH6QtUjf/QmBpdZqilapNClnmhCSjiw7pD2bH34i5dSW0KtMKqiHbVzwEH/Kq0QU0XgNxuU0gnWAyB5KqUtce0zY6AROyf9JkmvJSqo9CpIV0YJKuCeyncTEjMeLWd8e71KZZ5rcNMCSE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6wZ/au9PGbylQWRAfGdExtgCpXVN/o4Sl+MuR8C0NA=;
 b=KDttwRRpZR1sIxIvxjz74YSgFDNB7wJr/OLq98mWFVLdTat0/wM6hkffGEB4qrH+d5W6+0VCID5PEZNRZ3jLkLL+8xCxcsFqnhm9ZfDx1YuQreZUYLaz518RLz1pCS3GkT9ywOgcu0QNb0e7wp2CJHlPBwF0tKuI3SwDDjhOg+z66yWGMXlm7tln8wQIL2mP2OTkwfzNxNIbtxhQbsTj5inrL8moDy1wC1qqvuy871r2elLnyCauALrB8tRSQQVV/Wp+VawIkWnS1O1iz1oFT4QFR6XjT6233cYAIHapPFM/txeCSVvLnBiLcx+c8lB2ol7NzMn+H77qbJ8lfxVo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6wZ/au9PGbylQWRAfGdExtgCpXVN/o4Sl+MuR8C0NA=;
 b=KJgZNKlwaAr2mQzWh9vmyZIEbX9mkoJgKeBlIXHlaRJ7mw6qgMi8rCjSiw6tMwAN0ExJIxl7hI8KwuFvTWcBvfuGoVf8KPAQBmwm6bSumH8bg5moWLfmj/PLZNGSh3AVvWTyQBzZtucI5F1UiZGFInWqE/gRb6Cf7S0wI8HNJTU=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6737.prod.exchangelabs.com (2603:10b6:a03:36e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Sat, 17 Apr 2021 08:27:40 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4042.018; Sat, 17 Apr 2021
 08:27:40 +0000
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Thang Nguyen OS <thang@os.amperecomputing.com>
Subject: What is OpenBMC server software
Message-ID: <843031a3-072a-a3f7-b2c4-17a5406c4daf@os.amperecomputing.com>
Date: Sat, 17 Apr 2021 15:27:31 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [42.119.82.51]
X-ClientProxiedBy: SG2PR03CA0148.apcprd03.prod.outlook.com
 (2603:1096:4:c8::21) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.86.44] (42.119.82.51) by
 SG2PR03CA0148.apcprd03.prod.outlook.com (2603:1096:4:c8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Sat, 17 Apr 2021 08:27:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cfc7b43-283d-40c6-d10c-08d9017aa9fe
X-MS-TrafficTypeDiagnostic: BY3PR01MB6737:
X-Microsoft-Antispam-PRVS: <BY3PR01MB67377070B5DAFB36E29218478D4B9@BY3PR01MB6737.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu157uBa8Le3gCzjbz+fG+G2y0rkzktFB0nuVYI4LHpAkOp17ZJ/zTaiyTzjUP0ovKN4Dz55CW0kuVZbisu3kRnWoArhV317Ty2d4Q/mfMk+yv7MdwrCAJpY9iQn5Y6NTjJWmUsGngkHDciSWmQHcsgIBpT0qeS5fC+aJ/4ZuPxflfWtz1ZagBL2dohBI5Ei8sMckYcgnZbNxtz0o5ryRLPJAVsgFazAMeWcM5Bd7JRTt2jUAkfl9OigrBVONjsGn4i7F94hR+JloOA+zEAy1ZnGf9QXiU30DXgRrJRRv6aPSQN9ZdMTUwt5aw8wxVBXMBgL87TM4k9c2qMmqAaHhQIyVygcj0M9+wsHIyfo6C/3fRf/M9tComuVq+CwUUgq8JoDgMXG3GQvei9DktTv/QU3T40bZ/CsB7TldnpOeJtVhSp9UJyGDqkinaD0LTMkb4nZzjhKRVl0jzF2tm49DGsO0/oCFSu3+UznB/BO1s/RAEiylPOIDnXS4psvWdb4fU4Dvve0wqJrFfJzkrgttyhbmVC/+PJkVTcnH2tN79eeTVLph4ae4bxrJtooP3Ps8CWg+NqyoimTPpBtX4/eXc1GqPTnxNqpoeso9467uR91Wa9iXJgZRJwRkjL2pNuZw4y8rDWKSN5IoYd6ammmARZSncY2qYrFH5MdbHSxeUSmAc9Sp3tNqwKDNWAx8p5wnCZsShhHB4mUGajKjnYBP6eT5nlRQvWoPr/ZU8jbQW+hDMFQ7JRBZ6P5HmS8J8rRY//JMx3xweYI0522N6NhOkVDQc2riMGv6X75JU4Vy2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39840400004)(346002)(136003)(4744005)(31686004)(966005)(2906002)(6916009)(186003)(16526019)(52116002)(5660300002)(478600001)(66556008)(66946007)(8676002)(8936002)(86362001)(6486002)(66476007)(2616005)(26005)(31696002)(38100700002)(6666004)(38350700002)(16576012)(956004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTk1eVJFdGxKWW82ZDJyRG0wTU5XYmsyUWhWckFtMXd3VCtrRnJMMnY5RTIz?=
 =?utf-8?B?ZW1ERDVMQ0hoYlZyMWd2R05TRUQ0RVFQd2xORmdjdG8vSUpWUE56djN5OHJ2?=
 =?utf-8?B?TUhINWdOdnpSVnY5dGtoUlhnbnVNUDNoSHovMHJmN3A1WXlvRklseldMWEFJ?=
 =?utf-8?B?TlJ3R2s2MDEwRnludjVITkJmRzZkUjRuNFZaUWIrN3VSTXIvTllqK0crMTdU?=
 =?utf-8?B?ZDVhaG9yakFuOUN5Q1dZZXlESFZjYmw0L2lxRWJyOVZtY2k5SlV2MFlRM3pa?=
 =?utf-8?B?MXJLMGpCWE9NNjY1Yks4MWtoUm16RERVN0Z6UmtxR211a1Y2RFRqcXUrb2I3?=
 =?utf-8?B?aGkvRk16K2ZPV0RLdDNzMkFuc0pLalZYZklObWgxUUEvZ3pxU0dPS0czbXQ3?=
 =?utf-8?B?cm9YcnlMWVpXdkp2eWdQUlZpNU5ia2JwdHcxTjlzZnRqTWZiWm9NZXM4T2VK?=
 =?utf-8?B?c2tZQmphSEJhLzJQN2dnZ0psak9tTTFGV09aVlJMSTdVd09UamwvQVZNOUpD?=
 =?utf-8?B?bWZ1UHAyaXNGUW9CRnlMemVka0tPbjdmUGo3c005S1F6MVB1cGk2UC9wUXFz?=
 =?utf-8?B?eFg3UEJIbWhKczZSRnp2SERoRkhPVXBlOGdCb3VzUVBMOWNqaXp4WjUwWDcz?=
 =?utf-8?B?Q1p0cFdaL0cxenQxdWJGTGFvUHdReERUNWxqUGNzNy80T3Q4SHd2Y3BNNEMx?=
 =?utf-8?B?cWZyUVZqZExZdzF6QXdjaDZSN3FtdThzWkN5T3JSUDBsMGVGOW5ZQlVRZkpN?=
 =?utf-8?B?d2I4c1d3aDVaelRPSHRCMmZzMS82UmhuMmpjcjdLRmp6d0JCM0wxVFErT3RZ?=
 =?utf-8?B?SkYySERNTm52Zzl6cldLb3JaWnhWL1hqbS9ZcEVYRmZ1OHAwL1NtTURPbkRP?=
 =?utf-8?B?S095d0YwZ3BsYXBYTjZ6WXVqTU1qQTRubG9YbVVLYysyNXhJVS9QVnRZTk11?=
 =?utf-8?B?YUFzcEFjN05BZHQ3a2xYMWN0b2FYcmJYeWswK0hIK3E3bFQvQisxWkxrVm0z?=
 =?utf-8?B?QkxiUEJJMmpVRHNFVmpYZjRpZHRMUExXVDl2Z2R5N3N1VzVKZlFIS0k3Ly9Q?=
 =?utf-8?B?VWtFT21oUW5yQmFFS0J4SVFCVXVsL1JxVmdGY2dCS2diaTlvV2NPODdiaGxT?=
 =?utf-8?B?MEJaMnBSMkFUUUthRUpKS3Rpa1BxT1ZOcHp1azMzM2g5WmY1T1BsYlFpWEJj?=
 =?utf-8?B?dnY1N1NVZE9leklWWS9EQUc4TENRdEtoVVpzTzVNaWxIRzR0RGc5V2d3dHFD?=
 =?utf-8?B?UXJSWW4vZDIydGFGajFNVmxKdFJJN2NqOE0wYXBVZXRWaTBtbENDbnVGa1Yx?=
 =?utf-8?B?R2V5RE55L3V6T2kydDZaZXdvWTdZM2ZwWFF2cjFNKzlrV2U1eVZhbXJ4ZzUr?=
 =?utf-8?B?OXA2Y0h5cUsyVU84THZ0TEpoUVlQOCtQU0VSQjZsMTFnM1c1Wk5BaWl2L0RO?=
 =?utf-8?B?M2k0UFJlODZHamhDREVpTUpJa1JPTGR6Qjlrb2lHUHdqRmhTb0pNcU9taWcw?=
 =?utf-8?B?MUwyZ3hOUXlMc0RVWm44T05JUzhXNlJFNFFWT3pSUU8zbnJVTU9JRXFHMnli?=
 =?utf-8?B?RHV3NnZ0bkM5aitTWVA3NWVsUXY4UjJYUkpVSVNMRzdpaE91UnlqM3hhaWRt?=
 =?utf-8?B?a1V1NXJoUHRNNXZIQWQzUkZJK3NEVFNOM0dwMkV3NTZ2RUpGZWZwZm16Skta?=
 =?utf-8?B?MjhwTEVuNzR1aW9SNTkrbk5JZFZBTjhyc3RNN1hSR3FqSmNZVVJKZ0tVWWhP?=
 =?utf-8?Q?AyhrL32VqwgmiTGVeO0FDEb4OgceWSdWujAz/gh?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfc7b43-283d-40c6-d10c-08d9017aa9fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 08:27:40.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1Y7Z3J9kDhcF54ZO2BwnCxMBuuW1nU7781q6Y327BP6qi5MxKxbmyUnWL3N4Djkfd9x7oCvJVGZjrYW86nq3L70Q3ptGfEyKer7FdAjJbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6737
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

The Mozilla firefox SSL configuration, https://ssl-config.mozilla.org, 
provide suggestion for Web server software to use secure config by 
selecting the right Web server software, version and OpenSSL version.

However, I can't find what Web server software and version that OpenBMC 
is using. How can I find the information and check if OpenBMC is using 
the best secure configuration?

Best Regards,

Thang Q. Nguyen -

