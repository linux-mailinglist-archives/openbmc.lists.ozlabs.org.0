Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173E83FC62
	for <lists+openbmc@lfdr.de>; Mon, 29 Jan 2024 03:57:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VBgc/aAT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNXyP24Dcz3c2K
	for <lists+openbmc@lfdr.de>; Mon, 29 Jan 2024 13:57:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=VBgc/aAT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNXxp70LNz3bWQ
	for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2024 13:56:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdozU/UBMrti6WuavZangZuXXIo6ImAtKTZtwnLSFlu0RWLWjeWrgGu0rybLHVG0aXVCFO4UHXeeRjGtTDDC9CvvDw7r7KzCizSLUtZ+gdD73q4GfO0XMHO7sp+I1CVBaZSlcuyYFam9HcGepkhX40QfRAElilURA+I5dOrOe+ANdnnG09iJyw+WPeaB6CzSrthGy1gm3XHvxc91juFa57LYjDRrmVSlrerOisa60Ofb1Fy6WvIlHzMH8JY7NRe7hRk4bTko4e62YdyLjZomfbFM2gS1IcCodQxAo2SkXpTjojzEI1pYN+ZMOClT1bfnl1MsSiu52Y1KyVS3YDA91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ymG2JXBPU4PlIHAozjWbQVfw9wr8eEFlZhIXC3gX6s=;
 b=i0an6fQ79xo06ixo8H+PAGeAAD4VtYs8A+kYKhCu6sxR4bYjldt2JKdG1OoFonuRRmtiboEi0WfkO8ePapoI/5RAlqPBqttXYBGQ04BwVOYBZGT6eta5RRZkdz1LHKgo/EY62krHRTq2J0tF/8RBToChCnbZ14jQzT4uVh2eBNWu8Ej3pzJfIqieC9uboRwlwfUiZLMkjmROhXWoOjBf8m8egIK/XVR+QNg3vmgtiXZWUMHSchsVAsz3vxH1hxlTGPD3hwu5tOk2zqT9pVNZSYoP8OJ188Y36dppyqJyjxEIj/e88vd4qo0JGzplEIz5BTJkP9pKImgBBEii9HWf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ymG2JXBPU4PlIHAozjWbQVfw9wr8eEFlZhIXC3gX6s=;
 b=VBgc/aATlaA/jRugmtQx6eyuJs3GwxMLex/NKAXEB8Q7FHDR+cqSQFel4/vKp5AmF508HXZ7AvznlkStIh5/kRFgp+OmTsuoL/2R0P4nNQGVAMiMNvw0h+08i9iGh+xtTyCXrXg1U8eBuq8kuyZVsD9BMnvPJeLzcTYZz0xirSfncskcpjhMj8AkuuEBEKvkRn7T9fCiqEmYcNfJkAeSHELGGov1/72AK97TqkxADPqdc87CYpKL5RtE9yB2aWsfpV5te7noZGicdKN6agWNUg2CMQhF+t7vU9sUMmBKzdI8hrsllXYXbwuFAMJgAG6GzNrOJ1+NqSp5Nsdw9udszQ==
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com (2603:1096:301:69::12)
 by TYZPR04MB8584.apcprd04.prod.outlook.com (2603:1096:405:d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Mon, 29 Jan
 2024 02:56:08 +0000
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::bd3a:4e71:45c1:965b]) by PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::bd3a:4e71:45c1:965b%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 02:56:08 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, openbmc_compute <openbmc_compute@meta.com>
Subject: An issue about the architecture of pldmd when implementing Set/Get
 Boot Order for YV4 platform
Thread-Topic: An issue about the architecture of pldmd when implementing
 Set/Get Boot Order for YV4 platform
