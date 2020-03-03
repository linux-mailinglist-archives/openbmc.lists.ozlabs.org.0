Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D319C177E2D
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 18:57:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X4VR3jf7zDqRB
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 04:57:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X4TB3LZhzDqQj
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 04:56:45 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023HsliR099335
 for <openbmc@lists.ozlabs.org>; Tue, 3 Mar 2020 12:56:42 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yh0dvenef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2020 12:56:41 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 023Ht3tS008111
 for <openbmc@lists.ozlabs.org>; Tue, 3 Mar 2020 17:56:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 2yffk6v3f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2020 17:56:41 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 023HueSD48431476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 17:56:40 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DA0E124054;
 Tue,  3 Mar 2020 17:56:40 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 783F4124052;
 Tue,  3 Mar 2020 17:56:40 +0000 (GMT)
Received: from [9.10.252.41] (unknown [9.10.252.41])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  3 Mar 2020 17:56:40 +0000 (GMT)
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <078b10c5-fab0-a9cf-add7-f010366e26a9@linux.vnet.ibm.com>
Date: Tue, 3 Mar 2020 11:56:41 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_06:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxlogscore=842 lowpriorityscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003030121
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


On 2/19/2020 5:05 PM, Joseph Reynolds wrote:
> On 2/17/20 4:29 PM, Joseph Reynolds wrote:
>
>
>> 2. (Joseph, follow up to agenda item 3 from 2020-02-05): Redfish 
>> Privilege updates: 
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881 and 
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28878 Update 
>> Feb 11: See 
>> https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration 
>> clarified the intention to NOT enumerate all accounts (unless you are 
>> the admin) 
>
> Consensus was to leave OpenBMC as-is (only admin can enumerate users) 
> until Redfish releases a new spec.
>
This is implemented as Redfish intended, a user without ConfigureUsers 
privilege will only see their own account here: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881

  We don't need to wait for the next Redfish release since Redfish is 
only further clarifying this in the documentation and implemented in 
28881 is how Redfish intended this to work. This fixes 2 validator 
errors if the validator is run as a ReadOnly or Operator role user.

Thx,
Gunnar

