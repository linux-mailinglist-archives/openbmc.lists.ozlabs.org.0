Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C90E27433C
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 15:36:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwj5C453jzDqS4
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 23:36:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.93; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=JZRioVOX; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=JZRioVOX; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280093.outbound.protection.outlook.com [40.107.128.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwj3g3MTjzDqVl
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 23:35:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlzvh0DyH+DTsMjue2qwqktleXulT3XBHAQfZ58DMPg=;
 b=JZRioVOXHqicCuxYJbekXbdvIDkuDxPvPjItNsFoDaCFUZgqdfYGZoU12Me4/dcs8Gp4Me7CfUQh4aSJ6XoineMyvkkxeHxmtqj9M67wpJcUrOig+jFFvs+4/jYvTF7QwnPOPu+NdnAE0DKWZ1KoKG5qnYfjqqUXhntPZp2QzbM=
Received: from SG2PR03CA0153.apcprd03.prod.outlook.com (2603:1096:4:c9::8) by
 SL2PR04MB3132.apcprd04.prod.outlook.com (2603:1096:100:3a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17; Tue, 22 Sep 2020 13:34:54 +0000
Received: from HK2APC01FT051.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c9:cafe::c3) by SG2PR03CA0153.outlook.office365.com
 (2603:1096:4:c9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.19 via Frontend
 Transport; Tue, 22 Sep 2020 13:34:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT051.mail.protection.outlook.com (10.152.248.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 13:34:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ML+TmYAVW2/qewSLKLjr5J9CqTZlAINl7v63OLCYZgAX6qiyNcFT2+xdL0kaEet4znRoXe19+Y35nll5YbuUAxLdSBxUEcrrqT27X71x3RiOm22Ni5dK0/vLrqjLMShS11AAFX6USafxJuR4xP9JpAW3qDw/8I1cxpJsCY4c93P1HpscfKydeZULsTDiNwL0CO/TM/xBC8T4hBqsHpI3mhxnYJK1WxdZlh8DvVm1MMYA2EHUAXJ9sShfce21ZUg5B3ycZELkTEvEKRogf9Fq1yQhe2b0nsuhdN8vrLDDNrrnYRFe+15nREQAnMiGQcC7OKC1PBMG3kWunF3aVchp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlzvh0DyH+DTsMjue2qwqktleXulT3XBHAQfZ58DMPg=;
 b=TLOKi5M9Mh9QTDVqpi/3ydxUW20RSj1qCgeiC1uYY21axNADS/2CUYYR8SKIFIBPLnPotBXXxYRdP5n6VFgOG+sDbonoxkL0OG0CtAmiDu3xLrYk0ub241yucBszXvrB9nFmUGE+Q2eZ4f6Q4t8W/QW3g0XOkEymyHGDw6tXFQkQw20IUzt8/4RZ38bqgJedY0kgOYgG+w3wrsLgUgsW5KRyZZ8gMmQIeTOtvnb2CTV0fcKMUsScN+OD7nx8GvQTaWOSvc4++MmPzMIl6jcWzSLzrZB7ZLjdA0HH4r34ia2s7HGIRTF9snSSgcOtc9out0kHLNvPpJ/ISnq7JAabFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlzvh0DyH+DTsMjue2qwqktleXulT3XBHAQfZ58DMPg=;
 b=JZRioVOXHqicCuxYJbekXbdvIDkuDxPvPjItNsFoDaCFUZgqdfYGZoU12Me4/dcs8Gp4Me7CfUQh4aSJ6XoineMyvkkxeHxmtqj9M67wpJcUrOig+jFFvs+4/jYvTF7QwnPOPu+NdnAE0DKWZ1KoKG5qnYfjqqUXhntPZp2QzbM=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR0401MB2158.apcprd04.prod.outlook.com (2603:1096:3:6::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13; Tue, 22 Sep 2020 13:34:50 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 13:34:50 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gwACmf2AAC39YUA=
Date: Tue, 22 Sep 2020 13:34:50 +0000
Message-ID: <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
In-Reply-To: <20200921152337.GJ6152@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNjczODU5YjUtOTdmNC00YTQ0LWFlODctODg5MzQ1MDI5ZGY0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiK1N2T1BTYWlzZjNVR1VaZzRTWkh2Tytza3NKZVZ3OXU0cnlOSlFiUFBTNFUxazZpSmJqb1NISG5FbkxNdWhxYiJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:8168:bf97:c778:a1a0]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 925b64ad-a34a-492c-769b-08d85efc49a8
x-ms-traffictypediagnostic: SG2PR0401MB2158:|SL2PR04MB3132:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SL2PR04MB3132AAD9F30EBAF84F75E51AE13B0@SL2PR04MB3132.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hGrTCo9FmT0HmzXMwwav1bIDiFaSM+PRzf6CwPsSBxpa0fKIQbNb4DWKBMQ91WxjvC0uBMpEvBOYSRoQJ4iQqtMYaMOcOxuUgS4KF/9TtpaJXPc8FmCMft1mknCIAmAMpJX1n6oNBaa3LvgIAOupdIj8dP3G4J3CVNEG+n5QLaTEjd9xVCz6hWCa5agp9H330qgVEuDjRIkFHoSDAHCEX9sd3knT/lP71wWuz4cC33EaM5hF2pkSdW0UqTODO7stYV9CA5D/uR0Ouw8y6IIxAXVPoOdh8kwjuMub2PP5zQg/SV5H1aImlLwgBAMO4JmiQPd80jsecx/QHc4njg2JrbV6B4K8zxZlAxlD2DP+0DWwhhgLJBVftgIsZ50wkUfSNgqtn6mYDDElLuV18gQCzQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(2906002)(186003)(966005)(8936002)(8676002)(7116003)(53546011)(6506007)(9686003)(7696005)(52536014)(55016002)(4326008)(478600001)(71200400001)(3480700007)(66446008)(76116006)(66476007)(66556008)(64756008)(86362001)(33656002)(83380400001)(5660300002)(66946007)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: G2KNju+6eOo5f8qdTPiR6hqNe66Zp4P56PSbFRun7CHKX22ICBkosZtJtluk9rldh9WFMuRxEvZYJDp9RMttBtuoNikB65ClWp9CNEct3oFu1ITwzb4l/QGgDvoTHx4UYeg1DlZ4nrdi5ONzJfRKPTZO75I8OD7xBuiL1WQbnaQR27SlkodmrdtwbxfXy7khNFJPrddBXJlJbi7yQXEdwVyLEWS/6fN3vyFHM5R3h7MdX5En5N1BNpdN19D+w0dINFcqYd4I4CfmHyDjz+dHf4fPIwNUw8YuCCmkx5Db7XBw6d1ErdjLmwL4XPqo6GgAzf5eU/Kdm6s1pJyOKRpUFnz8vUYoY4Uy1k56+0j7LwbQ6UXhWPXThI9e5Pveg02vUVv8O3IuZF0TYNWCavdqfY7SEhAOCHhbapGulSKpVaKQUv0B/xaP+cq3IcJ90/DLHQqggjycmro+qQPD618Iogvy4JEtg/6VNaU5r4ASY7PfhYNslfg5/5IUCObI3kyQY1Tk5xtP+f/WG01PJyVQlT4MJ871juPZCneQx64VjjOrekpGkJPrEDe59SHdWOvCUf+D2NbbTYmQFiireWzuB0VHmwPNwzzrMTYuUwZIsxf0Ewe5kGRuayw/6FqvaY6Qq/wJ+AEo/bAXHJESAKbO+L7iOea6iBx1oruM0J7/sXAZkiKE1oBFmEZObqMIKnngPLM9Vbc97Vwj14JjQgwkuQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2158
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT051.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4f468e26-5cdc-491c-f18f-08d85efc47fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHLUVesix9ZpcH3kU5nIoF0PciBP+I51jcoIQOhZIR5IYbfNqdVwxyA98Poh/2RDGur8b2nSzG3Yy5xoSJSoFoF9jIDtuESRHKpoxWAz9gYYMahsPpkXs+vfZw3J0sSXdqlAXxt4ZlcW6JnaKYMsRhboIsf2eJuCWvdX9/MZ2u5Fwckknmiy1R95jeRd9mSXql+PJQyLnVXlN2dkcCvZQRvcldYQpFVjrV9NGUu/yZADiujqu32ye0QrbLe4VwV92CT3ksCnC1OFbZtUCyH/ThzB7ZjM6nExEqNnTXlgEybucUJFl+nXK6uTd4zxVxKuqgnDYopMIKz28Tq/2BRhFEp3x5OIOeEnza1oenGBQtdHD7JLqP372N08wSRQmf0QiJm7u2iClCU83vYAmUWOvQOEn0rXcYZ4LvW3QeOku0eciqcoFWWRw/GC3Fr1aKqw/fnPAcUjiutDvZ0CJ5uigNALcVHDiHeMONTL317vCl8Tbwt5XtInRkTh5FFz/JAJ81c6c3Zy9O3PRZLGcn8RKUuRkPD4bavanPLtptEH8KAbOGF2/HvL2LwljXHy0X2E
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(478600001)(82310400003)(34020700004)(70206006)(7696005)(33656002)(81166007)(86362001)(55016002)(53546011)(6506007)(966005)(82740400003)(110136005)(52536014)(47076004)(26005)(5660300002)(9686003)(316002)(36906005)(2906002)(83380400001)(4326008)(186003)(3480700007)(336012)(7116003)(70586007)(8936002)(8676002)(356005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 13:34:52.7084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 925b64ad-a34a-492c-769b-08d85efc49a8
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT051.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3132
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: HCL Internal

Thanks Patrick for your response.

In phosphor-bmc-code-mgmt, I am seeing the software image is upgraded and b=
ased on the image update, version is updated.
But in my platform, I have to read firmware versions using oem commands and=
 that version should be displayed under dbus objects.
Whether phosphor-bmc-code-mgmt repo will be suitable to display the firmwar=
e version using dbus objects?

Regards,
Jayashree

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Monday, September 21, 2020 8:54 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: openbmc@lists.ozlabs.org; Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: Re: Read Firmware Versions

On Mon, Sep 21, 2020 at 02:12:55PM +0000, Jayashree D wrote:
> We are working on a platform which has multi host and each host have firm=
ware versions such as CPLD, ME, BIOS, Bridge IC and VR.
> We have to display it in dbus objects.
> Can you please provide your comments on which dbus objects it will be sui=
table to store all firmware versions.
>
> Also in phosphor-dbus-interfaces, I am seeing "System.interface.yaml" in =
/xyz/openbmc_project/Inventory/Item/.
> Whether it will be suitable to store all the firmware versions (/xyz/open=
bmc_project/Inventory/Item/System/HostN).

All software versions should be modelled per [1].  The sub-section [2] tell=
s how to associate an inventory object to a software version (to show which=
 BIOS version a specific host card is running for example).

I don't think 'Inventory.Item.System' is intended to represent a single hos=
t in a multi-host system; 'System' would represent the entire chassis.  You=
 may want to use 'Chassis' or 'Board' to model a sub-assembly.


1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/Software
2. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/Software#find-all-software-versions-on-a-managed-element

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
