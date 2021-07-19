Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 529FC3CE42D
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 18:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT6nw28smz30J5
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 02:32:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AAlRTkuB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AAlRTkuB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT6nY1T8zz2xVt
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 02:32:16 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JG7J1n052002
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jul 2021 12:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=Y2tSPrAObOHt0WHeEuZHT7U2LQe13cWTCVosZrb53Qg=;
 b=AAlRTkuBzvLStkRWJNcZjk3EhRPl9FSy9esc8jYqDGTYyGc894WbDYTxxEq0Zm2po9P0
 POd2KXzgrFW01TzP3RmuzNS5XnNpv7Kp3RvHXUFy1gCDTAmS4+Le/y6ypL8ms2e+vfgl
 fSiatRP0H/9YsE+/FUT1Vm2daIYna7OYJUP7fmqOaGVwTad9w4ml3cdjBVpd5ak/XDWw
 uRyxjWNuQlqq2JDR/w4hYhW8NY1Fzpf3KccZtin9znO++7/4U7YLJB9wivFzHHgKPVuA
 iH5JpGJj04pnRbomx8OJO8ePLaBYvGB4XttmUGXli5JjWjX0UYMbOsX/Y5+MTSUDPKyb vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39wbatbm5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jul 2021 12:32:14 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JG7hho053544
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jul 2021 12:32:13 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39wbatbm50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 12:32:13 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JGIZoY005716;
 Mon, 19 Jul 2021 16:32:13 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 39upuaw1m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 16:32:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JGWC9D10748634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 16:32:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69BFDAE060;
 Mon, 19 Jul 2021 16:32:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CE87AE06D;
 Mon, 19 Jul 2021 16:32:12 +0000 (GMT)
Received: from mww0331.wdc07m.mail.ibm.com (unknown [9.208.69.64])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Jul 2021 16:32:12 +0000 (GMT)
In-Reply-To: <CAHf5cscRkiCHw9HmJncTuA9E1dZDmEYTvkhkH4dF-nZcpEDnaA@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Mon, 19 Jul 2021 16:32:10 +0000
Message-ID: <OF1CACA46F.E7A76D40-ON00258717.00595632-00258717.005AD638@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAHf5cscRkiCHw9HmJncTuA9E1dZDmEYTvkhkH4dF-nZcpEDnaA@mail.gmail.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0331/01/M/IBM at 07/19/2021 16:32:10,
 Serialize complete at 07/19/2021 16:32:10
X-Disclaimed: 49323
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LPkv0B4SF5d5BJfpk8COXi6YeeXY8Ywl
X-Proofpoint-ORIG-GUID: MKQOlGXFUyH6tOQoGAiFDAjz2vagstft
Subject: Re:  AST2600: Linux driver support for SPI controller
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_07:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190093
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

On July 19, 2021,  VINOTHKUMAR RK wrote:
>Hello all,
>
>This is regarding SPI controller driver support in OpenBMC.
>Here is the scenario: Three devices connected over same SPI
>controller as mentioned below:
>
>Firmware SPI Memory Controller (BSPI): (0x1E620000):
>    - Flash 0 (CS0)
>    - Flash 1 (CS1)
>    - MCU/CPLD (CS2)
>
>When I look at the OpenBMC Linux repository, I could find
>'aspeed-smc.c' driver under the MTD subsystem, so this seems to work
>only for flash devices.
>
>Do we've any other driver support or a solution to handle all the
>three devices? Any help/suggestions would be appreciated.

I was involved with the driver you found before Cedric took it=20
over.

I am not aware of anyone writing a generic SPI acccess driver.  =20
The hardwaredoes have a user mode that does not auto-sequence, but=20
as I remember its limited in that it can not read and write data=20
at the same time and is limited to transfers that are multiples of=20
a byte.

If your MCU/CPLD can live with these limitations then you or=20
someone can integrate a spi layer driver into the current=20
driver.

Note on the 2600 the hardware for the host is the same as the=20
hardware for the BMC.  It may be easier to develop spi mode on=20
that port because it could be developed while running with the=20
BMC from existing driver.  Alternatively it could be developed=20
on a system that runs on eMMC.

Milton

