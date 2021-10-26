Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E041B43B8AD
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 19:56:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdzyR5r4Xz2yP7
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 04:55:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cYy9bhsh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cYy9bhsh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdzxw2CVbz2x9T
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 04:55:31 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QFjjV7027018; 
 Tue, 26 Oct 2021 17:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=kkKzT3g9VbU2RsY74dgcmeqLbPy1F8ggp/fzs9mPp38=;
 b=cYy9bhshd/dltOuhfbIklMiRl8XHMDwUYBxoDWd3Xnoivf/3742DIZ7FP2fsmn4UKf53
 qqkBOM4UryTm/kurNgy5zEdAfa76IdNLFuXz5mdww963/fSBziKDxWEwilkPzaAUXEj8
 UTxDpiCBOIv3O04j3DtwXjKgwKJZm55CP1dfLP74oMfBCgqlBFesXDOqqqvy74bt6xDJ
 3wlCNrRboboXDhV6w89mgmLKMlYfLcbPuufmF+Pon8wxvBTu/wEMK+aW4QMiflOswtMD
 IOrNkB5hzGAAYc5mWoEPUJesQFciF/7bxFEzY0XEOVqWMnLfVyNLly9X0aXkV8OvqYTK uQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bx5978qf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 17:55:28 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QHpoUY015238;
 Tue, 26 Oct 2021 17:55:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3bx4efhrfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 17:55:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QHtQZ432702926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 17:55:26 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF154B2064;
 Tue, 26 Oct 2021 17:55:26 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913B9B2067;
 Tue, 26 Oct 2021 17:55:26 +0000 (GMT)
Received: from mww0331.wdc07m.mail.ibm.com (unknown [9.208.69.64])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 26 Oct 2021 17:55:26 +0000 (GMT)
In-Reply-To: <2f488f5e7e1140369a3663679bddd673@yadro.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Date: Tue, 26 Oct 2021 17:55:24 +0000
Message-ID: <OF324F0F03.50C28783-ON0025877A.00618017-0025877A.00627501@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <2f488f5e7e1140369a3663679bddd673@yadro.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF117   October 6, 2021
X-MIMETrack: Serialize by http on MWW0331/01/M/IBM at 10/26/2021 17:55:24,
 Serialize complete at 10/26/2021 17:55:24
X-Disclaimed: 19451
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3fRMo2wrsyOFTRdpjjJa4OW-bNTLFrTS
X-Proofpoint-GUID: 3fRMo2wrsyOFTRdpjjJa4OW-bNTLFrTS
Subject: Re:  Blinking of the paired LEDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260096
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><font face=3D"Verdana, Arial, Helvetica, sans-serif">On October 26, =
2021, Alexander A. Filippov wrote:</font><br><br><div style=3D""><font face=
=3D"Verdana, Arial, Helvetica, sans-serif">&gt;We have green-red paired LED=
s on our hardware. In SysFS they present</font><br><font face=3D"Verdana, A=
rial, Helvetica, sans-serif">&gt;as a pair of standalone LED. </font><br><f=
ont face=3D"Verdana, Arial, Helvetica, sans-serif">&gt;And we switch the di=
fferent color in different cases using separate</font><br><font face=3D"Ver=
dana, Arial, Helvetica, sans-serif">&gt;LED groups in the phosphor-led-mana=
ger that turns corresponding</font><br><font face=3D"Verdana, Arial, Helvet=
ica, sans-serif">&gt;physical LEDs.</font><br><font face=3D"Verdana, Arial,=
 Helvetica, sans-serif">&gt;</font><br><font face=3D"Verdana, Arial, Helvet=
ica, sans-serif">&gt;One of those LED groups turning on the such LED to the=
 yellow</font><br><font face=3D"Verdana, Arial, Helvetica, sans-serif">&gt;=
