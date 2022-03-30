Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488B4EC940
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 18:05:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTB9H1r9Zz2ygC
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 03:05:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=tTyLMxOA;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=tTyLMxOA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:feab::727;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector1 header.b=tTyLMxOA; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector1 header.b=tTyLMxOA; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::727])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTB8n5W4Dz2yZZ
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 03:04:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur80TQ29qYe5N+vEvW9d3EbmdVMaP+mIF/mh0SDxvXw=;
 b=tTyLMxOA7pRmxTuDqMGvRA/kzSAtb18indouepmD3q9UvjFQGENe3Q6GanqHVeRxIlC1eYdIx48/1MqmM+1LRjr3t1x9ieevXjJu+MnLurqal9PKk0PFGNntFoNfaz2Dr7bT+XeeecB7d5ili2BZupUoWrPRvUH8VHq3ioKYyitp8I27Q4bWEktLpKOR00KVmWb67l025SBW3kmRohB6Hs9xRGHCXXYUwc1CEwkQOG0CIKa7A+rka3Js/lHL3qXxzZ6LCGuH59Hqrp6NHm6Fu+uT85K0VyK9JW7aX7qfZGIsHIy3ImzVwxbrkMVvFdNxE6nNB0BEUiNQ0qsOMAV/GA==
