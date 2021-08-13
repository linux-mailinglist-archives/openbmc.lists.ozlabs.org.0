Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB123EBD7C
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 22:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gmb3s1JBHz3bsp
	for <lists+openbmc@lfdr.de>; Sat, 14 Aug 2021 06:38:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fd7RZHBx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fd7RZHBx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gmb3P3fPlz3bYW
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 06:37:53 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DKXtsI070564; Fri, 13 Aug 2021 16:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SyI0s/CXxCeZd7n+uej0w07UFfdAavXMYmEQHmzDIQA=;
 b=fd7RZHBxhqpA6CgdjnQoBzi3dtOcYElmXOsFwhBCFAwubdqZ0np18osR7CaWG4m0FXKi
 K5bPncujlqOyfj5ldMa2NMSGmIEotwFF5dzB5xG/t8nZhpJlDWI5AX9q68IsaJsuB+zU
 bl7Pg2FZxc/6Io9Uk1MKVYIu2wvhjV8j92TsrEf0uj1Wmcgn7tggQViV/uyldR/nS6Qg
 Op8xgRkWrjRQMOiSaXLFvLSa85nKdPxpKhoNzIqNhaus/pk8Z6GBLuRXOhhI6xs+L4+y
 DEM4XTpDJuPmugBdS8ZI20YGAhmcSclDVA81l9iwpXiMuXPn/JiGcGSDqFC3oAfQrp3U QA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3adsf42sqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 16:37:48 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17DKXX4W025534;
 Fri, 13 Aug 2021 20:37:47 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3a9hthujd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 20:37:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17DKbkQm48562684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 20:37:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69153AC05E;
 Fri, 13 Aug 2021 20:37:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CB1AAC060;
 Fri, 13 Aug 2021 20:37:46 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.133.120])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 Aug 2021 20:37:45 +0000 (GMT)
Message-ID: <2a3bac9bb3c85791a0b2d988020917f7609a7097.camel@linux.ibm.com>
Subject: AST2500 video engine for KVM trips BMC watchdog
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 13 Aug 2021 15:37:45 -0500
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zjsPYpIpvg7tTlJjKPB2HmQyg6obFgFK
X-Proofpoint-GUID: zjsPYpIpvg7tTlJjKPB2HmQyg6obFgFK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-13_08:2021-08-13,
 2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130117
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm trying to solve a problem when the screensaver on the host is
activated. It seems to continually trigger the mode detection interrupt
on the BMC. In combination with the user-space application continually
trying to determine the resolution, it trips the BMC kernel watchdog
and resets the system. Here are the logs I've captured:

[ 2049.076692] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2050.091133] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2051.121593] aspeed-video 1e700000.video: Timed out when stopping
streaming
[ 2052.121203] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2052.393164] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2052.399561] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2053.343096] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2053.350151] aspeed-video 1e700000.video: Engine busy; don't start
frame
[ 2054.361159] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2054.609677] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2054.615983] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2055.409583] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2055.432802] aspeed-video 1e700000.video: No signal; don't start
frame
[ 2056.421155] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2056.676215] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2056.682516] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2057.459454] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2057.480919] aspeed-video 1e700000.video: No signal; don't start
frame
[ 2058.471187] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2058.726108] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2058.732382] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2059.526704] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2059.548747] aspeed-video 1e700000.video: No signal; don't start
frame
[ 2060.541146] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2060.792620] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2060.798801] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2061.592870] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2061.615523] aspeed-video 1e700000.video: No signal; don't start
frame
[ 2062.611126] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2062.859185] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2062.865483] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2063.659056] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2063.680423] aspeed-video 1e700000.video: No signal; don't start
frame
[ 2064.671148] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2064.925696] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2064.931949] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2065.708903] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2065.716196] aspeed-video 1e700000.video: Engine busy; don't start
frame
[ 2066.721161] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2066.975563] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2066.981842] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2067.758808] aspeed-video 1e700000.video: Resolution changed;
resetting
[ 2067.766511] aspeed-video 1e700000.video: Engine busy; don't start
frame
[ 2068.771128] aspeed-video 1e700000.video: Timed out; first mode
detect
[ 2069.025462] aspeed-video 1e700000.video: Got resolution: 1024x768
[ 2069.031803] aspeed-video 1e700000.video: Max compressed size: 80000
[ 2069.808665] aspeed-video 1e700000.video: Resolution changed;
resetting

Jae, or anyone else, do you have any ideas to solve this? I'm surprised
it's enough to stop pinging the watchdog, but that is what happens...

Thanks,
Eddie

