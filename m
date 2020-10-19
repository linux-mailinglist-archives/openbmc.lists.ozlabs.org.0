Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE4292C5A
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 19:09:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFNXN4d9HzDqWQ
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 04:09:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.133; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=CxGBd2yR; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=CxGBd2yR; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320133.outbound.protection.outlook.com [40.107.132.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFNWV1dSXzDqWG
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 04:08:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ki1WCVF5QQ2H7RNfxFCpykKXGkQqcs+yx8tMGuDMos=;
 b=CxGBd2yRQ5BWftIM91BazFZ9wnlAoara+Kgi4PZzBXnnv0B+H9KFcS3BmaWoc3caEp1YqMz+/LBTxISR5DUK2gimqMNshV3Ec95ZPGc2e+RzMw3koVR6eRmWouXRRyPpCPiSD4O1/ug6sB3AxVFH0Cu1blPWjmfiTcc2Gn0pfHY=
Received: from SG2PR03CA0136.apcprd03.prod.outlook.com (2603:1096:4:c8::9) by
 KL1PR0401MB2167.apcprd04.prod.outlook.com (2603:1096:802:5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Mon, 19 Oct
 2020 17:08:21 +0000
Received: from HK2APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c8:cafe::c8) by SG2PR03CA0136.outlook.office365.com
 (2603:1096:4:c8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.9 via Frontend
 Transport; Mon, 19 Oct 2020 17:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; fb.com; dkim=pass (signature was verified)
 header.d=HCL.COM;fb.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.56) by
 HK2APC01FT055.mail.protection.outlook.com (10.152.249.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 17:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbDk0cksd8PudKltpaXV0vOkA6zcRUZKfnu2cp1zkCPwvrZQB+1lSvHBoRwXr4zPBXnNXyjTjVvK7dNv2sm1vLyz/fASgHSg8JcYYdsdRonmNvXqWPrRnM1+GpyaR0BoHn3D6tVZSvS7gOBk5SEw8RFOkBkpy70Hz1AFeF43COmGuJDai0MCZuYRG6jBz58A6f/vOQm5KH23R0JHfOdDwip5eS3mFx2yjjfBZu+EQlinZCEhoiFJL5eA416HOKV5aiNU/xqWccs/MOv0OjhEHq7QhQhYlPOpNI2U8VRSLWfYNTH6xmwS2Jv4S3mH67zdxMEVB8Tujkhfj3zKKpgDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ki1WCVF5QQ2H7RNfxFCpykKXGkQqcs+yx8tMGuDMos=;
 b=comFYeWE2d65y2DNOY1mhWy9pmWS5lP9m+WdwHk31vI0wc/y8fBanPcIqZPN1omAk0Zi4aFqyfxjczadsbAJHdyIyg/6L2hCNKlwKTqRox9Vx2RRYKtJWXLsgt1hjDoShKJ2Ve2NDCYuO/HMPWaNobCFJzQPQwRwuFxKB7BnTT/lOTEbYd3Pt3B+s6nL1MqBDGib9+nHHPlic8NbLhskHX3/BPJT30TD3MLurZXiEdF72Q2u0zonwOrrP9hDSwllJr9z9wjBUnYuqDNseekhCJEi98r67tPuxz8WTLY2Jg9iGPNTZ9d6e0/3wInPgBiR6f/3bFhqIKXDtbBFZccQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ki1WCVF5QQ2H7RNfxFCpykKXGkQqcs+yx8tMGuDMos=;
 b=CxGBd2yRQ5BWftIM91BazFZ9wnlAoara+Kgi4PZzBXnnv0B+H9KFcS3BmaWoc3caEp1YqMz+/LBTxISR5DUK2gimqMNshV3Ec95ZPGc2e+RzMw3koVR6eRmWouXRRyPpCPiSD4O1/ug6sB3AxVFH0Cu1blPWjmfiTcc2Gn0pfHY=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB2733.apcprd04.prod.outlook.com (2603:1096:404:3a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 19 Oct
 2020 17:08:13 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 17:08:13 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Adriana Kobylak <anoo@linux.ibm.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Topic: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Index: AQHWkD7TytR1qVyzD0a6ZilIwzzPvqlzfzwAgAAUMICAD2ExBYAGY2f/gABH+wCAD2x4lf//sFYAgAaXEJE=
Date: Mon, 19 Oct 2020 17:08:13 +0000
Message-ID: <TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <20200921194614.GL6152@heinlein>
 <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>
 <TY2PR04MB33117717F809C0804A00B365CA300@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB3311812DB85A11934F044FB4CA0C0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
 <SL2PR04MB330696831B49B81F75168538CA020@SL2PR04MB3306.apcprd04.prod.outlook.com>,
 <8EF4ECDB-2EA4-4620-B7EE-FBB899FD1C47@fb.com>
In-Reply-To: <8EF4ECDB-2EA4-4620-B7EE-FBB899FD1C47@fb.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [117.248.22.160]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 730f3ed0-a098-4176-2087-08d87451946d
x-ms-traffictypediagnostic: TY2PR04MB2733:|KL1PR0401MB2167:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB21674AE2F3CF5638B456D989CA1E0@KL1PR0401MB2167.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nVJ4SU8A07RsSYMwijzXpL6m9NzE9TqR6LhL0nMrGYC5nucGKJIypq4B1v2miNWaK0tWmvMUXgLgMKQPS2t5M3jAXroLH+CkIDo56l4YlIAeRFuwzuCkAy9zaau0pArPPIrWwmLX5uzC6wsbHvZBA16AyvMaP4+AZxtbTrzU7jrUQaM3NUJOiu6Ocr5Ta2crmfHDikdqqevkWoJ+eIGiEPW/+9lUZzd4SmIWK2yiKS0n+0YcCsbRDch7p70OfIvZ8TzP9x47ek7CM4x51y4JFA+J5ENd5p9281M3XmMc7mkT7wlx768xnB5hsDFWzzKSL0KqHxeR+3erZSc0levarzeNZDsMKCmMkgEb6tS0LFpTiXlEKr4btobIV8zRmF71qMBp1Kubty6wqZarlS7q/w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(33656002)(19627405001)(6506007)(66946007)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(2906002)(83380400001)(5660300002)(19627235002)(8676002)(9686003)(316002)(55016002)(53546011)(4326008)(8936002)(26005)(478600001)(186003)(86362001)(52536014)(966005)(71200400001)(54906003)(7696005)(110136005)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OXeXv1VcI7/81ZWqiCWxRtNPqvLSIgBI1b1TMptYIsHGjx/WWChIpawoNhLj1r7Us95VS1UXBNyNxzetqp5MikAnHjv7yJqycVWgDrAGk6/bCktrlktdDtQOvtHxhOG+Ex3i+GUMfacovPHB0ptEoAk0YdZSub/XuLxSFEtDlB861Kx29A32MMzX9K8rthwGUWlKPer4gjfSTHVzP7aubbayKOLE+B9sOxMZcahNHJJOgoYXLvm96IbDR9TIiRE4xHFskd1Nm/f2nzZVMBOjGwGIujiskJcGcFnevRdD0fxFskqey4vtGPPzA6aaQEF3conZbOulv+riXvDZYzvWPbQEENNVRuuIigP6wJo1R7ThF66sI131A6HTqrFuDn/kzYcG/OTkxgqdBod37+82RDROwzGpTHd5c1q5XqnstJAKXA0jbNaSRfnjlbuMifhPCgszPWu5ytqZEo9jwdELg1WWwW3yDj5MRonKkkEX26bBYgCBRs6ohOs3yGnos+rgIfjjSUJGzFOG03ngwNv1HttSGHOg2HOGBIFe3x/XhrKHraT7MudLwEIb8zcCfiQReI1nWr/9kPAhMw4H/uEerXqEofNfh7DynAEFtIinQoMSShULwzV06ZHDEcpRI5Z17E7SCJUtQlFnqTuRdFvsxg==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2733
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b638fe1a-1140-48c1-a845-08d874519070
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKBZi6bS+72y9zdtYeDQ7kRTPs55sKgyShNtv7tXQc44/JiT5t1AL3NI+wCJUGPmOgmprZzC5gJWWUDvERoxLWoLcEyS9/Bi6bf477m5F2grFg2AylUbotqFgRc0WgfReNQsQszluSyq63GGGlvVs6OpvK7xrFJv+9uiM1SQ27Dy5K7iEi/+gkKjy551uxfmXpDJxmUojMhvuB3m+vFAJ8oYLp0uiALNvwLn7VGpHbPp0L57sKLj5cKBoVD0lUsauWazoIIv5n+Oqoe24LTiAvK4QumbauT1EYVGLv++J9b5W3gmFcE/JieCv0I0w0f7OfhwOMfBpk/qVL2x5eGR0wvSPye/c8EFgWhR3U9qTMsIbhMx3Q8Mqchq1ej77gxMTB+HxFl7v18h2ZXBIQEJlRs+jzjhS/FLva/TNmp8OeN12b5wzPnzqs20a9XH/WLc2t/Q7YFVg8Tw/WXkjhttQqqJKlmWAqcy2p/oMQQwGog=
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(5660300002)(19627405001)(47076004)(81166007)(19627235002)(82740400003)(356005)(4326008)(55016002)(36906005)(2906002)(8936002)(166002)(30864003)(110136005)(316002)(8676002)(83380400001)(336012)(86362001)(33656002)(9686003)(966005)(45080400002)(82310400003)(53546011)(7696005)(478600001)(26005)(70586007)(54906003)(186003)(70206006)(6506007)(52536014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 17:08:19.6336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 730f3ed0-a098-4176-2087-08d87451946d
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB2167
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>, "Velumani
 T-ERS, HCLTech" <velumanit@hcl.com>,
 "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[Vijay's Comment]
>Can we use extraversion field in manifest file to identify host id. In man=
ifest file, if purpose is >host then we can check extra version and >find o=
ut which host it is applicable for.

 [Priyatharshan Response]
We have already brought up the point of using manifest file. As a response,=
 Patrick mentioned as
"I can't imagine that a 16-blade BladeCenter would want to have 16 differen=
t files for each slot in the BladeCenter. That doesn't sound like a great u=
ser experience".

[Vijay's Comment]
>Or lese we can add another property in /xyz/openbmc_project/software,
>name as host id and user can set this property after uploading image.
>I don=92t agree with creating multiple interfaces for single image
>upgrade. Because image will be deleted after successful activation.

 [Priyatharshan Response]
Your suggestion of adding "host id" property is a good idea, but has few ca=
veates
*. If the image is deleted after programming each host, this brings a seque=
ntial nature where bios upgrade time prolongs as many times in multi-host e=
nvironment (for ex 16-BladeCenter)
*. the image needs to be copied into the target every time and the upgrades=
 needs to be started. The bios.bin file copy causes additional delay in the=
 upgradation
Based on the approach which we porposed,
*. with the single bios image, multiple host can be upgraded using "Request=
Activation" in each interface without deleting the bios image
*. as it is multi object approach (one for each host), multiple host could =
be programmed concurrently
This would save bios upgrade time.

@Vijay Khemka @patrick@stwcx.xyz @Adriana Kobylak: Kindly share your though=
ts on this.

Thanks,
Priyatharshan P
________________________________
From: Vijay Khemka <vijaykhemka@fb.com>
Sent: 16 October 2020 00:58
To: P. Priyatharshan <PriyatharshanP@hcl.com>; Adriana Kobylak <anoo@linux.=
ibm.com>
Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; anoo@us.ibm.com <a=
noo@us.ibm.com>; ojayanth@in.ibm.com <ojayanth@in.ibm.com>; gmills@linux.vn=
et.ibm.com <gmills@linux.vnet.ibm.com>; Velumani T-ERS,HCLTech <velumanit@h=
cl.com>; ratagupt@linux.vnet.ibm.com <ratagupt@linux.vnet.ibm.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:


[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Can we use extraversion field in manifest file to identify host id.

In manifest file, if purpose is host then we can check extra version

and find out which host it is applicable for.



Or lese we can add another property in /xyz/openbmc_project/software,

name as host id and user can set this property after uploading image.

I don=92t agree with creating multiple interfaces for single image

upgrade.  Because image will be deleted after successful activation.



From: openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> on be=
half of "P. Priyatharshan" <PriyatharshanP@hcl.com>
Date: Thursday, October 15, 2020 at 10:18 AM
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "anoo@us.ibm.com=
" <anoo@us.ibm.com>, "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>, "gmills@l=
inux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>, "Velumani T-ERS, HCLTech" <=
velumanit@hcl.com>, "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.=
com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:



Thanks Adriana for the clarification.



For host bios update, the images will be copied to BMC(/tmp/images) and wil=
l start flashing by making RequestedActivation field "xyz.openbmc_project.S=
oftware.Activation.RequestedActivations.Active". In our case, the device lo=
cation will be same for all the bios images (BMC /tmp/images).So I think th=
e above design you proposed[id =3D version+volume ID]  may not work effecti=
vely for multi host as the id is still going to be same for all the hosts.



We would like to propose the following approach for your review.Kindly go t=
hrough the below steps and share your valuable suggestions.



1.Number of host will be identified from machine layer [OBMC_HOST_INSTANCES=
]



2.Code will be modified to create n number of objects based on number of ho=
sts



  Ex: Log taken in YosemiteV2 [4 host]



root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.BMC.Updater

`-/xyz

  `-/xyz/openbmc_project

    `-/xyz/openbmc_project/software

      |-/xyz/openbmc_project/software/1929c585

      |-/xyz/openbmc_project/software/host1

      | `-/xyz/openbmc_project/software/host1/28bd62d9

      |-/xyz/openbmc_project/software/host2

      | `-/xyz/openbmc_project/software/host2/28bd62d9

      |-/xyz/openbmc_project/software/host3

      | `-/xyz/openbmc_project/software/host3/28bd62d9

      `-/xyz/openbmc_project/software/host4

        `-/xyz/openbmc_project/software/host4/28bd62d9

root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.Version

`-/xyz

  `-/xyz/openbmc_project

    `-/xyz/openbmc_project/software

      |-/xyz/openbmc_project/software/host1

      | `-/xyz/openbmc_project/software/host1/28bd62d9

      |-/xyz/openbmc_project/software/host2

      | `-/xyz/openbmc_project/software/host2/28bd62d9

      |-/xyz/openbmc_project/software/host3

      | `-/xyz/openbmc_project/software/host3/28bd62d9

      `-/xyz/openbmc_project/software/host4

        `-/xyz/openbmc_project/software/host4/28bd62d9





3.This will create activation interface for each host. For a multi-host sys=
tem if the  RequestedActivation is set to "xyz.openbmc_project.Software.Act=
ivation.RequestedActivations.Active", then different bios service file will=
 be called based the host.



For single host : biosServiceFile =3D "obmc-flash-host-bios@" + versionId +=
 ".service";

For multi host  : biosServiceFile =3D  "obmc-flash-host" + host + "-bios@" =
+ versionId + ".service";





Then it can be used for multi host even if the firmware image we want to in=
stall is the same for multiple host targets.



I have created a WIP patch for the design proposed above.Kindly have a glan=
ce and share your comments.



https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/37448=
<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit=
.openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-bmc-code-mgmt%2F%2B%2F37448&d=
ata=3D04%7C01%7CPriyatharshanP%40hcl.com%7C360bd4e12c3f4766c18708d87140813c=
%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637383869156208822%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&sdata=3DmCKg9YzRECFzIbB0Mp78FH6r5SbSXzWs2HZG4RSHo%2Bs%3D&reser=
ved=3D0>



Thanks,

Priyatharshan P



________________________________

From: Adriana Kobylak <anoo@linux.ibm.com>
Sent: 06 October 2020 03:11
To: P. Priyatharshan <PriyatharshanP@hcl.com>
Cc: Patrick Williams <patrick@stwcx.xyz>; Velumani T-ERS,HCLTech <velumanit=
@hcl.com>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; anoo@us.ibm=
.com <anoo@us.ibm.com>; ojayanth@in.ibm.com <ojayanth@in.ibm.com>; gmills@l=
inux.vnet.ibm.com <gmills@linux.vnet.ibm.com>; ratagupt@linux.vnet.ibm.com =
<ratagupt@linux.vnet.ibm.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:



[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Hi Priyatharshan,

>  Object : /xyz/openbmc_project/software/[FIRMWARE_VERSION]_[DEVICE]
> where device could be host1, 2, ...,N
>  Interface : xyz.openbmc_project.Software.Activation
>
>  Please confirm if our understanding is correct.

I meant that to generate the id, which currently uses the version
string, would instead use the version string plus the string for the
name of the device where it's stored in order to generate the hash. For
example, today the code calls "SHA512_Update("version")", where
"version" is for example "2.9.0-dev-663-g2e34bb673". Instead the code
would detect this version is stored let's say in device "mtd1" or
"mmcblk0p1", it'd then append that device string to version, ex:
"2.9.0-dev-663-g2e34bb673-mmcblk0p1" and pass that string to
SHA512_Update(), therefore creating a different hash depending where
that version of bmc code is stored.

Note that this is for BMC versions only. We discussed that for host
versions, we'd need to modify the code to add a "os-release" file under
/media/ that contained the host version information similar to the BMC's
os-release file. In addition, we'd need to somehow determine that those
files were for host (Bios) versions instead of BMC ones. Perhaps
os-release could have an additional field added to specify the purpose.


> Adriana, Any tentative timeline on your commits availability [generate
> the id based on firmware version plus the device or volume ]

I'd say by early next year at the latest.

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

--_000_TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0TY2PR04MB3311apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[Vijay's Comment]
<div>&gt;Can we use extraversion field in manifest file to identify host id=
. In manifest file, if purpose is &gt;host then we can check extra version =
and &gt;find out which host it is applicable for.</div>
<div><br>
</div>
<div>&nbsp;[Priyatharshan Response]</div>
<div>We have already brought up the point of using manifest file. As a resp=
onse, Patrick mentioned as</div>
<div>&quot;I can't imagine that a 16-blade BladeCenter would want to have 1=
6 different files for each slot in the BladeCenter. That doesn't sound like=
 a great user experience&quot;.</div>
<div><br>
</div>
<div>[Vijay's Comment]</div>
<div>&gt;Or lese we can add another property in /xyz/openbmc_project/softwa=
re,</div>
<div>&gt;name as host id and user can set this property after uploading ima=
ge.</div>
<div>&gt;I don=92t agree with creating multiple interfaces for single image=
</div>
<div>&gt;upgrade. Because image will be deleted after successful activation=
.</div>
<div><br>
</div>
<div>&nbsp;[Priyatharshan Response]</div>
<div>Your suggestion of adding &quot;host id&quot; property is a good idea,=
 but has few caveates</div>
<div>*. If the image is deleted after programming each host, this brings a =
sequential nature where bios upgrade time prolongs as many times in multi-h=
ost environment (for ex 16-BladeCenter)</div>
<div>*. the image needs to be copied into the target every time and the upg=
rades needs to be started. The bios.bin file copy causes additional delay i=
n the upgradation</div>
<div>Based on the approach which we porposed,</div>
<div>*. with the single bios image, multiple host can be upgraded using &qu=
ot;RequestActivation&quot; in each interface without deleting the bios imag=
e</div>
<div>*. as it is multi object approach (one for each host), multiple host c=
ould be programmed concurrently</div>
<div>This would save bios upgrade time.</div>
<div><br>
</div>
@Vijay Khemka @patrick@stwcx.xyz @Adriana Kobylak: Kindly share your though=
ts on this.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vijay Khemka &lt;vija=
ykhemka@fb.com&gt;<br>
<b>Sent:</b> 16 October 2020 00:58<br>
<b>To:</b> P. Priyatharshan &lt;PriyatharshanP@hcl.com&gt;; Adriana Kobylak=
 &lt;anoo@linux.ibm.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; anoo@=
us.ibm.com &lt;anoo@us.ibm.com&gt;; ojayanth@in.ibm.com &lt;ojayanth@in.ibm=
.com&gt;; gmills@linux.vnet.ibm.com &lt;gmills@linux.vnet.ibm.com&gt;; Velu=
mani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;; ratagupt@linux.vnet.ibm.com
 &lt;ratagupt@linux.vnet.ibm.com&gt;<br>
<b>Subject:</b> Re: Multi host bios upgrade support in phosphor-bmc-code-mg=
mt:</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
span.x_EmailStyle19
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<p></p>
<p class=3D"x_MsoNormal" style=3D"line-height:12.0pt; background:#FFEB9C"><=
b><span style=3D"font-size:11.0pt; color:#9C6501"></span></b><span style=3D=
"font-size:10.0pt; color:red">[CAUTION: This Email is from outside the Orga=
nization. Unless you trust the sender, Don=92t
 click links or open attachments as it may be a Phishing email, which can s=
teal your Information and compromise your Computer.]</span></p>
<div>
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Can we use extraversion field in manifest file to =
identify host id.</p>
<p class=3D"x_MsoNormal">In manifest file, if purpose is host then we can c=
heck extra version</p>
<p class=3D"x_MsoNormal">and find out which host it is applicable for.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Or lese we can add another property in <span style=
=3D"font-size:12.0pt; color:black">
/xyz/openbmc_project/software,</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">name=
 as host id and user can set this property after uploading image.</span></p=
>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">I do=
n=92t agree with creating multiple interfaces for single image</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">upgr=
ade. &nbsp;Because image will be deleted after successful activation.</span=
></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div style=3D"border:none; border-top:solid #B5C4DF 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:12.0pt; color:black">F=
rom: </span>
</b><span style=3D"font-size:12.0pt; color:black">openbmc &lt;openbmc-bounc=
es+vijaykhemka=3Dfb.com@lists.ozlabs.org&gt; on behalf of &quot;P. Priyatha=
rshan&quot; &lt;PriyatharshanP@hcl.com&gt;<br>
<b>Date: </b>Thursday, October 15, 2020 at 10:18 AM<br>
<b>To: </b>Adriana Kobylak &lt;anoo@linux.ibm.com&gt;<br>
<b>Cc: </b>&quot;openbmc@lists.ozlabs.org&quot; &lt;openbmc@lists.ozlabs.or=
g&gt;, &quot;anoo@us.ibm.com&quot; &lt;anoo@us.ibm.com&gt;, &quot;ojayanth@=
in.ibm.com&quot; &lt;ojayanth@in.ibm.com&gt;, &quot;gmills@linux.vnet.ibm.c=
om&quot; &lt;gmills@linux.vnet.ibm.com&gt;, &quot;Velumani T-ERS, HCLTech&q=
uot; &lt;velumanit@hcl.com&gt;, &quot;ratagupt@linux.vnet.ibm.com&quot;
 &lt;ratagupt@linux.vnet.ibm.com&gt;<br>
<b>Subject: </b>Re: Multi host bios upgrade support in phosphor-bmc-code-mg=
mt:</span></p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Than=
ks Adriana for the clarification.
</span></p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">For =
host bios update, the images will be copied to BMC(/tmp/images) and will st=
art flashing by making RequestedActivation field &quot;xyz.openbmc_project.=
Software.Activation.RequestedActivations.Active&quot;.
 In our case, the device location will be same for all the bios images (BMC=
 /tmp/images).So I think the above design you proposed[id =3D version+volum=
e ID] &nbsp;may not work effectively for multi host as the id is still goin=
g to be same for all the hosts.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; </span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">We w=
ould like to propose the following approach for your review.Kindly go throu=
gh the below steps and share your valuable suggestions.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">1.Nu=
mber of host will be identified from machine layer [OBMC_HOST_INSTANCES]</s=
pan></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">2.Co=
de will be modified to create n number of objects based on number of hosts<=
/span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; Ex: Log taken in YosemiteV2 [4 host]</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">root=
@yosemitev2:~# busctl tree xyz.openbmc_project.Software.BMC.Updater</span><=
/p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">`-/x=
yz</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; `-/xyz/openbmc_project</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; `-/xyz/openbmc_project/software</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/1929c585</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host1</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host1/28bd62d9</span></p=
>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host2</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host2/28bd62d9</span></p=
>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host3</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host3/28bd62d9</span></p=
>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4/28bd62d9</spa=
n></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">root=
@yosemitev2:~# busctl tree xyz.openbmc_project.Software.Version</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">`-/x=
yz</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; `-/xyz/openbmc_project</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; `-/xyz/openbmc_project/software</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host1</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host1/28bd62d9</span></p=
>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host2</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host2/28bd62d9</span></p=
>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; |-/xyz/openbmc_project/software/host3</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; | `-/xyz/openbmc_project/software/host3/28bd62d9</span></p=
>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p; &nbsp; &nbsp; &nbsp; `-/xyz/openbmc_project/software/host4/28bd62d9</spa=
n></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">3.Th=
is will create activation interface for each host. For a multi-host system =
if the &nbsp;RequestedActivation is set to &quot;xyz.openbmc_project.Softwa=
re.Activation.RequestedActivations.Active&quot;, then
 different bios service file will be called based the host.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">For =
single host : biosServiceFile =3D &quot;obmc-flash-host-bios@&quot; + versi=
onId + &quot;.service&quot;;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">For =
multi host &nbsp;: biosServiceFile =3D &nbsp;&quot;obmc-flash-host&quot; + =
host + &quot;-bios@&quot; + versionId + &quot;.service&quot;;
</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Then=
 it can be used for multi host even if the firmware image we want to instal=
l is the same for multiple host targets.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">I ha=
ve created a WIP patch for the design proposed above.Kindly have a glance a=
nd share your comments.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black"><a h=
ref=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
gerrit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-bmc-code-mgmt%2F%2B%2F3=
7448&amp;data=3D04%7C01%7CPriyatharshanP%40hcl.com%7C360bd4e12c3f4766c18708=
d87140813c%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637383869156208822%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DmCKg9YzRECFzIbB0Mp78FH6r5SbSXzWs2HZG4RSH=
o%2Bs%3D&amp;reserved=3D0" originalsrc=3D"https://gerrit.openbmc-project.xy=
z/c/openbmc/phosphor-bmc-code-mgmt/+/37448" shash=3D"zKq2pSytyb/Uv5Ohh/2L7U=
c8rjGtWlWhv3IeHJFajPxjfy/Asf/omiEywrqePmMwAzyu8WQMM3yLWv92DGjPXfvGFHuf/9nYq=
8KMgC0a8BtVwDGh172rmzFyQf9tQo4Kx8lTh71bv84P9UM4kSIkjIAhDxqwn47LRKXUuEdc/bo=
=3D">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/=
37448</a></span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Than=
ks,</span></p>
</div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Priy=
atharshan P
</span></p>
</div>
</div>
</div>
</div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"0" width=3D"100%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Adriana Kobylak &lt;anoo@linux.ibm.com&gt;<br>
<b>Sent:</b> 06 October 2020 03:11<br>
<b>To:</b> P. Priyatharshan &lt;PriyatharshanP@hcl.com&gt;<br>
<b>Cc:</b> Patrick Williams &lt;patrick@stwcx.xyz&gt;; Velumani T-ERS,HCLTe=
ch &lt;velumanit@hcl.com&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.oz=
labs.org&gt;; anoo@us.ibm.com &lt;anoo@us.ibm.com&gt;; ojayanth@in.ibm.com =
&lt;ojayanth@in.ibm.com&gt;; gmills@linux.vnet.ibm.com &lt;gmills@linux.vne=
t.ibm.com&gt;;
 ratagupt@linux.vnet.ibm.com &lt;ratagupt@linux.vnet.ibm.com&gt;<br>
<b>Subject:</b> Re: Multi host bios upgrade support in phosphor-bmc-code-mg=
mt:</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal">[CAUTION: This Email is from outside the Organizat=
ion. Unless you trust the sender, Don=92t click links or open attachments a=
s it may be a Phishing email, which can steal your Information and compromi=
se your Computer.]<br>
<br>
Hi Priyatharshan,<br>
<br>
&gt;&nbsp; Object : /xyz/openbmc_project/software/[FIRMWARE_VERSION]_[DEVIC=
E]<br>
&gt; where device could be host1, 2, ...,N<br>
&gt;&nbsp; Interface : xyz.openbmc_project.Software.Activation<br>
&gt;<br>
&gt;&nbsp; Please confirm if our understanding is correct.<br>
<br>
I meant that to generate the id, which currently uses the version<br>
string, would instead use the version string plus the string for the<br>
name of the device where it's stored in order to generate the hash. For<br>
example, today the code calls &quot;SHA512_Update(&quot;version&quot;)&quot=
;, where<br>
&quot;version&quot; is for example &quot;2.9.0-dev-663-g2e34bb673&quot;. In=
stead the code<br>
would detect this version is stored let's say in device &quot;mtd1&quot; or=
<br>
&quot;mmcblk0p1&quot;, it'd then append that device string to version, ex:<=
br>
&quot;2.9.0-dev-663-g2e34bb673-mmcblk0p1&quot; and pass that string to<br>
SHA512_Update(), therefore creating a different hash depending where<br>
that version of bmc code is stored.<br>
<br>
Note that this is for BMC versions only. We discussed that for host<br>
versions, we'd need to modify the code to add a &quot;os-release&quot; file=
 under<br>
/media/ that contained the host version information similar to the BMC's<br=
>
os-release file. In addition, we'd need to somehow determine that those<br>
files were for host (Bios) versions instead of BMC ones. Perhaps<br>
os-release could have an additional field added to specify the purpose.<br>
<br>
<br>
&gt; Adriana, Any tentative timeline on your commits availability [generate=
<br>
&gt; the id based on firmware version plus the device or volume ]<br>
<br>
I'd say by early next year at the latest.</p>
</div>
</div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:7.5pt; font-family:&quot;=
Arial&quot;,sans-serif; color:gray">::DISCLAIMER::</span></p>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center"><sp=
an style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-serif; colo=
r:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:7.5pt; font-family:&quot;=
Arial&quot;,sans-serif; color:gray">The contents of this e-mail and any att=
achment(s) are confidential and intended for the named recipient(s) only. E=
-mail transmission is not guaranteed to be secure
 or error-free as information could be intercepted, corrupted, lost, destro=
yed, arrive late or incomplete, or may contain viruses in transmission. The=
 e mail and its contents (with or without referred errors) shall therefore =
not attach any liability on the
 originator or HCL or its affiliates. Views or opinions, if any, presented =
in this email are solely those of the author and may not necessarily reflec=
t the views or opinions of HCL or its affiliates. Any form of reproduction,=
 dissemination, copying, disclosure,
 modification, distribution and / or publication of this message without th=
e prior written consent of authorized representative of HCL is strictly pro=
hibited. If you have received this email in error please delete it and noti=
fy the sender immediately. Before
 opening any email and/or attachments, please check them for viruses and ot=
her defects.</span></p>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center"><sp=
an style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-serif; colo=
r:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
</div>
</div>
</div>
</body>
</html>

--_000_TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0TY2PR04MB3311apcp_--
