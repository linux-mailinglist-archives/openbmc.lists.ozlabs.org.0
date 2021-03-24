Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB92D346FF6
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 04:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4tYT6FSYz30Lp
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 14:11:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:fe9c::700;
 helo=jpn01-os2-obe.outbound.protection.outlook.com;
 envelope-from=jamin_lin@aspeedtech.com; receiver=<UNKNOWN>)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01on0700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe9c::700])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4tYH1lKfz2yZM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 14:11:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDGb5t8IlViQZFtXOC+KhVKd2Lz2RerTnzHNXEUIxZw+6RvZpmH/cjGV18sAIVjyn8d4azwIYvaHvUzbn58bv8yYMS6T7woB6GXFFzv3aud4WDX6nOYtTY64c1UVtEfAVR4j7kHoc70EqMdyw/plpg4wlzMYhJ9UWu0vRI7OlUraYXHXlNXxNJlbFi56cjs+5WXRFFHVSB/K4gd637iQpFXwcjwubdXOj0YGnwFBaZZxeqJHS/vhZBI5GtRvTne33Wp6319Qv5ihJXEjeJUHT2auGH0Ga67ZY5KDaRN5qU6YCPEMTqawG2xWUpXxo/HtI0mIZRDvJoi/JSZAHNNH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2P+bfJ4ZQNbu6MUxl0kQTwYnCYeVVWkbZnAJ/abT1w=;
 b=ke/3wo9GvgRFrXJmQBrHJJxhzMz4iw6ECwORMg64j2YW1In1TxKQ0mCKCuEcT0l+r42ssGBdy6Y3kCOI50xmw1luPDA3P90MuopKOCAyV8HCwbmyY7OHOpnT3Hb12orPRBPOFwmt1kHsHV3Z9hpDshtZOaf0ItOgg40IzJPKprJtULC+Pw9V3/j1rvX37ffiKh3sqcYj1OKvqn8Q46uEp+3LoOVxGMW2aQA9OQ4zvEWW3du1FBgDO/H9eBDiPIqbtOi/aBpafNEAQ7cYW6hxaXb0ENBaoCGLiZ/GmgsiS84FknZzHWlk9og0bsIL7QTH5cJ59o0HWh9qJ1Ssm4rOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by TYAPR06MB2128.apcprd06.prod.outlook.com (2603:1096:404:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 03:10:43 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::59c0:4796:eee4:7ca7]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::59c0:4796:eee4:7ca7%5]) with mapi id 15.20.3977.024; Wed, 24 Mar 2021
 03:10:43 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [Question] u-boot-spl and secure boot support
