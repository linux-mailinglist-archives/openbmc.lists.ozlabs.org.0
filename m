Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B212AB0FC
	for <lists+openbmc@lfdr.de>; Mon,  9 Nov 2020 06:46:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CV0Nw2QH4zDqlK
	for <lists+openbmc@lfdr.de>; Mon,  9 Nov 2020 16:46:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febe::71b;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=IiIKIcCu; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=IiIKIcCu; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::71b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CV0Mw22QNzDqPn
 for <openbmc@lists.ozlabs.org>; Mon,  9 Nov 2020 16:45:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wePSUlJV6zxOufa7vyKBPCjl3yVGeFI74Lw4WbMG4w=;
 b=IiIKIcCu6jpJJcwdEtaZidTU+Y8eyg2x7nCKj0lsAD2c/O5wqnQpvA5pXX1Pk6hObUST+r0EEf5vqqIH43pvhUsNHqlBXoimQe2Xi2HbhekGIF6FGziYKIZ7UOcx4/XqGPprI7Nor4PoEBWvIGOyMRED7M4BV0O8cNi97pXySVM=
Received: from SG2PR02CA0081.apcprd02.prod.outlook.com (2603:1096:4:90::21) by
 HK2PR0401MB1956.apcprd04.prod.outlook.com (2603:1096:202:b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Mon, 9 Nov
 2020 05:45:27 +0000
Received: from SG2APC01FT014.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:90:cafe::3d) by SG2PR02CA0081.outlook.office365.com
 (2603:1096:4:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 05:45:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT014.mail.protection.outlook.com (10.152.250.188) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.18 via Frontend Transport; Mon, 9 Nov 2020 05:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J13zfRL6ksfCmjClb0IG6OmJgvBAzWKdexUQmuYO2HVigCqzcocaT2M+l8BxWXlvFEis9cYx4kUfBGgwnBGuGvx6nkzs8GUVKjSEKb8BNXtFKSnRKPTyeheCG5qE/WeyZpqJBxYvB7mlaQOAJpOGrDsEqUpkVco/uImVB56bCb6lLElpFmfGdrpOrXSUjmM6Ypm2g6SZpiGU4uK4wGyl4IpjeoyI2BhWh7O1MC97rn5+9JN/8KIgHHAPPQVoOucrwro/ee7QJB+hdNbgBD7hqQn6vwUy5zeC3zOOkSnxQB98vLTA6jm6iuGmKRfvwJIM+E/LrVYPAv5sKiA9g1jRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wePSUlJV6zxOufa7vyKBPCjl3yVGeFI74Lw4WbMG4w=;
 b=SnqYaWh8migzYxIjjmSfc2rizkuv7Zuog/H4do+LhWKj/r350BKpIB1hWA3yF1TeZMht4DcHPIOs9VtYzxENB+8q6mkaTSOlZdLeMEM36gSMy1gicO7hwbJ6qB5fR5y8cZyqHWDMxBqkiXkpaYsbdVVbcz139Tl+8pdmiIQlus9Tv7uKi5Rq9sgi10xJW/KGvdVNG1JJSxTBYHEFI7OluiHS/eH8NyC1Pb1Sz+4Mi8S+SWTTwngYX8pro0OZ0Wm3QaxcB9Zq78YM7PgN+1JkBKrTPCvqcmheC4yK1kU3hGQ0WSEiGa0PnsgCZHADsycipwCVddFCZe+PmEaV4UjMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wePSUlJV6zxOufa7vyKBPCjl3yVGeFI74Lw4WbMG4w=;
 b=IiIKIcCu6jpJJcwdEtaZidTU+Y8eyg2x7nCKj0lsAD2c/O5wqnQpvA5pXX1Pk6hObUST+r0EEf5vqqIH43pvhUsNHqlBXoimQe2Xi2HbhekGIF6FGziYKIZ7UOcx4/XqGPprI7Nor4PoEBWvIGOyMRED7M4BV0O8cNi97pXySVM=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB2451.apcprd04.prod.outlook.com (2603:1096:203:47::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 05:45:22 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%6]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 05:45:21 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Queries in phosphor-pid-control(swampd)
Thread-Topic: Queries in phosphor-pid-control(swampd)
Thread-Index: Adazbf3YeT9VL1BqQCaDxpW9/aG0cAC6+Okg
Date: Mon, 9 Nov 2020 05:45:21 +0000
Message-ID: <HK0PR04MB2964F20CBEB3B4A5F97806DAFDEA0@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB29646B09A78169E38B903C6CFDEE0@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29646B09A78169E38B903C6CFDEE0@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZWFiMzU1MjQtMTFjOC00M2U1LWE3M2MtYzEyZGU1N2RjZDE4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR1EzYklrZ1A1UFNlZnNpek9FWWJjVEZ2VDVkRDBsUGdmYng2Qm1GSTJINmkyQWlDckNuM0J4UnUyWmpJT3VlMiJ9
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.51.109.145]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 12995cbf-75a9-47bb-1764-08d88472a8c9
x-ms-traffictypediagnostic: HK0PR04MB2451:|HK2PR0401MB1956:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0401MB195655FFAD033DF661AA0091FDEA0@HK2PR0401MB1956.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nsyfjFLPhoMpQ2DMVjl0sAVDJgQHYNv9E0PRlsxMW3VK+jk1WqPMnwxoaT7M6lXfyIb3X0zIPY0cJhOk91Osc/M8t0vndKs6/V57LUxhU3iTjFGHSwNZDfoWNg39uUKsIiabAO3T1a56CbD/72DlupCjLsh8cy9YZ8+/3azj081Edp3qA7GGuaK0/wJjAFle6Kuyrd+dn5MTkTEpy7Yt/EsQohSF71e4i6oJDyR6ujiwSElq/VyIl05UWrhA38+A3kbBZrqJNqUFC+3eCa/LfkrS2zTVbKby49oWNPNxJQyoceNHkeCOOIkaV/dDLpzsugoulj4A9H3thbmBEF94tw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(6916009)(478600001)(54906003)(316002)(9686003)(55016002)(8936002)(83380400001)(186003)(26005)(4326008)(6506007)(2906002)(7696005)(86362001)(53546011)(66446008)(66556008)(64756008)(33656002)(66476007)(71200400001)(5660300002)(52536014)(76116006)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZeCPq1kLCaRv2KHNiV81Esd4ASUhPq+CgGHrgS2gyO0WJpsYEngrMQ/xhqW4P+BTJ2w+BDD21AQloJ0niUmuYijf2dIEwTI700YRbeRO7N0IwJ+FOVcCES05YNVnvgqqYxOFFvx1+6lzODQrnxyoIXTYyG3OHoNAU6aTJMIYTk0OZZMuSxfKoXdORc9WR3rpt9t0QgKWZz5nlA/uC+07u51TM0vVSS+FZIzQWUhXm3LKlTHaRmElH72IeYw+RS+C6o/gA7YrOF/kTN3bOHt/G2grU6LMXbHsFvh6eis/lgoDENhFSiuGk/2hdCnpB5ctXcgLKwslXSR76/tP9N+yAiCs/8n1JKcHV1fpNhIM9DdVzFyUqE/3DIlqpPm3QMvqZoWFacrzozPs8amWZGF/jpu9i4I7jlH1kudMovg62JTyNezqCeWRJGGzpu57CmMSnUX2KkgGA8uj6G3/VuXffH4VBHfaCnJjHXu9wrBpTVglC7JJSrtsGuLUB2/zGhaipjzDlX6z87c5L9SgEGMtof+MM/tEdgxyQlYq9AHaJOoyZl1qgQubmt3XRfL+zCjOfK9ywNyvmLLm3Ha+fQbbbFsgR3poOGe4q2NBpQXSPRKtjHDEmv5x0kfVGb0fEV+4rR1drzaUWYigIb/0ngdKBg==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964F20CBEB3B4A5F97806DAFDEA0HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2451
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT014.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: da26c6b4-daab-4433-ca1f-08d88472a5f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNBuy94sRd21FCBcDmx/ltBwH4WfNlSmCtPsIiqfF0FDBEhhvyVneSi6KdhThtZtM1dii7rZBgR39maSswGdp+Va0Qa9CUWJwt7rWxIIO0Ow6zcL2kvUcfwwM01HA0qwSVTIYFwQnUi9dX67OZKxwskEpnQdfw5p+7+gzgM3XBqI1N0aWfuaYp7VuiNwVA567y5CWj9OLinqRgD1hCz21UB2dHVaS0HJerymFiyOCDvgJr0IxoxeiylabshMKNVI5wn9KsCcaxvLhMe+mEe/hQYcxOhIZAmvX0aQswumu1yyB4UwHAVAULyn4/4dyuBouMa0xukruB+Cyb2ZmIHpZs8VTzZDT7I//j/RTp5A8+7QM7/Gr5D3WJrG63fSRCdehmgB1Vt1fBDo7SkIo75MaQ==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(5660300002)(70586007)(70206006)(478600001)(6916009)(81166007)(186003)(26005)(8676002)(356005)(2906002)(8936002)(54906003)(9686003)(55016002)(86362001)(336012)(83380400001)(4326008)(7696005)(82310400003)(316002)(36906005)(47076004)(82740400003)(33656002)(6506007)(52536014)(53546011);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 05:45:25.6918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12995cbf-75a9-47bb-1764-08d88472a8c9
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT014.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB1956
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
Cc: Patrick Venture <venture@google.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Josh Lehan <krellan@google.com>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964F20CBEB3B4A5F97806DAFDEA0HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi All,

      Gentle Remainder !

       Could you please provide your inputs on this.