Thread-Index: AdpSXJYp8cTsOCVuRgW5fQV/iMLa0Q==
Date: Mon, 29 Jan 2024 02:56:08 +0000
Message-ID:  <PSAPR04MB4598EBB5B5AD6109855C0D9BA57E2@PSAPR04MB4598.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR04MB4598:EE_|TYZPR04MB8584:EE_
x-ms-office365-filtering-correlation-id: d892b004-bd7b-4ddf-3148-08dc2075d7d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Sunf23GIc9H9xeeRDV0UU4nmeNOXMeDgkAi2rGZY+dzXWTJfBhotBAsxMNCkAYlqkdgupZKxf8mQlHQCU1gRdC31t3EiYSW4HRfjuJljgdO1jorGnkWKLlQbRMess1/c/CLT+LkFS0yNY0j3x67ufi17dTNSLZuFBG+rxRX7atFjzzgm3SBCF4X23ZqFZ8mV5BcbKXqJcIfbayv6oif3EdE6K/js93y7e1XJibnweF519OumZ9nbVuJCWApW4lF98UkBRahqo0bjlgIzMlLAuBiSZwmyP1r0BSZulCnhYmabWZLjRQWniGqXIvMXKRLdJrwDcajaPukvUX1oQcCUsH7D4UFzPtZcx+sjHm79rrnpgKsJx6ocpZyFdYsq2m99G+9IEKGtyeelDLJqJ6j13+oJNHkaaRulvH3sbfKbbgm0ys5p0fkvw1OUWWHQjlHGc0ZBK/Hp8Uk2rY51rfbBOc6g+zBObydgvXTHwXkmrb2pTNZtNc/Q7qXuxOGy6U8tjN2ZKR4DkS1kuoAm/BDiooEwJcMMIG8lYXa5Dmr7i1m+qV6rdmMNPyUIwpAOdw2Wdh2LSm7JZ7UMgU1AmTV/d4T4YLT4s6WSnXlcfAmcyQU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR04MB4598.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39850400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(316002)(83380400001)(64756008)(110136005)(76116006)(66446008)(66946007)(66556008)(86362001)(66476007)(478600001)(71200400001)(38100700002)(166002)(107886003)(9686003)(7696005)(55016003)(8676002)(8936002)(6506007)(52536014)(122000001)(4326008)(33656002)(5660300002)(2906002)(41300700001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?lfgDxJpudM7aa1Qn5d/8z7QT8Pa47du/L/bvpzZ9kUxtRNpG4ZyY20dnYnyU?=
 =?us-ascii?Q?ThSa2iyHX99NVt9e17PVk7jhUKG/9dnbqNCZcQaFh7M9jcBEbs/yOgFra8JN?=
 =?us-ascii?Q?pUvrX6D18uhytuEZ+nESoW+/fCJ9/i308gJYeaE03PQw0sgza0UkQw1ZkJSJ?=
 =?us-ascii?Q?i51kRFSM3t0tpJl1D34NAlGaUsMPi+Co9h0VfrvTbH/ppKxgHcQsYmNeRfoP?=
 =?us-ascii?Q?QpwLtwsUAhp2FqHn8v9kUo0WooqOfRmlx8wiLGtWTFWSyBpIjaK1ljyzG2uR?=
 =?us-ascii?Q?686dllk7oHWZMQgUieDOkwO1CfTNiDtS0q53mbxAyWAIUjFmNElcatwoA+Gx?=
 =?us-ascii?Q?wKu5AwebSaDF2B6dWiFUyn3EUeWzB+aijTPwTVzqGT2eD1WF3Np0EgfulKYR?=
 =?us-ascii?Q?7MragN4Gan/o1ITprJpZAcbsgqwNit5Lid70ia7glPyUe7iY+NFSIZXLp1i3?=
 =?us-ascii?Q?Mdyw+zN108Ucx//FLLlgZHU1dSQoNtO64jDwNEWv0nGirKtk1U2+QDsEKJbC?=
 =?us-ascii?Q?Z1mN+VVCTjweac/3xGdYpKdg8TrlxuD/XFpaxzUbjUQ3fvfsUPut6MpPw6R2?=
 =?us-ascii?Q?Qp1ClconcQ/iTUbi8E6uAtK1E1Myh7ZXV70AGsLJi0ZuDXbduBiduYKX++99?=
 =?us-ascii?Q?Cx/HOBWTqRY6DdoMKMQFMABIo2VOPmoeEt+Q+3R6LMbGh8QUU+tAXJnI0p+P?=
 =?us-ascii?Q?2DSqpCceOfxUg1DETVb+sv3REMjS1aGAIXFs+R7HrNwceUJ1w0fhwkSBcNPp?=
 =?us-ascii?Q?7qMa77dYDyco/xuYvAr93qeF94eD7VC+QXbf89FuT7qLreJYwXBM4uJTDfTZ?=
 =?us-ascii?Q?TPrZBFtzHXJxAUVfvElZk60n3qnOeir9Pm2YRepb+gT25oxhTUUaeoX0LSSy?=
 =?us-ascii?Q?82JdHJsxTpHzorctuaUMLOLiPOGoU+Uvo9R+YdxtYzniDMp9oIutsA49IUmk?=
 =?us-ascii?Q?4D5AwPTSgaaa8E8U+1pjqz28EXMsjL2jKVqmtCK/uZxDkwYBmiPxUR2A/ufx?=
 =?us-ascii?Q?B3AkOFaDYLr0OetgO/WvEHBvPv60s3Tamjqd1om+A1y/56BYjtbXEekFUtrj?=
 =?us-ascii?Q?nqQ6RCPntgRtbg9LsW8+7bLz5NMhMpPzRwbAAJxdSOw7Jrhy95XeFb/m13KG?=
 =?us-ascii?Q?HB9Qvul+VSOK9fgvr+lUscP9PJJiq3NPp0JGPmw4ulRaVCm26q25GR9dcChq?=
 =?us-ascii?Q?C0DbgUSJ9GqpgUWZwzDSeY2OKYSJ0WhDwshlhFP7RYprJcLwo40u+2ZlXlOI?=
 =?us-ascii?Q?eGSeT+zm2Dpcme6ct+mQEkn1fhsaqbIPCL+P9m4tXSpNUxN506j78lnQ6rCG?=
 =?us-ascii?Q?UepEGaW3aiSHD9ZofR55v0Yt/pK9+9GW8J5B9yacq3OxhvdZJqutEzj9d6uI?=
 =?us-ascii?Q?DWYBnvC9sldvhzIIMiuoQla54UAaMCMTwfij/7wlMrtBkbaytSwcHKEFMgfM?=
 =?us-ascii?Q?Gb2KKJvQjEX+qvMbM23izyNezPYpUyU20Q69W9Pe2x+8/TvtUs04g2Tojevp?=
 =?us-ascii?Q?tVppHA2YbHL/BdT+JFqCpkU6PiGz/we3T3pyG64VASeYYfTtBIVlric1JljS?=
 =?us-ascii?Q?7qypS0D8+H/fNLOI2UT5fiiB/GlT6Q11XhhWHmcVWshrPMAAnoq1ba89y6/P?=
 =?us-ascii?Q?/rdcQiewKG0NrQ6GAI4nnAspvnkOjxaFPlu//0jiJ33rhwR7L8VXZDr4aVef?=
 =?us-ascii?Q?Kp7MaQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR04MB4598EBB5B5AD6109855C0D9BA57E2PSAPR04MB4598apcp_"
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4598.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d892b004-bd7b-4ddf-3148-08dc2075d7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 02:56:08.3605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2untp3cO2TvZiCfJ52eHxOQJqXzg9rmr4vsF7G10UgQSDcdCR2R/JmG6pzZ66p9Fxa9yaqiWMApFKb7zP1so7McL1n/rAzjbrzG0lfi/2X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8584
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
Cc: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PSAPR04MB4598EBB5B5AD6109855C0D9BA57E2PSAPR04MB4598apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

In previous projects, e.g., YV35, BICs bridge the IPMI command of Set/Get B=
oot Order sent from BIOS directly to the BMC, but in YV4, IPMI command is r=
eplaced by PLDM.
As a result, we plan to translate the OEM IPMI command: Set (NetFn=3D0x30, =
Cmd=3D0x52) and Get (NetFn=3D0x30, Cmd=3D0x53) Boot Order sent from BIOS in=
to standard command "SetBIOSAttributeCurrentValue" and "GetBIOSAttributeCur=
rentValueByHandle" in PLDM for BIOS Control and Configuration (DSP0247).

Currently, the handlers for the 2 commands above have been implemented in p=
ldmd to set/get the current value of a BIOSAttribute. (libpldmresponder/bio=
s.cpp<https://github.com/openbmc/pldm/blob/9e6631e201cf71895491987d93e8a343=
e05783b5/libpldmresponder/bios.cpp#L104>)
Each BIOSAttribute can be different AttributeTypes, BIOSEnumeration, BIOSSt=
ring, and BIOSInteger have been implemented. We want to add a new type "BIO=
SBootConfigSetting". (Can refer to Table 14: PLDM Representation of BIOSAtt=
ributeValueTableData in DSP0247<https://www.dmtf.org/sites/default/files/st=
andards/documents/DSP0247_1.0.0.pdf>)

When Set/Get command comes in, it will find specific BIOSAttribute by searc=
hing the BIOSTable (i.e., BIOSTableObj at libpldmresponder/bios_config.hpp<=
https://github.com/openbmc/pldm/blob/9e6631e201cf71895491987d93e8a343e05783=
b5/libpldmresponder/bios_config.hpp#L53>), there are CurrentValue and Defau=
ltValue and OptionValue to represent the attribute's value (a few lines abo=
ve to BIOSTableObj), but the type is restricted to int64_t and string, whic=
h has only 1 element.
BootConfigSetting is a series of BootSources, which should be a string arra=
y. We want to add string array to let BootConfigSetting can store multiple =
elements and add into BIOSTableObj. Since change the type of data type migh=
t need a good amount of work, we wonder know if there is any concern to do =
it?

Thanks,
Delphine

--_000_PSAPR04MB4598EBB5B5AD6109855C0D9BA57E2PSAPR04MB4598apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
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
	mso-ligatures:none;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Patrick,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In previous projects, e.g., YV3=
5, BICs bridge the IPMI command of Set/Get Boot Order sent from BIOS direct=
ly to the BMC, but in YV4, IPMI command is replaced by PLDM.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As a result, we plan to transla=
te the OEM IPMI command: Set (NetFn=3D0x30, Cmd=3D0x52) and Get (NetFn=3D0x=
30, Cmd=3D0x53) Boot Order sent from BIOS into standard command &#8220;SetB=
IOSAttributeCurrentValue&#8221; and &#8220;GetBIOSAttributeCurrentValueByHa=
ndle&#8221;
 in PLDM for BIOS Control and Configuration (DSP0247). <o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12.0pt;text-indent:-12.0pt"><sp=
an lang=3D"EN-US">Currently, the handlers for the 2 commands above have bee=
n implemented in pldmd to set/get the current value of a BIOSAttribute. (<a=
 href=3D"https://github.com/openbmc/pldm/blob/9e6631e201cf71895491987d93e8a=
343e05783b5/libpldmresponder/bios.cpp#L104">libpldmresponder/bios.cpp</a>)<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12.0pt;text-indent:-12.0pt"><sp=
an lang=3D"EN-US">Each BIOSAttribute can be different AttributeTypes, BIOSE=
numeration, BIOSString, and BIOSInteger have been implemented. We want to a=
dd a new type &#8220;BIOSBootConfigSetting&#8221;.
 (Can refer to Table 14: PLDM Representation of BIOSAttributeValueTableData=
 in <a href=3D"https://www.dmtf.org/sites/default/files/standards/documents=
/DSP0247_1.0.0.pdf">
DSP0247</a>)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12.0pt;text-indent:-12.0pt"><sp=
an lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When Set/Get command comes in, =
it will find specific BIOSAttribute by searching the BIOSTable (i.e., BIOST=
ableObj at<a href=3D"https://github.com/openbmc/pldm/blob/9e6631e201cf71895=
491987d93e8a343e05783b5/libpldmresponder/bios_config.hpp#L53">
 libpldmresponder/bios_config.hpp</a>), there are CurrentValue and DefaultV=
alue and OptionValue to represent the attribute&#8217;s value (a few lines =
above to BIOSTableObj), but the type is restricted to int64_t and string, w=
hich has only 1 element.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">BootConfigSetting is a series o=
f BootSources, which should be a string array. We want to add string array =
to let BootConfigSetting can store multiple elements and add into BIOSTable=
Obj. Since change the type of data type
 might need a good amount of work, we wonder know if there is any concern t=
o do it?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Delphine<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PSAPR04MB4598EBB5B5AD6109855C0D9BA57E2PSAPR04MB4598apcp_--
