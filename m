Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0E2C195F
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 00:27:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg3GG1PtzzDqR3
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 10:27:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.117;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=E2vfQY7T; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2117.outbound.protection.outlook.com [40.107.237.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfcvX12dKzDq7j
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 17:39:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCOKApF9qD5KH4SVL/6jzcx+gMYH8CARar8dKdtmDgx8GFu4G2Iws0Wh0FbkHiOyLpV1sm6TSMmy86d23bx7bcp6SjVrT8IiV6zWaTkTqSwMZQ555+KhuaoSRMBQvI85f6qCyyp92cEZKMgfHGZG/LsCPsPjKkmLpqAZagYdXFuf11MIn2J9uQ60W8vbhLo+RjFVti+0B5hx0p4IM2MHCTOPwfarFzxVUJmdhAvODpdHl3+lDgDh6KJ5tCtNa8mwiTiwqRbJlX1dFjtiRRlrYe/eo0zZ1tlFVGQeNv7mZrO7zd0w8BKOIzEe39kaMeb1CLDyi0ZNKpAbjKtFwvxdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgGbL+g84NZIsDRlFlwskwxhnZZ0rGlTfSfCctJIIN4=;
 b=V0ODGY7IWm5wXVsJKBZNuOekd9q817VOAhkRAnzFR+Y8auRQfFmJ2RrPX82xnv5NaWYVe/AG0zP2pLxaZOP1WE+TYkYjkNxKAcO4zWw5BNJyYboHL49kbGOZQBCOXP9C4sTKrZetml5DoASjagXVgiaJz3PPobIN6GfaxAUKlUTC8T59RxcK4m7bwdLEoCB+0iDD1hvLfHTy/Of7OPeJYEzOzSKpD/Iep0y1NgZ5T+Ju7GaLvFwInzUvJrRKfANh5WOIa9+SirMD4s4Nxqf2jvqG70jAlIy0lnlZ8pKuTlyf6Y8EqoptRts9oKm9i6bGVr8sEvqrbn/F0bv6/sM+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgGbL+g84NZIsDRlFlwskwxhnZZ0rGlTfSfCctJIIN4=;
 b=E2vfQY7TF2Hc7Is6l2hMdw+i1hEWJkrdrmJJ1lrIbL75Ma7lYj/GElsxleE2NYOI2vuGY47Xpjkvzfw8en+Wt1B3mrEmzgdUwMNjlS11jahlA7pKI2YXS2lcxr2uvVDs40DzXrVSZ70dTg5IYkh4d30eMk/uUvQPBRLhWPzS+KE=
Received: from BL0PR01MB5156.prod.exchangelabs.com (2603:10b6:208:67::13) by
 BL0PR01MB4977.prod.exchangelabs.com (2603:10b6:208:63::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Mon, 23 Nov 2020 06:39:27 +0000
Received: from BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::c8df:fcda:a248:704]) by BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::c8df:fcda:a248:704%6]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 06:39:27 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ipmi command implementation mismatch with the design document 
Thread-Topic: ipmi command implementation mismatch with the design document 
Thread-Index: AQHWwV/O++lSF4Cq4kKpl5AQcrbAwA==
Date: Mon, 23 Nov 2020 06:39:27 +0000
Message-ID: <BL0PR01MB515650923510989237151B70FFFC0@BL0PR01MB5156.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [118.69.219.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 864755dc-0ef4-4de5-41e2-08d88f7a862b
x-ms-traffictypediagnostic: BL0PR01MB4977:
x-microsoft-antispam-prvs: <BL0PR01MB4977118A445849EF9FA120CCFFFC0@BL0PR01MB4977.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVNUKYmhd80EuUqmFuhKMUpSyRqZVNxww5WdsnZm6IUVRPBSR5GIg5Bu/xFOzapw9O5xcM2ls5Zcp5l8T9Q1eHgrdpuun1UxexYbdROV/rbdjbqaypcro9EKS/ZxOX3eOLrWlbQwQzTs6bf0Q9oBnCWlnQHBdNypG6QMvayPkUX5Ll0ITnbccjOkVTX/CSFSJL1iEm7t8WDP4wAH8iVjAzDUIklecA3XiCiyxLDtmA45QXA8MFPdah1In4B3A6BWUOL24kDaDvUdK1NwcISxaoszF+4oMyhwTsRdMwSszhfvAyhStKKqFSs9mM6cjF/LGz0grx5kHW2YcFTcpQXUgoXUSR50OW9TlcelNe8/nggg+kbxg71IpThwo4ABFj83CI+xWL+/c8ACgZMQyWInvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB5156.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(8676002)(8936002)(66946007)(9686003)(4743002)(86362001)(76116006)(6916009)(2906002)(91956017)(26005)(966005)(5660300002)(316002)(7696005)(55016002)(33656002)(71200400001)(478600001)(83380400001)(66476007)(186003)(66446008)(6506007)(64756008)(52536014)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wJF5vx5h5zw4yY95QQWfF+AaFXGBSNXJ8eb4Eg/TSD5JNy2lv2xX/NQm0eiQ32E5OMyJIiFit60Mcn0uRVdEI3a1j7rwgzUFGKjJO5moGKHC8KK9/57hP5RsksHRtxjkc26olL7PPIj0Bqz7v6PF/ypcR6kQZV9Nvstgw2m5DptwotdJkNmNKMgcWEfrBs1mJUqcRnsBnrneoTORc9rPnZHxO7qJrlKwRbGqJm0BlScwdP3G75A8QykoeqdSpPC7wnLDpMUZn4zlh1BIEeZp32/5GS2HDma8k1nSd/abDR8Y4aOLqFGMNoYUpjP6nHmXh8QkfxKWhLGV4OLz+wtDPWctRgzhhxjHAVOsiBNroXHEopLeCr/T+T89C7XLfogS/alfy38cXhbM8jCMk+FRVRsy2fhLizrdN5Bi+KRSVlMeDj9TRMmy/9cIEe3tY48VJAwx8mXfJFS1EDorm6uJSeTrJwSnIfgxbEI1EIc5s8rXI3AlS4KWLDYzvH2Bp6YhxI2Z4G59rn6SVAYOaNbOVJrqXZQS0VkLp9TdQpn4i/hcXeY3zzrWoddTtVZME8di4TZP+J+zl9GMcd/b8z03/5kiK9jvST6gG7eXRENocKbidGkotGtFvxhUtqFQzggaQfXRbI0WoqiGGANql6Y4prCew2sYVNx6+eSGwhbgQVwALjH9lWssMz0t6nUBhnWcNueb3vb/waHGp+Yc/GqNQOYuQAWVQ2FL3a0y0+W31X460CcTypNgOiSAiOJWo+wp5MqiRJ6O3obiSH/NT/0RthjTWXWx0KHnXVir5o2jGqbvPtXTjvhajV12jkMlD19P/2YLlk206rUbe4cnMOGh5Eo9OL4ZrfBNAexlqwJCABnIiSGNYBdFIg5+wUkG4SuR0aiKkG3SdQdLk7hF7n29Sg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BL0PR01MB515650923510989237151B70FFFC0BL0PR01MB5156prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB5156.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864755dc-0ef4-4de5-41e2-08d88f7a862b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 06:39:27.1239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPPHkA0cHkZ6CajkPJnSZ49sJvLWKABFqi8GMZhrvv1sEN9D8d9rlj0C4heiM70Zud5VireTL9sLeydplk0WzsREr5lMcXYO/FsBDPHOd3csvvGCgQGPv6OiX3KKZZ3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4977
X-Mailman-Approved-At: Tue, 24 Nov 2020 10:26:40 +1100
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

--_000_BL0PR01MB515650923510989237151B70FFFC0BL0PR01MB5156prod_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi everyone,
I=92m Tung Nguyen, developer for AmpereComputing - Altra system. While work=
ing with the IPMI commands I have a concern when comparing the design docum=
ent and the implementation like the following:
The state-management-and-external-interfaces.md
The full mapping of Redfish and IPMI to xyz.openbmc_project.State.* is as f=
ollows:
Redfish                 IPMI                xyz.openbmc_project.State.Trans=
ition

ForceOff                power down          Chassis.Off
ForceOn                 power up            Host.On
ForceRestart            hard reset          Host.ForceWarmReboot
GracefulRestart                             Host.GracefulWarmReboot
GracefulShutdown        soft off            Host.Off
On                      power up            Host.On
PowerCycle (host on)    power cycle         Host.Reboot
PowerCycle (host off)                       Chassis.PowerCycle

the IPMI =96 chassishandler.cpp:

ipmi::RspType<> ipmiChassisControl(uint8_t chassisControl)

{

    int rc =3D 0;

    switch (chassisControl)

    {

        case CMD_POWER_ON:

            rc =3D initiate_state_transition(State::Host::Transition::On);

            break;

        case CMD_POWER_OFF:

            // This path would be hit in 2 conditions.

            // 1: When user asks for power off using ipmi chassis command 0=
x04

            // 2: Host asking for power off post shutting down.



            // If it's a host requested power off, then need to nudge Softo=
ff

            // application that it needs to stop the watchdog timer if runn=
ing.

            // If it is a user requested power off, then this is not really

            // needed. But then we need to differentiate between user and h=
ost

            // calling this same command



            // For now, we are going ahead with trying to nudge the soft of=
f and

            // interpret the failure to do so as a non softoff case

            rc =3D stop_soft_off_timer();



            // Only request the Off transition if the soft power off

            // application is not running

            if (rc < 0)

            {

                // First create a file to indicate to the soft off applicat=
ion

                // that it should not run. Not doing this will result in St=
ate

                // manager doing a default soft power off when asked for po=
wer

                // off.

                indicate_no_softoff_needed();



                // Now request the shutdown

                rc =3D initiate_state_transition(State::Host::Transition::O=
ff);

            }

            else

            {

                log<level::INFO>("Soft off is running, so let shutdown targ=
et "

                                 "stop the host");

            }

            break;



The redfish =96 systems.hpp:
        else if (resetType =3D=3D "ForceOff")
        {
            command =3D "xyz.openbmc_project.State.Chassis.Transition.Off";
            hostCommand =3D false;
        }





Although the indicate_no_softoff_needed() can prevent the host from soft of=
f, but it seems like a mismatch b/w the design document and the IPMI implem=
entation.

So, my question: is it reasonable for IPMI command ?

Reference:
https://github.com/openbmc/docs/blob/master/designs/state-management-and-ex=
ternal-interfaces.md

Best regards,
Tung

--_000_BL0PR01MB515650923510989237151B70FFFC0BL0PR01MB5156prod_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0cm;
	font-size:10.5pt;
	font-family:Helvetica;}
p.p2, li.p2, div.p2
	{mso-style-name:p2;
	margin:0cm;
	font-size:10.5pt;
	font-family:Helvetica;
	color:#0000C0;}
p.p3, li.p3, div.p3
	{mso-style-name:p3;
	margin:0cm;
	font-size:10.5pt;
	font-family:Helvetica;
	color:#3F7F5F;}
p.p4, li.p4, div.p4
	{mso-style-name:p4;
	margin:0cm;
	font-size:10.5pt;
	font-family:Helvetica;}
p.p5, li.p5, div.p5
	{mso-style-name:p5;
	margin:0cm;
	font-size:10.5pt;
	font-family:Helvetica;
	color:#2A00FF;}
span.s1
	{mso-style-name:s1;
	color:#005032;}
span.s2
	{mso-style-name:s2;
	color:#7F0055;}
span.s3
	{mso-style-name:s3;
	color:black;}
span.s4
	{mso-style-name:s4;
	color:#3F7F5F;}
span.s5
	{mso-style-name:s5;
	color:#0000C0;}
span.s6
	{mso-style-name:s6;
	color:#2A00FF;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:2018270677;
	mso-list-type:hybrid;
	mso-list-template-ids:-1510672438 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style>
</head>
<body lang=3D"en-VN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi everyone,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=92m Tung Nguyen, developer fo=
r AmpereComputing - Altra system. While working with the IPMI commands I ha=
ve a concern when comparing the design document and the implementation like=
 the following:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The state-management-and-extern=
al-interfaces.md<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">The full mapping of Redfish and IPMI to xyz.op=
enbmc_project.State.* is as follows:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Redfish&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IPMI&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;xyz.openbmc_project.State.Transition<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Courier New&quot;;color:black">ForceOff</span></b><span style=3D"font-size=
:10.0pt;font-family:&quot;Courier New&quot;;color:black">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>power down</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>=
Chassis.Off</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">ForceOn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; power up&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Host.On<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">ForceRestart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hard reset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; Host.ForceWarmReboot<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">GracefulRestart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Host.Gracefu=
lWarmReboot<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">GracefulShutdown&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; soft off&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; Host.Off<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">On&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; power up&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Host.On<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">PowerCycle (host on)&nbsp;&nbsp;&nbsp; power c=
ycle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Host.Reboot<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">PowerCycle (host off)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chassis.PowerCycle<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">the IPMI =96 chassishandler.cpp=
:<o:p></o:p></span></p>
<p class=3D"p1"><span style=3D"font-size:10.0pt">ipmi::<span class=3D"s1">R=
spType</span>&lt;&gt;
<b>ipmiChassisControl</b>(<span class=3D"s1">uint8_t</span> chassisControl)=
<o:p></o:p></span></p>
<p class=3D"p1"><span style=3D"font-size:10.0pt">{<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">int</s=
pan></b></span><span style=3D"font-size:10.0pt"> rc =3D 0;<o:p></o:p></span=
></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">switch=
</span></b></span><span style=3D"font-size:10.0pt"> (chassisControl)<o:p></=
o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">{<o:p></o:p></span></p>
<p class=3D"p2"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">case</=
span></b></span><span class=3D"s3"><span style=3D"font-size:10.0pt">
</span></span><i><span style=3D"font-size:10.0pt">CMD_POWER_ON</span></i><s=
pan class=3D"s3"><span style=3D"font-size:10.0pt">:</span></span><span styl=
e=3D"font-size:10.0pt"><o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">rc =3D initiate_state_transi=
tion(State::Host::Transition::On);<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">break<=
/span></b></span><span style=3D"font-size:10.0pt">;<o:p></o:p></span></p>
<p class=3D"p2"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">case</=
span></b></span><span class=3D"s3"><span style=3D"font-size:10.0pt">
</span></span><i><span style=3D"font-size:10.0pt">CMD_POWER_OFF</span></i><=
span class=3D"s3"><span style=3D"font-size:10.0pt">:</span></span><span sty=
le=3D"font-size:10.0pt"><o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// This path would be hit in=
 2 conditions.<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// 1: When user asks for pow=
er off using ipmi chassis command 0x04<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// 2: Host asking for power =
off post shutting down.<o:p></o:p></span></p>
<p class=3D"p4"><span style=3D"font-size:10.0pt"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// If it's a host requested =
power off, then need to nudge Softoff<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// application that it needs=
 to stop the watchdog timer if running.<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// If it is a user requested=
 power off, then this is not really<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// needed. But then we need =
to differentiate between user and host<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// calling this same command=
<o:p></o:p></span></p>
<p class=3D"p4"><span style=3D"font-size:10.0pt"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// For now, we are going ahe=
ad with trying to nudge the soft off and<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// interpret the failure to =
do so as a non softoff case<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">rc =3D stop_soft_off_timer()=
;<o:p></o:p></span></p>
<p class=3D"p4"><span style=3D"font-size:10.0pt"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// Only request the Off tran=
sition if the soft power off<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">// application is not runnin=
g<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">if</sp=
an></b></span><span style=3D"font-size:10.0pt"> (rc &lt; 0)<o:p></o:p></spa=
n></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">{<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
</span></span><span style=3D"font-size:10.0pt">// First create a file to in=
dicate to the soft off application<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
</span></span><span style=3D"font-size:10.0pt">// that it should not run. N=
ot doing this will result in State<o:p></o:p></span></p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
</span></span><span style=3D"font-size:10.0pt">// manager doing a default s=
oft power off when asked for power<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s4"><span style=3D"font-size:10.0pt">// off.</=
span></span><span style=3D"font-size:10.0pt"><o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">indicate_no_softoff_needed()=
;<o:p></o:p></span></p>
<p class=3D"p4"><span style=3D"font-size:10.0pt"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"p3"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
</span></span><span style=3D"font-size:10.0pt">// Now request the shutdown<=
o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">rc =3D initiate_state_transi=
tion(<b>State::Host::Transition::Off);</b><o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">}<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">else</=
span></b></span><span style=3D"font-size:10.0pt"><o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">{<o:p></o:p></span></p>
<p class=3D"p5"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
</span></span><span class=3D"s3"><span style=3D"font-size:10.0pt">log&lt;</=
span></span><span class=3D"s1"><span style=3D"font-size:10.0pt">level</span=
></span><span class=3D"s3"><span style=3D"font-size:10.0pt">::</span></span=
><span class=3D"s5"><i><span style=3D"font-size:10.0pt">INFO</span></i></sp=
an><span class=3D"s3"><span style=3D"font-size:10.0pt">&gt;(</span></span><=
span style=3D"font-size:10.0pt">&quot;Soft
 off is running, so let shutdown target &quot;<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s6"><span style=3D"font-size:10.0pt">&quot;sto=
p the host&quot;</span></span><span style=3D"font-size:10.0pt">);<o:p></o:p=
></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span style=3D"font-size:10.0pt">}<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"apple-converted-space"><span style=3D"font-s=
ize:10.0pt">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></span><span class=3D"s2"><b><span style=3D"font-size:10.0pt">break<=
/span></b></span><span style=3D"font-size:10.0pt">;<o:p></o:p></span></p>
<p class=3D"p1"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span lang=3D"EN-US">The redfish =96 systems.hpp:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Helvetic=
a">&nbsp; &nbsp; &nbsp; &nbsp;
<b><span style=3D"color:#7F0055">else</span></b> <b><span style=3D"color:#7=
F0055">if</span></b> (resetType =3D=3D
<span style=3D"color:#2A00FF">&quot;ForceOff&quot;</span>)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Helvetic=
a">&nbsp; &nbsp; &nbsp; &nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Helvetic=
a;color:black">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; command =3D
</span><span style=3D"font-size:10.0pt;font-family:Helvetica;color:#2A00FF"=
>&quot;xyz.openbmc_project.State.Chassis.Transition.Off&quot;</span><span s=
tyle=3D"font-size:10.0pt;font-family:Helvetica;color:black">;</span><span s=
tyle=3D"font-size:10.0pt;font-family:Helvetica;color:#2A00FF"><o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Helvetic=
a">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hostCommand =3D
<b><span style=3D"color:#7F0055">false</span></b>;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Helvetic=
a">&nbsp; &nbsp; &nbsp; &nbsp; }<o:p></o:p></span></p>
<p class=3D"p1"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span lang=3D"EN-US">Although the </span>indicate_no_softof=
f_needed()<span lang=3D"EN-US"> can prevent the host from soft off, but it =
seems like a mismatch b/w the design document and the IPMI implementation.<=
o:p></o:p></span></p>
<p class=3D"p1"><span lang=3D"EN-US">So, my question: is it reasonable for =
IPMI command ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Reference:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">https://github.com/openbmc/docs=
/blob/master/designs/state-management-and-external-interfaces.md<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tung<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_BL0PR01MB515650923510989237151B70FFFC0BL0PR01MB5156prod_--
