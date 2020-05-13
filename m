Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 263001D226B
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 00:55:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MqlP2N82zDqbp
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 08:55:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mqkf6W2BzDqYd
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 08:55:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DMUwj7043527
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 18:55:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kp420x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 18:55:02 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04DMV16i043803
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 18:55:01 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kp420s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 18:55:01 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04DMqre7011946;
 Wed, 13 May 2020 22:55:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3100ubmrcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 22:55:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04DMt0Wf40632694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 22:55:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E14DAE05F;
 Wed, 13 May 2020 22:55:00 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C1E1AE05C;
 Wed, 13 May 2020 22:54:59 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 13 May 2020 22:54:59 +0000 (GMT)
Subject: Re: Requirements for security audit logs?
To: Andrew Geissler <geissonator@gmail.com>
References: <87f78066-22d5-6f15-56a2-134388844a66@linux.ibm.com>
 <4DD0C271-0081-4E9D-9733-F9DA101D7CF8@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <391768ba-0c55-d862-d2fd-af5546b382df@linux.ibm.com>
Date: Wed, 13 May 2020 17:54:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4DD0C271-0081-4E9D-9733-F9DA101D7CF8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_09:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 cotscore=-2147483648 mlxlogscore=999 adultscore=0 clxscore=1015
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130188
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/13/20 3:38 PM, Andrew Geissler wrote:
>
>> On May 13, 2020, at 11:56 AM, Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>
>> What are our requirements for Security Audit Logs?  The main idea is to add a new BMC logging service to hold security-relevant events.
>>
> Def hoping we can work this into our audit design:
> https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
>
> I’m not sure how much progress has been made with implementation but
> we spent a good chunk of time reviewing/discussing it and it seems to
> hit a lot of the items below.

Thank you, I had forgotten about that design. :-)

I think the phosphor-audit design can perform security auditing. The 
"low-level design" in my email below is not needed and is replaced with 
phosphor-audit.  Here are some ideas and questions how the  
phosphor-audit Configuration can work:

1. We can have a "security" configuration that identifies 
security-relevant events (as listed below).

2. Can an event be handled in two different ways?  We need all security 
events to be logged n omatter what else happens because of that event.  
For example, if a server powers off, we should log that as a 
security-relevant event, and also send a SMS to the operations staff.

Then if you don't fully trust your admin:

3. Security logging should NOT be configurable by the admin and should 
be always on.  If the BMC admin can prevent security logs from being 
generated, it is too easy for a bad admin to hide their tracks.

4. The admin should NOT have a function to delete security log entries.  
The security log should instead automatically delete older entries after 
the prescribed (configured?) retention period.

If we need a way to configure security audit log settings, for example, 
to satisfy more strict auditing schemes, we can create a new security 
administrator role.  For example, a new distro feature 
SEPARATE_SECURITY_ADMIN adds a Role called SecurityAdmin, with 
Privileges that do NOT include admin privileges but can configure the 
security settings.  If this feature is not defined, the SecurityAdmin 
Privileges would go to the Administrator role.

Those are my initial ideas ... probably need to be kicked around a bit.  
Staging: I would be happy if we got 1&2 working and we allow the admin 
to configure security settings.  Items 3&4 can be developed later.

- Joseph

>> Considerations:
>> - The log holds *only* security-relevant entries (and no irrelevant entries).
>> - Consumed by a security auditor (currently the Administrator Role).  The log is likely to contain sensitive and possibly personal information (such as IP addresses), so it must be protected from reading.  Perhaps only the admin can read this.
>> - Entries must be available, so the admin should not be able to delete the log or any entries.
>> - Log can be held on BMC persistent storage (like flash) or streamed off the BMC, just like any other log.
>> - Low-level design: any BMC service can write a security log entry when it encounters a security-relevant event.  (In addition to its regular logging.)
>> + Note that security holes exist.  I would like to keep these outside the scope of this initial discussion except to note that examples shown below ought to generate a security log entry. Examples:
>> +A: root SSH access can do whatever it wants to the security log
>> +B: factory reset clears the logs
>>
>> Examples of security-relevant events:
>> Network:
>> - New connections via HTTPS (se BMCWeb below), SSH, use of the serial line to access the BMC's shell, etc.
>> BMCWeb:
>> - All authentication attempts (login, basic auth, etc.)
>> - When accounts are locked out or reset
>> - Attempts to use REST APIs that require Administrator access. NOTE: This covers a large number of functions and may overlap with services provided by D-Bus daemons.  Example: LDAP config, local user config.  Example: when an admin uses their authority to change a user account password.
>> Services:
>> - Password changes (in phosphor-user-manager)
>> - BMC rebooting or power on
>> - Host state transitions
>> - Firmware update (BMC or host)
>> - BMC Factory reset
>>
>> We can consider a more formal set of requirements given by NIST SP 800-92:
>> https://en.wikipedia.org/wiki/NIST_Special_Publication_800-92
>> with additional controls as specified by NIST SP 800-53.
>>
>> - Joseph
>>
>> This topic was previously discussed as agenda item 3 in the 2020-04-29 Security Working Group results
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>>> 3. Requirements for security audit logs.  Access, deleting, APIs.
>> There was general support for the ideas that the BMC should have dedicated security audit log that could not be deleted or cleared. This log would have only security-relevant events.
>>

