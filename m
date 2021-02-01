Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D030B393
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 00:30:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV41d6r3wzDrTf
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 10:30:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=2a01:111:f400:febe::722;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=SHlmD3KE; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0722.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::722])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV40V5yTqzDr55
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 10:29:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmyYixJ+nEYAOi2F7dhJvwYzQL2GnjCPj8rbvwzMnmOf5e3B/rwGgOMo2oOyohU6bBlHzYmLtJ3us8wWTsmSucy6yWAHP9JSLZkTJp67OHDaseQ/IEUqt8I49j9gkMZWOWpbFdZLFePeCV3XaX7y2FVIfEhfp4ZgdxSqeCwOSVFZQWSTf+h9XdOD6X9ltRwqjgGzwk8A61BOKxcdn0l8qmn6gMbAGtBazXbLv96dS1k3/nadQruVmHGOM8zoApJhPrWiAKt1bUnL4bKGE8RG/TPsRwt0+61DFKwxcbjQ8arodI2/FcAKBi3EzMux9DfDpHTLdLj45inldpsJ/DN0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4GFcfHGk4aUdzPNHb5sg6QNWmgjLZeuKYFtHU82j6M=;
 b=V88SwrycrN0zkJAp93FxeQHYoKQdLPb353fVWaTrhrJmou1+XwQL/dNl8JMqpdUdUiiXMs/H3KA0kJkeYN/y3RVBrq93ALAXGSkEDE2/23DOcRdjnc4bA59DSSPRgtH2P68rW9rLUEYIalhNojPBhpf5P1rqz0Z+XdTsGxvhcKCAiCyyoUkdNCXE+pxMUoyGiaiWTykRLeVEuvsVmNEv/Qt9LgH6MZN0GwZLrxwEHClnSJ7OTvdNk4Jl+ZlmlhXR8xXZKoBLafqAhzgUiLzMk0+IPlYMCL8KVTkLf1HtxQRRgXHMtIadPKJEi7WyBoAB6A1xV/RgGBUB/8a3PJiq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4GFcfHGk4aUdzPNHb5sg6QNWmgjLZeuKYFtHU82j6M=;
 b=SHlmD3KEUGnGhdn/dDjzLaulSZtJ+0DamRBMCunV2viDVv0xmey0VZ1XcQZEJnP5fqe3Ow1Msz3c8hJl6n4GGijjEW0SFpzueFT6n1c9c29iGPOKI104D3lyu4R/qnMQ7zwZ2Posl3j21IKsWOFFtoxFuIF+qmBiUmNyWf6Yuwg=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PS1PR0201MB2155.apcprd02.prod.outlook.com (2603:1096:803:a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 1 Feb
 2021 23:29:02 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4%6]) with mapi id 15.20.3805.022; Mon, 1 Feb 2021
 23:29:02 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ipmi lan interface question
