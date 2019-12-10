Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC2C117D2B
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 02:29:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X2YB4zfBzDqVL
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 12:29:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X2XM6tp6zDqTJ
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 12:29:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA1Mfr1103342
 for <openbmc@lists.ozlabs.org>; Mon, 9 Dec 2019 20:29:05 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrt1yupny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 20:29:05 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBA1K8KE025182
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 01:29:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 2wr3q67e3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 01:29:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA1T3UD10944982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 01:29:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DF4D7805E
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 01:29:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A3FA78064
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 01:29:02 +0000 (GMT)
Received: from demeter.local (unknown [9.85.130.38])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 01:29:02 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting Wednesday December 11
Message-ID: <d402bdde-8614-04d3-426d-a704efde5ca8@linux.ibm.com>
Date: Mon, 9 Dec 2019 19:29:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_05:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100011
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday December 11 at 10:00am PDT.

We'll discuss current development items, and anything else that comes 
up.  The current topics:

 1.

    BMCWeb patch to allow BMC admin to disable authentication
    methods<https://github.com/openbmc/bmcweb/commit/78158631aeab5b77ea9a5f566508285cb839fadf>

 2.

    Gerrit code review to “Provide feedback from Linux PAM about why the
    new password is not accepted”
    <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27503>

 3.

    Gerrit code review to “lockout a user account for 5 minutes after 5
    login failures”

 4.

    Gerrit code review to implement the Refish ConfigureSelf privilege
    correctly, which lets non-admin users change their own password and
    log out of their own sessions.

 5.

    Email about TFTP vulnerabilities and SCP or SFTP
    replacement<https://lists.ozlabs.org/pipermail/openbmc/2019-December/019725.html>

 6.

    Trivial PAM bmcweb config file change


Access, agenda, and notes are in the wiki:

https://github.com/openbmc/openbmc/wiki/Security-working-group

- Joseph
