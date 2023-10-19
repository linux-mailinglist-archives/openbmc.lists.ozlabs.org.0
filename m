Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DB7D022F
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 21:03:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yx3CwcnG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBHDn52DKz3dh2
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 06:03:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yx3CwcnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBHDB1KgHz3cRn
	for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 06:03:05 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JIvNKW015047;
	Thu, 19 Oct 2023 19:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=7l6CBAxwX8+jHHVerOItoZQLO0IdqIWEil5wdqsi1tQ=;
 b=Yx3CwcnGNlJUir5S+PUW5raBwU0tyLGJ7rSu5uVa2+/imhGQ4ATbpkI5pbvPqHswHva/
 j4H2RLeOmqu1DkzjREXj3jzklVAVLvNDJTcbSQtXcrOpaDIhwBuNvBC4YvkPFRTm1qnC
 FAp9k8JDjXujddtQwkNwtS8MfF1aNO5lKkyCSZYWndUlStGQlXNHRf8pH4a8zR81PQPc
 a0MYG+93pQEyXbHZJTwTbFt4rbTAYoQO8cnvgiPnQIwKQwBP7hifnUhNgKq7WuvE6Qx/
 3FKE/dmpEi/aGlXB5xUQHaG1jA7QBBdMg4exmHHUTJNupcUtXf98ZwJqgSTlCXIpGIP8 CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tua6er6kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 19:03:02 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JIw4L5017543;
	Thu, 19 Oct 2023 19:02:57 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tua6er5tu-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 19:02:57 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JIcagi027394;
	Thu, 19 Oct 2023 18:43:46 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr5asu3pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 18:43:46 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JIhjwx20906614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 18:43:46 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7CC95805D;
	Thu, 19 Oct 2023 18:43:45 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DA8358059;
	Thu, 19 Oct 2023 18:43:45 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 19 Oct 2023 18:43:45 +0000 (GMT)
Message-ID: <fc831d1a-2d4a-02fb-89c4-f05543159b9b@linux.ibm.com>
Date: Thu, 19 Oct 2023 14:43:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org,
        kwliu@nuvoton.com
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
Subject: QEMU command line for running evb-npcm845 image
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PRxJD0Kgm-oTusICFO9cDAbWcIVvR64X
X-Proofpoint-ORIG-GUID: Do8haoNB6PwM9lhJGUhicpYk0nlvpR2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_18,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 mlxlogscore=887 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310190162
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

Hi!

   I am assuming that running the 64MB image with qemu-system-aarch64 is 
possible somehow, but I wasn't able to run it:

$ /usr/local/bin/qemu-system-aarch64 --version

QEMU emulator version 8.1.2 (v8.1.2)
Copyright (c) 2003-2023 Fabrice Bellard and the QEMU Project developers


I get now output with the following line where I am pasisng size=32M for 
the image, which is probably wrong anyway:

$ /usr/local/bin/qemu-system-aarch64   -machine npcm750-evb -nographic 
-no-reboot    -net nic -net 
user,hostfwd=:127.0.0.1:5722-:22,hostfwd=:127.0.0.1:5743-:443,hostfwd=udp:127.0.0.1:5723-:623 
-drive 
file=./tmp/deploy/images/evb-npcm845/obmc-phosphor-image-evb-npcm845.static.mtd,format=raw,if=mtd,size=32M

qemu-system-aarch64: warning: nic npcm7xx-emc.1 has no peer

CTRL-A + X  terminates it as expected.

With size=64M I don't get very far:

$ /usr/local/bin/qemu-system-aarch64   -machine npcm750-evb -nographic 
-no-reboot    -net nic -net 
user,hostfwd=:127.0.0.1:5722-:22,hostfwd=:127.0.0.1:5743-:443,hostfwd=udp:127.0.0.1:5723-:623 
-drive 
file=./tmp/deploy/images/evb-npcm845/obmc-phosphor-image-evb-npcm845.static.mtd,format=raw,if=mtd,size=64M
qemu-system-aarch64: device requires 33554432 bytes, block backend 
provides 67108864 bytes


$ ls -l 
tmp/deploy/images/evb-npcm845/obmc-phosphor-image-evb-npcm845-20231019170856.static.mtd
-rw-r--r-- 2 stefanb stefanb 67108864 Oct 19 13:41 
tmp/deploy/images/evb-npcm845/obmc-phosphor-image-evb-npcm845-20231019170856.static.mtd


Regards,

    Stefan


