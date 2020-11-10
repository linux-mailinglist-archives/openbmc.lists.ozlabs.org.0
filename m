Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E192AD028
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 08:00:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVdz94QNwzDqgD
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 18:00:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.115;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=cVZ3pjZd; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2115.outbound.protection.outlook.com [40.107.92.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVdy96FwSzDqWT
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 17:59:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0Ui3nBUORAmMQhYosiYau1SL54HZFTnnWwfE6qkO4kfzxo9cibH4Pkx9tlXWQD10pM4OK56NeiIGgz3Hf7JTOdOTM+D4px9CJreSPOAlhj433C0JqY+XhmJEs0GVGP7rfd+rhxXqxywzTBeIQEyIlVeXcI/MCXcEwIy3r5KsMunA8LmfRD0utx4ioZfWrZpxtvy4rEVaQSJl1/wgk8vXt7eDWKXSIaMVROQlszSmvls1UM1MBkQDvQtuEE/v9vBxTdekKEjAY9pmJc7LYdxMx4ceJ9VA6c0N6XQ0YKFgCh/Zabn4Bky2qVNGb/ZRuA9hNMXyapuJE0I1g2iBWSe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MVawkvSjo3+Q8n3F6qwoBpItn/zCP3ntkSP2g66wto=;
 b=fqPH5gtFnp32uhaH+LCDCs09qewnywsYKSBPZbcrGHz9T9uaQAsFGOmkBAeYN12O1Pa4AOJUNr9fp2VsZwfI70V5UjfcpUskcWJ8830yENOg7rUN6ebOvEI1HRzZpYo4LBSX3kYxZB688SjXs1vNIJYgBtuQDtx6FFc5qtQo5Cp7yQcM3WNSDDfmZ3CEPzJKprzodOYiV/8zFKCpKzQ/huPg6ON+vKbEe+I2DeEUyl7TfwY1V80+p1uWV0ISvEiT5ATQ6eXes7/veIhzhDvEKJ6Ug52A03XP4L76aLf/ClUNZVlf0b+wRf8pL4bcDAN/+bmWuY2vShWIx3pZs3F4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MVawkvSjo3+Q8n3F6qwoBpItn/zCP3ntkSP2g66wto=;
 b=cVZ3pjZdJOwm0Aghg9k4FbO4VT6Hi9LgHG+yNLScfQLaUzHY5fH0YkH8ne5dIvgiNZayIzZsbsddZFzkX4T+ojTNaxLT6kMup/TPaOUdEHprUkaF/alp6z73MW9mi3FzieEhHJrNO99DFX5jfaU2NSH7z6VWS/BsQHkyeqW49dE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR01MB3262.prod.exchangelabs.com (2603:10b6:300:fa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.23; Tue, 10 Nov 2020 06:59:03 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0%2]) with mapi id 15.20.3541.022; Tue, 10 Nov 2020
 06:59:02 +0000
To: bradleyb@fuzziesquirrel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: New meta-ampere request
Message-ID: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
Date: Tue, 10 Nov 2020 13:58:53 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.219] (118.69.219.201) by
 SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 06:59:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a3d059d-a51c-40d9-4bf7-08d885461b2d
X-MS-TrafficTypeDiagnostic: MWHPR01MB3262:
X-Microsoft-Antispam-PRVS: <MWHPR01MB326267787E4254AA995688DA8DE90@MWHPR01MB3262.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5OjRq0Yca/NA5ztlsSnSQLAxyIDEu8zNccydptC3O6hFm6rhYXH/AoRSz0gTm0d+G6rbPY4yZXSYvy3Y6RUBYTp0spJAMeDmuKAidU3T999VlC/EF48DXWEAKX0+NDhZ+Vm25WmOQvtbuWICEiOym125CLip5x3bGfzZNsFbzzPEYP3q2jfa86h5Z+mSteZsNiQf8oqgRRbe7xXIJZYWbSQ4i8f3XGk28lcmkOchPK6U2F9+XLsNuw0gK6WG/XAxSwa2hJbPKr6Wa9NOG1jlPE3ZPhF+vbpFrJaBuLc/FdlC7DoR2NTcIXbfLg9n6hkiPtbQogPAco/Z5lqp6UnekekY9w8e/7sXSACGnM5uDnwKSXhM6zqk84YWi/CuW+YRMyXjVHx+uI5pjn7nOi16Fivw0VdeGh1ip/37DpPHrw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39850400004)(396003)(346002)(956004)(8936002)(2616005)(16576012)(2906002)(3480700007)(6666004)(26005)(316002)(31696002)(478600001)(66476007)(5660300002)(186003)(86362001)(31686004)(6486002)(6916009)(4744005)(8676002)(66946007)(66556008)(52116002)(16526019)(41852002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: e0tgPeQE1vrZAsllCEfknJflw5kTPMHwAFI1S6jeJccH96QaPdVqcYfPqDqT1nTbf9XRCfmT25nkeM8ZZeREKHusL+rDTtz2WhfEsM6aPNqw0FvadgRgTbUjasi9wkbui8Tt7xDfwm1P6XaCsewQZ3qOBvGucHmWdujtxfAtjVWAd8N7XRlh42JK7PKUAUAnB8HiBO9qpfXjPujRtRfvRBG8sKKJkVBHVn/5pgfGDb8LU8H8Mc+cukRUtXJEC4nVJnSmoVHUDw3j7teHi5sRLlwd/UsgRFSPwAPnzivxnMxlpvk6bupnw3JBXP+muo3WbBI5hjCV7k0J26GZUKkNdSCq0dnHqMysDIS3MMZfPegbHnG+AFsGMeNr8njIhNdDSj1o0GEJGJluS4RgShrXLZSVRI6pgmfced+hQRes8GTPU12V/PTTNvIGd7CGmQIvO7IYF/pGLygQ/SVhj1mTE4CdVhFHdmm4C0Myz537ujE3wUrO7vVMVrvjqEMLPU659RiiK3whyX3ugkcCHcWeBXyyXo2if8wlRkvjEKz2wg7e7yPaC5816XcvANyJhXnUxGxmZSo+eOVR+nOy5xpAYUBf1KpKX6dYrKuNbArB/1Xq+qK387JlqOb7aM29h5nb8x4dBa6tmBTr3DtvIn2mUw==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3d059d-a51c-40d9-4bf7-08d885461b2d
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:59:02.5442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BSAx/gmAUTf4RGyB/ozPAxNT9ClAEu3xO5avN1t41euaZGHd/GWFM8vSpilcKcCkIcwbX5HlZDXjL74GPoRcdNJqi0YwJZyby1T5jgfAFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB3262
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

I am from Ampere Computing. We are using the OpenBMC to develop our BMC 
for our reference platform (with Ampere CPU and Aspeed AST2500).

We need you to help create a new meta-ampere repository for us to start 
pushing our codes for review.

Below is the information to create new meta-ampere layer:

Maintainers:

     thang@os.amperecomputing.com

     tung@os.amperecomputing.com

Let me know if I miss anything.


Best Regards,

Thang Q. Nguyen

