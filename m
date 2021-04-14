Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E335FCF2
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 23:04:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLFMQ25Jkz3bvg
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 07:04:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com header.a=rsa-sha256 header.s=selector1 header.b=mRYc8ERg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cornelisnetworks.com (client-ip=40.107.76.101;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=usha.srinivasan@cornelisnetworks.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com
 header.a=rsa-sha256 header.s=selector1 header.b=mRYc8ERg; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760101.outbound.protection.outlook.com [40.107.76.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLFLq5X5Sz30Jp
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 07:03:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+w2N74mCL0NNNnti4OVcEwcJ280UQQ5EfctlfUZCKTafapMTcXfcELZ9SymrNFQQOT/+O1mFiS6gZYvgqUeAKfnYrzx5qDlGr+zAbCaSZsZAc5HHWwr4wdUpiJpeGqxMGUCQYUPrQQR5kPg9qOg46JVKnG2AmawrnLhOShYxygHC7+6uGy97ZFTXBVi38DWZte0IBa/cOVu9cSkT9dvG74pzQ0ionDvaFXqYLcb/gUZArlicRgsyHNeMfmACnqKJfHlQ+u6DJBJCk7Y278GIZYJ0tsdiKXNLYUoYbK9Qhb0/EqE6b9zPn7xWhjGt9sMtnm4d8OeqXSgHEI90G51hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FwYcffARBIh6eEcOHu0XE6u7AIXYe7ANfiWm0fU6Y0=;
 b=OGkVanSFpYqfHp6ysgZKsif/pUAg8raY1bpEfQqJWsg9GOVs8J17otcelRLMEaTEFtiAAALF9ekh/MQa3MPr+XbOcBvj7BZfYvOAJl5yMMyXIdOCIom8hBqaKCuS4A15mRNl3jWH/ZHmQK/efzdq/xRPuAfbkY0+Qv5JIm5IjahhLUtcA14BJIX1zaBLtLDGP4Kcqz5yojG361QzC+y+bSx5QjqVD7CGsfx1PWhKOFhCHnyglwOwV9226SlNk/15Y+la0B8SDslX6KDi3nD+LHi3GHzdMRb8vmsY23vvIaaXXzEUHe1RbHi3CBJOEbO0XLm1LZMYcnws0QzsxF/uBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FwYcffARBIh6eEcOHu0XE6u7AIXYe7ANfiWm0fU6Y0=;
 b=mRYc8ERg5XkKpl3ZcLAUbf1IkzqADA8JhYTqJYCrbLF/B+LJPX6mwHDoTHYtvuf/oqXYh/M4Me9D1dhKAoD6QJSsJawlIb86O5GazyZ6XOvCL06P6MWAwDaiA2UslxTxb3c249gCZkyIwIRJk1ttiDvmAetG9SuOrfFtp+6WzNqo+XTPHg2QEqfVn2Gme1UHfq0U5HLLsoh2mQpxFn9XueToYKdWUepwI6STP4zSP2840OgybPbY8Xaf7Xi2T8N1GLgeUEIdvd7M0UoC9faEscggYuKqxUMb4qgA9saJ5mO4eRMnPZOlQ4LTJUEUH9Xl8qoIEiAuxrXAxz2swGeEcw==
Received: from BYAPR01MB4758.prod.exchangelabs.com (2603:10b6:a03:8b::17) by
 BY5PR01MB6033.prod.exchangelabs.com (2603:10b6:a03:1ba::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22; Wed, 14 Apr 2021 21:03:23 +0000
Received: from BYAPR01MB4758.prod.exchangelabs.com
 ([fe80::89fb:cc6d:2044:c3d3]) by BYAPR01MB4758.prod.exchangelabs.com
 ([fe80::89fb:cc6d:2044:c3d3%5]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 21:03:22 +0000
From: "Srinivasan, Usha" <usha.srinivasan@cornelisnetworks.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: entity-manager FruDevice & eeprom questions
Thread-Topic: entity-manager FruDevice & eeprom questions
Thread-Index: AdcxcZXvp6QG/a7IT+ypuqPVo/lrkg==
Date: Wed, 14 Apr 2021 21:03:22 +0000
Message-ID: <BYAPR01MB47582E93CAFD772A1EF5E5649E4E9@BYAPR01MB4758.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=cornelisnetworks.com;
x-originating-ip: [72.94.82.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82ffd745-6730-4a7a-8f70-08d8ff88bd51
x-ms-traffictypediagnostic: BY5PR01MB6033:
x-microsoft-antispam-prvs: <BY5PR01MB60335538640F47052FB9BAA89E4E9@BY5PR01MB6033.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6nvdrbAeks9iKQaMsg0p4SdoIPTqIC/yTnjbrQJRKRzqIRLSoJ8o6xvYyKV3E60gKnSPRz/IY7XIZbxzGddJpcrEb+QX25glMvHoHzshcVRttbotXGkc/PUywajkQwSTD0jtgPYOve9oT/S1GgtwyHe/oRnsiqGBe4ZV0oB2IXwwRPTKl1pdrOW0tpOK0aD0DDfly8A+ffsDdGoSNNooorVRKvZcMUKI3UMXig6e2735R4ZrRXwQhDgcF1fLb+JWgwxlp5sL+b+1WtfgeTH0pyEl7vxdMF3pn5u92BCq4gi0zUIl7vZQghn5+FzE6nV8NNMnb7zc3ZtACagWTLplQr370LLYYXAWzANSplmGt/FfcPpKT1Y9/5Hi6HBDi3psndiZx+VJyMqrQUFSShBzP8E4USHM0L4QlqTaFSSYuvpbZooz+RZWpA+leGbFZpSW2gok3iWQ5kaobSK0Lk0H1DE81D9qTDqQYllA38PSAsu5MyF/YbrDDpTW1/imqP90woIFuVCybu5DUhBhXo7QjJKlOstRBDDBjh7QuzL4Ri4u6/bU9KueRtjQGPrqb52nz57aEfoh4V6+Yl0kKx3/8JjAjJ149bIFLM4GqIzkB60QafaX/jG61umr0LrFpcGgxmLK5uHkBn+V1UoOnki1TT8brp+M5h7KZN+BOIoqr1UCHap5r9/lwulXLKqa6Py
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4758.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(136003)(366004)(376002)(316002)(52536014)(26005)(33656002)(9686003)(186003)(966005)(71200400001)(86362001)(6506007)(55016002)(7696005)(8676002)(64756008)(166002)(66446008)(2906002)(76116006)(5660300002)(122000001)(66556008)(6916009)(66946007)(38100700002)(66476007)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?zJecGtKgvWXJpacBkvjHAops8YTjstYEOuYp811d9FT28jizShgWDAOkfTJU?=
 =?us-ascii?Q?SouabX8qut0luD9XNltYTVHeplOUXrKw1lXis7CP0l3jMU3W7AdquWZAqJ3U?=
 =?us-ascii?Q?6f2R1Om+TeT3Xa8tbq1FoLSejjpmX5wXYyQEnSXr0YQk//i5HNf8YXxVDJfA?=
 =?us-ascii?Q?0M/4y6B1b0i2+EBZcuRFiAvlHwDFhed1Uq0TKpVING3yAY1xBFotZ2h1FUXm?=
 =?us-ascii?Q?iK/CQklw1pxyb1i3v5zHZaJyDVjzJ/7dbLzcCuGaMyRYi4KCaEEG7mLoHuSe?=
 =?us-ascii?Q?TxWTOTPWZ5gIUSM3qTRBvKTi3/RNYbM70yDwGbhnqtgf9JVtf+kjQonXxA0m?=
 =?us-ascii?Q?lyUMjIwZdMB7nl02uNBJaEZyu5WgHV81NQod1T8o39L5FCBnKGKR3owzJl+Q?=
 =?us-ascii?Q?L3S9/tvK6mXyryQof/V9HUZ7BYsBHFSlJpzhw+8Ak6fMxAnJJd0TzR8MW5nC?=
 =?us-ascii?Q?FkmjGi/Tex6PipiEY0q0Xl45aFapRlM8aLKSakS+hFkp+QcJ1Gp2AgWHCy9g?=
 =?us-ascii?Q?RNL5+X6b7MWwG0RgKSt85BPHRPiPFnMEdbMz/pTEbLJOuwJTAXtPxp5XC9ib?=
 =?us-ascii?Q?s5gmcMrhimRNdSmIvtwP3Ir4s0+CqOJVQ0g24G0rswuByuSO5Qo7s5cXbq0p?=
 =?us-ascii?Q?lmFR15j3YwbCV2uD8SWRJOPGhSkLIebCSjh2ZG5SftCdRFDsZdA5fn9duVz+?=
 =?us-ascii?Q?JcCMswn+AslVYW6TwIFoiHZpPT49L3TY1GykhkPa5L8NJYnGoJVa5P5wZDld?=
 =?us-ascii?Q?d+oLWWuO8KulVSDRoN8RmunOrXkbT5Ox6FlkdGdeSSY7Zk3l3ZxJp/nq7aeo?=
 =?us-ascii?Q?rPdTV06pmCac7cOhhbEf2DTC/mw3b2aapjsIq6bQKho0V3EfenWHQUYZnZZ0?=
 =?us-ascii?Q?OdE2TAO1KGUyce35Bf2+fqPBKmCndIMn9vc2uJHECdj9dLtjyjbzQKAKnHEJ?=
 =?us-ascii?Q?AkZY+Y/6fbcxsL+10hvnMlbzxRlzQ17XkjJ1QRsh6N7SOGI4j4Y4qFC3cP+t?=
 =?us-ascii?Q?H+rS3CW9UQoRa+4SW3++H10rcJn/QyUR31qX0CY6wDspOivHy+JZxsdBXsn0?=
 =?us-ascii?Q?3tu+O8cwhOgzP07k6CL7RGVvEKSYnM8hjwtSguziyfiqY400cY3hSFS1e/ep?=
 =?us-ascii?Q?x7mAw3pj6bHrTZ5KX8/C6byQld00M46cyDyye5rRZVJZ/KfYdKLRW7Ulyquy?=
 =?us-ascii?Q?vikBqTtE34cc/ivoRl0sZS7lDwTn/kSj2OTM4JDtnyu8sR5q4uVTuyOd27/A?=
 =?us-ascii?Q?1GbckEm99xF/Tmx9pPo8cVR6aO6e2tR3ItDQUoAWzPjnmlGzki0OD14tIXld?=
 =?us-ascii?Q?8LM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR01MB47582E93CAFD772A1EF5E5649E4E9BYAPR01MB4758prod_"
MIME-Version: 1.0
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4758.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ffd745-6730-4a7a-8f70-08d8ff88bd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 21:03:22.7370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btDmvAP3DjfYpJwDpZmfrU4pdR+SldNnvzj7W+GMGuyycBJaI0KlzFn5qEotNpyRf80zbGaZutH11InFnSIWHz1iL5HS10Bbm/BbjGNLPYGcg7o0SXKwjfNt3FE5tPeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB6033
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

--_000_BYAPR01MB47582E93CAFD772A1EF5E5649E4E9BYAPR01MB4758prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello.
This is my first-time using entity-manager for inventory & the ability to c=
reate one binary image with different json files for different platform con=
figurations.

But, first, I am trying to initialize the eeprom on my development board an=
d have it picked up by FruDevice.

  1.  I defined the eeprom in my dts file but as 24lc128 so at24 driver did=
n't pick it up but that allowed me to use i2ctransfer to initialize the eep=
rom contents.
  2.  I initialized the eeprom contents following the layout in this doc:
https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs=
/platform-management-fru-document-rev-1-2-feb-2013.pdf
  3.  I fixed the dts file to define the eeprom using generic "24c128" and =
now at24 is picking it up and I see:
ls /sys/bus/i2c/devices/8-0051/
8-00510    eeprom     name       subsystem
driver     modalias   of_node    uevent

cat /sys/bus/i2c/devices/8-0051/name

24c128

  1.  But I also see this:
ls /sys/bus/i2c/devices/8-0051/8-00510/
nvmem      of_node    subsystem  type       uevent
  2.  In the json file for entity manager I have:

        {

            "Address": "0x51",

            "Bus": 8,

            "Name": "CN FRU EEPROM",

            "Type": "EEPROM"

        },

  1.  But, FruDevice fails looking for "/etc/fru/baseboard.fru.bin".
Questions:

  1.  Can someone who has used entity-manager & FruDevice explain the readi=
ng/processing of the contents of the eeprom & the of "/etc/fru/baseboard.fr=
u.bin" or in other words, what am I doing wrong that FruDevice won't get of=
f the ground?
  2.  Is there a recommended method for how to initialize the eeprom in man=
ufacturing?
  3.  Has someone developed a script or an application which given the impo=
rtant pieces of info(see pdf above) formats the contents of the eeprom?
  4.  In general, does one define the eeprom in the dts as well as in the e=
ntity-manager json?

Thanks,
Usha


__________________________
Usha Srinivasan
Embedded Software Engineer
Cornelis Networks
1500 Liberty Ridge Dr
Chesterbrook, PA, 19087
484-498-8425
610-703-8475 (cell)


--_000_BYAPR01MB47582E93CAFD772A1EF5E5649E4E9BYAPR01MB4758prod_
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
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
	{mso-list-id:774861230;
	mso-list-type:hybrid;
	mso-list-template-ids:634312098 67698705 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
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
	{mso-list-id:1584415184;
	mso-list-type:hybrid;
	mso-list-template-ids:-1102005520 67698705 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello.<o:p></o:p></p>
<p class=3D"MsoNormal">This is my first-time using entity-manager for inven=
tory &amp; the ability to create one binary image with different json files=
 for different platform configurations.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But, first, I am trying to initialize the eeprom on =
my development board and have it picked up by FruDevice.&nbsp;
<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo1">I defined the eeprom in my dts file but as 24lc128 so at24 driver did=
n&#8217;t pick it up but that allowed me to use i2ctransfer to initialize t=
he eeprom contents.<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"=
margin-left:0in;mso-list:l1 level1 lfo1">I initialized the eeprom contents =
following the layout in this doc:<br>
<a href=3D"https://www.intel.com/content/dam/www/public/us/en/documents/pro=
duct-briefs/platform-management-fru-document-rev-1-2-feb-2013.pdf">https://=
www.intel.com/content/dam/www/public/us/en/documents/product-briefs/platfor=
m-management-fru-document-rev-1-2-feb-2013.pdf</a><o:p></o:p></li><li class=
=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo1">I f=
ixed the dts file to define the eeprom using generic &#8220;24c128&#8221; a=
nd now at24 is picking it up and I see:<br>
ls /sys/bus/i2c/devices/8-0051/<br>
8-00510&nbsp;&nbsp;&nbsp; eeprom&nbsp;&nbsp;&nbsp;&nbsp; name&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; subsystem <br>
driver&nbsp;&nbsp;&nbsp;&nbsp; modalias&nbsp;&nbsp; of_node&nbsp;&nbsp;&nbs=
p; uevent<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">cat /sys/bus/i2c/devices/8-0051/name<o:p></o:=
p></p>
<p class=3D"MsoListParagraph">24c128 <o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"4" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo1">But I also see this:<br>
ls /sys/bus/i2c/devices/8-0051/8-00510/<br>
nvmem&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;of_node&nbsp;&nbsp;&nbsp; subsystem&nbs=
p; type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uevent<o:p></o:p></li><li class=
=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo1">In =
the json file for entity manager I have:<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<=
o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;Address&quot;: &quot;0x51&quot;,<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;Bus&quot;: 8,<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;Name&quot;: &quot;CN FRU EEPROM&quot;,<o:p></o:=
p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;Type&quot;: &quot;EEPROM&quot;<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },=
<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"6" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo1">But, FruDevice fails looking for &quot;/etc/fru/baseboard.fru.bin&quo=
t;.&nbsp;&nbsp;
<o:p></o:p></li></ol>
<p class=3D"MsoNormal">Questions: <o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">Can someone who has used entity-manager &amp; FruDevice explain the r=
eading/processing of the contents of the eeprom &amp; the of &quot;/etc/fru=
/baseboard.fru.bin&#8221; or in other words, what am I
 doing wrong that FruDevice won&#8217;t get off the ground?<o:p></o:p></li>=
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">Is there a recommended method for how to initialize the eeprom in man=
ufacturing?
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo2">Has someone developed a script or an application whic=
h given the important pieces of info(see pdf above) formats the contents of=
 the eeprom?<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-=
left:0in;mso-list:l0 level1 lfo2">In general, does one define the eeprom in=
 the dts as well as in the entity-manager json?<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Usha<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">__________________________&nbsp;&nbsp; <o:p></o:p></=
p>
<p class=3D"MsoNormal">Usha Srinivasan<br>
Embedded Software Engineer<br>
Cornelis Networks<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">1500 Liberty Ridge Dr<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Chesterbrook, PA, 19087<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">484-498-8425<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">610-703-8475 (cell)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR01MB47582E93CAFD772A1EF5E5649E4E9BYAPR01MB4758prod_--
