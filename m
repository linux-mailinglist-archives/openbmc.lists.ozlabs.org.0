Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79B1CF99B
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 17:49:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M2LF44w3zDqhC
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 01:49:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49M2KR4JHnzDqdW
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 01:48:59 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CFaJY6192769
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 11:48:56 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ws5bgv8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 11:48:56 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04CFk2E1030407
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 15:48:56 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 30wm56ae5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 15:48:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04CFmt6e51970436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 15:48:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4B48112061
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 15:48:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B6F5112062
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 15:48:55 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 15:48:55 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Requirements for crypto deprecation?
Message-ID: <6060cbc2-2af5-2de5-929a-81ea1703e32f@linux.ibm.com>
Date: Tue, 12 May 2020 10:48:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_04:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=534
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005120115
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

Ping.  Does anyone have requirements for a BMC admin to be able to 
disable cryptographic algorithms that help provide transport layer 
security (TLS) for network traffic?  For example, if 
ECDHE-ECDSA-AES256-GCM-SHA384 was broken [1], do we need a way to 
disable it for HTTPS in operational BMCs?

Note: The list of supported algorithms is compiled into the BMC's 
firmware image [2][3] and cannot be changed by an admin or shell 
commands; it requires reconfiguration of the source code and a the BMC 
be updated with a new firmware image.

Is there interest in adding this function, knowing the fallback option 
is to update the firmware?

- Joseph

[1]: I am not saying or even hinting this is broken. ;-)
[2]: 
https://github.com/openbmc/bmcweb/blob/0185c7f163a850216437be23111e2bfdd874cd11/include/ssl_key_handler.hpp#L336
[3]: Similar compile-time config for dropbear SSH server.

