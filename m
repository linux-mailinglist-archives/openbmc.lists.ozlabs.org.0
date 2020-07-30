Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015C232A49
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 05:14:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHFqq6jV4zDqvR
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 13:13:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=vasantp@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=nCbAp9Ta; dkim-atps=neutral
X-Greylist: delayed 308 seconds by postgrey-1.36 at bilbo;
 Thu, 30 Jul 2020 13:12:56 AEST
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHFpc6SYnzDqrq
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 13:12:56 +1000 (AEST)
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2239790000>; Thu, 30 Jul 2020 11:07:37 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
 by hkpgpgate101.nvidia.com (PGP Universal service);
 Wed, 29 Jul 2020 20:07:37 -0700
X-PGP-Universal: processed;
 by hkpgpgate101.nvidia.com on Wed, 29 Jul 2020 20:07:37 -0700
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 03:07:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 30 Jul 2020 03:07:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvDdB+YayC2CpAZciWzaBVV/EIKcWkImAsFo8WUUwwpZkwA1cFCjYzZD0at9psWvyjg0swixqjXQvYekH+yVqzEzzLw8XGFmgjvi2vdfobKZNi9rv5+Ozev/EEn41p4rZ0jb5MJqciUFF/AqcFqgyODG0KpUw0Cso6DLaAZw9MnrhGiii/JpDdAk+Z8q5xEhEDqfJo+1EAzbI1/2g+/vemlA2x0ETkpi/FqenARJtQZpuHyXoId3eNsyz4Wk+85UCEX+E8ixz/Am4Ml5LNX9fQHV8bbggnhskMzU/L0Wi+Kno7WX/0+F9gCbZ4sx8yUWSx29EN5HkyZ3WMjyVracpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nup5VlGs6EnnggOTM9m9hyveb7qHYraE8j9PNxb2TY0=;
 b=JTWNBQ7RBqA1DFRViKGh7jB3sEw39vHY4XuscgsRvdHOaRhTaplXABCZ0l4GN6SwmFEIO2HLul3oaURsFxlI3E1VZgVRc3kEW7n8NO5eUmctmqaaYyxzNdxXgkuWAbY767nObDlskJgaMG6aByX3t8JYas+CwTqQl46VvHGyrB2vy0gbyAiyHZGpLjBTNmWB/SaqA2JR9cvOa0g1Jtn/io5TQl2eF6lxKGAjENiUV8RlyY0xsKJWt+Xjz5VT1CVvFgnvfVVxpIf/+OsjvKVNeTLyHFdsa/xIA/kLUWKnRQUVOvB0CdAdd6e5T5Zrks2RWWNk63R8QRc4ZP1FZ6bG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN8PR12MB3282.namprd12.prod.outlook.com (2603:10b6:408:9e::27)
 by BN6PR12MB1250.namprd12.prod.outlook.com (2603:10b6:404:17::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 30 Jul
 2020 03:07:34 +0000
Received: from BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::84fe:6445:1fd5:c099]) by BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::84fe:6445:1fd5:c099%5]) with mapi id 15.20.3239.018; Thu, 30 Jul 2020
 03:07:34 +0000
