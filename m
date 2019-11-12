Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D24F9F53
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 01:33:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CQZv0MTVzF37y
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 11:33:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febd::70e;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=agnes.amree@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.b="ZV4Dtz9W"; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.b="ZV4Dtz9W"; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47By6Q16ZPzF4YD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 17:10:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTx/jUW8dd38+YoQinInmfmx8R2a95WW1YizG1ex7IU=;
 b=ZV4Dtz9WbMdtyXEbupnwPCqqjMkYS/IM1AYHoLCpamw0+zd25nsdd5k3qnEqMs/dpCfiK+py94BLV/0JvuRiQlQNMWOl5mOlxeHB0MYvdv/Rq9DM98KBfCbKzvxSrKkGkWh8Q/eaHjlYyzCLtNp4gDEzUImo2LA+ChOuTIqvqOg=
Received: from PS1PR0401CA0043.apcprd04.prod.outlook.com (2603:1096:803::11)
 by SG2PR04MB3142.apcprd04.prod.outlook.com (2603:1096:4:69::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Tue, 12 Nov
 2019 06:10:43 +0000
Received: from PU1APC01FT007.eop-APC01.prod.protection.outlook.com
 (2a01:111:f400:7ebd::204) by PS1PR0401CA0043.outlook.office365.com
 (2603:1096:803::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via Frontend
 Transport; Tue, 12 Nov 2019 06:10:43 +0000
Authentication-Results: spf=fail (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; fuzziesquirrel.com; dkim=pass (signature was verified)
 header.d=HCL.COM;fuzziesquirrel.com; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Fail (protection.outlook.com: domain of hcl.com does not
 designate 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT007.mail.protection.outlook.com (10.152.252.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_CBC_SHA256) id
 15.20.2430.22 via Frontend Transport; Tue, 12 Nov 2019 06:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg1qvv8bnaTtIGLIjNih5QrvayNnziDBcGpXPkQU0G3p9uj+5458KQPdcep9+rv51THHh0wL+M0MQfT3dqeJpR5yNYI6ZGsRSCngVcuM1y7bZNLBFnbjNK5jpdQTsCVoc5xNA4Lpn64cXXtyf/SsnEg3WuWJAK2Rx5LHhkPHsD3ZAeGI2ZZaLmMg+n9zPAXI58YxYBiK6BmMAxAYpQ6Bf13y7WoI2PDQyz/t5YKbRbHTt/uik8L/jJpoDkoqivAlrrADwHY4JqHCr1FZ2jIj5V6YKDXq6azZRuIVKmQZ8eAF70EIRuw65lYFVB+N/331s7k2XTTe0a0/0Qzz8XRNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTx/jUW8dd38+YoQinInmfmx8R2a95WW1YizG1ex7IU=;
 b=BTpFA5PjX+lHIQq4/Fyyj1+Alc6xmrBBoFQtERhoKM24YRTq5kIl+2zRa5Wr/4DpR3Esw7pT2mO1an9FYaBz8QSEFsRwVePZ6hUFIJSFRwl4soRnUTnldRrLu0ukfag3k7PUR/KnkffsWIVOaA9n7OvWDfP9XQgwQLx3SrVaxTcNaRqDJJd0VX2oAI8vtQ4+Su/o8ZgqyWaChlmN2huU0NxR8fRRdtbbl+NLi2vXc1sQ8fkYpCw0Gsryr6t4vZqDIXpEuA5p+ryVsAUhxyCWsQoJfTgGDMSnATxGDgbvLaRrTh0RPMDowRZu6RNloPL/S2we5H5mmHHZsLQg6MWOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTx/jUW8dd38+YoQinInmfmx8R2a95WW1YizG1ex7IU=;
 b=ZV4Dtz9WbMdtyXEbupnwPCqqjMkYS/IM1AYHoLCpamw0+zd25nsdd5k3qnEqMs/dpCfiK+py94BLV/0JvuRiQlQNMWOl5mOlxeHB0MYvdv/Rq9DM98KBfCbKzvxSrKkGkWh8Q/eaHjlYyzCLtNp4gDEzUImo2LA+ChOuTIqvqOg=
Received: from SG2PR04MB2876.apcprd04.prod.outlook.com (20.177.17.148) by
 SG2PR04MB3269.apcprd04.prod.outlook.com (20.177.93.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Tue, 12 Nov 2019 06:10:38 +0000
Received: from SG2PR04MB2876.apcprd04.prod.outlook.com
 ([fe80::79e1:f838:1b7e:793a]) by SG2PR04MB2876.apcprd04.prod.outlook.com
 ([fe80::79e1:f838:1b7e:793a%7]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 06:10:38 +0000
From: Agnes Amreetha Joseph Arulraj <agnes.amree@hcl.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: HCL CLA Update
Thread-Topic: HCL CLA Update
Thread-Index: AdWNrw3TPOT+OV1lTTSDG/+EH8//rwF0i6KAAWdQw/A=
Date: Tue, 12 Nov 2019 06:10:37 +0000
Message-ID: <SG2PR04MB2876740BC6913B8AB5746397FC770@SG2PR04MB2876.apcprd04.prod.outlook.com>
References: <SG2PR04MB2876DAF2455DB54427EFFFD6FC660@SG2PR04MB2876.apcprd04.prod.outlook.com>
 <FFEF2719-9A94-4D8A-9409-7D90A4957D1A@fuzziesquirrel.com>
In-Reply-To: <FFEF2719-9A94-4D8A-9409-7D90A4957D1A@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMmYxODU0MjctYjA2ZC00MDkzLTkzNzItMDdlOGE4ZjZlZjkxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImJqUHcxOHpqeE8rcGRtSjJXMXREbEVzQjBvdUNBdWpFMEt0UUpzcEdWRWlZSVVQREVzMmRpc3MzdXB5Q0h6bmcifQ==
x-hclclassification: null
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=agnes.amree@hcl.com; 
x-originating-ip: [192.8.229.10]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7b973c30-bdb7-4475-e15f-08d767370c95
X-MS-TrafficTypeDiagnostic: SG2PR04MB3269:|SG2PR04MB3142:
X-Microsoft-Antispam-PRVS: <SG2PR04MB314234F8BC93A886A4147D37FC770@SG2PR04MB3142.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3513;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(13464003)(38564003)(189003)(199004)(71190400001)(486006)(54896002)(6306002)(476003)(71200400001)(55016002)(15650500001)(11346002)(2420400007)(33656002)(446003)(733005)(4326008)(6436002)(7110500001)(66946007)(9686003)(6246003)(256004)(6916009)(7696005)(74316002)(236005)(7116003)(76116006)(76176011)(14454004)(102836004)(5024004)(14444005)(86362001)(966005)(6506007)(316002)(66616009)(7736002)(53546011)(66446008)(66476007)(66556008)(64756008)(99286004)(5660300002)(229853002)(8676002)(25786009)(186003)(9326002)(66066001)(52536014)(8936002)(81166006)(81156014)(2906002)(3846002)(26005)(478600001)(790700001)(6116002)(3480700005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3269;
 H:SG2PR04MB2876.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1BNuHQ5KLQocbPxnoWXjfe6d3hSYFUgCMRTz49aV49zT9DKnFHNlCUpFP/I5IXGmUCFzMAHF+uBzMIbvVOZBmwIiHi8rTGcnk2jc41TcgtWpnQI7NORmqPhCxFsDP2vNaFN9wpgnaVRW683zPex+RBdI61T0rRWTCnH2ChCl+20qyD+9VoJpwrIgOEdT2OuMnNxRzna+AY+OYL2ULOpv2WVc6AhCeV0JRtUxkq//uvf6F3z7GUwaSf9HPqm2sCOB7DOqfSRGe33LEhE0kzeKQJTncMC3IcN6cldZXyA1yUdrnb0sIe7e4oUZI4P+GZZXUo3BcRzeRRYyWsf7eiKyY11/HITJI430fkqyrHXKfLARAJy9vMUcmFI7V/hPLRvPn5i8lux4i1vngDSANnunlSjdRYQTOuHPurPk35jUq1DW+ThdPgwju1gsjw4i3Hw4
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
 boundary="_004_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3269
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT007.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.57; IPV:CAL; CTRY:IN; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(1110001)(339900001)(38564003)(189003)(199004)(13464003)(54896002)(81166006)(8676002)(7696005)(81156014)(74316002)(11346002)(229853002)(66066001)(70206006)(70586007)(76176011)(6246003)(6436002)(25786009)(7116003)(52536014)(9686003)(478600001)(446003)(105606002)(55016002)(236005)(86362001)(6306002)(2420400007)(336012)(15650500001)(733005)(76130400001)(356004)(8936002)(102836004)(966005)(6916009)(26826003)(53546011)(14454004)(6506007)(14444005)(5660300002)(7736002)(9326002)(186003)(66616009)(33656002)(26005)(5024004)(2906002)(3480700005)(71190400001)(486006)(16586007)(790700001)(6116002)(3846002)(4326008)(36906005)(316002)(126002)(99286004)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3142;
 H:APC01-HK2-obe.outbound.protection.outlook.com; FPR:; SPF:Fail; LANG:en;
 PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40f5dac8-594a-4068-d7de-08d7673709cb
X-MS-Exchange-PUrlCount: 2
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wqCluzpsKPNHiU1547Dq61Ub0/WmSWxPnn3+2fp4eR7pd5cFuT0AakJMxBkpSrQoBVnEvUYziPABfjdE5K2nzPqXof+zC3SRHchH1rWLT3EbanZBm42ss8AYPBNpXDFLJSwJTBhQFG70YCLa4ZNaAXVFasxPOHNZUnNNzPaSsfrdcGk3WiOHW/50B74kk4QeRHTfFru9IXLDE8F6Ky0QH7EMg7H8Ra9IjD/gLB+5E/FtqJqgR1n4on/lZBgjr+rvblmAU8jgRvcSGWaZwEWLkYeBbjXMgYedmfeMbnzNCUcCVFVo3iYs1d2Vn8x0wQ4/v125027AO66HKWSQ7jlszICewO2xvqi4bKwhIg3fK0BB0HYGOegzd6q77ScsZkfwXxbenPtd0QAmBdpOdWUsjtYS7zyvXykSpDB6FaBtPGFny3JC8ywQ8TgplvdufnBRG4dlM77tgNmasPhryboApSIaTQaddmqnDt6q8TeuSQI=
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 06:10:41.8828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b973c30-bdb7-4475-e15f-08d767370c95
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3142
X-Mailman-Approved-At: Wed, 13 Nov 2019 11:33:01 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_
Content-Type: multipart/alternative;
	boundary="_000_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_"

--_000_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,



I am observing the below issue in my gerrit review "User not approved, no C=
I". Could you guide me in how to proceed with this?



[cid:image001.png@01D5994D.FF769270]



From the link I observed, " https://github.com/openbmc/meta-ami/pull/1",

For the "User not approved, see admin, no CI" part, @bradbishop<https://git=
hub.com/bradbishop> should be creating you a gerrit group here soon so you =
and your team will be approved.



Hence I am reaching out you, in this part.



Thanks & Regards,

J. Agnes Amreetha



-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Sent: Tuesday, November 5, 2019 8:02 AM
To: Agnes Amreetha Joseph Arulraj <agnes.amree@hcl.com>
Cc: openbmc@lists.ozlabs.org; manager@lfprojects.org
Subject: Re: HCL CLA Update







> On Oct 28, 2019, at 12:56 PM, Agnes Amreetha Joseph Arulraj <agnes.amree@=
hcl.com<mailto:agnes.amree@hcl.com>> wrote:

>

> Hi,

>

> I have updated the below HCL CLA with my name  (agnes.amree@hcl.com<mailt=
o:agnes.amree@hcl.com>), and attached the same under the approval of my CLA=
 manager (Dhanapal Subramaniam, ERS,HCLTech <dhanapals@hcl.com<mailto:dhana=
pals@hcl.com>>).



Hi Agnes.  I uploaded this - you are all set.  Thanks!



-brad

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

--_000_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoPlainText">Hi Brad,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I am observing the below issue in my gerrit revie=
w &#8220;User not approved, no CI&#8221;. Could you guide me in how to proc=
eed with this?<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><img width=3D"471" height=3D"179" style=3D"width:=
4.9062in;height:1.8645in" id=3D"Picture_x0020_1" src=3D"cid:image001.png@01=
D5994D.FF769270"><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">From the link I observed, &quot; https://github.c=
om/openbmc/meta-ami/pull/1&quot;,&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"text-indent:.5in"><i><span style=3D"back=
ground:silver;mso-highlight:silver">For the &quot;User not approved, see ad=
min, no CI&quot; part, @bradbishop&lt;https://github.com/bradbishop&gt; sho=
uld be creating you a gerrit group here soon so you and
 your team will be approved.</span><o:p></o:p></i></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Hence I am reaching out you, in this part. <o:p><=
/o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks &amp; Regards,<o:p></o:p></p>
<p class=3D"MsoPlainText">J. Agnes Amreetha<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><a name=3D"_____replyseparator"></a>-----Original=
 Message-----<br>
From: Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt; <br>
Sent: Tuesday, November 5, 2019 8:02 AM<br>
To: Agnes Amreetha Joseph Arulraj &lt;agnes.amree@hcl.com&gt;<br>
Cc: openbmc@lists.ozlabs.org; manager@lfprojects.org<br>
Subject: Re: HCL CLA Update</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; On Oct 28, 2019, at 12:56 PM, Agnes Amreetha=
 Joseph Arulraj &lt;<a href=3D"mailto:agnes.amree@hcl.com"><span style=3D"c=
olor:windowtext;text-decoration:none">agnes.amree@hcl.com</span></a>&gt; wr=
ote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Hi, <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; I have updated the below HCL CLA with my nam=
e&nbsp; (<a href=3D"mailto:agnes.amree@hcl.com"><span style=3D"color:window=
text;text-decoration:none">agnes.amree@hcl.com</span></a>), and attached th=
e same under the approval of my CLA manager (Dhanapal
 Subramaniam, ERS,HCLTech &lt;<a href=3D"mailto:dhanapals@hcl.com"><span st=
yle=3D"color:windowtext;text-decoration:none">dhanapals@hcl.com</span></a>&=
gt;).<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Hi Agnes.&nbsp; I uploaded this - you are all set=
.&nbsp; Thanks!<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-brad<o:p></o:p></p>
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

--_000_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_--

--_004_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=13615;
	creation-date="Tue, 12 Nov 2019 06:10:37 GMT";
	modification-date="Tue, 12 Nov 2019 06:10:37 GMT"
Content-ID: <image001.png@01D5994D.FF769270>
Content-Transfer-Encoding: base64

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

--_004_SG2PR04MB2876740BC6913B8AB5746397FC770SG2PR04MB2876apcp_--
