Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33428253B44
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 03:03:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcPcW296KzDqRZ
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 11:03:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=DgajO8FQ; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=KFyGZd/y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcPbF6RkgzDqT3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 11:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598490148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ono4VG/RJc21m4OGyAAs0DrjyG1X+jsKnsfUnpr3JHw=;
 b=DgajO8FQcQkvOISXiMRqjkn1ztDCWLwmZXwNk/Z4be2ieOUABmmLoOjsdk7qSobQ/YFlAS
 AJMQlC5pLqry7Mul/VWXA2LT6dd6p885W5pxYtqJFJNrSjf3uFy5npY1AopLXRu9BI6M4R
 j+0N+eLNkl7crC3JsUUggSzaNlTjHMY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598490149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ono4VG/RJc21m4OGyAAs0DrjyG1X+jsKnsfUnpr3JHw=;
 b=KFyGZd/yM+jssCB71k6cirisYmMIAZTxqXmLSDj3u6I8UTXdTnHCeyPSGQLA8xXzZzKxbt
 POQyRWFv3mc3nxIMovrewcQUn9xezBJRA8HvFQ78Xe2cvuHmWCUdTc3xRXFrYyIvZk+7W+
 p6I47o8zb2yzDrXamo0EipRYoDjS9SY=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-lZVMX4rfMZOnsnBezwSjrg-1; Wed, 26 Aug 2020 16:59:44 -0400
X-MC-Unique: lZVMX4rfMZOnsnBezwSjrg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 26 Aug 2020 13:59:42 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 26 Aug 2020 13:59:42 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Wolf Pass power control
Thread-Topic: Wolf Pass power control
Thread-Index: AdZ76wXe6ZRJj1IsQp6DZ978z35f+A==
Date: Wed, 26 Aug 2020 20:59:41 +0000
Message-ID: <d1424ec1cf3e44b4ac9c0e0d71e2425e@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_d1424ec1cf3e44b4ac9c0e0d71e2425eSCLEXCHMB13phoenixcom_"
Content-Language: en-US
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

--_000_d1424ec1cf3e44b4ac9c0e0d71e2425eSCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I'm working on a Wolf Pass build for Phoenix and am having issues with powe=
r control.  I believe I've got all the GPIOs setup correctly and the power-=
control service is running.  It asserts POWER_OUT but it's timing out waiti=
ng for PS_PWROK assertion.

As far as I can tell, those GPIOs are setup exactly like it's setup on the =
IntelBMC version.  Is there anything that jumps out at you here that I migh=
t look at next?  I'm not sure why asserting POWER_OUT wouldn't cause a powe=
r up sequence to occur.

## Current behavior of my wolf pass build at power on request
Jan 01 00:02:42 wolfpass power-control[224]: powerStateFailedTransitionToOn=
: power-on request event received
Jan 01 00:02:42 wolfpass power-control[224]: power supply power OK watchdog=
 timer started
Jan 01 00:02:42 wolfpass power-control[224]: Moving to "Wait for Power Supp=
ly Power OK" state
Jan 01 00:02:42 wolfpass power-control[224]: POWER_OUT set to 0
Jan 01 00:02:42 wolfpass power-control[224]: Error in finding CurrentHostSt=
ate property
Jan 01 00:02:42 wolfpass power-control[224]: POWER_OUT released
Jan 01 00:02:50 wolfpass power-control[224]: power supply power OK watchdog=
 timer expired
Jan 01 00:02:50 wolfpass power-control[224]: powerStateWaitForPSPowerOK: po=
wer supply power OK watchdog timer expired event received
Jan 01 00:02:50 wolfpass power-control[224]: Moving to "Failed Transition t=
o On" state
Jan 01 00:02:50 wolfpass power-control[224]: PowerControl: power supply pow=
er good failed to assert