Thanks,
Kumar.

From: Kumar Thangavel
Sent: Thursday, November 5, 2020 5:52 PM
To: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>; Josh Lehan <krellan@google.com>; =
Velumani T-ERS,HCLTech <velumanit@hcl.com>; Vijay Khemka <vijaykhemka@fb.co=
m>; Patrick Williams <patrickw3@fb.com>; sdasari@fb.com
Subject: Queries in phosphor-pid-control(swampd)

Classification: Internal
Hi All,

      Does the current phosphor-pid-control handled the fan failures or if =
fan values is 0 ?  Looks like, it ignores the fan values is 0 case.
      Could you please clarify me, how the fan(single/both) failures handle=
d. if both fan failures, Do we need to power off the chassis or need to do =
power sled cycle ?

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

--_000_HK0PR04MB2964F20CBEB3B4A5F97806DAFDEA0HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi All,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;Gentle Remainder !<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Could you please provide your inputs on this.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Kumar.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Kum=
ar Thangavel
<br>
<b>Sent:</b> Thursday, November 5, 2020 5:52 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Patrick Venture &lt;venture@google.com&gt;; Josh Lehan &lt;krell=
an@google.com&gt;; Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;; Vijay =
Khemka &lt;vijaykhemka@fb.com&gt;; Patrick Williams &lt;patrickw3@fb.com&gt=
;; sdasari@fb.com<br>
<b>Subject:</b> Queries in phosphor-pid-control(swampd)<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Does the current phos=
phor-pid-control handled the fan failures or if fan values is 0 ?&nbsp; Loo=
ks like, it ignores the fan values is 0 case.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Could you please=
 clarify me, how the fan(single/both) failures handled. if both fan failure=
s, Do we need to power off the chassis or need to do power sled cycle ?<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
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

--_000_HK0PR04MB2964F20CBEB3B4A5F97806DAFDEA0HK0PR04MB2964apcp_--
