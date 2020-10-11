Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDBC28A605
	for <lists+openbmc@lfdr.de>; Sun, 11 Oct 2020 08:40:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8ByM3xtkzDqv9
	for <lists+openbmc@lfdr.de>; Sun, 11 Oct 2020 17:40:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.93; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=PFFYzfob; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=PFFYzfob; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320093.outbound.protection.outlook.com [40.107.132.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8BxP1rFnzDqv5
 for <openbmc@lists.ozlabs.org>; Sun, 11 Oct 2020 17:39:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdPzeAmGHz4Pmx+URaYGDlSpWhC7pAD46svWgQk31HM=;
 b=PFFYzfoboHVeZFdObL9NXKIJNnzhia824S6dmJZZRuwlJ9LbKAqJDeG/gqGRIn70NS3qBNfIkmdYN92E5/ag38/h8x+argB6rqGmZI7X9zPFnj+Txqf2WbjscYpWfQVMEvaDpj5+wr7ap9ri0QrFU4lMRv+z+0Bl7gcYxPa6m+I=
Received: from SLXP216CA0045.KORP216.PROD.OUTLOOK.COM (2603:1096:100:4::31) by
 TY2PR04MB3549.apcprd04.prod.outlook.com (2603:1096:404:f9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23; Sun, 11 Oct 2020 06:39:11 +0000
Received: from PU1APC01FT033.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:4:cafe::19) by SLXP216CA0045.outlook.office365.com
 (2603:1096:100:4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend
 Transport; Sun, 11 Oct 2020 06:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT033.mail.protection.outlook.com (10.152.252.223) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Sun, 11 Oct 2020 06:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdOs1/zB9f0OMnG3C35TVOnLYWb4gHe1bQx4z0POTxtd6BBrR0j/b5VCHEVIDz77MagNeoVJaJz6cJHWcdHgOWTjnSbJHHxnkwYgqp1pRAekZIhP1PgEGrybGgBrNczmpkdSK+UcJZFKmUPiNUM+VQw9brzCzU+SwXf88tFaoKgcocMQ9OBtVWl2FiwGIFfJTz6mI88VtoPQEa20/Rdz1HgbAtVtKd5+82FmvI5CnKPFpsWfCvgOVOJwnSIaiPOKVhqWkaLal8IoSRFpO12CGGYDOMIPEo8qLK6ZbkMAeRouIa+OEb7Qgg/KehpvndkiADkqCmkYHx+akGhPhTpI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdPzeAmGHz4Pmx+URaYGDlSpWhC7pAD46svWgQk31HM=;
 b=i35WcG2q3BTKjkX4fSMRNPc8Qqx3mxPxxeRj7edcX8hWNu4E260iR8/qj+OkUtmcy/K8PTv6Al/5H4glfElWYykM8pBRsLj3tTa1Eb6KD80/yFPoqvJ438d7vaWuxqLN4CzmSs85qHVVSc5OPLu0DEu4XEdynrkke5a3LFkZMQRdrqc883dQKnpwT4/TdmbZo0RtkchHviPvzZrH4I4DQfgk8emxX38cQtEq3kMRrFJiYKo8yFB1kKpkX6hpGi7aDSnfyXgOOaGjeto7RsFzXRRpRZXGQZ4rqpHztnu+ikSgJJJw/8xGKk/NQXkJ0MhdroiHtufpNSOHdPL8dYa7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdPzeAmGHz4Pmx+URaYGDlSpWhC7pAD46svWgQk31HM=;
 b=PFFYzfoboHVeZFdObL9NXKIJNnzhia824S6dmJZZRuwlJ9LbKAqJDeG/gqGRIn70NS3qBNfIkmdYN92E5/ag38/h8x+argB6rqGmZI7X9zPFnj+Txqf2WbjscYpWfQVMEvaDpj5+wr7ap9ri0QrFU4lMRv+z+0Bl7gcYxPa6m+I=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3998.apcprd04.prod.outlook.com (2603:1096:404:800b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Sun, 11 Oct
 2020 06:39:07 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3455.029; Sun, 11 Oct 2020
 06:39:07 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: 12v slot AC Support  in x86-power-control
Thread-Topic: 12v slot AC Support  in x86-power-control
Thread-Index: AQHWn5icGLElJztlpEW81Rn7KycQJQ==
Date: Sun, 11 Oct 2020 06:39:06 +0000
Message-ID: <TY2PR04MB3311E950C08F4CA31789A275CA060@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:6404:8804:48e7:52f7:5dc9:ad8c]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0026feb1-9424-4264-f27a-08d86db05cae
x-ms-traffictypediagnostic: TY2PR04MB3998:|TY2PR04MB3549:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB35490FD6F5D126B44F391360CA060@TY2PR04MB3549.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nDAc/WuqZsWKU5YtWzl+CWQKBc1X3QnRnjJJEm2HbydwDPTyp9ixn02vI1EMLQdQU/XehyUDIfvJROheyocdr9ITYgASUoaSY1u99BEr8uyeYiheLId8lWF0wBrLV+ghwG3iGiUwIqUo8r9EqSXqZfmr+VCR8DCA+scunLZZhgZn816EpGR5S1Op1bDwqGgBDrO5KXqgq/i2uhL9KeqW2852WKnZ/GaaY2pTLxS8Y7kRBEEfcvTdYKexCsLV2Ic2ioFPwS+W0xlLo+j2CrgTYKp8w6Ic50b9o+koH+khQJdcMHX6XE2oSGaSkPsnV/BrB6yfrPqXfijXsXr5IR84pZY7qcdm+oLvWGITp7eTXeYSY/aL6Sb2QFjPkuoFNpL4kcps30Led9cbSWurRC8OZg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(19627405001)(7696005)(166002)(8676002)(83380400001)(8936002)(6506007)(4326008)(83730400001)(53546011)(33656002)(6916009)(86362001)(83080400001)(76116006)(91956017)(5660300002)(966005)(316002)(66446008)(66476007)(66946007)(66556008)(64756008)(54906003)(71200400001)(186003)(2906002)(9686003)(52536014)(478600001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 6QNXutROvo/yuyJw1bZ3KJBuk/umaPxC1CzGilKuumnJU2msyuimaBtLDly9bRIU1tTMnZVQQf2DyGnmJQvEHfS3kiXZFfNMzcbnAphWesc8Krucf7/GPJZ5cfYuM5YCqxqFBvtbdORtATvl0XydGzVBoHBfIsz6JWhRnrZQ3p9GAAZdYTN01Nha4SeNtLXMOQ54LA4jow3YOTbjjpvWxyZrLqCdJh8ewEzX8o185ywiMNgmFHATPwjxY4ilIjt58vkSU7s6z/RJkscxLf/+6UCvv8A143Mv/WfdMJcbKMGWPVi1vXCXnhFltSV0nkLuqfr1z6lWeCzxG/Wb7MuXZaNECanKCMN+3nJDPpiiR7pcpAZxP45K/qQK41g+Af32SLCgBXElI949AAJEg7CA/v0Lh8V07gqZ8jVXquMk7ZPPRQXGT8mcAtyMXKpWkETvJfQBQaK/qulQpVaCXse8zf9X7TIhH/nOALf1m6MpmrWG0BFxBrwqQWsfYTN/vklro6lo5WI3RgsWmb/MwbhW5p2iMoQMC/kON6lTiF0fFLeON8plvMa2s5M46JzJvGXbRnA2hnR9t+5R/XWSPsHvEBbk0959u4aVTN4ZvwWI+EXIh8RrwJubZp7bQzGp2WRkLyI1wIqPLNdRKZP8QtU9cLgHk8Zu2GfbBlfmX2mAv7NgZKBesi7QAu7gYkqzCsOsXBzQW3GkNBjfdSJa6kCGNg==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3311E950C08F4CA31789A275CA060TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3998
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bde04ae3-9b75-4713-3cea-08d86db05a58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDQZWe2At5+2Pozo645JdHJPjEH4lMQHGrSob310YD8ohcQrgMiLNCA9tplFT0I4yLdb5sfZCLg7/sXpD5frQuEJSj1LvmdS8zdRPkG0DHVTFjjgHpYMlMqrqudE8njfiVOTEvVstbPFBStWN1EEywAYAiUddBGz+GD3wWzgAJjznqwwwpi2bqLAYwDSkmWLjv2F4DTm+gRKzeffoOJr2c79xEcbb6KGCem2MN3IGNwKAnJJUEQ+2q1H4iwoQcfUCGGayXuoC/QW/jMCsJINqjGX22EnJ9V6vUr+ImnPjSVsRYXqAYCfm7TQcKMbBsZeqs89fjYqeMgNvMcqLfV5b/vdAVgTiIs3SIq2YnSdab2KTbTVVy+BGGj0aHfjK6pn1/Pfi9rQXwepTzwjOVeK4WOlR7rt5elMYhHvX6KxJ2THMxenDSSVQyeYvQxoYf3cKpyi1zmGH3/YdxQxMnjqGtf4ETdoNHA33ymlg2ESCBjecRX2QEd7n+zvW1tNuvhR
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(9686003)(19627405001)(5660300002)(186003)(26005)(53546011)(7696005)(33656002)(86362001)(2906002)(70586007)(36906005)(34020700004)(966005)(82310400003)(6506007)(70206006)(52536014)(316002)(47076004)(6916009)(55016002)(8936002)(336012)(83380400001)(83730400001)(82740400003)(4326008)(478600001)(356005)(83080400001)(8676002)(166002)(81166007)(54906003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2020 06:39:10.0946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0026feb1-9424-4264-f27a-08d86db05cae
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3549
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

--_000_TY2PR04MB3311E950C08F4CA31789A275CA060TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

Thanks for the clarification.Got things cleared now.

As you mentioned, I will implement chassis_system0 object for full power cy=
cle of the
entire system, and 'chassis_systemN' [N =3D 1:4 for my case] to do the slot=
-level full power cycle in x86-power-control.

Thanks,
Priyatharshan P

________________________________
From: Patrick Williams
Sent: Saturday, October 10, 2020 01:18
To: P. Priyatharshan
Cc: Vijay Khemka; openbmc@lists.ozlabs.org; ed@tanous.net; Velumani T-ERS,H=
CLTech
Subject: Re: 12v slot AC Support in x86-power-control

On Fri, Oct 09, 2020 at 03:49:55PM +0000, P. Priyatharshan wrote:

> The earlier "power on/off/cycle the computer card" sequence will only han=
dle the computer card portion of the host.
> But the new feature [Slot on/off/cycle] will power cycles the entire card=
 [ BIC + computer card portion + rest of the hardware in twin lake] for eac=
h slot.

Got it now.

Take a look at [1].  You should implement the 'chassisN' objects (in
x86-power-control?) to handle the normal power sequence to each of your
compute cards.  I think in your case N =3D 1:4.  You should also implement
the 'chassis_system0' object, which will be a full power cycle of the
entire system.  Finally, you'll want to implement 'chassis_systemN'
(again N =3D 1:4) to do the slot-level full power cycle.

1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/State#chassis-system

--
Patrick Williams
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

--_000_TY2PR04MB3311E950C08F4CA31789A275CA060TY2PR04MB3311apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Patrick,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the clarification.Got things cleared now.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As you mentioned, I will implement <font size=3D"2"><span style=3D"font-siz=
e:11pt">chassis_system0</span></font> object for
<font size=3D"2"><span style=3D"font-size:11pt">full power cycle of the<br>
entire system</span></font>, and<font size=3D"2"><span style=3D"font-size:1=
1pt"> 'chassis_systemN'</span></font> [N =3D 1:4 for my case]
<font size=3D"2"><span style=3D"font-size:11pt">to do the slot-level full p=
ower cycle in x86-power-control.</span></font><br>
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
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Patrick Williams<br>
<b>Sent:</b> Saturday, October 10, 2020 01:18<br>
<b>To:</b> P. Priyatharshan<br>
<b>Cc:</b> Vijay Khemka; openbmc@lists.ozlabs.org; ed@tanous.net; Velumani =
T-ERS,HCLTech<br>
<b>Subject:</b> Re: 12v slot AC Support in x86-power-control
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Oct 09, 2020 at 03:49:55PM +0000, P. Priya=
tharshan wrote:<br>
<br>
&gt; The earlier &quot;power on/off/cycle the computer card&quot; sequence =
will only handle the computer card portion of the host.<br>
&gt; But the new feature [Slot on/off/cycle] will power cycles the entire c=
ard [ BIC + computer card portion + rest of the hardware in twin lake] for =
each slot.<br>
<br>
Got it now.<br>
<br>
Take a look at [1].&nbsp; You should implement the 'chassisN' objects (in<b=
r>
x86-power-control?) to handle the normal power sequence to each of your<br>
compute cards.&nbsp; I think in your case N =3D 1:4.&nbsp; You should also =
implement<br>
the 'chassis_system0' object, which will be a full power cycle of the<br>
entire system.&nbsp; Finally, you'll want to implement 'chassis_systemN'<br=
>
(again N =3D 1:4) to do the slot-level full power cycle.<br>
<br>
1. <a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/tree/mast=
er/xyz/openbmc_project/State#chassis-system" target=3D"_blank" rel=3D"noope=
ner noreferrer" data-auth=3D"NotApplicable">
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc=
_project/State#chassis-system</a><br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
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

--_000_TY2PR04MB3311E950C08F4CA31789A275CA060TY2PR04MB3311apcp_--
