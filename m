Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA6249A19
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 12:18:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWkJw6PDYzDqsl
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 20:18:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.130; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=O4tJoqvS; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=O4tJoqvS; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320130.outbound.protection.outlook.com [40.107.132.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWkHm48ctzDqkB
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 20:17:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRXtGr3TokNuGF3fqqwqBTZzux5SBqLpAhtgDySXkMY=;
 b=O4tJoqvSUJB+8cqlLsaAyGCwoDDbNx0Y2K9tdAnXTyYxUNonaEmjrNu8SubS43VrOReGqhLMXSh+CDf/pxEkyE80jJ0bIo4+vACm/UHCGhagQfSQ8ax5STSntamXmJay4UbfazaFpt+gHG8F0mmpJgoxZqE23NGeuEfZwU6xdEw=
Received: from SGAP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::25) by
 SG2PR04MB2570.apcprd04.prod.outlook.com (2603:1096:4:5e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15; Wed, 19 Aug 2020 10:17:35 +0000
Received: from SG2APC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::5b) by SGAP274CA0013.outlook.office365.com
 (2603:1096:4:b6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 10:17:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 SG2APC01FT061.mail.protection.outlook.com (10.152.251.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 10:17:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TioFIk6qD0Q56AZ5jNzR2FL1FRibXgU5tquKr12LtLBHsGYE/NfkECAkVLFMk76KAKkz/qvXAa/G3TZTupD8KMTpA6jqPVq4HGB4iR+43F2kLBN0cSX+TPm6PfpHKDFS0zqZApjnA6Qf54Tsehkkvu9LmMPpNZAPW6nIilBhJEo1Ut+1pgZEvedIQJNj8oe0lMsASs1Wxn+B3YoA39z2ree/9P1K/59edxTG9YeRPQw0E1zISG/2mkMvGUpo05s2BxPRJTDgM6bGdAOvHVf3iqnljPGGC/5BnenR2w7h1widRPplOAZ3g0CaPX+EJGHDMRwgjiTBL+X2gq0/Xp5iDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRXtGr3TokNuGF3fqqwqBTZzux5SBqLpAhtgDySXkMY=;
 b=n8vyhauaKtu/lLNYELOoMLtKQY1KIm8AKhsPlrr8O9pENWUNa97KBTAgj+LLuWy3eAcocaoh2uraXnZ1MHxAm92AFUoG+FLYAY4JYQEVDyjt79Wr7HpP3V4XH+XWVQlF8LFB2yNqM8bgYxc5G33LLgwSfqIff7txfcRVD+Tgj2DZVjsjZ1SByXwqZWVZuThgY099AXDXfsIZ3VXHn4GW8QWo/eORZqtqCPlbDO6EA0c6Yqbaxk+kNK9HQFNmtYxFNh8jpmmBTLkfAQP+W2kxUQd2ZjDoemYw61bUehtxHyp7sR0tiiLBQX/cscuBMgqyLZHa9vSWZmeF0DLyg+XzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRXtGr3TokNuGF3fqqwqBTZzux5SBqLpAhtgDySXkMY=;
 b=O4tJoqvSUJB+8cqlLsaAyGCwoDDbNx0Y2K9tdAnXTyYxUNonaEmjrNu8SubS43VrOReGqhLMXSh+CDf/pxEkyE80jJ0bIo4+vACm/UHCGhagQfSQ8ax5STSntamXmJay4UbfazaFpt+gHG8F0mmpJgoxZqE23NGeuEfZwU6xdEw=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2602.apcprd04.prod.outlook.com (2603:1096:4:5f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.27; Wed, 19 Aug 2020 10:17:31 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 10:17:31 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish Command for BIOS upgrade
Thread-Topic: Redfish Command for BIOS upgrade
Thread-Index: AdZ191uHg2iQj0c2Tb6bR83O0OShiA==
Date: Wed, 19 Aug 2020 10:17:31 +0000
Message-ID: <SG2PR04MB3093867445ACAAD1D6E8C057E15D0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNTI3NGE1NTUtNDhiYy00MGMyLWE0MGQtZmEwYmViYWYxNTZlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlRoQ0MyanlhSk5hN1BMa050QVIzK1VVUWVZUWhlamt6M1NEV3dHTFZ4blJlVWcrcGh0eklcL3ZVa2lYV0hjbkdRIn0=
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.50.9.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc82f48-9cbd-486f-dde1-08d84429168f
x-ms-traffictypediagnostic: SG2PR04MB2602:|SG2PR04MB2570:
X-Microsoft-Antispam-PRVS: <SG2PR04MB25703E8325009C8F99C70EEAE15D0@SG2PR04MB2570.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: o7dzKEQBdVCb2T3sXbdK9GKZYu5zjhRj46Qdf/8cegrOtuqyUcIgnZ4MtH9dpK+mtPIWEGI49zDVVrKBpIM/TOMYZ6t7sY0iDi14dZzioVfdozL1KUBAkgk22RQd3QkuiKtk+cCI4kP5p4+Nlj80fOu8tnCE5ap9XJdtH2o1wtPWzuUe/rTzdcg4qYyGpK2aA+Pylz0HZsxto7eE821U7BHISt08OaQPFxKI9vuMICMMPAG2L/A9t3FkV02FLg2AHdv6fsUa4e+4YOjwBG/cjYQqI8rTIkEPAmeSGy9GhXAomQ34YlDhQqedjkNkLZ6Z
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(66446008)(64756008)(83380400001)(76116006)(2906002)(33656002)(86362001)(55016002)(9686003)(5660300002)(66946007)(52536014)(71200400001)(7696005)(966005)(478600001)(66476007)(9326002)(66556008)(8676002)(26005)(6506007)(316002)(6916009)(8936002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /60j5p9TeWh6S/SBM++oVC4RaxjBLt2Z0bPWtYzQZlTz5BLkjYkgyrVQH+VwcPxRl1YKbymF5RT158AuGC4dci1IqjYBHoyIwnj3JQm+TfvHtpd9SB0oOlgFL/3thKe8+b7Gfi3WSCbTI0RlrQC+w2CbskBqMryGv77PhDnXEoY/+7AUo6bJhkzAgLImovfBQoaPcFt31DZ921iK1MghuBQYXXNcBSBdxtpdyZunCjmDJLIHpQ0FwMSso26mKHyjanj3Klzb5T2PFLFtg/7Ut7ONA2Z+gTYCVQWNgfk/IjHVL6TKAV+29/sBvLY8zmWiFoKOlaNkOPzIGYwsKuip5q/CZF/LKFk7/f3ddHkkb0YQ2FKkKoLWxXb+WIZe6ILIXBmNQhvBIQYfuExzaeCvoLcoC2enRYKCXXKgBGigU980xqcyuCD54Fg4dg/jhR3ib1J6DQXO+QknlEa2f4d2Fwarl09eCy2rSFgfeeyWxzIbJL7Fzm38/saHBQH0Fa4Rz1v9Jv6DgUsyTmV9PPI93iDGde8/XT85OaCkZZ2sr6aDv4cwIOXYpg2Fw+xijPc1uJ9bs0xVifOfHMSbLp4MpJEhA7EYuWolLBzYi0zWPPMWqHPbM9OFClI3kfaYrw0O4wvr88BxyA43illj7hXq/A==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093867445ACAAD1D6E8C057E15D0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2602
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 292a6a2b-77bb-435e-e3d4-08d844291560
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UmYzRgWNJl6tRbM0cMr0ypFSKMKikpVhMZc2gtZfP3ndu4q/OJRKkhl5XWKh49s7LWg25Q0iwU5ImIwxRzhkihSxhhgYGra5beJOwi8eyZ8bezQc7wsxKF3eKfbBKUWYyg3200UkuQFCeAcQLd3sFantIYYUMjniBZDh9ZCoCkR9eJCe6jKveQQ09ZocgYWkqeA9ygpz9qFeiiXUdQoywAcBe1hq4PSTUrxt5MfpkRRxZE2x3bcwmLmlrlqN6iu3s+ZMTJW+XBxaLupN9rRxaUtysl6XXZ8L2GruMmE6w3dpmqLlq3/OUWOXVI9GdL+cMQq2mL0i4J9w/QgKfnNDtDrbxAdZKgtDc9GpypnKe3ix8RuoE1a3akfUMfa5dXpDU1BeTSk5Nljfzb/RHmJjw==
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966005)(6916009)(86362001)(356005)(336012)(5660300002)(8676002)(6506007)(9326002)(8936002)(26005)(186003)(83380400001)(9686003)(82310400002)(36906005)(52536014)(316002)(55016002)(82740400003)(47076004)(81166007)(966005)(7696005)(70586007)(2906002)(33656002)(70206006)(478600001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 10:17:33.2511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc82f48-9cbd-486f-dde1-08d84429168f
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2570
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

--_000_SG2PR04MB3093867445ACAAD1D6E8C057E15D0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am working on BIOS upgrade in my environment, and I tried the following s=
teps to update the BIOS.


1.       I copied my image(bios.tar.gz) to /tmp/images in BMC using SCP met=
hod.

2.       After that, updated the BIOS image using the below dbus command.

busctl set-property xyz.openbmc_project.Software.BMC.Updater /xyz/openbmc_p=
roject/software/28bd62d9 xyz.openbmc_project.Software.Activation RequestedA=
ctivation s xyz.openbmc_project.Software.Activation.RequestedActivations.Ac=
tive

3.       I find the below journalctl logs after updating the image.
              Journalctl Logs:
root@tiogapass:~# journalctl | grep image
Jan 01 00:00:37 tiogapass phosphor-image-updater[229]: Error in mapper GetS=
ubTreePath
Jan 01 00:27:44 tiogapass systemd[1]: Starting Flash Host Bios image 28bd62=
d9 to Host...
Jan 01 00:28:09 tiogapass bios-update.sh[1522]: Bios image is /tmp/images/2=
8bd62d9/bios.bin
Jan 01 00:28:09 tiogapass bios-update.sh[1522]: Flashing bios image to mtd6=
...
Jan 01 00:28:41 tiogapass systemd[1]: Finished Flash Host Bios image 28bd62=
d9 to Host.
Jan 01 00:28:41 tiogapass phosphor-image-updater[229]: Bios upgrade complet=
ed successfully

In REDFISH, I tried the following command to update the bios image and it s=
hows error.

#curl -k -H "X-Auth-Token: $token"  -X POST -T /home/bios/bios_18aug.tar.gz=
 https://${bmc}/redfish/v1/UpdateService
{
  "error": {
    "@Message.ExtendedInfo": [
      {
        "@odata.type": "#Message.v1_0_0.Message",
        "Message": "The request failed due to an internal service error.  T=
he service is still operational.",
        "MessageArgs": [],
        "MessageId": "Base.1.4.0.InternalError",
        "Resolution": "Resubmit the request.  If the problem persists, cons=
ider resetting the service.",
        "Severity": "Critical"
      }
    ],
    "code": "Base.1.4.0.InternalError",
    "message": "The request failed due to an internal service error.  The s=
ervice is still operational."
  }
}

Could you please let me know, if there is any command for BIOS upgrade usin=
g redfish?

Thanks & Regards,
Jayashree
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

--_000_SG2PR04MB3093867445ACAAD1D6E8C057E15D0SG2PR04MB3093apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1304501057;
	mso-list-type:hybrid;
	mso-list-template-ids:-1090212700 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1607812492;
	mso-list-type:hybrid;
	mso-list-template-ids:-1090212700 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<br>
<br>
I am working on BIOS upgrade in my environment, and I tried the following s=
teps to update the BIOS.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>I copied my image(bios.tar.gz) to /tmp/images in BM=
C using SCP method.<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>After that, updated the BIOS image using the below =
dbus command.<o:p></o:p></p>
<p class=3D"MsoListParagraph">busctl set-property xyz.openbmc_project.Softw=
are.BMC.Updater /xyz/openbmc_project/software/28bd62d9 xyz.openbmc_project.=
Software.Activation RequestedActivation s xyz.openbmc_project.Software.Acti=
vation.RequestedActivations.Active<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>I find the below journalctl logs after updating the=
 image.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Journalctl Logs:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">root@tiogapass:~# journa=
lctl | grep image<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jan 01 00:00:37 tiogapas=
s phosphor-image-updater[229]: Error in mapper GetSubTreePath<o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jan 01 00:27:44 tiogapas=
s systemd[1]: Starting Flash Host Bios image 28bd62d9 to Host...<o:p></o:p>=
</p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jan 01 00:28:09 tiogapas=
s bios-update.sh[1522]: Bios image is /tmp/images/28bd62d9/bios.bin<o:p></o=
:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jan 01 00:28:09 tiogapas=
s bios-update.sh[1522]: Flashing bios image to mtd6...<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jan 01 00:28:41 tiogapas=
s systemd[1]: Finished Flash Host Bios image 28bd62d9 to Host.<o:p></o:p></=
p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Jan 01 00:28:41 tiogapas=
s phosphor-image-updater[229]: Bios upgrade completed successfully<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In REDFISH, I tried the following command to update =
the bios image and it shows error.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">#curl -k -H &quot;X-Auth-=
Token: $token&quot;&nbsp; -X POST -T /home/bios/bios_18aug.tar.gz https://$=
{bmc}/redfish/v1/UpdateService<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">{<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp; &quot;error&quot;:=
 {<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; &quot;=
@Message.ExtendedInfo&quot;: [<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;@odata.type&quot;: &quot;#Message.v1_0_0.Message&qu=
ot;,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;Message&quot;: &quot;The request failed due to an i=
nternal service error.&nbsp; The service is still operational.&quot;,<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;MessageArgs&quot;: [],<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;MessageId&quot;: &quot;Base.1.4.0.InternalError&quo=
t;,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;Resolution&quot;: &quot;Resubmit the request.&nbsp;=
 If the problem persists, consider resetting the service.&quot;,<o:p></o:p>=
</p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;Severity&quot;: &quot;Critical&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; ],<o:p=
></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; &quot;=
code&quot;: &quot;Base.1.4.0.InternalError&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; &quot;=
message&quot;: &quot;The request failed due to an internal service error.&n=
bsp; The service is still operational.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you please let me know, if there is any comman=
d for BIOS upgrade using redfish?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks &amp; Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
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

--_000_SG2PR04MB3093867445ACAAD1D6E8C057E15D0SG2PR04MB3093apcp_--
