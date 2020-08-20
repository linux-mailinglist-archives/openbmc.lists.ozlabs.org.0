Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D324C54D
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 20:27:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXY5q3hRMzDr3F
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 04:27:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n9O8L4CV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXY4v13t2zDr28
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 04:26:22 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KI1f4l128890; Thu, 20 Aug 2020 14:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Lrd1HkBxfkQXIznwJLSZuh1bu7bdD42AcGg/m2AvE50=;
 b=n9O8L4CVh7vJUGD/68HIDDrjsPudTt3AwXXBNRUKLQn5bNwpyEyzRHXhluk+K+Itaukh
 Kq0FMJPxQZvkh/4H7mSEOSY6j7WuG9aWG5N1Hd6lnfpWxLZ1k3Ij8cwFaMrvMG4e52rM
 O1FPONgqH8+5lsz5CqD4gXlcX9j/ydc55+VIYRbi4fz6QcCFMUAloBHsbusRF78Bo55y
 hOOFGHrWUvYOF5cVZMJ9hxIINkNpg8BepnS8xd0stX9u5BSuzZDzdcjulLhrPPIljgqv
 hzRNyp7NAeOmvhTmVaHwC90juw6ABRAj1z7NWBO765uxk6JOfIVjMUwG1fCoufXnw4e6 zA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 331an71qgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 14:26:18 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KIKfr7023097;
 Thu, 20 Aug 2020 18:26:17 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3304uex7ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 18:26:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07KIQHRm52101626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 18:26:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A1D6C6059;
 Thu, 20 Aug 2020 18:26:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9B4CC6055;
 Thu, 20 Aug 2020 18:26:16 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 20 Aug 2020 18:26:16 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: How to compute the password hash
Message-ID: <027e4c8c-7eb2-2a6f-7544-622369627dac@linux.ibm.com>
Date: Thu, 20 Aug 2020 13:26:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_03:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200142
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

Richard,

Thanks for putting together the OpenBMC user authentication 
presentationand presenting it as part of today's OpenBMC learning series 
event.  Well done!  The following question (paraphrased here) was 
asked.  My answer is below.

- Joseph

Q. How to compute a user account password hash [1] such as the project 
default [2] for my own distro?
A. From my Linux system, I use:
openssl passwd -1 -salt "UGMqyqdG" 0penBmc
$1$UGMqyqdG$FZiylVFmRRfl9Z0Ue8G7e/

Notes:
- The -1 option and the -salt "UGMqyqdG" option were used to get the 
exact result in the project default [2].  You would probably want to use 
sha512 and your own salt.
- The first character of the password is a zero, not a capital O.

[1]: https://en.wikipedia.org/wiki/Passwd
[2]: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/distro/include/phosphor-defaults.inc

