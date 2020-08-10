Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E3240B4E
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 18:41:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQMD51HHhzDqTm
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 02:41:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.97; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=U49DE8Gd; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=U49DE8Gd; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300097.outbound.protection.outlook.com [40.107.130.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQMBq514GzDqFv
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 02:40:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qffpXnTz7qNerYRVGRtfd8axS5kcorwHaKo7tPJN44=;
 b=U49DE8GdFYoEvtoVmcLO5OnUgDRSHEuWGMxPFmBJeEm4ba/LuhRppdNc5VgMMetDNvZCB/ijNUqAFip5vhtVp6bGDV9sOsAJ1qloG8gvq7YXbxbzdYi9C4k0XvRy0+gbMCcvwmwMq6w9yqDzOsXGEiTz9XmRs1qREFdJv1jE2yo=
Received: from PS1PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::30) by HK0PR04MB3489.apcprd04.prod.outlook.com
 (2603:1096:203:a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 16:39:45 +0000
Received: from PU1APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:75:cafe::ec) by PS1PR01CA0018.outlook.office365.com
 (2603:1096:300:75::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Mon, 10 Aug 2020 16:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.51) by
 PU1APC01FT055.mail.protection.outlook.com (10.152.253.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 16:39:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fiz+U6Db9tmcYjhzsKGtaec4Ax95NlrCGhJ12RzeCIiLBh6HUhLiW55c4R+B5ZWn5SpwEOM0++9cLhFbhAgMSkGmgLx4paMKYbkRrwo/btwSfYvMZ3fkCcXfXJeYYBm6ajYeQcCHxlFUAUw1g5NATc92jVy0fg/iz+muM70PUWGWgsrFDEh+UfkA493n2S6toAtg9+HuH5P2ZktWtDdDwhW4IzdeIWmRqfyghPXR3tZahGeg760lFsnwi+qGlYdeFkZnC3vanEFSwjRPsl1/644feN/DAbkjfWejhV3Joe7t90haYZF9dS7a7al6ptW/ePP6oq97hWWuTbALKnmozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qffpXnTz7qNerYRVGRtfd8axS5kcorwHaKo7tPJN44=;
 b=JHcHgVnG6fufC2+LP2ObaPruqJy29wCYYvjTpzGRgem9MZVUOL74lVFBJk0SefGrqw7/uIqVNvAOdJNFi2MZ51WNH5nySaLsRvwl+mV8Nc/GpLVIwsgoOSxt5Fu4sQAq4z86LJfqzNoUcJ8Wm++f7w9pcpvi4GKq6HKJQJ8eRPLD5++LprJwFXAmXyJXjYXox7+2ilRTm4hqJXZ2W25EZvLxjFQwtyNcOLXWFzpL3UQ49qn322AOzAe5V0nKc+mATmSuB1CrsdQMRTX/RaW0fdhi5S30ObXO16U9pKYt5HMD8unDCZ0+/lFKdaAkdDr28mx6nTKOYMQdoHZ5l6aOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qffpXnTz7qNerYRVGRtfd8axS5kcorwHaKo7tPJN44=;
 b=U49DE8GdFYoEvtoVmcLO5OnUgDRSHEuWGMxPFmBJeEm4ba/LuhRppdNc5VgMMetDNvZCB/ijNUqAFip5vhtVp6bGDV9sOsAJ1qloG8gvq7YXbxbzdYi9C4k0XvRy0+gbMCcvwmwMq6w9yqDzOsXGEiTz9XmRs1qREFdJv1jE2yo=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3643.apcprd04.prod.outlook.com (2603:1096:4:94::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Mon, 10 Aug 2020 16:39:42 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf%7]) with mapi id 15.20.3261.025; Mon, 10 Aug 2020
 16:39:42 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Redfish Mapped Commands