Thread-Topic: [Question] u-boot-spl and secure boot support
Thread-Index: AdcgWhw0F+W9icTxTqaQ8dxkFaTmDw==
Date: Wed, 24 Mar 2021 03:10:42 +0000
Message-ID: <TYZPR06MB401518A37630A1C4299E4565FC639@TYZPR06MB4015.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 722079e6-1241-4d36-09fc-08d8ee726940
x-ms-traffictypediagnostic: TYAPR06MB2128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR06MB212852091E171DBFAA13F155FC639@TYAPR06MB2128.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TwpYrn9nBfdYstPqbFEPITpfPov1T4wTbf2l7C0Z+o2Wl/wcaH5zuCRL3LrG8NOkH/yoeYrmFJz9HdfRmsqMyve3kY57TSYrdlFnbwRCFt97aEAiZCWmt6hYaZk5NevAH78mSFJicUYX9KseSrfig3QvtWVy4zpZhdeABT3Bl7K1idyzl3zNlRkP2hz8GM/fT6zRqSGKptfMGYmvN/rWseYQrTDYJZ5/9DFjapKzZO96rd1kVvSpjYwnkCVk0hjKecekxvgVvzGFxoGAT6BoQrxi9BjOyBARY+lCqZoIPCwnt9ffs3CQfvKWiimDRPVWnUW5hg/JOAQCaY+6l+F9cWxZEmGee6nrRlKVEH0VHvfvO9h8npdgPfKPV2aOj1UzFZrQRuGocYcrvQuJwYDoTuMw38IQ8QnB9XHMFHAQ4kRxkXGhhUcpV90Tymyj4nk71fGARNzLNFPUBuMYbjmO0RJoB8jVH+6BaExU+nfOHjNXzNnGAeqDSPF+rLdusgQv49MdvfJv6Y5/YRYEcltMpJ0ezmsplivpoKtoaktj6R5IOdIoWzfwqt/1vsNyzU87DHQicgTxjUjdWeQZ0VuIqiPIgVvTo8goAz4PTrZJrWEfSUJv7uMhtXzdRx/MRR6Id61BR6ElcjSnhCQ9eEOl6OBZdRGIChy62Xl8k0W7p07+f3pMrsWsjcdaZ8Q8owexWsxsSY5IomuqODi4uuCIKLlPVIucEB9KrG8VpuHoXZs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(376002)(366004)(346002)(136003)(166002)(6916009)(186003)(316002)(478600001)(107886003)(966005)(26005)(83380400001)(4326008)(86362001)(55016002)(9686003)(6506007)(38100700001)(76116006)(52536014)(5660300002)(8936002)(7696005)(8676002)(66446008)(66556008)(66476007)(64756008)(71200400001)(33656002)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DUQnUKwXOxoPlcJ59Su/H+B83ZKZRMu5XO2Wl5RVCm0cyucoE0qG4bnkbsyK?=
 =?us-ascii?Q?x180kiBb0K3romti1ThRGyoE/UdojpjXU98CKYWuXvNAoMY/KAVZA+88OQ2l?=
 =?us-ascii?Q?OSh92+Gr6MUXIlShR0QyKCfCozpZRMfDYF7pj4gR6eUbOfvqn59GZa4o9P3l?=
 =?us-ascii?Q?E5NefOWCjrmns6yO7SM744SXor/u9hWB4TsLIedZ45TUbyDJahZ/DOtZOdxV?=
 =?us-ascii?Q?HOkOe72nmjH4Z8xLLciKOQDDl79SPUq557s3ouOBRjlTACbA+IIt6us4wDFL?=
 =?us-ascii?Q?bo+zYI40UYsOndTaMKEHahRYJBtYcLB2tkidtX3iiZqit58SmCCP0fyxAmSG?=
 =?us-ascii?Q?gZdOoRXM7WMuY2mhI7+N3Y4qqi54wht3vbM/I1VkkItVtjBU+ymzj/KsgfFh?=
 =?us-ascii?Q?NBAaspdyfPM8nuYTn7na6PF2sMa0PhNdaBnLiGk6kct1oDHvE+mRyjPEILyp?=
 =?us-ascii?Q?X3ObUWDt4ABPITl/dWxyEJObWaqhwYkOZFdNPHXLOoCCRFvpSkJcVrX2Hb0k?=
 =?us-ascii?Q?/hIVAFY9m7pweKKc0V4/L/cSfz/01U93hFKHsDp+c0vBSOxsNQsQlivNFxon?=
 =?us-ascii?Q?vyG4UR1VkH1Q/SaU6kcrMD4LkHnXEGPLPMhTfCgee65DvDoZGpSW6yRbdH+2?=
 =?us-ascii?Q?fMIgnrOn3jp748x7VrYlRK9pGKxP5WQPucga0ilpX8xO2n1NaUtpCRiRYkjA?=
 =?us-ascii?Q?6ibScE3+htUghe43VmF5WMckPukoHsLWFYXUj2r194X9K7yOxItFW6aJTqU4?=
 =?us-ascii?Q?gEPZh7r5ZAxSF/f19EAUy/PEEX2pQkZ2Af+kVcKHX/65yyJj+gVsopWvM0OE?=
 =?us-ascii?Q?b38FAfUrdyXQgbRko+cdYrVWBouc46iRx6rUknjb7U++1glby7ei+158vYEb?=
 =?us-ascii?Q?qbZ38KOf0cdswDGjjyY6t75GmpSKW7ZGp5HHWo+zRfRmE8/mXBcZ5T1uBJia?=
 =?us-ascii?Q?3sBZIXJt5vT9X2DfFboGEKwLQw++AeeQ96GwoDnUtY24mRldO1AG9Pc/srs9?=
 =?us-ascii?Q?vvDGwxkaLHkS7hCzCQf+P4o5jDy7fgCtPT7NGnv3sG4gFzl8Ji86XWYnY3Rw?=
 =?us-ascii?Q?MReNj3Dq7SBLBvsE1TfuQgaC6BS4uB6l+vkwaLxVEEwxWEwW7onTZwoiZ2Ht?=
 =?us-ascii?Q?G57POyu+o+KX6LTMK1qjKQuSRbW3EkP/dSMdOH6+9sSrRBTcNymf6aSzyPsF?=
 =?us-ascii?Q?d/naVKjK2zGSQHAEZPikR7QTUg6o7ddk4oUB//dB7Vu5ilrYMI8qQDrZjvfF?=
 =?us-ascii?Q?z+4kMloEaHO5WMkM9l9jZQ39YjfqNdbpZFvjrAa0vK4NA++0aCbjm8mmwN0U?=
 =?us-ascii?Q?8CU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TYZPR06MB401518A37630A1C4299E4565FC639TYZPR06MB4015apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722079e6-1241-4d36-09fc-08d8ee726940
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 03:10:42.5034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y733Sgu2Uf7skqA0rpgUdOTR+JqaEs0GZx94EtTcASF8t9xpQ0nO8CljOkHn8NuIRSzcN4Lb1QWE2tai1RNtJNhQdf3KbQE3CwxAlQvMt08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2128
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
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR06MB401518A37630A1C4299E4565FC639TYZPR06MB4015apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
May I ask some questions about u-boot-spl and secure boot for ASPEED AST260=
0 support?


  1.  Refer to the "do_generate_static" and "do_generate_image_uboot_file" =
