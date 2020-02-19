Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D33161652E3
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 00:05:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NCxq5rbTzDqQS
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 10:05:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NCx764mKzDqPT
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 10:05:15 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01JMnqnj069109
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 18:05:11 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y93kf9427-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 18:05:10 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01JMniq2011609
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:05:10 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2y6896yn9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:05:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01JN59T948955766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:05:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C33A1124058
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:05:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C746124053
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:05:09 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:05:09 +0000 (GMT)
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
Message-ID: <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
Date: Wed, 19 Feb 2020 17:05:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_07:2020-02-19,
 2020-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002190169
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

On 2/17/20 4:29 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday February 19 at 10:00am PDT.

This meeting was held.  Only the first 7 items were discussed.  The 
remaining items stay on the list for next time (Wednesday March 4).

>
> We'll discuss current development items, and anything else that comes up.
>
> Ratan intends to participate and has requested that we cover the 
> following two items first:
> (A) service discovery direction, (B) using pam_abl
>
> The current topics:
>
> 1. (Joseph): Is OpenBMC affected by the Chrome browser’s SameSite 
> cookie changes 
> (https://blog.chromium.org/2020/02/samesite-cookie-changes-in-february.html)? 
> Do we want to enhance BMCWeb 
> (https://github.com/openbmc/bmcweb/blob/master/include/token_authorization_middleware.hpp#L430) 
> to create cookies with SameSite=None; Secure when 
> BMCWEB_INSECURE_DISABLE_XSS_PREVENTION is also used, to allow the BMC 
> to be used by the Chrome browser.  Perhaps by default BMCWeb should 
> generate cookies with SameSite=Strict?   
>
Joseph will create bmcweb issue for this.


> 2. (Joseph, follow up to agenda item 3 from 2020-02-05): Redfish 
> Privilege updates: 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881 and 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28878 Update Feb 
> 11: See 
> https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration 
> clarified the intention to NOT enumerate all accounts (unless you are 
> the admin) 

Consensus was to leave OpenBMC as-is (only admin can enumerate users) 
until Redfish releases a new spec.
>
> 3. (email) FYA.  BMC aggregator - includes a security topic. 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020433.html  


Nancy plans to follow up.

>
> 4. (email) FYA - BMC Secure Boot / U-Boot - use dm-verity or 
> alternate? 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020452.html  

Need BMC threat model to understand what threats dm-verity protects 
against.  Note that integrity protection is a defense in depth against 
an attacker who can run code on the BMC which writes to the BMC’s file 
system.

Is the BMC filesystem writeable?  ANS: It uses read-write overlay 
filesystem on /etc.  Idea: Could discontinue using overlays and use soft 
links to fs on read-write partition

>
> 5. Redfish forum question: Direction for channel based restrictions - 
> https://redfishforum.com/thread/279/channel-privilege-support-direction-redfish  

Redfish direction is to NOT change Role based on channel, and suggests 
implementations can offer a different set of accounts based on ingress 
channel (for example, based on which ethernet device (eth0, eth1, etc) 
the accessed the BMC).

OpenBMC community may have multiple use cases for a feature like this. 
Either the mgmt network or host may be more secure, and the other is 
less secure.

Idea: expose the list of channels within OpenBMC, and allow 
Account-Channel associations.  For example, an interface to allow 
“admin2” to access the BMC only from “eth0” or “eth1” but not “eth2”.


>
> 6. (Bruce via email):  BMCWeb Cert valid for 10 years - 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020488.html  

Change BMCweb’s default self-signed cert to a maximum of 825 days.  
Recommend 30 days.

When this is done, if BMCWeb generates a self-signed cert, and it is not 
replaced, and the BMC’s time is sane, then browsers that connect to 
BMCWeb will start to complain after 30 days.

The recovery is: The BMC admin should install a valid BMCWeb site 
identity cert, then clients can re-connect to the BMC. (This will serve 
the updated cert and make the browser happy.)

The “BMC Admin guide” should talk about installing your own cert.

See docs here: https://github.com/openbmc/bmcweb/#configuration

Ass code here: 
https://github.com/openbmc/bmcweb/blob/91243c3b28b1df66e682f5a3ee96341fdc516b5a/include/ssl_key_handler.hpp#L205

Will there be a warning for the BMC admin (that the BMCWeb site cert 
will expire soon)?  (And don’t rely on a warning from the browser itself.)


>
> 7. (Joseph / James / Richard email): Rate limiting, use pam_abl - 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020430.html  

There was concern about any account lockout mechanism locking out 
legitimate users; throttling is safer.

Next step is to design how this would be used.


>
> 8. (Joseph via email): New Redfish roles ServiceRep & OemRep - 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020540.html  
>
> 9. (Joseph email): Implement the Redfish PasswordChangeRequired 
> property 
>  https://lists.ozlabs.org/pipermail/openbmc/2020-February/020554.html  
>
> 10. (Joseph email): delete BMCWeb sessions after some kinds of account 
> changes  
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020555.html   
>

These item (8-10) were not address due to lack of time.  They remain for 
next time.

>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>
>

