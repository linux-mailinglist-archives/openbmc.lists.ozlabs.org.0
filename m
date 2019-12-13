Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A093611FDC2
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 06:01:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bpyS6Mf2zDqVT
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 16:01:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.92; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.b="lryk1g6e"; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.b="lryk1g6e"; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310092.outbound.protection.outlook.com [40.107.131.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z2w41cGXzDqvv
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 18:53:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCiAY1Vl1LOKiJOhBWsfcyu3LjENYMqG0MDHHCiVpGU=;
 b=lryk1g6ensGtWfymtmiwuVm8YSgeL2FrcngzrdX/qZe7z7ZqTVU0MA37ZKLStZhP405Dq95l9Qm+AbGjVkJ1c64E2xOAztE6g3cDVntE0bpwIVxLeqKmHmjahhP/WNwiyMj2005fsh8v84p8NDgZUa+bs6Jvkprw7Y9Rn4RpGR4=
Received: from SG2PR0401CA0020.apcprd04.prod.outlook.com (2603:1096:3:1::30)
 by HK0PR04MB2945.apcprd04.prod.outlook.com (2603:1096:203:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Fri, 13 Dec
 2019 07:52:59 +0000
Received: from SG2APC01FT004.eop-APC01.prod.protection.outlook.com
 (2a01:111:f400:7ebe::201) by SG2PR0401CA0020.outlook.office365.com
 (2603:1096:3:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 07:52:59 +0000
Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; linux.intel.com; dkim=pass (signature was verified)
 header.d=HCL.COM; linux.intel.com; dmarc=pass action=none header.from=hcl.com; 
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT004.mail.protection.outlook.com (10.152.250.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15 via Frontend Transport; Fri, 13 Dec 2019 07:52:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1WQuSSB272DFNFlg9T1hP5mfNTR3zXya5D43bjoWSqyg0yt0JfHGwi3MCWx1X65hicuves4O4ir9OgzFIBwRcipnVFNY5LM7udhpLxlB3BzaytmfK2624ctZpQMnj750NLdzII5HbH8hs77Xe/kcCGhqJDlicB4IQ55BQ0aRVtJzZ42JAvgQ9f6NRZJUVpZFWN/52Z0TGJaQdj65wcSH6iizlHwxzAxVgCLeOXkaxJ15bSrTQP/m6pYrzqq9+3a8siWHjjUm4eESt+fTeILnpIYwjZKM+noucuJ2VSRkmydAbAAqyPl1LUD7si4NS629roD7+wwxpMxFKejuI7guQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCiAY1Vl1LOKiJOhBWsfcyu3LjENYMqG0MDHHCiVpGU=;
 b=aqB0FGYqpK15gAbZCn/s4ssxC0ZgAdHn4pMjkyYf6gjee+bROJXNNqgJs9x5piPu7s33oeuqyfVdH4ZbAZyHH12V+jpKPp9Kx80IWbZChj03HBGNpJJCro+38kuBK++XNWI29APA4PNo9P4Ggy6DGwZyz216HNe0azMIdu/YrTTQFST29EaG859t+rnP/r/C5SYXZ8Sa/3fEC/APPXkRyF62Cd5bQaVfRfVozV7W/+qL28We5GoS+gmahUgTjg7EM2+3OtyCZzdA5wOlkZHzo1RRJrzVeo9R38RETLhz7uwZTMVujHGpaF6qvjlwXynuoX4ZsD29+aLvuBb9CUkdLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCiAY1Vl1LOKiJOhBWsfcyu3LjENYMqG0MDHHCiVpGU=;
 b=lryk1g6ensGtWfymtmiwuVm8YSgeL2FrcngzrdX/qZe7z7ZqTVU0MA37ZKLStZhP405Dq95l9Qm+AbGjVkJ1c64E2xOAztE6g3cDVntE0bpwIVxLeqKmHmjahhP/WNwiyMj2005fsh8v84p8NDgZUa+bs6Jvkprw7Y9Rn4RpGR4=
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com (20.177.93.17) by
 SG2PR04MB2332.apcprd04.prod.outlook.com (20.177.1.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Fri, 13 Dec 2019 07:52:54 +0000
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::34a4:b6ee:359e:a447]) by SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::34a4:b6ee:359e:a447%4]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 07:52:54 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: GPIO-Direction issue
Thread-Topic: GPIO-Direction issue
Thread-Index: AQHVsB1YioCulj/BSEKzev0Y80Jx06e2vPEAgAD3HDI=
Date: Fri, 13 Dec 2019 07:52:54 +0000
Message-ID: <SG2PR04MB302998EE380A600959EB04DEFD540@SG2PR04MB3029.apcprd04.prod.outlook.com>
References: <SG2PR04MB302999E339EF294C04B14DB6FD5A0@SG2PR04MB3029.apcprd04.prod.outlook.com>,
 <b4de5043-0408-688b-f23b-396f7e21f0b1@linux.intel.com>
In-Reply-To: <b4de5043-0408-688b-f23b-396f7e21f0b1@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=thangavel.k@hcl.com; 
x-originating-ip: [106.206.34.105]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fefad9e3-e0e1-4ef9-80d1-08d77fa178f8
X-MS-TrafficTypeDiagnostic: SG2PR04MB2332:|HK0PR04MB2945:
X-Microsoft-Antispam-PRVS: <HK0PR04MB2945B554B79B972FE2D6554AFD540@HK0PR04MB2945.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:3968;
x-forefront-prvs: 0250B840C1
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(53754006)(189003)(199004)(38564003)(478600001)(2906002)(66946007)(76116006)(66446008)(3480700005)(66476007)(45080400002)(66556008)(64756008)(966005)(186003)(33656002)(19627405001)(91956017)(7696005)(53546011)(9686003)(6506007)(26005)(52536014)(81166006)(110136005)(8936002)(5660300002)(8676002)(71200400001)(81156014)(316002)(86362001)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB2332;
 H:SG2PR04MB3029.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /UezRCm84cn03KUsfNa4mIGdXSNJao2lSLUNRZSBBf2JJJOfaw4QFW5r1zIz28PJvaLY+nUPN/DUJ6thmMVpBtzIKua9U17c3P+rgNaoSWLb24S/2OR2MV7W0qcvo25ft+L/RzO660SM3pZCQATJZQ7TiRRFT5zag9uflBH03hlK0eOh8H2Uztvm+uyETqSE+xHrmrOGj0Mkil/KheYe52HbcBKtrAUUcqbvuDyqMmzQrC984Am6Ertrsr6iRwIbOFPoe8ZgGt3AXbOVlOLvYFr3wRkpvKh//+ZyKoHt/Rpcf4N2ljMDhvp85iRpGuhu65fMelAgDfhTNSbyl29wsAZco/YTtXWLNVWBrcgwLOBl8NeL2qBDKdONiWSYHAmiygH4+53Dq7sAA9+NIDYQEba4swPdpF84av9MlMVe6v4HocgkZHxi0q4vCkSI56nP3ZpUhzCySh7vtYVJQx4bcVw0NmnPsgKbbIQI6ylwnTD1zekro84b4H8dSeWWiejMU8Rg27mjisT2u3/+za/BITAo82v0txkrLZQgHzpdC+gjwUL3WLtN/c2O0OpnLBqQ
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB302998EE380A600959EB04DEFD540SG2PR04MB3029apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2332
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT004.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.56; IPV:CAL; CTRY:IN; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(38564003)(189003)(199004)(53754006)(26005)(81166006)(8676002)(316002)(81156014)(3480700005)(19627405001)(7696005)(478600001)(356004)(336012)(966005)(45080400002)(26826003)(36906005)(110136005)(2906002)(8936002)(86362001)(52536014)(53546011)(6506007)(76130400001)(70586007)(70206006)(186003)(55016002)(33656002)(5660300002)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK0PR04MB2945;
 H:APC01-SG2-obe.outbound.protection.outlook.com; FPR:; SPF:Pass; LANG:en;
 PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 78290a18-f950-4c4d-7d5e-08d77fa1762b
X-Forefront-PRVS: 0250B840C1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xeTFCNYHhPmXRLwR8uV2bVr8u3NddofsqWEMeRN6VoMBQ9Qp52OHa5hktPrfs0WitEBW3KZgIU0CtsR/cBmoBMv0h1ruvckUpkASEUOzfK5L1WVhXgHxeKlqQJzWLaCWA3i6OTC2JtuDDzEDtEuzkvByjok9v+ImsYM/WhsC7/qDQiz6csY5lI1j/HCusYE4UMbpKJpgeCinJUVaHoVrCFUsyTVwWqACq1gO9DFmOCqqkFj0jMpTjAbsqWYk7F/94SSx8Lq8AdPoIYPZl53UtIARumB0l1Hk6TDZ6LHCo0pg1bC/UVQgi2PWGujRwWVRGCbHLAWz+9BPTsr4x+9o9oFyxvRzHxfY9w+oXFgN8v9R96EPgDskZJ+e+++w8Jgau1XLFuPgUKDZtvyma4jqdHeBKbG9BQ5y7ZDEGpcIY/ve5GqoCJ8rpnAlSL23LoIXmFE7Q07cLAWGD+tG7K3OabqYBCexi6Ff9eQ0wcDdj63877pfFKH1mAWFulsgafnBCZXweMrj002+kTu4Zwt5Np0T0gy/ATjj6DtIDE3OzkYufxV5VYVgFMOzuKzaPuf
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 07:52:58.5453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefad9e3-e0e1-4ef9-80d1-08d77fa178f8
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2945
X-Mailman-Approved-At: Mon, 16 Dec 2019 15:59:37 +1100
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

--_000_SG2PR04MB302998EE380A600959EB04DEFD540SG2PR04MB3029apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure. Thanks for your suggestions.


Thanks,
Kumar.
________________________________
From: James Feist <james.feist@linux.intel.com>
Sent: 12 December 2019 22:37
To: Kumar Thangavel <thangavel.k@hcl.com>; openbmc@lists.ozlabs.org <openbm=
c@lists.ozlabs.org>
Subject: Re: GPIO-Direction issue

On 12/11/19 4:50 AM, Kumar Thangavel wrote:
> Hi All,
>
>          I am using entity manager configuration file(.json) to enable
> the GPIO pin.
>
>          The gpio node was created in /sys/class/gpio/* using
> configuration files.
>
>          I set Direction as "Out" in json. But it was not getting
> changed in /sys/class/gpio/gpio*/Direction. The Direction was still
> remains as "in".

Gpio usage via sysfs is deprecated. We're currently working to remove
all usages of it ourselves that we have in entity-manager. I would
suggest using libgpiod to use gpio via character device instead.

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ker=
nel.org%2Fpub%2Fscm%2Flibs%2Flibgpiod%2Flibgpiod.git%2Ftree%2Fbindings%2Fcx=
x&amp;data=3D02%7C01%7Cthangavel.k%40hcl.com%7Cbf18dac88ecc4a35bc2508d77f25=
bb67%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637117672349243185&amp;sd=
ata=3DJeruefedzy4Bnb%2FIVjn4j1zT4YUhh9KwEH1tB6oNKxQ%3D&amp;reserved=3D0

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

--_000_SG2PR04MB302998EE380A600959EB04DEFD540SG2PR04MB3029apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sure. Thanks for your suggestions. <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kumar.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> James Feist &lt;james=
.feist@linux.intel.com&gt;<br>
<b>Sent:</b> 12 December 2019 22:37<br>
<b>To:</b> Kumar Thangavel &lt;thangavel.k@hcl.com&gt;; openbmc@lists.ozlab=
s.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: GPIO-Direction issue</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 12/11/19 4:50 AM, Kumar Thangavel wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am using entity man=
ager configuration file(.json) to enable <br>
&gt; the GPIO pin.<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The gpio node was cre=
ated in /sys/class/gpio/* using <br>
&gt; configuration files.<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I set Direction as &q=
uot;Out&quot; in json. But it was not getting <br>
&gt; changed in /sys/class/gpio/gpio*/Direction. The Direction was still <b=
r>
&gt; remains as &quot;in&quot;.<br>
<br>
Gpio usage via sysfs is deprecated. We're currently working to remove <br>
all usages of it ourselves that we have in entity-manager. I would <br>
suggest using libgpiod to use gpio via character device instead.<br>
<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgit.kernel.org%2Fpub%2Fscm%2Flibs%2Flibgpiod%2Flibgpiod.git%2Ftree%2Fbi=
ndings%2Fcxx&amp;amp;data=3D02%7C01%7Cthangavel.k%40hcl.com%7Cbf18dac88ecc4=
a35bc2508d77f25bb67%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C6371176723=
49243185&amp;amp;sdata=3DJeruefedzy4Bnb%2FIVjn4j1zT4YUhh9KwEH1tB6oNKxQ%3D&a=
mp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flibs%2Flibgpiod%2Flibgpiod.git%2=
Ftree%2Fbindings%2Fcxx&amp;amp;data=3D02%7C01%7Cthangavel.k%40hcl.com%7Cbf1=
8dac88ecc4a35bc2508d77f25bb67%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C=
637117672349243185&amp;amp;sdata=3DJeruefedzy4Bnb%2FIVjn4j1zT4YUhh9KwEH1tB6=
oNKxQ%3D&amp;amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_SG2PR04MB302998EE380A600959EB04DEFD540SG2PR04MB3029apcp_--
