Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E233250B7A
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 00:14:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb5xn3gPKzDqRf
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:14:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ieGTJsJf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb5tG0XbSzDqPM
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 08:11:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OM1d3s148238; Mon, 24 Aug 2020 18:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=13bxb9ebEWMcHJYY9hA64Dk90P+7HvrKNKmly4Vpv+U=;
 b=ieGTJsJfiFdaK8Ny4go1R1Jxa/d2QD1O8hcW8k9j5bATmNyL00En6Tq77dmVA8P7N/yi
 ZRCRBCV1J+SIDm8HmaRi1QVDMeqRPjQHq04rtTbDt8FiZ131aw9pxBxPG1yZOMiwJdSs
 OGwG+PcdVGTizJ85heX3T6goP0DxvgUzOaeXR74AbKexXcVT/LnklFen57jOG+5R6Bzq
 xZ2/svj1ah8MLIg+myhvqu0lt67gFD7U+S7bIMDWYRlSNCHAnCMCSYqaWsVcbN8qM1Me
 +l5BolWw/eCYbXD6bHybA0FrdcGKkoYaH7jrB2J0nkO1V0pYy3IvLfGe22Q23VgUaZd0 8w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 334m6jugdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 18:10:54 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07OM3niM018277;
 Mon, 24 Aug 2020 22:10:53 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 332utu1u15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 22:10:53 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07OMAqfU50725332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 22:10:52 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC0B912408E;
 Mon, 24 Aug 2020 22:10:52 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59C09124091;
 Mon, 24 Aug 2020 22:10:52 +0000 (GMT)
Received: from SHADE6A.ibmmodules.com (unknown [9.211.49.145])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Aug 2020 22:10:52 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 0/4] AST2600 clock and FSI: Add APLL to control
 FSI clock
Date: Mon, 24 Aug 2020 17:10:47 -0500
Message-Id: <20200824221051.47972-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=1 mlxlogscore=524 spamscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240170
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add functionality to control the APLL clock on the AST2600. The APLL provides
the clock for the FSI master on the AST2600. Then add a devicetree property to
set the AST2600 FSI master clock frequency.

Eddie James (4):
  clk: ast2600: Add functionality to the APLL clock
  dt-bindings: fsi: Aspeed master: Add clock-frequency property
  fsi: Aspeed master: Set clock frequency from devicetree
  ARM: dts: Aspeed: Rainier: Set FSI clock frequency

 .../bindings/fsi/fsi-master-aspeed.txt        |   1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   1 +
 drivers/clk/clk-ast2600.c                     | 177 ++++++++++++++++--
 drivers/fsi/fsi-master-aspeed.c               |   6 +
 include/dt-bindings/clock/ast2600-clock.h     |   1 +
 5 files changed, 174 insertions(+), 12 deletions(-)

-- 
2.26.2

