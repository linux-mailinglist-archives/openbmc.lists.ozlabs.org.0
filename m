Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983C43DF827
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 00:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfVf03KJvz3cHv
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 08:58:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ih4eM9JV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ih4eM9JV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfVdh1030z302C
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 08:57:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173MYUUI103750
 for <openbmc@lists.ozlabs.org>; Tue, 3 Aug 2021 18:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=xYrLlXBhnx5jcPxlWl+9FXXTQa43j/bxgNntTt233Tk=;
 b=Ih4eM9JVLZHoy1OCyJjtzeXNCnD5oHgIqr9x9Llct+tmATtg18P3oIAvVSICxrd+OAN2
 /1liTyvLzoealB+7nfps+vKwxqLlCxNzPVxCIcIqB5QSRpLcAjc9e1WPn7WITwkrCOZp
 ujsTlYf6bzrlIFx6gwzJ81bHhNaiKNZO4Lo73VT/C/K4fc0j5H2KS5r3dW7LNZgQyIo4
 HOADmyYR8+gXQ966u03M+12YOymgYb5hYbPKHumh7kQ0LXgM7h6t1ug8WQfhv5vpbhej
 P9kfEhYufWIABsxL/pGIqY+1BmMmeth/W7ec9TjDKZsMQwN6mlgV8Y7CsBjGQu9hsRov 5Q== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7342639k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Aug 2021 18:57:56 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173Mq8LF027906
 for <openbmc@lists.ozlabs.org>; Tue, 3 Aug 2021 22:57:55 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3a7anfsnt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Aug 2021 22:57:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173Mvs7R30277928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 3 Aug 2021 22:57:54 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34E1E78067
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 22:57:54 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D32A87805E
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 22:57:53 +0000 (GMT)
Received: from demeter.local (unknown [9.160.113.180])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 22:57:53 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday August 4
Message-ID: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
Date: Tue, 3 Aug 2021 17:57:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xsds6ddaVIpcQcXfiQVHknQ_5qKEdbrZ
X-Proofpoint-GUID: Xsds6ddaVIpcQcXfiQVHknQ_5qKEdbrZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_05:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=717
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030137
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
scheduled for this Wednesday August 4 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

 1. (Joseph): IBM ACF design (2FA authentication for the special IBM
    service account) is in review -
    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201
    <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201>
 2. (Joseph): Updated password hash algorithm from MD5 to SHA512 (while
    keeping the same cleartext password)
    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214
    <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214>
 3. (Joseph): Change the SSH server per-session idle timeout to an hour
    (was unlimited)?  (Sent idea to upstream project
    yocto-security@yoctoproject.org
    <mailto:yocto-security@yoctoproject.org>.)  Alternatively, update
    both SSH and BMCWeb to 30 minutes.
     1. Guidelines:
         1. NIST SP800-63B requires a timeout of 30 minutes for
            "assurance level 2" (high confidence that the authentication
            is still valid), or 15 minutes for "assurance level 2" (very
            high confidence).
            https://pages.nist.gov/800-63-3/sp800-63b.html
            <https://pages.nist.gov/800-63-3/sp800-63b.html>
         2. OWASP suggests idle timeouts of 15-30 minutes.
            https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration
            <https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration>
     2. Alternatively, use the bash shell’s TMOUT variable?
     3. See Yocto discussion (representative archived email):
        https://lists.yoctoproject.org/g/yocto-security/message/381
        <https://lists.yoctoproject.org/g/yocto-security/message/381>



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
