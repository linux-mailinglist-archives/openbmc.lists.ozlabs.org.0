Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F7FFD69
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 04:43:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GZZ22RWvzDqZS
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 14:43:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.109; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.b="Qm4F/RM/"; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.b="Qm4F/RM/"; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300109.outbound.protection.outlook.com [40.107.130.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DtML2CdBzF78m
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 20:28:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SqAbkqiKQ/Wncc3VHQfcJDrERXf0VCeU7LmMV720eE=;
 b=Qm4F/RM/seGjcvmdrepCuT+ZmXV/VptN+wAolF05wtYWnXjEQZR8ixk7eQy1rx3dvPkcZT/HAiAGNqaV35ExCXFkc0Sm69IpzmISVTmxeLUqY0Ik09JRVsJIuuIZ4ZKyAOEqB+3OdDH1cpLeO8TWohCmZ01iMVEDRRceO8LqUOI=
Received: from PS1PR0401CA0045.apcprd04.prod.outlook.com (2603:1096:803::13)
 by HK2PR04MB3809.apcprd04.prod.outlook.com (2603:1096:202:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.24; Fri, 15 Nov
 2019 09:28:35 +0000
Received: from SG2APC01FT044.eop-APC01.prod.protection.outlook.com
 (2a01:111:f400:7ebe::209) by PS1PR0401CA0045.outlook.office365.com
 (2603:1096:803::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 09:28:35 +0000
Authentication-Results: spf=fail (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Fail (protection.outlook.com: domain of hcl.com does not
 designate 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 SG2APC01FT044.mail.protection.outlook.com (10.152.250.239) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 09:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+Af/jvr+AAbVMxVwkKcp9w4nnkc30KjbOnOozsu5dt2HMYowGYw5t4kXcdawTcwEY2i2+UguiRZHmjTqSy7z2yIZUaSoPiadLOuRKKbhduEDrDwT+ayowvkEa/oiGODFOxvdOZACG2lwBGKA4M90roeeGfTJtkqww3tXKwLE3AsUNMf5bgRbcS5zAtC2wc/fvNlJzaLtbqAeghpm/3bsJ88erzkVIWSa+ks+T6RKFOgq3ZKCN4xEXsH3/nYzjnewK7tQ0wwMa4jyUnWdtxXRhGxC4sQNFYWITzGi1LlbhNcVSg/y1sKQgAOSXUpMd24e561ImcAb7EdhOo9/zdN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SqAbkqiKQ/Wncc3VHQfcJDrERXf0VCeU7LmMV720eE=;
 b=jEHSzH0nTBo/sdTxQZGQ+e1eQojc6v9mN5fSR+iJQLyTrjwC5/dENgxFND8xkVfsbYrWnI1AjqQ7GM5BZ6IN/aBVqIBELKV3Zw6+AxqcHz6fWM9mb3Bu5Z4p3GXMHlEBRAWy2fx58hdegqXFiKzECU4uMohdn9BF203PFWKhgZ7ZP9lO/0pcrzcCc7JHL/s/fknizi2vNgz1Duef9awZ8pFzCjR18KOIeqqSrFe9XFwEaUN0TAf3GEM6JaHa2hkurb/89gNSmtvMr8G/LwSPUHGoNZ3l8NoH4plBfn9/V+5rXVeYLgTlH99SJ7Tzes1N7unsVV2s7O1eAX+TeN22eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SqAbkqiKQ/Wncc3VHQfcJDrERXf0VCeU7LmMV720eE=;
 b=Qm4F/RM/seGjcvmdrepCuT+ZmXV/VptN+wAolF05wtYWnXjEQZR8ixk7eQy1rx3dvPkcZT/HAiAGNqaV35ExCXFkc0Sm69IpzmISVTmxeLUqY0Ik09JRVsJIuuIZ4ZKyAOEqB+3OdDH1cpLeO8TWohCmZ01iMVEDRRceO8LqUOI=
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com (20.177.93.17) by
 SG2PR04MB3898.apcprd04.prod.outlook.com (20.178.157.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Fri, 15 Nov 2019 09:28:31 +0000
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::a969:7c1d:ae9b:2241]) by SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::a969:7c1d:ae9b:2241%7]) with mapi id 15.20.2430.029; Fri, 15 Nov 2019
 09:28:31 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Fan speed controller validation
Thread-Topic: Fan speed controller validation
Thread-Index: AQHVm4PVD//5NU7LKUOru6b/45uBDw==
Date: Fri, 15 Nov 2019 09:28:31 +0000
Message-ID: <SG2PR04MB30294FA650F268F9E273B8FAFD700@SG2PR04MB3029.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMGYyMTU3ZjMtZjk0My00M2E0LWI3NTgtMjU3ODYxOTkwODU2IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InJjQjRCQlh3UVoraWQ1MXo0eDFOemc0UWRpck1heEVlQ0NKK1l3YWJtOUJEWGtpK3Jqbld3VHhWZGdWWWRZQTAifQ==
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=thangavel.k@hcl.com; 
x-originating-ip: [192.8.254.10]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8e27f069-80c0-46fd-12b9-08d769ae3029
X-MS-TrafficTypeDiagnostic: SG2PR04MB3898:|HK2PR04MB3809:
X-Microsoft-Antispam-PRVS: <HK2PR04MB38099DFF9F426E7DDE62C46CFD700@HK2PR04MB3809.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6430;
x-forefront-prvs: 02229A4115
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(38564003)(53754006)(199004)(189003)(790700001)(3846002)(7696005)(2351001)(74316002)(8936002)(54896002)(6306002)(55016002)(9326002)(86362001)(9686003)(6506007)(6916009)(7736002)(2501003)(71200400001)(6436002)(102836004)(5640700003)(256004)(14444005)(5024004)(71190400001)(2906002)(76116006)(66066001)(486006)(6116002)(33656002)(186003)(26005)(3480700005)(316002)(81156014)(25786009)(66476007)(64756008)(66556008)(66946007)(66616009)(99286004)(66446008)(52536014)(8676002)(478600001)(476003)(14454004)(5660300002)(1730700003)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3898;
 H:SG2PR04MB3029.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3f3NOBdRNrmnXVsKZSIEsvrA+ul19K51MZs8ze70JjSEVebChSJDDOfuhSTV21mcCojv7/lu9uoIqFWX+SfMXxHVfQW0t+3inMFMnlKaPC9zfgbV24egvNpLGhep1f8slBhTMIYbAznGD4WhJCEvvxBbveZUY2vlScLdJ6+YNcRTLKTUhFpstCKd63sbH1d3+MBx2k8kx4AyNW68qDTTKPGud2fxfUevCpJcYTWTkrTvbo+mdNEiXSz5BBlkuycGYXn2mBuYRSUCdW1n2FVzzoW2cUJRXFOt3T3HgZ4grqsieFJQkhZjIstkTl6Pr0A55aPtJlkKbRrHCsUZ3CVWK9GDcvy78u9YHGWp+9WFmvobsES1a4CDGYwqAsZ9k7b5DIhCmWcke+4RPUZYdWLwk53V9vBWKjy93eToJbsiHM5lGdhXJo+gt5fjkNQPxCkS
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3898
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT044.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.59; IPV:CAL; CTRY:IN; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(376002)(136003)(396003)(39860400002)(1110001)(339900001)(38564003)(199004)(189003)(53754006)(2501003)(36906005)(476003)(86362001)(7696005)(99286004)(16586007)(316002)(2906002)(186003)(478600001)(568964002)(3846002)(6116002)(790700001)(2476003)(126002)(486006)(105606002)(66066001)(52536014)(2351001)(33656002)(26826003)(26005)(6506007)(102836004)(14454004)(21480400003)(70206006)(70586007)(25786009)(336012)(71190400001)(55016002)(14444005)(356004)(6436002)(54896002)(3480700005)(66616009)(5024004)(6306002)(76130400001)(9686003)(5660300002)(74316002)(235185007)(7736002)(6916009)(9326002)(81166006)(81156014)(1730700003)(8676002)(5640700003)(8936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK2PR04MB3809;
 H:APC01-SG2-obe.outbound.protection.outlook.com; FPR:; SPF:Fail; LANG:en;
 PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c5e8f862-2491-4213-36f5-08d769ae2df8
X-Forefront-PRVS: 02229A4115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nVL0iERO4bkgx2hddkf65UyHJgCCuKj/wYHY2Vu+rAvbTTt2drXIe/O+SQIKDlTMx6MC2rjwDjCt7seXYmjxWg6syS9ioJ7OCq/Tzeru1kStMs4m+zUQS6xB22u3w1wG7U5Y5jMOxIOM38tvuARUhTkgg7XLOMdU7G4CIrAo/OjFqLzYRCZtIBXrUscF/zecX9RSvtBmXBE+oG8UReD0l3JbMeDWRW27QbhMSNe7hc1Yp0Hr1OlzYz8inQL7cEdvix1izcX/55cd/82c9y88fw+Q2AVlfWl+neZwVs3OYb+bOp8YDSMXRFHgM1i0ss38YfTpGh2ZmUc/39GmK1BQop3J6NNjn6gssXS+hRH9h0APbthxxLDswPadqUV55lgN30nFdVYOi5gf2kE9c/+tzOP9UzROJAiwEfrHhh7CrWhR9MEXZLLzkKTQUEeUTqck
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 09:28:34.4114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e27f069-80c0-46fd-12b9-08d769ae3029
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3809
X-Mailman-Approved-At: Mon, 18 Nov 2019 14:39:07 +1100
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

--_004_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_
Content-Type: multipart/alternative;
	boundary="_000_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_"

--_000_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Our product have Inlet temperature sensor and  two Fan with TACHO sensor fe=
edback connected through Fan speed controller to BMC SoC.
We can able to read temperature sensor and control the Fan (PWM) through D-=
Bus interface.
All product specific configuration declared as JSON configuration file in E=
ntity-Manager .
What is the procedure to  test  Fan Speed Controller(FSC)  based on STEP an=
d PID based algorithm.

Please find the attached FanSensor dbus logs for your reference.

Thanks,
Kumar.








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

--_000_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_
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
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Hi All,=
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">Our product have Inlet te=
mperature sensor and &nbsp;two Fan with TACHO sensor feedback connected thr=
ough Fan speed controller to BMC SoC.
<o:p></o:p></p>
<p class=3D"MsoNormal">We can able to read temperature sensor and control t=
he Fan (PWM) through D-Bus interface.<o:p></o:p></p>
<p class=3D"MsoNormal">All product specific configuration declared as JSON =
configuration file in Entity-Manager .
<o:p></o:p></p>
<p class=3D"MsoNormal">What is the procedure to &nbsp;test &nbsp;Fan Speed =
Controller(FSC) &nbsp;based on STEP and PID based algorithm.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Please =
find the attached FanSensor dbus logs for your reference.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thanks,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Kumar.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
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

--_000_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_--

--_004_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_
Content-Type: text/plain; name="fansensor_nodes.txt"
Content-Description: fansensor_nodes.txt
Content-Disposition: attachment; filename="fansensor_nodes.txt"; size=655;
	creation-date="Fri, 15 Nov 2019 09:00:01 GMT";
	modification-date="Fri, 15 Nov 2019 09:00:01 GMT"
Content-Transfer-Encoding: base64

cm9vdEB5b3NlbWl0ZXYyOn4jIGJ1c2N0bCB0cmVlIHh5ei5vcGVuYm1jX3Byb2plY3QuRmFuU2Vu
c29yIC0tbm8tcGFnZXINCmAtL3h5eg0KICBgLS94eXovb3BlbmJtY19wcm9qZWN0DQogICAgfC0v
eHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sDQogICAgfCBgLS94eXovb3BlbmJtY19wcm9qZWN0
L2NvbnRyb2wvZmFucHdtDQogICAgfCAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvY29udHJvbC9m
YW5wd20vUHdtXzENCiAgICB8ICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL2ZhbnB3
bS9Qd21fMg0KICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycw0KICAgICAgfC0veHl6
L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zhbl9wd20NCiAgICAgIHwgfC0veHl6L29wZW5ibWNf
cHJvamVjdC9zZW5zb3JzL2Zhbl9wd20vUHdtXzENCiAgICAgIHwgYC0veHl6L29wZW5ibWNfcHJv
amVjdC9zZW5zb3JzL2Zhbl9wd20vUHdtXzINCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qv
c2Vuc29ycy9mYW5fdGFjaA0KICAgICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMv
ZmFuX3RhY2gvU1BfRkFOMF9UQUNIDQogICAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vu
c29ycy9mYW5fdGFjaC9TUF9GQU4xX1RBQ0gNCg==

--_004_SG2PR04MB30294FA650F268F9E273B8FAFD700SG2PR04MB3029apcp_--
