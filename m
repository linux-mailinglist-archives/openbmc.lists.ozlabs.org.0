Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E12D1C700D
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 14:12:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HFpZ5Df0zDqcq
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 22:12:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HFnj6DrfzDqTs
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 22:11:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 046C21WN100799
 for <openbmc@lists.ozlabs.org>; Wed, 6 May 2020 08:11:51 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8t03nyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 08:11:51 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 6 May 2020 12:11:50 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 6 May 2020 12:11:46 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020050612114622-442082 ;
 Wed, 6 May 2020 12:11:46 +0000 
In-Reply-To: <22969cf5.2743.171e7d8e7e2.Coremail.lemon_zhang555@163.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: hgfcc <lemon_zhang555@163.com>
Date: Wed, 6 May 2020 12:11:46 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <22969cf5.2743.171e7d8e7e2.Coremail.lemon_zhang555@163.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 13759
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20050612-1335-0000-0000-000003E325EA
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.001479
X-IBM-SpamModules-Versions: BY=3.00013041; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000294; SDB=6.01372789; UDB=6.00733561; IPR=6.01155144; 
 MB=3.00032032; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-06 12:11:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-06 06:22:39 - 6.00011327
x-cbparentid: 20050612-1336-0000-0000-0000C96027B7
Message-Id: <OFBF9496AD.E456332F-ON00258560.0042FED8-00258560.0042FEE0@notes.na.collabserv.com>
Subject: Re:  use the LTC2990 monitors the temperature
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_04:2020-05-05,
 2020-05-06 signatures=0
X-Proofpoint-Spam-Reason: safe
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

On May 5, 2020 abou 9:39PM in some timezone, hgfcc <lemon=5Fzhang555@163.co=
m> wrote:

>Hello, I use the LTC2990 to monitor the motherboard temperature. But
>the LTC2990 has four monitoring pins. How can I configure it to
>specify which pin I use. For example, I only used the second and
>third pins.

The configuration of the LTC2990 is set in the device tree, see the=20
binding document in the kernel:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/hwmon/ltc2990.txt

However, when I look at the datasheet, I see any way to use only=20
pins 2 and 3.  You can skip the measurements of pins 1 and 2 or
pins 3 and 4 or just the internal measurements.

milton


