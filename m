Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4161EED7
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 10:25:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Qn24SD8z3cJn
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 20:25:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=sUdHFekR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.70; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=sUdHFekR;
	dkim-atps=neutral
X-Greylist: delayed 398 seconds by postgrey-1.36 at boromir; Mon, 07 Nov 2022 20:24:38 AEDT
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5QmQ6N64z30NN
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 20:24:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1667813074;
	bh=0s806NWSGhw429nnCNKNGAV5UxO1BypQAKMAiYFtpo0=;
	h=Received:Received:From:To:Subject;
	b=sUdHFekRvMoM4DtdBK40KVwAaMQ0dXGR8cgJJr1cPURvEXdftx+A8gbIsDN9ZFUOk
	 1PkK6mCTjWnk5Fb6rnTFWZTwZqXwheOeNVKNhZLerjqPRuEdLGhFuVB21R7gNC1+Ux
	 z+VZkT4g9x4ZRmMm4rIPnk2r7Co+x+wVoORK3mCk=
Received: (qmail 1528043 invoked from network); 7 Nov 2022 12:17:53 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO INVLT5250ZO)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (DHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 7 Nov 2022 12:17:52 +0300
From: <zehra.ozdemir@inventron.com.tr>
To: <openbmc@lists.ozlabs.org>
Subject: Phosphor State Manager Does Not Work as Expected
Date: Mon, 7 Nov 2022 12:18:00 +0300
Message-ID: <006e01d8f289$d5518340$7ff489c0$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006F_01D8F2A2.FA9FF3C0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjyfMtwVOh5780ZT32Hsjh4nMSnIA==
Content-Language: en-us
X-PPP-Message-ID: <166781267327.1528031.7504650190061730459@ns1.ihsdnsx51.com>
X-PPP-Vhost: inventron.com.tr
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
Cc: "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_006F_01D8F2A2.FA9FF3C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

We are trying to implement phosphor-state-manager to our projects to control
the host. Logs are given down below when we trigger the immediate option
from GUI: 

 

Nov 07 08:53:19 Aselsan-Server phosphor-chassis-state-manager[404]: Change
to Chassis Requested Power State:
xyz.openbmc_project.State.Chassis.Transition.Off
Nov 07 08:53:20 Aselsan-Server systemctl[415]: Job for
obmc-chassis-poweron@0.target canceled.
Nov 07 08:53:20 Aselsan-Server systemd[1]: op-reset-chassis-on@0.service:
Main process exited, code=exited, status=1/FAILURE
Nov 07 08:53:20 Aselsan-Server systemd[1]: op-reset-chassis-on@0.service:
Failed with result 'exit-code'.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Stopped Start chassis0 on after
BMC reset.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice
/system/obmc-led-group-stop.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice
/system/op-power-stop.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice
/system/op-powered-off.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice
/system/op-wait-power-off.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice
/system/phosphor-clear-one-time.
Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice
/system/phosphor-reset-sensor-states.
Nov 07 08:53:21 Aselsan-Server systemd[1]: Created slice Slice
/system/phosphor-set-host-transition-to-off.
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Host0 running
after reset.
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Power0 (On).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Chassis0 power on
after reset.
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Power0 On
(Starting).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Power0 On (Pre).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Multi-User System.
Nov 07 08:53:21 Aselsan-Server phosphor-bmc-state-manager[372]: BMC_READY
Nov 07 08:53:21 Aselsan-Server phosphor-bmc-state-manager[372]: Setting the
BMCState field to xyz.openbmc_project.State.BMC.BMCState.Ready
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Chassis0 (Reset
Check).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Host0 (Reset
Check).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Starting Wait for
/xyz/openbmc_project/control/host0/auto_reboot/one_time...
Nov 07 08:53:21 Aselsan-Server systemd[1]: Reset host sensors was skipped
because of a failed condition check
(ConditionPathExists=!/run/openbmc/host@0-on).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Starting Set host state to
transition to off...
Nov 07 08:53:21 Aselsan-Server systemd[1]: Finished Wait for
/xyz/openbmc_project/control/host0/auto_reboot/one_time.
Nov 07 08:53:21 Aselsan-Server phosphor-host-state-manager[424]: Change to
Host State: xyz.openbmc_project.State.Host.HostState.TransitioningToOff
Nov 07 08:53:21 Aselsan-Server systemd[1]: Starting Reset one-time
properties on chassis off...
Nov 07 08:53:21 Aselsan-Server systemd[1]: Finished Set host state to
transition to off.
Nov 07 08:53:21 Aselsan-Server systemd[1]: Reached target Stop Host0 (Pre).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Reached target Host0 (Stopping).
Nov 07 08:53:21 Aselsan-Server systemd[1]: Reached target Host0 (Stopped).
Nov 07 08:53:22 Aselsan-Server systemd[1]: Reached target Power0 Off (Pre).
Nov 07 08:53:22 Aselsan-Server systemd[1]: Started Stop Power0.
Nov 07 08:53:22 Aselsan-Server systemd[1]: Starting Wait for Power0 to turn
off...
Nov 07 08:53:22 Aselsan-Server systemd[1]:
phosphor-clear-one-time@0.service: Deactivated successfully.
Nov 07 08:53:22 Aselsan-Server systemd[1]: Finished Reset one-time
properties on chassis off. 

 

 

After that, neither Chassis State nor Host State is off. The Chassis State
is On and the Host State is TransitioningToOff. Could you please give us
some information about what could have caused this condition?  


------=_NextPart_000_006F_01D8F2A2.FA9FF3C0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
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
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.E-postaStili17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DTR =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p class=3DMsoNormal>We are =
trying to implement phosphor-state-manager to our projects to control =
the host. Logs are given down below when we trigger the immediate option =
from GUI: <o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:white'>Nov 07 08:53:19 Aselsan-Server =
phosphor-chassis-state-manager[404]: Change to Chassis Requested Power =
State: xyz.openbmc_project.State.Chassis.Transition.Off</span><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D'><=
br><span style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server =
systemctl[415]: Job for obmc-chassis-poweron@0.target =
canceled.</span><br><span style=3D'background:white'>Nov 07 08:53:20 =
Aselsan-Server systemd[1]: op-reset-chassis-on@0.service: Main process =
exited, code=3Dexited, status=3D1/FAILURE</span><br><span =
style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server systemd[1]: =
op-reset-chassis-on@0.service: Failed with result =
'exit-code'.</span><br><span style=3D'background:white'>Nov 07 08:53:20 =
Aselsan-Server systemd[1]: Stopped Start chassis0 on after BMC =
reset.</span><br><span style=3D'background:white'>Nov 07 08:53:20 =
Aselsan-Server systemd[1]: Created slice Slice =
/system/obmc-led-group-stop.</span><br><span =
style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server systemd[1]: =
Created slice Slice /system/op-power-stop.</span><br><span =
style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server systemd[1]: =
Created slice Slice /system/op-powered-off.</span><br><span =
style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server systemd[1]: =
Created slice Slice /system/op-wait-power-off.</span><br><span =
style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server systemd[1]: =
Created slice Slice /system/phosphor-clear-one-time.</span><br><span =
style=3D'background:white'>Nov 07 08:53:20 Aselsan-Server systemd[1]: =
Created slice Slice =
/system/phosphor-reset-sensor-states.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Created slice Slice =
/system/phosphor-set-host-transition-to-off.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Host0 running after reset.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Power0 (On).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Chassis0 power on after reset.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Power0 On (Starting).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Power0 On (Pre).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Multi-User System.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server =
phosphor-bmc-state-manager[372]: BMC_READY</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server =
phosphor-bmc-state-manager[372]: Setting the BMCState field to =
xyz.openbmc_project.State.BMC.BMCState.Ready</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Chassis0 (Reset Check).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Stopped target Host0 (Reset Check).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Starting Wait for =
/xyz/openbmc_project/control/host0/auto_reboot/one_time...</span><br><spa=
n style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Reset host sensors was skipped because of a failed condition check =
(ConditionPathExists=3D!/run/openbmc/host@0-on).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Starting Set host state to transition to off...</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Finished Wait for =
/xyz/openbmc_project/control/host0/auto_reboot/one_time.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server =
phosphor-host-state-manager[424]: Change to Host State: =
xyz.openbmc_project.State.Host.HostState.TransitioningToOff</span><br><sp=
an style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Starting Reset one-time properties on chassis off...</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Finished Set host state to transition to off.</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Reached target Stop Host0 (Pre).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Reached target Host0 (Stopping).</span><br><span =
style=3D'background:white'>Nov 07 08:53:21 Aselsan-Server systemd[1]: =
Reached target Host0 (Stopped).</span><br><span =
style=3D'background:white'>Nov 07 08:53:22 Aselsan-Server systemd[1]: =
Reached target Power0 Off (Pre).</span><br><span =
style=3D'background:white'>Nov 07 08:53:22 Aselsan-Server systemd[1]: =
Started Stop Power0.</span><br><span style=3D'background:white'>Nov 07 =
08:53:22 Aselsan-Server systemd[1]: Starting Wait for Power0 to turn =
off...</span><br><span style=3D'background:white'>Nov 07 08:53:22 =
Aselsan-Server systemd[1]: phosphor-clear-one-time@0.service: =
Deactivated successfully.</span><br><span style=3D'background:white'>Nov =
07 08:53:22 Aselsan-Server systemd[1]: Finished Reset one-time =
properties on chassis off.</span></span> <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>After that, =
neither Chassis State nor Host State is off. The Chassis State is On and =
the Host State is TransitioningToOff. Could you please give us some =
information about what could have caused this condition? =
&nbsp;<o:p></o:p></p></div></body></html>
------=_NextPart_000_006F_01D8F2A2.FA9FF3C0--

