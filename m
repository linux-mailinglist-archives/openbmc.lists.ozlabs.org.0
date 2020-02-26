Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EA170E67
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:27:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sc5M0JjJzDqT9
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:27:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.122; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=lGBJr1Gs; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=lGBJr1Gs; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300122.outbound.protection.outlook.com [40.107.130.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SL8K6g1DzDqB5
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 02:59:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI/p++apTnp5Oi8cCBpF3+EeTdqRFUfRaXj3D0q9CBA=;
 b=lGBJr1GseSqCLt99vIJNQJBhKL+U+tBcCMRV73kxg/jwIrNLgQcOX6uPJpU6sK09xkVdTnbxKK9MGaZu25sxZOzXvh3rn+es4UQDhK3ixZ8jvgQG6gQcOzuJStwzbeXakjdX7PG1taRXtgyTyJOEyEfqEa7QAhHvV53e1ODFu38=
Received: from PS1PR0401CA0043.apcprd04.prod.outlook.com (2603:1096:803::11)
 by SG2PR04MB3546.apcprd04.prod.outlook.com (2603:1096:4:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 15:59:05 +0000
Received: from SG2APC01FT039.eop-APC01.prod.protection.outlook.com
 (2a01:111:f400:7ebe::205) by PS1PR0401CA0043.outlook.office365.com
 (2603:1096:803::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 15:59:05 +0000
Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; aj.id.au; dkim=pass (signature was verified)
 header.d=HCL.COM;aj.id.au; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.52) by
 SG2APC01FT039.mail.protection.outlook.com (10.152.251.12) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Wed, 26 Feb 2020 15:59:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgD3WWrqcqpHKsGN/KuhROvxAO4Wt4wR4oL/NCkJ7LPwLgLEUFsacV1ThI7MCM8fB6uYrwVy6zaVwB41hUGsKMU7znylYuX5UlhdVq3040PqVpjWCYifd4xItcaDYorpI3ZIYBlmffebFgOD3ZuYlgmCEdURhKXzBSl91RRaJJSvKMZU1/5sfqGAnfuRbSgGtMhRbe5RMwBYUJ7AUnnlDG2XY/LnOcOWAs6rwOclbKCLYQHxKI+UB1Sv+dm/VNGOlNOTsOvw2jbY7JJ3tlvwhMU85WUu0gLGMHK4i5lbwZmyUTBvu79xSWqtsfA7JBkD2LDgVBVbcjO+0t8Hjq0Sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI/p++apTnp5Oi8cCBpF3+EeTdqRFUfRaXj3D0q9CBA=;
 b=ZSYZuNkbSZhQXuTSpCfuI7eVWjm8ydnd+QJ8lbWoA0EHojMqAjYrPYezKnMj6WXnbbXv6AnairsCmBOKt7ZEHR3LXRwyAXvW0NqAAnVQxJpv/XTqqn1VblnoatnC51jhst8Barf2wEk6m56yMgTr/46mFwOaq3oYQbTD37rBnj2VnnUI+hAmlRE8k4NKOXWxEpgwgIGAosj2xwljvb1fAiUzLBux0nQ5mYnpXbUMUrteifAzOKcT+9/QEHksKLIQzOmZkpTSUIzoEqAagCgq8EjljKzJtDx0V7fnULZLlMH7zjn6LOANnAPHfNdnbyOWrJoJNjMLPlCDIWhVcoYH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI/p++apTnp5Oi8cCBpF3+EeTdqRFUfRaXj3D0q9CBA=;
 b=lGBJr1GseSqCLt99vIJNQJBhKL+U+tBcCMRV73kxg/jwIrNLgQcOX6uPJpU6sK09xkVdTnbxKK9MGaZu25sxZOzXvh3rn+es4UQDhK3ixZ8jvgQG6gQcOzuJStwzbeXakjdX7PG1taRXtgyTyJOEyEfqEa7QAhHvV53e1ODFu38=
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com (20.177.93.17) by
 SG2PR04MB3448.apcprd04.prod.outlook.com (20.177.92.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Wed, 26 Feb 2020 15:59:01 +0000
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::b81f:3d84:4a0c:b0ca]) by SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::b81f:3d84:4a0c:b0ca%3]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 15:59:01 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: obmc-console design for multi host support
Thread-Topic: obmc-console design for multi host support
Thread-Index: AdXm91y2HzF+4aeQSEmyf5zx3Cqy5AAinyYAABfmB4ABNvkUkA==
Date: Wed, 26 Feb 2020 15:59:01 +0000
Message-ID: <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: null
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjcxNjIzNzktOWUxNS00NTQyLWIyNzQtNjA4YWZiNDhiNmI0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkNWV2VlOGd5OUZ4dXkxclwvdGdYR0RCTVQxbTFGeHFDMTY1eUorS1huT0NcL3lCTGxPTE9sSTdcL01RNUNtektoQzAifQ==
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=thangavel.k@hcl.com; 
x-originating-ip: [192.8.255.10]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5a6a7314-7dfa-48d3-3c8b-08d7bad4ce2b
X-MS-TrafficTypeDiagnostic: SG2PR04MB3448:|SG2PR04MB3448:|SG2PR04MB3546:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB3546627F7A099EF9F8669AF8FDEA0@SG2PR04MB3546.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:5797;
x-forefront-prvs: 0325F6C77B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(66446008)(64756008)(66476007)(66946007)(66556008)(76116006)(966005)(45080400002)(110136005)(9686003)(54906003)(316002)(55016002)(4326008)(478600001)(33656002)(7696005)(71200400001)(186003)(52536014)(2906002)(26005)(81156014)(53546011)(5660300002)(8676002)(81166006)(86362001)(8936002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3448;
 H:SG2PR04MB3029.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cKpON+CajtltciZYvzAz9IAs9jw1YtA6K8oVfVYllN6Foi5mT78Bz44JD4A8/MWwYtjfIQ5uRbiY/h0stco5qDppu/YrmyrJGrX0a4f9U//o3fGioiWDAPV+UPBn0FeNjumLlvYkhhIJrnGNiiEIVgqPZlFwdC7saGd47BD2GqHzVWFbztTI6AjB+qYc9zmVNZoGr4tw/BdRVkDNLbEAvMuJbaHN9tdfqe7OPOD1LVhHvbW6QiXNu7m1lipNtlssSIXi19lN5fKNKhBkdGO01nKVAiNqKkGzDcJS1PcEqBGUNBv6HTlSkpzLPf6FFHvTccQKEBVqnuwiyw1B6oXzt6dzkO4E9pf7RN/tguv5p3wegKP8moxcnc3gWZYjoys06rYTUFihO15meHdvov9KyaVGwMje2I+hnuvP8TV/wMJwr/maB+zIosIw0/Q+gyrnmifRQx+cwDc3orPRFGZFUjzOAOW9QPQbt3XvyqlE9xSMn8ITL8UrdM6kN6X/+XxMq/ztAMDrqnA/AFsPhuHfwA==
x-ms-exchange-antispam-messagedata: TbyPnFvXAj33kGP6nNI3JNGIWRaSF8in1lqMi2KGJ5A684yfFsmhHT/1UcsmoF8bhGdH8q5XL945bjYdDCiDIklwakzUDj6fvs4/W9U/4SsH78q8SLsrD+g3bYedOHrW7Fltanh6t3MxDygnbM3k9w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3448
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT039.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.52; IPV:; CTRY:IN; EFV:NLI; SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(199004)(189003)(81156014)(2906002)(478600001)(8676002)(81166006)(316002)(8936002)(53546011)(55016002)(110136005)(5660300002)(33656002)(9686003)(70206006)(6506007)(70586007)(54906003)(52536014)(4326008)(186003)(26005)(86362001)(336012)(356004)(45080400002)(7696005)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3546;
 H:APC01-HK2-obe.outbound.protection.outlook.com; FPR:; SPF:Pass; LANG:en;
 PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d9eb1b69-31fd-450c-bd9c-08d7bad4cbe6
X-Forefront-PRVS: 0325F6C77B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWQWMm3BsylYt4MLPcyGWO3CUdTiuKSw+vWpgikFAVrqzNOCZ7d2bU/vwtFVRUwwPMbRV13mWvNV1i5Zoa+QDrvuQdYBq8THUNBNry63pZ6gGepftYfBjqe8Ef3p/X7WiDdPGIBUZTsY7sIKSxX57Xzdhqqxd5v8tyUrpwHMLSbS3nL74zUWVm6PBFB+h7Ztb+oma3jNZnODeloScAIkKqn0ld37l585KFXy86Cdnq+f2hNl5kLtbg6xCmkDvhbFOFaOAbxJHuF5vkbjC7EObVe7Ra8Ebq+uN3KpzlimZka4vn9yCurf8drtfY5WHL3QBZJI+xcjQFOwIVIMoJGHoHfUmKyYZ21ADxhSOMSxR3r/X1BZNO7lAiA9Jv4GYYXGU9MkmvSqpVY2EJtoNzkGwN4SkHIhnekmhz8cc3kvCITdz7ysImcHg4T8wVkzm9xFT/ckrtMFr7lUt2Y14RKoUqhcsPCSaS36MquDTXuqQkChdDgihL+1KS5QXXqxsAd/R6g3ldLm40b4jvwsKJQAvg==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 15:59:04.6143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6a7314-7dfa-48d3-3c8b-08d7bad4ce2b
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3546
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:42 +1100
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
Cc: "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

             Could you please suggest how to add configs for multiple host =
?

Thanks,
Kumar.

-----Original Message-----
From: Kumar Thangavel
Sent: Thursday, February 20, 2020 5:43 PM
To: Andrew Jeffery <andrew@aj.id.au>; openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>; Joel Stanley <joel@jms.id.au>; Velumani T-=
ERS,HCLTech <velumanit@hcl.com>
Subject: RE: obmc-console design for multi host support

Hi Andrew,

       Thanks for your response and information.

       Please find my response inline below.

Thanks,
Kumar.

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>
Sent: Thursday, February 20, 2020 5:38 AM
To: Kumar Thangavel <thangavel.k@hcl.com>; openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>; Joel Stanley <joel@jms.id.au>; Velumani T-=
ERS,HCLTech <velumanit@hcl.com>
Subject: Re: obmc-console design for multi host support

[CAUTION: This Email is from outside the Organization. Do not click links o=
r open attachments unless you trust the sender.]

Hi Kumar,

On Wed, 19 Feb 2020, at 18:24, Kumar Thangavel wrote:
>
> Hi All,
>
>
>  Obmc-console application current design may not support multi host or
> multiple console. So, we proposed the design to handle multi
> host/multiple console in obmc-console client and server applications.

Thanks for writing a proposal.

>
>  Please find the attached design document.
>
>
>  Could you please review and provide your comments on this.

Interesting timing, because I've actually just solved this problem. Please =
review this series in Gerrit:

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.=
openbmc-project.xyz%2Fq%2Ftopic%3A%2522concurrent-servers%2522%2B(status%3A=
open%2520OR%2520status%3Amerged&amp;data=3D02%7C01%7Cthangavel.k%40hcl.com%=
7Cc3bc8632eb5b4b538a3508d7b59904ba%7C189de737c93a4f5a8b686f4ca9941912%7C0%7=
C0%7C637177541130921053&amp;sdata=3DHIYcn2Cd6tgCrAJCUwTaT5AqUkXfrB25HR0ncps=
ejdg%3D&amp;reserved=3D0)

Regarding the proposal, I have a few thoughts:

1. Please try to keep it to plain-text
2. If you have code it's best to post it straight away (rather than lead wi=
th a proposal and no code)

Kumar : Sure. Will Keep plain text for posting proposals/code.

On point 1, this is an open-source community and sending documents in forma=
ts like docx might mean that some people can't access them. Plain- text alw=
ays works, especially as emails are generally composed that way, which mean=
s you can put your proposal directly in an email and people can respond to =
it with ease.

On point 2, it seems that you've included screenshots of code changes that =
you have made locally - a few sub-points there:

a. Code is text - you can include snippets of it in your document directly,=
 which removes the need for rich media formats, which removes the need for =
something like docx.

b. If you've got code, push it to github or gerrit and we can look at it di=
rectly!

Kumar : Sure, Will keep code snippets in the plain text or will push it to =
github or gerrit.

On point b, given that this proposal largely deals with implementation deta=
ils, it's much more effective if you lead with code and then drive a discus=
sion on the list if necessary. At least this way we have something concrete=
 to point at and argue about, or in the happy case we can just merge it and=
 you've avoided the effort of driving redundant discussion.

Finally, these thoughts are about helping you help us help you to get your =
code merged with the least amount of effort/friction. Hopefully they are us=
eful to you :)

Kumar : I looked at your patches and this is really good information and ve=
ry helpful. Will look more in detail and get back to you.

Cheers,

Andrew
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
