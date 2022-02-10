Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B24124B0DEF
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 13:53:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvcBK2r7Hz3bbS
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 23:53:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=9KzMrps7;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=9KzMrps7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=2a01:111:f400:fe07::61c;
 helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=gilbert.chen@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=9KzMrps7;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=9KzMrps7; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvc9q0P2Pz30MQ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 23:53:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmVOekoVvvOcB6cGXDxYqizbV67JA2UV6MI+0zBoFWc=;
 b=9KzMrps7/TnYUm/BHextD9czl7vOFywaGXDFhB7vY3paOQSgZ8+g0X6mcl6NfD8jjf/PnAx3IPxLikRjqew75WF99SIadDSHu+fNE+oGpTqMf7QoXbSMyTXuXEYYobcJ8aGzZZKw56+3lFGYGvJF090Z06Y2FgPYvX1LV+mNExM=
Received: from DB6PR07CA0056.eurprd07.prod.outlook.com (2603:10a6:6:2a::18) by
 VI1PR0802MB2624.eurprd08.prod.outlook.com (2603:10a6:800:ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 12:52:47 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::ed) by DB6PR07CA0056.outlook.office365.com
 (2603:10a6:6:2a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6 via Frontend
 Transport; Thu, 10 Feb 2022 12:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 12:52:45 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 10 Feb 2022 12:52:45 +0000
X-CR-MTA-TID: 64aa7808
Received: from 99e97346ef29.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 432BAC28-6E04-4F2E-A545-76BFE881EA95.1; 
 Thu, 10 Feb 2022 12:52:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99e97346ef29.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Feb 2022 12:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpJfIJ8N1eIzMxIZHUJ/aQh4ezWLtc45wC7QtSoagRaK6fsdbOhNEH1lNwfmR2vZp4Su/RUbwmd//6TlPYNKeCUrbS3s/CORXDIftysvO+gGDrUiJlkatPgUySy2bJxsiNmN+AGz+H1eTlieDRSoWE4XImd/QqcjuoQ29agQ/f+cl4vQeFQR+urhchHVI8iLnYpUsgtqnlkJNoiq2tmBlO2oOlLgCgx4KZSzeRnuz9FDXYgZkKEQA3g7GLzDRdWW5jdr3Jk69HbpXRzzG7npsmMNYnFSdKnJVuXxaA6Ha1uAdsTB4y5Uh0x7jwQyUK5TW6+GkBqU4UrL9mK2NPU0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmVOekoVvvOcB6cGXDxYqizbV67JA2UV6MI+0zBoFWc=;
 b=Nb53kNQKVVhoq9BHpIuY5yAwHFIIUmp0jzmYxdGGAtbMIjJzr/Nfxtg2dWkG3L8aDAvC2e0bY0SezRdTsk+q56ogkMKZbxBoAZvxPblBWeMAmsq+K7E2Nn/rgJRm2UEfrySJ5IrpyH5HGTZI3uieWbTl28J2yHRxp2XX0rvjx25g9Ae72NyLt2pbRUf37CLtKnVeIzny1LHhbQTROWlA9js3oGwXIH2Ol98uI2IZIqXcA6hb1bMs6Z61tWy+ZyUf4cResbaxbHfIHDTIP3NkqZt4KK/uFTkKRx3/RaL/QSxVwE+hDio/K0V+6sKwovvjH5bGbF2zGGtTqHrQwwi8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmVOekoVvvOcB6cGXDxYqizbV67JA2UV6MI+0zBoFWc=;
 b=9KzMrps7/TnYUm/BHextD9czl7vOFywaGXDFhB7vY3paOQSgZ8+g0X6mcl6NfD8jjf/PnAx3IPxLikRjqew75WF99SIadDSHu+fNE+oGpTqMf7QoXbSMyTXuXEYYobcJ8aGzZZKw56+3lFGYGvJF090Z06Y2FgPYvX1LV+mNExM=
Received: from PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 by AS8PR08MB6087.eurprd08.prod.outlook.com (2603:10a6:20b:29c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 12:52:36 +0000
Received: from PAXPR08MB6560.eurprd08.prod.outlook.com
 ([fe80::e535:68c7:ce64:ca0e]) by PAXPR08MB6560.eurprd08.prod.outlook.com
 ([fe80::e535:68c7:ce64:ca0e%5]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 12:52:36 +0000
From: Gilbert Chen <Gilbert.Chen@arm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: request to add Gilbert Chen to CLA repository ACL 
Thread-Topic: request to add Gilbert Chen to CLA repository ACL 
Thread-Index: AdgefHr+K+LPiKmjTIejIcfAs/OXJQ==
Date: Thu, 10 Feb 2022 12:52:36 +0000
Message-ID: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 0CFFE6DA2181C945BDC6F6C6112F6FFF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 82aabf2e-ca6b-4215-b325-08d9ec943c33
x-ms-traffictypediagnostic: AS8PR08MB6087:EE_|DB5EUR03FT042:EE_|VI1PR0802MB2624:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB262440ACA218F185830179D3862F9@VI1PR0802MB2624.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wjbSoJ4i+f+jdY7O1mcyJvrGCRcb6zZdAbS7v1t2Cn16ZShFKipRCH0i5h6q4Z5UASJK0Xo4AS3Xk8am8xruETOJLOHM+Q5ZG8seRmQ93JLaGUWRq1mmqwtds1tL98wE1Oo7FT79zB6Xy3Wqnj5GJtFk+KxSCsN4gb7tBII3CITIoPBvDhbOLRikMQxGyDEjSDdrbCxWOibMdAz3yWwmJatebh/wdUbmFN0W2Wy/bcuajZtO2hktzy+RLbqASnXFN3SeEdiB1hWUi8kAAF3/uid7Vt3yOnH9I1shxfc3wSn0LCL/4TTerSNwyHElU/hBjtcQ3aHRSxFmB3QIKPNrNrcPRxlnAS9z18SgX1zY8hSEdrIveJl7/EdNG+KOr5/jHlbb9PZq4JeKgWxR1NAc/HardNw2iL4q+iOfWGkE9E4cgxfqct4oxDXi+q2AeIBbcGpfTPo+I4pcW1egEFx71hDM3e9mc1jgtiLRN5EgKbKLpeWx+PqABh2kDbrfYIXrWW58HMZfBybxG+atxInbgZRg4eq3g8BI8BrqyCUJ2YdbVcVki4ICQpsoDS47meJWJ3mgtnwue9UmQAypHX5mdza2+SEkph3HjrcEhpQJpZ3qgg0ZppYsXDSguW7PxFuNjkvY5nCDCgM0UxJjEZ7Wk3MqVNFsFs6XY8DWeSLkcrtORxIgsOrXXhEO4FsVJ83p9yccpdrGdiZCeh7AHJfyp5RaigkfKuwuzp07JlqFWIuh3DxHdJ6IKLkXcsFi/ns0+GLH2wvdjpDT+VW9qeA18MS8L1MJvR4j+man9JmL32k=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR08MB6560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(84040400005)(38070700005)(83380400001)(76116006)(8676002)(508600001)(2906002)(66476007)(64756008)(66446008)(66946007)(66556008)(8936002)(86362001)(966005)(9686003)(4743002)(52536014)(71200400001)(9326002)(33656002)(6506007)(4744005)(122000001)(166002)(186003)(5660300002)(6916009)(55016003)(38100700002)(7696005)(316002);
 DIR:OUT; SFP:1101; 
Content-Type: multipart/alternative;
 boundary="_000_PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9PAXPR08MB6560eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6087
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ada62f35-674d-4b0d-80af-08d9ec9436be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhfgC2lh3XL6OqPhUdLnSstRrWXflJm6/A39kPjVIL6ToHHoTuJzNU1N+KgCzseX2C5YOT6TRcUQI82fKv4wgMnhiYJYTa48/JcIwQzA3ftADXz2ZByTQ62IbBLV3cG6eRKM0k/QhQTgPYYUdOZechDzBmaVs7jmUrDqC7GeOUztKOVqsZEU8rMNOCuF9uao5LBKSwpiuXzzAn/8IOrZaA6J53AeaBZGD2BZJybTh8ySKJou6QmhxOEDvgdUJE1PgK6nNahz9uXz6CECwfIV5U6g1QAulNn7NS4SBjszTZueyDGgjtNRJdOjrGAoc0gvJ1g1wDUZ/1j7rwp9flGZfIfyQcmfJuGzFsJxDbZ3CW3qjOJwYSsz2me3BX2A4SFDfet3HhZQIVOfM+8ROYOIRKf+KzFVds9iC59MemFmrqTT/XgkjJy+3hJGOVKyATX2SD5gyBjLpJC+mqfklq9F0An/covkpygNgUknzBeW54+fTbjj4xaAOwxfLebVAjRmxXaxM2lGkcClpHqLRTE5hcgOi4FMtQQVsmVwqCimApZhziEd4lPfqqyKXn8b0AH1fEqE33+iwIZ8alRfHXaDPvJX7Wu/fcD1EJSmXibFK6eGKefYg5TT6LgsAW1KSrBT1naH2VpYvI3V78933f3AraYVdOiQ4bCl366nZtrhxPO69Gjcfv1mNv5zFOzGR7UoMJ6t+ygU7msHzRVKh2pK6OKtp92mqsNNN3vXyV40WzTOPxMz0ITbYC0KEpVyGCJXmiSVyUBywF+ZRHQ6Dpmt3w==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230001)(4636009)(84040400005)(40470700004)(36840700001)(46966006)(9326002)(26005)(6506007)(316002)(52536014)(6916009)(5660300002)(7696005)(9686003)(33656002)(86362001)(966005)(2906002)(4743002)(186003)(40460700003)(508600001)(336012)(36860700001)(8676002)(70206006)(356005)(70586007)(55016003)(81166007)(8936002)(83380400001)(166002)(47076005)(82310400004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 12:52:45.8897 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aabf2e-ca6b-4215-b325-08d9ec943c33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2624
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

--_000_PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9PAXPR08MB6560eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Can you help add me to appropriate CLA repository ACL since I want to submi=
t code changes to gerrit but the gerrit shows "OpenBMC CI - User not approv=
ed, see admin, no CI".

I have been added in ARM CCLA. https://drive.google.com/file/d/1i0SkfLvR9_l=
oRTZ0zZmC6L_sDOZyQjZB/view

Thanks,
Gilbert

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9PAXPR08MB6560eurp_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you help add me to appropriate CLA repository AC=
L since I want to submit code changes to gerrit but the gerrit shows &#8220=
;OpenBMC CI &#8211; User not approved, see admin, no CI&#8221;.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have been added in ARM CCLA. <a href=3D"https://dr=
ive.google.com/file/d/1i0SkfLvR9_loRTZ0zZmC6L_sDOZyQjZB/view">
https://drive.google.com/file/d/1i0SkfLvR9_loRTZ0zZmC6L_sDOZyQjZB/view</a><=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Gilbert<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292F;background:white">&nbsp;</span><o:p><=
/o:p></p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9PAXPR08MB6560eurp_--
