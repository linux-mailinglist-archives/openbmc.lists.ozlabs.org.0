Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58D19C8FD
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 20:45:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tX7V0fCczDqt0
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 05:45:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tX6p2Z1kzDrMD
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 05:44:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032IfLAN079525
 for <openbmc@lists.ozlabs.org>; Thu, 2 Apr 2020 14:44:47 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 305emf604g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Apr 2020 14:44:47 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032IZudt014934
 for <openbmc@lists.ozlabs.org>; Thu, 2 Apr 2020 18:44:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 301x77323y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Apr 2020 18:44:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032Iiksi44564882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 2 Apr 2020 18:44:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 139ED112062
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 18:44:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDB5E112061
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 18:44:45 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.171.253])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 18:44:45 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 1 - highlights
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
Message-ID: <8e3e13eb-e974-4d32-ac01-074a1d4eb75a@linux.ibm.com>
Date: Thu, 2 Apr 2020 13:44:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_08:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=958 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020138
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

On 3/31/20 11:21 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday April 1 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> The current topics:
>
> 1. SELinux or AppArmor plans

Topic 1 has three points:
1a. We would also want to move away from all processes running as root. 
https://github.com/openbmc/openbmc/issues/3383  Next step is create 
issue for each repo.
1b. A next step is to determine criteria for selecting SELinux or 
AppArmor.  What direction should the project go?
1c. There is continued interest, but no active work on this.  Next step: 
Followup with email.


Topic 2 was added:  Admin-controlled security settings -- Discuss plans 
for BMC admin-controlled security settings.  Access per NIC. Disable 
ipmi cipher 3.
This topic was discussed recently by the Web design who have access to 
user feedback.

See IBM’s plans here: https://github.com/ibm-openbmc/dev/issues/612.
- Issue 612 does not quite cover all the items.  There are a few changes 
and clarifications from issue 612 .

The group discussed how a BMC admin can control access to the BMC via 
its network in terms of the following areas.
More details are in the minutes (link below).

1. The admin can control each NIC individually.  Example: data-center 
wide network, vs, private management network.     The admin can control 
which network interface the BMC brings up.

2. We would like to be able to control which services are available on a 
per-NIC basis.  For example, REST APIs to directly model if service X is 
accessible from network Y.   Then we can, for example, provide IPMI 
RMCP+ service to a private network but not to the data-center-wide network.
We don't have this mechanism, but individual services may be able to 
discriminate based on ingress network.
I this the direction toward a solution remains open.
For the near team (this year), we’ll work on allowing the admin to 
disable and enable services.  For example, the admin can disable SSH and 
IPMI RMCP+, but will not have the capability offer RMCP+ to a network A 
but not network B.

3. We would like to allow the admin to enable or disable bridges like 
KCS or BT, and also protocols over thosse bridges such as IPMB.
(However, my understanding this this area is very limited.  Please 
contribute your understanding.)

4. We want to allow the admin to be able to disable RMCP+ cipher suite 
3, leaving only 17.  Is there an IPMI command to do that?  And is that 
command implemented in OpenBMC? 
Note that after the meeting, a patch was created to remove suite 3: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-net-ipmid/+/30814

Note the BMC's IPMI function has two very different access vectors:
- via RMCP+ out-of-band or network
- via in-band IPMI via host connections

Enabling these should be separately controllable. 

>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

- Joseph