blinking by setting the blink mode on the both physical LED. But</font><br>=
<font face=3D"Verdana, Arial, Helvetica, sans-serif">&gt;sometimes these ph=
ysical LEDs turn with a little time lag. This leads</font><br><font face=3D=
"Verdana, Arial, Helvetica, sans-serif">&gt;to the blinking of the four sta=
tes: green (short) -&gt; yellow (long)-&gt;</font><br><font face=3D"Verdana=
, Arial, Helvetica, sans-serif">&gt;red (short) -&gt; off(long).</font><br>=
<font face=3D"Verdana, Arial, Helvetica, sans-serif">&gt;</font><br><font f=
ace=3D"Verdana, Arial, Helvetica, sans-serif">&gt;I believe this occurs whe=
n there is a some traffic through D-Bus</font><br><font face=3D"Verdana, Ar=
ial, Helvetica, sans-serif">&gt;(e.g. during the host starting) and LED man=
ager can't set the</font><br><font face=3D"Verdana, Arial, Helvetica, sans-=
serif">&gt;physical LEDs mode synchronously.</font><br><font face=3D"Verdan=
a, Arial, Helvetica, sans-serif">&gt;</font><div style=3D"font-family: Verd=
ana, Arial, Helvetica, sans-serif;"><br></div><div style=3D"font-family: Ve=
rdana, Arial, Helvetica, sans-serif;">I thought we were using the kernel bl=
ink, which is implemented&nbsp;</div><div style=3D"font-family: Verdana, Ar=
ial, Helvetica, sans-serif;">with kernel timers.&nbsp; Yes we do:</div><div=
 style=3D"font-family: Verdana, Arial, Helvetica, sans-serif;"><br></div><d=
iv style=3D"font-family: Verdana, Arial, Helvetica, sans-serif;"><a href=3D=
"https://github.com/openbmc/phosphor-led-sysfs/blob/ff26c8ecb828d3afbb21308=
1283342c354dcbc79/physical.cpp#L33" target=3D"=5Fblank" rel=3D"noopener nor=
eferrer">https://github.com/openbmc/phosphor-led-sysfs/blob/ff26c8ecb828d3a=
fbb213081283342c354dcbc79/physical.cpp#L33</a></div><div style=3D"font-fami=
ly: Verdana, Arial, Helvetica, sans-serif;"><br>&gt;And I see nothing bette=
r than trying to combine the<br>&gt;phosphor-ledcontroller instances into o=
ne process and probably to<br>&gt;implement the method for setting the prop=
erties with one D-Bus call.<br>&gt;<br>&gt;Does anybody have suggestions ab=
out any better solution?<div><br></div><div>I'd suggest going a level highe=
r by defining the LED to the kernel&nbsp;</div><div>as single instance of t=
he multi-color led class.&nbsp; While the class is&nbsp;</div><div>describe=
d for full RGB controls, I believe a red green led controlled&nbsp;</div><d=
iv>by 2 gpios in one bank is well within both the LED and GPIO&nbsp;</div><=
div>kernel specifications (I don't know if you have chosen gpios</div><div>=
in the same bank or even if you are using gpios to control it).</div><div><=
br></div><div><br></div><div><div><font face=3D"Verdana, Arial, Helvetica, =
sans-serif"><a href=3D"https://github.com/openbmc/linux/blob/dev-5.10/Docum=
entation/leds/leds-class-multicolor.rst" target=3D"=5Fblank" rel=3D"noopene=
r noreferrer">https://github.com/openbmc/linux/blob/dev-5.10/Documentation/=
leds/leds-class-multicolor.rst</a></font><br></div><div><br></div></div><di=
v><br></div></div><div style=3D"font-family: Verdana, Arial, Helvetica, san=
s-serif;">You may have to enhance the led manager to add the additional</di=
v><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif;">attrib=
utes of this class.</div><div style=3D"font-family: Verdana, Arial, Helveti=
ca, sans-serif;"><br></div><div style=3D"font-family: Verdana, Arial, Helve=
tica, sans-serif;">milton</div></div></font><BR>
<BR>
