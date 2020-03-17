Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6541889CC
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 17:07:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hdNl5g1YzDqg4
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 03:07:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hbyD1YWyzDqn4
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 02:02:58 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HF2fFG104972
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 11:02:54 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ytakdvqc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 11:02:45 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HExsaf026331
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 15:01:21 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2yrpw6q6a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 15:01:20 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HF1JDM45547850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 15:01:19 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FC48B205F
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 15:01:19 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A15AB206A
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 15:01:19 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.236.172])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 15:01:19 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: openbmc-specific dynamic security scanner
Message-ID: <d2bdd336-88ee-19f7-9215-2c0ede78e3bb@linux.ibm.com>
Date: Tue, 17 Mar 2020 10:01:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_05:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003170062
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

Team,

The OpenBMC security working group "end of release checklist" [1] calls 
for a report of basic security facts.  I would like to create a dynamic 
scan tool (okay, it's a shell script) to scan a running OpenBMC system 
and report these facts.  It would not reveal any vulnerabilities that 
are not already well-known.  I believe it would not be much of a head 
start to attackers.

Once the tool was published, the idea is to run it on various platforms, 
fix any issues that need fixing (typically tightening a configuration), 
and reporting to the email list so folks could give their opinions for 
the OpenBMC release process [2].

[1]: 
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-end-of-release-checklist
[2]: https://github.com/openbmc/docs/blob/master/release/release-process.md

Tool operation:
The tool would be given an admin account and use that probe the BMC, and 
create additional accounts for Operator and ReadOnly access.
It would report items such as which network services are running, what 
transport layer security is offered, which accounts can access various 
services, what URLs are accessible, etc.
For web access, it can report on HTTP port 80 redirection,  HTTP 
headers, etc.
With access to the BMC's shell, it can report which files are readable, 
writable, and which have sensitive data (like private keys).
In summary, a catalog of OpenBMC security settings.

I realize a tool like this may fall under the test team's province. I 
want this to be *trivial* for someone with limited OpenBMC experience to 
be able to use.  Setting up a robot environment may be a barrier for 
some, and running a shell script to connect to the BMC may be much easier.

I realize there are existing open source scanners.  Once again, I want 
this to be very easy to use, and be customized for OpenBMC.  I would be 
happy to abandon this project if such a scanner meets my needs.  It 
would need to be customized for OpenBMC, and be very easy to use.  If 
that ever happens, the tool I am proposing today would be a good start.

And if you did not already guess, I've already cobbled together a number 
of shell commands for this, so making the script would be relatively easy.

I think the script would help further the security awareness of the project.

And I am looking for your feedback.

- Joseph

