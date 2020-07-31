Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C66532347AB
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 16:23:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ8dm6QChzDqgl
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 00:23:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=04818dfd12=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ8Zw3MnKzDqc3
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 00:20:47 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VEDJqK024033; Fri, 31 Jul 2020 14:20:40 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 32km3p5t2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:20:40 +0000
Received: from G1W8107.americas.hpqcorp.net (g1w8107.austin.hp.com
 [16.193.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id 53E08A3;
 Fri, 31 Jul 2020 14:20:39 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 14:20:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 31 Jul 2020 14:20:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P61VPK/gGdoyl3z/es2oCA2OpT87WpV1ma8NTaqecfCpVtRVn1/LAxrnOrbI54YQLdE5kooQWmlr01mQ2k8Aoxj3lW0zMXoRiowXtLaUPp7BLlMkaGAQN4Avlr1gdlaCWJU22zPqbg7MSIFPutJzysCVT3pwdvrCp+bsDtX8w79LC0hsMdNmPMy0pJ6RdvvhZwH/IURC2mFXezkngGId7fV8Wq9GwDhlmRQmq1bKwF+PLeMUFf5pVBETqX7NaEBnkmUXlE2D9zNINRHHQuFkept8tbrnUnjwD+iWLOTfMPeat7gM9thbRUAPf3UAmQo7+fVoLGCvnv8rq08K7edFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMBhhOBuoyypwrzps5q1HqT0X7VM/HXYxgmw3ms0gO0=;
 b=RupuG4YBjxu2ebnLvpXpfatIFAaFQj/0InJsMUWIpV1/F7XPh5374WDmBXICpKd79e6g7m6rbmx6w290I5pauQh1l0SKhaVMZskVVnqWpU0UYRqsTERu1M7mRkwXlQd7/+tsOO9goG8TksCAqoRwulW0dZyeSTlmTN/QdrYbcGL6Ods5sC3SbX7rsGL+pyKfGNXTI2x+txuRlxpbl4rwoN9NZQ+6fhFPtjXvVMuRhIBWLQl1ljraQ3z0pamwNb+fIwwKyhgamRUZ0gfBm9anSSPt40jAj11ZZUlYn8rmIQrcJMnKfkBPCK0TCtsco7VAvweG2IHLkaaCsUQ2t5DO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB0853.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 31 Jul
 2020 14:20:37 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 14:20:37 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, "Sekar, Suryakanth"
 <suryakanth.sekar@linux.intel.com>
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
Thread-Topic: Question about OpenBMC Remote BIOS configuration proposal
Thread-Index: AdZgyrFMz0kBQ4JpRYCZI6XSJUYpdAAB/0kAAS4KbAAAY3+vuw==
Date: Fri, 31 Jul 2020 14:20:37 +0000
Message-ID: <CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>,
 <d10754e5-83b8-79fd-f407-de3d5f353ad0@linux.intel.com>
In-Reply-To: <d10754e5-83b8-79fd-f407-de3d5f353ad0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none; linux.vnet.ibm.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [1.34.113.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6cf4a223-1cf0-414d-0076-08d8355ce58d
x-ms-traffictypediagnostic: CS1PR8401MB0853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CS1PR8401MB0853CB691C96CA2421C31CA3FF4E0@CS1PR8401MB0853.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HUl36lhJNuKRKAIoLtXjaIlRjcXuer85p3t6d9Uwb1ylMv4lqdGWqXBwE2bgj7YQWMu8W87spMawyvXqqfnrVMtxE0nV7v+vqA7s+mcSIZdule1rz5yiaSdBjGQFAzPYNorOVyIf8ug19Lx+IxHfu07ftpicqkGzvSVRDjndqc8t15amxzXFGzeNa0470ozgaBVpPHn6lZizp+s56AkO1wzMzeyI1OUJqBnuxls3XTqlr46FqTuHNmj1K5E9T5OVOAkAlPmlOtDVFQygLXSiTC7NCGPUH0Y7hIwzieWSrwfe1uTJc/w72LgrQwawIZLQ4jf13sCS0mMZOb0rkmAJeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(346002)(366004)(39860400002)(396003)(8676002)(7696005)(66446008)(66556008)(64756008)(66476007)(9686003)(110136005)(316002)(2906002)(55016002)(26005)(71200400001)(66946007)(5660300002)(86362001)(76116006)(91956017)(478600001)(4326008)(33656002)(54906003)(53546011)(6506007)(186003)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wTYmH+k+fpXaHBrqxcRKpDxjxYVNP0lpvq5THQmKiqvW+GqQuMFiVFv7pH3WFxowa4Z/JznpnrTXMfHMtMIJXyAclXfh5BIfhwT669Vx07mfvbwl/1/X98nvAyANzy16PoSr8H54fHP36tnCQl/0o/b+lrortp/gFaV8rEHzzVo7u1LtEfhWpaQJxD628yV/bMhqMruCPTewdB7Xd/l0boPX/RWwUcCT6pU/eVMlVnLULHYV97n6U7YdGK3K1pfojmn/7TKNqVlvTihP29Ze4RxxkXsqCpZXs0v1lnO8zx8SxtyKEA2sHFVqHxD40UE4UJYdMaTv3+/HKXBF4Pgj8zr+l+J2RkV0NUWAk1guSsQmMDeUAc/dbNQxenP/qtrv8uGf2zI1OqtN/hFmL+91FfqN7AK/aF4V0JfefMsVdHna5tlhz3W3ekj/6Th2dmotzzQL+l0mru3Ku//vQHryzU0coF4MJPOyK0lRyQ3XUUc=
Content-Type: multipart/alternative;
 boundary="_000_CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0CS1PR8401MB1144_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf4a223-1cf0-414d-0076-08d8355ce58d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 14:20:37.6032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jQcn6Hx2nLm1kAoD/wDat+NiLowmNlhzKQa6ZVZJwDzZOXhbs3X/efMjpe8JyMNh0zW3bicH4srqJODiZdupA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0853
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310105
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu, Frank \(ISS
 Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0CS1PR8401MB1144_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Sakar, thanks for the response.
After some conversations with OpenBMC people, I recognized RBC daemon is st=
andardized and Intel or IBM have their own implementations to collaborate w=
ith RBC daemon.

For the OEM ipmi commands defined for BIOS and bmc communication, you proba=
bly can join  Redfish Host Interface meeting because we are defining the IP=
MI Redfish command in this meeting. You may also reach out to John Leun fro=
m intel, who is the representative of Intel for that meeting.

I may have PR of the Remote Bios  configuration document for some  cosmetic=
 revises and make this spec more clear on system firmware point of view.

Thanks
Abner

________________________________
From: Sekar, Suryakanth <suryakanth.sekar@linux.intel.com>
Sent: Wednesday, July 29, 2020 5:30:06 PM
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>; Chang, Abner (HPS SW/FW=
 Technologist) <abner.chang@hpe.com>
Cc: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>; openbmc@lis=
ts.ozlabs.org <openbmc@lists.ozlabs.org>; Wu, Frank (ISS Firmware) <frank.l=
.wu@hpe.com>
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal

Sorry, I was Out of Office  few days and busy in other priority.

Abner,

we are supporting Intel uses  OEM IPMI command , IBM  uses  PLDM method
is transfer data from BIOS to the BMC.

In Intel, we are using (Intel prop) XML format which contain all needed
info  from BIOS to the BMC.

Let me know whats requirement. we can discuss the same.

This BIOS config -setting   should be generic.


Thanks

Suryakanth.S


On 7/23/2020 2:51 PM, Deepak Kodihalli wrote:
> On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
>> Hi Sekar,
>> This is Abner Chang from HPE Server BIOS team, our team is also
>> working on UEFI/EDK2 Redfish open source solution (just FYI the POC
>> code is almost done).
>>
>> I read through the Remote BIOS configuration proposal and would like
>> to see if we still have chance to make some changes on it to reduce
>> the efforts on both BMC and BIOS. Also get rid of using PLDM BIOS
>> control/Configuration methodology because we can find the equivalent
>> method if use Redfish service.
>
> The design describes PLDM as one of the alternatives, but it is not
> the only. The design talks about inband IPMI as well. In other words,
> the design doesn't mandate what inband communication protocol BIOS and
> BMC should use. On certain IBM systems, this protocol is PLDM.
>
> Regards,
> Deepak
>

--_000_CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0CS1PR8401MB1144_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div>
<meta content=3D"text/html; charset=3Dus-ascii" data-ogsc=3D"" style=3D"">
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
Hi Sakar, thanks for the response.<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
After some conversations with OpenBMC people, I recognized RBC daemon is st=
andardized and Intel or IBM have their own implementations to collaborate w=
ith RBC daemon.<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
For the OEM ipmi commands defined for BIOS and bmc communication, you proba=
bly can join&nbsp; Redfish Host Interface meeting because we are defining t=
he IPMI Redfish command in this meeting. You may also reach out to John Leu=
n from intel, who is the representative
 of Intel for that meeting. <br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black; text-align: left;">
I may have PR of the Remote Bios&nbsp; configuration document for some&nbsp=
; cosmetic revises and make this spec more clear on system firmware point o=
f view.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
Thanks<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black;">
Abner<br>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display: inline-block; width: 98%;" data-ogsc=
=3D"">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" data-ogsc=3D"" style=3D""><font face=
=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size: 11pt;" data-=
ogsc=3D""><b>From:</b> Sekar, Suryakanth &lt;suryakanth.sekar@linux.intel.c=
om&gt;<br>
<b>Sent:</b> Wednesday, July 29, 2020 5:30:06 PM<br>
<b>To:</b> Deepak Kodihalli &lt;dkodihal@linux.vnet.ibm.com&gt;; Chang, Abn=
er (HPS SW/FW Technologist) &lt;abner.chang@hpe.com&gt;<br>
<b>Cc:</b> Garrett, Mike (HPE Server Firmware) &lt;mike.garrett@hpe.com&gt;=
; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Wu, Frank (ISS=
 Firmware) &lt;frank.l.wu@hpe.com&gt;<br>
<b>Subject:</b> Re: Question about OpenBMC Remote BIOS configuration propos=
al</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment" data-ogsc=3D"" style=3D""><font size=3D"2"><spa=
n style=3D"font-size:11pt">
<div class=3D"PlainText">Sorry, I was Out of Office&nbsp; few days and busy=
 in other priority.<br>
<br>
Abner,<br>
<br>
we are supporting Intel uses&nbsp; OEM IPMI command , IBM&nbsp; uses&nbsp; =
PLDM method <br>
is transfer data from BIOS to the BMC.<br>
<br>
In Intel, we are using (Intel prop) XML format which contain all needed <br=
>
info&nbsp; from BIOS to the BMC.<br>
<br>
Let me know whats requirement. we can discuss the same.<br>
<br>
This BIOS config -setting&nbsp;&nbsp; should be generic.<br>
<br>
<br>
Thanks<br>
<br>
Suryakanth.S<br>
<br>
<br>
On 7/23/2020 2:51 PM, Deepak Kodihalli wrote:<br>
&gt; On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW Technologist) wrote:<br>
&gt;&gt; Hi Sekar,<br>
&gt;&gt; This is Abner Chang from HPE Server BIOS team, our team is also <b=
r>
&gt;&gt; working on UEFI/EDK2 Redfish open source solution (just FYI the PO=
C <br>
&gt;&gt; code is almost done).<br>
&gt;&gt;<br>
&gt;&gt; I read through the Remote BIOS configuration proposal and would li=
ke <br>
&gt;&gt; to see if we still have chance to make some changes on it to reduc=
e <br>
&gt;&gt; the efforts on both BMC and BIOS. Also get rid of using PLDM BIOS =
<br>
&gt;&gt; control/Configuration methodology because we can find the equivale=
nt <br>
&gt;&gt; method if use Redfish service.<br>
&gt;<br>
&gt; The design describes PLDM as one of the alternatives, but it is not <b=
r>
&gt; the only. The design talks about inband IPMI as well. In other words, =
<br>
&gt; the design doesn't mandate what inband communication protocol BIOS and=
 <br>
&gt; BMC should use. On certain IBM systems, this protocol is PLDM.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Deepak<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0CS1PR8401MB1144_--