Thread-Topic: Redfish Mapped Commands
Thread-Index: AdZqbpDa9Xh4Aof8S1qw+YL6JLitoAEuqs7g
Date: Mon, 10 Aug 2020 16:39:42 +0000
Message-ID: <SG2PR04MB30933F46CDEDE1A1873FCFB6E1440@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYzA4MWJjYTUtOGEzNC00MzMxLWE5YTctM2E4YzgzNzJiZmFiIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InJGSWdibmdLUEVueFNcL3B5WEsrU3k3eFROUWVqOHdsY3NvUVRMaGxEaTNjRzVYVnlVNWRYVDZRdlV6NlwvY0ZNSCJ9
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6e8e:145c:711e:4cce:858f:c93e]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4c6208e2-78da-454b-d3e6-08d83d4bfd1e
x-ms-traffictypediagnostic: SG2PR04MB3643:|HK0PR04MB3489:
X-Microsoft-Antispam-PRVS: <HK0PR04MB3489AE13E8577528F2302BE5E1440@HK0PR04MB3489.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: efH5SKZGf1kKW0IwTpLx4Z5B/cdkgVshM4LNEy8Qcr+m4Lg+9h68hzlxwgxHHBD6KyCvS4D6TUbFAgQb7HweLAlQSvJVJhbt+W+JGg/De6QIn5d03HONum2JvabuxIccM9dZVJ+YMlrQ3qcSgoqVi76AW15nbWFZa6I7XA+0wYCApqeoZFBHUqV2jxbHP1bLlRj0LVjw2lOgsd4jCj2me8D8EVqml2/vTZMJhvKp/e1jaGPI7Rto6pemVyS/p1aV5SMfSUDlGNaz+wSEKybij5Jx5SB4NEtho9bpasr6YamFVNmFSm0Ee/al7lp+6AkpLnsrl5yKXfRpxTZKpmamiw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(33656002)(186003)(5660300002)(316002)(86362001)(55016002)(66476007)(52536014)(6916009)(9686003)(9326002)(8936002)(7116003)(7696005)(76116006)(8676002)(2906002)(6506007)(53546011)(66946007)(83380400001)(478600001)(66446008)(66556008)(3480700007)(64756008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pJrH4Ig+yZpiQFd5g8L0BVJTB4pwCNqsi+05B2bSWdCxYj9paOi7JAl1D8SCmmAirA5kH8yuCUHhhFbFpD7cFI1M/VMOtOPtv8ZE+qddRcjLTIl3wmfC9ZbGP3zCiMgQyHBxaZrdQiaAppzDd6q8u22KZiAwNORaZMq2DEpKZROcbhyxSnuaeIzoS+G2iOKRx2Vx/XFGO73gcnBZQ+HsfzlmAxBpAr1bFLXUrFFRDT75Vrz7rt1KxZiuO/+AKwTWD2f1d0w5KI8E8xMTuat6EZQL2mdgPrswKHZbydoqPSVKLDGtVtsfurlnyVrkZ3NCZde0/OSaYhmUpajkEB7mQH0Hnv4VUpwykA272A1SsZ4sRuTuyfvRev5y/T2id5ANqsaNRZZjgWUx12yvvK69f5+UxAG0GVNYvDwu4hptWGizvkZgOqhRbZfwffythaJGDMmhi4Nb9aYF64WxRaAIeK/jACgd2/+q9Vg5jPoN/LsRtADks3TFyisnqKj01H9MXp20V/szG4/XsLLEWfs125s51l01kby//WiP49/TFEzfVG+cANvcptZkscceEOhHXEmJbLk3yNEVtYqBSsiWlDUQ7WbQTHI1ReeHnP1jEZVWk+ATQJwGs82PBycB2/4j+QSVTqKX2RveD2Fkqct5s6rFfzxRWPCa9+bzpG+UalqkPZAVmC9cKWixPbsgHo5GtELHCMEsoZLnBGI6zbEnqw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30933F46CDEDE1A1873FCFB6E1440SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3643
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 05a4291e-9804-4137-4e18-08d83d4bfb74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AyI2xn4EI4whg/z6ESRh7VxSe9MlnbzrULcO0SNQE+ZnGcdtndCE4PC4WIVrzJq0Kk88C4u8/t0qQxl8XvuGkRjHgu2VZG2PuiU1bCRMeBX+tNKi6Mxqb/C8ilfYKdXXOug3FB37tw2Pqovy7FCQQhtZ29V62pr4nZacgQA4TKE9TYXtqyvAFh1sj2TESJsQa4nuWOppCOV6XxMyEAnwwLfptX69y+kd9DyGZs9EPU4oWXAEDJ8LXLbzTZLLQ0lEXa/3h3phqJ8TSUHV0JIKYWh8kvlmrzcerD5INRQxtqYlgyN+H93dZexPWND+vxA/R358JkE00A1d1gZfckC2U/PBlCkrwvrNe/DvKBurKMLqGFu9QhbhVm0APnztPfbf/W5nKa+c14n8cz7BIb/Itg==
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(36906005)(9326002)(8936002)(2906002)(316002)(55016002)(7696005)(8676002)(478600001)(86362001)(9686003)(6506007)(53546011)(52536014)(47076004)(82740400003)(6916009)(336012)(81166007)(70586007)(26005)(33656002)(83380400001)(70206006)(186003)(356005)(5660300002)(82310400002)(7116003)(3480700007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 16:39:44.5955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6208e2-78da-454b-d3e6-08d83d4bfd1e
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3489
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

--_000_SG2PR04MB30933F46CDEDE1A1873FCFB6E1440SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I got inputs for two features, Is there any other redfish commands related =
to other features?

1. We are using X86 power control, is there any compatible commands in redf=
ish to test?
2. FRU information.
3. obmc-console-client to connect the host.
4. To set, start and stop the fan speed controller.
5. Host Logger.
6. LED
7. BIOS Upgrade
8. Settings Manager

Thanks,
Jayashree

From: Jayashree D
Sent: Tuesday, August 4, 2020 8:24 PM
To: 'openbmc@lists.ozlabs.org' <openbmc@lists.ozlabs.org>
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: Redfish Mapped Commands

Hi All,

I am about to test redfish commands for the following features.
Can anyone point me the related redfish commands for those features?

1. We are using X86 power control, is there any compatible commands in redf=
ish to test?
2. FRU information.
3. obmc-console-client to connect the host.
4. To set, start and stop the fan speed controller.
5. Host Logger.
6. LED
7. BIOS Upgrade
8. Settings Manager

Thanks,
Regards,
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

--_000_SG2PR04MB30933F46CDEDE1A1873FCFB6E1440SG2PR04MB3093apcp_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi All,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I got inputs for two f=
eatures, Is there any other redfish commands related to other features?<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. We are using X86 power control, is there any comp=
atible commands in redfish to test?<o:p></o:p></p>
<p class=3D"MsoNormal">2. FRU information.<o:p></o:p></p>
<p class=3D"MsoNormal">3. obmc-console-client to connect the host.<o:p></o:=
p></p>
<p class=3D"MsoNormal">4. To set, start and stop the fan speed controller.<=
o:p></o:p></p>
<p class=3D"MsoNormal">5. Host Logger.<o:p></o:p></p>
<p class=3D"MsoNormal">6. LED<o:p></o:p></p>
<p class=3D"MsoNormal">7. BIOS Upgrade <o:p></o:p></p>
<p class=3D"MsoNormal">8. Settings Manager<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<br>
Jayashree<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Jay=
ashree D <br>
<b>Sent:</b> Tuesday, August 4, 2020 8:24 PM<br>
<b>To:</b> 'openbmc@lists.ozlabs.org' &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Subject:</b> Redfish Mapped Commands<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am about to test redfish commands for the followin=
g features.<o:p></o:p></p>
<p class=3D"MsoNormal">Can anyone point me the related redfish commands for=
 those features?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. We are using X86 power control, is there any comp=
atible commands in redfish to test?<o:p></o:p></p>
<p class=3D"MsoNormal">2. FRU information.<o:p></o:p></p>
<p class=3D"MsoNormal">3. obmc-console-client to connect the host.<o:p></o:=
p></p>
<p class=3D"MsoNormal">4. To set, start and stop the fan speed controller.<=
o:p></o:p></p>
<p class=3D"MsoNormal">5. Host Logger.<o:p></o:p></p>
<p class=3D"MsoNormal">6. LED<o:p></o:p></p>
<p class=3D"MsoNormal">7. BIOS Upgrade <o:p></o:p></p>
<p class=3D"MsoNormal">8. Settings Manager<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
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

--_000_SG2PR04MB30933F46CDEDE1A1873FCFB6E1440SG2PR04MB3093apcp_--
