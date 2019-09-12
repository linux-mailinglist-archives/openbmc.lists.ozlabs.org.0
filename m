Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C1B0750
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 05:47:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TPq52g8xzF43G
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 13:47:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.79; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="unYJmLDq"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310079.outbound.protection.outlook.com [40.107.131.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TPpY46s6zF3pW
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 13:46:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2ZCTsHQAwITWM1KBqdDJGU4+yyOfowOO2ej58mG7NCNNgdl4+EF3hheefUJWW7S8D0nHGiYnenjsVNqDUPs46j3F4rSKyIJOOhOsNcF3lT2RKq4bl+360ob9CyVgAi7Ga9Ew6HZKE5d16Byt5haOmGcLC6GSIL/MZPCQrawXYeW3DzzgqcdClk2Z8gnJB1xkoPNzIdwGH1dt9aEc5hFvKiBBVpM3SYKbEbzbp2DpnoDtuFTOUTe5RoecaooEvrVRwr5pJ39vXF6ZMZ5TPT8Yll5m7zEBxvIF/yfqt6mgG6+xmkSSRJAgx6/24gzy+9mITnWimeIh+7/vYXzf43tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AOV40iC+bhc1Q7uRACWaPUvhQwdW/bGUG0x2+9KKno=;
 b=GIgLJas4Z1cB/u/SsybgYwEp9X2UUy0C6RRRWxRhCXShG+y+VRiWymS2QWU5R9uuoDCUI4pUMA0rSvv5zXMPjmBiCFLPs802cvruzAH0o5t2nU+XHgnMovmVWwe+fQkSYN81V0/hOMtWy+7xHC1ugNTe+Oj9ftuK8MGukSJUOeR/GCJm+75JOBuh0ihFi4Wp2iAcFsAstzGhusUZ5avZuOxpJGdWYvviyrnswhjCld+hvRz+bAa41DmKK3P5lv6yIHdG3+Am70yO6bP4NRSyGfYiKvtOdDALlJP6xFDWGrjIYt0tGHEhpo/T3UCjn+5pT2R+/cLT9c6nIyKOE6j+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AOV40iC+bhc1Q7uRACWaPUvhQwdW/bGUG0x2+9KKno=;
 b=unYJmLDqoy4DXFJAJIFa+fupwmqVCpJNC9Gr3/wAMv0Vx6LOKUIuUT7IuSa8P8Ck27zmS/us7StXnY9FrqyafQw7UUPtcrC0okjFbrMfVy5QAZodx2FCjQK7ZhPfcsWr9Flx0bb7SCy9/yCjXEH+3jiNhVJl6fr6ag8zomLWLcI=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB4035.apcprd03.prod.outlook.com (20.177.165.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Thu, 12 Sep 2019 03:46:54 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::50c:3a40:b235:8917]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::50c:3a40:b235:8917%4]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 03:46:54 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Wilfred Smith <wilfredsmith@fb.com>
Subject: RE: Port 80H Snoop
Thread-Topic: Port 80H Snoop
Thread-Index: AQHVaPdArVWxHMOe+UiKld4czdVbSKcnRGpggAAEJYCAABLO8A==
Date: Thu, 12 Sep 2019 03:46:54 +0000
Message-ID: <HK0PR03MB46604880F50B30AF3789BE8CCFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
References: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
 <HK0PR03MB466066F3FD37BB68F833E638CFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <F87104B2-56AC-479E-BEF0-8B764355D6AF@fb.com>
In-Reply-To: <F87104B2-56AC-479E-BEF0-8B764355D6AF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95ec5e25-e2b0-4562-1941-08d73733daa7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK0PR03MB4035; 
x-ms-traffictypediagnostic: HK0PR03MB4035:|HK0PR03MB4035:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB4035A23EBFC829B2FEC5A077CFB00@HK0PR03MB4035.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(396003)(39850400004)(346002)(199004)(189003)(13464003)(99286004)(52536014)(14444005)(486006)(446003)(966005)(478600001)(7736002)(8936002)(11346002)(6916009)(6116002)(3846002)(81166006)(14454004)(71200400001)(66574012)(81156014)(476003)(8676002)(71190400001)(7696005)(76176011)(54906003)(55016002)(6306002)(107886003)(102836004)(9686003)(53936002)(5024004)(2906002)(6436002)(256004)(186003)(66446008)(64756008)(66556008)(66476007)(26005)(53546011)(316002)(6506007)(305945005)(6246003)(66066001)(229853002)(4326008)(5660300002)(25786009)(74316002)(86362001)(33656002)(66946007)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB4035;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N04TSpSnNVJUy9yt7Y7+v5nCmvVDpIRS8Zm/T+3MJkegUVQXVO6UNcXq43n/syLnT1z9mGdTcjlQbkzlG3QlZxHdzWRq7anbX2sYpM69i/slNS5dzLHERRyrBMTc5wSQWsXhzezahbJZ4NNFT/POOfYqo6BJ4v8XcLORhhskpI/pKCKF4R0dCUvwPUR4neiJ5UbLZLOH05stY4mcKJfca+cxyB9fuwu/LH/AACOCdU6fjr6FXL/DVU5WGs0dOlaWzDJpNKzWvFtIMYi9Q2LQyaigBO0vy0PRpQDbqjZZ1o8q2y9xnX8sMt3mtwrvYbT6YVNX7svvtzjsPrQiAxfI1S6o63C5riOOS5F7FOBZByGaa5aoWCOBPpuNdIfdGYgcv9x3PQ1lwvnoNxEKZsHN2H0+FeIdJt4lX4FuMnAFN1A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ec5e25-e2b0-4562-1941-08d73733daa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 03:46:54.6518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbEGwqKEU/JH8q5Rvr/6YTOcVn0iP4TUgzBgLAKx69VAKXzvH5d3+vE13q9h+LZNYX7QllSTvubOIgzseqPK8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4035
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
 CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wilfred,

Yes, I also modified example code to track the history of the port 80h snoo=
p values.
The history will be saved to file with timestamp name for Host ON, OFF, and=
 enter BIOS conditions.
T
his patch is just an experiment hard coded some specific Port80H codes for =
monitoring BIOS we used.
These code should be configurable in a mature implementation, such as GUI/R=
EST API entries for downloading/viewing these logs, but not done due to pri=
ority change.

The link of patch for you refer it. Thanks.
https://github.com/Nuvoton-Israel/openbmc/blob/master/meta-evb/meta-evb-nuv=
oton/meta-evb-npcm750/recipes-phosphor/host/phosphor-host-postd/0001-suppor=
t-npcm7xx-lpc-bpc0-and-snooper.patch

Best regards,
Tim

-----Original Message-----
From: Wilfred Smith [mailto:wilfredsmith@fb.com]
Sent: Thursday, September 12, 2019 9:56 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Port 80H Snoop

Tim, Many thanks. Are you also providing the ability to track the history o=
f the port 80h snoop values? If not, are you aware of someone else having d=
one so?

Wilfred

> On Sep 11, 2019, at 6:52 PM, CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
>
> Hello Wilfred Smith,
>
> You can refer the module phosphor-host-postd and add file recipes-phospho=
r/host/phosphor-host-postd_%.bbappend for changing your snoop device.
> (ex: SNOOP_DEVICE =3D "npcm7xx-lpc-bpc0")
>
> Then, you can execute "snooper" program in shell prompt and you will see =
the POST code be printed on console.
> You can refer the attach file about screenshot for the result of snooper.=
 Thanks.
>
> Best regards,
> Tim

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
