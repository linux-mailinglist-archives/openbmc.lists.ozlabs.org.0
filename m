Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F4282C91
	for <lists+openbmc@lfdr.de>; Sun,  4 Oct 2020 20:36:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4C9F6jpczDqHk
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 05:36:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MabK2CBD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4C8F0HFlzDqGk
 for <openbmc@lists.ozlabs.org>; Mon,  5 Oct 2020 05:35:07 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 094IW8an169391
 for <openbmc@lists.ozlabs.org>; Sun, 4 Oct 2020 14:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=b1tcyTWa1U201vYbRQ2M2bd1L685Gk+AHLIfHoOqBjY=;
 b=MabK2CBD2in56oecF1vPW4v5QF4yvS+VezboW+/pvjWsFKGGsNtt7bHqt8YAfxQXPL3e
 kooRCGnh8Qx8Ajf/b8MMjEfjTyrh0QUg/VFn0VxLpL82EafiSqwtZ1mykxovfefKVnaG
 14UYgzG5rMhh0xI/HuIZHLhBfQVCjP8jC5LgQasP2RP1scBbpLCzf0WhAhgtm5hJ6E9Q
 E4E/7zOjsHAuqFjYWeLa1TLQFcNMRYZglD81lSPWJgea8P5BJYfmbPeAm4B4AFHVzWjl
 Zw/2nTmsNcdWhsE9QEjxXp/RKZPRyVTAdohTiSIF1qFIF9AQ98nEP0KPeuX969WaCIBc dQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ykrn00sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2020 14:35:02 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 4 Oct 2020 18:35:01 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 4 Oct 2020 18:34:59 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020100418345971-284761 ;
 Sun, 4 Oct 2020 18:34:59 +0000 
In-Reply-To: <1ef07be4-6706-5071-f992-acbc43e2116f@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "S.Nishikawa" <nishikawa.shun@gmail.com>
Date: Sun, 4 Oct 2020 18:34:59 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1ef07be4-6706-5071-f992-acbc43e2116f@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 61419
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20100418-3017-0000-0000-0000039B127C
X-IBM-SpamModules-Scores: BY=0.002248; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.347109
X-IBM-SpamModules-Versions: BY=3.00013950; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01444352; UDB=6.00776309; IPR=6.01227044; 
 MB=3.00034383; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-04 18:35:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-04 08:21:30 - 6.00011914
x-cbparentid: 20100418-3018-0000-0000-00006E611521
Message-Id: <OF234E95F2.B6028A9B-ON002585F7.0065286D-002585F7.00661484@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: Re:  LED accessed via I2C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-04_17:2020-10-02,
 2020-10-04 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On October 4, 2020 around 4:05am in some timezone, S.Nishikawa wrote:
>Hi,
>
>In our hardware, the Alert LED is attached to the end of the CPLD and
>is=20
>accessed via I2C. I think phosphor-led-sysfs controls LEDs with GPIO,
>
>but how can I control the LED beyond I2C?


Actually phosphor-led-manager will control any device that has a=20
kernel driver exposing the LED interface.  For PCA i2c devices=20
we tend to expose all the pins as gpio then individual gpios as
gpio led devices because the led subsystem will change the led=20
instance number based on which pins of the package are LED.

It sounds like your cpld has a custom interface.  If the leds
can be controlled via a separate i2c addressed endpoint I would=20
suggest a multi-function device binding using the mfd subsystem.
If it is directly controled by a register consider registering=20
a regmap like many voltage monitor and control devices.  One=20
advantage of regmap is it provides both locking and caching of=20
the values written, controllable on a per-register basis.

You will need a kernel driver for the remaining function that=20
is accessible over the i2c interface.

See https://www.kernel.org/doc/html/latest/leds/leds-class.html#
for information on the kernel LED subsystem.

I hope this gets you headed in a productive direction.
milton