From: Vasant Patil <vasantp@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC : FRU  Inventory management  
Thread-Topic: OpenBMC : FRU  Inventory management  
Thread-Index: AdZmG003kN5qN8soTgekD8sdI9tU/A==
Date: Thu, 30 Jul 2020 03:07:34 +0000
Message-ID: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [12.22.141.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b39c89d-2a6b-4edf-9d16-08d83435b4d2
x-ms-traffictypediagnostic: BN6PR12MB1250:
x-microsoft-antispam-prvs: <BN6PR12MB125000257ADC2D7C16F72E2EC7710@BN6PR12MB1250.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ERkP4eGx87HyjxN12RM3qWy9elP2YjOys+raOXtRVXP5hRG5AygRctJsn4N3ZWN28LzpBR2iL9WjIC5bkU2cHkg3dVZu9+KYQ+PbK1tkoXTXCAOYwf6ILvGMQucqxIdph5gGow6wa1/amqma1LdahDZE3qeRLYSef3WV1nflhCNlMP2GlmWdiaqdJA2zXWQlFbP/MjKrZb/8Nk8/t8aAJuoMe9U0B3lFt9HfcynxQnisKV/HVjgFnl94JWSrYfB5aFC1IQD8omCN1qeLfMe5f8fG9Pur3i+WffFFkJHqmHcmQnPLJ17jpVyQ9cmY8VO35tf7CstgL52cVxZditGRVMB9zhlK/D9CM2BAaXSTK7IBvB4vXkpRPkwi7v3JKTR8lWMjnoeEiCxC/j/9YTahuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3282.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(83130400002)(166002)(2906002)(8936002)(33656002)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(478600001)(8676002)(9326002)(316002)(86362001)(52536014)(55016002)(4744005)(9686003)(26005)(6916009)(71200400001)(186003)(7696005)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: viUWrVmwoO17oSK5ODoYskTk94ZdACCLyGrlaycVY4fofYURi0SMpVEz525SBZsCvwJ6PTf55JGXFVXEqc6KAriQ/8zr1Q0sD3ttJ/Q4jZkS7eGIUDmrtsK9SHVlYBZWz0paga6AqhhhTrR0UX2LNBx96vlTB0YIo7OyZ6shhoD6tYtoVPE35FlmUMhGVOPiAAZ8eyLpwktp5ztcIGijpX8rcJsv7k1Qv77ZWsca21RxlnKqSz0sEXk26QjdZjly5W8jVgWrq7VvXq3Q0JWCwVeIPnwkmofIDKjWXQR+TTYhRwM7fZzNwSKdV4Cw2lWUkxbVy7dIiCC1b06MFeP1VnjCo6oVWzgCz6pUGYm/m3usfiiBtYWegmTrw9AEe9p0b/aNW+Mm0xABbiLrPoHoyY/cfsxU04IivzdA9CMnrIwS89fAL5hF1nxokU2lRxpvQWAaup1t9A2+K1aSiQsUC+RT3JAVT1VX12a1k4YPZiLWhTsNWNa+dv8Q5Q6mtQlyDL1dT8RtLicydYPg+/vWgXlC0HM/e/Vfe9eMw8/hVRtFhMNYMB/tanlXpdHquntDuHYNn38HcwchXB/OOdPT5aHX8ci8j/FL7NHlN6JrgJHwaRUOmVAq4yf3it209IWMlWJnQ7Z8WqmfyJcZSrO8qw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b39c89d-2a6b-4edf-9d16-08d83435b4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 03:07:34.2768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7W6FtLuJMwATo7D7QPzz7RqkqpZ79UNDfPDoJyycfAryqdE/R5yXUZNGB1QTHRk+EYOtluLirGlVZARREcNGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1250
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BN8PR12MB32822ADFBBC19F6B2FB08F52C7710BN8PR12MB3282namp_"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596078457; bh=Nup5VlGs6EnnggOTM9m9hyveb7qHYraE8j9PNxb2TY0=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:Accept-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
 x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
 x-ms-exchange-transport-forked:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type;
 b=nCbAp9Ta/mryV+npaedqknSm+HDMTqnhF/MvywG40wbACoyjyk2E7by2wAAD1ieph
 t/DR6/37tDQn3OrshMbtuW7JfZyABJOYbuxp4eDzN22WYBQqdiSBVdw2PspEtRcKiU
 +b8uA9qfnWEkiKXnblnoz9oBmO/qTbXZXxTfUk0/QdpP5lL5iqfxmx8sOiYDmGZZlV
 45qTpy2GvXMWf3ou9BKLYDfIvaMQUGLU1CMDEb2aSwn1TY2vhirD1o6G7Irj6gxP/X
 A7wVWJfpcwOjVOQcBN44vYS17MP3nZ8zmdso/fcAZCJGrGFviGLyBj3t3sIZVRzlZd
 XfxPOEf8biA+g==
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

--_000_BN8PR12MB32822ADFBBC19F6B2FB08F52C7710BN8PR12MB3282namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

We are enabling OpenBMC on x86 system. We would like to know the recommenda=
tion on FRU inventory management and corresponding pointers.
There seems to be multiple options available

  1.  described in  "Adding new system to OpenBMC<https://github.com/openbm=
c/docs/blob/master/development/add-new-system.md>" with  Yaml files (meta-r=
omulus/recipes-phosphor/ipmi<https://github.com/openbmc/openbmc/tree/master=
/meta-ibm/meta-romulus/recipes-phosphor/ipmi>)
  2.  Entity manager <https://github.com/openbmc/entity-manager>  with JSON=
 schema