Received: from SLXP216CA0041.KORP216.PROD.OUTLOOK.COM (2603:1096:100:4::27) by
 TYAPR04MB2302.apcprd04.prod.outlook.com (2603:1096:404:25::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19; Wed, 30 Mar 2022 16:04:32 +0000
Received: from PSAAPC01FT033.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:4:cafe::b3) by SLXP216CA0041.outlook.office365.com
 (2603:1096:100:4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 16:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; dkim=pass (signature was verified)
 header.d=HCL.COM;dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PSAAPC01FT033.mail.protection.outlook.com (10.13.38.190) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 16:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ia5J75CFo3VKqdMugo2P16tkBIMSdeZBWQw7WUAVNaJb6x36LV9Mz0oMVY/nWzzn3vZKdz1z8qcxdcXJxbezJIQ9M1giHG8UEwVl3PB7joXy54YiP5zhS5ll0N8YPQ7gUzwHxlfv61BaQGlerFliBCdphaEcQ3F0GfM2uROOXVbTUYsXE/uvp7fZwHEiGU+2g+r4g82GECO9NAIY8RejN7b9gqD2EU6cRaLZ3Rexf4izNzhZfNpdyYJ95Hs5hK7YgeTwBidyU8Ydrc/9rcHZNorU1nsJvz/utHQZGBdXp/ycgfEPWYAbAXmF3D0XoNDATafa7zmhKLmc3vTZhVO12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur80TQ29qYe5N+vEvW9d3EbmdVMaP+mIF/mh0SDxvXw=;
 b=iyeWOhLEWEqvsf6lNYEFbuCb6t6mbupjYZt1PK8UZW4pb5817/yCtWrX6pb8NSOIMzyQrQcpV7gzK4BcU72azFe+dqPgkqB6Dgsp+eR9Pb/IcgEn88iwGMuz64E0LLDg5HKxOt2Mp6ZU5fi+r3QQFuLrPMuyjiqUg0A+e2Un59D9dfav5n0uXgk7ArP9Yj5ylJBy9AHvOrShGAk6FfZzkRzTwzJj0ecrXaS4Wr9NhMC2yzeMwfljmhaJW5ub7ywd/XzeMQ2V3F6RU2fT36sip7SzE2IMGxJVmwi6IEq3tmPtvXMAM5fHZSBKRfSR7yI2GCLjWYK26B97ZFuYRAnXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur80TQ29qYe5N+vEvW9d3EbmdVMaP+mIF/mh0SDxvXw=;
 b=tTyLMxOA7pRmxTuDqMGvRA/kzSAtb18indouepmD3q9UvjFQGENe3Q6GanqHVeRxIlC1eYdIx48/1MqmM+1LRjr3t1x9ieevXjJu+MnLurqal9PKk0PFGNntFoNfaz2Dr7bT+XeeecB7d5ili2BZupUoWrPRvUH8VHq3ioKYyitp8I27Q4bWEktLpKOR00KVmWb67l025SBW3kmRohB6Hs9xRGHCXXYUwc1CEwkQOG0CIKa7A+rka3Js/lHL3qXxzZ6LCGuH59Hqrp6NHm6Fu+uT85K0VyK9JW7aX7qfZGIsHIy3ImzVwxbrkMVvFdNxE6nNB0BEUiNQ0qsOMAV/GA==
Received: from PSAPR04MB4726.apcprd04.prod.outlook.com (2603:1096:301:92::11)
 by SG2PR04MB3367.apcprd04.prod.outlook.com (2603:1096:4:6a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Wed, 30 Mar
 2022 16:04:28 +0000
Received: from PSAPR04MB4726.apcprd04.prod.outlook.com
 ([fe80::e4a4:b50b:18f4:2038]) by PSAPR04MB4726.apcprd04.prod.outlook.com
 ([fe80::e4a4:b50b:18f4:2038%4]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 16:04:28 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>, sri d
 <srid.11486@gmail.com>
Subject: RE: Multi-led configuration in dts
Thread-Topic: Multi-led configuration in dts
Thread-Index: AQHYP36aiRwdFo9KNkWF52aUL6j3WKzOivaAgAmIhXA=
Date: Wed, 30 Mar 2022 16:04:28 +0000
Message-ID: <PSAPR04MB47261F3666AFD3FC08D0D7A2A71F9@PSAPR04MB4726.apcprd04.prod.outlook.com>
References: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
 <Yjx1OQt7YRgD0OHt@nbwork.lan>
In-Reply-To: <Yjx1OQt7YRgD0OHt@nbwork.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMzEzNDZiOWYtMDUxYi00NDU2LThkZTYtNDY3NTEzYjEyMDFlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImlwYm5yMTgrdGR4a3hqTjNMK2x0bGJNMmpkM2JrT0M4R25MeE9IdzVxcnVwaVFDTEpIK0tKd0NjQ0hvZGw0b0cifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hcl.com;
X-MS-Office365-Filtering-Correlation-Id: 3f92fee6-0a7d-4e73-b746-08da1266fa74
x-ms-traffictypediagnostic: SG2PR04MB3367:EE_|PSAAPC01FT033:EE_|TYAPR04MB2302:EE_
X-Microsoft-Antispam-PRVS: <TYAPR04MB23023EE6A354920DD3CAEEE8A71F9@TYAPR04MB2302.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PMkO1/U7yL4XlfuzTKAKyZA03oUH4ekZwGB+9ytkxL9SHZYXMktBn7Zft3bxFxo4MAZtBEgEvUOJJICvTfOdS0+43Psy7oZ6RzvsFQgeMPvvoqVBXqV93iFlCUOiHN9UnIm9xqLk+hxBV67DOVpLp6NSdHjZNpb430LJZPJm4XHsy/Lcuk2QjtLEyyHwWQN4Hhy31yeim3cwa400W9ga+MbvEhXtlFnDn+DsyAQrqvI77A1kTOMKhdDdHyFM0UIORTDgs0wlNgq2cec73pEiC6huZaJXnwV1eCkc8GPbF06lRaVpMofooiA3k+hW5mLcBxoyOamdg/ex6yMVUyacNwftoakRk5L4cloYaXvDZRqhMuKO+ECudQCjvm9Iqp7C+CkO/tKZrDSAbdkfVUUKhmlbiuXvwLbzdSU+XzcwvI9Wz2DCGQ/GSEBwaaiz1vsq9xA0HuxxvOyfktUGF94jl/EuJHSNRl+P82YOXk94GqjEgXfqQpjZMWfUbmwwfPVsXNXZbgZs2F5Hi87z4crF+aQRwWhGoP31THtgacWzUjyVkrc1/W0dRY856CpnJ7VqDSxg91/MZNIKCpMjyfhYG407COomN/uMWSqwS38QNujJUVqaYS6B+VqexIexD5dNj0uPrUp5iThWaJszx+CRn8PumV36WrgG2pIdVMzqmMnF+UoBTinCZ/EpW6MNK06UQm3hVkJhe3fxWsAkuXeHFKLEEUUAQB1dT13215byt0gtb/7Tyv5FH6Izibi2SVWnr/gl2R9CxoyQd6pjwTwrDfwExKHOeWvJTf34ohIfgbmETjp+a49qyZP1GLGHkmLEgO23ZYZii1pbzPbZMz7lLw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PSAPR04MB4726.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6506007)(316002)(3480700007)(26005)(966005)(508600001)(33656002)(55016003)(16799955002)(54906003)(71200400001)(53546011)(110136005)(9686003)(7696005)(2906002)(38100700002)(66556008)(66946007)(76116006)(64756008)(4326008)(66476007)(38070700005)(83380400001)(8676002)(66446008)(45080400002)(86362001)(122000001)(8936002)(82960400001)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3367
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PSAAPC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b2014349-5fa9-43a5-1161-08da1266f84d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z12MXug8ssFvkXT8qmjruPkm3jFRyoeE6ssh+Vb41D4SwTaRmlJrRL8+RpFWVmse3Q2bOg+3JAI4aWN9zOmWArR5xARAAOtaZD6RmXuHCBom5h7PTLFFtSVIbIRxWcIEiSFUwZyN9+E3TffhffjnLZpE9nllGiamGw24hA5kZ44AFCniaSXUJAbh78TOzQ6jSnCXrFFrTCBEDsvwOpGjW5yBgoo2gVdzP00QShi/ehc2GXJVDNrV3HYve4rxXtkYRqS8IDoRlOuKFBmjzOuPse9TvB3xONllE8gvFRZXXb8LDHXxRfc1zpyIfgTPZyw37j6/2lv2cdkgwFExPTD2WXKf65Eumgad5DzKU6cCEUkA8cvDXmpAe03QOaYl8A9B2ci1Ci1Dit5nt1lwkP7XwNip5Ew8ba/FzsUeXZJ8jxrcviUnqMzIn0EF15tlGtV2yCt+LTZ28NL2IfcyitH90C0h6R36eZ3YNsdwGKk7EFHPC0slnzhfB4DAiqATDAQbC4fAsUX1kw88BOoucp7Mx2VgdJx9McCDmIQ3t5xQU+c+HllFo1aWD2N+TQbRjsBtS6talrK3hONM9ecsY4SVZq++iUAwPuuqI0iv6J08xJgA7GFIrIJRXwxwT0nz3f4T/5DQYs9UYOcK7oOu965o9EQxoWAwt9dvowLMZuLyyEXQOmUDpRDsjdq/gKocf0TeOHeLgRoV0DzUXrnYYootD5NTtd3ngRgliNPpa1y+pHfVscWUJo7nPyRMRfGe4gU5DONx1W4+aXSKNpFdLw86ZJU/MF7JpB6HK+TzcNpvy42H9g7f6PC8YXo7Hac913Jyo0+/a0MVm09wDV6IQckOB9nfGUQ3z9sxZdZifpzcSKk=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(16799955002)(966005)(7696005)(6506007)(45080400002)(55016003)(508600001)(316002)(356005)(83380400001)(36906005)(110136005)(26005)(81166007)(40460700003)(186003)(54906003)(33656002)(82960400001)(336012)(5660300002)(34020700004)(47076005)(8676002)(52536014)(3480700007)(86362001)(4326008)(8936002)(70206006)(70586007)(82310400004)(9686003)(2906002)(36860700001)(53546011)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 16:04:32.0513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f92fee6-0a7d-4e73-b746-08da1266fa74
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2302
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
Cc: "spinler@us.ibm.com" <spinler@us.ibm.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public

Thanks for your response. There are two ways to get this done.
1. bring support in phosphor-led-sysfs for defining multi-color and use the=
m in the application
2. Add support in multi-color led driver framework.
@Alexander @Andres Jefery Please provide your suggestions. We may be using =
this in multiple platforms. We can plan for the implementation.

Regards,
Velu

-----Original Message-----
From: Alexander A. Filippov <a.filippov@yadro.com>
Sent: Thursday, March 24, 2022 7:12 PM
To: sri d <srid.11486@gmail.com>
Cc: openbmc@lists.ozlabs.org; spinler@us.ibm.com; andrew@aj.id.au; bradleyb=
@fuzziesquirrel.com; Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: Re: Multi-led configuration in dts

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

On Thu, Mar 24, 2022 at 06:26:07PM +0530, sri d wrote:
>
> Hi Team,
>
> I am working on implementing Power and system identification LEDs, in whi=
ch LEDs are connected to GPIO pins directly. I need to handle two colors (b=
lue & yellow) for LEDs in *.dts file.
> In phosphor-led-sysfs repo, whether multi-led configuration is handled
> ?
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2FDocumentation%2Fdevicetree
> %2Fbindings%2Fleds%2Fleds-class-multicolor.yaml&amp;data=3D04%7C01%7Cvel
> umanit%40hcl.com%7C6e6ac0bef1cd4f6b11e308da0d9c2064%7C189de737c93a4f5a
> 8b686f4ca9941912%7C0%7C0%7C637837261456946008%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000&amp;sdata=3DTnjigzS2VvhsqrJk%2Bp9UkXxi7aozqbfgdITZQpK7uxQ%3D&amp;res
> erved=3D0
>

You could define them as two standalone LED and manage them separately.
It works fine even for a paired LED until you want to synchronized switchin=
g (for example: the blinking of mixed color).


> As far as I analyzed, multi-led seems to work for dedicated LED controlle=
rs and not for GPIO pins directly. Is there a way we can make it work for d=
irectly connected GPIOs ?
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> phoronix.com%2Fscan.php%3Fpage%3Dnews_item%26px%3DLinux-5.9-Multi-Colo
> r-LEDs&amp;data=3D04%7C01%7Cvelumanit%40hcl.com%7C6e6ac0bef1cd4f6b11e308
> da0d9c2064%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63783726145694
> 6008%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DJyoXl7fN6eYe6G5optiYYPkYoAJ
> bRXByJufEgN%2F3hiI%3D&amp;reserved=3D0
>

The multi-color LEDs are not supported by the gpio-led driver yet.

We have a desire to implement multi-color LED support in gpio-led driver, b=
ut it's a low priority task and I can't tell when it will be done. :)

> Thanks,
> Jayashree

--
Cheers,
Alexander
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________
