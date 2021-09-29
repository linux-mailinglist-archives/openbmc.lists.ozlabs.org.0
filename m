Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E208141C5AB
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 15:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKHLd62MYz2ywB
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 23:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=ytNDzBkV;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=ytNDzBkV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.117; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector1 header.b=ytNDzBkV; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector1 header.b=ytNDzBkV; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310117.outbound.protection.outlook.com [40.107.131.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKHL54Sf0z2xtk
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 23:30:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fNmFG+TjiAG5SldClJRnYyyENClmFLC+tZizWPOs78=;
 b=ytNDzBkVNRzMtCoI0DLrBawJYnXosReHuK+nqLu1vcc/43aB4rgACylc/D3AaJ/8n3q0AllnTTpNjS90vgj+bp8eClBj9ZFtohZ/tWiWJtUJMZ9Tc9EKk/cRFxfEccArQd5jqJwpfnIelQeT3Yje3QRVzUeKCuMwsVjYVgsGN1xIfMbBaSxv7+GvObN8p5hNG6YZ/H+19VBub6IYqJsYIlIq52fsMu88QSkReXA6F1ODZnkMJZPnfHPwK2Ui6qFgygHrzESVkuYNVF9x340d4Hayd04r5RWsU8HvWGthX/1ZwRAt7qPmYzCEeUyGLPHnMVcWODwpmfP9OCDZN9vH5g==
Received: from SL2PR03CA0006.apcprd03.prod.outlook.com (2603:1096:100:55::18)
 by PUZPR04MB5033.apcprd04.prod.outlook.com (2603:1096:301:b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 13:29:39 +0000
Received: from PU1APC01FT006.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:55:cafe::11) by SL2PR03CA0006.outlook.office365.com
 (2603:1096:100:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Wed, 29 Sep 2021 13:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 PU1APC01FT006.mail.protection.outlook.com (10.152.252.104) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVTB5Cy/jIknkPbPUlDddIZJGCvdnhMUyfpiVTzJToTk4qUglXPRvAuWogxDkaG/ozYnk6S6vSfVWm+IQlkjyaMT+rNdxAjmA78hpsoOsvNwrzK++Z2dCmV9EH1LevLODp/MWbDEHwVL40H65y+lKHCeAeLb24ih/08qQD42OqOnPeDbSgsXY3nLRDd53hK5FF/nrjstIwU+srsrLtZkxULj65ET79D2EXgKolloWlJzF5ew1rGJT0/kdcbD/1DUo5QUXgWsF2mxLv5woUAxzGGTtMpzCERdLTcWWawnuQYgvG/PjxNni3DOjXc13B7Ypnk1DT8IE2DQ1zSwsunRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5fNmFG+TjiAG5SldClJRnYyyENClmFLC+tZizWPOs78=;
 b=BJ7C2YmXUh5XJSG+Oh5br4z/PekgXNhL6cjUJuF5hMLWhFvKxkIzj4CI2AEEBomH/Gy58qv1pYVO9OI5b05q3Ycm+0L+Sa+hJGUiMhqHKcChtdEWSwua5u8btaBKnT79AkT17qBt2oF3HYMnw8lMpCveOuIJigHq17WycsLvkMVfaRpkDotXz++BMPTvBomfXzBjFwyywgoW/rpgJX44nOaZ1KvDzpmvfhL3c2OjyoGI8P5ly998UXn19qK/OXlO7FxpiRnGJsZCa8Dv5Y6PPN2THuYA+mVhz3/VY1d1dsnNZ5TiLyd2ApRLVHWa5RnHoatux3Gd/GpfQ1rJ1Ieypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fNmFG+TjiAG5SldClJRnYyyENClmFLC+tZizWPOs78=;
 b=ytNDzBkVNRzMtCoI0DLrBawJYnXosReHuK+nqLu1vcc/43aB4rgACylc/D3AaJ/8n3q0AllnTTpNjS90vgj+bp8eClBj9ZFtohZ/tWiWJtUJMZ9Tc9EKk/cRFxfEccArQd5jqJwpfnIelQeT3Yje3QRVzUeKCuMwsVjYVgsGN1xIfMbBaSxv7+GvObN8p5hNG6YZ/H+19VBub6IYqJsYIlIq52fsMu88QSkReXA6F1ODZnkMJZPnfHPwK2Ui6qFgygHrzESVkuYNVF9x340d4Hayd04r5RWsU8HvWGthX/1ZwRAt7qPmYzCEeUyGLPHnMVcWODwpmfP9OCDZN9vH5g==
Received: from PS2PR04MB3589.apcprd04.prod.outlook.com (2603:1096:300:5e::22)
 by PU1PR04MB2262.apcprd04.prod.outlook.com (2603:1096:803:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:29:33 +0000
Received: from PS2PR04MB3589.apcprd04.prod.outlook.com
 ([fe80::208f:4cab:28d3:b0cf]) by PS2PR04MB3589.apcprd04.prod.outlook.com
 ([fe80::208f:4cab:28d3:b0cf%3]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:29:33 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: EEPROM Validation issue in Fru Device.
Thread-Topic: EEPROM Validation issue in Fru Device.
Thread-Index: Ade0hYZQ1eWZ+jg9QxKHfDi/VhnCMwAcK0JAAAxvrQAAAwxk8A==
Date: Wed, 29 Sep 2021 13:29:32 +0000
Message-ID: <PS2PR04MB35894CEB5F4C11AC820C1DC0FDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
References: <PS2PR04MB3589B9346947C693802AE1F7FDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
 <PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
 <YVRSmInJszjpBTsY@heinlein>
In-Reply-To: <YVRSmInJszjpBTsY@heinlein>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_C0nf1dent1al
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNGQ3YTIxY2UtNGRkZi00MDBiLTk4NjktM2IwNzgyOTAwNDIzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkNhbVJNUnNxQlN4QnJWakpEZGIrWkQ2U0tQOVZ5M2drbEhXc0JrdmxhZ0VpZ3BBd1JnTUlPMEFBeFNQeFZRQ1cifQ==
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 587a5c3c-85b1-4f06-3ec9-08d9834d2ff6
x-ms-traffictypediagnostic: PU1PR04MB2262:|PUZPR04MB5033:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PUZPR04MB503362A825F08A092501F182FDA99@PUZPR04MB5033.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7Nc2r7Zesh24yLPau16e9gGFVcjnHBGqY33xI8eYL8AVRcOSpRfJc9Id8IibNjgj6vQ/LT/XJzHMM6JKSTnaiXkfLhw1PRdAk8x3s3yUhS8bmLxx6+Fvi4AB+59DWe7Bu2VBSSXFk6hZOnw93bbCcIWj99BivooCxDE8nCETpsoWLDPkF1ivQEa7C5VNHkWJrjtn1m56bhOpNaaNIvZFbxazg86ggpwECdZmogu16WrwfLA2+dc+o/VkHKwm+B5rTmHihSfWGgJJoG1NI4GZOhDHjZw7vFXxuowkvi+VDQgyYuTMlhLyFh5EpfBXf2ThwguHRV9zP2q9M/KXFrBehA4F184N36+fRn2pfuDxfBecUrAHRxLdZuxP2X7oRE+BBL+EuOQktpZobaJZGTiiz62627CP9bx8rNNo11zCg+HmqRaNFTDZHD8hDQ5tgKCz/fKickVBvbE+vhYiiNjrtXdTK7O2GpCOpyEWPkFIiEooDGhx3jmNimkNRwukVs2MoTbL3FrdXWPbL6e3amIWcs7pOB85Tqt8Pe7p0PkuNkwSDgyiQ7Ju1ZBkktM1JCr/jzWtFkvyiF6RGJ0SyarvimFrjY/XNziPh/i0UlIalUIeyGpfbreH6mq1X9PdChYBrzA89DFkwryWwv4sZMUuK9t9hR15GYq3pRuMb0ttkLjcd5U4uhXSbkOy2ODfwGs3B8jlDiC4Lviqa5J9ru/eUQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PS2PR04MB3589.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(316002)(66556008)(55016002)(71200400001)(66446008)(54906003)(122000001)(64756008)(508600001)(186003)(38100700002)(66946007)(53546011)(76116006)(33656002)(4326008)(83380400001)(7696005)(26005)(9686003)(86362001)(5660300002)(52536014)(6506007)(2906002)(38070700005)(8936002)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR04MB2262
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 971ce52c-0e74-4475-b65f-08d9834d2c80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAj2GgeAMItodIAKcz9aJ8PqRE8fMctn4bB4poOSPf68eIH+Il8V1tNWfUGGk5T3tEbQi4FfHKn1rgM0H3PwClmbNIXTlL5IGD+zU/ZOrMwNOrllmOlnR4wsoLf6Ig1e6Guzo/v1yqiUuHbd3GDdDXouIX0KUM0zK9T/vm4gDdxbLUrZqDnZVPsPtpiWCsmepr9PkzPuIYjuiCeErjhn7rxw63GAEAfEqFrbWvLnQwNBGVuivHksb6AkiRqv9ie0n/OBmZUKL70N2R1KUtLEDpJV62CpeTImiuWb0nt6r5dawysrqUhOgHPHujHpik+XGQMzXLTTeXejaRcFK77c7lEPKiBIuvxHcKambvOwQkzudXKQ9Wb3x8JV7JN9T+NEEssEe1kxZ2GqiuCbS+EO3cyCMUHhY8OXBlJkdnrKzGZIC6mn5gT10yHNCr57Ji9jhCtacywgZGTU8cdM2cWL5JDKL1ctqpzV9Z+8QRscmXBhelTo6xUPjTxMT5tGDvnWIG+q7xPStRoqdlh9wa8hHZJ3X1juMZFr5xzlzTxJ97s/xFddH+WS86ZK6lrf7GIsndpSy5FWGJWP+sbQch5kgxGyddi3YxyK6yRBNpuJJbLbGWdrbpWOKF1rFzsHife8eo+gvhtcWbBvnYAKOuPUhhDvfQT6cFS9ua4E9vHCfatzPmQh7XPdNHK0dxLcw17D4tp3yxgyrRZd7Xg8okBUyojB+XRdU1i1WFrXf702/7o=
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(4326008)(70206006)(6506007)(26005)(52536014)(336012)(186003)(53546011)(81166007)(70586007)(55016002)(356005)(33656002)(86362001)(83380400001)(7696005)(47076005)(508600001)(6916009)(9686003)(8936002)(82310400003)(36860700001)(54906003)(36906005)(316002)(5660300002)(8676002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:29:36.9872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587a5c3c-85b1-4f06-3ec9-08d9834d2ff6
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT006.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB5033
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Confidential

Thanks Patrick for your responses.

Please find my response inline below.

Thanks,
Kumar.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Wednesday, September 29, 2021 5:19 PM
To: Kumar Thangavel <thangavel.k@hcl.com>
Cc: openbmc@lists.ozlabs.org; Velumani T-ERS,HCLTech <velumanit@hcl.com>; A=
mithash Prasad <amithash@fb.com>; Sai Dasari <sdasari@fb.com>; Ed Tanous <e=
d@tanous.net>; Vernon Mauery <vernon.mauery@linux.intel.com>; Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com>
Subject: Re: EEPROM Validation issue in Fru Device.

On Wed, Sep 29, 2021 at 05:53:33AM +0000, Kumar Thangavel wrote:
>
> 1.       How the function isDevice16Bit Validated for 16 bit device ?

My understanding is that Vijay wrote this originally when he wrote the Tiog=
apass port.  You should be able to confirm if it works there.

Sure. I will confirm with Tiogapass.

>
> 2.       Is my validation and analysis is correct ?

Other people have complained (on Discord) that this current code doesn't wo=
rk for all eeproms.  If you have something that works better and doesn't br=
eak Tiogapass support, I would expect it to be accepted as a change in fru-=
device.

OK. Will update the fru-device to make it work for all the platforms.

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