tasks from image_types_phosphor.bbclass, both tasks support to add "u-boot-=
spl.${UBOOT_SUFFIX}" in the image file.

However, I did not find the image file of UBI mode include "u-boot-spl.bin"=
 in do_make_ubi task.

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_=
types_phosphor.bbclass#L210

do_make_ubi() {
        # Concatenate the uboot and ubi partitions

        mk_empty_image ${IMGDEPLOYDIR}/${IMAGE_NAME}.ubi.mtd ${FLASH_SIZE}

        dd bs=3D1k conv=3Dnotrunc seek=3D${FLASH_UBOOT_OFFSET} \

                if=3D${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX} \

                of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.ubi.mtd

        dd bs=3D1k conv=3Dnotrunc seek=3D${FLASH_UBI_OFFSET} \

                if=3Dubi-img \

          of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.ubi.mtd
}

    Can we change to add u-boot-spl.bin in the image file for UBI mode?


  1.  Refer to the image_types_phosphor.bbclass, it uses the hard code file=
name of u-boot and u-boot-spl and it is very difficult to change to use the=
 singed files of u-boot-spl and u-boot in the image file.
For example:
I tried to use socsec tool to sing the original u-boot-spl.bin and the gene=
rated file was "s-u-boot-spl.bin". I wanted to add "s-u-boot-spl.bin" in th=
e image file and I needed to modify image_types_phosphor.bbclass.
Can we use the variable name of u-boot-spl and u-boot instead of hard code =
naming?
FLASH_UBOOT_SPL _NAME ?=3D "u-boot-spl"
FLASH_UBOO_NAME ?=3D "u-boot"

Thanks-Jamin

************* Email Confidentiality Notice ********************
DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.


