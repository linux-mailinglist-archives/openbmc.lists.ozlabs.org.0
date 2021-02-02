Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56730B49D
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:25:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV6Z62CT7zDr22
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 12:25:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febe::709;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0709.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::709])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV6Y34Yr7zDr0L
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 12:24:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SivFT+9dPFqmatbj2iy4kLkIz49pt2I+sWJ35s5sQoZ0WKM/49aEB9yMUKgYIY6yBu6X9dqTWE00/M1Lh+Jf46xr1GDa8PI7veUh/C0xpL7ihx8FEU6FoGWNdxy4V1CKaVVoQ4jXvuuKc9pe8j3BilLEUig9vaSw2sd3PDWsWkNNHCOB0yTtG/d4QbYxJSLxNbehwgmMxsv+SeWlm9zzLLT+dLtR5Pk3eISpmSD18qyg8ayC/uWVsM4WyOOyyQG9QQmK5eYacYALUCjFTaeaFXnU098HZArHvmt8VgXDwvMVZyRGTH8PSYlN/ktmQcOttJYGswxwAcnUWYzEwAa+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x67L7liBDq40AgwZwy3qn0jeG4Pp96ZBjYjMk+VXEik=;
 b=IdQXa/gvmaX2s/JWtGgHAdoPmAmtenFeWsxwLlIlGFT8TDliT+Fyc642A3sziJeVO1h1LHhZ3txWpsDtHa4XW5Hr/vFfQzNdSHTjjWIo3aY9CdoKR2lPYXoPR5Mm2d7c8HB61wWvstR5k3xvsfzxCwzHHghMa532s6rijaG7Bjn6Q6UYRo2RcxizxN0okGPCzeKaaC36RyrDVSvSHtw9z8GWLO3eoCjJwMnxWbn/4ABA4cRmav2dawhBS1AjeAXPWuPjL71hDwB9Y1s+FLp/bryzdNJ+7E3U4NOcKtt6TqW/fGcvxH2Jkp9562wyvDmRx+8ktNPdWannGUuyxLgV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from PS1PR06MB2600.apcprd06.prod.outlook.com (2603:1096:803:4d::19)
 by PS1PR0601MB3772.apcprd06.prod.outlook.com (2603:1096:300:79::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 2 Feb
 2021 01:24:09 +0000
Received: from PS1PR06MB2600.apcprd06.prod.outlook.com
 ([fe80::6031:184a:88fe:5667]) by PS1PR06MB2600.apcprd06.prod.outlook.com
 ([fe80::6031:184a:88fe:5667%7]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 01:24:09 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: ipmi lan interface question
Thread-Topic: ipmi lan interface question
Thread-Index: Adb48fkTOYQCslr6RWm64o6Ipk7eCgAD5/dA
Date: Tue, 2 Feb 2021 01:24:09 +0000
Message-ID: <PS1PR06MB2600792E350226ADAE1FFFA28AB59@PS1PR06MB2600.apcprd06.prod.outlook.com>
References: <PS2PR02MB35415290A2191B61F232947990B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB35415290A2191B61F232947990B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inventec.com; dkim=none (message not signed)
 header.d=none;inventec.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 257bedd6-159c-4e7a-99be-08d8c7193da4
x-ms-traffictypediagnostic: PS1PR0601MB3772:
x-microsoft-antispam-prvs: <PS1PR0601MB3772E98F2CB9C37FF67B210B8AB59@PS1PR0601MB3772.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S5Ieet5PslUXonYLgNq7duwfVhoYj7ZolMtHn95RBfO2ZU1vPOEwnWEIO0HdOSuzuXEXFT006r8BeVKXoKlr+OYnvm7c0kbnkHlUTN5Qg5cPMHjbNMzIfVbAyNm48u5UukHepYRr1Xbk8+2TTvi3b9rS/PKe8EdYRrsEEJgJGcER/b2TBB4FjkkrAd50yQ+r/AMFdXoQk2nlOIjonlhP+FVXYUWWIQa2upHdOLWD+WLLCFWIYnD8zsEKV26Fl0/ZI055PT7XF71NBcXharDLmj70lCDSI8aZvEmOMPWKAkP5sxgrw+nyepsNgbotVMptfTwCJDEhpsZwBKLMa/miLbA3+Y4hCC/T2qObU1/F/ZLmeIZLi9g0cn0whRz2Mp1DICfcuqC9owtsJ05pK2lZirZI3hCn1Ja0Vk91tDaWow/WRgN4MWMn25J7fxvSWj0rqLjnbViaSsOqEXFgVZ0rikE1eUZleF0MkUtZwxVMFPsi9iq9W/K6Mt5iP8YvHysUdel5SUK6efW0rB7RjMngFVeqxnjR6LRubdAHudiCvhN6IIu5WNVLD8j01dRNhKOwH4YKf28ZVZg7qdDY1KndeGuVvRb6enP8aNZHOxLUtw8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR06MB2600.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(39830400003)(366004)(376002)(478600001)(83380400001)(66446008)(6506007)(53546011)(2906002)(966005)(66946007)(9326002)(33656002)(3480700007)(66556008)(64756008)(9686003)(5660300002)(66476007)(71200400001)(86362001)(8676002)(76116006)(55016002)(8936002)(7696005)(26005)(52536014)(110136005)(316002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lj5AuywrRzAyj6X/P1SyK35cgSq+wKv4sN44jU7Wo4TPcw1WgGbh2KeY5oX4?=
 =?us-ascii?Q?uVP6CQjG6iefxmTuvcK0jOzJ8XqoFgY4ZQsSya0Z46ZlZth363yuajUwd7GN?=
 =?us-ascii?Q?mHF6mYCTdh5XjHZLBNWYlGUPJLu0Dx1x/oKFArg5qJTzOy+6Ux2B0p6irGHN?=
 =?us-ascii?Q?+wrMDY19WrbQasAOQHZiydqA5jpQWPT/uMlKK/LdIrpasNRRbj7e4NYy1uaX?=
 =?us-ascii?Q?eAfwJ0XgRrQ48UnGLUake+x8c3cx1q2I50C1296FKySUJRq9xMV16SahfmWs?=
 =?us-ascii?Q?1wTLQ5aY+IlqZ94qeU67O83Jr/3ejliMX1Tsl86Af+kI4KiZDnOzEHEqfBd7?=
 =?us-ascii?Q?ozO7LXNcxcj8xL9FWq2foFAAgqDbJ4OF/v32EB4Mzh7jU5iA3iMkilR/1f4j?=
 =?us-ascii?Q?sR4JRSfYcdzNaytsUt6P9tNKcrZXz6k2qcoF/X6lp7EgPepKAKeR+wJgFAmU?=
 =?us-ascii?Q?0Z7lHYVwZ1/v0bLGH8FPnwc6vPbkIu9TwQLvygYTNz6tL2g1saMIEuVlyeev?=
 =?us-ascii?Q?idhNZSnShdspi66uMpJe9i0kU7OuVDe1rNlESOX4fpaAX8op4GXtxBQ84tQC?=
 =?us-ascii?Q?5zUFm+wo+pqmJy9P61VYD1sT3uuK/os1vcisvlmn6u4+o9XOyCgMBBqiSngi?=
 =?us-ascii?Q?qFmDdc3XIlFGRXU7OTcgvY4mQwTaq331V62WeCe81h/UvOEBqiooz9zrAhHd?=
 =?us-ascii?Q?L4Z0/t63YHqEkcq4y9tSsF0kDql0CGhWaUC4dHNOFWARmEVzCa4QNW3HIcE6?=
 =?us-ascii?Q?qhQ0tAM457Dxlm6/8ZNnVEbhtUYeiym84HPlsh3pg6im6CEKVSqiLakvS0Q7?=
 =?us-ascii?Q?1BlgPzF4niivpYPbLD3oQDl+A2vkZ0tTiVD1aaYnZQkr9k+C8XEpxNfcb+yO?=
 =?us-ascii?Q?beITHmrRsCbVF50iMIrAt51S8gC+Z0vzsRX0nhdiZVYRL949z3UxOllWhzsc?=
 =?us-ascii?Q?zWlm4dncXflA/OjIhg2P213oa7yFyjetIqrOe8HqKlcZor5ygPyptZXp3eJO?=
 =?us-ascii?Q?jyt7AOM4yFtEAQ3SEP+j9ILJiY7cwvmPzWixUN6qK4J7TKoJXInKlpNNzI49?=
 =?us-ascii?Q?LfR7f7OH?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS1PR06MB2600792E350226ADAE1FFFA28AB59PS1PR06MB2600apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR06MB2600.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257bedd6-159c-4e7a-99be-08d8c7193da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 01:24:09.0914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1snFnfXEcq27uswf/1dWo658B1n5j28MTigwtSOTPgKiS8+I7Ci80d0R30Djju/vmLRSRn/Fv35/qRCQhuU6+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3772
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

--_000_PS1PR06MB2600792E350226ADAE1FFFA28AB59PS1PR06MB2600apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mohammed,

What version is your ipmitool?
Try to use cipher suite 17 and RMCP+ with ipmitool.
E.g.,
$ ipmitool -C 17 -I lanplus -H $IP -U $USER -P $Pass lan print

Please refer to: https://github.com/openbmc/docs/blob/master/IPMITOOL-cheat=
sheet.md

Thanks,
Troy Lee

From: openbmc <openbmc-bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> =
On Behalf Of Mohammed.Habeeb ISV
Sent: Tuesday, February 2, 2021 7:29 AM
To: openbmc@lists.ozlabs.org
Subject: ipmi lan interface question

Hi

I am trying to test the ipmi lan interface for the first time. However, I s=
ee setting Authtype is failing. Please review the below logs and let me kno=
w if any inputs.
OpenBMC Version is 2.9 .

Setup:
Openbmc machince 2.7(seahawk) ------openbmc machine 2.9(transformers)


Below is the command outputs.

/* 10.41.8.50 is transformers 2.9 BMC IP.*/
seahawk:/# ipmitool -H 10.41.8.50 -U test -P test123 lan print -vvv
Sending IPMI/RMCP presence ping packet
send_packet (12 bytes)
06 00 ff 06 00 00 11 be 80 00 00 00
ipmi_lan_send_cmd:opened=3D[1], open=3D[474656]
>> IPMI Request Session Header (level 0)
>>   Authtype   : NONE
>>   Sequence   : 0x00000000
>>   Session ID : 0x00000000
>> IPMI Request Message Header
>>   Rs Addr    : 20
>>   NetFn      : 06
>>   Rs LUN     : 0
>>   Rq Addr    : 81
>>   Rq Seq     : 01
>>   Rq Lun     : 0
>>   Command    : 38
send_packet (23 bytes)
06 00 ff 07 00 00 00 00 00 00 00 00 00 09 20 18
c8 81 04 38 0e 04 31
recv_packet (31 bytes)
06 00 ff 07 00 00 00 00 00 00 00 00 00 10 81 1c
63 20 04 38 00 01 80 04 02 00 00 00 00 1d 00
ipmi message header (31 bytes)
06 00 ff 07 00 00 00 00 00 00 00 00 00 10 81 1c
63 20 04 38 00 01 80 04 02 00 00 00 00 1d 00
<< IPMI Response Session Header
<<   Authtype   : NONE
<<   Sequence   : 0x00000000
<<   Session ID : 0x00000000
<< IPMI Response Message Header
<<   Rq Addr    : 81
<<   NetFn      : 07
<<   Rq LUN     : 0
<<   Rs Addr    : 20
<<   Rq Seq     : 01
<<   Rs Lun     : 0+
<<   Command    : 38
<<   Compl Code : 0x00
get_auth_capabilities (9 bytes)
01 80 04 02 00 00 00 00 1d
Channel 01 Authentication Capabilities:
  Privilege Level : ADMINISTRATOR
  Auth Types      :
  Per-msg auth    : enabled
  User level auth : enabled
  Non-null users  : enabled
  Null users      : disabled
  Anonymous login : disabled

Authentication type NONE not supported
Error: Unable to establish LAN session
Error: Unable to establish IPMI v1.5 / RMCP session
seahawk:/#

Since , AuthType NONE is not supported tried to set the auth type to MD5 bu=
t it fails.
sysadmin@transformers:~# ipmitool lan set 1 auth Admin MD5,PASSWORD -vvv
Loading IANA PEN Registry...
Running Get PICMG Properties my_addr 0x20, transit 0, target 0
Error response 0xc1 from Get PICMG Properties
Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
Invalid completion code received: Invalid command
Acquire IPMB address
Discovered IPMB address 0x0
Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0

Channel type: 802.3 LAN
Auth Type Enable        : callback=3D0x00 user=3D0x00 operator=3D0x00 admin=
=3D0x00 oem=3D0x00
authtype data (5 bytes)
00 00 00 14 00
Warning: Set LAN Parameter failed: Unknown (0x82)
sysadmin@transformers:~#

sysadmin@transformers:~# ipmitool channel getaccess 1 4
Maximum User IDs     : 15
Enabled User IDs     : 4

User ID              : 4
User Name            : test
Fixed Name           : No
Access Available     : callback
Link Authentication  : enabled
IPMI Messaging       : enabled
Privilege Level      : ADMINISTRATOR
Enable Status        : enabled
sysadmin@transformers:~#

--_000_PS1PR06MB2600792E350226ADAE1FFFA28AB59PS1PR06MB2600apcp_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
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
<p class=3D"MsoNormal">Hi Mohammed,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What version is your ipmitool?<o:p></o:p></p>
<p class=3D"MsoNormal">Try to use cipher suite 17 and RMCP+ with ipmitool. =
<o:p></o:p></p>
<p class=3D"MsoNormal">E.g.,<o:p></o:p></p>
<p class=3D"MsoNormal">$ ipmitool <b>-C 17 -I lanplus</b> -H $IP -U $USER -=
P $Pass lan print<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please refer to: https://github.com/openbmc/docs/blo=
b/master/IPMITOOL-cheatsheet.md<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Troy Lee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+troy_lee=3D=
aspeedtech.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Mohammed.Habeeb ISV<br>
<b>Sent:</b> Tuesday, February 2, 2021 7:29 AM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> ipmi lan interface question<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to test the ipmi lan interface for the f=
irst time. However, I see setting Authtype is failing. Please review the be=
low logs and let me know if any inputs.<o:p></o:p></p>
<p class=3D"MsoNormal">OpenBMC Version is 2.9 .<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Setup:<o:p></o:p></p>
<p class=3D"MsoNormal">Openbmc machince 2.7(seahawk) ------openbmc machine =
2.9(transformers)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Below is the command outputs. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/* 10.41.8.50 is transformers 2.9 BMC IP.*/<o:p></o:=
p></p>
<p class=3D"MsoNormal">seahawk:/# ipmitool -H 10.41.8.50 -U test -P test123=
 lan print -vvv<o:p></o:p></p>
<p class=3D"MsoNormal">Sending IPMI/RMCP presence ping packet<o:p></o:p></p=
>
<p class=3D"MsoNormal">send_packet (12 bytes)<o:p></o:p></p>
<p class=3D"MsoNormal">06 00 ff 06 00 00 11 be 80 00 00 00<o:p></o:p></p>
<p class=3D"MsoNormal">ipmi_lan_send_cmd:opened=3D[1], open=3D[474656]<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; IPMI Request Session Header (level 0)<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Authtype&nbsp;&nbsp; : NONE<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Sequence&nbsp;&nbsp; : 0x000000=
00<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Session ID : 0x00000000<o:p></o=
:p></p>
<p class=3D"MsoNormal">&gt;&gt; IPMI Request Message Header<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Rs Addr&nbsp;&nbsp;&nbsp; : 20<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; NetFn&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; : 06<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Rs LUN&nbsp;&nbsp;&nbsp;&nbsp; =
: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Rq Addr&nbsp;&nbsp;&nbsp; : 81<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Rq Seq&nbsp;&nbsp;&nbsp;&nbsp; =
: 01<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Rq Lun&nbsp;&nbsp;&nbsp;&nbsp; =
: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp; Command&nbsp;&nbsp;&nbsp; : 38<=
o:p></o:p></p>
<p class=3D"MsoNormal">send_packet (23 bytes)<o:p></o:p></p>
<p class=3D"MsoNormal">06 00 ff 07 00 00 00 00 00 00 00 00 00 09 20 18<o:p>=
</o:p></p>
<p class=3D"MsoNormal">c8 81 04 38 0e 04 31<o:p></o:p></p>
<p class=3D"MsoNormal">recv_packet (31 bytes)<o:p></o:p></p>
<p class=3D"MsoNormal">06 00 ff 07 00 00 00 00 00 00 00 00 00 10 81 1c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">63 20 04 38 00 01 80 04 02 00 00 00 00 1d 00<o:p></o=
:p></p>
<p class=3D"MsoNormal">ipmi message header (31 bytes)<o:p></o:p></p>
<p class=3D"MsoNormal">06 00 ff 07 00 00 00 00 00 00 00 00 00 10 81 1c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">63 20 04 38 00 01 80 04 02 00 00 00 00 1d 00<o:p></o=
:p></p>
<p class=3D"MsoNormal">&lt;&lt; IPMI Response Session Header<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Authtype&nbsp;&nbsp; : NONE<o:p=
></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Sequence&nbsp;&nbsp; : 0x000000=
00<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Session ID : 0x00000000<o:p></o=
:p></p>
<p class=3D"MsoNormal">&lt;&lt; IPMI Response Message Header<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Rq Addr&nbsp;&nbsp;&nbsp; : 81<=
o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; NetFn&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; : 07<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Rq LUN&nbsp;&nbsp;&nbsp;&nbsp; =
: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Rs Addr&nbsp;&nbsp;&nbsp; : 20<=
o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Rq Seq&nbsp;&nbsp;&nbsp;&nbsp; =
: 01<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Rs Lun&nbsp;&nbsp;&nbsp;&nbsp; =
: 0+<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Command&nbsp;&nbsp;&nbsp; : 38<=
o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&lt;&nbsp;&nbsp; Compl Code : 0x00<o:p></o:p></p=
>
<p class=3D"MsoNormal">get_auth_capabilities (9 bytes)<o:p></o:p></p>
<p class=3D"MsoNormal">01 80 04 02 00 00 00 00 1d<o:p></o:p></p>
<p class=3D"MsoNormal">Channel 01 Authentication Capabilities:<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp; Privilege Level : ADMINISTRATOR<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp; Auth Types&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Per-msg auth&nbsp;&nbsp;&nbsp; : enabled<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp; User level auth : enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Non-null users&nbsp; : enabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Null users&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : di=
sabled<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Anonymous login : disabled<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Authentication type NONE not supported<o:p></o:p></p=
>
<p class=3D"MsoNormal">Error: Unable to establish LAN session<o:p></o:p></p=
>
<p class=3D"MsoNormal">Error: Unable to establish IPMI v1.5 / RMCP session<=
o:p></o:p></p>
<p class=3D"MsoNormal">seahawk:/#<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since , AuthType NONE is not supported tried to set =
the auth type to MD5 but it fails.
<o:p></o:p></p>
<p class=3D"MsoNormal">sysadmin@transformers:~# ipmitool lan set 1 auth Adm=
in MD5,PASSWORD -vvv<o:p></o:p></p>
<p class=3D"MsoNormal">Loading IANA PEN Registry...<o:p></o:p></p>
<p class=3D"MsoNormal">Running Get PICMG Properties my_addr 0x20, transit 0=
, target 0<o:p></o:p></p>
<p class=3D"MsoNormal">Error response 0xc1 from Get PICMG Properties<o:p></=
o:p></p>
<p class=3D"MsoNormal">Running Get VSO Capabilities my_addr 0x20, transit 0=
, target 0<o:p></o:p></p>
<p class=3D"MsoNormal">Invalid completion code received: Invalid command<o:=
p></o:p></p>
<p class=3D"MsoNormal">Acquire IPMB address<o:p></o:p></p>
<p class=3D"MsoNormal">Discovered IPMB address 0x0<o:p></o:p></p>
<p class=3D"MsoNormal">Interface address: my_addr 0x20 transit 0:0 target 0=
x20:0 ipmb_target 0<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Channel type: 802.3 LAN<o:p></o:p></p>
<p class=3D"MsoNormal">Auth Type Enable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; : callback=3D0x00 user=3D0x00 operator=3D0x00 admin=3D0x00 oem=3D0x0=
0<o:p></o:p></p>
<p class=3D"MsoNormal">authtype data (5 bytes)<o:p></o:p></p>
<p class=3D"MsoNormal">00 00 00 14 00<o:p></o:p></p>
<p class=3D"MsoNormal">Warning: Set LAN Parameter failed: Unknown (0x82)<o:=
p></o:p></p>
<p class=3D"MsoNormal">sysadmin@transformers:~#<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">sysadmin@transformers:~# ipmitool channel getaccess =
1 4<o:p></o:p></p>
<p class=3D"MsoNormal">Maximum User IDs&nbsp;&nbsp;&nbsp;&nbsp; : 15<o:p></=
o:p></p>
<p class=3D"MsoNormal">Enabled User IDs&nbsp;&nbsp;&nbsp;&nbsp; : 4<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">User ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 4<o:p></o:p></p>
<p class=3D"MsoNormal">User Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; : test<o:p></o:p></p>
<p class=3D"MsoNormal">Fixed Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; : No<o:p></o:p></p>
<p class=3D"MsoNormal">Access Available&nbsp;&nbsp;&nbsp;&nbsp; : callback<=
o:p></o:p></p>
<p class=3D"MsoNormal">Link Authentication&nbsp; : enabled<o:p></o:p></p>
<p class=3D"MsoNormal">IPMI Messaging&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=
 enabled<o:p></o:p></p>
<p class=3D"MsoNormal">Privilege Level&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ADMI=
NISTRATOR<o:p></o:p></p>
<p class=3D"MsoNormal">Enable Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; : enabled<o:p></o:p></p>
<p class=3D"MsoNormal">sysadmin@transformers:~#<o:p></o:p></p>
</div>
</body>
</html>

--_000_PS1PR06MB2600792E350226ADAE1FFFA28AB59PS1PR06MB2600apcp_--
