Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C45C1D18AC
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 17:05:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MdJp746MzDqH5
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 01:05:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Md9t0ykPzDqZq
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 00:59:28 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DEWEQV121921
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 10:59:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101m9793x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 10:59:24 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04DEXUOb135903
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 10:59:23 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101m97938-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 10:59:23 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04DEu8Ni023437;
 Wed, 13 May 2020 14:59:23 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 3100ub7a4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 14:59:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04DExMn729229410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 14:59:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCA95AE062;
 Wed, 13 May 2020 14:59:22 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52BE3AE066;
 Wed, 13 May 2020 14:59:22 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 13 May 2020 14:59:22 +0000 (GMT)
Subject: Re: SELinux UseCases
To: Manojkiran Eda <manojeda@in.ibm.com>
References: <e229e29c-e6a0-ae91-aa5c-2b13a4416faa@linux.ibm.com>
 <OFBBFB47E3.6EABAE1E-ON0025855A.00486BC9-0025855A.004946E0@LocalDomain>
 <OFC15F6E2A.E823991E-ON00258565.0018CF1F-00258565.00191B17@notes.na.collabserv.com>
 <OF6E82DE95.F0DBD406-ON00258567.00161A33-00258567.001BE5D7@notes.na.collabserv.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <84b06e90-847e-45c2-59b3-9cc4e32a156a@linux.ibm.com>
Date: Wed, 13 May 2020 09:59:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <OF6E82DE95.F0DBD406-ON00258567.00161A33-00258567.001BE5D7@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_06:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 cotscore=-2147483648 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130126
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
Cc: openbmc@lists.ozlabs.org, rnouse@google.com, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/13/20 12:04 AM, Manojkiran Eda wrote:
> Hi Joseph,
> I may not be accurate here, But from what i have learnt - Yes, this 
> can be done using "Type Enforcement feature" in SELinux.
> Type Enforcement essentially allows every file/object/process in 
> SELinux enabled system to be stored with a security context label as 
> an extended attribute.
> And policies can be framed to allow access between various security 
> context labelled objects.
> Any access between security contexts - that does not have an 
> associated selinux policy will be denied by default.
> Say for example, in this case :
> > I would like to see SELinux limit who can write to files under the /etc
> > directory.  For example, bmcweb implements REST APIs add and modify
> > local users, control pam_tally2 account lockout parameters, etc.  More
> > specifically, the phosphor-user-manager daemon modifies files like
> > /etc/shadow and /etc/pam.d/common_auth.  Only this application should be
> > able to write to these file.  Also, this daemon should not be to allowed
> > to write to any other config files.
> 1. A new security label needs to be defined, say *user_manager_t*  for 
> *phosphor-user-manager* service and this context can be attached to 
> the service through the SELinux tag in the dbus-configuration xml 
> file. so that when the user-manager service executes it obtains a 
> security context type of *user_manager_t*.
> 2. As far as i know the files in the /*etc* would acquire a security 
> context label of *etc_t *by default during the auto relabelling 
> process which happens at the first selinux enabled boot of BMC.
> 3. Now we just need to write a selinux policy to allow access between 
> *user_manager_t *type with *etc_t* type.
> 4. Any process,  example *bmcweb* say has *webserver_t* (does not have 
> the security context of *user_manager_t*) would get an access denied 
> if it tries to write into the /*etc* files as there is no associated 
> policy.
> 5. We can even assign a security label for each file inside the */etc* 
> and write an associated policy for it, so that we can get a granular 
> control over who can access which file under */etc*.

Manoj,

Thanks for the details.  Yes, using type enforcement sounds right. You 
know a lot more about SELinux than I do.

If I understand this correctly, a simpler less-granular design (perhaps 
as a proof of concept) that still provides meaningful internal barriers 
would be:
Define a new label etc_writer_t and attach it only to D-Bus daemons that 
need to update config files.

In this way, only those daemons can update confg files, and attackers 
coming in through BMCWeb or the host side would not be able to directly 
update config files.  Doing so may make the attacker's task 
significantly more difficult.

- Joseph

> Hope this answers your question.
> Thanks,
> Manoj
>
>     ----- Original message -----
>     From: Joseph Reynolds <jrey@linux.ibm.com>
>     Sent by: "openbmc"
>     <openbmc-bounces+manojeda=in.ibm.com@lists.ozlabs.org>
>     To: Manojkiran Eda <manojeda@in.ibm.com>,
>     openbmc@lists.ozlabs.org, rnouse@google.com
>     Cc: ratagupt@linux.vnet.ibm.com
>     Subject: [EXTERNAL] Re: SELinux UseCases
>     Date: Tue, May 12, 2020 11:48 PM
>     On 5/10/20 11:34 PM, Manojkiran Eda wrote:
>     > Hi All,
>     > This is a just a ping - to generate a discussion on the below
>     > mentioned use-cases.
>     > Appreciate any inputs/comments.
>
>     Thanks for putting this together.
>
>     I would like to see SELinux limit who can write to files under the
>     /etc
>     directory.  For example, bmcweb implements REST APIs add and modify
>     local users, control pam_tally2 account lockout parameters, etc.  More
>     specifically, the phosphor-user-manager daemon modifies files like
>     /etc/shadow and /etc/pam.d/common_auth.  Only this application
>     should be
>     able to write to these file.  Also, this daemon should not be to
>     allowed
>     to write to any other config files.
>
>     - Joseph
>
>     > Thanks,
>     > Manoj
>     >
>     >     ----- Original message -----
>     >     From: Manojkiran Eda/India/IBM
>     >     To: openbmc@lists.ozlabs.org, rnouse@google.com
>     >     Cc: ratagupt@linux.vnet.ibm.com
>     >     Subject: SELinux UseCases
>     >     Date: Thu, Apr 30, 2020 6:50 PM
>     >     Hi All,
>     >     (My apologies for the lengthy email.)
>     >     Below are few use-cases in BMC, which i feel inclusion of
>     SELinux
>     >     would be a value add (there could be may more missing). Please
>     >     feel free to drop-in your comments/feedback.
>     >
>     ...snip...
>
>

