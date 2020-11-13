Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8F2B2681
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 22:23:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXrzx4vf7zDr9C
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 08:23:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.93.116;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=rahulkapoor@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=Vh772//d; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2116.outbound.protection.outlook.com [40.107.93.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXrzB6n67zDqsh
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2020 08:22:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFDKIFTLKJZsEZqBtLaMDjX7fDZ1VrOzxeTjQbs6GuNl1lfiDaDgRhdZf6kzJBzPnU7UFnHKJkN94RvGG4Ste1DwrScxMXlQP3waUycmrfzLHfr50woYT0nKpyXiH60sXrq4huP6iOIFGCLMSnEWKnXIHEwsnreZppNcQy/L33SQCoTbqTKMS1//EuR5jkkI607HaE+nPoZl0xfOG89ytzktQMaNaSRIdh74DA8o4R/jsS+c6aycCzmuZWIBO0tPSphDBRtoBf60dN9wTlMb/tRtdlWVnX0I5sZWyH53+1qGkYKhAxvqLbMhT1oBLAyuwOv4cNGOz6435arKcVwKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=136Um5n/0BD/7W/PTi2hs56Dwu7N6dYf7DjJCB212Hk=;
 b=QuugafDLvDgdclZZHmAsN3KbZGOCtzRHi+mlazie9t++xbG01Ekg+l87nN7kVNGbP4akdm7MrHaEemdR1UZiuvJC9Rm3/D8X54DsOStNMtuBw+hHU2f7CBYZo24uP6xWuaDvu3EsgOZiYOmfiy7/TFm+wy4egK7SwOyTRCJJ+9BDwgaJ/zmepMRA8jqL1mPrNPGjpBM+bNNbd40uHdOtGKtMi2BpE5AT4sX1V5sacfkt6q1JCDLy8ErH13Dlt3yLTivABQRuLPdlg1A+sDOq0DRdZETjpYh0Did3HzwQEKa28wPgwW6ri8ij6AKvTzCdB0GbsK+sgMoJoYRIP19Rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=136Um5n/0BD/7W/PTi2hs56Dwu7N6dYf7DjJCB212Hk=;
 b=Vh772//de1sybVei1ytaDeZ4guE/1DzcT6Hagl35A9P2CQTVZJO0wlFVkqgnwoyLyQ8BxWF7TexAFUkxFMYNtocND3beH+9yp9UW4wfXGyyIuPGvLiPai19v7HZDvRoldkvsc77HY7JIstYsclegsdfxsvkZ3e5hBjIhGD2ky/I=