Thread-Topic: ipmi lan interface question
Thread-Index: Adb48fkTOYQCslr6RWm64o6Ipk7eCg==
Date: Mon, 1 Feb 2021 23:29:02 +0000
Message-ID: <PS2PR02MB35415290A2191B61F232947990B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [207.140.31.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f9dc40c-4e1c-4001-b6f2-08d8c70928d0
x-ms-traffictypediagnostic: PS1PR0201MB2155:
x-microsoft-antispam-prvs: <PS1PR0201MB2155D1033B0BB42F7D7E95AF90B69@PS1PR0201MB2155.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b65i8PmUYYgm9RI2VHQpakjENMGdzkzii2i9K0K4R0qdOBTdiK7J97OpzJ7Yyt7H4DlUeGae+z2BV25+yJtnx/4qzu9hb3Alb/DgHKD4L6R6AIJ3sc+x6FAjVf6+Fu0enaWIiAhbZ6vE/92idnzNAl3zcfHb+zlocZHO58qpXE1lZHkZVcHjaD2c+dC7RHbyeOcQg9MwC19Bt91e5nGTScmci4RSxlLoeMqoh4Ocofd8HYPYWL6ErVgMUcaeX/sTWLOcgefrLKBuB78cf/0Gb0+Sr4im8TaapIknlPWZ8F4PFjQy6WqE22MMZlvzfKOqvwebuIy2tTfcoJwa0hHMI+NYb4hxIypfZVZepymLIkQMKndJfGXyRCWsq9bx1uBw6/yM7VaGs13ySTuh5VUz23yQttq8a+9NK5lG6ZLSh/PKOO63vT5SGoSI3uwcSZrNQEvXyNkMyCeKT7EirJ2bwui/bOPHSScTxA6RdENZdyRsPCjh+5nYoTuUND6D6/s0V1m+wvoURO4AkYVYJbNhSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39850400004)(316002)(6916009)(8676002)(8936002)(2906002)(86362001)(9326002)(76116006)(7696005)(186003)(5660300002)(66556008)(66476007)(71200400001)(6506007)(33656002)(66946007)(64756008)(66446008)(52536014)(26005)(9686003)(83380400001)(478600001)(3480700007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+qg+ZoSTf/ArbDKwg1YTe8eocq1EOAnzxTmi99yh4XVx3hEKzbuBONdGnbkh?=
 =?us-ascii?Q?m3IjQ1Yh3bSpHi53N6aPx/58MEptUT74GWsGFqOEdFmPS775GOyFHLncw92q?=
 =?us-ascii?Q?sbd57giPDGmQ1L/MNrp9o69bkJr7CcXmvujodu841p8hdnR7IcwGQ6nRB4nX?=
 =?us-ascii?Q?oIWBXpyyO9OYFkZVE5QG9m0LOFipGjRnxj9HqHcofpfDBTBKfrevshXgQoPf?=
 =?us-ascii?Q?GymcUA6Hge0keRyD1kLLJXQDgmMTqNme1FZ0rzpHzdbcdnobZ8iTaraOjYTP?=
 =?us-ascii?Q?LPBt3277EQ4ikDOEgna7XsgeQhdpeD2t7Sx8M4uYNdecFCNqeq2eMujeZt65?=
 =?us-ascii?Q?ohRGTmOFv6MFgfz4n3QA/MOEdg4qdpYGPcGvXgZMVWDZRExz4vLTlteg1Mtm?=
 =?us-ascii?Q?C3FHivS9fuN2o4ePKEL9moDQtkiFlrcyKXnBlzyNqLni8qJ/MeJO6J2BOxyx?=
 =?us-ascii?Q?jQGhDuzQrRnvTQMGbodjHLwZ5V0e8BUaKMGjTkKkG4PWujLeLDdfYlKYbVkw?=
 =?us-ascii?Q?mcpystKrUh0RMBxw3mC3qZMcAvKqmT6WRmlvnTpDRZ3hxJ9en6swrecRf4TM?=
 =?us-ascii?Q?700a5mZToGbhGLKX0c/Gixnv9pjG7JxmfG4A9Xh1on5DT61kRM4PEiledsXm?=
 =?us-ascii?Q?IiZLRMdoK9tdR7lug7//V7wDTf1KgXc/NCXucHkvqoQUnn9zMHOR5iVa9ubY?=
 =?us-ascii?Q?b8nOS+IhcAIOTVdcWgYRWmZo0JZxfD9cGjeYROkWFhey9kYj7XRvh8dZsmcg?=
 =?us-ascii?Q?P0RWR4eprweO0Pf/lEGbwUOtKQVF1YJpGIWLY1eYnPsOHO3HF2gWhtYdMiqv?=
 =?us-ascii?Q?HCL/PdaIpj8XoLkYUF+ibi6+/5oMmW3Wj00eAp6vNPKwvAuBtnDJ6kfsIiZl?=
 =?us-ascii?Q?TDf6rFSU4aJ8XZWO+t7By8U2PtYo6W941vCiHEj8Ucm4H8Q3r76Yhdae8PWv?=
 =?us-ascii?Q?J1H1xVp7Vn59tn/cXh25LWS9vkFHY79PfA9KqY5D59+nINwrhxnq1ZuHdRFN?=
 =?us-ascii?Q?MEyDVJZolKfM0D/vPn0ypWnJrpVwJMIC+01Jalj8izDgjWDX3b9Hr8w2eto4?=
 =?us-ascii?Q?I+nrHv62?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR02MB35415290A2191B61F232947990B69PS2PR02MB3541apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9dc40c-4e1c-4001-b6f2-08d8c70928d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 23:29:02.4656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frY4u4XD/XZ6G3I4bxHr4b8qA4LkLOFeX4nuZWiDWNNz2JURggOqiOZ9kJ8O3JT7MacqTezMIBlMIRKIhN8XxnQbcCcTMOZ8BUdyGTOlj48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0201MB2155
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

--_000_PS2PR02MB35415290A2191B61F232947990B69PS2PR02MB3541apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_PS2PR02MB35415290A2191B61F232947990B69PS2PR02MB3541apcp_
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

--_000_PS2PR02MB35415290A2191B61F232947990B69PS2PR02MB3541apcp_--