## Example of good power on sequence from IntelBMC
Aug 26 11:43:34 power-control[236]: powerStateOff: power-on request event r=
eceived.
Aug 26 11:43:34 power-control[236]: power supply power OK watchdog timer st=
arted
Aug 26 11:43:34 power-control[236]: Moving to "Wait for Power Supply Power =
OK" state.
Aug 26 11:43:34 power-control[236]: POWER_OUT set to 0
Aug 26 11:43:34 power-control[236]: Error in finding CurrentHostState prope=
rty
Aug 26 11:43:34 power-control[236]: POWER_OUT released
Aug 26 11:43:34 power-control[236]: powerStateWaitForPSPowerOK: SIO S5 de-a=
ssert event received.
Aug 26 11:43:34 power-control[236]: No action taken.
Aug 26 11:43:34 power-control[236]: SIO_ONCONTROL value changed: 0
Aug 26 11:43:34 power-control[236]: powerStateWaitForPSPowerOK: power suppl=
y power OK assert event received.
Aug 26 11:43:34 power-control[236]: SIO power good watchdog timer started
Aug 26 11:43:34 power-control[236]: Moving to "Wait for SIO Power Good" sta=
te.
Aug 26 11:43:34 power-control[236]: power supply power OK watchdog timer ca=
nceled
Aug 26 11:43:35 power-control[236]: powerStateWaitForSIOPowerGood: SIO powe=
r good assert event received.
Aug 26 11:43:35 power-control[236]: Moving to "On" state.
Aug 26 11:43:35 power-control[236]: Host system DC power is on
Aug 26 11:43:35 power-control[236]: SIO power good watchdog timer canceled
Aug 26 11:43:35 power-control[236]: POH timer started
Aug 26 11:43:35 power-control[236]: powerStateOn: SIO power good de-assert =
event received.
Aug 26 11:43:35 power-control[236]: No action taken.
Aug 26 11:43:35 power-control[236]: powerStateOn: SIO power good assert eve=
nt received.
Aug 26 11:43:35 power-control[236]: No action taken.
Aug 26 11:44:32 power-control[236]: powerStateOn: POST Complete assert even=
t received.
Aug 26 11:44:32 power-control[236]: No action taken.

--_000_d1424ec1cf3e44b4ac9c0e0d71e2425eSCLEXCHMB13phoenixcom_
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
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal">I&#8217;m working on a Wolf Pass build for Phoenix a=
nd am having issues with power control.&nbsp; I believe I&#8217;ve got all =
the GPIOs setup correctly and the power-control service is running.&nbsp; I=
t asserts POWER_OUT but it&#8217;s timing out waiting for PS_PWROK
 assertion.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As far as I can tell, those GPIOs are setup exactly =
like it&#8217;s setup on the IntelBMC version.&nbsp; Is there anything that=
 jumps out at you here that I might look at next?&nbsp; I&#8217;m not sure =
why asserting POWER_OUT wouldn&#8217;t cause a power up sequence
 to occur.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">## Current behavior of my wolf pass build at power o=
n request<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:42 wolfpass power-control[224]: powerSt=
ateFailedTransitionToOn: power-on request event received<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:42 wolfpass power-control[224]: power s=
upply power OK watchdog timer started<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:42 wolfpass power-control[224]: Moving =
to &quot;Wait for Power Supply Power OK&quot; state<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:42 wolfpass power-control[224]: POWER_O=
UT set to 0<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:42 wolfpass power-control[224]: Error i=
n finding CurrentHostState property<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:42 wolfpass power-control[224]: POWER_O=
UT released<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:50 wolfpass power-control[224]: power s=
upply power OK watchdog timer expired<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:50 wolfpass power-control[224]: powerSt=
ateWaitForPSPowerOK: power supply power OK watchdog timer expired event rec=
eived<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:50 wolfpass power-control[224]: Moving =
to &quot;Failed Transition to On&quot; state<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:02:50 wolfpass power-control[224]: PowerCo=
ntrol: power supply power good failed to assert<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">## Example of good power on sequence from IntelBMC<o=
:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: powerStateOff: p=
ower-on request event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: power supply pow=
er OK watchdog timer started<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: Moving to &quot;=
Wait for Power Supply Power OK&quot; state.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: POWER_OUT set to=
 0<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: Error in finding=
 CurrentHostState property<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: POWER_OUT releas=
ed<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: powerStateWaitFo=
rPSPowerOK: SIO S5 de-assert event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: No action taken.=
<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: SIO_ONCONTROL va=
lue changed: 0<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: powerStateWaitFo=
rPSPowerOK: power supply power OK assert event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: SIO power good w=
atchdog timer started<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: Moving to &quot;=
Wait for SIO Power Good&quot; state.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:34 power-control[236]: power supply pow=
er OK watchdog timer canceled<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: powerStateWaitFo=
rSIOPowerGood: SIO power good assert event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: Moving to &quot;=
On&quot; state.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: Host system DC p=
ower is on<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: SIO power good w=
atchdog timer canceled<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: POH timer starte=
d<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: powerStateOn: SI=
O power good de-assert event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: No action taken.=
<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: powerStateOn: SI=
O power good assert event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:43:35 power-control[236]: No action taken.=
<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:44:32 power-control[236]: powerStateOn: PO=
ST Complete assert event received.<o:p></o:p></p>
<p class=3D"MsoNormal">Aug 26 11:44:32 power-control[236]: No action taken.=
<o:p></o:p></p>
</div>
</body>
</html>

--_000_d1424ec1cf3e44b4ac9c0e0d71e2425eSCLEXCHMB13phoenixcom_--