--_000_TYZPR06MB401518A37630A1C4299E4565FC639TYZPR06MB4015apcp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:100805539;
	mso-list-type:hybrid;
	mso-list-template-ids:-1843221040 -2025537154 67698713 67698715 67698703 6=
7698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
@list l1
	{mso-list-id:870263383;
	mso-list-type:hybrid;
	mso-list-template-ids:-293587074 -2035489516 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l1:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l1:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
@list l2
	{mso-list-id:1030883703;
	mso-list-type:hybrid;
	mso-list-template-ids:1522970530 -161211574 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l2:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l2:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">May I ask some questions about =
u-boot-spl and secure boot for ASPEED AST2600 support?<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l2 level1 lfo3">
<span lang=3D"EN-US">Refer to the &#8220;do_generate_static&#8221; and &#82=
20;do_generate_image_uboot_file&#8221; tasks from image_types_phosphor.bbcl=
ass, both tasks support to add &#8220;u-boot-spl.${UBOOT_SUFFIX}&#8221; in =
the image file.<o:p></o:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">However, I did not find the image file of UBI=
 mode include &#8220;u-boot-spl.bin&#8221; in do_make_ubi task.<o:p></o:p><=
/span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><a href=3D"https://github.com/openbmc/openbmc=
/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass#L210">https=
://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types=
_phosphor.bbclass#L210</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; &nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-indent:12.0pt"><span lang=3D"EN-US">do=
_make_ubi() {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;# Concatenate the uboot and ubi partitions<o:p></o:p></span></p=
>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; mk_empty_image ${IMGDEPLOYDIR}/${IMAGE_NAME}.ubi.mtd ${F=
LASH_SIZE}<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; dd bs=3D1k conv=3Dnotrunc seek=3D${FLASH_UBOOT_OFFSET} \=
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=3D${D=
EPLOY_DIR_IMAGE}/<b>u-boot.${UBOOT_SUFFIX}</b> \<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of=3D${I=
MGDEPLOYDIR}/${IMAGE_NAME}.ubi.mtd<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; dd bs=3D1k conv=3Dnotrunc seek=3D${FLASH_UBI_OFFSET} \<o=
:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=3Dubi=
-img \<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.ubi.mtd<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US">}<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;Can we =
change to add u-boot-spl.bin in the image file for UBI mode?<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l2 level1 lfo3">
<span lang=3D"EN-US">Refer to the image_types_phosphor.bbclass, it uses the=
 hard code filename of u-boot and u-boot-spl and it is very difficult to ch=
ange to use the singed files of u-boot-spl and u-boot in the image file.<o:=
p></o:p></span></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt"><span lang=3D"EN-US">Fo=
r example: <o:p>
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt"><span lang=3D"EN-US">I =
tried to use socsec tool to sing the original u-boot-spl.bin and the genera=
ted file was &#8220;s-u-boot-spl.bin&#8221;. I wanted to add &#8220;s-u-boo=
t-spl.bin&#8221; in the image file and I needed to modify image_types_phosp=
hor.bbclass.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt"><span lang=3D"EN-US">Ca=
n we use the variable name of u-boot-spl and u-boot instead of hard code na=
ming?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt"><span lang=3D"EN-US">FL=
ASH_UBOOT_SPL _NAME ?=3D &#8220;u-boot-spl&#8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt"><span lang=3D"EN-US">FL=
ASH_UBOO_NAME ?=3D &#8220;u-boot&#8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks-Jamin<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">************* Email Confidentia=
lity Notice ********************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DISCLAIMER:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This message (and any attachmen=
ts) may contain legally privileged and/or other confidential information. I=
f you have received it in error, please notify the sender by reply e-mail a=
nd immediately delete the e-mail and
 any attachments without copying or disclosing the contents. Thank you.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TYZPR06MB401518A37630A1C4299E4565FC639TYZPR06MB4015apcp_--