Received: from MWHPR21MB1561.namprd21.prod.outlook.com (2603:10b6:301:7c::38)
 by MWHPR21MB0477.namprd21.prod.outlook.com (2603:10b6:300:ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.11; Fri, 13 Nov
 2020 21:22:35 +0000
Received: from MWHPR21MB1561.namprd21.prod.outlook.com
 ([fe80::ac56:a13f:b2d5:b1ed]) by MWHPR21MB1561.namprd21.prod.outlook.com
 ([fe80::ac56:a13f:b2d5:b1ed%6]) with mapi id 15.20.3564.013; Fri, 13 Nov 2020
 21:22:35 +0000
From: Rahul Kapoor <rahulkapoor@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish Message Registry 
Thread-Topic: Redfish Message Registry 
Thread-Index: Ada6AOO/l6RZvOIBS9mlf62mGiT1KA==
Date: Fri, 13 Nov 2020 21:21:53 +0000
Message-ID: <MWHPR21MB15617F0E229621D95588880CABE60@MWHPR21MB1561.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b94371dd-1205-42be-b0c8-fc5629f45982;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-11-13T20:48:14Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [2601:600:8181:c90:30f5:c2a3:1bfa:3c94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 17d83d45-5385-423a-5773-08d8881a3d40
x-ms-traffictypediagnostic: MWHPR21MB0477:
x-microsoft-antispam-prvs: <MWHPR21MB047778FFDF8B62956A5C06FAABE60@MWHPR21MB0477.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: moQH9QQ8zkd1ZtSPOAcTPFs1aHfnreEDJHBGiFcCeMkmDYZMpUmH6lK2dNbPkeCeHCKuvmcaqbkZ/Z6yQTsxfQQG1sTN6trCurh0Rjb1L0r4bz/dkLEKKKGGU6VrxYeueluOhMicu4g2TzWBm6QeXcx8pba9tFMIjyLs5I4QBK/AXgFp5lQU5bO5RBveGTy9r5wbqQlS+v/LZvPzb6CFxXfGJkovu7qywD3d86GDtaoSXQqYGG1YssgcOKEg8gs2IhLpMluAUEWOg9YKAbAhnJH339K4MJFPxfHF1XHtd1rUeGI+77o/M9lgD9dIuhqIpbPkAqLbXx0shEKBgHBrhA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1561.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(9686003)(6506007)(71200400001)(8990500004)(2906002)(55016002)(83380400001)(52536014)(4743002)(6666004)(82960400001)(186003)(8676002)(5660300002)(15650500001)(316002)(8936002)(9326002)(66476007)(33656002)(82950400001)(3480700007)(86362001)(64756008)(7116003)(10290500003)(7696005)(6916009)(66946007)(478600001)(76116006)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: cqyLR7CYP8a/zHQ0oM8iGVYlR0Rraa4guJHd4ZDuCpMBtv8y2yiNBkZjUn/D9NnIFDMQScsWx/l1op9h1AgW2ziWiVM+vRKGzsScvBmUsIbZGmkTygi0/0exPdNDez8zRBtlGIM87tGxeGL64bUSFnb6p6u3UfffxBKm75BuHed5RP8rUJH/+WKzgEk6PuMaiz6//QVCpbiaf1sHwWa9ln8iWOQehDfdoAUDWGgo7tdCqRF486FvyIFYz+AIkSK7Zu1MbamNwukDHzG/ahE7oZxJ4M/RJI1xiEv2t4fwHvyozmQ5mdCCo2QOnk4B5D9eS3lk0J/KICFabShD84PlBp/NOMZxcx005KMrGUVFWLo0HpVb91PTgGIyoiD+qjuJ/0ifeZiBdxyPJki0dgejT4hUWEMwOZxZJZh17dGRFUHBtYTVaI++uaONFR5b2KuETCH/u9LbldMsbOVh/c2nypWtrtvsX4A2amG9IfL9QyXSaJVtAKZUduSj8OWy46p/zaOO7G61ibA73X+iDwu7SBFDS9sI1EeKeyGZpDV6+qeaocVcpDWXsjAvNNcqVESattvBhQx/11U8JUF21gNBiCMe4Nvfgt1iyxBXKhqIXXKFq7BJMJ3OuDT1ouPfFfrQ5bnbFWljXgGwAEOJ6c6Fb37pOEPnzBQ6fEHPQyVLFM4YzDIdGyyu8vYtjXtDaP55ufiIZG9KYKtAkokEglYY96gppmhxJcF1592ZxajsnWDJUaKojLiRwjAL4gJ2ifDI58lRr3IgejOH36NCyU6NYVbmWVrnEP234/2EsnwAuB49bN1xJ6PT25prjFG64CeDISIFXZvgiT//IYVncp2GTAUTeK+gc3uhhuAxLHVMJQy8Rtkg3K21iAIUQ156dC7L7xsW4q+TQ9pOfsYlOh5bHA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MWHPR21MB15617F0E229621D95588880CABE60MWHPR21MB1561namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1561.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d83d45-5385-423a-5773-08d8881a3d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 21:21:53.5031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZiXnwW/vuTTwVgaM7lZUH96tVDagw07EHCbTN3wANrMJyauHwk/jN9VC5k6EbDLexVxRXENHEObKOKD9tnEjf/8fsJWiK9u0f9L3K3aH9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0477
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

--_000_MWHPR21MB15617F0E229621D95588880CABE60MWHPR21MB1561namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Looking at bmcweb's message registry implementation  (openbmc_message_regis=
try.hpp) I understand that each registry entry is purpose defined for a spe=
cific system event.
I am looking for a generic registry entry (other than SELEntryAdded)  that =
can be used for any discrete sensor and let the message arguments specify w=
hat discrete sensor it is associated with and other details. Following is w=
hat I am thinking

MessageEntry{"DiscreteSensorAlert_1",
                 {
                     "Indicates that a discrete sensor "
                     "has critical alert condition met."
                     "Additional information in Event"
                     "data 1",
                     "%1 discrete sensor raised alarm.\n"
                     "Error=3D%2 \nEvent Data1=3D%3",
                     "Critical",
                     3,
                     {"string", "string", "number"},
                     "Check the sensor or subsystem for errors.",
                 }},
    MessageEntry{"DiscreteSensorAlert_2",
                 {
                     "Indicates that a discrete sensor "
                     "has critical alert condition met"
                     "Additional information in Event"
                     "data 1 and 2",
                     "%1 discrete sensor raised alarm.\n"
                     "Error=3D%2 \nEvent Data1=3D%3 "
                    "Event Data2=3D%4",
                     "Critical",
                     4,
                     {"string", "string",
                      "number","number"},
                     "Check the sensor or subsystem for errors.",
                 }},

Message id is of the form <ID>_<Event data fields>

Let me know what you think

-Rahul Kapoor


--_000_MWHPR21MB15617F0E229621D95588880CABE60MWHPR21MB1561namp_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Looking at bmcweb&#8217;s message registry implement=
ation &nbsp;(openbmc_message_registry.hpp) I understand that each registry =
entry is purpose defined for a specific system event.
<o:p></o:p></p>
<p class=3D"MsoNormal">I am looking for a generic registry entry (other tha=
n SELEntryAdded) &nbsp;that can be used for any discrete sensor and let the=
 message arguments specify what discrete sensor it is associated with and o=
ther details. Following is what I am thinking
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">MessageEntry{&quot;DiscreteSensorAlert_1&quot;,<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Indicates that a discrete sensor &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
has critical alert condition met.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Additional information in Event&quot; <o:p>
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
quot;data 1&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
%1 discrete sensor raised alarm.\n&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Error=3D%2 \nEvent Data1=3D%3&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Critical&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&quot=
;string&quot;, &quot;string&quot;, &quot;number&quot;},<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Check the sensor or subsystem for errors.&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }},<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; MessageEntry{&quot;DiscreteSensor=
Alert_2&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Indicates that a discrete sensor &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;=
has critical alert condition met&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Additional information in Event&quot; <o:p>
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
quot;data 1 and 2&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
%1 discrete sensor raised alarm.\n&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Error=3D%2 \nEvent Data1=3D%3 &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;E=
vent Data2=3D%4&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Critical&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&quot=
;string&quot;, &quot;string&quot;, <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&quot;number&quot;,&quot;number&quot;},<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
Check the sensor or subsystem for errors.&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}},<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Message id is of the form &lt;ID&gt;_&lt;Event data =
fields&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Let me know what you think<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Rahul Kapoor<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MWHPR21MB15617F0E229621D95588880CABE60MWHPR21MB1561namp_--