We are looking to enable below inventory (Both FRU and non-FRU):

  *   CPU
  *   DIMM
  *   M.2
  *   U.2
  *   Motherboard FRU EEPROM
  *   Chassis FRU EEPROM
  *   Add-on PCI cards
  *   FANs
  *   PSU
  *   Etc.

Thanks in advance for your support.

Regards,
Vasant Patil


--_000_BN8PR12MB32822ADFBBC19F6B2FB08F52C7710BN8PR12MB3282namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	margin-bottom:.0001pt;
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
	{mso-list-id:1284846430;
	mso-list-type:hybrid;
	mso-list-template-ids:1882911968 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
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
	{mso-list-id:1476334542;
	mso-list-type:hybrid;
	mso-list-template-ids:1633452628 966400876 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
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
<p class=3D"MsoNormal">Hi Team, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are enabling OpenBMC on x86 system. We would like=
 to know the recommendation on FRU inventory management and corresponding p=
ointers.
<o:p></o:p></p>
<p class=3D"MsoNormal">There seems to be multiple options available<o:p></o=
:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">described in &nbsp;&#8220;<a href=3D"https://github.com/openbmc/docs/=
blob/master/development/add-new-system.md">Adding new system to OpenBMC</a>=
&#8221; with &nbsp;Yaml files (<a href=3D"https://github.com/openbmc/openbm=
c/tree/master/meta-ibm/meta-romulus/recipes-phosphor/ipmi"><span style=3D"f=
ont-size:12.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#0366D6;b=
ackground:white">meta-romulus/recipes-phosphor/ipmi</span></a>)
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1"><a href=3D"https://github.com/openbmc/entity-manager"=
>Entity manager
</a>&nbsp;with JSON schema<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are looking to enable below inventory (Both FRU a=
nd non-FRU):<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2">CPU<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-lef=
t:0in;mso-list:l1 level1 lfo2">DIMM<o:p></o:p></li><li class=3D"MsoListPara=
graph" style=3D"margin-left:0in;mso-list:l1 level1 lfo2">M.2<o:p></o:p></li=
><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1=
 lfo2">U.2<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-le=
ft:0in;mso-list:l1 level1 lfo2">Motherboard FRU EEPROM<o:p></o:p></li><li c=
lass=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo2"=
>Chassis FRU EEPROM<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"=
margin-left:0in;mso-list:l1 level1 lfo2">Add-on PCI cards<o:p></o:p></li><l=
i class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lf=
o2">FANs<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left=
:0in;mso-list:l1 level1 lfo2">PSU<o:p></o:p></li><li class=3D"MsoListParagr=
aph" style=3D"margin-left:0in;mso-list:l1 level1 lfo2">Etc.<o:p></o:p></li>=
</ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance for your support. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Vasant Patil<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN8PR12MB32822ADFBBC19F6B2FB08F52C7710BN8PR12MB3282namp_--
