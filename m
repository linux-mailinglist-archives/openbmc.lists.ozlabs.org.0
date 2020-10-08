Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63C287682
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 16:57:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Z6y49WqzDqWq
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 01:57:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.102; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=MweIIWEm; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=MweIIWEm; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300102.outbound.protection.outlook.com [40.107.130.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Z5d40HBzDqSv
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 01:56:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z957fZrlrZD0BXint1+N0DcSPCpp6cMN+JDKTWWesVU=;
 b=MweIIWEmTG1pu5mkIaPBnmFga8wgZoM87+m38SO/lGRsuZE9eW8CcSL4maRtJvc0l86r++36O/WdJmnm+VWFEU+VgENlJ1t1fLCIx+2THbU5wKnIYjBlZv9dG+kn6sn4yoKZ49XqinunxX4SM/68yvKib6u2TTEISySGKJEvtjg=
Received: from SLXP216CA0007.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::17) by
 PU1PR04MB2392.apcprd04.prod.outlook.com (2603:1096:803:37::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23; Thu, 8 Oct 2020 14:55:47 +0000
Received: from PU1APC01FT054.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:6:cafe::71) by SLXP216CA0007.outlook.office365.com
 (2603:1096:100:6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Thu, 8 Oct 2020 14:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=JPN01-OS2-obe.outbound.protection.outlook.com;
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (192.8.195.56) by
 PU1APC01FT054.mail.protection.outlook.com (10.152.253.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 14:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=airdIvYXIEITjN+qByqgm1KImf7jGLx0iU1y5xY/SPQyDMbJUgBoFfe7NQ/RnomSSpWd5TPBKqMO8RoGNr1DXa1CchIGrh5IZLC+B3V2OUnzGqUI9HJLGnQiKfdRtoN+IagZ8EoX64/WllMwiDBYHx+ReY6Ypu5XlvG+zgNVG7cRVMDxyzuyMvlXktRaJrSxlUl4ufomnCgTz/ifQJOy/hL7nDfzc2rJw4qyFMQN2VyT/Au8evFEaekl2N42fGp3riK5VBP1jb/xkMEvso1Znrp1Gt4sSuzrnhWUyi94fGjUuXhdcxZqeS+U6ApVzRejyfKBcJVmBP9xAx5RtLKlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z957fZrlrZD0BXint1+N0DcSPCpp6cMN+JDKTWWesVU=;
 b=dFBkeNJ0S/mqxSplok2wQPJlEkXt3Mq4xFdxIjrF5h7Kps8wE1bjQmk7AnWMf5lU2QG72Opq1Pg7zOlxHuGeBrk8DthfazdReAvLLoE9f6Xml+xSCOzB0PHfwnfmCMXOglB36IsFeiFSnIvp075kH/HZGfdevTUtabSCpyH1ety5IHkGT52n7sd52J2l/nYhEdOi7WLzms09hPaLmdmc++3rBakL6poXu2WrCXh6cg2yWad1ubeDSRFfBt3jxIF7AJ9kU14MB+ZYLDLcrkbEoIVLShO9reWZz3CkEQiV4e6A4Av6kuS9UQKy936IDypTvG4r1stXBcOmKCH5R7VRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z957fZrlrZD0BXint1+N0DcSPCpp6cMN+JDKTWWesVU=;
 b=MweIIWEmTG1pu5mkIaPBnmFga8wgZoM87+m38SO/lGRsuZE9eW8CcSL4maRtJvc0l86r++36O/WdJmnm+VWFEU+VgENlJ1t1fLCIx+2THbU5wKnIYjBlZv9dG+kn6sn4yoKZ49XqinunxX4SM/68yvKib6u2TTEISySGKJEvtjg=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TYAPR04MB2287.apcprd04.prod.outlook.com (2603:1096:404:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 8 Oct
 2020 14:55:42 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 14:55:42 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Anton Kachalov <rnouse@google.com>
Subject: Re: 12v slot AC Support in x86-power-control
Thread-Topic: 12v slot AC Support in x86-power-control
Thread-Index: AQHWnXlbCXE0CAvajEqEuW+b4a5apamNysDC
Date: Thu, 8 Oct 2020 14:55:42 +0000
Message-ID: <TY2PR04MB3311C405E8A3354EB91E3FC6CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <EC03A9B2-FE8C-499C-B456-E76EE677E28D@fb.com>
 <TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>,
 <CADVsX884=EN-RTAyvP9mT7VxE+xSR+vb2b-TF7zMH1vYqBTEuQ@mail.gmail.com>
In-Reply-To: <CADVsX884=EN-RTAyvP9mT7VxE+xSR+vb2b-TF7zMH1vYqBTEuQ@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [42.111.147.14]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3f9926c0-fea1-46b1-4d82-08d86b9a3d74
x-ms-traffictypediagnostic: TYAPR04MB2287:|PU1PR04MB2392:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PU1PR04MB2392B1FC7845156A77EB0F09CA0B0@PU1PR04MB2392.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rGmg3+3tzWJYO7C0HPU4l49AMWpQPqASwZwsf66Jyi5874MPkBNTZjGcwkUJck8k2iSDAEP2tUYs+LOgl7Nk8IMqDfHrUBKyR1uTxFyf1lHQ8uPAzH74iJoT5ejrfex3VP/ohOILuHFqLn/AwowRC4jbDupVnRY5K5XJb/mquiLeaaEFe643Tjf7AS7/C4/kobA58Fr1afWT/tHaVySJt7GmIn8i0j90kR8yKva7hRfLmB7p6VJq5xGcqE1W0DJq6u/iKQaCPHqidKD0SMmCDVnfCvaT/PWV3U2uw+oqORQxtYHFomW+ik4i1h0AHs4/7vrQOKVKGk/uV7xPWUqdM45DM7gR1bb9YRD9LDMPbPOYNxrErUh0TxpeLV6o8G648ipjHScGNWK63Jnzlc5FnQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(4326008)(53546011)(33656002)(83380400001)(5660300002)(316002)(52536014)(86362001)(19627405001)(71200400001)(2906002)(54906003)(6916009)(26005)(7696005)(166002)(186003)(6506007)(55016002)(478600001)(966005)(91956017)(76116006)(9686003)(8936002)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(83080400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zGf/fEyQX5r3HWp6Hrt/ANJIqFnumsu2ajwBgTFZpKlBlEnXk1f5S14MYlWJvUmduuXYQ5sXofUfJhKihFtYJwUH7Pa5KIGsUctDSUgQCoAGAqwEU6FynDe8nUndgys5+HBzWXce7p1SdTZfc5AIDgI53RXYQ5mOp6Hc+DI6Zi9WPkUR/sLTrkJKJX0pJnJjI1cyz5Q6bb3ZMOMNo1zn0TJfY8EEdmrjCKU0qJ+Tsw+WxMQOhNrSTtcJjWXzyb8zVAJ9yD4pFvflMz1lBKHUKTC4bCItB88ILmHw2BvLckJJyX2RtI5O2QWTjafHFhg1FjjmusQZTqjKUC87/px3jRvZgJCtwC0dC0YdWKyDaGews9lFAGhAstptMvapXdZWrH1t+3F7qiuzxHefIlTnGiBSjK+c/wxdKO1rvB4BshsKpGpnqSoQO+g9ayk4upUUQHHU7M5kbQ4ke9Gr6t89zH+LdRbdgA6ycAgCHOGHwzW0d7hLF/YOPu5aYGcyU8R2zfw4WLoKz6AQFO/otTW9sSbbJD2caqAz3HY3/ASkHfMFQ1zuMp3sqFAUKE8gqGHXhxV0uzfgl2c9X/jMrDcDCgBZnSvfWdTPRdluInKsTIBGtpvAizcRh7nbIniiKLfK/jTRUArLd4IlHWxuL0m9UA==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3311C405E8A3354EB91E3FC6CA0B0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2287
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e65683f7-2445-40f0-c262-08d86b9a3a64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFikwRkPaj8+de010BOeQKhVAOvQbCeeKzdpSCMjfm00mUA3ttfflSLtkklWoXoDC7rsLszPpelZquE+QnzWddgT2yZPxjPtnqsPIFDtKRUyHa4RmiWeHqbgjm0WFqZRPO04kirQT6vGSDgyXMTZdR/R8szRZv3BmJGDKedGzYn2fCErrsAA/kCrdXx/BhobNpq7BTHkf1xebcXiF4P0zAPvAboxMKCOQbokckMsMIcwqZ0dmpu8MV9VLaPDQZMQKt4QVu1OJDBoir2SkklVmyEEiSHb6nnzR4YT1WNza2iEZb15Vnrp9N8IsfX24tjoV5Mcb7jRvRD5/bwgEjjWYiIys50ALqKZ+cqzCPZBzjKNJv8IdqEW4QJUxUqeUewCRNIke3mYZM9FhVLkE75AmPiABLdf4GZzyKMNajgrA2XL90tapyfUAaDYpYR9aInPgzPBv3nFhNzBTSpHKGkuIdLsAduIJjPxCOczkz/8ODMeYGwTuvH5IL1keT/DRoYz
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JPN01-OS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(83380400001)(7696005)(26005)(8676002)(6916009)(8936002)(166002)(356005)(81166007)(83080400001)(34020700004)(82740400003)(47076004)(55016002)(4326008)(6506007)(186003)(53546011)(5660300002)(33656002)(2906002)(70206006)(54906003)(30864003)(36906005)(478600001)(316002)(9686003)(45080400002)(336012)(966005)(86362001)(82310400003)(52536014)(70586007)(19627405001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 14:55:46.4427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9926c0-fea1-46b1-4d82-08d86b9a3d74
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[JPN01-OS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR04MB2392
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
 "ed@tanous.net" <ed@tanous.net>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB3311C405E8A3354EB91E3FC6CA0B0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

We have a HSC sensor to control the power to a module and that has been con=
trolled by GPIO [No i2c bus or busses].

Thanks,
Priyatharshan P
________________________________
From: Anton Kachalov <rnouse@google.com>
Sent: 08 October 2020 19:15
To: P. Priyatharshan <PriyatharshanP@hcl.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>; openbmc@lists.ozlabs.org <openbmc@li=
sts.ozlabs.org>; ed@tanous.net <ed@tanous.net>; Velumani T-ERS,HCLTech <vel=
umanit@hcl.com>
Subject: Re: 12v slot AC Support in x86-power-control


[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Hi, Priyatharshan

This feature sound like adding more chassisX objects. Do you have separate =
sensors (e.g. on i2c bus or busses) per each board in the slots?

On Thu, Oct 8, 2020, 15:15 P. Priyatharshan <PriyatharshanP@hcl.com<mailto:=
PriyatharshanP@hcl.com>> wrote:
Thanks Vijay/Patrick for your comments.

The feature we are working is different from vijay's feature.


Out platform is multi host system and we  have the host as FRU and it can b=
e plugged in to a slot. The slot has an option to control slot power and th=
is can be used for a AC cycle.

We proposed  a design to add the slot power control in the x86-power-contro=
l.The earlier discussion can be found in the below link.

https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html<https://=
apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.ozlabs.or=
g%2Fpipermail%2Fopenbmc%2F2020-August%2F022481.html&data=3D02%7C01%7CPriyat=
harshanP%40hcl.com%7Cf860afb53aff482d5ce508d86b907d6a%7C189de737c93a4f5a8b6=
86f4ca9941912%7C0%7C0%7C637377615609744524&sdata=3DvvML%2B9O%2Bt5szee5X%2B6=
gW6H%2FPGYzoZAWEoOOVY2%2FxY%2B0%3D&reserved=3D0>

ed tanous,

I will create a clear document on when to use this slot power control featu=
re.

Thanks,
Priyatharshan P

________________________________
From: Vijay Khemka <vijaykhemka@fb.com<mailto:vijaykhemka@fb.com>>
Sent: 08 October 2020 06:11
To: P. Priyatharshan <PriyatharshanP@hcl.com<mailto:PriyatharshanP@hcl.com>=
>; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org> <openbmc@lists=
.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>; ed@tanous.net<mailto:ed@tano=
us.net> <ed@tanous.net<mailto:ed@tanous.net>>
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com<mailto:velumanit@hcl.com>>
Subject: Re: 12v slot AC Support in x86-power-control


[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Hi Priyatharshan,

Chassis system reset is for removing AC power for the whole chassis and it =
is already supported in x86-power-control. I am working on enabling this fe=
ature in redfish. I am not sure how it is related to your new features. If =
it is related then you can also define system_reset target unit.



Regards

-Vijay



From: "P. Priyatharshan" <PriyatharshanP@hcl.com<mailto:PriyatharshanP@hcl.=
com>>
Date: Tuesday, October 6, 2020 at 9:43 AM
To: "openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>" <openbmc@li=
sts.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>, Vijay Khemka <vijaykhemka=
@fb.com<mailto:vijaykhemka@fb.com>>, "ed@tanous.net<mailto:ed@tanous.net>" =
<ed@tanous.net<mailto:ed@tanous.net>>
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com<mailto:velumanit@hcl.com>>
Subject: 12v slot AC Support in x86-power-control



Hi Vijay,



I am working on a patch to support  12v slot AC cycle in x86-power-control.=
This can be enabled by configuring slotACPowerName in json config file.Sinc=
e you are also working on similar kind of feature in x86-power-control, I w=
ould like bring up this discussion on mailing list to understand how these =
two features, and the design you proposed for chassis reset are intended to=
 work together.Kindly go through my design changes below and share your tho=
ughts.



I have modified the existing /xyz/openbmc_project/state/chassis0 object to =
implement 12V On, Off, and Power Cycle for system which has 12V Slot power =
support.





If slotACPowerName is disabled and if,



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
Off" then poweroff [existing functionality not changed]



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
On" then powerOn [existing functionality not changed]



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
PowerCycle" then PowerCycle [existing functionality not changed]



events will be called.







If slotACPowerName is enabled and if,



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
Off" then 12V Ac Slot Off



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
On" then 12V Ac Slot On



RequestedPowerTransition =3D "xyz.openbmc_project.State.Chassis.Transition.=
PowerCycle" then 12V Ac Slot PowerCycle



events will be called.



Thanks,

Priyatharshan P

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

--_000_TY2PR04MB3311C405E8A3354EB91E3FC6CA0B0TY2PR04MB3311apcp_
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
Hi Anton,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We have a HSC sensor to control the power to a module and that has been con=
trolled by GPIO [No i2c<span style=3D"font-family:sans-serif">&nbsp;bus or =
busses</span>].<br>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Anton Kachalov &lt;rn=
ouse@google.com&gt;<br>
<b>Sent:</b> 08 October 2020 19:15<br>
<b>To:</b> P. Priyatharshan &lt;PriyatharshanP@hcl.com&gt;<br>
<b>Cc:</b> Vijay Khemka &lt;vijaykhemka@fb.com&gt;; openbmc@lists.ozlabs.or=
g &lt;openbmc@lists.ozlabs.org&gt;; ed@tanous.net &lt;ed@tanous.net&gt;; Ve=
lumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Subject:</b> Re: 12v slot AC Support in x86-power-control</font>
<div>&nbsp;</div>
</div>
<div>
<p></p>
<p class=3D"x_MsoNormal" style=3D"line-height:12.0pt; background:#FFEB9C"><=
b><span style=3D"font-size:11.0pt; color:#9C6501"></span></b><span style=3D=
"font-size:10.0pt; color:red">[CAUTION: This Email is from outside the Orga=
nization. Unless you trust the sender, Don=92t
 click links or open attachments as it may be a Phishing email, which can s=
teal your Information and compromise your Computer.]</span></p>
<div>
<div dir=3D"auto">
<div>Hi,&nbsp;<span style=3D"font-family:sans-serif">Priyatharshan</span></=
div>
<div dir=3D"auto"><font face=3D"sans-serif"><br>
</font></div>
<div dir=3D"auto"><font face=3D"sans-serif">This feature sound like adding =
more chassisX objects. Do you have separate sensors (e</font>.g. on i2c<spa=
n style=3D"font-family:sans-serif">&nbsp;bus or busses) per each board in t=
he slots?</span></div>
<div dir=3D"auto"><br>
<div class=3D"x_gmail_quote" dir=3D"auto">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Oct 8, 2020, 15:15 P. Priya=
tharshan &lt;<a href=3D"mailto:PriyatharshanP@hcl.com">PriyatharshanP@hcl.c=
om</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-left=
:1px #ccc solid; padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">Thanks Vijay/Patrick for your comments.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t"><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">The feature we are working is different from vijay's feature.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t"><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0">Out p=
latform is multi host system and we&nbsp; have the host as FRU and it can b=
e plugged in to a slot. The slot has an option to control slot power and th=
is can be used for a AC cycle.</p>
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0">We pr=
oposed&nbsp; a design to add the slot power control in the x86-power-contro=
l.The earlier discussion can be found in the below link.
</p>
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t"><a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flists.ozlabs.org%2Fpipermail%2Fopenbmc%2F2020-August%2F022481.html&a=
mp;data=3D02%7C01%7CPriyatharshanP%40hcl.com%7Cf860afb53aff482d5ce508d86b90=
7d6a%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637377615609744524&amp;sd=
ata=3DvvML%2B9O%2Bt5szee5X%2B6gW6H%2FPGYzoZAWEoOOVY2%2FxY%2B0%3D&amp;reserv=
ed=3D0" originalsrc=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-Augu=
st/022481.html" shash=3D"qunpao4PQEsydXyXE6xHJaJnA0w29SX75eiQKbERxF9iAvQuB4=
VOyQvpAGZsphO7ILfw2cv33jiTn0+wMmbanFyXLfi5364JEntYd5v2EAKA9UOrFQxnSoApYPYnt=
SqU8IKGP2vdmw3UWmQ6Gu3phuMGjkAP7NHVC50QVL5l0kc=3D" target=3D"_blank" rel=3D=
"noreferrer">https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.=
html</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t"><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">ed tanous,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t"><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">I will create a clear document on when to use this slot power control fe=
ature.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t"><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t">Priyatharshan P<br>
</div>
</div>
<br>
<div id=3D"x_m_5471233420626625869appendonsend"></div>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_m_5471233420626625869divRplyFwdMsg" dir=3D"ltr"><font face=3D"=
Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b=
> Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank" =
rel=3D"noreferrer">vijaykhemka@fb.com</a>&gt;<br>
<b>Sent:</b> 08 October 2020 06:11<br>
<b>To:</b> P. Priyatharshan &lt;<a href=3D"mailto:PriyatharshanP@hcl.com" t=
arget=3D"_blank" rel=3D"noreferrer">PriyatharshanP@hcl.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"norefe=
rrer">openbmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:openbmc@lists.ozla=
bs.org" target=3D"_blank" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a>&g=
t;;
<a href=3D"mailto:ed@tanous.net" target=3D"_blank" rel=3D"noreferrer">ed@ta=
nous.net</a> &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank" rel=3D"=
noreferrer">ed@tanous.net</a>&gt;<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;<a href=3D"mailto:velumanit@hcl.com" =
target=3D"_blank" rel=3D"noreferrer">velumanit@hcl.com</a>&gt;<br>
<b>Subject:</b> Re: 12v slot AC Support in x86-power-control</font>
<div>&nbsp;</div>
</div>
<div lang=3D"EN-US" style=3D"word-wrap:break-word">
<p></p>
<p style=3D"line-height:12.0pt; background:#ffeb9c"><b><span style=3D"font-=
size:11.0pt; color:#9c6501"></span></b><span style=3D"font-size:10.0pt; col=
or:red">[CAUTION: This Email is from outside the Organization. Unless you t=
rust the sender, Don=92t click links or
 open attachments as it may be a Phishing email, which can steal your Infor=
mation and compromise your Computer.]</span></p>
<div>
<div>
<p>Hi Priyatharshan,</p>
<p>Chassis system reset is for removing AC power for the whole chassis and =
it is already supported in x86-power-control. I am working on enabling this=
 feature in redfish. I am not sure how it is related to your new features. =
If it is related then you can also
 define system_reset target unit.</p>
<p>&nbsp;</p>
<p>Regards</p>
<p>-Vijay</p>
<p>&nbsp;</p>
<div style=3D"border:none; border-top:solid #b5c4df 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p><b><span style=3D"font-size:12.0pt; color:black">From: </span></b><span =
style=3D"font-size:12.0pt; color:black">&quot;P. Priyatharshan&quot; &lt;<a=
 href=3D"mailto:PriyatharshanP@hcl.com" target=3D"_blank" rel=3D"noreferrer=
">PriyatharshanP@hcl.com</a>&gt;<br>
<b>Date: </b>Tuesday, October 6, 2020 at 9:43 AM<br>
<b>To: </b>&quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"ma=
ilto:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noreferrer">openbmc=
@lists.ozlabs.org</a>&gt;, Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@f=
b.com" target=3D"_blank" rel=3D"noreferrer">vijaykhemka@fb.com</a>&gt;,
 &quot;<a href=3D"mailto:ed@tanous.net" target=3D"_blank" rel=3D"noreferrer=
">ed@tanous.net</a>&quot; &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_b=
lank" rel=3D"noreferrer">ed@tanous.net</a>&gt;<br>
<b>Cc: </b>&quot;Velumani T-ERS,HCLTech&quot; &lt;<a href=3D"mailto:veluman=
it@hcl.com" target=3D"_blank" rel=3D"noreferrer">velumanit@hcl.com</a>&gt;<=
br>
<b>Subject: </b>12v slot AC Support in x86-power-control</span></p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">Hi Vijay, </span></p>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">I am working on a patch to=
 support &nbsp;12v slot AC cycle in x86-power-control.This can be enabled b=
y configuring slotACPowerName in json config file.Since you are also workin=
g on similar kind of feature in x86-power-control,
 I would like bring up this discussion on mailing list to understand how th=
ese two features, and the design you proposed for chassis reset are intende=
d to work together.Kindly go through my design changes below and share your=
 thoughts.</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">I have modified the existi=
ng /xyz/openbmc_project/state/chassis0 object to implement 12V On, Off, and=
 Power Cycle for system which has 12V Slot power support.</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">If slotACPowerName is disa=
bled and if,</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.Off&quot; then power=
off [existing functionality not changed]</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.On&quot; then powerO=
n [existing functionality not changed]</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.PowerCycle&quot; the=
n PowerCycle [existing functionality not changed]</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp; </span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">events will be called.</sp=
an></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp; </span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">If slotACPowerName is enab=
led and if,</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.Off&quot; then 12V A=
c Slot Off</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.On&quot; then 12V Ac=
 Slot On
</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.PowerCycle&quot; the=
n 12V Ac Slot PowerCycle
</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp; </span></p>
</div>
<p><span style=3D"font-size:12.0pt; color:black">events will be called.</sp=
an></p>
</div>
<div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div id=3D"x_m_5471233420626625869x_Signature">
<div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">Thanks,</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt; color:black">Priyatharshan P</span></p>
</div>
</div>
</div>
</div>
<p><span style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-serif=
; color:gray">::DISCLAIMER::</span></p>
<div align=3D"center" style=3D"text-align:center"><span style=3D"font-size:=
7.5pt; font-family:&quot;Arial&quot;,sans-serif; color:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
<p><span style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-serif=
; color:gray">The contents of this e-mail and any attachment(s) are confide=
ntial and intended for the named recipient(s) only. E-mail transmission is =
not guaranteed to be secure or error-free as
 information could be intercepted, corrupted, lost, destroyed, arrive late =
or incomplete, or may contain viruses in transmission. The e mail and its c=
ontents (with or without referred errors) shall therefore not attach any li=
ability on the originator or HCL
 or its affiliates. Views or opinions, if any, presented in this email are =
solely those of the author and may not necessarily reflect the views or opi=
nions of HCL or its affiliates. Any form of reproduction, dissemination, co=
pying, disclosure, modification,
 distribution and / or publication of this message without the prior writte=
n consent of authorized representative of HCL is strictly prohibited. If yo=
u have received this email in error please delete it and notify the sender =
immediately. Before opening any
 email and/or attachments, please check them for viruses and other defects.=
</span></p>
<div align=3D"center" style=3D"text-align:center"><span style=3D"font-size:=
7.5pt; font-family:&quot;Arial&quot;,sans-serif; color:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_TY2PR04MB3311C405E8A3354EB91E3FC6CA0B0TY2PR04MB3311apcp_--
