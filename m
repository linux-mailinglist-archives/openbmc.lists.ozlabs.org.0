Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD3D2114DB
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 23:18:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xvGr6YxmzDqtt
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 07:18:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=sYwnfRky; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=INAxV9wb; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xvFp0kyrzDqCF
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 07:17:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1593638263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRI5NT3+xiAUEuWrAnJTFwqjFU1JUAYJ9iGOde9eyBk=;
 b=sYwnfRky0jK8nztW5aV8PW3brnkb9pxT3bstnC9HPE/AsHYTSLfW0k18YBubqCmNat6Wsx
 aHXkfLazNkjk8Plo8xQv38E3mVTy29OzIrhEXBUdkZ5O3UBPCMBXo72TivMJ9IzlEvSkOt
 DrKGSGNcHmMJ4MgrjddztFdjdcTInKY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1593638264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRI5NT3+xiAUEuWrAnJTFwqjFU1JUAYJ9iGOde9eyBk=;
 b=INAxV9wbIUNp4WBBUTwcRl0gSLDA/ZYLIecGtckVm7Bf2/eKmniiUgH+wNUZF3/c9sKkEa
 zo5ZXXMEJuDEuhWPo/gv6GVUL9tmThOMOH5XRYqhe/xy27Dg4cJLN1oojQ0z2M7Btb9v/g
 5FsYM9VeGuV/F7ZX4yX8BBmZaX/mOZA=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-tIj2PjAlMNqGWvub8Qxhtg-1; Wed, 01 Jul 2020 13:14:13 -0400
X-MC-Unique: tIj2PjAlMNqGWvub8Qxhtg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 1 Jul 2020 10:14:10 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 1 Jul 2020 10:14:10 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Chas Boyer <chasboyer5985@hotmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC System FRU EEPROM Configuration Issues
Thread-Topic: OpenBMC System FRU EEPROM Configuration Issues
Thread-Index: AQHWT8i0P7qjVTGohkKuaTncGB/0O6jy9mUQ
Date: Wed, 1 Jul 2020 17:14:10 +0000
Message-ID: <74ad73afb0b14305824a5bcf3d37d8fa@SCL-EXCHMB-13.phoenix.com>
References: <SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0@SN6PR08MB6062.namprd08.prod.outlook.com>
In-Reply-To: <SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0@SN6PR08MB6062.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_74ad73afb0b14305824a5bcf3d37d8faSCLEXCHMB13phoenixcom_"
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

--_000_74ad73afb0b14305824a5bcf3d37d8faSCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Check here: https://www.intel.com/content/dam/www/public/us/en/documents/sp=
ecification-updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spe=
c-update.pdf

--
Bruce


From: openbmc [mailto:openbmc-bounces+bruce_mitchell=3Dphoenix.com@lists.oz=
labs.org] On Behalf Of Chas Boyer
Sent: Wednesday, July 1, 2020 10:11
To: openbmc@lists.ozlabs.org
Subject: OpenBMC System FRU EEPROM Configuration Issues

Hello,

I have a FRU EEPROM to describe Board, Chassis, and Product information of =
the entire system I would like to configure in an OpenBMC project. The FRU =
has the following fields:

Chassis Type
Chassis Part Number
Chassis Serial
Board Mfg Date
Board Mfg
Board Product
Board Serial
Board Part Number
Board Extra
Product Manufacturer
Product Name
Product Part Number
Product Version
Product Serial

Where may I find documentation to configure this type of FRU? I have seen e=
xamples of FRU IDs with 1 or 2 FRU areas (Board, Chassis, or Product), but =
I have not found examples that use all 3 for one FRU ID.

Also, I have a custom board field to configure, and there is a challenge to=
 get the ipmi-fru-parser, phosphor-inventory-manager, and phosphor-host-ipm=
id configured properly to display the field with ipmitool fru print/list co=
mmand. How do I configure the Board Extra field as a Custom Field, and what=
 are my options for D-Bus properties? Examples I have seen configure a Vers=
ion D-Bus property with Custom Field 2 under the xyz.openbmc_project.Invent=
ory.Decorator.Revision interface, but my board custom field is not used as =
a version.

Sincerely,
Charles

--_000_74ad73afb0b14305824a5bcf3d37d8faSCLEXCHMB13phoenixcom_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Tahoma;
=09panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:12.0pt;
=09font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
p
=09{mso-style-priority:99;
=09margin:0in;
=09margin-bottom:.0001pt;
=09font-size:12.0pt;
=09font-family:"Times New Roman","serif";}
span.EmailStyle18
=09{mso-style-type:personal-reply;
=09font-family:Consolas;
=09color:#1F497D;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Consolas=
;color:#1F497D">Check here:
<a href=3D"https://www.intel.com/content/dam/www/public/us/en/documents/spe=
cification-updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spec=
-update.pdf">
https://www.intel.com/content/dam/www/public/us/en/documents/specification-=
updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spec-update.pdf=
</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Consolas=
;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Consolas=
;color:#1F497D">--
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Consolas=
;color:#1F497D">Bruce<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Consolas=
;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"font-size=
:11.0pt;font-family:Consolas;color:#1F497D"><o:p>&nbsp;</o:p></span></a></p=
>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> openbmc =
[mailto:openbmc-bounces&#43;bruce_mitchell=3Dphoenix.com@lists.ozlabs.org]
<b>On Behalf Of </b>Chas Boyer<br>
<b>Sent:</b> Wednesday, July 1, 2020 10:11<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> OpenBMC System FRU EEPROM Configuration Issues<o:p></o:p></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Hello,<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">I have a FRU EEPROM to d=
escribe Board, Chassis, and Product information of the entire system I woul=
d like to configure in an OpenBMC project. The FRU has the following fields=
:<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:black">Chassis Type<o:p></o:p><=
/span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Chassis Part Number<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Chassis Serial<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Board Mfg Date<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Board Mfg<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Board Product<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Board Serial<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Board Part Number<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Board Extra<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Product Manufacturer<o:p=
></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Product Name<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Product Part Number<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Product Version<o:p></o:=
p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:black">Product Serial <o:p></o:=
p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Where may I find documen=
tation to configure this type of FRU? I have seen examples of FRU IDs with =
1 or 2 FRU areas (Board, Chassis, or Product), but I have not found example=
s that use all 3 for one FRU ID.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:black">Also, I have a custom bo=
ard field to configure, and there is a challenge to get the ipmi-fru-parser=
, phosphor-inventory-manager, and phosphor-host-ipmid configured properly t=
o display the field with ipmitool fru
 print/list command. How do I configure the Board Extra field as a Custom F=
ield, and what are my options for D-Bus properties? Examples I have seen co=
nfigure a Version D-Bus property with Custom Field 2 under the xyz.openbmc_=
project.Inventory.Decorator.Revision
 interface, but my board custom field is not used as a version.<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:black">Sincerely,<br>
Charles<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_74ad73afb0b14305824a5bcf3d37d8faSCLEXCHMB13phoenixcom_--

